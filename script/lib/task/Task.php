<?php
require_once 'lib/redis/Predis.php';

class Task {

	/**
	 * 推送直播消息
	 */
	public function pushLive($data, $serv) {
		$clients = Predis::instance(['host' => '127.0.0.1'])->sMembers('live_client_id');

		foreach ($clients as $fd) {
			$serv->push($fd, $data);
		}
	}
	/**
	 * 推送聊天消息
	 */
	public function pushChat($data, $serv) {
		$clients = Predis::instance(['host' => '127.0.0.1'])->sMembers('live_client_id');

		foreach ($clients as $fd) {
			$serv->push($fd, $data);
		}
	}

}