<?php
namespace app\index\controller;

use app\index\model\Team as TeamModel;

class Team extends Base {

	protected $beforeActionList = [
		'identity' => ['only' => 'add'],
	];

	/**
	 * 查询所有队伍
	 * @return list
	 */
	public function list() {
		$teams = TeamModel::where(true)->select();
		return ReturnMsg('1001', $teams, '查询成功');
	}
	/**
	 * 添加队伍
	 */
	public function add() {
		(new \app\common\validate\Team())->goCheck();
		if (!TeamModel::create($this->request->param(), ['name', 'icon'])) {
			throw new \app\common\exception\BaseException(['msg' => '添加队伍失败']);
		}
		return ReturnMsg('1001', null, '添加队伍成功');
	}

}
