<?php
namespace app\admin\controller;

class Team extends Base
{
    public function add(){
        (new app/common/validate/Team())->goCheck();

    }   

}
