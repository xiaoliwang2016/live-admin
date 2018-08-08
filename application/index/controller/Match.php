<?php
namespace app\index\controller;

use app\index\model\Goal as GoalModel;
use app\index\model\Match as MatchModel;
use app\index\model\Score as ScoreModel;
use think\Db;

class Match extends Base {

	protected $beforeActionList = [
		'identity' => ['only' => 'add,changeScore,getAll,getCurrentlyMatch'],
	];

	/**
	 * 添加比赛
	 */
	public function add() {
		(new \app\common\validate\Match())->goCheck();
		if ($this->request->param('team1_id') == $this->request->param('team2_id')) {
			throw new \app\common\exception\BaseException(['msg' => '队伍id不能箱相同']);
		}
		Db::startTrans();
		try {
			$match = MatchModel::create($this->request->param(), ['team1_id', 'team2_id', 'time', 'banner', 'type']);
			ScoreModel::create(['match_id' => $match->id]);
			Db::commit();
		} catch (Exception $e) {
			Db::rollback();
			throw new \app\common\exception\BaseException(['msg' => '添加比赛失败']);
		}
		return ReturnMsg('1001', null, '添加比赛成功');
	}
	/**
	 * 获得最近三天比赛
	 * @return list
	 */
	public function get3DayMatch() {
		$today = strtotime(date('Ymd'));
		$after3day = strtotime(date('Ymd')) + 3600 * 24 * 3;
		$matchs = MatchModel::with('team1')->with('team2')->with('score')->where('time', '<', $after3day)->where('time', '>', $today)->select()->toArray();
		return ReturnMsg('1001', $matchs, '查询成功');

	}
	/**
	 * 获得全部比赛
	 */
	public function getAll() {
		$today = strtotime(date('Ymd'));
		$matchs = MatchModel::with('team1')->with('team2')->with('score')->where('time', '>', $today)->select()->toArray();
		return ReturnMsg('1001', $matchs, '查询成功');
	}
	/**
	 * 获取当前正在进行的比赛
	 */
	public function getCurrentlyMatch() {
		$now = time();
		$matchs = MatchModel::with('team1')->with('team2')->with('score')->where('time', '<', $now + 3 * 3600)->where('time', '>', $now - 2 * 3600)->select()->toArray();
		return ReturnMsg('1001', $matchs, '查询成功');
	}
	/**
	 * 进球修改比分
	 * $team : 主队 1 客队 0
	 * $section : 上半场 0 下半场 1
	 */
	public function changeScore() {
		(new \app\common\validate\Score())->goCheck();
		$param = $this->request->param();
		Db::startTrans();
		try {
			if ($param['team'] == '1') {
				if ($param['section'] == '0') {
					db('score')->where('match_id', $param['match_id'])->inc('team1_score')->inc('team1_first')->update();
				} else {
					db('score')->where('match_id', $param['match_id'])->inc('team1_score')->inc('team1_second')->update();
				}
			} else {
				if ($param['section'] == '0') {
					db('score')->where('match_id', $param['match_id'])->inc('team2_score')->inc('team2_first')->update();
				} else {
					db('score')->where('match_id', $param['match_id'])->inc('team2_score')->inc('team2_second')->update();
				}
			}
			GoalModel::create($this->request->param(), ['time', 'player_id', 'match_id']);
			Db::commit();
		} catch (Exception $e) {
			Db::rollback();
			throw new \app\common\exception\BaseException(['msg' => '添加进球记录失败']);
		}
		return ReturnMsg('1001', null, '修改进球记录');
	}
	/**
	 * 根据ID获得比赛赛况
	 */
	public function getMatchById($id) {
		$match = MatchModel::with([
			'goal' => function ($query) {
				$query->with('team')->with('player');
			},
		])->with(['team1', 'team2', 'score'])->where('id', $id)->find();
		return ReturnMsg('1001', $match, '查询成功');
	}

}
