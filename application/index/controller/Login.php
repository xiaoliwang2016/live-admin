<?php
namespace app\index\controller;

use think\Db;

class Login extends Base {
	/**
	 * 登录
	 */
	public function login() {
		$user = $this->request->post('user');
		$passwd = $this->request->post('passwd');
		$data['token'] = md5(time());
		$data['expire'] = time() + 3600 * 24 * 3;
		if ($user == 'admin' && $passwd == 'admin') {
			Db::name('token')->insert($data);
			return ReturnMsg('1001', $data['token'], '登录成功');
		}
		return ReturnMsg('1004', null, '登录失败');
	}
}
