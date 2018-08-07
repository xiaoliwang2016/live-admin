<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class Base extends Controller {
	/**
	 * 上传图片
	 * @return 返回保存路径
	 */
	public function upload() {
		$file = $this->request->file('image');
		$info = $file->move('./static/upload');
		if ($info) {
			$path = 'http://' . $_SERVER['HTTP_HOST'] . '/static/upload/' . $info->getSaveName();
			return $path;
		} else {
			// 上传失败获取错误信息
			echo $file->getError();
		}
	}
	/**
	 * 身份验证
	 */
	protected function identity() {

		$token = $this->request->header('token');

		if (!$token) {
			throw new \app\common\exception\BaseException(['msg' => '请先登录']);
		}

		try {
			Db::table('token')->where('token', $token)->where('expire', '>', time())->findOrFail();
		} catch (Exception $e) {
			throw new \app\common\exception\BaseException(['msg' => '登录已过期']);
		}

	}

}
