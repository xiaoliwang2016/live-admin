<?php
namespace app\common\validate;

class Match extends BaseValidate {

	protected $rule = [
		'team1_id' => 'require|integer',
		'team2_id' => 'require|integer',
		'banner' => 'require|length:10,250',
		'time' => 'require',
		'type' => 'integer|in:1,2',
	];

}