<?php
return array(
    /* 数据库设置 */
    'DB_TYPE'               =>  'mysql',     // 数据库类型
    'DB_HOST'               =>  '127.0.0.1', // 服务器地址
    'DB_NAME'               =>  'quarter_hour',          // 数据库名
    'DB_USER'               =>  'root',      // 用户名
    'DB_PWD'                =>  '111111',          // 密码 111111
    'DB_PORT'               =>  '3306',        // 端口
    'DB_PREFIX'             =>  't_',    // 数据库表前缀
    'DB_PARAMS'          	=>  array(), // 数据库连接参数
    'DB_DEBUG'  			=>  TRUE, // 数据库调试模式 开启后可以记录SQL日志
    'DB_FIELDS_CACHE'       =>  true,        // 启用字段缓存
    'DB_CHARSET'            =>  'utf8',      // 数据库编码默认采用utf8
    'DB_DEPLOY_TYPE'        =>  0, // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
    'DB_RW_SEPARATE'        =>  false,       // 数据库读写是否分离 主从式有效
    'DB_MASTER_NUM'         =>  1, // 读写分离后 主服务器数量
    'DB_SLAVE_NO'           =>  '', // 指定从服务器序号

    /* SESSION设置 */
    'SESSION_OPTIONS'       =>  array('name' => 'ykz_session', 'expire' => 7200),

    /* 系统配置 */
    // 短信验证码有效时间5分钟
    'CAPTCHA_EXPIRE_TIME'   => 300,
    // 短信验证码的类型 1：注册 2：修改密码 3：修改手机号
    'CAPTCHA_TYPE'          => array(
        'REGISTER'     => 1,
        'UPDATE_PWD'   => 2,
        'UPDATE_PHONE' => 3
    ),
);