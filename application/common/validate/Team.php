<?php
namespace app\common\validate;

class Team extends BaseValidate {

	protected $rule = [
		'name' => 'require|length:1,12',
		'icon' => 'require'
	];
}