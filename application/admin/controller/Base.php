<?php

namespace app\admin\controller;

use think\Controller;

class Base extends Controller
{
    public function upload(){
		// 获取表单上传文件 例如上传了001.jpg
		$file = request()->file('image');
		// 移动到框架应用根目录/uploads/ 目录下
		$info = $file->move( './static/upload');
		if($info){
			echo $info->getSaveName();
		}else{
		// 上传失败获取错误信息
		echo $file->getError();
		}
    }

}
