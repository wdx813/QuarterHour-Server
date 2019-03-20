<?php

namespace Common\Common;
use Think\Exception;

/**
 * Description: 微信支付
 * User: Lance
 * Date: 2019/1/28 0028
 * Time: 12:30
 */

class WxPay
{
    /**
     * 下单
     *
     * @param array $data
     *
     * @return mixed
     * @throws Exception
     */
    public static function create_order(array $data)
    {
        $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
        // pack xml
        $xml = arrayToXml($data);

        // curl post
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
        $response = curl_exec($ch);
        if (!$response) {
            throw new Exception('CURL Error: ' . curl_errno($ch));
        }
        curl_close($ch);

        // unpack xml
        return xmlToArray($response);
    }

    /**
     * 生成签名
     * @param array $data
     *
     * @return string
     */
    public static function sign(array $data) {
        ksort($data);

        $a = array();
        foreach ($data as $k => $v) {
            if ((string) $v === '') {
                continue;
            }
            $a[] = "{$k}={$v}";
        }

        $a = implode('&', $a);
        $a .= '&key=' . C('WX_PAY.API_KEY');

        return strtoupper(md5($a));
    }


}