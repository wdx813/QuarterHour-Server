<?php

namespace Admin\Controller;

class AdminController extends BaseController
{
    /**
     * 编辑管理员信息
     */
    public function edit()
    {
        $this->display('userInfo');
    }


    /**
     * 更新管理员密码
     */
    public function change_pwd()
    {
        $oldPwd = I('post.oldPwd');
        $newPwd = I('post.newPwd');
        if ($oldPwd && $newPwd) {
            $admin = $this->admin_info;
            if ($admin['password'] != md5($oldPwd)) {
                $res = array(
                    'result_code' => 400,
                    'result_msg'  => '原密码错误'
                );
            } else {
                $change_pwd_res = M('admin')->where(array('id' => $admin['id']))
                    ->save(array('password' => md5($newPwd), 'update_time' => time()));
                if ($change_pwd_res == false) {
                    $res = array(
                        'result_code' => 400,
                        'result_msg'  => '密码更新失败'
                    );
                } else {
                    $res = array(
                        'result_code' => 200,
                        'result_msg'  => '密码更新成功'
                    );
                }
            }
            // 返回结果
            $this->ajaxReturn($res);
        } else {
            $this->display('changePwd');
        }
    }
}