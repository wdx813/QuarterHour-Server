<?php
/**
 * Description: 公共函数库
 * User: Lance
 * Date: 2018/12/2 0002
 * Time: 16:33
 */

/**
 * 生成用户编号
 * @return string
 */
function createUserCode() {
    return 'YKZ' . date('m') . date('d') . substr(time(), -5) . substr(microtime(), 2, 5);
}

/**
 * 生成激活码
 * @return string
 */
function createCdkey() {
    $uid = uniqid ("", true );
    $hash = strtoupper(hash ('ripemd128', $uid . md5 (time())));
    //$cdkey = substr ( $hash, 0, 8 ) . '-' . substr ( $hash, 8, 4 ) . '-' . substr ( $hash, 12, 4 ) . '-' . substr ( $hash, 16, 4 ) . '-' . substr ( $hash, 20, 12 );
    $cdkey = substr ( $hash, 8, 12 );
    return $cdkey;
}

/**
 * 提示框
 * @param string $msg
 * @param int $icon
 */
function showDialog($msg = '', $icon = '') {
    if($icon) {
        echo '<script>layer.msg("' . $msg .  '", {icon : '. $icon .'})</script>';
    } else {
        echo '<script>layer.msg("' . $msg .  '")</script>';
    }
}

/**
 * 生成支付单编号(两位随机 + 从2000-01-01 00:00:00 到现在的秒数+微秒+会员ID%1000)，该值会传给第三方支付接口
 * 长度 =2位 + 10位 + 3位 + 3位  = 18位
 * 1000个会员同一微秒提订单，重复机率为1/100
 * @return string
 */
function makePaySn($member_id) {
    return mt_rand(10, 99)
        . sprintf('%010d', time() - 946656000)
        . sprintf('%03d', (float) microtime() * 1000)
        . sprintf('%03d', (int) $member_id % 1000);
}

/**
 * 订单编号生成规则，n(n>=1)个订单表对应一个支付表，
 * 生成订单编号(年取1位 + $pay_id取13位 + 第N个子订单取2位)
 * 1000个会员同一微秒提订单，重复机率为1/100
 * @param $pay_id
 * @return string
 */
function makeOrderSn($pay_id) {
    //记录生成子订单的个数，如果生成多个子订单，该值会累加
    static $num;
    if (empty($num)) {
        $num = 1;
    } else {
        $num ++;
    }
    return (date('y', time()) % 9 + 1) . sprintf('%013d', $pay_id) . sprintf('%02d', $num);
}

/**
 * 生成二维码
 * @param  string  $url  url连接
 * @param  integer $size 尺寸 纯数字
 */
function qrcode($url,$size=8){
    Vendor('Phpqrcode.phpqrcode');
    QRcode::png($url,false,QR_ECLEVEL_L,$size,2,false);
}

/**
 * 数组转XML
 *
 * @param array $data
 *
 * @return string
 */
function arrayToXml(array $data) {
    $xml = "<xml>";
    foreach ($data as $k => $v) {
        if (is_numeric($v)) {
            $xml .= "<{$k}>{$v}</{$k}>";
        } else {
            $xml .= "<{$k}><![CDATA[{$v}]]></{$k}>";
        }
    }
    $xml .= "</xml>";
    return $xml;
}

/**
 * XMl转数组
 *
 * @param $xml
 *
 * @return mixed
 */
function xmlToArray($xml) {
    return json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
}