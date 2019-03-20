<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用入口文件

// 检测PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',true);

// 定义应用目录
define('BASE_PATH',str_replace('\\','/',realpath(dirname(__FILE__).'/'))."/");
define('APP_PATH','./Application/');

// 定义配置文件
define('APP_STATUS', 'config');

// 定义绑定模块
//define('BIND_MODULE', 'Admin');

/** 支付类型 */
define('PAY_BY_WX', 1); // 微信
define('PAY_BY_ALI', 2); // 支付宝

/** 订单状态 */
define('ORDER_STATE_CANCEL', 0); // 已取消
define('ORDER_STATE_NO_PAY', 10); // 未支付
define('ORDER_STATE_SUCCESS', 20);// 支付完成

// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';

// 亲^_^ 后面不需要任何代码了 就是如此简单