<?php
/**
 * 管理后台登录
 *
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/16
 * Time: 11:07
 */

namespace Admin\Controller;


use Think\Controller;
use Think\Verify;

class LoginController extends Controller
{
    /**
     * 登录验证
     */
    public function login_check()
    {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $code     = $_POST['code'];
        if (!$this->verify_check($code)) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '验证码错误，请重新输入~'
            );
            $this->ajaxReturn($res, 'JSON');
        }

        $model_admin = M('admin');
        $admin       = $model_admin->where(array('username' => $username, 'state' => 0))->find();
        if (!$admin) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '该用户不存在~'
            );
            $this->ajaxReturn($res, 'JSON');
        }
        if ($admin['password'] != md5($password)) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '密码错误~'
            );
            $this->ajaxReturn($res, 'JSON');
        }

        session('current_admin_id', $admin['id']);
        session('current_admin_name', $admin['username']);
        $res = array(
            'result_code' => 200,
            'result_msg'  => '登录成功~'
        );
        $this->ajaxReturn($res, 'JSON');

    }

    /**
     * 生成验证码
     */
    public function verify_create()
    {
        ob_clean();
        $config = array(
            'fontSize' => 16,
            'length'   => 4,
            'useNoise' => false,
            'imageH'   => 36,
            'imageW'   => 116,
            'bg'       => array(120, 200, 180)
        );

        $verify = new Verify($config);
        $verify->entry();
    }

    /**
     * 校验验证码
     */
    private function verify_check($code)
    {
        $verify = new Verify();
        return $verify->check($code);
    }
}