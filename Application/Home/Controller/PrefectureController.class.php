<?php
/**
 * Description: 行业专区
 * User: Lance
 * Date: 2018/12/9 0009
 * Time: 16:24
 */

namespace Home\Controller;


class PrefectureController extends BaseUserController
{
    public function index()
    {
        $data = $this->_vr_list();
        $this->assign('vr_data', $data);
        $this->display('hangye');
    }

    /**
     * 获取作品详情
     */
    public function get_vr_info()
    {
        $vr_id   = I('get.vr_id');
        $vr_info = D('Vr')->relation(true)->find($vr_id);
        // 是否收藏
        $vr_info['is_collect'] = $this->_is_collect($vr_info['id']);
        // 清单
        $quote_list = $this->_quote_list($vr_id);
        // 最后一条清单记录的ID
        $last_quote_id = 0;
        if ($quote_list && !empty($quote_list)) {
            $idx           = count($quote_list) - 1;
            $last_quote_id = $quote_list[$idx]['id'];
        }
        $this->assign('vr_info', $vr_info);
        $this->assign('quote_list', $quote_list);
        $this->assign('last_quote_id', $last_quote_id);
        $this->display('hangye_info');
    }

    /**
     * 获取更多的清单
     */
    public function get_more_quote()
    {
        $vr_id         = I('post.vr_id');
        $last_quote_id = I('post.last_quote_id');
        $quote_list    = $this->_quote_list($vr_id, $last_quote_id);
        // 最后一条清单记录的ID
        $last_quote_id = 0;
        if ($quote_list && !empty($quote_list)) {
            $idx           = count($quote_list) - 1;
            $last_quote_id = $quote_list[$idx]['id'];
        }
        $data = array(
            'quote_list'    => $quote_list,
            'last_quote_id' => $last_quote_id
        );
        $this->ajaxReturn($data);
    }

    /**
     * 添加清单
     */
    public function add_quote()
    {
        $params = I('post.');

        // 物料详情数据
        $quote_detail = array();
        $amount       = 0;
        if ($params['m'] && !empty($params['m'])) {
            foreach ($params['m'] as $key => $m) {
                if ($m['name'] && $m['count'] && $m['price']) {
                    $amount         += intval($m['price']);
                    $quote_detail[] = $m;
                }
            }
        }
        if ($params['p'] && !empty($params['p'])) {
            foreach ($params['p'] as $key => $p) {
                if ($p['name'] && $p['count'] && $p['price']) {
                    $amount         += intval($p['price']);
                    $quote_detail[] = $p;
                }
            }
        }
        if ($params['l'] && !empty($params['l'])) {
            foreach ($params['l'] as $key => $l) {
                if ($l['name'] && $l['count'] && $l['price']) {
                    $amount         += intval($l['price']);
                    $quote_detail[] = $l;
                }
            }
        }
        if ($params['t'] && !empty($params['t'])) {
            foreach ($params['t'] as $key => $t) {
                if ($t['name'] && $t['count'] && $t['price']) {
                    $amount         += intval($t['price']);
                    $quote_detail[] = $t;
                }
            }
        }

        if (empty($quote_detail)) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '请填写完整的清单~'
            );
            $this->ajaxReturn($res);
        }

        if (!$params['area']) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '请选择地区~'
            );
            $this->ajaxReturn($res);
        }

        $quote                 = array();
        $quote['vr_id']        = $params['vr_id'];
        $quote['user_id']      = $this->user_info['id'];
        $quote['provider']     = $this->user_info['c_name'];
        $quote['phone']        = $this->user_info['phone'];
        $quote['area']         = $params['area'];
        $quote['amount']       = $amount;
        $quote['add_time']     = time();
        $quote['Quote_detail'] = $quote_detail;

        $add_res = D('Quote')->relation(true)->add($quote);
        if ($add_res) {
            $res = array(
                'result_code' => 200,
                'result_msg'  => '上传成功~'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '上传失败~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 有用或者无用
     */
    public function like_or_not()
    {
        $quote_id    = I('post.quote_id');
        $is_like     = I('post.is_like');
        $model_quote = M('quote');
        if ($is_like) {
            $model_quote->where(array('id' => $quote_id))->setInc('like_num', 1);
        } else {
            $model_quote->where(array('id' => $quote_id))->setInc('not_like_num', 1);
        }
    }

    /**
     * 获取VR列表
     * @return array
     */
    private function _vr_list()
    {
        $page    = I('get.page') ? I('get.page') : 1;
        $type    = I('get.type');
        $keyword = I('get.keyword');
        $limit   = 6;

        $condition = array();
        if ($type) {
            $condition['type_id'] = $type;
        }
        if ($keyword) {
            $condition['vr_code|title'] = array($keyword, array('like', "%$keyword%"), '_multi' => true);
        }

        $data     = array();
        $model_vr = D('Vr');
        $vr_list  = $model_vr->relation(true)->where($condition)->page($page, $limit)->select();

        if ($vr_list && !empty($vr_list)) {
            foreach ($vr_list as $vr) {
                // 标签样式
                $tag_css = '';
                switch (intval($vr['tag'])) {
                    case 1:
                        $tag_css = 'rec_tag';
                        break;
                    case 2:
                        $tag_css = 'pop_tag';
                        break;
                    case 3:
                        $tag_css = 'new_tag';
                        break;
                }
                $vr['tag_css'] = $tag_css;

                // 供应商清单数量
                $quote_count       = M('Quote')->where(array('vr_id' => $vr['id']))->count();
                $vr['quote_count'] = $quote_count;

                // 是否收藏
                $vr['is_collect'] = $this->_is_collect($vr['id']);

                $data['vr_list'][] = $vr;
            }
        }

        // 页码总数
        $vr_count           = $model_vr->where($condition)->count();
        $page_total         = $vr_count % $limit == 0 ? intval($vr_count / $limit) : intval(ceil($vr_count / $limit));
        $data['page_total'] = $page_total;
        $data['page']       = $page;
        $data['type']       = $type;
        $data['keyword']    = $keyword;
        return $data;
    }

    /**
     * 获取清单列表
     *
     * @param $vr_id
     * @param int $quote_id
     *
     * @return mixed
     */
    private function _quote_list($vr_id, $quote_id = 0)
    {
        $condition  = array(
            'vr_id' => $vr_id,
            'id'    => array('gt', $quote_id)
        );

        $area = I('post.area');
        if($area) {
            $condition['area'] = $area;
        }
        $quote_list = D('Quote')->relation(true)->where($condition)->limit(2)->select();
        return $quote_list;
    }

}