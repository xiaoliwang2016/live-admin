<?php
namespace app\index\model;

class Match extends Base {
	//隐藏字段
	protected $hidden = ['update_time', 'create_time', 'delete_time', "team1_id", "team2_id"];

	public function team1() {
		return $this->belongsTo('Team', 'team1_id', 'id');
	}

	public function team2() {
		return $this->belongsTo('Team', 'team2_id', 'id');
	}

	public function score() {
		return $this->hasOne('Score', 'match_id', 'id');
	}

	public function goal() {
		return $this->hasMany('Goal', 'match_id', 'id');
	}

	public function getTypeAttr($value) {
		$type = [
			'type_1' => '国际联赛',
			'type_2' => '欧洲联赛',
		];
		return $type['type_' . $value];
	}
}
