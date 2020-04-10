/*
 Navicat Premium Data Transfer

 Source Server         : 学普开发测试库-185
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 140.246.123.185:3306
 Source Schema         : contentmanagersystem_db

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 10/04/2020 08:27:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for db_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `db_menu_info`;
CREATE TABLE `db_menu_info`  (
  `menu_info_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `menu_parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级菜单id',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型 0-菜单 1-按钮 2-app',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1048 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

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
INSERT INTO `db_user` VALUES ('1232869555121418242', 'admin', 'a66abb5684c45962d887564f08346e8d', '超级管理员', 1, -1, '', '2020-02-26 17:55:30', NULL, NULL);

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

SET FOREIGN_KEY_CHECKS = 1;
