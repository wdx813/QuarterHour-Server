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
    protected $admin_info;
    public function __construct()
    {
        parent::__construct();
        if (!session('current_admin_id')) {
            $this->redirect('admin/login/index');
        } else {
            if(!$this->admin_info) {
                $this->admin_info = M('admin')->where(array('id' => session('current_admin_id')))->find();
            }
        }
    }

    public function index()
    {
        $this->display('Public:index');
    }

    public function main()
    {
        $this->display('Public:main');
    }

    /**
     * 退出
     */
    public function logout()
    {
        session('current_admin_id', null);
        $this->redirect('admin/login/index');
    }
}