/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : quarter_hour

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-02-03 20:10:11
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
  `expire_time` varchar(50) DEFAULT NULL COMMENT '有效时间',
  `expire_timestamp` int(11) DEFAULT NULL COMMENT '有效时间戳',
  `time_num` int(11) DEFAULT NULL COMMENT '时间数',
  `time_code` char(10) DEFAULT NULL COMMENT '时间参数 y：年 m：月 d：天 h：小时 i：分钟',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0：正常 1：失效',
  `use_time` int(11) DEFAULT NULL COMMENT '使用时间',
  `user_id` int(11) DEFAULT NULL COMMENT '使用用户主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='激活码表';

-- ----------------------------
-- Records of t_cdkey
-- ----------------------------
INSERT INTO `t_cdkey` VALUES ('1', 'aaa', '1547815155', '3天', '259200', null, null, '1', null, null);
INSERT INTO `t_cdkey` VALUES ('2', 'FE58C9C5', '1547884063', '3天', '259200', null, null, '1', null, null);
INSERT INTO `t_cdkey` VALUES ('3', 'F7053A43D7E6', '1547884133', '3个月', '7776000', '3', 'm', '0', '1547961554', '2');
INSERT INTO `t_cdkey` VALUES ('4', '1245BCF11371', '1547884187', '6个月', '15552000', null, null, '0', null, null);
INSERT INTO `t_cdkey` VALUES ('5', '1248377695D5', '1547884890', '15天', '1296000', '15', 'd', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('6', '7328B1D3F1B9', '1547885826', '10天', '864000', '10', 'd', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('7', 'B69DA4D42092', '1547885848', '10小时', '36000', '10', 'h', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('8', '5E9481AC2206', '1547885873', '12天', '1036800', '12', 'd', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('9', '667E00FB6D24', '1547885884', '15天', '1296000', '15', 'd', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('10', '96C1DFB9E8B5', '1547885931', '1天', '86400', '1', 'd', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('11', '277AC153127D', '1547885935', '2天', '172800', '2', 'd', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('12', '5FB6331CF512', '1547885968', '3天', '259200', '3', 'd', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('13', 'D4BA643BDA97', '1548137814', '1年', '31536000', '1', 'y', '0', null, null);
INSERT INTO `t_cdkey` VALUES ('14', '841547A57FD4', '1548138947', '1年', '31536000', '1', 'y', '0', null, null);

-- ----------------------------
-- Table structure for t_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vr_id` int(11) DEFAULT NULL COMMENT '作品ID',
  `my_min_price` int(11) DEFAULT NULL COMMENT '我的最低价',
  `my_max_price` int(11) DEFAULT NULL COMMENT '我的最高价',
  `my_description` text COMMENT '我的描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `state` tinyint(2) DEFAULT NULL COMMENT '状态 0：正常 1：失效',
  `collect_time` int(11) DEFAULT NULL COMMENT '收藏时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='我的收藏（作品）';

-- ----------------------------
-- Records of t_collect
-- ----------------------------
INSERT INTO `t_collect` VALUES ('1', '2', '1', null, null, null, '1', '0', '1546784560', '1546935062');
INSERT INTO `t_collect` VALUES ('2', '2', '2', null, null, null, '3', '0', '1546784707', '1546934667');
INSERT INTO `t_collect` VALUES ('3', '2', '4', null, null, null, '2', '0', '1546933583', null);
INSERT INTO `t_collect` VALUES ('4', '1', '4', null, null, null, '1', '0', '1546933583', null);
INSERT INTO `t_collect` VALUES ('5', '2', '5', '2888', '3999', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', '4', '0', '1546950770', null);

-- ----------------------------
-- Table structure for t_custom
-- ----------------------------
DROP TABLE IF EXISTS `t_custom`;
CREATE TABLE `t_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `c_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `contacts_name` varchar(100) DEFAULT NULL COMMENT '联系人',
  `contacts_mobile` varchar(100) DEFAULT NULL COMMENT '联系人电话',
  `shoot_date` varchar(50) DEFAULT NULL COMMENT '拍摄日期',
  `shoot_site` varchar(100) DEFAULT NULL COMMENT '拍摄地点',
  `wedding_style` varchar(125) DEFAULT NULL COMMENT '婚礼风格',
  `add_time` int(11) DEFAULT NULL COMMENT '提交时间',
  `check_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态  0：未审核 1：已审核',
  `check_time` int(11) DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户定制表';

-- ----------------------------
-- Records of t_custom
-- ----------------------------
INSERT INTO `t_custom` VALUES ('1', '1', '一刻钟智能科技有限公司', '吴道祥', '1329357935', '2018-12-06', '青岛', '唯美浪漫', '1544104868', '0', null, '已审核');
INSERT INTO `t_custom` VALUES ('2', '1', '微心婚礼策划有限责任公司', '周薇薇', '152010646810', '2018-12-22', '青岛', '清新森系', '1544105792', '1', '1548164034', '已审核');

-- ----------------------------
-- Table structure for t_invoice
-- ----------------------------
DROP TABLE IF EXISTS `t_invoice`;
CREATE TABLE `t_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `inv_amount` int(11) DEFAULT NULL COMMENT '发票金额',
  `inv_type` tinyint(2) DEFAULT NULL COMMENT '发票类型 1：增值税普通发票（电子版） 2：增值税普通发票 3：增值税专业发票',
  `inv_title` varchar(255) DEFAULT NULL COMMENT '发票名称',
  `inv_code` varchar(255) DEFAULT NULL COMMENT '纳税人识别号',
  `inv_rec_email` varchar(255) DEFAULT NULL COMMENT '收票的邮箱',
  `inv_rec_phone` varchar(20) DEFAULT NULL COMMENT '收票的联系电话',
  `inv_rec_address` varchar(255) DEFAULT NULL COMMENT '收票地址',
  `inv_com_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `inv_com_address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `inv_com_phone` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `inv_com_bank` varchar(255) DEFAULT NULL COMMENT '公司开户行',
  `inv_com_account` varchar(255) DEFAULT NULL COMMENT '公司账户',
  `inv_state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '发票状态 0：正常 1：失效',
  `del_state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态 0：正常 1：失效',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `end_time` int(11) DEFAULT NULL COMMENT '开票时间',
  `del_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发票记录表';

-- ----------------------------
-- Records of t_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0：正常 1：失效',
  `add_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='通知模板表';

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '一刻钟欢迎您', '一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。', '0', '1547092972');
INSERT INTO `t_notice` VALUES ('2', '完善一刻钟个人信息', '请您完善个人信息，利于平台的使用，谢谢~', '0', '1547092982');
INSERT INTO `t_notice` VALUES ('3', '一刻钟欢迎您', '一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。', '0', '1547092972');
INSERT INTO `t_notice` VALUES ('4', '一刻钟欢迎您', '一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。', '0', '1547092972');
INSERT INTO `t_notice` VALUES ('5', '一刻钟欢迎您', '一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。', '0', '1547092972');
INSERT INTO `t_notice` VALUES ('6', '一刻钟欢迎您', '一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。', '0', '1547092972');
INSERT INTO `t_notice` VALUES ('7', '一刻钟欢迎您', '一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。', '0', '1547092972');
INSERT INTO `t_notice` VALUES ('8', '一刻钟欢迎您', '一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。', '1', '1547092972');
INSERT INTO `t_notice` VALUES ('9', '一刻钟欢迎您', '一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。', '1', '1547092972');
INSERT INTO `t_notice` VALUES ('10', '我是白哦提', '我是内容1111', '1', '1548208063');
INSERT INTO `t_notice` VALUES ('11', '我是大标题', '我是内容2222', '0', '1548208128');
INSERT INTO `t_notice` VALUES ('12', '我是标题1111', '我是内容33333', '0', '1548208230');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `order_sn` varchar(100) DEFAULT NULL COMMENT '订单号',
  `pay_sn` varchar(100) DEFAULT NULL COMMENT '支付单号',
  `pay_type` tinyint(2) DEFAULT NULL COMMENT '支付类型 1：微信支付 2：支付宝',
  `trade_no` varchar(100) DEFAULT NULL COMMENT '对外交易单号',
  `order_content` varchar(255) DEFAULT NULL COMMENT '订单内容',
  `order_amount` int(11) DEFAULT NULL COMMENT '订单总金额',
  `order_state` tinyint(2) DEFAULT NULL COMMENT '订单状态 0：已取消 10：未支付 20：已支付',
  `del_state` tinyint(2) DEFAULT NULL COMMENT '删除状态',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `del_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_quote
-- ----------------------------
DROP TABLE IF EXISTS `t_quote`;
CREATE TABLE `t_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_id` int(11) DEFAULT NULL COMMENT '作品ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `provider` varchar(100) DEFAULT NULL COMMENT '提供方',
  `area` varchar(100) DEFAULT NULL COMMENT '地区',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `amount` int(11) DEFAULT '0' COMMENT '总报价',
  `like_num` int(11) DEFAULT '0' COMMENT '喜欢的计数',
  `not_like_num` int(11) DEFAULT '0' COMMENT '不喜欢的计数',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='报价清单';

-- ----------------------------
-- Records of t_quote
-- ----------------------------
INSERT INTO `t_quote` VALUES ('1', '1', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '528', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('2', '1', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('3', '1', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('4', '1', '0', '爱情婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('5', '1', '0', '甜美婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('6', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('7', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('8', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('9', '3', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('10', '3', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('11', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('12', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('13', '1', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('14', '1', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('15', '4', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('16', '5', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('17', '4', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('18', '1', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('19', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('20', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('21', '3', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('22', '3', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('23', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('24', '2', '0', '幸福婚礼策划公司', '青岛', '0532-6318556', '6000', '526', '12', '1546398053');
INSERT INTO `t_quote` VALUES ('25', '1', '2', '青岛紫水晶婚礼策划有限公司', '青岛', '18854262122', '5800', '0', '0', '1547005233');
INSERT INTO `t_quote` VALUES ('26', '1', '2', '青岛紫水晶婚礼策划有限公司', '青岛', '18854262122', '5800', '0', '0', '1547005521');
INSERT INTO `t_quote` VALUES ('27', '1', '2', '青岛紫水晶婚礼策划有限公司', '青岛', '18854262122', '5800', '0', '0', '1547005979');
INSERT INTO `t_quote` VALUES ('28', '1', '2', '青岛紫水晶婚礼策划有限公司', '青岛', '18854262122', '4700', '0', '0', '1547011352');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='报价清单详情';

-- ----------------------------
-- Records of t_quote_detail
-- ----------------------------
INSERT INTO `t_quote_detail` VALUES ('1', '绢花', '1000', '700.00', '1', '1');
INSERT INTO `t_quote_detail` VALUES ('2', '路引', '12', '2300.00', '1', '1');
INSERT INTO `t_quote_detail` VALUES ('3', '梯台', '1', '1000.00', '1', '1');
INSERT INTO `t_quote_detail` VALUES ('4', '技术人员', '2', '500.00', '2', '1');
INSERT INTO `t_quote_detail` VALUES ('5', '皮卡', '1', '500.00', '4', '1');
INSERT INTO `t_quote_detail` VALUES ('6', 'EP8000型', '2', '1000.00', '3', '1');
INSERT INTO `t_quote_detail` VALUES ('7', '绢花', '1000', '700.00', '1', '2');
INSERT INTO `t_quote_detail` VALUES ('8', '路引', '12', '2300.00', '1', '2');
INSERT INTO `t_quote_detail` VALUES ('9', '梯台', '1', '1000.00', '1', '2');
INSERT INTO `t_quote_detail` VALUES ('10', '技术人员', '2', '500.00', '2', '2');
INSERT INTO `t_quote_detail` VALUES ('11', '皮卡', '1', '500.00', '4', '2');
INSERT INTO `t_quote_detail` VALUES ('12', 'EP8000型', '2', '1000.00', '3', '2');
INSERT INTO `t_quote_detail` VALUES ('13', '绢花', '1000', '700.00', '1', '3');
INSERT INTO `t_quote_detail` VALUES ('14', '路引', '12', '2300.00', '1', '3');
INSERT INTO `t_quote_detail` VALUES ('15', '梯台', '1', '1000.00', '1', '3');
INSERT INTO `t_quote_detail` VALUES ('16', '技术人员', '2', '500.00', '2', '3');
INSERT INTO `t_quote_detail` VALUES ('17', '皮卡', '1', '500.00', '4', '3');
INSERT INTO `t_quote_detail` VALUES ('18', 'EP8000型', '2', '1000.00', '3', '3');
INSERT INTO `t_quote_detail` VALUES ('19', '绢花', '1000', '700.00', '1', '4');
INSERT INTO `t_quote_detail` VALUES ('20', '路引', '12', '2300.00', '1', '4');
INSERT INTO `t_quote_detail` VALUES ('21', '梯台', '1', '1000.00', '1', '4');
INSERT INTO `t_quote_detail` VALUES ('22', '技术人员', '2', '500.00', '2', '4');
INSERT INTO `t_quote_detail` VALUES ('23', '皮卡', '1', '500.00', '4', '4');
INSERT INTO `t_quote_detail` VALUES ('24', 'EP8000型', '2', '1000.00', '3', '4');
INSERT INTO `t_quote_detail` VALUES ('25', '绢花', '1000', '800.00', '1', '25');
INSERT INTO `t_quote_detail` VALUES ('26', '路引', '10', '2000.00', '1', '25');
INSERT INTO `t_quote_detail` VALUES ('27', '梯台', '1', '1000.00', '1', '25');
INSERT INTO `t_quote_detail` VALUES ('28', '技术', '2', '500.00', '2', '25');
INSERT INTO `t_quote_detail` VALUES ('32', '皮卡', '1', '500.00', '4', '25');
INSERT INTO `t_quote_detail` VALUES ('33', '绢花', '1000', '800.00', '1', '26');
INSERT INTO `t_quote_detail` VALUES ('34', '路引', '10', '2000.00', '1', '26');
INSERT INTO `t_quote_detail` VALUES ('35', '梯台', '1', '1000.00', '1', '26');
INSERT INTO `t_quote_detail` VALUES ('36', '技术', '2', '500.00', '2', '26');
INSERT INTO `t_quote_detail` VALUES ('40', '奔驰', '1', '500.00', '4', '26');
INSERT INTO `t_quote_detail` VALUES ('41', '绢花', '1000', '800.00', '1', '27');
INSERT INTO `t_quote_detail` VALUES ('42', '路引', '10', '2000.00', '1', '27');
INSERT INTO `t_quote_detail` VALUES ('43', '梯台', '1', '1000.00', '1', '27');
INSERT INTO `t_quote_detail` VALUES ('44', '技术', '2', '500.00', '2', '27');
INSERT INTO `t_quote_detail` VALUES ('45', 'EP1000型', '2', '1000.00', '3', '27');
INSERT INTO `t_quote_detail` VALUES ('46', '奔驰', '1', '500.00', '4', '27');
INSERT INTO `t_quote_detail` VALUES ('47', '绢花', '500', '300.00', '1', '28');
INSERT INTO `t_quote_detail` VALUES ('48', '桌布', '30', '100.00', '1', '28');
INSERT INTO `t_quote_detail` VALUES ('49', '梯台', '1', '1000.00', '1', '28');
INSERT INTO `t_quote_detail` VALUES ('50', '技术', '1', '300.00', '2', '28');
INSERT INTO `t_quote_detail` VALUES ('51', '闪光灯', '20', '1000.00', '3', '28');
INSERT INTO `t_quote_detail` VALUES ('52', '宝马', '5', '2000.00', '4', '28');

-- ----------------------------
-- Table structure for t_recharge
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(11,2) DEFAULT NULL COMMENT '价格',
  `expire_time` int(11) DEFAULT NULL COMMENT '有效时间  正整数',
  `time_type` char(2) DEFAULT NULL COMMENT '时间类型 年月日时分',
  `expire_timestamp` int(11) DEFAULT NULL COMMENT '有效时间戳',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0：正常 1：失效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='充值套餐表';

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('1', '0.01', '6', 'm', '15552000', '0');
INSERT INTO `t_recharge` VALUES ('2', '2.00', '12', 'm', '31104000', '0');
INSERT INTO `t_recharge` VALUES ('3', '3.00', '24', 'm', '62208000', '0');

-- ----------------------------
-- Table structure for t_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_setting`;
CREATE TABLE `t_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '配置参数',
  `name` varchar(255) DEFAULT NULL COMMENT '配置名称',
  `content` text COMMENT '配置内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_setting
-- ----------------------------
INSERT INTO `t_setting` VALUES ('1', 'ABOUT_US', '关于我们', '&lt;p class=&quot;MsoNormal&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;一刻钟婚礼全景网www.hunli720.com&lt;font face=&quot;宋体&quot;&gt;是由青岛云视拓智能科技有限公司开发的一款为婚礼策划人服务的网络全景平台。一刻钟迎合“互联网&lt;/font&gt;&lt;font face=&quot;Calibri&quot;&gt;+&lt;/font&gt;&lt;font face=&quot;宋体&quot;&gt;”发展模式，积极响应国家大众创业万众创新的号召，采用当下科技前沿的全景图片处理和展示技术，整合婚礼策划行业的各类资源，为辛苦奋斗在婚礼婚庆一线的策划师提供一个界面更加友好的，可交互的，具有科技感的婚庆策划案例共享平台。&lt;/font&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;font face=&quot;宋体&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;font face=&quot;宋体&quot;&gt;&amp;nbsp; 一刻钟婚礼全景网本着全心全意为婚庆策划师服务的宗旨，通过全景对婚礼现场的真实再现，让新人更加明确婚庆场布的定位，力求在&lt;/font&gt;“一刻钟”的时间内迅速锁定喜欢的场布类型，协助婚庆策划师快速成单，提高成单率，有效降低客户投诉率，改善客户关系。&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;一刻钟未来会给用户带来更丰富的功能和福利，我们希望一刻钟用户可以永远留在一刻钟平台，共同完善和发展婚礼婚庆行业，这需要我们每一个婚礼人的共同努力，希望一刻钟能与您一起，风雨同舟，砥砺前行，共创美好未来。&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;我们的目标是：打造中国最专业的婚庆服务平台。&lt;/p&gt;');
INSERT INTO `t_setting` VALUES ('2', 'CONTACT_US', '联系我们', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;青岛云视拓智能科技有限公司&lt;/span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;&lt;font face=&quot;宋体&quot;&gt;客服热线&lt;/font&gt; 400-083-9798&lt;font face=&quot;宋体&quot;&gt;（周一至周五&lt;/font&gt;&lt;font face=&quot;Calibri&quot;&gt;9:00-18:00&lt;/font&gt;&lt;font face=&quot;宋体&quot;&gt;）&lt;/font&gt;&lt;/span&gt;&lt;span&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;网站备案号：&lt;/span&gt;&lt;span&gt;&lt;font face=&quot;Tahoma&quot;&gt;鲁&lt;/font&gt;ICP备18057238号-&lt;/span&gt;&lt;span&gt;1&lt;/span&gt;&lt;span&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;若您发现您的权利被侵害，请及时与我们联系。&lt;/span&gt;&lt;span&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span&gt;&lt;font face=&quot;Tahoma&quot;&gt;腾讯&lt;/font&gt;QQ807372687 &amp;nbsp;&amp;nbsp;&amp;nbsp;邮箱807374687@qq.com&lt;/span&gt;&lt;span&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `t_setting` VALUES ('3', 'AGREEMENT', '服务协议', null);
INSERT INTO `t_setting` VALUES ('4', 'PRIVACY_POLICY', '隐私政策', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='短信记录表';

-- ----------------------------
-- Records of t_sms_log
-- ----------------------------
INSERT INTO `t_sms_log` VALUES ('1', '18854262122', '660924', '1', '1544273052', '0');
INSERT INTO `t_sms_log` VALUES ('2', '18854262122', '127425', '2', '1544275155', '0');
INSERT INTO `t_sms_log` VALUES ('3', '18854262122', '984490', '1', '1546505108', '0');
INSERT INTO `t_sms_log` VALUES ('4', '18854262122', '514213', '1', '1546578767', '0');
INSERT INTO `t_sms_log` VALUES ('5', '18854262122', '531670', '1', '1546579897', '1');
INSERT INTO `t_sms_log` VALUES ('6', '18854262122', '592704', '1', '1546582801', '0');
INSERT INTO `t_sms_log` VALUES ('7', '18854262122', '981891', '1', '1546931292', '0');
INSERT INTO `t_sms_log` VALUES ('8', '18854262122', '818174', '2', '1547299711', '0');
INSERT INTO `t_sms_log` VALUES ('9', '18854262122', '378437', '2', '1547299716', '0');
INSERT INTO `t_sms_log` VALUES ('10', '18854262122', '923760', '2', '1547302768', '1');

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
  `sys_theme` tinyint(2) NOT NULL DEFAULT '0' COMMENT '系统主题',
  `del_state` tinyint(1) DEFAULT NULL COMMENT '是否停用 0否1是',
  `add_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `end_time` int(11) DEFAULT NULL COMMENT 'VIP到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'YKZ12024543181486', '13295357935', 'e10adc3949ba59abbe56e057f20f883e', '一刻钟智能科技有限公司', null, null, null, null, null, null, '0', '0', '1543745431', '1546583826', null);
INSERT INTO `t_user` VALUES ('2', 'YKZ01047990728991', '18854262122', '96e79218965eb72c92a549dd5a330112', '青岛紫水晶婚礼策划有限公司', '2.png', '做青岛地区最专业的婚礼策划公司', null, null, null, '山东省青岛市李沧区', '2', '0', '1546579907', null, '1555737554');
INSERT INTO `t_user` VALUES ('3', 'YKZ12024543181486', '13295357931', 'e10adc3949ba59abbe56e057f20f883e', '一刻钟智能科技有限公司', null, null, null, null, null, null, '0', '1', '1543745431', '1546583826', null);
INSERT INTO `t_user` VALUES ('4', 'YKZ01047990728991', '18854262121', '96e79218965eb72c92a549dd5a330112', '青岛紫水晶婚礼策划有限公司', '2.png', '做青岛地区最专业的婚礼策划公司', null, null, null, '山东省青岛市李沧区', '5', '1', '1546579907', null, null);
INSERT INTO `t_user` VALUES ('5', 'YKZ12024543181486', '13295357932', 'e10adc3949ba59abbe56e057f20f883e', '一刻钟智能科技有限公司', null, null, null, null, null, null, '0', '1', '1543745431', '1546583826', null);
INSERT INTO `t_user` VALUES ('6', 'YKZ01047990728991', '18854262120', '96e79218965eb72c92a549dd5a330112', '青岛紫水晶婚礼策划有限公司', '2.png', '做青岛地区最专业的婚礼策划公司', null, null, null, '山东省青岛市李沧区', '5', '0', '1546579907', null, null);
INSERT INTO `t_user` VALUES ('7', 'YKZ12024543181486', '13295357933', 'e10adc3949ba59abbe56e057f20f883e', '一刻钟智能科技有限公司', null, null, null, null, null, null, '0', '0', '1543745431', '1546583826', null);
INSERT INTO `t_user` VALUES ('8', 'YKZ01047990728991', '18854262123', '96e79218965eb72c92a549dd5a330112', '青岛紫水晶婚礼策划有限公司', '2.png', '做青岛地区最专业的婚礼策划公司', null, null, null, '山东省青岛市李沧区', '5', '0', '1546579907', null, null);
INSERT INTO `t_user` VALUES ('9', 'YKZ12024543181486', '13295357989', 'e10adc3949ba59abbe56e057f20f883e', '一刻钟智能科技有限公司', null, null, null, null, null, null, '0', '0', '1543745431', '1546583826', null);
INSERT INTO `t_user` VALUES ('10', 'YKZ01047990728991', '18854262133', '96e79218965eb72c92a549dd5a330112', '青岛紫水晶婚礼策划有限公司', '2.png', '做青岛地区最专业的婚礼策划公司', null, null, null, '山东省青岛市李沧区', '5', '0', '1546579907', null, null);
INSERT INTO `t_user` VALUES ('11', 'YKZ12024543181486', '13295357777', 'e10adc3949ba59abbe56e057f20f883e', '一刻钟智能科技有限公司', null, null, null, null, null, null, '0', '0', '1543745431', '1546583826', null);
INSERT INTO `t_user` VALUES ('12', 'YKZ01047990728991', '18854262124', '96e79218965eb72c92a549dd5a330112', '青岛紫水晶婚礼策划有限公司', '2.png', '做青岛地区最专业的婚礼策划公司', null, null, null, '山东省青岛市李沧区', '5', '0', '1546579907', null, null);
INSERT INTO `t_user` VALUES ('13', 'YKZ12024543181486', '13295357936', 'e10adc3949ba59abbe56e057f20f883e', '一刻钟智能科技有限公司', null, null, null, null, null, null, '0', '0', '1543745431', '1546583826', null);
INSERT INTO `t_user` VALUES ('14', 'YKZ01047990728991', '18854262126', '96e79218965eb72c92a549dd5a330112', '青岛紫水晶婚礼策划有限公司', '2.png', '做青岛地区最专业的婚礼策划公司', null, null, null, '山东省青岛市李沧区', '5', '0', '1546579907', null, null);
INSERT INTO `t_user` VALUES ('15', 'YKZ12024543181486', '13295357939', 'e10adc3949ba59abbe56e057f20f883e', '一刻钟智能科技有限公司', null, null, null, null, null, null, '0', '0', '1543745431', '1546583826', null);
INSERT INTO `t_user` VALUES ('16', 'YKZ01047990728991', '18854262155', '96e79218965eb72c92a549dd5a330112', '青岛紫水晶婚礼策划有限公司', '2.png', '做青岛地区最专业的婚礼策划公司', null, null, null, '山东省青岛市李沧区', '5', '0', '1546579907', null, null);

-- ----------------------------
-- Table structure for t_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_user_notice`;
CREATE TABLE `t_user_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `notice_id` int(11) DEFAULT NULL COMMENT '通知ID',
  `read_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '读取的状态 0：未读 1：已读',
  `read_time` int(11) DEFAULT NULL COMMENT '读取时间',
  `del_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态 0：正常 1：失效',
  `del_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户通知表';

-- ----------------------------
-- Records of t_user_notice
-- ----------------------------
INSERT INTO `t_user_notice` VALUES ('1', '2', '1', '0', null, '1', '1547178407');
INSERT INTO `t_user_notice` VALUES ('2', '2', '1', '0', null, '1', '1547178439');
INSERT INTO `t_user_notice` VALUES ('3', '2', '1', '0', null, '0', null);
INSERT INTO `t_user_notice` VALUES ('4', '2', '1', '0', null, '0', null);
INSERT INTO `t_user_notice` VALUES ('5', '2', '1', '0', null, '0', null);
INSERT INTO `t_user_notice` VALUES ('6', '2', '1', '0', null, '0', null);
INSERT INTO `t_user_notice` VALUES ('7', '2', '1', '0', null, '1', '1547178528');
INSERT INTO `t_user_notice` VALUES ('8', '2', '1', '0', null, '1', '1547178477');
INSERT INTO `t_user_notice` VALUES ('9', '2', '1', '0', null, '1', '1547178458');

-- ----------------------------
-- Table structure for t_vr
-- ----------------------------
DROP TABLE IF EXISTS `t_vr`;
CREATE TABLE `t_vr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_code` varchar(50) DEFAULT NULL COMMENT '编号',
  `vr_src` varchar(128) DEFAULT NULL COMMENT '链接',
  `vr_thumb` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `type_id` int(2) DEFAULT NULL COMMENT '类型',
  `description` text COMMENT '描述',
  `quote` text COMMENT '清单',
  `tag` tinyint(1) DEFAULT NULL COMMENT '标签 1：推荐 2：热门 3：最新',
  `view_count` int(11) DEFAULT NULL COMMENT '查看数量',
  `popular` int(11) NOT NULL DEFAULT '0' COMMENT '人气值',
  `min_price` int(10) DEFAULT NULL COMMENT '最低报价',
  `max_price` int(10) DEFAULT NULL COMMENT '最高报价',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0：正常 1：失效',
  PRIMARY KEY (`id`),
  KEY `pk_vr_type` (`type_id`),
  CONSTRAINT `pk_vr_type` FOREIGN KEY (`type_id`) REFERENCES `t_vr_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='VR表';

-- ----------------------------
-- Records of t_vr
-- ----------------------------
INSERT INTO `t_vr` VALUES ('1', 'DY001', 'http://vr.hunli720.com/member/preview/view/pano_id/3', 'DY001.png', '浪漫满园1', '1', '这场红金色婚礼，隆重而又浪漫，热情而不失优雅。在众多的婚礼风格中，红金复古风是欧式风格婚礼中永恒的经典，整场运用炙热的暗红色搭配华丽的金属色，使整场婚礼奠定了明快的视觉冲击，让宾客仿佛置身于欧式的古堡之中。外场采用欧式花纹背板搭配红色挑高花艺，使整体视觉具有空间感，内场大量铁艺造型营造金属的质感，错层摆放增加其饱满度，花艺中搭配红色花艺和绿色叶材，厚重中蕴藏柔美，舞台处狮像象征对爱情的守护与勇敢。', '&lt;p&gt;签到区：画面喷绘1套+签到桌布1套+照片摆台1套+签到用品1套。&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;展示区：画面喷绘1套+挑高花艺2组+弧形花艺2组。&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;&lt;p&gt;舞台区：画面喷绘1套+冷板2组+扇形铁艺2组+绢花花簇若干。&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/p&gt;&lt;p&gt;T台区：画面喷绘1套+罗马花盆8组+绢花花球8组。&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;细节区：主桌花2组+椅背装饰若干。&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;灯光：面光灯+追光灯+染色灯。&lt;/p&gt;', '1', '5692', '5', '2000', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('2', 'DY002', 'http://vr.hunli720.com/member/preview/view/pano_id/5', 'DY002.png', '浪漫满园2', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('3', 'DY003', 'http://vr.hunli720.com/member/preview/view/pano_id/6', 'DY003.png', '浪漫满园3', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('4', 'DY004', 'http://vr.hunli720.com/member/preview/view/pano_id/7', 'DY004.png', '浪漫满园4', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('5', 'DY005', 'http://vr.hunli720.com/member/preview/view/pano_id/8', 'DY005.png', '浪漫满园5', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('6', 'DY006', 'http://vr.hunli720.com/member/preview/view/pano_id/9', 'DY006.png', '浪漫满园6', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('7', 'DY007', 'http://vr.hunli720.com/member/preview/view/pano_id/11', 'DY007.png', '浪漫满园7', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('8', 'DY008', 'http://vr.hunli720.com/member/preview/view/pano_id/12', 'DY008.png', '浪漫满园8', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('9', 'DY009', 'http://vr.hunli720.com/member/preview/view/pano_id/13', 'DY009.png', '浪漫满园9', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('10', 'DY010', 'http://vr.hunli720.com/member/preview/view/pano_id/14', 'DY010.png', '浪漫满园10', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('11', 'DY011', 'http://vr.hunli720.com/member/preview/view/pano_id/15', 'DY011.png', '浪漫满园11', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('12', 'DY012', 'http://vr.hunli720.com/member/preview/view/pano_id/16', 'DY012.png', '浪漫满园12', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('13', 'DY013', 'http://vr.hunli720.com/member/preview/view/pano_id/17', 'DY013.png', '浪漫满园1', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('14', 'DY014', 'http://vr.hunli720.com/member/preview/view/pano_id/18', 'DY014.png', '浪漫满园2', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('15', 'DY015', 'http://vr.hunli720.com/member/preview/view/pano_id/19', 'DY015.png', '浪漫满园3', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('16', 'DY016', 'http://vr.hunli720.com/member/preview/view/pano_id/20', 'DY016.png', '浪漫满园4', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('17', 'DY017', 'http://vr.hunli720.com/member/preview/view/pano_id/21', 'DY017.png', '浪漫满园5', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('18', 'DY018', 'http://vr.hunli720.com/member/preview/view/pano_id/22', 'DY018.png', '浪漫满园6', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '1', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('19', 'DY019', 'http://vr.hunli720.com/member/preview/view/pano_id/23', 'DY019.png', '浪漫满园7', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('20', 'DY020', 'http://vr.hunli720.com/member/preview/view/pano_id/24', 'DY020.png', '浪漫满园8', '1', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('21', 'OS001', 'http://vr.hunli720.com/member/preview/view/pano_id/25', 'OS001.png', '欧式梦幻1', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('22', 'OS002', 'http://vr.hunli720.com/member/preview/view/pano_id/26', 'OS002.png', '欧式梦幻2', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('23', 'OS003', 'http://vr.hunli720.com/member/preview/view/pano_id/27', 'OS003.png', '浪漫满园11', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('24', 'OS004', 'http://vr.hunli720.com/member/preview/view/pano_id/28', 'OS004.png', '浪漫满园12', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('25', 'OS005', 'http://vr.hunli720.com/member/preview/view/pano_id/29', 'OS005.png', '浪漫满园1', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('26', 'OS006', 'http://vr.hunli720.com/member/preview/view/pano_id/30', 'OS006.png', '浪漫满园2', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('27', 'OS007', 'http://vr.hunli720.com/member/preview/view/pano_id/31', 'OS007.png', '浪漫满园3', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('28', 'OS008', 'http://vr.hunli720.com/member/preview/view/pano_id/32', 'OS008.png', '浪漫满园4', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('29', 'OS009', 'http://vr.hunli720.com/member/preview/view/pano_id/33', 'OS009.png', '浪漫满园5', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '1', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('30', 'OS010', 'http://vr.hunli720.com/member/preview/view/pano_id/34', 'OS010.png', '浪漫满园6', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('31', 'OS011', 'http://vr.hunli720.com/member/preview/view/pano_id/35', 'OS011.png', '浪漫满园7', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('32', 'OS012', 'http://vr.hunli720.com/member/preview/view/pano_id/36', 'OS012.png', '浪漫满园8', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '1', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('33', 'OS013', 'http://vr.hunli720.com/member/preview/view/pano_id/37', 'OS013.png', '浪漫满园9', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('34', 'OS014', 'http://vr.hunli720.com/member/preview/view/pano_id/38', 'OS014.png', '浪漫满园10', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('35', 'OS015', 'http://vr.hunli720.com/member/preview/view/pano_id/39', 'OS015.png', '浪漫满园11', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('36', 'OS016', 'http://vr.hunli720.com/member/preview/view/pano_id/40', 'OS016.png', '浪漫满园12', '2', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('37', 'LM001', 'http://vr.hunli720.com/member/preview/view/pano_id/42', 'LM001.png', '浪漫满园1', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '1', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('38', 'LM002', 'http://vr.hunli720.com/member/preview/view/pano_id/43', 'LM002.png', '浪漫满园2', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('39', 'LM003', 'http://vr.hunli720.com/member/preview/view/pano_id/44', 'LM003.png', '浪漫满园3', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('40', 'LM004', 'http://vr.hunli720.com/member/preview/view/pano_id/45', 'LM004.png', '浪漫满园4', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('41', 'LM005', 'http://vr.hunli720.com/member/preview/view/pano_id/46', 'LM005.png', '浪漫满园5', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('42', 'LM006', 'http://vr.hunli720.com/member/preview/view/pano_id/47', 'LM006.png', '浪漫满园6', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('43', 'LM007', 'http://vr.hunli720.com/member/preview/view/pano_id/48', 'LM007.png', '浪漫满园7', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('44', 'LM008', 'http://vr.hunli720.com/member/preview/view/pano_id/49', 'LM008.png', '浪漫满园8', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('45', 'LM009', 'http://vr.hunli720.com/member/preview/view/pano_id/50', 'LM009.png', '浪漫满园9', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('46', 'LM010', 'http://vr.hunli720.com/member/preview/view/pano_id/51', 'LM010.png', '浪漫满园10', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('47', 'LM011', 'http://vr.hunli720.com/member/preview/view/pano_id/52', 'LM011.png', '浪漫满园11', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('48', 'LM012', 'http://vr.hunli720.com/member/preview/view/pano_id/53', 'LM012.png', '浪漫满园12', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('49', 'LM013', 'http://vr.hunli720.com/member/preview/view/pano_id/54', 'LM013.png', '浪漫满园1', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('50', 'LM014', 'http://vr.hunli720.com/member/preview/view/pano_id/55', 'LM014.png', '浪漫满园2', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('51', 'LM015', 'http://vr.hunli720.com/member/preview/view/pano_id/56', 'LM015.png', '浪漫满园3', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('52', 'LM016', 'http://vr.hunli720.com/member/preview/view/pano_id/57', 'LM016.png', '浪漫满园4', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('53', 'LM017', 'http://vr.hunli720.com/member/preview/view/pano_id/58', 'LM017.png', '浪漫满园5', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('54', 'LM018', 'http://vr.hunli720.com/member/preview/view/pano_id/59', 'LM018.png', '浪漫满园6', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('55', 'LM019', 'http://vr.hunli720.com/member/preview/view/pano_id/60', 'LM019.png', '浪漫满园7', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('56', 'LM020', 'http://vr.hunli720.com/member/preview/view/pano_id/61', 'LM020.png', '浪漫满园8', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('57', 'LM021', 'http://vr.hunli720.com/member/preview/view/pano_id/62', 'LM021.png', '浪漫满园9', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('58', 'LM022', 'http://vr.hunli720.com/member/preview/view/pano_id/63', 'LM022.png', '浪漫满园10', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('59', 'LM023', 'http://vr.hunli720.com/member/preview/view/pano_id/64', 'LM023.png', '浪漫满园11', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('60', 'LM024', 'http://vr.hunli720.com/member/preview/view/pano_id/65', 'LM024.png', '浪漫满园12', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('61', 'LM025', 'http://vr.hunli720.com/member/preview/view/pano_id/66', 'LM025.png', '浪漫满园1', '3', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('62', 'QX001', 'http://vr.hunli720.com/member/preview/view/pano_id/67', 'QX001.png', '浪漫满园2', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('63', 'QX002', 'http://vr.hunli720.com/member/preview/view/pano_id/68', 'QX002.png', '浪漫满园3', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '1', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('64', 'QX003', 'http://vr.hunli720.com/member/preview/view/pano_id/69', 'QX003.png', '浪漫满园4', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('65', 'QX004', 'http://vr.hunli720.com/member/preview/view/pano_id/70', 'QX004.png', '浪漫满园5', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('66', 'QX005', 'http://vr.hunli720.com/member/preview/view/pano_id/71', 'QX005.png', '浪漫满园6', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('67', 'QX006', 'http://vr.hunli720.com/member/preview/view/pano_id/72', 'QX006.png', '浪漫满园7', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('68', 'QX007', 'http://vr.hunli720.com/member/preview/view/pano_id/73', 'QX007.png', '浪漫满园8', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('69', 'QX008', 'http://vr.hunli720.com/member/preview/view/pano_id/74', 'QX008.png', '浪漫满园9', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('70', 'QX009', 'http://vr.hunli720.com/member/preview/view/pano_id/75', 'QX009.png', '浪漫满园10', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('71', 'QX010', 'http://vr.hunli720.com/member/preview/view/pano_id/76', 'QX010.png', '浪漫满园11', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('72', 'QX011', 'http://vr.hunli720.com/member/preview/view/pano_id/77', 'QX011.png', '浪漫满园12', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('73', 'QX012', 'http://vr.hunli720.com/member/preview/view/pano_id/78', 'QX012.png', '浪漫满园1', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('74', 'QX013', 'http://vr.hunli720.com/member/preview/view/pano_id/79', 'QX013.png', '浪漫满园2', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('75', 'QX014', 'http://vr.hunli720.com/member/preview/view/pano_id/80', 'QX014.png', '浪漫满园3', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '3', '5692', '3', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('76', 'QX015', 'http://vr.hunli720.com/member/preview/view/pano_id/81', 'QX015.png', '浪漫满园4', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '1', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('77', 'QX016', 'http://vr.hunli720.com/member/preview/view/pano_id/82', 'QX016.png', '浪漫满园5', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('78', 'QX017', 'http://vr.hunli720.com/member/preview/view/pano_id/83', 'QX017.png', '浪漫满园6', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('79', 'QX018', 'http://vr.hunli720.com/member/preview/view/pano_id/84', 'QX018.png', '浪漫满园7', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '1', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('80', 'QX019', 'http://vr.hunli720.com/member/preview/view/pano_id/85', 'QX019.png', '浪漫满园8', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '1', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('81', 'QX020', 'http://vr.hunli720.com/member/preview/view/pano_id/86', 'QX020.png', '浪漫满园9', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('82', 'QX021', 'http://vr.hunli720.com/member/preview/view/pano_id/87', 'QX021.png', '浪漫满园10', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('83', 'QX022', 'http://vr.hunli720.com/member/preview/view/pano_id/88', 'QX022.png', '浪漫满园11', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('84', 'QX023', 'http://vr.hunli720.com/member/preview/view/pano_id/89', 'QX023.png', '浪漫满园12', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, '2', '5692', '5', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('85', 'QX024', 'http://vr.hunli720.com/member/preview/view/pano_id/90', 'QX024.png', '浪漫满园1', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '4', '2888', '3888', '1545979090', '0');
INSERT INTO `t_vr` VALUES ('86', 'QX025', 'http://vr.hunli720.com/member/preview/view/pano_id/91', 'QX025.png', '浪漫满园2', '4', '婚礼是人一生当中最重要的，如何让自己的婚礼既浪漫又温馨，烛光婚礼是一个不错的选择，它象征着新人们的结合，想像着婚礼正式开始时，室内的灯光渐暗，静光灯打开，当婚礼的音乐响起来，你们在摇摆不定的烛光照明下走向主台，两人手持金色的引火器，将象征你们爱情的神圣的烛光一起点燃，并许下你们的爱情宣言，烛光为证，生生世世，恩恩爱爱，共度今生。', null, null, '5692', '3', '2888', '3888', '1545979090', '0');

-- ----------------------------
-- Table structure for t_vr_type
-- ----------------------------
DROP TABLE IF EXISTS `t_vr_type`;
CREATE TABLE `t_vr_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL COMMENT 'vr类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='VR风格表';

-- ----------------------------
-- Records of t_vr_type
-- ----------------------------
INSERT INTO `t_vr_type` VALUES ('1', '喜庆典雅');
INSERT INTO `t_vr_type` VALUES ('2', '欧式梦幻');
INSERT INTO `t_vr_type` VALUES ('3', '唯美浪漫');
INSERT INTO `t_vr_type` VALUES ('4', '森系清新');
SET FOREIGN_KEY_CHECKS=1;
