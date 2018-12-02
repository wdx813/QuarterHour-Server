<?php

namespace Common\Common;
/**
 * Description: 短信工具类
 * User: Lance
 * Date: 2018/12/2 0002
 * Time: 16:51
 */

class Sms
{
    /**
     * 短信验证码校验
     *
     * @param $phone
     * @param $captcha
     * @param $type
     *
     * @return array
     */
    public static function check_captcha($phone, $captcha, $type)
    {
        $state = true;
        $msg   = '验证码验证成功';

        //TODO 供测试使用
        if ($captcha == '930813') {
            return array(
                'state' => $state,
                'msg'   => $msg
            );
        }

        $model_sms_log        = M('Sms_log');
        $condition            = array();
        $condition['phone']   = $phone;
        $condition['captcha'] = $captcha;
        $condition['type']    = $type;

        $sms_log = $model_sms_log->where($condition)->find();
        // 验证码5分钟内有效
        if (empty($sms_log) || $sms_log['status'] == 1 || $sms_log['add_time'] + C('captcha_expire_time') < time()) {
            $state = false;
            $msg   = '验证码已失效，请重新获取~';
        } else {
            // 校验通过，将状态置为无效
            $model_sms_log->where(array('id' => $sms_log['id']))->save(array('status' => 1));
        }

        return array(
            'state' => $state,
            'msg'   => $msg
        );
    }
}