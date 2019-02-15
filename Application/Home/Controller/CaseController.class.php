<?php
/**
 * Description: 方案系统
 * User: Lance
 * Date: 2018/12/9 0009
 * Time: 16:22
 */

namespace Home\Controller;

class CaseController extends BaseUserController
{
    public function index()
    {
        // 获取VR列表
        $vr_data = $this->get_vr_list();
        $this->assign('vr_data', $vr_data);
        $this->display('case');
    }

    /**
     * 获取VR详情
     */
    public function get_vr_info()
    {
        $vr_id = I('get.vr_id');
        // 获取详情
        $vr_info = D('Vr')->relation(true)->find($vr_id);
        $vr_info['quote'] = htmlspecialchars_decode($vr_info['quote']);
        // 是否收藏
        $vr_info['is_collect'] = $this->_is_collect($vr_info['id']);
        // 获取推荐作品
        $recom_list = $this->get_recom_list($vr_id);
        $this->assign('vr_info', $vr_info);
        $this->assign('recom_list', $recom_list);
        $this->display('case_info');
    }

    /**
     * 获取VR列表
     *
     * @return array
     */
    private function get_vr_list()
    {
        $page = I('get.page') ? I('get.page') : 1;
        $type = I('get.type');
        $tag  = I('get.tag');
        $limit = 8;

        $condition = array('status' => 0);
        if ($type && $type != -1) {
            $condition['type_id'] = $type;
        }
        if($tag && $tag != -1) {
            $condition['tag'] = $tag;
        }

        $model_vr = D('Vr');
        $vr_list  = $model_vr->relation(true)->where($condition)->order('id')->page($page, $limit)->select();
        // 是否收藏
        foreach ($vr_list as &$vr) {
            $vr['is_collect'] = $this->_is_collect($vr['id']);
        }
        $vr_count = $model_vr->where($condition)->count();
        $page_total = $vr_count % $limit == 0 ? intval($vr_count / $limit) : intval(ceil($vr_count / $limit));

        $result = array(
            'vr_list'    => $vr_list,
            'vr_count'   => $vr_count,
            'page'       => $page,
            'page_total' => $page_total,
            'tag'        => $tag,
            'type'       => $type
        );
        return $result;
    }

    /**
     * 增加浏览量
     */
    public function incre_view_count()
    {
        $vr_id = I('post.vr_id');
        M('Vr')->where(array('id' => $vr_id))->setInc('view_count');
    }
}