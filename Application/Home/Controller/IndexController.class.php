<?php

namespace Home\Controller;

use Think\Controller;

/**
 * Description: 网站首页
 * Author: Lance
 * Date: 2018/11/27
 * Time: 16:48
 */
class IndexController extends Controller
{
    public function index()
    {
        $this->display();
    }

    public function test()
    {
        echo 'Hello World YST!!!';
    }
}