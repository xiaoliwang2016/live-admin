<?php
namespace app\index\controller;

use app\index\model\Player as PlayerModel;

class Player extends Base {

	protected $beforeActionList = [
		'identity' => ['only' => 'add'],
	];

	/**
	 * 添加球员
	 */
	public function add() {
		(new \app\common\validate\Player())->goCheck();
		if (!PlayerModel::create($this->request->param(), ['name', 'icon', 'team_id'])) {
			throw new \app\common\exception\BaseException(['msg' => '添加球员失败']);
		}
		return ReturnMsg('1001', null, '添加队员成功');
	}
	/**
	 * 查询所有球员
	 * @return list
	 */
	public function list() {
		$list = PlayerModel::with('team')->select()->toArray();
		return ReturnMsg('1001', $list, '查询成功');
	}
	/**
	 * 根据ID查找球员
	 */
	public function getPlayerById($id) {
		$player = PlayerModel::get($id, 'team');
		return ReturnMsg('1001', $player, '查询成功');
	}
	/**
	 * 根据id获得 该队伍下所有球员信息
	 */
	public function getPlayersByTeamId($id) {
		$players = PlayerModel::where('team_id', $id)->select();
		return ReturnMsg('1001', $players, '查询成功');
	}
}
