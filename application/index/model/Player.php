<?php
namespace app\index\model;

class Player extends Base {
	//隐藏字段
	protected $hidden = ['update_time', 'create_time', 'delete_time', 'team_id'];
	//定义关联模型
	public function team() {
		return $this->belongsTo('Team', 'team_id', 'id');
	}
}