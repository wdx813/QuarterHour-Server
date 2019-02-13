<?php
/**
 * Description: 作品管理
 * User: Lance
 * Date: 2019/1/16 0016
 * Time: 18:42
 */

namespace Admin\Controller;


use Think\Upload;

class VrController extends BaseController
{
    /**
     * 获取作品列表
     */
    public function list()
    {
        $page  = I('get.page');
        $limit = I('get.limit');
        $keyword = I('get.keyword');

        $condition = array('status' => 0);
        if($keyword) {
            $condition['vr_code|title'] = array($keyword, array('like', "%$keyword%"), '_multi' => true);
        }

        $model_vr = M('Vr');
        $vr_list  = $model_vr->field('t_vr.*, t_vr_type.type_name')->join('t_vr_type on t_vr.type_id = t_vr_type.id')->where($condition)->page($page, $limit)->select();
        if($vr_list && !empty($vr_list)) {
            foreach ($vr_list as &$vr) {
                $vr['add_time'] = date('Y-m-d h:i:s', $vr['add_time']);
            }
        }
        $vr_count = $model_vr->where($condition)->count();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $vr_count,
            'data'  => $vr_list
        );

        $this->ajaxReturn($data);
    }

    /**
     * 添加
     */
    public function add()
    {
        $params = I('post.');
        if($params) {
            $add_res = M('Vr')->add($params);
            if($add_res) {
                $res = array(
                    'result_code' => 200,
                    'result_msg' => '添加成功'
                );
            } else {
                $res = array(
                    'result_code' => 400,
                    'result_msg' => '添加失败'
                );
            }
            $this->ajaxReturn($res);
        } else {
            $vr_type_list = M('Vr_type')->select();
            $this->assign('type_list', $vr_type_list);
            $this->display('vr_add');
        }
    }

    /**
     * 编辑
     */
    public function edit()
    {
        $vr_id = I('get.vr_id');
        $vr = M('Vr')->where(array('t_vr.id' => $vr_id))->find();
        $vr_type_list = M('Vr_type')->select();
        $this->assign('type_list', $vr_type_list);
        $this->assign('vr', $vr);
        $this->display('vr_edit');
    }

    /**
     * 更新
     */
    public function update()
    {
        $data = I('post.');
        $update_res = M('Vr')->save($data);
        if($update_res) {
            $res = array(
                'result_code' => 200,
                'result_msg' => '更新成功'
            );
        } else {
            $res = array(
                'result_code' => 400,
                'result_msg' => '更新失败'
            );
        }
        $this->ajaxReturn($res);
    }

    /**
     * 上传缩略图
     */
    public function upload()
    {
        $file_name = I('post.file_name');
        if(!$file_name) {
            $res = array(
                'result_code' => 400,
                'result_msg' => '文件名称不能为空'
            );
            $this->ajaxReturn($res);
        }

        $config = array(
            'maxSize'  => 3145728,
            'exts'     => array('jpg', 'gif', 'png', 'jpeg'),
            'rootPath' => './Public/home/thumb/',
            'saveName' => $file_name,
            'saveExt'  => 'png',
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
     * 删除
     */
    public function delete()
    {
        $vr_id = I('post.vr_id');
        $delete_res = M('Vr')->where(array('id' => $vr_id))->save(array('status' => 1));
        if($delete_res) {
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

}