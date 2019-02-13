<?php
/**
 * Description: 网站基础控制器
 * User: Lance
 * Date: 2018/12/3 0003
 * Time: 21:32
 */

namespace Home\Controller;


use Think\Controller;

class BaseUserController extends Controller
{
    protected $user_info;

    public function __construct()
    {
        parent::__construct();
        if(!session('current_user_id')) {
            $this->redirect('/home/index');
        } else {
            if(!$this->user_info) {
                $this->user_info = M('User')->where(array('id' => session('current_user_id')))->find();
            }
        }
    }

    /**
     * 判断是否收藏
     *
     * @param $vr_id
     *
     * @return bool
     */
    protected function _is_collect($vr_id)
    {
        $my_collects = M('Collect')->field('vr_id')->where(array('user_id' => $this->user_info['id'], 'state' => 0))->select();
        $my_collect_ids = array_column($my_collects, 'vr_id');
        if(in_array($vr_id, $my_collect_ids)) {
            return true;
        }
        return false;
    }

    /**
     * 获取推荐作品列表
     *
     * @param $vr_id
     *
     * @return mixed
     */
    protected function get_recom_list($vr_id)
    {
        $recom_list = M('Vr')->field('t_vr.*, t_vr_type.type_name')
            ->where(array('tag' => 1, 't_vr.id' => array('neq', $vr_id)))
            ->order('id asc')
            ->join('t_vr_type ON t_vr.type_id = t_vr_type.id')
            ->limit(5)->select();
        return $recom_list;
    }

}