<?php
/**
 * 管理后台的基础控制器
 *
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/16
 * Time: 13:43
 */

namespace Admin\Controller;


use Think\Controller;

class BaseController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!isset($_SESSION['current_admin_id'])) {
            $this->redirect('admin/login/index');
        }
    }
}