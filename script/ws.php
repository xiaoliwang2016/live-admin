<?php

require_once 'lib/redis/Predis.php';
require_once 'lib/task/Task.php';
require_once 'lib/live/Live.php';

class Ws {

	CONST HOST = "0.0.0.0";
	CONST PORT = 8811;
	CONST PORT_1 = 8812;

	public $ws = null;

	public function __construct() {

		$this->ws = new swoole_websocket_server(self::HOST, self::PORT);
		$this->ws->listen(self::HOST, self::PORT_1, SWOOLE_SOCK_TCP);

		$this->ws->set([
			'enable_static_handler' => true,
			'worker_num' => 4,
			'task_worker_num' => 4,
		]);

		$this->ws->on('start', [$this, 'onStart']);
		$this->ws->on('open', [$this, 'onOpen']);
		$this->ws->on('request', [$this, 'onRequest']);
		$this->ws->on('message', [$this, 'onMessage']);
		$this->ws->on("task", [$this, 'onTask']);
		$this->ws->on('workerstart', [$this, 'onWorkerstart']);
		$this->ws->on('finish', [$this, 'onFinish']);
		$this->ws->on("close", [$this, 'onClose']);

		$this->ws->start();

	}

	// Server启动在主进程的主线程回调此函数
	public function onStart($server) {
		swoole_set_process_name("live_master");
	}

	// 此事件在worker进程/task进程启动时发生。这里创建的对象可以在进程生命周期内使用
	public function onWorkerstart($server, $worker_id) {

	}

	// 监听websocket连接
	public function onOpen($server, $request) {
		//将客户端连接标识存入redis
		Predis::instance()->sadd('live_client_id', $request->fd);
		echo "WebSocket客户端与服务器建立连接并完成握手 id : {$request->fd}\n";
	}

	//处理http请求
	public function onRequest($request, $response) {

		if ($request->server['request_uri'] == '/favicon.ico') {
			$response->status(404);
			$response->end();
			return;
		}

		$live = new Live();
		$live->push($request, $this->ws);
	}

	/**
	 * 监听ws消息事件
	 * @param $ws
	 * @param $frame
	 */
	public function onMessage($ws, $frame) {
		echo "收到来自客户端消息 : {$frame->data}\n";
		$client_data = json_decode($frame->data, true);
		$data = [
			'message' => $client_data['msg'],
			'match_id' => $client_data['match_id'],
			'time' => date("Y-m-d H:i:s"),
		];
		$taskData = [
			'data' => json_encode($data),
			'method' => 'pushChat',
		];
		$ws->task($taskData);

		echo 'ok';
	}
	/**
	 * 任务回调
	 * @param  [type] $serv    [swoole资源对象]
	 * @param  [type] $task_id [任务id，用于区分不同任务]
	 * @param  [type] $from_id [来自哪个worker]
	 * @param  [type] $data    [回调参数]
	 */
	public function onTask($serv, $task_id, $from_id, $data) {
		$obj = new Task();
		//根据传递参数，执行不同任务
		$method = $data['method'];
		$obj->$method($data['data'], $serv);
	}
	/**
	 * 关闭TCP连接
	 */
	public function onClose($ws, $fd) {
		Predis::instance()->delete('live_client_id', 'set', $fd);
		echo "TCP客户端连接关闭  客户端id :{$fd}\n";
	}
	/**
	 * 进程结束回调
	 */
	public function onFinish($serv, $taskId, $data) {
		echo "进程结束 :{$taskId}\n";
	}

}

new Ws();