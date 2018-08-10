<?php

require 'lib/db/mysql.php';

class Live {

	public function push($request, $ws) {
		$param = require 'lib/config/db.php';

		$db = new mysql($param);
		$data = $request->post;
		$team = $db->where(['id' => $data['team_id']])->field('icon,name')->select('team');
		$data['team'] = $team[0];

		unset($data['team_id']);

		$taskData = [
			'method' => 'pushLive',
			'data' => json_encode($data),
		];

		$ws->task($taskData);

		echo 'ok';
	}
}
