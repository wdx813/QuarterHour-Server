<?php
/**
 * Description: 婚礼定制
 * User: Lance
 * Date: 2018/12/3 0003
 * Time: 21:36
 */

namespace Home\Controller;

class CustomController extends BaseUserController
{
    public function index()
    {
        $this->display();
    }

    /**
     * 提交审核
     */
    public function add_custom()
    {
        $data             = I('post.');
        $data['user_id']  = $this->user_info['id'];
        $data['add_time'] = time();

        $result = M("Custom")->add($data);
        if ($result == false) {
            $code = 400;
            $msg  = '审核提交失败~';
        } else {
            $code = 200;
            $msg  = '审核提交成功~';
        }
        $res = array(
            'result_code' => $code,
            'result_msg'  => $msg
        );
        $this->ajaxReturn($res);
    }
}