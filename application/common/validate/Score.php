<?php
namespace app\common\validate;

class Score extends BaseValidate {

	protected $rule = [
		'match_id' => 'require|integer',
		'team_id' => 'require|integer',
		'team' => 'require|in:0,1',
		'section' => 'require|in:0,1',
		'time' => 'require',
		'player_id' => 'require|integer',
	];
}