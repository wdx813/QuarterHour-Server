<?php
return array(
    /* 数据库设置 */
    'DB_TYPE'               =>  'mysql',     // 数据库类型
    'DB_HOST'               =>  '127.0.0.1', // 服务器地址
    'DB_NAME'               =>  'quarter_hour',          // 数据库名
    'DB_USER'               =>  'root',      // 用户名
    'DB_PWD'                =>  'Yikezhong2019',   // 密码
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
    // 短信验证码的类型 1：注册 2：修改密码
    'CAPTCHA_TYPE'          => array(
        'REGISTER'     => 1,
        'UPDATE_PWD'   => 2,
        'UPDATE_PHONE' => 3
    ),

    /* 微信支付 */
    'WX_PAY' => array(
        //应用ID
        'APP_ID'     => 'wx5c00cf2a6d04c50f',
        //应用密钥
        'APP_SECRET' => '9f966e3e3f32c50274f1a9c568d9ab1e',
        //商户号
        'MCH_ID'     => '1524605571',
        //API密钥
        'API_KEY'    => 'fsd56g87s6dgs32wedg1264jioeq154e',
        //异步通知地址
        'NOTIFY_URL' => 'http://www.hunli720.com/home/pay/wx_notify'
    ),

    /* 支付宝支付 */
    'ALI_PAY' => array(
        //应用ID,您的APPID。
        'app_id'               => "2019032063603574",
        //商户私钥
        'merchant_private_key' => "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQC4S0SUeij5C7ZmKDF5QIrqin91QGEqwN1ptD1tYtkdy5iL+7PJM8c6OFF5uxWDdyV+itPbvW503l8Xrn6FsD+evWzROXo+KFwdPOc5lS54nhAwORkJmnyTJTtu8EhGIwuMzIofuqmog2t9uu6iaQuUPdi0UNFeInkcmy7NCDkjwrj1XlM1og8UMmAj2yr9ilJGRSpX4+QDK1JSnstbqmNOQLZQRhTaGXIO7VIJiq6gmBB/oaaS5ImbdeKcW0z2yE2tibrS+oFbqdXcF8sFdwx0av96F6hNNeIvy8lapkUpNR0Kd0OwWXuH8ensfQ3FcR2ZT9buHD+5tNnEp6LPROv5AgMBAAECggEBAIy3K84S2GYQQ10NI3lphqg+x8NHPOngCS9EqAJ1j0HoyrlXnpbqKhySE+PWrT6MItzUM598rHIfuIvkeEarpGgYSpYWRPhg6LSKZCLbfXgreEDZ1/w1MRlJPHAgl462A4OmSXCgnhpE/jYqHTt06Zpu/p/vdW1i9QaalsmGldpu7RhdlLIZxfIIWU/wtkd1U9s6IkqS39Iu6s/FPUjvIUlxIwbwc8OJBW/Jm+ObxmWiy9BAySGLh4KY3yiltJJjQ9LAzByl6Sbs5c76fB3t8MPCg568PerMrIx5XFroEP7soLxmQL6+kAhP0cjE7PEJ5hl7/oUeBpBMO5PFn5mLqOECgYEA+BgN3kbvoLD+XKlL1cVt/mFjW5Wv9fjzl2q1TDJiZum1+mw5qQHssq8hEzF0lHB9hsRd6gbM0OE8B7k7ucfmK7F07FNGD1qTLIqHAbP6ZnfNraMfQkF/jN4lxmTNTqsTuHvrS1nSEK3aZ6lnaJjYFax257+7/236S301e0/32VMCgYEAviq8JsNSamXpwSJZ7pKfkIEnEbuBWhpZeDOBJbQf8puzELuNvNGvDhK8l6ukHBA3GQsMmbTKm/cVN1WH9COri4Fbk189PEhvSR6mizrDAk9aSLTg7GozNKcyeDxspj1QVo3wIjjRv19aC7vTma8e6I6+sy0Vf8hWgn30cw2hIAMCgYEAriDD6xTCr3hKr2KrtViiwP49rFQ9cljPL6FXqila43x5m1BGkBanuSot/rihaGYj1GkSuWUYcCsF5S3fe5+QL26X8B7qd3BNB+AardlSkITZuVtaXzh1e7uXq82oQ+TTLJLdLL/YLpi3SDagO8u7LkskEbiDDN515HH3DZutC70CgYEAubUCCNi1ozHjFLh3GoQVTwjRHn/90f/pX3jspeVBTaq/M5f00m/yg8vIYFU97innpI0lwPTM54JjNaZRHhm3bITm6QQYyMXz53QHL/AygA7+HAKHpFgRqVmd780STUWTLvNtjf3u1vRG+y5xdaOOi4zarh9Y33DFCqn2DmVA9AECgYEA9+NqCDOwlGp+TUtcxeT6aiEr9kgjefz0DgZWqn/FydERs5v/i2VJ5hHS6ydpidnPPz9QtbrWj5raNmSbqJ2wwAN+JQbEkoAq19deYLW9oreAgGELKoo4dsUENcSsjP/43zVvTdUpQOrsqzHhxlbxZ6RI526N/c+p+NZDE6mUZ6g=",
        //异步通知地址
        'notify_url'           => "http://www.hunli720.com/home/pay/ali_notify",
        //同步跳转
        'return_url'           => "",
        //编码格式
        'charset'              => "UTF-8",
        //签名方式
        'sign_type'            => "RSA2",
        //支付宝网关
        'gatewayUrl'           => "https://openapi.alipay.com/gateway.do",
        //支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
        'alipay_public_key'    => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtydyc7jkdq/C1AyfKYGKWyfUhRIm28TA86ZaCxgXnBTBgHQqzVq+CrATz3gNEkxQBdGobispZbbeBvGXDQIUuvEePv+KHOIdBzXswNVMyVu0tSYbvMFDMmt1ItqmUpOONemrFKTLrms8pvPH2dq6VLoxSibWXYwRvDPzSdSlVIwuO7S8M7GP3hOSjCP1ZUB+DkMkMX3PTTBF8e3wotCI3Tka/U04Q785AO2OnRiXdXUqdW6HMGiSdYgDn204pw3FJj0WMEyGRqkmhYPTYmlkel3HjpTq5CRCklpQVywFeGNHouNg2Wr8EQ5IcMyfQ/+DRzVxzIfw8JaIKEsdCyhWJwIDAQAB",
    ),

    /* 礼到商城的链接 */
    'LI_DAO_SHOP_URL' => 'http://www.juzi-it.com' // http://www.lidaoshop.com

);