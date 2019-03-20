<?php
/**
 * Description: 支付回调
 * User: Lance
 * Date: 2019/3/13 0013
 * Time: 12:52
 */

namespace Home\Controller;

use Think\Controller;
use Think\Log;

class PayController extends Controller
{
    /**
     * 微信支付回调
     */
    public function wx_notify()
    {
        $xml           = file_get_contents('php://input');
        $notify_result = xmlToArray($xml);
        if ($notify_result['return_code'] == 'SUCCESS' && $notify_result['result_code']) {
            $pay_sn   = $notify_result['out_trade_no'];
            $trade_no = $notify_result['transaction_id'];
            // 更新数据
            $this->update_after_pay($pay_sn, $trade_no);
        }
        $res = array(
            'return_code' => 'SUCCESS',
            'return_msg'  => 'OK'
        );

        $res_xml = arrayToXml($res);
        echo $res_xml;
    }

    /**
     * 支付宝回调
     */
    public function ali_notify()
    {
        try {
            $arr = I('post.');// 返回数据
            if ($arr) {
                $pay_sn       = $arr['out_trade_no'];
                $trade_no     = $arr['trade_no'];
                $trade_status = $arr['trade_status'];

                if ($trade_status == 'TRADE_FINISHED' || $trade_status == 'TRADE_SUCCESS') {
                    // 更新数据
                    $this->update_after_pay($pay_sn, $trade_no);
                    echo 'success';
                } else {
                    echo 'fail';
                }
            } else {
                Log::write('支付宝回调结果错误【' . serialize($arr) . '】');
                echo 'fail';
            }
        } catch (\Exception $e) {
            Log::write('支付宝回调程序错误【' . $e->getMessage() . '】');
            echo 'fail';
        }
    }

    /**
     * 支付成功后 数据更改
     *
     * @param $pay_sn   // 商户订单号
     * @param $trade_no // 支付单号
     */
    private function update_after_pay($pay_sn, $trade_no)
    {
        $model_order  = M('Order');
        $order_params = array(
            'pay_sn'      => $pay_sn,
            'del_state'   => 0,
            'order_state' => ORDER_STATE_NO_PAY
        );

        $order = $model_order->where($order_params)->find();
        if ($order) {
            // 更新订单数据
            $update_order = array(
                'trade_no'    => $trade_no,
                'pay_time'    => time(),
                'order_state' => ORDER_STATE_SUCCESS
            );
            $model_order->where(array('id' => $order['id']))->save($update_order);

            // 更新用户VIP有效时间
            $recharge_info = M('Recharge')->find($order['recharge_id']);
            if ($recharge_info) {
                $model_user = M('User');
                $user_info  = $model_user->find($order['user_id']);
                if ($user_info) {
                    $end_time = $user_info['end_time'];
                    if ($end_time) {
                        if ($end_time < time()) {
                            $end_time = time();
                        }
                    } else {
                        $end_time = time();
                    }
                    $vip_end_time = $end_time + $recharge_info['expire_timestamp'];
                    $model_user->where(array('id' => $user_info['id']))->save(array('end_time' => $vip_end_time));
                }
            }
        }
    }
}