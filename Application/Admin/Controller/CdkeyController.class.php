<?php
/**
 * Description: 兑换码
 * User: Lance
 * Date: 2019/1/18 0018
 * Time: 17:34
 */

namespace Admin\Controller;


class CdkeyController extends BaseController
{
    /**
     * 获取兑换码列表
     */
    public function list()
    {
        $page    = I('get.page');
        $limit   = I('get.limit');
        $keyword = I('get.keyword');

        $condition = array('status' => 0);
        if ($keyword) {
            $condition['cdkey'] = $keyword;
        }

        $model_cdkey = M('Cdkey');
        $cdkey_list  = $model_cdkey->field('t_cdkey.*, t_user.phone')->join('left join t_user on t_cdkey.user_id = t_user.id')
            ->where($condition)->page($page, $limit)->select();

        foreach ($cdkey_list as &$cdkey) {
            $cdkey['create_time'] = date('Y-m-d H:i:s', $cdkey['create_time']);
            if ($cdkey['use_time']) {
                $cdkey['use_time'] = date('Y-m-d H:i:s', $cdkey['use_time']);
            }
        }

        $cdkey_count = $model_cdkey->join('left join t_user on t_cdkey.user_id = t_user.id')
            ->where($condition)->count();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $cdkey_count,
            'data'  => $cdkey_list
        );

        $this->ajaxReturn($data);
    }

    /**
     * 创建兑换码
     */
    public function add()
    {
        $time_num = I('post.time_num');
        $time_code = I('post.time_code');

        if($time_num <= 0) {
            $res = array(
                'result_code' => 400,
                'result_msg' => '有效时间为正整数'
            );
            $this->ajaxReturn($res);
        }

        $data = array();
        $data['cdkey'] = createCdkey();
        $data['create_time'] = time();
        $this->_build_expire_data($data, $time_num, $time_code);

        $add_res = M('Cdkey')->add($data);
        if($add_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '创建成功'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '创建失败'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 删除
     */
    public function delete()
    {
        $cdkey_id = I('post.cdkey_id');
        $del_res = M('Cdkey')->where(array('id' => $cdkey_id))->save(array('status' => 1));
        if($del_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '删除成功'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '删除失败'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 查看
     */
    public function detail()
    {
        $cdkey_id = I('get.cdkey_id');
        $cdkey = M('Cdkey')->join('left join t_user on t_cdkey.user_id = t_user.id')
            ->where(array('t_cdkey.id' => $cdkey_id))->find();
        $cdkey['create_time'] = date('Y-m-d H:i:s', $cdkey['create_time']);
        $cdkey['use_time'] = date('Y-m-d H:i:s', $cdkey['use_time']);
        $this->assign('cdkey', $cdkey);
        $this->display('cdkey_info');
    }

    /**
     * 编辑
     */
    public function edit()
    {
        $cdkey_id = I('get.cdkey_id');
        $cdkey = M('Cdkey')->find($cdkey_id);
        $this->assign('cdkey', $cdkey);
        $this->display('cdkey_edit');
    }

    /**
     * 更新
     */
    public function update()
    {
        $cdkey_id = I('post.cdkey_id');
        $time_num = I('post.time_num');
        $time_code = I('post.time_code');

        $data = array();
        $this->_build_expire_data($data, $time_num, $time_code);
        $update_res = M('Cdkey')->where(array('id' => $cdkey_id))->save($data);
        if($update_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '删除成功'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '删除失败'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 构建兑换码的有效时间数据
     * @param $data
     * @param $time_num
     * @param $time_code
     */
    private function _build_expire_data(& $data, $time_num, $time_code)
    {
        $data['time_num'] = $time_num;
        $data['time_code'] = $time_code;
        switch ($time_code) {
            case 'y':
                $data['expire_time'] = $time_num . '年';
                $data['expire_timestamp'] = $time_num * 365 * 24 * 60 * 60;
                break;
            case 'm':
                $data['expire_time'] = $time_num . '个月';
                $data['expire_timestamp'] = $time_num * 30 * 24 * 60 * 60;
                break;
            case 'd':
                $data['expire_time'] = $time_num . '天';
                $data['expire_timestamp'] = $time_num * 24 * 60 * 60;
                break;
            case 'h':
                $data['expire_time'] = $time_num . '小时';
                $data['expire_timestamp'] = $time_num * 60 * 60;
                break;
            case 'i':
                $data['expire_time'] = $time_num . '分钟';
                $data['expire_timestamp'] = $time_num * 60;
                break;
        }
    }
}