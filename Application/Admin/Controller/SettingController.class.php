<?php
/**
 * Description: 系统配置
 * User: Lance
 * Date: 2019/1/23 0023
 * Time: 11:17
 */

namespace Admin\Controller;


use Think\Model;

class SettingController extends BaseController
{
    /**
     * 作品类型列表
     */
    public function vrType_list()
    {
        $model_type = M('Vr_type');
        $type_list = $model_type->select();
        $type_count = $model_type->count();
        $data = array(
            'code' => 0,
            'msg' => 'success',
            'count' => $type_count,
            'data' => $type_list
        );
        $this->ajaxReturn($data);
    }

    /**
     * 作品类型编辑
     */
    public function vrType_edit()
    {
        $data = I('post.');
        M('Vr_type')->save($data);
    }


    public function list()
    {
        $model_setting = M('Setting');
        $setting_list = $model_setting->select();
        $setting_count = $model_setting->count();
        $data = array(
            'code' => 0,
            'msg' => 'success',
            'count' => $setting_count,
            'data' => $setting_list
        );
        $this->ajaxReturn($data);
    }

    /**
     * 编辑配置
     */
    public function edit()
    {
        $data = I('post.');
        $edit_res = M('Setting')->save($data);

        if($edit_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '编辑成功'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '编辑失败'
            );
        }
        $this->ajaxReturn($res);
    }

    // 产品套餐列表
    public function recharge_list()
    {
        $model_recharge = M('Recharge');
        $condition = array('status' => 0);
        $recharge_list = $model_recharge->where($condition)->select();
        $recharge_count = $model_recharge->where($condition)->count();

        if(!empty($recharge_list)) {
            foreach ($recharge_list as &$recharge) {
                switch ($recharge['time_type']) {
                    case 'y':
                        $recharge['expire_date'] = $recharge['expire_time'] . '年';
                        break;
                    case 'm':
                        $recharge['expire_date'] = $recharge['expire_time'] . '个月';
                        break;
                    case 'd':
                        $recharge['expire_date'] = $recharge['expire_time'] . '天';
                        break;
                    case 'h':
                        $recharge['expire_date'] = $recharge['expire_time'] . '小时';
                        break;
                    case 'i':
                        $recharge['expire_date'] = $recharge['expire_time'] . '分钟';
                        break;
                }
            }
        }

        $data = array(
            'code' => 0,
            'msg' => 'success',
            'count' => $recharge_count,
            'data' => $recharge_list
        );
        $this->ajaxReturn($data);
    }

    /**
     * 产品套餐编辑
     */
    public function edit_recharge()
    {
        $data = I('post.');
        switch ($data['time_type']) {
            case 'y':
                $data['expire_timestamp'] = $data['expire_time'] * 365 * 24 * 60 * 60;
                break;
            case 'm':
                $data['expire_timestamp'] = $data['expire_time'] * 30 * 24 * 60 * 60;
                break;
            case 'd':
                $data['expire_timestamp'] = $data['expire_time'] * 24 * 60 * 60;
                break;
            case 'h':
                $data['expire_timestamp'] = $data['expire_time'] * 60 * 60;
                break;
            case 'i':
                $data['expire_timestamp'] = $data['expire_time'] * 60;
                break;
        }
        $edit_res = M('Recharge')->save($data);
        if($edit_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '编辑成功'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '编辑失败'
            );
        }
        $this->ajaxReturn($res);
    }
}