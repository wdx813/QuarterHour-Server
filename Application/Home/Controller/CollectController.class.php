<?php
/**
 * Description: 我的收藏
 * User: Lance
 * Date: 2019/1/6 0006
 * Time: 21:24
 */

namespace Home\Controller;

class CollectController extends BaseUserController
{

    /**
     * 获取收藏列表
     */
    public function list()
    {
        $page  = I('get.page');
        $page  = $page ? $page : 1;
        $limit = 8;
        $tag   = I('get.tag');

        $condition = array('user_id' => $this->user_info['id'], 'state' => 0);

        $vr_count = M('Collect')->where($condition)->count();

        if ($tag) {
            $condition['tag'] = $tag;
        }

        $collect_list = D('Vr')->relation(true)->join('t_collect on t_vr.id = t_collect.vr_id')
            ->where($condition)
            ->order('sort, t_vr.id')
            ->page($page, $limit)
            ->select();

        foreach ($collect_list as &$collect) {
            $collect['is_collect'] = true;
            if (!$collect['my_min_price']) {
                $collect['my_min_price'] = $collect['min_price'];
            }
            if (!$collect['my_max_price']) {
                $collect['my_max_price'] = $collect['max_price'];
            }
            if (!$collect['my_description']) {
                $collect['my_description'] = $collect['description'];
            }
        }

        $page_total = $vr_count % $limit == 0 ? intval($vr_count / $limit) : intval(ceil($vr_count / $limit));

        $data = array(
            'vr_list'    => $collect_list,
            'vr_count'   => $vr_count,
            'page'       => $page,
            'page_total' => $page_total,
            'tag'        => $tag
        );

        $this->assign('vr_data', $data);
        $this->display('collect');
    }

    /**
     * 获取VR详情
     */
    public function detail()
    {
        $vr_id = I('get.vr_id');
        $condition = array('user_id' => $this->user_info['id'], 'vr_id' => $vr_id, 'state' => 0);
        // 获取详情
        $collect_info = D('Vr')->relation(true)->join('t_collect on t_vr.id = t_collect.vr_id')
            ->where($condition)
            ->find();

        if($collect_info['quote']) {
            $collect_info['quote'] = htmlspecialchars_decode($collect_info['quote']);
        }

        // 是否收藏
        $collect_info['is_collect'] = true;
        if (!$collect_info['my_min_price']) {
            $collect_info['my_min_price'] = $collect_info['min_price'];
        }
        if (!$collect_info['my_max_price']) {
            $collect_info['my_max_price'] = $collect_info['max_price'];
        }
        if (!$collect_info['my_description']) {
            $collect_info['my_description'] = $collect_info['description'];
        }
        // 获取推荐作品
        $recom_list = $this->get_recom_list($vr_id);
        $this->assign('vr_info', $collect_info);
        $this->assign('recom_list', $recom_list);
        $this->display('collect_info');
    }

    /**
     * 添加或取消收藏
     */
    public function add_or_cancel()
    {
        $vr_id   = I('post.vr_id');
        $user_id = $this->user_info['id'];

        $condition = array('vr_id' => $vr_id, 'user_id' => $user_id);

        $model_collect = M('Collect');
        $collect       = $model_collect->where($condition)->find();
        if ($collect) {
            if ($collect['state'] == 0) {
                $data['state'] = 1;
                $result_msg    = '已取消收藏~';
            } else {
                $data['state'] = 0;
                $result_msg    = '收藏成功~';
            }
            $data['update_time'] = time();
            $update_res          = $model_collect->where($condition)->save($data);
            if ($update_res) {
                $res = array(
                    'result_code' => 200,
                    'result_msg'  => $result_msg
                );
            } else {
                $res = array(
                    'result_code' => 400,
                    'result_msg'  => '操作失败~'
                );
            }
        } else {
            $data    = array(
                'user_id'      => $user_id,
                'vr_id'        => $vr_id,
                'state'        => 0,
                'collect_time' => time()
            );
            $add_res = $model_collect->add($data);
            if ($add_res) {
                $res = array(
                    'result_code' => 200,
                    'result_msg'  => '收藏成功~'
                );
            } else {
                $res = array(
                    'result_code' => 400,
                    'result_msg'  => '操作失败~'
                );
            }
        }
        $this->ajaxReturn($res);
    }
}