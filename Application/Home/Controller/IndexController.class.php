<?php

namespace Home\Controller;

use Common\Common\Sms;
use Think\Controller;

/**
 * Description: 网站首页
 * Author: Lance
 * Date: 2018/11/27
 * Time: 16:48
 */
class IndexController extends Controller
{
    public function index()
    {
        $this->display();
    }

    /**
     * 发送短信验证码
     */
    public function sms_send()
    {
        $phone = I('post.phone');
        $type  = I('post.type');

        if(!$phone) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '手机号不能为空'
            );
            $this->ajaxReturn($res);
        }

        $code = 200;
        $msg  = '验证码发送成功';

        $send_res = Sms::send($phone, $type);
        if ($send_res == false) {
            $code = 400;
            $msg  = '验证码发送失败';
        }

        $res = array(
            'result_code' => $code,
            'result_msg'  => $msg
        );
        $this->ajaxReturn($res);
    }

    /**
     * 新用户注册
     */
    public function register()
    {
        $params = I('post.');

        // 校验短信验证码
        $check_res = Sms::check_captcha($params['phone'], $params['captcha'], C('captcha_type.register'));
        if ($check_res['state'] == false) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => $check_res['msg']
            );
            $this->ajaxReturn($res);
        }
        // 校验手机号是否已注册
        $user = M('User')->where(array('phone' => $params['phone']))->find();
        if ($user) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '该手机号已注册~'
            );
            $this->ajaxReturn($res);
        }
        // 构建用户数据并保存
        $register_data['qh_code']   = createUserCode();
        $register_data['phone']     = $params['phone'];
        $register_data['password']  = md5($params['password']);
        $register_data['c_name']    = $params['c_name'];
        $register_data['del_state'] = 0;
        $register_data['add_time']  = time();

        $register_res = M('User')->add($register_data);
        if ($register_res == false) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '注册失败~'
            );
        } else {
            $res = array(
                'result_code' => 200,
                'result_msg'  => '注册成功~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 用户登录
     */
    public function login()
    {
        $condition['phone']     = I('post.phone');
        $condition['password']  = md5(I('post.password'));
        $condition['del_state'] = 0;

        $user = M('User')->where($condition)->find();
        if ($user) {
            session('current_user_id', $user['id']);
            session('current_user_cname', $user['c_name']);
            $res = array(
                'result_code' => 200,
                'result_msg'  => '登录成功~'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '账号或密码错误~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 用户修改密码
     */
    public function change_pwd()
    {
        // 校验短信验证码
        $check_res = Sms::check_captcha(I('post.phone'), I('post.captcha'), C('captcha_type.update_pwd'));
        if ($check_res['state'] == false) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => $check_res['msg']
            );
            $this->ajaxReturn($res);
        }

        $condition['phone'] = I('post.phone');
        $user = M('User')->where($condition)->find();
        if (!$user || $user['del_state'] == 1) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '该账号不存在~'
            );
        } else {
            $change_pwd_res = M('User')->where(array('id' => $user['id']))
                ->save(array('password' => md5(I('post.newPwd')), 'update_time' => time()));
            if ($change_pwd_res == false) {
                $res = array(
                    'result_code' => 400,
                    'result_msg'  => '密码修改失败~'
                );
            } else {
                $res = array(
                    'result_code' => 200,
                    'result_msg'  => '密码修改成功~'
                );
            }
        }
        $this->ajaxReturn($res);
    }
}