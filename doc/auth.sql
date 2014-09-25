
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` int(11) NOT NULL auto_increment COMMENT '记录号',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_ch_name` varchar(50) default NULL COMMENT '角色中文名称',
  `role_desc` varchar(100) default NULL COMMENT '角色描述',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

INSERT INTO `auth_role` VALUES ('1', 'admin', null, null, null);


DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment COMMENT '记录号',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `user_password` varchar(50) default NULL COMMENT '密码',
  `user_real_name` varchar(20) default NULL COMMENT '真实姓名',
  `use_status` int(1) default NULL COMMENT '使用状态[1:有效；2:禁用]',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';


DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色中间表';
