<?php
/**
 * Description: 用户管理
 * User: Lance
 * Date: 2019/1/15 0015
 * Time: 15:50
 */

namespace Admin\Controller;


class UserController extends BaseController
{
    /**
     * 获取用户列表
     */
    public function list()
    {
        $page  = I('get.page');
        $limit = I('get.limit');
        $keyword = I('get.keyword');

        $condition = array();
        if($keyword) {
            $condition['phone|c_name'] = array($keyword, array('like', "%$keyword%"), '_multi' => true);
        }

        $model_user = M('User');
        $user_list  = $model_user->where($condition)->page($page, $limit)->select();
        if($user_list && !empty($user_list)) {
            foreach ($user_list as &$user) {
                $user['add_time'] = date('Y-m-d h:i:s', $user['add_time']);
                if($user['end_time']) {
                    $user['end_time'] = date('Y-m-d h:i:s', $user['end_time']);
                }
            }
        }
        $user_count = $model_user->where($condition)->count();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $user_count,
            'data'  => $user_list
        );

        $this->ajaxReturn($data);
    }

    /**
     * 禁用
     */
    public function forbid()
    {
        $user_id = I('post.user_id');
        $del_state = I('post.del_state');
        $forbidRes = M('User')->where(array('id' => $user_id))->save(array('del_state' => $del_state));
        if($forbidRes) {
            $code = 200;
            $msg = '操作成功~';
        } else {
            $code = 200;
            $msg = '操作失败~';
        }

        $res = array('result_code' => $code, 'result_msg' => $msg);
        $this->ajaxReturn($res);
    }

    /**
     * 批量禁用
     */
    public function batch_forbid()
    {
        $users = I('post.users');
        if($users && !empty($users)) {
            $model_user = M('User');
            foreach ($users as $user) {
                $del_state = $user['del_state'] == 1 ? 0 : 1;
                $model_user->where(array('id' => $user['id']))->save(array('del_state' => $del_state));
            }
        }
    }
}