<?php
namespace app\index\model;

class Goal extends Base {
	//显示字段
	protected $visible = ['player', 'time', 'team'];

	public function player() {
		return $this->belongsTo('Player', 'player_id', 'id');
	}

	public function team() {
		return $this->belongsTo('Team', 'team_id', 'id');
	}

}