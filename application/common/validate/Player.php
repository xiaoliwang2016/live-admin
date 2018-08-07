<?php
namespace app\common\validate;

class Player extends BaseValidate {

	protected $rule = [
		'name' => 'require|length:1,12',
		'icon' => 'require',
		'team_id' => 'require|integer',
	];
}