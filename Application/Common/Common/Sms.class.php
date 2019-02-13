<?php

namespace Common\Common;

require BASE_PATH . 'vendor/autoload.php';

use GuzzleHttp\Psr7;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Think\Log;

/**
 * Description: 短信工具类
 * User: Lance
 * Date: 2018/12/2 0002
 * Time: 16:51
 */
class Sms
{
    public static function send($receiver, $type = 1)
    {
        $url        = 'https://api.rtc.huaweicloud.com:10443/sms/batchSendSms/v1'; //APP接入地址+接口访问URI
        $APP_KEY    = 'jI6Dn4CcZDwVjZJ656Kt8MlP6okV'; //APP_Key
        $APP_SECRET = 'V89zMO3920SwR75uJ9fZX08LZ60H'; //APP_Secret
        $sender     = 'csms18121001'; //签名通道号
        // 状态报告接收地址，为空或者不填表示不接收状态报告
        $statusCallback = '';

        // 模板 1.注册 2.修改密码
        switch ($type) {
            case 1:
                $TEMPLATE_ID = '237b0501c01d4735a3e2283cf0c02947';
                break;
            case 2:
                $TEMPLATE_ID = '237b0501c01d4735a3e2283cf0c02947';
                break;
            default:
                $TEMPLATE_ID = '237b0501c01d4735a3e2283cf0c02947';
                break;
        }

        // 验证码
        $captcha        = mt_rand(100000, 999999);
        $TEMPLATE_PARAS = '[' . $captcha . ']';

        $client = new Client();
        try {
            $response = $client->request('POST', $url, [
                'form_params' => [
                    'from'           => $sender,
                    'to'             => $receiver,
                    'templateId'     => $TEMPLATE_ID,
                    'templateParas'  => $TEMPLATE_PARAS,
                    'statusCallback' => $statusCallback
                ],
                'headers'     => [
                    'Authorization' => 'WSSE realm="SDP",profile="UsernameToken",type="Appkey"',
                    'X-WSSE'        => self::buildWsseHeader($APP_KEY, $APP_SECRET)
                ],
                'verify'      => false //为防止因HTTPS证书认证失败造成API调用失败，需要先忽略证书信任问题
            ]);
            $response = json_decode($response->getBody());
            if ($response->code != '000000') return false;

            // 保存短信日志
            $model_sms_log    = M('Sms_log');
            $data             = array();
            $data['phone']    = $receiver;
            $data['captcha']  = $captcha;
            $data['type']     = $type;
            $data['add_time'] = time();
            $data['status']   = 0;
            $add_res          = $model_sms_log->add($data);

            return $add_res == false ? false : true;
        } catch (RequestException $e) {
            if ($e->hasResponse()) {
                Log::record(Psr7\str($e->getResponse()));
            }
            return false;
        }
    }

    /**
     * 构造X-WSSE参数值
     * @param string $appKey
     * @param string $appSecret
     *
     * @return string
     */
    public static function buildWsseHeader(string $appKey, string $appSecret)
    {
        $now    = date('Y-m-d\TH:i:s\Z');
        $nonce  = uniqid();
        $base64 = base64_encode(hash('sha256', ($nonce . $now . $appSecret)));
        return sprintf("UsernameToken Username=\"%s\",PasswordDigest=\"%s\",Nonce=\"%s\",Created=\"%s\"",
            $appKey, $base64, $nonce, $now);
    }

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