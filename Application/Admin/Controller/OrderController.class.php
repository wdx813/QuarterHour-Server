<?php
/**
 * Description: 订单管理
 * User: Lance
 * Date: 2019/3/14 0014
 * Time: 19:00
 */

namespace Admin\Controller;


class OrderController extends AdminController
{
    /**
     * 订单列表
     */
    public function list()
    {
        $page  = I('get.page');
        $limit = I('get.limit');
        $keyword = I('get.keyword');

        $condition = array('t_order.del_state' => 0);
        if($keyword) {
            $condition['order_sn'] = $keyword;
        }

        $model_order = M('Order');
        if($keyword) {
            $order_list  = $model_order->field('t_order.*, t_user.phone')->join('t_user on t_order.user_id = t_user.id')->where($condition)->select();
        } else {
            $order_list  = $model_order->field('t_order.*, t_user.phone')->join('t_user on t_order.user_id = t_user.id')->where($condition)->order('id desc')->page($page, $limit)->select();
        }

        if($order_list && !empty($order_list)) {
            foreach ($order_list as &$order) {
                $order['add_time'] = date('Y-m-d H:i:s', $order['add_time']);
                $order['pay_time'] = date('Y-m-d H:i:s', $order['pay_time']);
            }
        }
        $order_count = $model_order->where($condition)->count();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $order_count,
            'data'  => $order_list
        );

        $this->ajaxReturn($data);
    }

    /**
     * 删除
     */
    public function delete()
    {
        $order_id = I('post.order_id');
        $delete_res = M('Order')->where(array('id' => $order_id))->save(array('del_state' => 1, 'del_time' => time()));
        if($delete_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '删除成功'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '删除失败'
            );
        }
        $this->ajaxReturn($res);

    }
}