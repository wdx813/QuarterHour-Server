<?php
/**
 * Description: 网站基础控制器
 * User: Lance
 * Date: 2018/12/3 0003
 * Time: 21:32
 */

namespace Home\Controller;


use Think\Controller;

class BaseUserController extends Controller
{
    protected $user_info;

    public function __construct()
    {
        parent::__construct();
        if(!session('current_user_id')) {
            $this->redirect('/home/index');
        } else {
            if(!$this->user_info) {
                $this->user_info = M('User')->where(array('id' => session('current_user_id')))->find();
            }
        }
    }

}