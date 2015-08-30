/*
Navicat MySQL Data Transfer

Source Server         : local_db
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : mmb

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2015-08-30 10:55:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu`;
CREATE TABLE `auth_menu` (
  `id` varchar(11) NOT NULL COMMENT '记录号',
  `parent_id` varchar(50) default NULL COMMENT '父菜单',
  `res_id` varchar(50) default NULL COMMENT '关联资源',
  `menu_name` varchar(20) NOT NULL COMMENT '菜单名称',
  `menu_desc` varchar(100) default NULL COMMENT '菜单描述',
  `tree_level` int(11) default NULL COMMENT '菜单级别',
  `is_leaf` tinyint(4) default NULL COMMENT '是否叶子节点',
  `menu_css` varchar(20) default NULL COMMENT '菜单样式',
  `create_user_id` varchar(50) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_menu
-- ----------------------------
INSERT INTO `auth_menu` VALUES ('M01', null, 'R03', '资源列表', null, null, '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M02', null, 'R02', '角色列表', null, null, '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M03', null, 'R01', '用户管理', null, null, '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M04', null, 'R04', '菜单管理', null, null, '1', null, null, null);
INSERT INTO `auth_menu` VALUES ('M05', null, 'R08', '站内信', '', null, '1', null, null, null);

-- ----------------------------
-- Table structure for auth_resource
-- ----------------------------
DROP TABLE IF EXISTS `auth_resource`;
CREATE TABLE `auth_resource` (
  `id` varchar(11) NOT NULL COMMENT '记录号',
  `parent_id` varchar(50) default NULL COMMENT '父资源',
  `res_name` varchar(50) NOT NULL COMMENT '资源名称',
  `res_url` varchar(100) NOT NULL COMMENT '资源路径',
  `res_desc` varchar(100) default NULL COMMENT '资源描述',
  `tree_level` int(2) default NULL COMMENT '资源级别',
  `is_leaf` int(11) default NULL COMMENT '是否叶子节点',
  `create_user_id` varchar(50) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_resource
-- ----------------------------
INSERT INTO `auth_resource` VALUES ('R01', null, '用户管理', '/UserController/toList.do', null, null, '1', null, null);
INSERT INTO `auth_resource` VALUES ('R02', null, '角色列表', '/RoleController/toList.do', null, null, '1', null, null);
INSERT INTO `auth_resource` VALUES ('R03', null, '资源列表', '/ResourceController/toList.do', null, null, '1', null, null);
INSERT INTO `auth_resource` VALUES ('R04', null, '菜单管理', '/MenuController/toList.do', null, null, '1', null, null);
INSERT INTO `auth_resource` VALUES ('R07', null, '非菜单资源', '1', null, null, '0', null, null);
INSERT INTO `auth_resource` VALUES ('R0701', 'R07', '管理中心桌面', '/index.jsp', null, null, '1', null, null);
INSERT INTO `auth_resource` VALUES ('R08', null, '站内信', '/InsideLetterController/toList.do', '', null, '1', null, null);

-- ----------------------------
-- Table structure for auth_role
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
INSERT INTO `auth_role` VALUES ('1', 'admin', 'fdsafsadf', 'fsadf', null);
INSERT INTO `auth_role` VALUES ('2', 'test', null, null, null);
INSERT INTO `auth_role` VALUES ('3', 'manager', '发到付', '退货需知，一经穿过拒绝退换，尽量用申通寄回！\r\n退货地址:浙江省台州市路桥区章苑新村23幢101室 陈峰 15967655559 \r\n退回写张纸条，写明退货原因和旺旺ID，中通快递，平邮和到付拒收', '2015-04-14 15:26:51');
INSERT INTO `auth_role` VALUES ('4', 'aa', '111', '11111', '2015-04-14 15:29:48');
INSERT INTO `auth_role` VALUES ('5', '111', '???', 'fsf', '2015-04-14 15:30:53');
INSERT INTO `auth_role` VALUES ('7', '4324', '类型', '发的', '2015-04-14 15:35:47');
INSERT INTO `auth_role` VALUES ('8', '111', '好的', '发送大方', '2015-04-14 15:38:06');
INSERT INTO `auth_role` VALUES ('9', '432423', '发发沙发', '爽肤水', '2015-04-14 15:39:08');
INSERT INTO `auth_role` VALUES ('10', 'fas', '范德萨发', 'fdsafsdfsadf范德萨发生大幅', '2015-04-20 14:38:53');
INSERT INTO `auth_role` VALUES ('11', 'dfas', 'fdsa', 'fasdfasf', '2015-04-24 13:41:50');

-- ----------------------------
-- Table structure for auth_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_resource`;
CREATE TABLE `auth_role_resource` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `res_id` varchar(50) NOT NULL COMMENT '资源id',
  PRIMARY KEY  (`role_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色资源中间表';

-- ----------------------------
-- Records of auth_role_resource
-- ----------------------------
INSERT INTO `auth_role_resource` VALUES ('1', '0');
INSERT INTO `auth_role_resource` VALUES ('1', 'R01');
INSERT INTO `auth_role_resource` VALUES ('1', 'R02');
INSERT INTO `auth_role_resource` VALUES ('1', 'R03');
INSERT INTO `auth_role_resource` VALUES ('1', 'R04');
INSERT INTO `auth_role_resource` VALUES ('1', 'R07');
INSERT INTO `auth_role_resource` VALUES ('1', 'R0701');
INSERT INTO `auth_role_resource` VALUES ('1', 'R08');
INSERT INTO `auth_role_resource` VALUES ('8', 'R01');
INSERT INTO `auth_role_resource` VALUES ('8', 'R02');
INSERT INTO `auth_role_resource` VALUES ('8', 'R03');
INSERT INTO `auth_role_resource` VALUES ('8', 'R04');
INSERT INTO `auth_role_resource` VALUES ('10', 'R0102');
INSERT INTO `auth_role_resource` VALUES ('10', 'R0103');
INSERT INTO `auth_role_resource` VALUES ('11', 'R0103');
INSERT INTO `auth_role_resource` VALUES ('11', 'R02');

-- ----------------------------
-- Table structure for auth_user
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
INSERT INTO `auth_user` VALUES ('1', 'admin', '1', null, null, null);
INSERT INTO `auth_user` VALUES ('2', 'test', '1', null, null, null);
INSERT INTO `auth_user` VALUES ('3', 'java', '1', null, null, null);
INSERT INTO `auth_user` VALUES ('4', '111', null, null, null, null);
INSERT INTO `auth_user` VALUES ('5', '3424', null, null, null, null);

-- ----------------------------
-- Table structure for auth_user_role
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
INSERT INTO `auth_user_role` VALUES ('2', '5');
INSERT INTO `auth_user_role` VALUES ('2', '8');
INSERT INTO `auth_user_role` VALUES ('2', '9');
INSERT INTO `auth_user_role` VALUES ('3', '3');
INSERT INTO `auth_user_role` VALUES ('3', '4');
INSERT INTO `auth_user_role` VALUES ('3', '5');
INSERT INTO `auth_user_role` VALUES ('3', '11');
INSERT INTO `auth_user_role` VALUES ('4', '7');
INSERT INTO `auth_user_role` VALUES ('4', '8');
INSERT INTO `auth_user_role` VALUES ('4', '9');
INSERT INTO `auth_user_role` VALUES ('5', '9');
INSERT INTO `auth_user_role` VALUES ('5', '10');

-- ----------------------------
-- Table structure for inside_letter
-- ----------------------------
DROP TABLE IF EXISTS `inside_letter`;
CREATE TABLE `inside_letter` (
  `id` int(11) NOT NULL,
  `title` varchar(100) default NULL,
  `content` varchar(500) default NULL,
  `create_username` varchar(20) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Records of inside_letter
-- ----------------------------

-- ----------------------------
-- Table structure for inside_letter_user
-- ----------------------------
DROP TABLE IF EXISTS `inside_letter_user`;
CREATE TABLE `inside_letter_user` (
  `id` int(11) NOT NULL,
  `inside_letter_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `is_read` int(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inside_letter_user
-- ----------------------------
