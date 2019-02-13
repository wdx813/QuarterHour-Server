<?php
namespace Home\Model;

use Think\Model\RelationModel;

/**
 * Description: 清单模型
 * User: Lance
 * Date: 2019/1/2 0002
 * Time: 16:11
 */
class QuoteModel extends RelationModel
{
    protected $_link = array(
        'quote_detail' => array(
            'mapping_type' => self::HAS_MANY,
            'class_name'   => 'Quote_detail',
            'mapping_name' => 'Quote_detail',
            'foreign_key'  => 'quote_id'
        )
    );
}