<?php
namespace app\index\model;

class Commentary extends Base {

	public function team() {
		return $this->belongsTo('Team', 'team_id', 'id');
	}

}