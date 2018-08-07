<?php

require 'lib/db/mysql.php';

class Live {

	public function push($request, $ws) {

		$param = require 'lib/config/db.php';

		$db = new Mysql($param);

		$data = $request->post;
		$data['create_time'] = time();
		$data['update_time'] = time();

		$res = $db->insert('commentary', $data);

		if ($res) {
			$team = $db->where(['id' => $data['team_id']])->field('icon,name')->select('team');
		}

		$data = $request->post;
		$data['team'] = $team[0];

		unset($data['team_id']);

		$taskData = [
			'method' => 'pushLive',
			'data' => json_encode($data),
		];

		$ws->task($taskData);

		echo json_encode([
			'code' => '1001',
			'msg' => '发送成功',
			'data' => $data,
		], JSON_UNESCAPED_UNICODE);

	}

}
