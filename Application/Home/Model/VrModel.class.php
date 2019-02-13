<?php

namespace Home\Model;

use Think\Model\RelationModel;

/**
 * Description: VR模型
 * User: Lance
 * Date: 2019/1/2 0002
 * Time: 13:59
 */
class VrModel extends RelationModel
{
    // 定义关联
    protected $_link = array(
        'vr_type' => array(
            'mapping_type' => self::BELONGS_TO,
            'class_name'   => 'Vr_type',
            'mapping_name' => 'Vr_type',
            'foreign_key'  => 'type_id',
            'as_fields'    => 'type_name'
        )
    );
}