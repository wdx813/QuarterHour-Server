<?php
/**
 * Description: 公告管理
 * User: Lance
 * Date: 2019/1/22 0022
 * Time: 21:50
 */

namespace Admin\Controller;


class NoticeController extends BaseController
{
    /**
     * 获取公告列表
     */
    public function list()
    {
        $page = I('get.page');
        $limit = I('get.limit');
        $keyword = I('get.keyword');

        $condition = array(
            'status' => 0
        );
        if($keyword) {
            $condition['title'] = array('like', "%$keyword%");
        }

        $model_notice = M('Notice');
        $notice_list = $model_notice->where($condition)->order('add_time desc')->page($page, $limit)->select();
        foreach ($notice_list as &$notice) {
            $notice['add_time'] = date('Y-m-d H:i:s', $notice['add_time']);
        }

        $notice_count = $model_notice->where($condition)->count();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $notice_count,
            'data'  => $notice_list
        );

        $this->ajaxReturn($data);
    }

    /**
     * 删除
     */
    public function delete()
    {
        $notice_id = I('post.notice_id');
        $del_res = M('Notice')->where(array('id' => $notice_id))->save(array('status' => 1));
        if($del_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '删除成功~'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '删除失败~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 创建
     */
    public function add()
    {
        $data = I('post.');
        $data['add_time'] = time();

        $add_res = M('Notice')->add($data);
        if($add_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '添加成功~'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '添加失败~'
            );
        }
        $this->ajaxReturn($res);
    }
}