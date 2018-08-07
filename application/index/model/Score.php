<?php
namespace app\index\model;

class Score extends Base {
	protected $hidden = ['update_time', 'create_time', 'delete_time', 'match_id'];
}