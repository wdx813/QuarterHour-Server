<?php
/**
 * Description: 婚礼定制
 * User: Lance
 * Date: 2019/1/22 0022
 * Time: 19:08
 */

namespace Admin\Controller;


class CustomController extends BaseController
{
    /**
     * 获取定制列表
     */
    public function list()
    {
        $page = I('get.page');
        $limit = I('get.limit');

        $model_custom = M('Custom');
        $custom_list = $model_custom->order('check_status desc, add_time')->page($page, $limit)->select();
        $custom_count = $model_custom->count();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $custom_count,
            'data'  => $custom_list
        );

        $this->ajaxReturn($data);
    }

    /**
     * 审核
     */
    public function check()
    {
        $custom_id = I('post.id');
        $remark = I('post.remark');

        $data = array(
            'check_status' => 1,
            'check_time' => time(),
            'remark' => $remark
        );

        $check_res = M('Custom')->where(array('id' => $custom_id))->save($data);
        if($check_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '审核成功~'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '审核失败~'
            );
        }
        $this->ajaxReturn($res);
    }
}