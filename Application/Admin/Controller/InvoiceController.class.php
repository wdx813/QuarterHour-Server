<?php
/**
 * Description: 发票管理
 * User: Lance
 * Date: 2019/3/16 0016
 * Time: 14:43
 */

namespace Admin\Controller;


class InvoiceController extends AdminController
{
    /**
     * 发票列表
     */
    public function list()
    {
        $page  = I('get.page');
        $limit = I('get.limit');
        $keyword = I('get.keyword');

        $condition = array('t_invoice.del_state' => 0);
        if($keyword) {
            $condition['inv_title'] = array('like', "%$keyword%");
        }

        $model_invoice = M('Invoice');
        if($keyword) {
            $inv_list  = $model_invoice->field('t_invoice.*, t_order.order_sn, t_order.order_content')->join('t_order on t_order.id = t_invoice.order_id')->where($condition)->select();
        } else {
            $inv_list  = $model_invoice->field('t_invoice.*, t_order.order_sn, t_order.order_content')->join('t_order on t_order.id = t_invoice.order_id')->where($condition)->order('id desc')->page($page, $limit)->select();
        }

        if($inv_list && !empty($inv_list)) {
            foreach ($inv_list as &$inv) {
                $inv['add_time'] = date('Y-m-d H:i:s', $inv['add_time']);
                if($inv['inv_state'] == 1) {
                    $inv['end_time'] = date('Y-m-d H:i:s', $inv['end_time']);
                }
            }
        }
        $inv_count = $model_invoice->where($condition)->count();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $inv_count,
            'data'  => $inv_list
        );

        $this->ajaxReturn($data);
    }


    /**
     * 删除
     */
    public function delete()
    {
        $inv_id = I('post.inv_id');
        $delete_res = M('Invoice')->where(array('id' => $inv_id))->save(array('del_state' => 1, 'del_time' => time()));
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

    /**
     * 开发票
     */
    public function open()
    {
        $inv_id = I('post.inv_id');
        $delete_res = M('Invoice')->where(array('id' => $inv_id))->save(array('inv_state' => 1, 'end_time' => time()));
        if($delete_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '开票成功'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '开票失败'
            );
        }
        $this->ajaxReturn($res);

    }
}