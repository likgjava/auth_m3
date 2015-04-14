/*
Navicat MySQL Data Transfer

Source Server         : local_db
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : mmb

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2015-04-14 15:55:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` int(11) NOT NULL auto_increment COMMENT '记录号',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_ch_name` varchar(50) default NULL COMMENT '角色中文名称',
  `role_desc` varchar(100) default NULL COMMENT '角色描述',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('1', 'admin', null, null, null);
INSERT INTO `auth_role` VALUES ('2', 'test', null, null, null);
INSERT INTO `auth_role` VALUES ('3', 'manager', '发到付', '退货需知，一经穿过拒绝退换，尽量用申通寄回！\r\n退货地址:浙江省台州市路桥区章苑新村23幢101室 陈峰 15967655559 \r\n退回写张纸条，写明退货原因和旺旺ID，中通快递，平邮和到付拒收', '2015-04-14 15:26:51');
INSERT INTO `auth_role` VALUES ('4', 'aa', '????', '?????', '2015-04-14 15:29:48');
INSERT INTO `auth_role` VALUES ('5', '111', '???', '???', '2015-04-14 15:30:53');
INSERT INTO `auth_role` VALUES ('6', '12', '????', '??????', '2015-04-14 15:32:36');
INSERT INTO `auth_role` VALUES ('7', '4324', '?????', '????????', '2015-04-14 15:35:47');
INSERT INTO `auth_role` VALUES ('8', '111', '好的', '发送大方', '2015-04-14 15:38:06');
INSERT INTO `auth_role` VALUES ('9', '432423', '发发沙发', '爽肤水', '2015-04-14 15:39:08');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment COMMENT '记录号',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(50) default NULL COMMENT '密码',
  `real_name` varchar(20) default NULL COMMENT '真实姓名',
  `status` int(1) default NULL COMMENT '使用状态[1:有效；2:禁用]',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'admin', null, null, null, null);
INSERT INTO `auth_user` VALUES ('2', 'test', null, null, null, null);

-- ----------------------------
-- Table structure for `auth_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色中间表';

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES ('1', '1');
INSERT INTO `auth_user_role` VALUES ('2', '1');
