/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : quarter_hour

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-01 11:32:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型 1：超级管理员 2：普通管理员',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态 0：正常 1：停用',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', '1', '0', '1543633862', '1543634656');

-- ----------------------------
-- Table structure for t_cdkey
-- ----------------------------
DROP TABLE IF EXISTS `t_cdkey`;
CREATE TABLE `t_cdkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cdkey` varchar(50) DEFAULT NULL COMMENT '激活码',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `expire_time` tinyint(1) DEFAULT NULL COMMENT '有效时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `use_time` int(11) DEFAULT NULL COMMENT '使用时间',
  `user_id` int(11) DEFAULT NULL COMMENT '用户主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='激活码表';

-- ----------------------------
-- Records of t_cdkey
-- ----------------------------

-- ----------------------------
-- Table structure for t_custom
-- ----------------------------
DROP TABLE IF EXISTS `t_custom`;
CREATE TABLE `t_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `contacts_name` varchar(100) DEFAULT NULL COMMENT '联系人',
  `contacts_mobile` varchar(100) DEFAULT NULL COMMENT '联系人电话',
  `shoot_date` varchar(50) DEFAULT NULL COMMENT '拍摄日期',
  `shoot_site` varchar(100) DEFAULT NULL COMMENT '拍摄地点',
  `wedding_style` varchar(125) DEFAULT NULL COMMENT '婚礼风格',
  `add_time` int(11) DEFAULT NULL COMMENT '提交时间',
  `check_time` int(11) DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户定制表';

-- ----------------------------
-- Records of t_custom
-- ----------------------------

-- ----------------------------
-- Table structure for t_quote
-- ----------------------------
DROP TABLE IF EXISTS `t_quote`;
CREATE TABLE `t_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(100) DEFAULT NULL COMMENT '提供方',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '总报价',
  `area` varchar(100) DEFAULT NULL COMMENT '地区',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `like_num` int(11) DEFAULT NULL COMMENT '喜欢的计数',
  `not_like_num` int(11) DEFAULT NULL COMMENT '不喜欢的计数',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报价清单';

-- ----------------------------
-- Records of t_quote
-- ----------------------------

-- ----------------------------
-- Table structure for t_quote_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_quote_detail`;
CREATE TABLE `t_quote_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型 1：物料 2：人工 3：灯光 4：运输',
  `quote_id` int(11) DEFAULT NULL COMMENT '清单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报价清单详情';

-- ----------------------------
-- Records of t_quote_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_log`;
CREATE TABLE `t_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `captcha` varchar(11) DEFAULT NULL COMMENT '短信验证码',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型 1：注册 2：修改密码',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：0为有效，1为无效，默认为0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信记录表';

-- ----------------------------
-- Records of t_sms_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qh_code` varchar(50) DEFAULT NULL COMMENT '用户编号，用于前端展示',
  `phone` varchar(11) NOT NULL COMMENT '手机号，用于作为平台账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `c_name` varchar(128) DEFAULT NULL COMMENT '公司名称',
  `c_logo` varchar(100) DEFAULT NULL COMMENT '公司logo',
  `c_slogen` varchar(255) DEFAULT NULL COMMENT '公司标语',
  `c_owner_name` varchar(50) DEFAULT NULL COMMENT '公司负责人姓名',
  `c_owner_code` varchar(20) DEFAULT NULL COMMENT '公司负责人身份证号',
  `c_owner_phone` varchar(11) DEFAULT NULL COMMENT '负责人电话',
  `c_address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_vr
-- ----------------------------
DROP TABLE IF EXISTS `t_vr`;
CREATE TABLE `t_vr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_code` varchar(50) DEFAULT NULL COMMENT '编号',
  `vr_src` varchar(128) DEFAULT NULL COMMENT '链接',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `type` int(2) DEFAULT NULL COMMENT '类型',
  `refer_quote` int(11) DEFAULT NULL COMMENT '参考价',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `view_count` int(11) DEFAULT NULL COMMENT '查看数量',
  `is_recom` tinyint(1) DEFAULT NULL COMMENT '是否推荐 1：是 0：否',
  `popular` int(11) DEFAULT NULL COMMENT '人气值',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='VR表';

-- ----------------------------
-- Records of t_vr
-- ----------------------------

-- ----------------------------
-- Table structure for t_vr_type
-- ----------------------------
DROP TABLE IF EXISTS `t_vr_type`;
CREATE TABLE `t_vr_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT 'vr类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='VR风格表';

-- ----------------------------
-- Records of t_vr_type
-- ----------------------------
INSERT INTO `t_vr_type` VALUES ('1', '欧式复古');
INSERT INTO `t_vr_type` VALUES ('2', '清新森系');
INSERT INTO `t_vr_type` VALUES ('3', '唯美浪漫');
INSERT INTO `t_vr_type` VALUES ('4', '典雅中式');
INSERT INTO `t_vr_type` VALUES ('5', '豪华大气');
INSERT INTO `t_vr_type` VALUES ('6', '户外系');
SET FOREIGN_KEY_CHECKS=1;
