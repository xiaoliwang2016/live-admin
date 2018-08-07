<?php
namespace app\index\model;

use think\Model;
use think\model\concern\SoftDelete;

class Base extends Model {

	use SoftDelete;
	protected $pk = 'id';
	//自动时间戳
	protected $autoWriteTimestamp = true;
	//软删除
	protected $deleteTime = 'delete_time';
	//添加时允许字段
	protected $addAllowField = [];
	//允许修改字段
	protected $editAllowField = [];
	//隐藏字段
	protected $hidden = ['update_time', 'create_time', 'delete_time'];

}