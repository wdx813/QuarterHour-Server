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