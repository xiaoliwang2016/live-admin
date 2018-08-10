<?php
namespace app\index\controller;

use app\index\model\Commentary as CommentaryModel;

class Commentary extends Base {

	protected $beforeActionList = [
		'identity' => ['only' => 'live'],
	];
	/**
	 * 添加评论
	 */
	public function add() {
		(new \app\common\validate\Commentary())->goCheck();
		if (!CommentaryModel::create($this->request->param(), ['time', 'team_id', 'match_id', 'content', 'img', 'section'])) {
			throw new \app\common\exception\BaseException(['msg' => '添加记录失败']);
		}
		return ReturnMsg('1001', null, '发送成功');
	}

	/**
	 * 获取当场比赛 最近50条记录
	 */
	public function getRecode($match_id) {
		$list = CommentaryModel::with('team')->where('match_id', $match_id)->order('id')->limit(50)->select()->toArray();
		return ReturnMsg('1001', $list, '查询成功');
	}
	/**
	 * 转发直播请求
	 */
	public function live() {
		include $_SERVER['DOCUMENT_ROOT'] . '/../vendor/rmccue/requests/library/Requests.php';
		$url = 'http://127.0.0.1:8811';
		$request = \Requests::post($url, array(), $this->request->post());
		return $this->add();
	}
}
