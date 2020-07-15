/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : ticket

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 15/07/2020 09:03:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`user`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('admin', '74D839D98630E280DF752E8939454A6B');

-- ----------------------------
-- Table structure for common_user
-- ----------------------------
DROP TABLE IF EXISTS `common_user`;
CREATE TABLE `common_user`  (
  `user_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `true_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_user
-- ----------------------------
INSERT INTO `common_user` VALUES ('francis', '60412EE5DB0645FC314007D7D7E00E90', 'bee9acdc-84b4-4af9-af39-1528d2531153.jpg', '张三', '男', '17393121111', '1590225740@qq.com');

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight`  (
  `f_n` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班号',
  `f_s_p` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班起点',
  `f_e_p` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班终点',
  `f_s_a` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班起飞机场',
  `f_a_a` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班到达机场',
  `f_d_t` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '起飞(departure)时间',
  `f_a_t` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到达时间',
  `f_f_c_p` int(11) NOT NULL COMMENT '头等舱价格First class price',
  `f_s_c_p` int(11) NOT NULL COMMENT '商务舱价格',
  `f_t_c_p` int(11) NOT NULL COMMENT '经济舱价格',
  PRIMARY KEY (`f_n`) USING BTREE,
  UNIQUE INDEX `f_n`(`f_n`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '航班信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES ('CA1391', '北京', '郑州', '大兴机场', '新郑机场', '07:30', '12:00', 2100, 1500, 800);
INSERT INTO `flight` VALUES ('CA3060', '北京', '上海', '首都机场', '虹桥机场', '08:30', '12:30', 2100, 1600, 1200);
INSERT INTO `flight` VALUES ('3U8633', '重庆', '拉萨', '江北机场', '贡嘎机场', '06:20', '09:25', 1980, 1270, 640);
INSERT INTO `flight` VALUES ('GJ9734', '兰州', '绵阳', '中川机场', '南郊机场', '20:50', '22:10', 1280, 878, 218);
INSERT INTO `flight` VALUES ('EU2271', '成都', '兰州', '双流机场', '中川机场', '14:10', '15:40', 980, 560, 280);
INSERT INTO `flight` VALUES ('CZ3100', '北京', '广州', '首都机场', '白云机场', '18:30', '21:35', 4780, 1290, 270);
INSERT INTO `flight` VALUES ('MU2612', '成都', '武汉', '双流机场', '天河机场', '09:05', '11:15', 1900, 1200, 660);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `order_user` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '下单用户',
  `f_n` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '航班号',
  `p_name` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客姓名',
  `date` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单日期',
  `grade` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '舱别',
  `p_id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客身份证号',
  `contact` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人',
  `c_p` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (8, 'francis', 'SU2312', '冯宇翔', '2020-06-30', '头等舱', '510105111111111111', '冯宇翔', '13511111111');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES (30, '2020-6-30', 'Francis', '火钳刘明');

SET FOREIGN_KEY_CHECKS = 1;
