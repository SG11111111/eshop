/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : onlineshop_db

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2023-03-21 22:35:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `addr` text,
  `delstatus` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO address VALUES ('2', '11', '13897091122', '11', '1', '8');
INSERT INTO address VALUES ('6', '陈晨', '13098711223', '金地中心城88号', '0', '9');
INSERT INTO address VALUES ('7', '项国华', '13908761122', '金地中心城112号', '0', '10');
INSERT INTO address VALUES ('8', '张三', '13022335566', '北京', '0', '13');
INSERT INTO address VALUES ('9', '1111', '15295060795', '江苏省苏州市', '0', '14');
INSERT INTO address VALUES ('10', 'qqqq', '15295060795', '江苏省苏州市', '0', '15');
INSERT INTO address VALUES ('11', 'gg', '15295060799', '江苏省苏州市', '0', '17');
INSERT INTO address VALUES ('12', 'GG', '15295060799', '江苏省苏州市', '0', '19');
INSERT INTO address VALUES ('13', 'gg', '15295060795', '江苏省苏州市', '0', '21');
INSERT INTO address VALUES ('14', 'gg', '15295060795', 'deguo', '0', '21');
INSERT INTO address VALUES ('15', 'gg', '15295060795', '江苏省苏州市', '0', '8');
INSERT INTO address VALUES ('16', 'gg', '15295060795', 'deguo', '0', '8');
INSERT INTO address VALUES ('17', 'GG', '15295060795', '江苏省苏州市', '0', '23');

-- ----------------------------
-- Table structure for `backproduct`
-- ----------------------------
DROP TABLE IF EXISTS `backproduct`;
CREATE TABLE `backproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `content` text,
  `shstatus` varchar(255) DEFAULT NULL,
  `savetime` datetime DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backproduct
-- ----------------------------
INSERT INTO backproduct VALUES ('1', '8', '5', '买错了', '已退货', '2023-02-12 20:03:23', '14');
INSERT INTO backproduct VALUES ('2', '8', '6', '买错了', '已拒绝', '2023-02-12 20:04:29', '23');
INSERT INTO backproduct VALUES ('3', '14', '5', '不喜欢', '已退货', '2023-02-13 00:05:10', '20');
INSERT INTO backproduct VALUES ('4', '8', '5', 'buyaol', '已退货', '2023-02-13 10:59:49', '28');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` varchar(255) DEFAULT NULL,
  `productid` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO cart VALUES ('1', '18', '6', '2');
INSERT INTO cart VALUES ('3', '14', '6', '1');
INSERT INTO cart VALUES ('4', '21', '6', '1');
INSERT INTO cart VALUES ('6', '8', '6', '1');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fatherid` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO category VALUES ('1', '特色植物', '0', '0');
INSERT INTO category VALUES ('2', '特色水果', '1', '0');
INSERT INTO category VALUES ('3', '特色美食', '0', '0');
INSERT INTO category VALUES ('4', '特色鱼类', '3', '0');
INSERT INTO category VALUES ('5', '特色畜牧', '3', '0');
INSERT INTO category VALUES ('6', '特色饮料', '0', '0');
INSERT INTO category VALUES ('7', '特色牛奶', '6', '0');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` varchar(255) DEFAULT NULL,
  `productid` varchar(255) DEFAULT NULL,
  `pf` int(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO comment VALUES ('2', '8', '5', '4', 'aaa');
INSERT INTO comment VALUES ('3', '8', '5', '4', 'dddd');
INSERT INTO comment VALUES ('4', '8', '5', '5', 'SSSSS');
INSERT INTO comment VALUES ('5', '14', '6', '5', 'ddddd');
INSERT INTO comment VALUES ('6', '14', '6', '4', 'aaaa');
INSERT INTO comment VALUES ('7', '14', '6', '4', 'ddddddddddddddddddd');
INSERT INTO comment VALUES ('8', '8', '1', '5', 'ddd');

-- ----------------------------
-- Table structure for `dingdan`
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `savetime` datetime DEFAULT NULL,
  `fkfs` varchar(255) DEFAULT NULL,
  `shrname` varchar(255) DEFAULT NULL,
  `zffs` varchar(255) DEFAULT NULL,
  `shraddr` text,
  `fkstatus` varchar(255) DEFAULT NULL,
  `fhstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO dingdan VALUES ('16', '123643', '15', '12.0', '2023-02-09 13:49:08', '当前支付', null, null, '江苏省苏州市  qqqq  15295060795', '待付款', '未发货');
INSERT INTO dingdan VALUES ('19', '797299', '14', '468.0', '2023-02-12 16:42:31', '当前支付', null, '支付宝', '江苏省苏州市  1111  15295060795', '已付款', '交易完成');
INSERT INTO dingdan VALUES ('20', '976009', '17', '48.0', '2023-02-12 16:56:18', '当前支付', null, '微信', '江苏省苏州市  gg  15295060799', '已付款', '交易完成');
INSERT INTO dingdan VALUES ('21', '200987', '17', '12.0', '2023-02-12 19:54:40', '当前支付', null, '支付宝', '江苏省苏州市  gg  15295060799', '已退款', '已取消');
INSERT INTO dingdan VALUES ('24', '948373', '17', '9388.8', '2023-02-12 23:09:47', '当前支付', null, '支付宝', '江苏省苏州市  gg  15295060799', '已付款', '已发货');
INSERT INTO dingdan VALUES ('25', '546086', '19', '234.0', '2023-02-13 10:34:55', '当前支付', null, '微信', '江苏省苏州市  GG  15295060799', '已付款', '已发货');
INSERT INTO dingdan VALUES ('27', '690328', '21', '234.0', '2023-02-28 13:35:06', '当前支付', null, null, '江苏省苏州市  gg  15295060795', '待付款', '未发货');
INSERT INTO dingdan VALUES ('28', '495602', '14', '18.0', '2023-03-06 23:27:21', '当前支付', null, '支付宝', '江苏省苏州市  1111  15295060795', '已退款', '已取消');
INSERT INTO dingdan VALUES ('29', '633082', '8', '555.68', '2023-03-14 11:37:13', '当前支付', null, '支付宝', 'deguo  gg  15295060795', '已付款', '已发货');
INSERT INTO dingdan VALUES ('30', '129120', '23', '18.0', '2023-03-21 14:29:30', '当前支付', null, '支付宝', '江苏省苏州市  GG  15295060795', '已付款', '已发货');

-- ----------------------------
-- Table structure for `dingdanmsg`
-- ----------------------------
DROP TABLE IF EXISTS `dingdanmsg`;
CREATE TABLE `dingdanmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `productid` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `xjtotal` double(255,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `savetime` datetime DEFAULT NULL,
  `thstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdanmsg
-- ----------------------------
INSERT INTO dingdanmsg VALUES ('1', '796411', '8', '6', '1', '32.00', '已发货', '2022-03-10 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('2', '591996', '8', '6', '1', '32.00', '已发货', '2022-03-10 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('3', '906051', '8', '4', '1', '102.40', '已发货', '2022-03-10 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('4', '584719', '8', '6', '1', '32.00', '未发货', '2022-03-15 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('5', '675309', '9', '6', '1', '40.00', '已发货', '2022-04-20 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('6', '842707', '8', '6', '1', '30.40', '未发货', '2023-02-06 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('7', '227606', '14', '3', '2', '57.60', '未发货', '2023-02-06 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('8', '303645', '14', '5', '5', '940.00', '未发货', '2023-02-08 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('9', '303645', '14', '6', '1', '38.00', '未发货', '2023-02-08 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('10', '006460', '14', '6', '3', '114.00', '已发货', '2023-02-08 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('11', '468176', '8', '6', '3', '91.20', '未发货', '2023-02-08 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('12', '383164', '14', '5', '4', '752.00', '已发货', '2023-02-08 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('13', '057702', '8', '6', '5', '152.00', '未发货', '2023-02-08 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('14', '766254', '8', '5', '1', '150.40', '已发货', '2023-02-08 00:00:00', '已退货');
INSERT INTO dingdanmsg VALUES ('15', '108388', '8', '5', '2', '300.80', '已发货', '2023-02-08 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('16', '443818', '8', '5', '3', '451.20', '已发货', '2023-02-08 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('17', '123643', '15', '6', '1', '12.00', '未发货', '2023-02-09 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('18', '530433', '14', '6', '5', '60.00', '已发货', '2023-02-09 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('19', '901237', '8', '4', '9', '921.60', '已发货', '2023-02-09 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('20', '797299', '14', '5', '2', '468.00', '已发货', '2023-02-12 00:00:00', '已退货');
INSERT INTO dingdanmsg VALUES ('21', '976009', '17', '6', '4', '48.00', '已发货', '2023-02-12 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('22', '200987', '17', '6', '1', '12.00', '已发货', '2023-02-12 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('23', '704862', '8', '6', '1', '9.60', '已发货', '2023-02-12 00:00:00', '拒绝退货');
INSERT INTO dingdanmsg VALUES ('24', '728930', '8', '6', '1', '9.60', '已发货', '2023-02-12 00:00:00', '可退货');
INSERT INTO dingdanmsg VALUES ('25', '948373', '17', '3', '1', '28.80', '已发货', '2023-02-12 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('26', '948373', '17', '5', '40', '9360.00', '已发货', '2023-02-12 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('27', '546086', '19', '5', '1', '234.00', '已发货', '2023-02-13 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('28', '416991', '8', '5', '5', '936.00', '已发货', '2023-02-13 00:00:00', '已退货');
INSERT INTO dingdanmsg VALUES ('29', '690328', '21', '5', '1', '234.00', '未发货', '2023-02-28 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('30', '495602', '14', '6', '1', '18.00', '未发货', '2023-03-06 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('31', '633082', '8', '1', '34', '541.28', '已发货', '2023-03-14 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('32', '633082', '8', '6', '1', '14.40', '已发货', '2023-03-14 00:00:00', null);
INSERT INTO dingdanmsg VALUES ('33', '129120', '23', '6', '1', '18.00', '已发货', '2023-03-21 00:00:00', null);

-- ----------------------------
-- Table structure for `fav`
-- ----------------------------
DROP TABLE IF EXISTS `fav`;
CREATE TABLE `fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` varchar(255) DEFAULT NULL,
  `productid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fav
-- ----------------------------
INSERT INTO fav VALUES ('2', '13', '40');
INSERT INTO fav VALUES ('4', '9', '6');
INSERT INTO fav VALUES ('5', '17', '6');
INSERT INTO fav VALUES ('6', '18', '6');
INSERT INTO fav VALUES ('7', '19', '4');
INSERT INTO fav VALUES ('8', '8', '5');
INSERT INTO fav VALUES ('9', '8', '4');
INSERT INTO fav VALUES ('10', '21', '3');

-- ----------------------------
-- Table structure for `imgadv`
-- ----------------------------
DROP TABLE IF EXISTS `imgadv`;
CREATE TABLE `imgadv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgadv
-- ----------------------------
INSERT INTO imgadv VALUES ('4', '1646901399157.jpeg');
INSERT INTO imgadv VALUES ('5', '1646901407551.jpeg');

-- ----------------------------
-- Table structure for `inventory`
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO inventory VALUES ('1', '25', '10', 'in');
INSERT INTO inventory VALUES ('2', '24', '10', 'in');
INSERT INTO inventory VALUES ('3', '23', '10', 'in');
INSERT INTO inventory VALUES ('4', '22', '10', 'in');
INSERT INTO inventory VALUES ('5', '21', '10', 'in');
INSERT INTO inventory VALUES ('6', '23', '1', 'out');
INSERT INTO inventory VALUES ('7', '24', '1', 'out');
INSERT INTO inventory VALUES ('8', '22', '2', 'out');
INSERT INTO inventory VALUES ('9', '22', '1', 'out');
INSERT INTO inventory VALUES ('10', '22', '1', 'out');
INSERT INTO inventory VALUES ('11', '22', '1', 'out');
INSERT INTO inventory VALUES ('12', '22', '1', 'out');
INSERT INTO inventory VALUES ('13', '22', '1', 'in');
INSERT INTO inventory VALUES ('14', '22', '1', 'in');
INSERT INTO inventory VALUES ('15', '22', '2', 'out');
INSERT INTO inventory VALUES ('16', '22', '2', 'in');
INSERT INTO inventory VALUES ('17', '25', '1', 'out');
INSERT INTO inventory VALUES ('18', '25', '1', 'out');
INSERT INTO inventory VALUES ('19', '28', '10', 'in');
INSERT INTO inventory VALUES ('20', '27', '10', 'in');
INSERT INTO inventory VALUES ('21', '27', '1', 'out');
INSERT INTO inventory VALUES ('22', '28', '2', 'out');
INSERT INTO inventory VALUES ('23', '25', '1', 'in');
INSERT INTO inventory VALUES ('24', '22', '1', 'out');
INSERT INTO inventory VALUES ('25', '22', '1', 'out');
INSERT INTO inventory VALUES ('26', '22', '1', 'out');
INSERT INTO inventory VALUES ('27', '22', '1', 'out');
INSERT INTO inventory VALUES ('28', '22', '1', 'out');
INSERT INTO inventory VALUES ('29', '25', '1', 'out');
INSERT INTO inventory VALUES ('30', '25', '1', 'out');
INSERT INTO inventory VALUES ('31', '22', '1', 'out');
INSERT INTO inventory VALUES ('32', '46', '10', 'in');
INSERT INTO inventory VALUES ('33', '45', '10', 'in');
INSERT INTO inventory VALUES ('34', '44', '22', 'in');
INSERT INTO inventory VALUES ('35', '43', '22', 'in');
INSERT INTO inventory VALUES ('36', '42', '45', 'in');
INSERT INTO inventory VALUES ('37', '41', '53', 'in');
INSERT INTO inventory VALUES ('38', '40', '43', 'in');
INSERT INTO inventory VALUES ('39', '39', '34', 'in');
INSERT INTO inventory VALUES ('40', '38', '42', 'in');
INSERT INTO inventory VALUES ('41', '37', '12', 'in');
INSERT INTO inventory VALUES ('42', '36', '234', 'in');
INSERT INTO inventory VALUES ('43', '35', '34', 'in');
INSERT INTO inventory VALUES ('44', '34', '56', 'in');
INSERT INTO inventory VALUES ('45', '33', '546', 'in');
INSERT INTO inventory VALUES ('46', '32', '45', 'in');
INSERT INTO inventory VALUES ('47', '31', '45', 'in');
INSERT INTO inventory VALUES ('48', '30', '56', 'in');
INSERT INTO inventory VALUES ('49', '29', '7', 'in');
INSERT INTO inventory VALUES ('50', '22', '234', 'in');
INSERT INTO inventory VALUES ('51', '43', '1', 'out');
INSERT INTO inventory VALUES ('52', '46', '1', 'out');
INSERT INTO inventory VALUES ('53', '29', '1', 'out');
INSERT INTO inventory VALUES ('54', '46', '1', 'in');
INSERT INTO inventory VALUES ('55', '40', '1', 'out');
INSERT INTO inventory VALUES ('56', '46', '1', 'out');
INSERT INTO inventory VALUES ('57', '46', '1', 'in');
INSERT INTO inventory VALUES ('58', '38', '1', 'out');
INSERT INTO inventory VALUES ('59', '22', '1', 'out');
INSERT INTO inventory VALUES ('60', '47', '10', 'in');
INSERT INTO inventory VALUES ('61', '6', '100', 'in');
INSERT INTO inventory VALUES ('62', '5', '50', 'in');
INSERT INTO inventory VALUES ('63', '4', '50', 'in');
INSERT INTO inventory VALUES ('64', '3', '1000', 'in');
INSERT INTO inventory VALUES ('65', '2', '500', 'in');
INSERT INTO inventory VALUES ('66', '1', '1000', 'in');
INSERT INTO inventory VALUES ('67', '6', '1', 'out');
INSERT INTO inventory VALUES ('68', '6', '1', 'out');
INSERT INTO inventory VALUES ('69', '4', '1', 'out');
INSERT INTO inventory VALUES ('70', '6', '1', 'out');
INSERT INTO inventory VALUES ('71', '6', '100', 'in');
INSERT INTO inventory VALUES ('72', '5', '1', 'out');
INSERT INTO inventory VALUES ('73', '5', '3', 'out');
INSERT INTO inventory VALUES ('74', '5', '2', 'out');
INSERT INTO inventory VALUES ('75', '6', '3', 'out');
INSERT INTO inventory VALUES ('76', '5', '4', 'out');
INSERT INTO inventory VALUES ('77', '4', '9', 'out');
INSERT INTO inventory VALUES ('78', '6', '5', 'out');
INSERT INTO inventory VALUES ('79', '5', '2', 'out');
INSERT INTO inventory VALUES ('80', '6', '4', 'out');
INSERT INTO inventory VALUES ('81', '6', '1', 'out');
INSERT INTO inventory VALUES ('82', '5', '1', 'in');
INSERT INTO inventory VALUES ('83', '6', '1', 'out');
INSERT INTO inventory VALUES ('84', '4', '1', 'in');
INSERT INTO inventory VALUES ('85', '6', '1', 'out');
INSERT INTO inventory VALUES ('86', '5', '5', 'out');
INSERT INTO inventory VALUES ('87', '5', '1', 'out');
INSERT INTO inventory VALUES ('88', '5', '2', 'in');
INSERT INTO inventory VALUES ('89', '5', '5', 'in');
INSERT INTO inventory VALUES ('90', '5', '40', 'out');
INSERT INTO inventory VALUES ('91', '3', '1', 'out');
INSERT INTO inventory VALUES ('92', '6', '1', 'in');
INSERT INTO inventory VALUES ('93', '6', '1', 'in');
INSERT INTO inventory VALUES ('94', '6', '5', 'out');
INSERT INTO inventory VALUES ('95', '6', '199', 'in');
INSERT INTO inventory VALUES ('96', '6', '44', 'out');
INSERT INTO inventory VALUES ('97', '6', '1', 'out');
INSERT INTO inventory VALUES ('98', '1', '34', 'out');
INSERT INTO inventory VALUES ('99', '6', '1', 'out');

-- ----------------------------
-- Table structure for `loginip`
-- ----------------------------
DROP TABLE IF EXISTS `loginip`;
CREATE TABLE `loginip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `ipaddr` varchar(255) DEFAULT NULL,
  `savetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginip
-- ----------------------------
INSERT INTO loginip VALUES ('1', 'ding', '127.0.0.1', '2020-04-14 11:46:35');
INSERT INTO loginip VALUES ('2', 'ding', '127.0.0.1', '2020-04-14 11:47:15');
INSERT INTO loginip VALUES ('3', 'cheng', '127.0.0.1', '2020-04-14 12:04:50');
INSERT INTO loginip VALUES ('4', 'cheng', '127.0.0.1', '2020-04-19 14:37:07');
INSERT INTO loginip VALUES ('5', 'eric', '127.0.0.1', '2020-10-03 20:59:57');
INSERT INTO loginip VALUES ('6', 'eric', '127.0.0.1', '2020-10-03 21:13:06');
INSERT INTO loginip VALUES ('7', 'ding', '127.0.0.1', '2021-03-18 11:53:10');
INSERT INTO loginip VALUES ('8', 'ding', '127.0.0.1', '2022-03-10 13:13:43');
INSERT INTO loginip VALUES ('9', 'ding', '127.0.0.1', '2022-03-10 13:21:59');
INSERT INTO loginip VALUES ('10', 'ding', '127.0.0.1', '2022-03-10 13:24:41');
INSERT INTO loginip VALUES ('11', 'ding', '127.0.0.1', '2022-03-10 15:21:01');
INSERT INTO loginip VALUES ('12', 'ding', '127.0.0.1', '2022-03-10 15:22:48');
INSERT INTO loginip VALUES ('13', 'cheng', '127.0.0.1', '2022-03-10 15:23:33');
INSERT INTO loginip VALUES ('14', 'ding', '127.0.0.1', '2022-03-10 16:02:52');
INSERT INTO loginip VALUES ('15', 'ding', '127.0.0.1', '2022-03-10 16:34:21');
INSERT INTO loginip VALUES ('16', 'ding', '127.0.0.1', '2022-03-10 16:41:59');
INSERT INTO loginip VALUES ('17', 'ding', '127.0.0.1', '2022-03-10 18:38:36');
INSERT INTO loginip VALUES ('18', 'ding', '127.0.0.1', '2022-03-10 18:39:43');
INSERT INTO loginip VALUES ('19', 'ding', '127.0.0.1', '2022-03-10 18:50:53');
INSERT INTO loginip VALUES ('20', 'ding', '127.0.0.1', '2022-03-10 19:51:58');
INSERT INTO loginip VALUES ('21', 'ding', '127.0.0.1', '2022-03-10 19:55:27');
INSERT INTO loginip VALUES ('22', 'cheng', '127.0.0.1', '2022-03-10 19:57:36');
INSERT INTO loginip VALUES ('23', 'ding', '127.0.0.1', '2022-03-10 20:47:18');
INSERT INTO loginip VALUES ('24', 'ding', '127.0.0.1', '2022-03-10 20:51:11');
INSERT INTO loginip VALUES ('25', 'cheng', '127.0.0.1', '2022-03-10 20:54:25');
INSERT INTO loginip VALUES ('26', 'ding', '127.0.0.1', '2022-03-11 15:12:09');
INSERT INTO loginip VALUES ('27', 'ding', '127.0.0.1', '2022-03-11 15:15:03');
INSERT INTO loginip VALUES ('28', 'ding', '127.0.0.1', '2022-03-11 15:18:28');
INSERT INTO loginip VALUES ('29', 'ding', '127.0.0.1', '2022-03-11 15:22:44');
INSERT INTO loginip VALUES ('30', 'ding', '127.0.0.1', '2022-03-11 15:26:00');
INSERT INTO loginip VALUES ('31', 'ding', '127.0.0.1', '2022-03-11 15:31:20');
INSERT INTO loginip VALUES ('32', 'ding', '127.0.0.1', '2022-03-11 15:33:04');
INSERT INTO loginip VALUES ('33', 'ding', '127.0.0.1', '2022-03-11 15:33:39');
INSERT INTO loginip VALUES ('34', 'ding', '127.0.0.1', '2022-03-11 15:36:14');
INSERT INTO loginip VALUES ('35', 'ding', '127.0.0.1', '2022-03-11 15:36:58');
INSERT INTO loginip VALUES ('36', 'ding', '127.0.0.1', '2022-03-11 15:38:31');
INSERT INTO loginip VALUES ('37', 'ding', '127.0.0.1', '2022-03-11 15:39:55');
INSERT INTO loginip VALUES ('38', 'ding', '127.0.0.1', '2022-03-11 15:41:07');
INSERT INTO loginip VALUES ('39', 'ding', '127.0.0.1', '2022-03-11 15:42:48');
INSERT INTO loginip VALUES ('40', 'ding', '127.0.0.1', '2022-03-11 15:53:06');
INSERT INTO loginip VALUES ('41', 'ding', '127.0.0.1', '2022-03-11 15:54:17');
INSERT INTO loginip VALUES ('42', 'ding', '127.0.0.1', '2022-03-11 16:01:57');
INSERT INTO loginip VALUES ('43', 'ding', '127.0.0.1', '2022-03-11 16:08:58');
INSERT INTO loginip VALUES ('44', 'ding', '127.0.0.1', '2022-03-11 17:10:29');
INSERT INTO loginip VALUES ('45', 'ding', '127.0.0.1', '2022-03-11 17:11:20');
INSERT INTO loginip VALUES ('46', 'ding', '127.0.0.1', '2022-03-11 17:17:31');
INSERT INTO loginip VALUES ('47', 'ding', '127.0.0.1', '2022-03-11 17:30:33');
INSERT INTO loginip VALUES ('48', 'ding', '127.0.0.1', '2022-03-11 17:31:37');
INSERT INTO loginip VALUES ('49', 'ding', '127.0.0.1', '2022-03-11 17:32:37');
INSERT INTO loginip VALUES ('50', 'ding', '127.0.0.1', '2022-03-11 17:48:34');
INSERT INTO loginip VALUES ('51', 'ding', '127.0.0.1', '2022-03-11 18:08:37');
INSERT INTO loginip VALUES ('52', 'ding', '127.0.0.1', '2022-03-11 18:12:41');
INSERT INTO loginip VALUES ('53', 'ding', '127.0.0.1', '2022-03-11 18:17:31');
INSERT INTO loginip VALUES ('54', 'ding', '127.0.0.1', '2022-03-11 18:20:36');
INSERT INTO loginip VALUES ('55', 'cheng', '127.0.0.1', '2022-03-11 18:21:21');
INSERT INTO loginip VALUES ('56', 'ding', '127.0.0.1', '2022-03-11 18:36:22');
INSERT INTO loginip VALUES ('57', 'ding', '127.0.0.1', '2022-03-11 18:44:54');
INSERT INTO loginip VALUES ('58', 'cheng', '127.0.0.1', '2022-03-11 18:45:26');
INSERT INTO loginip VALUES ('59', 'ding', '127.0.0.1', '2022-03-11 18:50:20');
INSERT INTO loginip VALUES ('60', 'ding', '127.0.0.1', '2022-03-11 18:53:38');
INSERT INTO loginip VALUES ('61', 'ding', '127.0.0.1', '2022-03-11 20:21:29');
INSERT INTO loginip VALUES ('62', 'ding', '127.0.0.1', '2022-03-15 23:01:32');
INSERT INTO loginip VALUES ('63', 'ding', '127.0.0.1', '2022-03-15 23:18:16');
INSERT INTO loginip VALUES ('64', 'cheng', '127.0.0.1', '2022-04-20 17:53:14');
INSERT INTO loginip VALUES ('65', 'cheng', '127.0.0.1', '2022-04-20 17:55:34');
INSERT INTO loginip VALUES ('66', 'cheng', '127.0.0.1', '2022-04-20 18:03:11');
INSERT INTO loginip VALUES ('67', '111111', '127.0.0.1', '2023-02-06 22:09:24');
INSERT INTO loginip VALUES ('68', 'ding', '127.0.0.1', '2023-02-06 22:25:44');
INSERT INTO loginip VALUES ('69', '111111', '127.0.0.1', '2023-02-06 22:28:12');
INSERT INTO loginip VALUES ('70', 'ding', '127.0.0.1', '2023-02-06 22:30:06');
INSERT INTO loginip VALUES ('71', '111111', '127.0.0.1', '2023-02-06 22:32:54');
INSERT INTO loginip VALUES ('72', 'ding', '127.0.0.1', '2023-02-06 22:33:50');
INSERT INTO loginip VALUES ('73', '111111', '127.0.0.1', '2023-02-06 22:49:30');
INSERT INTO loginip VALUES ('74', 'ding', '127.0.0.1', '2023-02-06 22:50:54');
INSERT INTO loginip VALUES ('75', '111111', '127.0.0.1', '2023-02-06 22:51:26');
INSERT INTO loginip VALUES ('76', '111111', '127.0.0.1', '2023-02-08 15:41:42');
INSERT INTO loginip VALUES ('77', 'ding', '127.0.0.1', '2023-02-08 15:46:15');
INSERT INTO loginip VALUES ('78', '111111', '127.0.0.1', '2023-02-08 15:51:57');
INSERT INTO loginip VALUES ('79', 'ding', '127.0.0.1', '2023-02-08 15:55:28');
INSERT INTO loginip VALUES ('80', 'ding', '127.0.0.1', '2023-02-08 20:11:57');
INSERT INTO loginip VALUES ('81', 'ding', '127.0.0.1', '2023-02-08 20:24:01');
INSERT INTO loginip VALUES ('82', '111111', '127.0.0.1', '2023-02-09 13:45:05');
INSERT INTO loginip VALUES ('83', 'qqq', '127.0.0.1', '2023-02-09 13:47:38');
INSERT INTO loginip VALUES ('84', '111111', '127.0.0.1', '2023-02-09 13:59:15');
INSERT INTO loginip VALUES ('85', 'ding', '127.0.0.1', '2023-02-09 14:03:49');
INSERT INTO loginip VALUES ('86', 'ding', '127.0.0.1', '2023-02-09 14:06:47');
INSERT INTO loginip VALUES ('87', '111111', '127.0.0.1', '2023-02-12 16:39:38');
INSERT INTO loginip VALUES ('88', 'huhao', '127.0.0.1', '2023-02-12 16:54:28');
INSERT INTO loginip VALUES ('89', 'ding', '127.0.0.1', '2023-02-12 17:38:18');
INSERT INTO loginip VALUES ('90', 'huhao', '127.0.0.1', '2023-02-12 19:54:21');
INSERT INTO loginip VALUES ('91', 'ding', '127.0.0.1', '2023-02-12 19:56:26');
INSERT INTO loginip VALUES ('92', 'huhao', '127.0.0.1', '2023-02-12 21:42:58');
INSERT INTO loginip VALUES ('93', 'huhao', '127.0.0.1', '2023-02-12 21:48:25');
INSERT INTO loginip VALUES ('94', 'huhao', '127.0.0.1', '2023-02-12 23:09:21');
INSERT INTO loginip VALUES ('95', '111111', '127.0.0.1', '2023-02-13 00:04:41');
INSERT INTO loginip VALUES ('96', 'sss', '127.0.0.1', '2023-02-13 09:31:54');
INSERT INTO loginip VALUES ('97', 'huhao', '127.0.0.1', '2023-02-13 09:52:38');
INSERT INTO loginip VALUES ('98', 'hh', '127.0.0.1', '2023-02-13 10:33:36');
INSERT INTO loginip VALUES ('99', 'ding', '127.0.0.1', '2023-02-13 10:49:58');
INSERT INTO loginip VALUES ('100', 'hhhh', '127.0.0.1', '2023-02-13 10:56:59');
INSERT INTO loginip VALUES ('101', 'ding', '127.0.0.1', '2023-02-13 10:59:17');
INSERT INTO loginip VALUES ('102', '111111', '127.0.0.1', '2023-02-22 09:27:32');
INSERT INTO loginip VALUES ('103', '111111', '127.0.0.1', '2023-02-22 11:09:25');
INSERT INTO loginip VALUES ('104', '111111', '127.0.0.1', '2023-02-26 15:55:20');
INSERT INTO loginip VALUES ('105', 'rrrr', '127.0.0.1', '2023-02-28 13:34:06');
INSERT INTO loginip VALUES ('106', 'rrrr', '127.0.0.1', '2023-02-28 13:59:55');
INSERT INTO loginip VALUES ('107', 'rrrr', '127.0.0.1', '2023-02-28 14:11:16');
INSERT INTO loginip VALUES ('108', 'ding', '127.0.0.1', '2023-03-06 23:05:18');
INSERT INTO loginip VALUES ('109', 'rrrr', '127.0.0.1', '2023-03-06 23:10:18');
INSERT INTO loginip VALUES ('110', 'ding', '127.0.0.1', '2023-03-06 23:16:49');
INSERT INTO loginip VALUES ('111', '111111', '127.0.0.1', '2023-03-06 23:20:42');
INSERT INTO loginip VALUES ('112', '111111', '127.0.0.1', '2023-03-07 11:23:10');
INSERT INTO loginip VALUES ('113', 'qqq', '127.0.0.1', '2023-03-07 11:33:38');
INSERT INTO loginip VALUES ('114', 'rrrr', '127.0.0.1', '2023-03-07 12:15:18');
INSERT INTO loginip VALUES ('115', 'rrrr', '127.0.0.1', '2023-03-07 13:46:41');
INSERT INTO loginip VALUES ('116', 'qqq', '127.0.0.1', '2023-03-07 14:30:23');
INSERT INTO loginip VALUES ('117', 'rrrr', '127.0.0.1', '2023-03-11 14:35:58');
INSERT INTO loginip VALUES ('118', 'rrrr', '127.0.0.1', '2023-03-12 15:13:26');
INSERT INTO loginip VALUES ('119', '111111', '127.0.0.1', '2023-03-12 21:03:44');
INSERT INTO loginip VALUES ('120', '111111', '127.0.0.1', '2023-03-13 21:12:55');
INSERT INTO loginip VALUES ('121', 'ding', '127.0.0.1', '2023-03-13 22:01:31');
INSERT INTO loginip VALUES ('122', 'ding', '127.0.0.1', '2023-03-14 11:34:41');
INSERT INTO loginip VALUES ('123', 'ding', '127.0.0.1', '2023-03-14 12:09:40');
INSERT INTO loginip VALUES ('124', 'ding', '127.0.0.1', '2023-03-14 12:54:03');
INSERT INTO loginip VALUES ('125', 'ding', '127.0.0.1', '2023-03-14 13:34:15');
INSERT INTO loginip VALUES ('126', 'ding', '127.0.0.1', '2023-03-19 20:43:44');
INSERT INTO loginip VALUES ('127', 'ding', '127.0.0.1', '2023-03-21 14:03:01');
INSERT INTO loginip VALUES ('128', 'ding', '127.0.0.1', '2023-03-21 14:24:59');
INSERT INTO loginip VALUES ('129', '55', '127.0.0.1', '2023-03-21 14:27:15');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `yue` double(255,2) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `lev` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO member VALUES ('8', 'ding', '123', '一个普通人', '13877665521', 'ding@126.com', '0.00', '0', '1646984230217.png', '高级会员');
INSERT INTO member VALUES ('9', 'cheng', '123', '陈晨', '13809763312', 'cheng@126.com', '0.00', '0', '1650448473959.jpg', '普通用户');
INSERT INTO member VALUES ('10', 'xiang', 'xiang123', '项国华', '13908761123', 'xiang@126.com', '0.00', '0', '1585281272494.png', '会员');
INSERT INTO member VALUES ('11', 'wang', '2628qa', 'nike', '15161460223', '2dd@126.com', '0.00', '0', '1586757877005.jpg', '普通用户');
INSERT INTO member VALUES ('12', 'lei', 'lei123', 'word', '13562377892', '3366@123.com', '0.00', '0', '1586772034265.jpg', '普通用户');
INSERT INTO member VALUES ('13', 'eric', 'eric123456', 'eric', '13022335566', '203515725@qq.com', '0.00', '0', '1601729911747.png', '普通用户');
INSERT INTO member VALUES ('14', '111111', 'huhao6318518', '123', '15295060795', '2316458205@qq.com', '0.00', '0', '1675692463010.gif', '普通用户');
INSERT INTO member VALUES ('15', 'qqq', '123123a', 'qqq', '15295060795', '2316458205@qq.com', '0.00', '0', '1675692463010.gif', '普通用户');
INSERT INTO member VALUES ('16', 'admin', 'huhao6318515', '1111', '15295060795', '2316458205@qq.com', '0.00', '0', '1676191773584.gif', '普通用户');
INSERT INTO member VALUES ('17', 'huhao', '123456789a', 'hu', '15295060795', '2316458205@qq.com', '0.00', '0', '1676191964595.gif', '普通用户');
INSERT INTO member VALUES ('18', 'sss', 'huhao6318515', 'ssss', '15295060799', '2316458205@qq.com', '0.00', '0', '1675692463010.gif', '普通用户');
INSERT INTO member VALUES ('19', 'hh', 'huhao6318515', 'hh', '15295060795', '2316458205@qq.com', '0.00', '0', '1675692463010.gif', '会员');
INSERT INTO member VALUES ('20', 'hhhh', 'huhao6318515', 'hhhh', '15295060795', '2316458205@qq.com', '0.00', '0', '1676256935794.gif', '普通用户');
INSERT INTO member VALUES ('21', 'rrrr', 'huhao6318518', 'rrrr', '15295060795', '2316458205@qq.com', '0.00', '0', '1677562392213.gif', '普通用户');
INSERT INTO member VALUES ('22', '123', 'huhao6318518', '2222', '15295060799', '2316458205@qq.com', '0.00', '0', '1675692463010.gif', '普通用户');
INSERT INTO member VALUES ('23', '55', 'huhao6318518', '55', '15295060795', '2316458205@qq.com', '0.00', '0', '1675692463010.gif', '普通用户');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `fid` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `price` double(255,2) DEFAULT NULL,
  `tjprice` double(255,2) DEFAULT NULL,
  `content` text,
  `savetime` datetime DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `istj` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO product VALUES ('1', '扎兰屯沙果', '1646900886922.png', '1', '2', '19.90', null, '<span style=\"font-family:宋体;background-color:#FFFFFF;\">扎兰屯市沙果栽培历史久远，是我国沙果的主产区，出产的黄太平、大秋果、海棠果等品种远近闻名，是当地招待贵宾、佳朋不可缺少的果品。扎兰屯沙果特定外观突出表现在：果形如乒乓球大小、色泽鲜艳、果面光滑且有光泽，果味酸甜、多汁、香气浓郁，果心肉质呈油浸状，风味独特，具有驱虫明目之功效。扎兰屯沙果饮品、沙果干食品已名扬海内外、享誉港澳台。扎兰屯沙果系农业部地理标志保护农产品、绿色食品。（1）土壤地貌情况：扎兰屯沙果产区主要以山区丘陵漫岗为主，山区丘陵面积占总面积的69％，北部属雅鲁河谷平原，中部属架子山低山丘陵，南部属基尔果山中山丘陵。主产区土壤以暗棕壤土为主，椐测定有机质含量6.22%以上，全氮平均含量……</span>', '2022-03-10 16:28:26', '0', 'no');
INSERT INTO product VALUES ('2', '阿荣马铃薯', '1646900949453.png', '1', '2', '29.90', null, '<span style=\"font-family:宋体;background-color:#FFFFFF;\">阿荣旗大事记记载，公元1732年清朝政府开辟从齐齐哈尔至海拉尔驿路。设驿站10台，其第三站在本地（即现在的音河乡）。旧名蒙古勒乌克察旗，又名乌尔楚克，现名旧三站。音河以马铃薯为著，过往客商无不以赞。公元1905年，清朝政府取消封禁政策，允许起票开荒，汉人起票买荒从本年开始进入阿伦河地区，马铃薯兴一方产业。地域范围阿荣马铃薯主要产自于内蒙古自治区呼伦贝尔市阿荣旗，地域保护范围包括复兴镇、那吉镇、-镇、亚东镇、霍尔奇镇、向阳峪镇、得力其尔乡、查巴奇乡、音河乡、新发乡等11个镇、4个民族乡。西部与扎兰屯市隔河相望，东部与扎格敦山岭和莫力达瓦达斡尔族自治旗为邻，北部和鄂荣春旗相连，西北部与牙克石市接壤……</span>', '2022-03-10 16:29:17', '0', 'no');
INSERT INTO product VALUES ('3', '扎兰屯葵花', '1646900997009.png', '1', '2', '28.80', null, '<span style=\"font-family:宋体;background-color:#FFFFFF;\">向日葵的种植面积在扎兰屯市及周边地区逐步扩大，每年为农户带来经济效益也很显著，已成为当地经济的主要增长点和支柱性产业。首先是因为当地土壤环境及气候条件适宜向日葵的生长，主要表现为：各山区积温变化差异大，山坡、贫乏、石丘等地势情况复杂多样，土质肥力薄厚不均，降水不足灌水条件差，昼夜温差大等特点。而向日葵以其适宜能力强，对土壤要求不严格，耐瘠薄、耐旱、耐低温和霜冻等抗逆性强，易于种植和管理，产量高效益好的优势成为了当地的主要作物之一。随着国内外葵花榨油业及炒货业的兴起和发展，呼伦贝尔市目前已成为葵花产业的重要原料基地，具有广阔的发展前景。但是，目前有些地区的农户对向日葵的栽培技术的各个环节掌握得不……</span>', '2022-03-10 16:30:06', '0', 'no');
INSERT INTO product VALUES ('4', '手把肉', '1646901096121.png', '3', '5', '128.00', null, '<span style=\"font-family:宋体;background-color:#FFFFFF;\">手把肉是呼伦贝尔草原蒙古、鄂温克、达斡尔、鄂伦春等游牧、狩猎民族千百年来的传统食 品。即用手把着吃肉之意。羊、牛、马、骆驼等牲畜及野兽的肉均可烹制手把肉，但通 常所讲的手把肉多指手把羊肉而言。 手把肉是草原牧民最常用和最喜欢的餐食，也是他们招待客人必不可少的食品。常年似乎已 形成这样一种概念，即到草原观光旅游不吃一顿手把肉就算没完全领略到草原食俗风味和情 趣 ，虚此一行。牧民不用手把肉招待客人，就不能完全表达自己的心意。因此，用手把羊肉款 待远方客人，在呼伦贝尔地区已成为一种定规。 手把肉的制作和吃法也别具一格。 通常选用膘肥肉嫩的小口羊一只，先拔去胸口近腹部毛，后用刀割开二寸左右的直口，将手……</span>', '2022-03-10 16:31:46', '0', 'no');
INSERT INTO product VALUES ('5', '美味烤全羊', '1646901136919.png', '3', '5', '288.00', '234.00', '<span style=\"font-family:宋体;background-color:#FFFFFF;\">烤全羊是蒙古民族的餐中之尊。《达斡尔蒙古考》中载道：“餐品至尊，未有过于乌查（即烤全扬）者”。烤全羊蒙语称“昭木”。据史料记载，它是成吉思汗最喜爱吃的一道宫廷名菜，也是元朝宫廷御宴“诈马宴”中不可或缺的一道美食。蒙古族这种传统而古老的风俗，至今还保留着，以前只供蒙古贵族享用，一般牧民根本吃不到的烤全羊。现如今，烤全羊已成为内蒙古草原饮食文化中一枚璀璨绚烂的明珠。随着历史的发展和蒙古族人民生活水平的提高，烤全羊的方法也随之演变。原始的烤全羊，是将开膛去皮的整羊架于火上烘烤。烧烤时要用杏木疙瘩烧旺的红火，须火旺而无烟方可。不时将白条羊在火上左右翻转，一直烤到表面金红油亮，香味喷发，外焦里嫩为止。</span>', '2022-03-10 16:32:26', '0', 'no');
INSERT INTO product VALUES ('6', '呼伦湖秀丽白虾', '1646901225348.png', '3', '4', '40.00', '18.00', '<span style=\"font-family:宋体;background-color:#FFFFFF;\">两千多年前的《山海经》称呼伦湖为“大泽”，《明史》称呼伦湖为“阔滦海子”，从清代开始，本地居民称呼伦湖为“达赉湖”。呼伦湖秀丽白虾是内蒙古呼伦贝尔市呼伦湖的特产。秀丽白虾是呼伦湖中唯一的经济虾类，具有生长快、食性广、繁殖力强、营养价值高等特点。呼伦湖秀丽白虾为国家农产品地理标志保护产品。秀丽白虾又称秀丽长臂虾。体呈圆筒形，体表光滑，身体透明，成虾体长一般为35～80毫米，体重0.4克～2.4克。秀丽白虾是高蛋白、低脂肪生物，鲜虾所含粗蛋白比同水域鱼类高许多。秀丽白虾的繁殖季节，在呼伦湖水域中5月末至8月中旬，繁殖高峰在6月中旬至7月中旬。秀丽白虾属杂食性动物，终生以浮游动物、植物碎屑、细菌等为……</span>', '2022-03-10 16:33:52', '0', 'no');

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `utype` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO sysuser VALUES ('1', 'admin', '123', '管理员', '0', 'admin', '13888888888', 'admin@126.com');
INSERT INTO sysuser VALUES ('2', 'sp', '123', '商品管理员', '0', '丁国华', '13809763322', 'ding@126.com');
INSERT INTO sysuser VALUES ('3', 'ck', '123', '仓库管理员', '0', '项国华', '13908761122', 'xiang@126.com');
INSERT INTO sysuser VALUES ('4', 'dd', '123', '订单管理员', '0', '订单管理员1', '13809761122', 'dd@126.com');
