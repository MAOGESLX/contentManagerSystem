SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for db_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `db_menu_info`;
CREATE TABLE `db_menu_info` (
  `menu_info_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `menu_parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级菜单id',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型 0-菜单 1-按钮',
  `menu_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单编码控制时使用',
  `menu_status` int(11) DEFAULT NULL COMMENT '菜单状态 0-无效 1-有效',
  `menu_level` int(11) DEFAULT NULL COMMENT '菜单级别 1级 2级菜单',
  `menu_link_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单链接',
  `menu_image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `menu_order_no` int(11) DEFAULT NULL COMMENT '菜单排序',
  `menu_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单描述',
  PRIMARY KEY (`menu_info_id`) USING BTREE,
  FULLTEXT KEY `index_menu_parent_id` (`menu_parent_id`),
  FULLTEXT KEY `index_menu_name` (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单信息';

-- ----------------------------
-- Records of db_menu_info
-- ----------------------------
BEGIN;
INSERT INTO `db_menu_info` VALUES ('1239194612170526720', '', '数据分析', 0, 'SND8A84I', 1, 1, '/main/data_analysis.action', '/static/img/dataAnalysis.png', 2, NULL);
INSERT INTO `db_menu_info` VALUES ('1239587870453383168', '', '工作台', 0, 'qWwoh7BM', 1, 1, '/main/workplace.action', '/static/img/workplace.png', 1, NULL);
INSERT INTO `db_menu_info` VALUES ('1239587870453383169', '', '系统管理', 0, 'W6rkORUI', 1, 1, '', '/static/img/system.png', 3, NULL);
INSERT INTO `db_menu_info` VALUES ('1239587870453383170', '1239587870453383169', '用户管理', 0, 'bERu0o58', 1, 2, '/system/user/user_page.action', '', 4, NULL);
INSERT INTO `db_menu_info` VALUES ('1239587870453383171', '1239587870453383169', '角色管理', 0, 'bERu0o59', 1, 2, '/system/role/role_page.action', '', 5, NULL);
INSERT INTO `db_menu_info` VALUES ('1239587870453383172', '1239587870453383169', '菜单管理', 0, 'bERu0o60', 1, 2, '/system/menu/menu_page.action', '', 6, NULL);
INSERT INTO `db_menu_info` VALUES ('1251052791888838656', '', '基础数据', 0, 'Cn49fZOw', 1, 1, '', '/static/img/basics_sys.png', 7, NULL);
INSERT INTO `db_menu_info` VALUES ('1251054939863220224', '', '资产管理', 0, 'omLC6Rck', 1, 1, '', '/static/img/asset_manager.png', 8, NULL);
INSERT INTO `db_menu_info` VALUES ('1251056208912809984', '', '项目管理', 0, 'gkjv8siR', 1, 1, '', '/static/img/project_manager.png', 9, NULL);
INSERT INTO `db_menu_info` VALUES ('1251056475058176000', '', '云测管理', 0, 'WH6t5Cr7', 1, 1, '', '/static/img/test_manager.png', 10, NULL);
INSERT INTO `db_menu_info` VALUES ('1251056844286951424', '', '运维管理', 0, 'q1c8Uu1V', 1, 1, '', '/static/img/devops.png', 11, NULL);
INSERT INTO `db_menu_info` VALUES ('1251058125864927232', '', '工单管理', 0, 'g2dRx8Vx', 1, 1, '', '/static/img/work_order_manager.png', 12, NULL);
INSERT INTO `db_menu_info` VALUES ('1251061500530622464', '', '资源管理', 0, 'XqQYxtKr', 1, 1, '', '/static/img/res_manager.png', 13, NULL);
COMMIT;

-- ----------------------------
-- Table structure for db_role
-- ----------------------------
DROP TABLE IF EXISTS `db_role`;
CREATE TABLE `db_role` (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `role_type` int(11) DEFAULT NULL COMMENT '角色类型：1-系统管理员',
  `role_status` int(11) DEFAULT NULL COMMENT '状态，0-无效，1-正常',
  `role_desc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色描述',
  `order_no` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of db_role
-- ----------------------------
BEGIN;
INSERT INTO `db_role` VALUES ('1232869555121418265', '系统管理员', 1, 1, '系统管理员', 1);
INSERT INTO `db_role` VALUES ('1249587960136552448', '资源管理员', 2, 1, '管理资源', 2);
COMMIT;

-- ----------------------------
-- Table structure for db_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `db_role_menu`;
CREATE TABLE `db_role_menu` (
  `role_menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `fk_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id外键',
  `fk_menu_info_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单id外键',
  PRIMARY KEY (`role_menu_id`) USING BTREE,
  FULLTEXT KEY `index_role_id` (`fk_role_id`),
  FULLTEXT KEY `index_menu_info_id` (`fk_menu_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of db_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `db_role_menu` VALUES ('1251727347644674048', '1232869555121418265', '1239587870453383168');
INSERT INTO `db_role_menu` VALUES ('1251727347850194944', '1232869555121418265', '1239587870453383169');
INSERT INTO `db_role_menu` VALUES ('1251727348051521536', '1232869555121418265', '1239587870453383170');
INSERT INTO `db_role_menu` VALUES ('1251727348257042432', '1232869555121418265', '1239587870453383171');
INSERT INTO `db_role_menu` VALUES ('1251727720778346496', '1249587960136552448', '1239587870453383169');
INSERT INTO `db_role_menu` VALUES ('1251727720988061696', '1249587960136552448', '1239587870453383172');
INSERT INTO `db_role_menu` VALUES ('1251727721197776896', '1249587960136552448', '1251056208912809984');
INSERT INTO `db_role_menu` VALUES ('1251727721399103488', '1249587960136552448', '1251056844286951424');
COMMIT;

-- ----------------------------
-- Table structure for db_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `db_sys_log`;
CREATE TABLE `db_sys_log` (
  `log_id` varchar(32) NOT NULL COMMENT '主键',
  `log_title` varchar(20) DEFAULT NULL COMMENT '日志标题',
  `log_type` varchar(10) DEFAULT NULL COMMENT '日志类型 info error',
  `log_url` varchar(50) DEFAULT NULL COMMENT '日志请求url',
  `log_method` varchar(10) DEFAULT NULL COMMENT '请求方式 get post',
  `log_params` varchar(300) DEFAULT NULL COMMENT '请求参数',
  `log_exception` varchar(200) DEFAULT NULL COMMENT '请求异常',
  `log_user_name` varchar(50) DEFAULT NULL COMMENT '请求用户Id',
  `log_ip` varchar(20) DEFAULT NULL COMMENT '请求IP',
  `log_ip_address` varchar(40) DEFAULT NULL COMMENT '请求ip所在地',
  `log_start_time` datetime DEFAULT NULL COMMENT '请求开始时间',
  `log_elapsed_time` double(20,0) DEFAULT NULL COMMENT '请求耗时',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of db_sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for db_user
-- ----------------------------
DROP TABLE IF EXISTS `db_user`;
CREATE TABLE `db_user` (
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `user_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录密码',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `user_status` int(11) DEFAULT NULL COMMENT '用户状态 0-无效 1-正常',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型:-1-超级管理员;1-系统管理员',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of db_user
-- ----------------------------
BEGIN;
INSERT INTO `db_user` VALUES ('1232869555121418242', 'admin', 'A448AB34ABFCAFB2C1BCD981785BBEB484E9A918', '超级管理员', 1, -1, '', '2020-02-26 17:55:30', NULL, NULL);
INSERT INTO `db_user` VALUES ('1250978764600107008', 'sys001', 'A5B82506851ACFE1DB3E88F94CC82B29E0192803', '系统管理员1', 1, 1, '1232869555121418242', '2020-04-17 10:45:54', '1232869555121418242', '2020-04-17 10:46:28');
INSERT INTO `db_user` VALUES ('1250981868947103744', 'sys002', '6C4503A37EF6FDAE6CD292E11291CF6ACD17C6FB', '系统管理员2', 1, 1, '1232869555121418242', '2020-04-17 10:58:14', '1232869555121418242', '2020-04-17 11:12:17');
COMMIT;

-- ----------------------------
-- Table structure for db_user_role
-- ----------------------------
DROP TABLE IF EXISTS `db_user_role`;
CREATE TABLE `db_user_role` (
  `user_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `fk_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `fk_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色Id',
  PRIMARY KEY (`user_role_id`) USING BTREE,
  FULLTEXT KEY `index_user_id` (`fk_user_id`),
  FULLTEXT KEY `index_role_id` (`fk_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of db_user_role
-- ----------------------------
BEGIN;
INSERT INTO `db_user_role` VALUES ('1250978764868542464', '1250978764600107008', '1232869555121418265');
INSERT INTO `db_user_role` VALUES ('1250981869211344896', '1250981868947103744', '1232869555121418265');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
