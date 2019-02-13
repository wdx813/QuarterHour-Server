<?php
/**
 * Description: 个人中心
 * User: Lance
 * Date: 2019/1/9 0009
 * Time: 15:18
 */

namespace Home\Controller;

use Think\Upload;
use Common\Common\Sms;

/**===支付类型===*/
define('PAY_BY_WX', 1);
define('PAY_BY_ALI', 2);

class CenterController extends BaseUserController
{
    public function index()
    {
        if (!$this->user_info['c_logo']) {
            $this->user_info['c_logo'] = "default.png";
        }
        $this->assign('userinfo', $this->user_info);
        $this->display();
    }

    /**
     * 个人资料
     */
    public function userinfo_show()
    {
        if (!$this->user_info['c_logo']) {
            $this->user_info['c_logo'] = "default.png";
        }
        $this->assign('userinfo', $this->user_info);
        $this->display('userinfo');
    }

    /**
     * 上传头像
     */
    public function upload()
    {
        $config = array(
            'maxSize'  => 3145728,
            'exts'     => array('jpg', 'gif', 'png', 'jpeg'),
            'rootPath' => './Public/home/headimg/',
            'saveName' => $this->user_info['id'],
            'subName'  => '',
            'replace'  => true
        );
        $upload = new Upload($config);
        $info   = $upload->upload();
        if ($info) {
            $res = array(
                'result_code' => 200,
                'result_msg'  => '上传成功~',
                'file_name'   => $info['file']['savename']
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg'  => $upload->getError()
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 编辑用户信息
     */
    public function userinfo_edit()
    {
        $params             = I('post.');
        $params['c_name']   = trim($params['c_name']);
        $params['c_slogen'] = trim($params['c_slogen']);
        $user_id            = $this->user_info['id'];
        $edit_res           = M('User')->where(array('id' => $user_id))->save($params);
        if ($edit_res) {
            $this->user_info = M('User')->where(array('id' => $user_id))->find();
            session('current_user_cname', $this->user_info['c_name']);
            session('current_user_slogen', $this->user_info['c_slogen']);

            $res = array(
                'result_code' => 200,
                'result_msg'  => '保存成功~'
            );
        } else {
            $res = array(
                'result_code' => 200,
                'result_msg'  => '保存失败~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 我的收藏
     */
    public function collect_show()
    {
        $page  = I('get.page');
        $page  = $page ? $page : 1;
        $limit = 4;

        $condition = array('user_id' => $this->user_info['id'], 'state' => 0);

        $vr_count = M('Collect')->where($condition)->count();

        $collect_list = D('Vr')->relation(true)->join('t_collect on t_vr.id = t_collect.vr_id')
            ->where($condition)
            ->order('sort, t_vr.id')
            ->page($page, $limit)
            ->select();

        foreach ($collect_list as &$collect) {
            if (!$collect['my_min_price']) {
                $collect['my_min_price'] = $collect['min_price'];
            }
            if (!$collect['my_max_price']) {
                $collect['my_max_price'] = $collect['max_price'];
            }
            if (!$collect['my_description']) {
                $collect['my_description'] = $collect['description'];
            }

            // 清单数量
            $quote_count            = M('Quote')->where(array('vr_id' => $collect['id']))->count();
            $collect['quote_count'] = $quote_count;
        }

        $page_total = $vr_count % $limit == 0 ? intval($vr_count / $limit) : intval(ceil($vr_count / $limit));

        $data = array(
            'vr_list'    => $collect_list,
            'vr_count'   => $vr_count,
            'page'       => $page,
            'page_total' => $page_total
        );

        $this->assign('vr_data', $data);
        $this->display('collect');
    }

    /**
     * 收藏编辑
     */
    public function collect_edit()
    {
        $params                   = I('post.');
        $params['my_description'] = trim($params['my_description']);

        $condition = array(
            'user_id' => $this->user_info['id'],
            'vr_id'   => $params['vr_id']
        );
        $edit_res  = M('Collect')->where($condition)->save($params);

        if ($edit_res) {
            $res = array(
                'result_code' => 200,
                'result_msg'  => '编辑成功~'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '编辑失败~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 账号安全--验证
     */
    public function account_verify()
    {
        $params = I('post.');
        // 校验短信验证码
        $check_res = Sms::check_captcha($params['phone'], $params['captcha'], $params['type']);
        if ($check_res['state'] == false) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => $check_res['msg']
            );
        } else {
            $res = array(
                'result_code' => 200,
                'result_msg'  => "验证通过~"
            );
        }

        $this->ajaxReturn($res);
    }

    /**
     * 账号安全--修改密码
     */
    public function change_pwd()
    {
        $new_pwd = I('post.new_pwd');
        $data    = array(
            'password'    => md5($new_pwd),
            'update_time' => time()
        );

        $change_res = M('User')->where(array('id' => $this->user_info['id']))->save($data);
        if ($change_res) {
            $code = 200;
            $msg  = '密码修改成功~';
        } else {
            $code = 400;
            $msg  = '密码修改失败~';
        }

        $res = array(
            'result_code' => $code,
            'result_msg'  => $msg
        );
        $this->ajaxReturn($res);
    }

    /**
     * 账号安全--修改手机号
     */
    public function change_phone()
    {
        $params = I('post.');
        // 校验短信验证码
        $check_res = Sms::check_captcha($params['new_phone'], $params['captcha'], C('CAPTCHA_TYPE.UPDATE_PHONE'));
        if ($check_res['state'] == false) {
            $res = array(
                'result_code' => 400,
                'result_msg'  => $check_res['msg']
            );
            $this->ajaxReturn($res);
        }

        $data       = array('phone' => $params['new_phone'], 'update_time' => time());
        $change_res = M('User')->where(array('id' => $this->user_info['id']))->save($data);
        if ($change_res) {
            $code = 200;
            $msg  = '手机号修改成功~';
        } else {
            $code = 400;
            $msg  = '手机号修改失败~';
        }

        $res = array(
            'result_code' => $code,
            'result_msg'  => $msg
        );
        $this->ajaxReturn($res);
    }


    /**
     * 充值
     */
    public function recharge_show()
    {
        $this->display('recharge');
    }

    /**
     * 礼券兑换
     */
    public function exchange_cdkey()
    {
        $cdkey = I('post.cdkey');
        $model_cdkey = M('Cdkey');
        $cdkey_info = $model_cdkey->where(array('cdkey'=>$cdkey, 'status' => 0))->find();
        if(empty($cdkey_info)) {
            $res = array(
                'result_code' => 400,
                'result_msg' => '该兑换码不存在~'
            );
            $this->ajaxReturn($res);
        }

        if($cdkey_info['user_id']) {
            $res = array(
                'result_code' => 400,
                'result_msg' => '该兑换码已失效~'
            );
            $this->ajaxReturn($res);
        }

        $end_time = $this->user_info['end_time'];
        if ($end_time) {
            if($end_time < time()) {
                $end_time = time();
            }
        } else {
            $end_time = time();
        }
        $vip_end_time = $end_time + $cdkey_info['expire_timestamp'];
        $exchange_res = M('User')->where(array('id' => $this->user_info['id']))->save(array('end_time' => $vip_end_time));
        $use_res = $model_cdkey->where(array('id' => $cdkey_info['id']))
            ->save(array('user_id' => $this->user_info['id'], 'use_time' => time()));
        if($exchange_res && $use_res) {
            session('vip_end_time', $vip_end_time);
            $res = array(
                'result_code' => 200,
                'result_msg' => '兑换成功~'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '兑换失败~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 获取通知
     */
    public function notice_show()
    {
        $page  = I('get.page');
        $page  = $page ? $page : 1;
        $limit = 8;

        $condition = array(
            'status'     => 0,
            'del_status' => 0,
            'user_id'    => $this->user_info['id']
        );

        $model_notice = M('Notice');
        $notice_list  = $model_notice->join('t_user_notice on t_user_notice.notice_id = t_notice.id')->where($condition)
            ->order('read_status, add_time desc')
            ->page($page, $limit)
            ->select();

        $notice_count = $model_notice->join('t_user_notice on t_user_notice.notice_id = t_notice.id')->where($condition)->count();
        $page_total   = $notice_count % $limit == 0 ? intval($notice_count / $limit) : intval(ceil($notice_count / $limit));

        $data = array(
            'notice_list' => $notice_list,
            'page_total'  => $page_total,
            'page'        => $page
        );

        $this->assign('notice_data', $data);
        $this->display('notice');
    }

    /**
     * 删除通知
     */
    public function notice_delete()
    {
        $notice_id = I('post.notice_id');
        $del_res   = M('User_notice')->where(array('id' => $notice_id))->save(array('del_status' => 1, 'del_time' => time()));
        if ($del_res) {
            $res = array(
                'result_code' => 200,
                'result_msg'  => '删除成功~'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '删除失败~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 切换主题
     */
    public function change_theme()
    {
        $theme = $this->user_info['sys_theme'];
        if ($theme == 6) {
            $theme = 0;
        } else {
            $theme ++;
        }
        $change_res = M('User')->where(array('id' => $this->user_info['id']))->save(array('sys_theme' => $theme));
        if ($change_res) {
            session('current_sys_theme', $theme);
            $res = array(
                'result_code' => 200,
                'result_msg'  => '更新成功~',
                'theme'       => $theme
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg'  => '更新失败~'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 充值套餐
     */
    public function recharge()
    {
        $recharge_list = M('Recharge')->where(array('status' => 0))->select();
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
        $this->assign('recharge_list', $recharge_list);
        $this->display('recharge');
    }

    /**
     * 下单
     */
    public function create_order()
    {
        $data = I('post.');
        $pay_sn = makePaySn($this->user_info['id']);
        $data['order_sn'] = makeOrderSn($pay_sn);
        qrcode('https://www.baidu.com');
    }

}