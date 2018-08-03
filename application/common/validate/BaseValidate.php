<?php
namespace app\common\validate;
use think\validate;

class BaseValidate extends validate{

	public function goCheck(){
		$params = request()->param();
		if(!$this->check($params)){
			throw new \app\common\exception\BaseException([
				'msg' => is_array($this->error) ? implode(';', $this->error) : $this->error
			]);
		}
		return true
	}

}