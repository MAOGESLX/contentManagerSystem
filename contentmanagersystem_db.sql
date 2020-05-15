-- ----------------------------
-- Table structure for db_company
-- ----------------------------
DROP TABLE IF EXISTS `db_company`;
CREATE TABLE `db_company`  (
  `company_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `company_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司名称',
  `company_english` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司英文名称',
  `company_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司网址',
  `company_status` int(2) DEFAULT NULL COMMENT '状态0-删除 1-有效',
  `company_nature` int(2) DEFAULT NULL COMMENT '公司性质  1国有企业、2集体企业、3联营企业、4股份合作制企业、5私营企业、6个体户、7合伙企业、8有限责任公司、9股份有限公司',
  `company_principal` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人',
  `company_tel` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司联系电话',
  `company_mail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司邮箱',
  `established_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司建立时间',
  `company_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司地址',
  `company_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_company
-- ----------------------------
INSERT INTO `db_company` VALUES ('1254055798049349632', '阿里巴巴', 'Alibaba Group', 'http://www.alibaba.com', 1, 8, '马云', '57185022088', 'albba@Alibaba.com', '1999-09-09', '中国浙江省杭州市余杭区', '', '1232869555121418242', '2020-04-25 22:32:56', '1232869555121418242', '2020-04-26 00:09:08');
INSERT INTO `db_company` VALUES ('1254067825828548608', '百度', 'Baidu', 'https://www.baidu.com', 1, 9, '李彦宏', '59928888', 'baidu@baidu.com', '2000-01-25', '中国北京海淀区上地十街10号百度大厦', '', '1232869555121418242', '2020-04-25 23:20:44', NULL, NULL);
INSERT INTO `db_company` VALUES ('1254072509066760192', '深圳市腾讯计算机系统有限公司', 'Tencent', 'http://www.tencent.com', 1, 8, '马化腾', '75586013388', 'Tencent@tencent.com', '1998-11-11', '深圳市南山区海天二路33号腾讯滨海大厦', '', '1232869555121418242', '2020-04-25 23:39:20', NULL, NULL);

-- ----------------------------
-- Table structure for db_demand_manager
-- ----------------------------
DROP TABLE IF EXISTS `db_demand_manager`;
CREATE TABLE `db_demand_manager`  (
  `demand_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键32位',
  `demand_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '需求标题',
  `demand_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '需求描述',
  `demand_type` int(1) DEFAULT NULL COMMENT '需求类型  1-新增 2-修改 3-优化 ',
  `priority` int(1) DEFAULT NULL COMMENT '优先级 1-紧急、2-高、3-中、4-低',
  `demand_status` int(1) DEFAULT NULL COMMENT '任务状态  1-计划中;2-进行中;3-已完成;4-暂缓;5-终止/移除;6-已发布',
  `start_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始时间',
  `plan_finish_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计划完成时间',
  `finish_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '完成时间',
  `finish_rate` double DEFAULT NULL COMMENT '完成率',
  `overdue_num` double DEFAULT NULL COMMENT '逾期(H)',
  `remaining_days` double DEFAULT NULL COMMENT '剩余天数',
  `release_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布时间',
  `project_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属项目id',
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目名称',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`demand_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '需求管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_department
-- ----------------------------
DROP TABLE IF EXISTS `db_department`;
CREATE TABLE `db_department`  (
  `department_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `department_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `established_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '成立时间',
  `department_principal` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人',
  `department_principal_tel` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人联系电话',
  `company_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属单位',
  `company_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属单位名称',
  `department_status` int(2) DEFAULT NULL COMMENT '状态0-删除 1-有效',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_department
-- ----------------------------
INSERT INTO `db_department` VALUES ('1254240743867490304', '软件开发一部', '2020-04-06', 'A君', '18542155213', '1254067825828548608', '百度', 1, '1232869555121418242', '2020-04-26 10:47:53', '1232869555121418242', '2020-04-26 10:48:37');
INSERT INTO `db_department` VALUES ('1254240903230070784', '软件开发二部', '2020-04-06', 'B君', '18542155213', '1254055798049349632', '阿里巴巴', 1, '1232869555121418242', '2020-04-26 10:48:29', NULL, NULL);

-- ----------------------------
-- Table structure for db_employee
-- ----------------------------
DROP TABLE IF EXISTS `db_employee`;
CREATE TABLE `db_employee`  (
  `employee_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键32位',
  `employee_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工姓名',
  `employee_position` int(2) DEFAULT NULL COMMENT '员工职位:职位:1-总经理、2-副总经理、3-部门经理、4-职员',
  `employee_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工手机号码',
  `employee_sex` int(1) DEFAULT NULL COMMENT '员工性别:1-男 2-女',
  `employee_age` int(3) DEFAULT NULL COMMENT '员工年龄',
  `employee_birthday` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工生日',
  `employee_qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'qq',
  `employee_weixin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信',
  `company_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属单位',
  `company_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属单位名称',
  `department_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属部门',
  `department_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所部门名称',
  `employee_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住址',
  `employee_status` int(2) DEFAULT NULL COMMENT '状态0-删除 1-有效',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_employee
-- ----------------------------
INSERT INTO `db_employee` VALUES ('1254795545264906240', '张三', 4, '18109898989', 2, 22, '1990-04-27', '', '', '1254067825828548608', '百度', '1254240743867490304', '软件开发一部', '北京', 1, '1232869555121418242', '2020-04-27 23:32:26', '1232869555121418242', '2020-04-28 00:00:38');
INSERT INTO `db_employee` VALUES ('1261118152730443776', '李二', 4, '18152456066', 1, 32, '1991-05-15', '', '', '1254067825828548608', '百度', '1254240743867490304', '软件开发一部', '', 1, '1232869555121418242', '2020-05-15 10:16:13', NULL, NULL);

-- ----------------------------
-- Table structure for db_member_manager
-- ----------------------------
DROP TABLE IF EXISTS `db_member_manager`;
CREATE TABLE `db_member_manager`  (
  `member_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `project_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目id',
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目名称',
  `employee_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工Id',
  `employee_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工姓名',
  `member_role` int(2) DEFAULT NULL COMMENT '项目成员角色:1-产品/项目经理;2-技术负责人;3-web端开发;4-pc端开发;5-app端开发;6-小程序开发;',
  `member_status` int(1) DEFAULT NULL COMMENT '项目成员状态 1-有效  、2-释放 、0-删除',
  `add_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加入时间',
  `release_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '释放时间',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成员管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_member_manager
-- ----------------------------
INSERT INTO `db_member_manager` VALUES ('1261129719228338176', '1257879931233980416', '运营管理系统', '1254795545264906240', '张三', 3, 1, '2020-05-05', NULL, '1232869555121418242', '2020-05-15 11:02:10', '1232869555121418242', '2020-05-15 11:44:21');
INSERT INTO `db_member_manager` VALUES ('1261140385444048896', '1261134938968416256', 'ITSM', '1261118152730443776', '李二', 2, 1, '2020-05-03', NULL, '1232869555121418242', '2020-05-15 11:44:33', NULL, NULL);

-- ----------------------------
-- Table structure for db_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `db_menu_info`;
CREATE TABLE `db_menu_info`  (
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
  FULLTEXT INDEX `index_menu_parent_id`(`menu_parent_id`),
  FULLTEXT INDEX `index_menu_name`(`menu_name`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_menu_info
-- ----------------------------
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
INSERT INTO `db_menu_info` VALUES ('1252261729304354816', '', 'API管理', 0, 'WkFifg54', 1, 1, '', '/static/img/api_manager.png', 14, NULL);
INSERT INTO `db_menu_info` VALUES ('1252629702225539072', '1252261729304354816', '授权管理', 0, 'Ix11ddZS', 1, 2, '/appkey/appkey_manager.action', '/static/img/system.png', 15, NULL);
INSERT INTO `db_menu_info` VALUES ('1253706803804495872', '1251052791888838656', '单位管理', 0, 'A7ZRFAhE', 1, 2, '/company/company_page.action', '', 16, NULL);
INSERT INTO `db_menu_info` VALUES ('1254082192796053504', '1251052791888838656', '部门管理', 0, 'N6sENz3x', 1, 2, '/department/department_page.action', '', 17, NULL);
INSERT INTO `db_menu_info` VALUES ('1254336612830777344', '1251052791888838656', '员工管理', 0, 'kkHoc0wR', 1, 2, '/employee/employee_page.action', '', 18, NULL);
INSERT INTO `db_menu_info` VALUES ('1255344446808735744', '1251056208912809984', '项目列表', 0, 'ubPxbJTv', 1, 2, '/project/project_list_page.action', '', 19, NULL);
INSERT INTO `db_menu_info` VALUES ('1257884293532438528', '1251056208912809984', '成员管理', 0, 'nNifGnaB', 1, 2, '/project/member_manager_page.action', '', 20, NULL);
INSERT INTO `db_menu_info` VALUES ('1257884396188028928', '1251056208912809984', '需求管理', 0, 'c4QgUes1', 1, 2, '/project/demand_manager_page.action', '', 21, NULL);
INSERT INTO `db_menu_info` VALUES ('1257884496108933120', '1251056208912809984', '任务管理', 0, 'bmwqRNAs', 1, 2, '/project/task_manager_page.action', '', 22, NULL);

-- ----------------------------
-- Table structure for db_project
-- ----------------------------
DROP TABLE IF EXISTS `db_project`;
CREATE TABLE `db_project`  (
  `project_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目名称',
  `project_type` int(1) DEFAULT NULL COMMENT '类型  1-运营类 2-项目类',
  `project_status` int(1) DEFAULT NULL COMMENT '项目状态:1-新建 2-已立项 3-设计中 4-开发中5-已上线6-已下线、0-已删除',
  `approva_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '立项时间',
  `up_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上线时间',
  `down_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下线时间',
  `project_intro` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目简介',
  `company_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属单位',
  `company_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属单位名称',
  `department_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属部门',
  `department_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所部门名称',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_project
-- ----------------------------
INSERT INTO `db_project` VALUES ('1257879931233980416', '运营管理系统', 1, 5, '2020-04-01', '', '', '企业运营类项目', '1254055798049349632', '阿里巴巴', '1254240903230070784', '软件开发二部', '1232869555121418242', '2020-05-06 11:48:41', '1232869555121418242', '2020-05-06 11:50:31');
INSERT INTO `db_project` VALUES ('1261134938968416256', 'ITSM', 1, 1, '2020-05-05', '', '', '', '1254055798049349632', '阿里巴巴', '1254240903230070784', '软件开发二部', '1232869555121418242', '2020-05-15 11:22:55', NULL, NULL);

-- ----------------------------
-- Table structure for db_role
-- ----------------------------
DROP TABLE IF EXISTS `db_role`;
CREATE TABLE `db_role`  (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `role_type` int(11) DEFAULT NULL COMMENT '角色类型：1-系统管理员',
  `role_status` int(11) DEFAULT NULL COMMENT '状态，0-无效，1-正常',
  `role_desc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色描述',
  `order_no` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_role
-- ----------------------------
INSERT INTO `db_role` VALUES ('1232869555121418265', '系统管理员', 1, 1, '系统管理员', 1);
INSERT INTO `db_role` VALUES ('1249587960136552448', '资源管理员', 2, 1, '管理资源', 2);

-- ----------------------------
-- Table structure for db_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `db_role_menu`;
CREATE TABLE `db_role_menu`  (
  `role_menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `fk_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id外键',
  `fk_menu_info_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单id外键',
  PRIMARY KEY (`role_menu_id`) USING BTREE,
  FULLTEXT INDEX `index_role_id`(`fk_role_id`),
  FULLTEXT INDEX `index_menu_info_id`(`fk_menu_info_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_role_menu
-- ----------------------------
INSERT INTO `db_role_menu` VALUES ('1251727720778346496', '1249587960136552448', '1239587870453383169');
INSERT INTO `db_role_menu` VALUES ('1251727720988061696', '1249587960136552448', '1239587870453383172');
INSERT INTO `db_role_menu` VALUES ('1251727721197776896', '1249587960136552448', '1251056208912809984');
INSERT INTO `db_role_menu` VALUES ('1251727721399103488', '1249587960136552448', '1251056844286951424');
INSERT INTO `db_role_menu` VALUES ('1251905224361148416', '1232869555121418265', '1239587870453383168');
INSERT INTO `db_role_menu` VALUES ('1251905224570863616', '1232869555121418265', '1239587870453383169');
INSERT INTO `db_role_menu` VALUES ('1251905224772190208', '1232869555121418265', '1239587870453383170');
INSERT INTO `db_role_menu` VALUES ('1251905224977711104', '1232869555121418265', '1239587870453383171');

-- ----------------------------
-- Table structure for db_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `db_sys_log`;
CREATE TABLE `db_sys_log`  (
  `log_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `log_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志标题',
  `log_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志类型 info error',
  `log_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志请求url',
  `log_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方式 get post',
  `log_params` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求参数',
  `log_exception` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求异常',
  `log_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求用户Id',
  `log_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求IP',
  `log_ip_address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求ip所在地',
  `log_start_time` datetime(0) DEFAULT NULL COMMENT '请求开始时间',
  `log_elapsed_time` double(20, 0) DEFAULT NULL COMMENT '请求耗时',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_task_manager
-- ----------------------------
DROP TABLE IF EXISTS `db_task_manager`;
CREATE TABLE `db_task_manager`  (
  `task_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目id',
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目名称',
  `demand_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '需求Id',
  `demand_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '需求标题',
  `task_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务描述',
  `task_type` int(1) DEFAULT NULL COMMENT '任务类型  1-新增 2-修改 3-优化 ',
  `priority` int(1) DEFAULT NULL COMMENT '优先级 1-紧急、2-高、3-中、4-低',
  `demand_status` int(1) DEFAULT NULL COMMENT '任务状态  1-计划中;2-进行中;3-已完成;4-暂缓;5-终止/移除;6-已发布',
  `start_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始时间',
  `plan_finish_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '计划完成时间',
  `finish_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '完成时间',
  `finish_rate` double DEFAULT NULL COMMENT '完成率',
  `overdue_num` double DEFAULT NULL COMMENT '逾期(H)',
  `remaining_days` double DEFAULT NULL COMMENT '剩余天数',
  `release_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布时间',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_task_member
-- ----------------------------
DROP TABLE IF EXISTS `db_task_member`;
CREATE TABLE `db_task_member`  (
  `task_member_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `fk_task_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务Id',
  `fk_member_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '成员Id',
  `mmember_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '成员姓名',
  PRIMARY KEY (`task_member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务成员关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_user
-- ----------------------------
DROP TABLE IF EXISTS `db_user`;
CREATE TABLE `db_user`  (
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `user_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录名',
  `login_pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录密码',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `user_status` int(11) DEFAULT NULL COMMENT '用户状态 0-无效 1-正常',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型:-1-超级管理员;1-系统管理员',
  `creater_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人id',
  `creater_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifier_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人id',
  `modifier_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_user
-- ----------------------------
INSERT INTO `db_user` VALUES ('1232869555121418242', 'admin', 'A448AB34ABFCAFB2C1BCD981785BBEB484E9A918', '超级管理员', 1, -1, '', '2020-02-26 17:55:30', NULL, NULL);
INSERT INTO `db_user` VALUES ('1250978764600107008', 'sys001', 'A5B82506851ACFE1DB3E88F94CC82B29E0192803', '系统管理员1', 1, 1, '1232869555121418242', '2020-04-17 10:45:54', '1232869555121418242', '2020-04-17 10:46:28');
INSERT INTO `db_user` VALUES ('1250981868947103744', 'sys002', '6C4503A37EF6FDAE6CD292E11291CF6ACD17C6FB', '系统管理员2', 1, 1, '1232869555121418242', '2020-04-17 10:58:14', '1232869555121418242', '2020-04-17 11:12:17');

-- ----------------------------
-- Table structure for db_user_role
-- ----------------------------
DROP TABLE IF EXISTS `db_user_role`;
CREATE TABLE `db_user_role`  (
  `user_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键:32位的guid码',
  `fk_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `fk_role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色Id',
  PRIMARY KEY (`user_role_id`) USING BTREE,
  FULLTEXT INDEX `index_user_id`(`fk_user_id`),
  FULLTEXT INDEX `index_role_id`(`fk_role_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_user_role
-- ----------------------------
INSERT INTO `db_user_role` VALUES ('1250978764868542464', '1250978764600107008', '1232869555121418265');
INSERT INTO `db_user_role` VALUES ('1250981869211344896', '1250981868947103744', '1232869555121418265');
