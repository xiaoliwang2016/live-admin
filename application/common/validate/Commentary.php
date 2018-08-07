<?php
namespace app\common\validate;

class Commentary extends BaseValidate {

	protected $rule = [
		'team_id' => 'require|integer',
		'content' => 'length:1,250',
		'time' => 'require',
		'section' => 'integer|in:1,0',
	];

}