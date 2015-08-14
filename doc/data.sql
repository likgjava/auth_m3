



CREATE TABLE `auth_menu` (
  `id` int(11) NOT NULL auto_increment COMMENT '记录号',
  `parent_id` varchar(50) default null comment '父菜单',
  `res_id` varchar(50) default null comment '关联资源',
  `menu_name` varchar(20) not null comment '菜单名称',
  `menu_desc` varchar(100) default null comment '菜单描述',
  `tree_level` int(11) default null comment '菜单级别',
  `is_leaf` tinyint(4) default null comment '是否叶子节点',
  `menu_css` varchar(20) default null comment '菜单样式',
  `create_user_id` varchar(50) default null comment '创建人',
  `create_time` datetime default null comment '创建时间',
  primary key  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `auth_resource` (
  `id` int(11) NOT NULL auto_increment COMMENT '记录号',
  `parent_id` varchar(50) default null comment '父资源',
  `res_name` varchar(50) not null comment '资源名称',
  `res_url` varchar(100) not null comment '资源路径',
  `res_desc` varchar(100) default null comment '资源描述',
  `tree_level` int(2) default null comment '资源级别',
  `is_leaf` int(11) default null comment '是否叶子节点',
  `create_user_id` varchar(50) default null comment '创建人',
  `create_time` datetime default null comment '创建时间',
  primary key  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

create table `auth_role_resource` (
  `role_id` int(11) not null default '' comment '角色id',
  `res_id` int(11) not null default '' comment '资源id',
  primary key  (`role_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色资源中间表';



