/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : myproject

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 14/07/2021 16:57:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for back_late
-- ----------------------------
DROP TABLE IF EXISTS `back_late`;
CREATE TABLE `back_late`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NULL DEFAULT NULL,
  `back_date` datetime(0) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_s_s`(`student_id`) USING BTREE,
  CONSTRAINT `fk_s_s` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_pid`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_pid` FOREIGN KEY (`parent_id`) REFERENCES `building` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES (1, '清华大学', NULL);
INSERT INTO `building` VALUES (2, '宿舍楼A', 1);
INSERT INTO `building` VALUES (3, '宿舍楼B', 1);
INSERT INTO `building` VALUES (5, '宿舍楼C', 1);
INSERT INTO `building` VALUES (6, 'A1入口', 2);
INSERT INTO `building` VALUES (13, 'A2入口', 2);
INSERT INTO `building` VALUES (14, 'A3入口', 2);
INSERT INTO `building` VALUES (15, 'B1入口', 3);
INSERT INTO `building` VALUES (16, 'B2入口', 3);
INSERT INTO `building` VALUES (17, 'B3入口', 3);
INSERT INTO `building` VALUES (18, 'C1入口', 5);
INSERT INTO `building` VALUES (19, 'C2入口', 5);
INSERT INTO `building` VALUES (20, '北京大学', NULL);
INSERT INTO `building` VALUES (21, '宿舍楼A', 20);

-- ----------------------------
-- Table structure for depart_application
-- ----------------------------
DROP TABLE IF EXISTS `depart_application`;
CREATE TABLE `depart_application`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_user_id` bigint(20) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `student_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_oui`(`apply_user_id`) USING BTREE,
  INDEX `fk_si`(`student_id`) USING BTREE,
  CONSTRAINT `fk_oui` FOREIGN KEY (`apply_user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_si` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of depart_application
-- ----------------------------
INSERT INTO `depart_application` VALUES (16, 23, '退学了', '2021-02-10 00:21:25', 2075);
INSERT INTO `depart_application` VALUES (17, 41, NULL, '2021-02-10 10:56:11', 2073);
INSERT INTO `depart_application` VALUES (18, 41, '不想住了', '2021-02-10 13:42:08', 2073);
INSERT INTO `depart_application` VALUES (19, 23, '不想住了', '2021-02-10 13:46:45', 2073);
INSERT INTO `depart_application` VALUES (20, 1, NULL, '2021-02-10 13:48:20', 2075);
INSERT INTO `depart_application` VALUES (21, 41, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2021-02-10 14:55:34', 2053);
INSERT INTO `depart_application` VALUES (22, 41, NULL, '2021-02-10 15:07:00', 2050);
INSERT INTO `depart_application` VALUES (23, 1, NULL, '2021-03-10 16:29:47', 2074);
INSERT INTO `depart_application` VALUES (25, 37, '不住了', '2021-03-13 12:08:26', 2050);
INSERT INTO `depart_application` VALUES (27, 29, NULL, '2021-03-18 13:47:14', 2069);
INSERT INTO `depart_application` VALUES (28, 24, '.....', '2021-05-07 14:08:31', 2033);

-- ----------------------------
-- Table structure for depart_application_user
-- ----------------------------
DROP TABLE IF EXISTS `depart_application_user`;
CREATE TABLE `depart_application_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operate_user_id` bigint(20) NULL DEFAULT NULL,
  `is_agree` tinyint(1) NULL DEFAULT NULL,
  `operate_time` datetime(0) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_op_uid`(`operate_user_id`) USING BTREE,
  INDEX `fk_dpId`(`application_id`) USING BTREE,
  CONSTRAINT `fk_dpId` FOREIGN KEY (`application_id`) REFERENCES `depart_application` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_op_uid` FOREIGN KEY (`operate_user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of depart_application_user
-- ----------------------------
INSERT INTO `depart_application_user` VALUES (16, 1, 0, '2021-02-10 10:53:20', '不通过', 16);
INSERT INTO `depart_application_user` VALUES (17, 43, 1, '2021-02-10 10:56:49', NULL, 17);
INSERT INTO `depart_application_user` VALUES (18, 23, 1, '2021-02-10 10:57:11', NULL, 17);
INSERT INTO `depart_application_user` VALUES (19, 1, 0, '2021-02-10 13:31:04', '没有申请理由', 17);
INSERT INTO `depart_application_user` VALUES (20, 43, 0, '2021-02-10 13:45:32', '不同意', 18);
INSERT INTO `depart_application_user` VALUES (21, 1, 1, '2021-02-10 13:47:26', NULL, 19);
INSERT INTO `depart_application_user` VALUES (22, 43, 1, '2021-02-10 15:02:57', NULL, 21);
INSERT INTO `depart_application_user` VALUES (23, 23, 1, '2021-02-10 15:03:22', NULL, 21);
INSERT INTO `depart_application_user` VALUES (24, 1, 1, '2021-02-10 15:04:28', '通过', 21);
INSERT INTO `depart_application_user` VALUES (25, 43, 0, '2021-03-13 12:09:17', '滚', 22);
INSERT INTO `depart_application_user` VALUES (26, 43, 1, '2021-03-13 12:09:30', '好', 25);
INSERT INTO `depart_application_user` VALUES (27, 23, 1, '2021-03-13 12:10:11', '行', 25);
INSERT INTO `depart_application_user` VALUES (28, 1, 0, '2021-03-13 12:10:38', '不行', 25);
INSERT INTO `depart_application_user` VALUES (30, 23, 1, '2021-03-18 13:47:51', NULL, 27);
INSERT INTO `depart_application_user` VALUES (31, 1, 0, '2021-03-18 13:48:28', NULL, 27);
INSERT INTO `depart_application_user` VALUES (32, 29, 1, '2021-05-07 14:12:56', '通过', 28);
INSERT INTO `depart_application_user` VALUES (33, 23, NULL, NULL, NULL, 28);

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parent`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_parent` FOREIGN KEY (`parent_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faculty
-- ----------------------------
INSERT INTO `faculty` VALUES (1, '清华大学', NULL, 2);
INSERT INTO `faculty` VALUES (2, '信息工程学院', 1, 0);
INSERT INTO `faculty` VALUES (4, '吉利汽车学院', 1, 5);
INSERT INTO `faculty` VALUES (5, '特种设备学院', 1, 4);
INSERT INTO `faculty` VALUES (7, '软件技术', 2, 1);
INSERT INTO `faculty` VALUES (10, '软件1811', 7, 1);
INSERT INTO `faculty` VALUES (11, '软件1812', 7, 2);
INSERT INTO `faculty` VALUES (12, '软件1813', 7, 3);
INSERT INTO `faculty` VALUES (13, '有嘉机电学院', 1, 5);
INSERT INTO `faculty` VALUES (14, '计算机技术', 2, 2);
INSERT INTO `faculty` VALUES (15, '计算机1821', 14, 1);
INSERT INTO `faculty` VALUES (16, '计算机1822', 14, 2);
INSERT INTO `faculty` VALUES (17, '应用电子技术', 2, 4);
INSERT INTO `faculty` VALUES (18, '应电1811', 17, 1);
INSERT INTO `faculty` VALUES (19, '应电1812', 17, 2);
INSERT INTO `faculty` VALUES (20, '应电1841', 17, 3);
INSERT INTO `faculty` VALUES (21, '信息安全技术', 2, 3);
INSERT INTO `faculty` VALUES (22, '信安1811', 21, 1);
INSERT INTO `faculty` VALUES (23, '信安1841', 21, 2);
INSERT INTO `faculty` VALUES (24, '北京大学', NULL, 1);
INSERT INTO `faculty` VALUES (25, '机械工程学院', 24, 0);
INSERT INTO `faculty` VALUES (26, '计算机学院', 24, 1);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `save_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upload_user` bigint(20) NOT NULL,
  `upload_time` datetime(0) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `md5`(`md5`) USING BTREE,
  INDEX `fk_userid`(`upload_user`) USING BTREE,
  CONSTRAINT `fk_userid` FOREIGN KEY (`upload_user`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (6, '01c8c897-a9ce-43e0-b344-827e70149849.png', '03b0d39583f48206768a7534e55bcpng.png', '08803B0D39583F48206768A7534E55BC', 1, '2021-03-19 16:39:20');
INSERT INTO `image` VALUES (7, '8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png', '006gMemDly8gk9wejsed7j30ro0rodgv.jpg', 'E258A24CD0D3C992BA15C7864D59BFB3', 1, '2021-03-19 16:39:25');
INSERT INTO `image` VALUES (8, '3d130778-d05a-4c75-9796-a04ed086c495.png', '0f4cf1af-2e31-11eb-a0ca-2016b988fa0d.png', '230AA9BB6ADEF187C6E1FFB2136AF2B7', 1, '2021-03-23 16:10:51');
INSERT INTO `image` VALUES (9, 'bf796bfa-8c1f-4352-83d6-514ec6b72c1c.png', '0ccef5a0-2e24-11eb-a19e-2016b988fa0d.png', '7D2C56441C0EF4FA6FEEE7FB770D048C', 25, '2021-03-23 16:11:38');
INSERT INTO `image` VALUES (10, '721e1934-39c1-4a39-a83e-46e613acda0e.png', '0d49e427-2e29-11eb-9a80-2016b988fa0d.png', 'FF5917F7C55C764D7EAD26C3D9DFCD04', 26, '2021-03-23 16:12:06');
INSERT INTO `image` VALUES (11, 'ecdbb708-1eba-4342-8c22-88481a5824cc.png', '02baac8c-2e33-11eb-87d5-2016b988fa0d.png', '7F2A11DB9A12FF072C06561671569661', 31, '2021-03-23 16:12:29');
INSERT INTO `image` VALUES (12, 'bc21e192-bc6e-4a6b-a543-d61ce4cb49b2.png', '1ebd0166-2e33-11eb-bb61-2016b988fa0d.png', '2F6F7613A3C93F0B3C700178283F0CFA', 43, '2021-03-23 16:13:12');
INSERT INTO `image` VALUES (14, '33bc7241-3694-432f-90f6-36cdd42cf8e7.png', '020519-js4-1602.jpg', '67C2F639889A3CC4224F0B8F9F39045F', 1, '2021-04-13 15:02:42');
INSERT INTO `image` VALUES (15, '82369579-e15b-4888-a3e0-3c70e4c0a698.png', 'ksc-71pc-178.jpg', '8DADE443CB11D9A53FB87601B5725789', 1, '2021-04-13 15:03:01');
INSERT INTO `image` VALUES (16, 'fd16a365-db2f-4140-8fbb-5bf4c301a2ee.png', 'PIA23265_hires.jpg', '23CAB9C2A47635F0BB4AEB9C23EE0538', 1, '2021-04-13 15:03:12');
INSERT INTO `image` VALUES (17, 'be20211b-267e-4d76-9bc4-11df6aebb7f7.png', 'aeroshell_vab_.jpg', 'C9F1B6143A7388BD78ACBCF5C2E77FFA', 1, '2021-04-13 15:03:15');
INSERT INTO `image` VALUES (18, '18358239-196d-4901-b2bd-3e849dc5227c.png', 'as11-44-6667.jpg', '092F8B5E3865A2C6BF75C0DF6CD16044', 1, '2021-04-13 15:15:03');
INSERT INTO `image` VALUES (19, '090325c6-3d90-49dd-ae88-58807f8d09f7.png', 'pia23056.jpg', 'DF1417E4885D31FAC4F07B77E5312D7F', 1, '2021-04-14 11:37:06');

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime(0) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_back` tinyint(1) NULL DEFAULT NULL,
  `student_id` bigint(20) NULL DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `back_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_student_id`(`student_id`) USING BTREE,
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_notice`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_notice` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (28, '今年放假时间：2021-02-06', 1, '2021-02-06 16:33:47');
INSERT INTO `notice` VALUES (48, '今年开学时间：2021年3月1日', 1, '2021-02-07 18:32:24');

-- ----------------------------
-- Table structure for notice_user
-- ----------------------------
DROP TABLE IF EXISTS `notice_user`;
CREATE TABLE `notice_user`  (
  `user_id` bigint(20) NOT NULL,
  `notice_id` bigint(20) NOT NULL,
  `is_read` tinyint(1) NULL DEFAULT NULL,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  INDEX `fk_msg1`(`notice_id`) USING BTREE,
  INDEX `fk_user1`(`user_id`) USING BTREE,
  CONSTRAINT `fk_msg1` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user1` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice_user
-- ----------------------------
INSERT INTO `notice_user` VALUES (1, 28, 1, 0);
INSERT INTO `notice_user` VALUES (23, 28, 1, 0);
INSERT INTO `notice_user` VALUES (24, 28, 1, 0);
INSERT INTO `notice_user` VALUES (25, 28, 0, 0);
INSERT INTO `notice_user` VALUES (26, 28, 1, 0);
INSERT INTO `notice_user` VALUES (27, 28, 1, 0);
INSERT INTO `notice_user` VALUES (28, 28, 0, 0);
INSERT INTO `notice_user` VALUES (29, 28, 0, 0);
INSERT INTO `notice_user` VALUES (30, 28, 0, 0);
INSERT INTO `notice_user` VALUES (31, 28, 0, 0);
INSERT INTO `notice_user` VALUES (32, 28, 0, 0);
INSERT INTO `notice_user` VALUES (33, 28, 0, 0);
INSERT INTO `notice_user` VALUES (34, 28, 0, 0);
INSERT INTO `notice_user` VALUES (35, 28, 0, 0);
INSERT INTO `notice_user` VALUES (36, 28, 0, 0);
INSERT INTO `notice_user` VALUES (37, 28, 1, 0);
INSERT INTO `notice_user` VALUES (38, 28, 0, 0);
INSERT INTO `notice_user` VALUES (39, 28, 0, 0);
INSERT INTO `notice_user` VALUES (40, 28, 0, 0);
INSERT INTO `notice_user` VALUES (41, 28, 0, 0);
INSERT INTO `notice_user` VALUES (42, 28, 0, 0);
INSERT INTO `notice_user` VALUES (43, 28, 1, 0);
INSERT INTO `notice_user` VALUES (1, 48, 1, 0);
INSERT INTO `notice_user` VALUES (23, 48, 1, 0);
INSERT INTO `notice_user` VALUES (24, 48, 1, 0);
INSERT INTO `notice_user` VALUES (25, 48, 0, 0);
INSERT INTO `notice_user` VALUES (26, 48, 0, 0);
INSERT INTO `notice_user` VALUES (27, 48, 0, 0);
INSERT INTO `notice_user` VALUES (28, 48, 0, 0);
INSERT INTO `notice_user` VALUES (29, 48, 0, 0);
INSERT INTO `notice_user` VALUES (30, 48, 0, 0);
INSERT INTO `notice_user` VALUES (31, 48, 0, 0);
INSERT INTO `notice_user` VALUES (32, 48, 0, 0);
INSERT INTO `notice_user` VALUES (33, 48, 0, 0);
INSERT INTO `notice_user` VALUES (34, 48, 0, 0);
INSERT INTO `notice_user` VALUES (35, 48, 0, 0);
INSERT INTO `notice_user` VALUES (36, 48, 0, 0);
INSERT INTO `notice_user` VALUES (37, 48, 1, 0);
INSERT INTO `notice_user` VALUES (38, 48, 0, 0);
INSERT INTO `notice_user` VALUES (39, 48, 0, 0);
INSERT INTO `notice_user` VALUES (40, 48, 0, 0);
INSERT INTO `notice_user` VALUES (41, 48, 0, 0);
INSERT INTO `notice_user` VALUES (42, 48, 0, 0);
INSERT INTO `notice_user` VALUES (43, 48, 1, 0);

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) NOT NULL,
  `describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `create_date` date NULL DEFAULT NULL,
  `finish_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `service___fk_rid`(`room_id`) USING BTREE,
  CONSTRAINT `service___fk_rid` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报修记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES (4, 1, '天花板塌了。。', 1, '2021-04-13', '2021-04-13');
INSERT INTO `repair` VALUES (5, 262, '卫生间漏水', 0, '2021-04-13', NULL);

-- ----------------------------
-- Table structure for repair_picture
-- ----------------------------
DROP TABLE IF EXISTS `repair_picture`;
CREATE TABLE `repair_picture`  (
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `repair_id` bigint(20) NULL DEFAULT NULL,
  INDEX `fk_repair_id`(`repair_id`) USING BTREE,
  CONSTRAINT `fk_repair_id` FOREIGN KEY (`repair_id`) REFERENCES `repair` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_picture
-- ----------------------------
INSERT INTO `repair_picture` VALUES ('18358239-196d-4901-b2bd-3e849dc5227c.png', 4);
INSERT INTO `repair_picture` VALUES ('8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png', 4);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `building_id` bigint(20) NULL DEFAULT NULL,
  `max_capacity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_buding_id`(`building_id`) USING BTREE,
  CONSTRAINT `fk_buding_id` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 'A1001', 6, 4);
INSERT INTO `room` VALUES (2, 'A1002', 6, 4);
INSERT INTO `room` VALUES (3, 'A1003', 6, 4);
INSERT INTO `room` VALUES (4, 'A1004', 6, 4);
INSERT INTO `room` VALUES (5, 'A1005', 6, 4);
INSERT INTO `room` VALUES (6, 'A1006', 6, 4);
INSERT INTO `room` VALUES (7, 'A1007', 6, 4);
INSERT INTO `room` VALUES (8, 'A1008', 6, 4);
INSERT INTO `room` VALUES (9, 'A1009', 6, 4);
INSERT INTO `room` VALUES (10, 'A1010', 6, 4);
INSERT INTO `room` VALUES (11, 'A2001', 6, 4);
INSERT INTO `room` VALUES (12, 'A2002', 6, 4);
INSERT INTO `room` VALUES (13, 'A2003', 6, 4);
INSERT INTO `room` VALUES (14, 'A2004', 6, 4);
INSERT INTO `room` VALUES (15, 'A2005', 6, 4);
INSERT INTO `room` VALUES (16, 'A2006', 6, 4);
INSERT INTO `room` VALUES (17, 'A2007', 6, 4);
INSERT INTO `room` VALUES (18, 'A2008', 6, 4);
INSERT INTO `room` VALUES (19, 'A2009', 6, 4);
INSERT INTO `room` VALUES (20, 'A2010', 6, 4);
INSERT INTO `room` VALUES (21, 'A3001', 6, 4);
INSERT INTO `room` VALUES (22, 'A3002', 6, 4);
INSERT INTO `room` VALUES (23, 'A3003', 6, 4);
INSERT INTO `room` VALUES (24, 'A3004', 6, 4);
INSERT INTO `room` VALUES (25, 'A3005', 6, 4);
INSERT INTO `room` VALUES (26, 'A3006', 6, 4);
INSERT INTO `room` VALUES (27, 'A3007', 6, 4);
INSERT INTO `room` VALUES (28, 'A3008', 6, 4);
INSERT INTO `room` VALUES (29, 'A3009', 6, 4);
INSERT INTO `room` VALUES (30, 'A3010', 6, 4);
INSERT INTO `room` VALUES (31, 'A4001', 6, 4);
INSERT INTO `room` VALUES (32, 'A4002', 6, 4);
INSERT INTO `room` VALUES (33, 'A4003', 6, 4);
INSERT INTO `room` VALUES (34, 'A4004', 6, 4);
INSERT INTO `room` VALUES (35, 'A4005', 6, 4);
INSERT INTO `room` VALUES (36, 'A4006', 6, 4);
INSERT INTO `room` VALUES (37, 'A4007', 6, 4);
INSERT INTO `room` VALUES (38, 'A4008', 6, 4);
INSERT INTO `room` VALUES (39, 'A4009', 6, 4);
INSERT INTO `room` VALUES (40, 'A4010', 6, 4);
INSERT INTO `room` VALUES (41, 'A5001', 6, 4);
INSERT INTO `room` VALUES (42, 'A5002', 6, 4);
INSERT INTO `room` VALUES (43, 'A5003', 6, 4);
INSERT INTO `room` VALUES (44, 'A5004', 6, 4);
INSERT INTO `room` VALUES (45, 'A5005', 6, 4);
INSERT INTO `room` VALUES (46, 'A5006', 6, 4);
INSERT INTO `room` VALUES (47, 'A5007', 6, 4);
INSERT INTO `room` VALUES (48, 'A5008', 6, 4);
INSERT INTO `room` VALUES (49, 'A5009', 6, 4);
INSERT INTO `room` VALUES (50, 'A5010', 6, 4);
INSERT INTO `room` VALUES (51, 'A6001', 6, 4);
INSERT INTO `room` VALUES (52, 'A6002', 6, 4);
INSERT INTO `room` VALUES (53, 'A6003', 6, 4);
INSERT INTO `room` VALUES (54, 'A6004', 6, 4);
INSERT INTO `room` VALUES (55, 'A6005', 6, 4);
INSERT INTO `room` VALUES (56, 'A6006', 6, 4);
INSERT INTO `room` VALUES (57, 'A6007', 6, 4);
INSERT INTO `room` VALUES (58, 'A6008', 6, 4);
INSERT INTO `room` VALUES (59, 'A6009', 6, 4);
INSERT INTO `room` VALUES (60, 'A6010', 6, 4);
INSERT INTO `room` VALUES (61, 'A1011', 13, 6);
INSERT INTO `room` VALUES (62, 'A1012', 13, 6);
INSERT INTO `room` VALUES (63, 'A1013', 13, 6);
INSERT INTO `room` VALUES (64, 'A1014', 13, 6);
INSERT INTO `room` VALUES (65, 'A1015', 13, 6);
INSERT INTO `room` VALUES (66, 'A1016', 13, 6);
INSERT INTO `room` VALUES (67, 'A1017', 13, 6);
INSERT INTO `room` VALUES (68, 'A1018', 13, 6);
INSERT INTO `room` VALUES (69, 'A1019', 13, 6);
INSERT INTO `room` VALUES (70, 'A1020', 13, 6);
INSERT INTO `room` VALUES (71, 'A2011', 13, 6);
INSERT INTO `room` VALUES (72, 'A2012', 13, 6);
INSERT INTO `room` VALUES (73, 'A2013', 13, 6);
INSERT INTO `room` VALUES (74, 'A2014', 13, 6);
INSERT INTO `room` VALUES (75, 'A2015', 13, 6);
INSERT INTO `room` VALUES (76, 'A2016', 13, 6);
INSERT INTO `room` VALUES (77, 'A2017', 13, 6);
INSERT INTO `room` VALUES (78, 'A2018', 13, 6);
INSERT INTO `room` VALUES (79, 'A2019', 13, 6);
INSERT INTO `room` VALUES (80, 'A2020', 13, 6);
INSERT INTO `room` VALUES (81, 'A3011', 13, 6);
INSERT INTO `room` VALUES (82, 'A3012', 13, 6);
INSERT INTO `room` VALUES (83, 'A3013', 13, 6);
INSERT INTO `room` VALUES (84, 'A3014', 13, 6);
INSERT INTO `room` VALUES (85, 'A3015', 13, 6);
INSERT INTO `room` VALUES (86, 'A3016', 13, 6);
INSERT INTO `room` VALUES (87, 'A3017', 13, 6);
INSERT INTO `room` VALUES (88, 'A3018', 13, 6);
INSERT INTO `room` VALUES (89, 'A3019', 13, 6);
INSERT INTO `room` VALUES (90, 'A3020', 13, 6);
INSERT INTO `room` VALUES (91, 'A4011', 13, 6);
INSERT INTO `room` VALUES (92, 'A4012', 13, 6);
INSERT INTO `room` VALUES (93, 'A4013', 13, 6);
INSERT INTO `room` VALUES (94, 'A4014', 13, 6);
INSERT INTO `room` VALUES (95, 'A4015', 13, 6);
INSERT INTO `room` VALUES (96, 'A4016', 13, 6);
INSERT INTO `room` VALUES (97, 'A4017', 13, 6);
INSERT INTO `room` VALUES (98, 'A4018', 13, 6);
INSERT INTO `room` VALUES (99, 'A4019', 13, 6);
INSERT INTO `room` VALUES (100, 'A4020', 13, 6);
INSERT INTO `room` VALUES (101, 'A5011', 13, 6);
INSERT INTO `room` VALUES (102, 'A5012', 13, 6);
INSERT INTO `room` VALUES (103, 'A5013', 13, 6);
INSERT INTO `room` VALUES (104, 'A5014', 13, 6);
INSERT INTO `room` VALUES (105, 'A5015', 13, 6);
INSERT INTO `room` VALUES (106, 'A5016', 13, 6);
INSERT INTO `room` VALUES (107, 'A5017', 13, 6);
INSERT INTO `room` VALUES (108, 'A5018', 13, 6);
INSERT INTO `room` VALUES (109, 'A5019', 13, 6);
INSERT INTO `room` VALUES (110, 'A5020', 13, 6);
INSERT INTO `room` VALUES (111, 'A6011', 13, 6);
INSERT INTO `room` VALUES (112, 'A6012', 13, 6);
INSERT INTO `room` VALUES (113, 'A6013', 13, 6);
INSERT INTO `room` VALUES (114, 'A6014', 13, 6);
INSERT INTO `room` VALUES (115, 'A6015', 13, 6);
INSERT INTO `room` VALUES (116, 'A6016', 13, 6);
INSERT INTO `room` VALUES (117, 'A6017', 13, 6);
INSERT INTO `room` VALUES (118, 'A6018', 13, 6);
INSERT INTO `room` VALUES (119, 'A6019', 13, 6);
INSERT INTO `room` VALUES (120, 'A6020', 13, 6);
INSERT INTO `room` VALUES (121, 'A1021', 14, 6);
INSERT INTO `room` VALUES (122, 'A1022', 14, 6);
INSERT INTO `room` VALUES (123, 'A1023', 14, 6);
INSERT INTO `room` VALUES (124, 'A1024', 14, 6);
INSERT INTO `room` VALUES (125, 'A1025', 14, 6);
INSERT INTO `room` VALUES (126, 'A1026', 14, 6);
INSERT INTO `room` VALUES (127, 'A1027', 14, 6);
INSERT INTO `room` VALUES (128, 'A1028', 14, 6);
INSERT INTO `room` VALUES (129, 'A1029', 14, 6);
INSERT INTO `room` VALUES (130, 'A1030', 14, 6);
INSERT INTO `room` VALUES (131, 'A2021', 14, 6);
INSERT INTO `room` VALUES (132, 'A2022', 14, 6);
INSERT INTO `room` VALUES (133, 'A2023', 14, 6);
INSERT INTO `room` VALUES (134, 'A2024', 14, 6);
INSERT INTO `room` VALUES (135, 'A2025', 14, 6);
INSERT INTO `room` VALUES (136, 'A2026', 14, 6);
INSERT INTO `room` VALUES (137, 'A2027', 14, 6);
INSERT INTO `room` VALUES (138, 'A2028', 14, 6);
INSERT INTO `room` VALUES (139, 'A2029', 14, 6);
INSERT INTO `room` VALUES (140, 'A2030', 14, 6);
INSERT INTO `room` VALUES (141, 'A3021', 14, 6);
INSERT INTO `room` VALUES (142, 'A3022', 14, 6);
INSERT INTO `room` VALUES (143, 'A3023', 14, 6);
INSERT INTO `room` VALUES (144, 'A3024', 14, 6);
INSERT INTO `room` VALUES (145, 'A3025', 14, 6);
INSERT INTO `room` VALUES (146, 'A3026', 14, 6);
INSERT INTO `room` VALUES (147, 'A3027', 14, 6);
INSERT INTO `room` VALUES (148, 'A3028', 14, 6);
INSERT INTO `room` VALUES (149, 'A3029', 14, 6);
INSERT INTO `room` VALUES (150, 'A3030', 14, 6);
INSERT INTO `room` VALUES (151, 'A4021', 14, 6);
INSERT INTO `room` VALUES (152, 'A4022', 14, 6);
INSERT INTO `room` VALUES (153, 'A4023', 14, 6);
INSERT INTO `room` VALUES (154, 'A4024', 14, 6);
INSERT INTO `room` VALUES (155, 'A4025', 14, 6);
INSERT INTO `room` VALUES (156, 'A4026', 14, 6);
INSERT INTO `room` VALUES (157, 'A4027', 14, 6);
INSERT INTO `room` VALUES (158, 'A4028', 14, 6);
INSERT INTO `room` VALUES (159, 'A4029', 14, 6);
INSERT INTO `room` VALUES (160, 'A4030', 14, 6);
INSERT INTO `room` VALUES (161, 'A5021', 14, 6);
INSERT INTO `room` VALUES (162, 'A5022', 14, 6);
INSERT INTO `room` VALUES (163, 'A5023', 14, 6);
INSERT INTO `room` VALUES (164, 'A5024', 14, 6);
INSERT INTO `room` VALUES (165, 'A5025', 14, 6);
INSERT INTO `room` VALUES (166, 'A5026', 14, 6);
INSERT INTO `room` VALUES (167, 'A5027', 14, 6);
INSERT INTO `room` VALUES (168, 'A5028', 14, 6);
INSERT INTO `room` VALUES (169, 'A5029', 14, 6);
INSERT INTO `room` VALUES (170, 'A5030', 14, 6);
INSERT INTO `room` VALUES (171, 'A6021', 14, 6);
INSERT INTO `room` VALUES (172, 'A6022', 14, 6);
INSERT INTO `room` VALUES (173, 'A6023', 14, 6);
INSERT INTO `room` VALUES (174, 'A6024', 14, 6);
INSERT INTO `room` VALUES (175, 'A6025', 14, 6);
INSERT INTO `room` VALUES (176, 'A6026', 14, 6);
INSERT INTO `room` VALUES (177, 'A6027', 14, 6);
INSERT INTO `room` VALUES (178, 'A6028', 14, 6);
INSERT INTO `room` VALUES (179, 'A6029', 14, 6);
INSERT INTO `room` VALUES (180, 'A6030', 14, 6);
INSERT INTO `room` VALUES (181, 'B1001', 15, 6);
INSERT INTO `room` VALUES (182, 'B1002', 15, 6);
INSERT INTO `room` VALUES (183, 'B1003', 15, 6);
INSERT INTO `room` VALUES (184, 'B1004', 15, 6);
INSERT INTO `room` VALUES (185, 'B1005', 15, 6);
INSERT INTO `room` VALUES (186, 'B1006', 15, 6);
INSERT INTO `room` VALUES (187, 'B1007', 15, 6);
INSERT INTO `room` VALUES (188, 'B1008', 15, 6);
INSERT INTO `room` VALUES (189, 'B1009', 15, 6);
INSERT INTO `room` VALUES (190, 'B1010', 15, 6);
INSERT INTO `room` VALUES (191, 'B1011', 16, 6);
INSERT INTO `room` VALUES (192, 'B1012', 16, 6);
INSERT INTO `room` VALUES (193, 'B1013', 16, 6);
INSERT INTO `room` VALUES (194, 'B1014', 16, 6);
INSERT INTO `room` VALUES (195, 'B1015', 16, 6);
INSERT INTO `room` VALUES (196, 'B1016', 16, 6);
INSERT INTO `room` VALUES (197, 'B1017', 16, 6);
INSERT INTO `room` VALUES (198, 'B1018', 16, 6);
INSERT INTO `room` VALUES (199, 'B1019', 16, 6);
INSERT INTO `room` VALUES (200, 'B1020', 16, 6);
INSERT INTO `room` VALUES (201, 'B1021', 17, 6);
INSERT INTO `room` VALUES (202, 'B1022', 17, 6);
INSERT INTO `room` VALUES (203, 'B1023', 17, 6);
INSERT INTO `room` VALUES (204, 'B1024', 17, 6);
INSERT INTO `room` VALUES (205, 'B1025', 17, 6);
INSERT INTO `room` VALUES (206, 'B1026', 17, 6);
INSERT INTO `room` VALUES (207, 'B1027', 17, 6);
INSERT INTO `room` VALUES (208, 'B1028', 17, 6);
INSERT INTO `room` VALUES (209, 'B1029', 17, 6);
INSERT INTO `room` VALUES (210, 'B1030', 17, 6);
INSERT INTO `room` VALUES (211, 'B2001', 15, 6);
INSERT INTO `room` VALUES (212, 'B2002', 15, 6);
INSERT INTO `room` VALUES (213, 'B2003', 15, 6);
INSERT INTO `room` VALUES (214, 'B2004', 15, 6);
INSERT INTO `room` VALUES (215, 'B2005', 15, 6);
INSERT INTO `room` VALUES (216, 'B2006', 15, 6);
INSERT INTO `room` VALUES (217, 'B2007', 15, 6);
INSERT INTO `room` VALUES (218, 'B2008', 15, 6);
INSERT INTO `room` VALUES (219, 'B2009', 15, 6);
INSERT INTO `room` VALUES (220, 'B2010', 15, 6);
INSERT INTO `room` VALUES (221, 'B2011', 16, 6);
INSERT INTO `room` VALUES (222, 'B2012', 16, 6);
INSERT INTO `room` VALUES (223, 'B2013', 16, 6);
INSERT INTO `room` VALUES (224, 'B2014', 16, 6);
INSERT INTO `room` VALUES (225, 'B2015', 16, 6);
INSERT INTO `room` VALUES (226, 'B2016', 16, 6);
INSERT INTO `room` VALUES (227, 'B2017', 16, 6);
INSERT INTO `room` VALUES (228, 'B2018', 16, 6);
INSERT INTO `room` VALUES (229, 'B2019', 16, 6);
INSERT INTO `room` VALUES (230, 'B2020', 16, 6);
INSERT INTO `room` VALUES (231, 'B2021', 17, 6);
INSERT INTO `room` VALUES (232, 'B2022', 17, 6);
INSERT INTO `room` VALUES (233, 'B2023', 17, 6);
INSERT INTO `room` VALUES (234, 'B2024', 17, 6);
INSERT INTO `room` VALUES (235, 'B2025', 17, 6);
INSERT INTO `room` VALUES (236, 'B2026', 17, 6);
INSERT INTO `room` VALUES (237, 'B2027', 17, 6);
INSERT INTO `room` VALUES (238, 'B2028', 17, 6);
INSERT INTO `room` VALUES (239, 'B2029', 17, 6);
INSERT INTO `room` VALUES (240, 'B2030', 17, 6);
INSERT INTO `room` VALUES (241, 'B3001', 15, 6);
INSERT INTO `room` VALUES (242, 'B3002', 15, 6);
INSERT INTO `room` VALUES (243, 'B3003', 15, 6);
INSERT INTO `room` VALUES (244, 'B3004', 15, 6);
INSERT INTO `room` VALUES (245, 'B3005', 15, 6);
INSERT INTO `room` VALUES (246, 'B3006', 15, 6);
INSERT INTO `room` VALUES (247, 'B3007', 15, 6);
INSERT INTO `room` VALUES (248, 'B3008', 15, 6);
INSERT INTO `room` VALUES (249, 'B3009', 15, 6);
INSERT INTO `room` VALUES (250, 'B3010', 15, 6);
INSERT INTO `room` VALUES (251, 'B3011', 16, 6);
INSERT INTO `room` VALUES (252, 'B3012', 16, 6);
INSERT INTO `room` VALUES (253, 'B3013', 16, 6);
INSERT INTO `room` VALUES (254, 'B3014', 16, 6);
INSERT INTO `room` VALUES (255, 'B3015', 16, 6);
INSERT INTO `room` VALUES (256, 'B3016', 16, 6);
INSERT INTO `room` VALUES (257, 'B3017', 16, 6);
INSERT INTO `room` VALUES (258, 'B3018', 16, 6);
INSERT INTO `room` VALUES (259, 'B3019', 16, 6);
INSERT INTO `room` VALUES (260, 'B3020', 16, 6);
INSERT INTO `room` VALUES (261, 'B3021', 17, 6);
INSERT INTO `room` VALUES (262, 'B3022', 17, 6);
INSERT INTO `room` VALUES (263, 'B3023', 17, 6);
INSERT INTO `room` VALUES (264, 'B3024', 17, 6);
INSERT INTO `room` VALUES (265, 'B3025', 17, 6);
INSERT INTO `room` VALUES (266, 'B3026', 17, 6);
INSERT INTO `room` VALUES (267, 'B3027', 17, 6);
INSERT INTO `room` VALUES (268, 'B3028', 17, 6);
INSERT INTO `room` VALUES (269, 'B3029', 17, 6);
INSERT INTO `room` VALUES (270, 'B3030', 17, 6);
INSERT INTO `room` VALUES (271, 'B4001', 15, 6);
INSERT INTO `room` VALUES (272, 'B4002', 15, 6);
INSERT INTO `room` VALUES (273, 'B4003', 15, 6);
INSERT INTO `room` VALUES (274, 'B4004', 15, 6);
INSERT INTO `room` VALUES (275, 'B4005', 15, 6);
INSERT INTO `room` VALUES (276, 'B4006', 15, 6);
INSERT INTO `room` VALUES (277, 'B4007', 15, 6);
INSERT INTO `room` VALUES (278, 'B4008', 15, 6);
INSERT INTO `room` VALUES (279, 'B4009', 15, 6);
INSERT INTO `room` VALUES (280, 'B4010', 15, 6);
INSERT INTO `room` VALUES (281, 'B4011', 16, 6);
INSERT INTO `room` VALUES (282, 'B4012', 16, 6);
INSERT INTO `room` VALUES (283, 'B4013', 16, 6);
INSERT INTO `room` VALUES (284, 'B4014', 16, 6);
INSERT INTO `room` VALUES (285, 'B4015', 16, 6);
INSERT INTO `room` VALUES (286, 'B4016', 16, 6);
INSERT INTO `room` VALUES (287, 'B4017', 16, 6);
INSERT INTO `room` VALUES (288, 'B4018', 16, 6);
INSERT INTO `room` VALUES (289, 'B4019', 16, 6);
INSERT INTO `room` VALUES (290, 'B4020', 16, 6);
INSERT INTO `room` VALUES (291, 'B4021', 17, 6);
INSERT INTO `room` VALUES (292, 'B4022', 17, 6);
INSERT INTO `room` VALUES (293, 'B4023', 17, 6);
INSERT INTO `room` VALUES (294, 'B4024', 17, 6);
INSERT INTO `room` VALUES (295, 'B4025', 17, 6);
INSERT INTO `room` VALUES (296, 'B4026', 17, 6);
INSERT INTO `room` VALUES (297, 'B4027', 17, 6);
INSERT INTO `room` VALUES (298, 'B4028', 17, 6);
INSERT INTO `room` VALUES (299, 'B4029', 17, 6);
INSERT INTO `room` VALUES (300, 'B4030', 17, 6);
INSERT INTO `room` VALUES (301, 'C1001', 18, 4);
INSERT INTO `room` VALUES (302, 'C1002', 18, 4);
INSERT INTO `room` VALUES (303, 'C1003', 18, 4);
INSERT INTO `room` VALUES (304, 'C1004', 18, 4);
INSERT INTO `room` VALUES (305, 'C1005', 18, 4);
INSERT INTO `room` VALUES (306, 'C1006', 18, 4);
INSERT INTO `room` VALUES (307, 'C1007', 18, 4);
INSERT INTO `room` VALUES (308, 'C1008', 18, 4);
INSERT INTO `room` VALUES (309, 'C1009', 18, 4);
INSERT INTO `room` VALUES (310, 'C1010', 18, 4);
INSERT INTO `room` VALUES (311, 'C1011', 19, 4);
INSERT INTO `room` VALUES (312, 'C1012', 19, 4);
INSERT INTO `room` VALUES (313, 'C1013', 19, 4);
INSERT INTO `room` VALUES (314, 'C1014', 19, 4);
INSERT INTO `room` VALUES (315, 'C1015', 19, 4);
INSERT INTO `room` VALUES (316, 'C1016', 19, 4);
INSERT INTO `room` VALUES (317, 'C1017', 19, 4);
INSERT INTO `room` VALUES (318, 'C1018', 19, 4);
INSERT INTO `room` VALUES (319, 'C1019', 19, 4);
INSERT INTO `room` VALUES (320, 'C1020', 19, 4);
INSERT INTO `room` VALUES (321, 'C2001', 18, 4);
INSERT INTO `room` VALUES (322, 'C2002', 18, 4);
INSERT INTO `room` VALUES (323, 'C2003', 18, 4);
INSERT INTO `room` VALUES (324, 'C2004', 18, 4);
INSERT INTO `room` VALUES (325, 'C2005', 18, 4);
INSERT INTO `room` VALUES (326, 'C2006', 18, 4);
INSERT INTO `room` VALUES (327, 'C2007', 18, 4);
INSERT INTO `room` VALUES (328, 'C2008', 18, 4);
INSERT INTO `room` VALUES (329, 'C2009', 18, 4);
INSERT INTO `room` VALUES (330, 'C2010', 18, 4);
INSERT INTO `room` VALUES (331, 'C2011', 19, 4);
INSERT INTO `room` VALUES (332, 'C2012', 19, 4);
INSERT INTO `room` VALUES (333, 'C2013', 19, 4);
INSERT INTO `room` VALUES (334, 'C2014', 19, 4);
INSERT INTO `room` VALUES (335, 'C2015', 19, 4);
INSERT INTO `room` VALUES (336, 'C2016', 19, 4);
INSERT INTO `room` VALUES (337, 'C2017', 19, 4);
INSERT INTO `room` VALUES (338, 'C2018', 19, 4);
INSERT INTO `room` VALUES (339, 'C2019', 19, 4);
INSERT INTO `room` VALUES (340, 'C2020', 19, 4);
INSERT INTO `room` VALUES (341, 'C3001', 18, 4);
INSERT INTO `room` VALUES (342, 'C3002', 18, 4);
INSERT INTO `room` VALUES (343, 'C3003', 18, 4);
INSERT INTO `room` VALUES (344, 'C3004', 18, 4);
INSERT INTO `room` VALUES (345, 'C3005', 18, 4);
INSERT INTO `room` VALUES (346, 'C3006', 18, 4);
INSERT INTO `room` VALUES (347, 'C3007', 18, 4);
INSERT INTO `room` VALUES (348, 'C3008', 18, 4);
INSERT INTO `room` VALUES (349, 'C3009', 18, 4);
INSERT INTO `room` VALUES (350, 'C3010', 18, 4);
INSERT INTO `room` VALUES (351, 'C3011', 19, 4);
INSERT INTO `room` VALUES (352, 'C3012', 19, 4);
INSERT INTO `room` VALUES (353, 'C3013', 19, 4);
INSERT INTO `room` VALUES (354, 'C3014', 19, 4);
INSERT INTO `room` VALUES (355, 'C3015', 19, 4);
INSERT INTO `room` VALUES (356, 'C3016', 19, 4);
INSERT INTO `room` VALUES (357, 'C3017', 19, 4);
INSERT INTO `room` VALUES (358, 'C3018', 19, 4);
INSERT INTO `room` VALUES (359, 'C3019', 19, 4);
INSERT INTO `room` VALUES (360, 'C3020', 19, 4);
INSERT INTO `room` VALUES (361, 'C4001', 18, 4);
INSERT INTO `room` VALUES (362, 'C4002', 18, 4);
INSERT INTO `room` VALUES (363, 'C4003', 18, 4);
INSERT INTO `room` VALUES (364, 'C4004', 18, 4);
INSERT INTO `room` VALUES (365, 'C4005', 18, 4);
INSERT INTO `room` VALUES (366, 'C4006', 18, 4);
INSERT INTO `room` VALUES (367, 'C4007', 18, 4);
INSERT INTO `room` VALUES (368, 'C4008', 18, 4);
INSERT INTO `room` VALUES (369, 'C4009', 18, 4);
INSERT INTO `room` VALUES (370, 'C4010', 18, 4);
INSERT INTO `room` VALUES (371, 'C4011', 19, 4);
INSERT INTO `room` VALUES (372, 'C4012', 19, 4);
INSERT INTO `room` VALUES (373, 'C4013', 19, 4);
INSERT INTO `room` VALUES (374, 'C4014', 19, 4);
INSERT INTO `room` VALUES (375, 'C4015', 19, 4);
INSERT INTO `room` VALUES (376, 'C4016', 19, 4);
INSERT INTO `room` VALUES (377, 'C4017', 19, 4);
INSERT INTO `room` VALUES (378, 'C4018', 19, 4);
INSERT INTO `room` VALUES (379, 'C4019', 19, 4);
INSERT INTO `room` VALUES (380, 'C4020', 19, 4);
INSERT INTO `room` VALUES (381, 'C5001', 18, 4);
INSERT INTO `room` VALUES (382, 'C5002', 18, 4);
INSERT INTO `room` VALUES (383, 'C5003', 18, 4);
INSERT INTO `room` VALUES (384, 'C5004', 18, 4);
INSERT INTO `room` VALUES (385, 'C5005', 18, 4);
INSERT INTO `room` VALUES (386, 'C5006', 18, 4);
INSERT INTO `room` VALUES (387, 'C5007', 18, 4);
INSERT INTO `room` VALUES (388, 'C5008', 18, 4);
INSERT INTO `room` VALUES (389, 'C5009', 18, 4);
INSERT INTO `room` VALUES (390, 'C5010', 18, 4);
INSERT INTO `room` VALUES (391, 'C5011', 19, 4);
INSERT INTO `room` VALUES (392, 'C5012', 19, 4);
INSERT INTO `room` VALUES (393, 'C5013', 19, 4);
INSERT INTO `room` VALUES (394, 'C5014', 19, 4);
INSERT INTO `room` VALUES (395, 'C5015', 19, 4);
INSERT INTO `room` VALUES (396, 'C5016', 19, 4);
INSERT INTO `room` VALUES (397, 'C5017', 19, 4);
INSERT INTO `room` VALUES (398, 'C5018', 19, 4);
INSERT INTO `room` VALUES (399, 'C5019', 19, 4);
INSERT INTO `room` VALUES (400, 'C5020', 19, 4);
INSERT INTO `room` VALUES (401, 'A1001', 21, 4);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `room_id` bigint(20) NULL DEFAULT NULL,
  `faculty_id` bigint(20) NULL DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registration_date` date NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_leave` tinyint(1) NULL DEFAULT 0,
  `is_delete` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_s_r`(`room_id`) USING BTREE,
  CONSTRAINT `fk_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_s_r` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2084 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (5, '张娜', 130, 22, '2151797766', '2021-02-03', '13807147436', NULL, 0, 0);
INSERT INTO `student` VALUES (6, '冯秀兰', 271, 12, '1831200243', '2021-02-03', '13300384785', NULL, 0, 0);
INSERT INTO `student` VALUES (7, '张红梅', 136, 19, '2527799207', '2021-02-03', '13404306509', NULL, 0, 0);
INSERT INTO `student` VALUES (8, '张玉兰', 51, 16, '1275088524', '2021-02-03', '15602703996', NULL, 0, 0);
INSERT INTO `student` VALUES (9, '韩桂珍', 238, 16, '4673563850', '2021-02-03', '15308715556', NULL, 0, 0);
INSERT INTO `student` VALUES (10, '李玉英', 372, 16, '9224218663', '2021-02-03', '15908630968', NULL, 0, 0);
INSERT INTO `student` VALUES (11, '赵莹', 57, 16, '3087948245', '2021-02-03', '15904484430', NULL, 0, 0);
INSERT INTO `student` VALUES (12, '郑莹', 353, 16, '6810855538', '2021-02-03', '13400300878', NULL, 0, 0);
INSERT INTO `student` VALUES (13, '李建国', 112, 11, '8221754625', '2021-02-03', '15508193119', NULL, 0, 0);
INSERT INTO `student` VALUES (14, '郑瑜', 318, 23, '9319598270', '2021-02-03', '13905658761', NULL, 0, 0);
INSERT INTO `student` VALUES (15, '吴小红', 378, 20, '7772315118', '2021-02-03', '13108178007', NULL, 0, 0);
INSERT INTO `student` VALUES (16, '张建', 324, 15, '4466889873', '2021-02-03', '15205454002', NULL, 0, 0);
INSERT INTO `student` VALUES (17, '庞雪梅', 195, 15, '9079307402', '2021-02-03', '15004419076', NULL, 0, 0);
INSERT INTO `student` VALUES (18, '郑凤兰', 89, 16, '2651056926', '2021-02-03', '13005245159', NULL, 0, 0);
INSERT INTO `student` VALUES (19, '漆兵', 142, 10, '2539710146', '2021-02-03', '13202623189', NULL, 0, 0);
INSERT INTO `student` VALUES (20, '刘林', 168, 16, '6660667818', '2021-02-03', '13505396977', NULL, 0, 0);
INSERT INTO `student` VALUES (21, '朱彬', 354, 19, '2056651270', '2021-02-03', '13404170221', NULL, 0, 0);
INSERT INTO `student` VALUES (22, '林秀云', 246, 20, '2983622793', '2021-02-03', '15902771446', NULL, 0, 0);
INSERT INTO `student` VALUES (23, '徐英', 146, 15, '6529505115', '2021-02-03', '13404782324', NULL, 0, 0);
INSERT INTO `student` VALUES (24, '李静', 95, 18, '2321249971', '2021-02-03', '15505337465', NULL, 0, 0);
INSERT INTO `student` VALUES (25, '夏鹏', 228, 10, '8062590640', '2021-02-03', '13404490444', NULL, 0, 0);
INSERT INTO `student` VALUES (26, '何红霞', 7, 19, '0978814411', '2021-02-03', '13903104091', NULL, 0, 0);
INSERT INTO `student` VALUES (27, '丁强', 286, 15, '9330067915', '2021-02-03', '15008423537', NULL, 0, 0);
INSERT INTO `student` VALUES (28, '李刚', 265, 18, '8603713126', '2021-02-03', '15106866179', NULL, 0, 0);
INSERT INTO `student` VALUES (29, '周玉梅', 161, 11, '4691404051', '2021-02-03', '13201865693', NULL, 0, 0);
INSERT INTO `student` VALUES (30, '贺艳', 373, 10, '7053623812', '2021-02-03', '13202595926', NULL, 0, 0);
INSERT INTO `student` VALUES (31, '冯健', 11, 23, '7642086095', '2021-02-03', '13201680945', NULL, 0, 0);
INSERT INTO `student` VALUES (32, '叶成', 30, 22, '6757773592', '2021-02-03', '15305000516', NULL, 0, 0);
INSERT INTO `student` VALUES (33, '刘军', 89, 10, '1606044926', '2021-02-03', '15306983797', NULL, 0, 0);
INSERT INTO `student` VALUES (34, '金桂兰', 92, 23, '2909533827', '2021-02-03', '13407495290', NULL, 0, 0);
INSERT INTO `student` VALUES (35, '潘磊', 374, 20, '7213999945', '2021-02-03', '15601940723', NULL, 0, 0);
INSERT INTO `student` VALUES (36, '谢磊', 109, 15, '2438052897', '2021-02-03', '13308031436', NULL, 0, 0);
INSERT INTO `student` VALUES (37, '叶辉', 136, 11, '3381244267', '2021-02-03', '13803592348', NULL, 0, 0);
INSERT INTO `student` VALUES (38, '胡桂兰', 146, 18, '4462561382', '2021-02-03', '15205808383', NULL, 0, 0);
INSERT INTO `student` VALUES (39, '田桂荣', 349, 18, '4882913702', '2021-02-03', '15608884030', NULL, 0, 0);
INSERT INTO `student` VALUES (40, '漆兵', 100, 22, '6969863296', '2021-02-03', '15308377014', NULL, 0, 0);
INSERT INTO `student` VALUES (41, '温丽丽', 366, 22, '7443540825', '2021-02-03', '13407510445', NULL, 0, 0);
INSERT INTO `student` VALUES (42, '郑旭', 229, 23, '1421499072', '2021-02-03', '15802636428', NULL, 0, 0);
INSERT INTO `student` VALUES (43, '赵辉', 243, 12, '3961359183', '2021-02-03', '15203904818', NULL, 0, 0);
INSERT INTO `student` VALUES (44, '马欣', 275, 11, '6039319992', '2021-02-03', '13504398935', NULL, 0, 0);
INSERT INTO `student` VALUES (45, '陈璐', 321, 16, '1271062502', '2021-02-03', '15006992911', NULL, 0, 0);
INSERT INTO `student` VALUES (46, '廖涛', 321, 20, '0783260773', '2021-02-03', '13800147030', NULL, 0, 0);
INSERT INTO `student` VALUES (47, '汪丹', 218, 16, '7986444378', '2021-02-03', '13600620233', NULL, 0, 0);
INSERT INTO `student` VALUES (48, '张桂芝', 297, 19, '7207199417', '2021-02-03', '15006766749', NULL, 0, 0);
INSERT INTO `student` VALUES (49, '石建军', 318, 20, '4811953976', '2021-02-03', '15108345416', NULL, 0, 0);
INSERT INTO `student` VALUES (50, '钟桂花', 203, 10, '4616521713', '2021-02-03', '13603201714', NULL, 0, 0);
INSERT INTO `student` VALUES (51, '张桂兰', 153, 16, '3409725964', '2021-02-03', '13708365632', NULL, 0, 0);
INSERT INTO `student` VALUES (52, '石桂花', 315, 10, '2843228640', '2021-02-03', '13908604797', NULL, 0, 0);
INSERT INTO `student` VALUES (53, '崔波', 318, 11, '4400982367', '2021-02-03', '13102723642', NULL, 0, 0);
INSERT INTO `student` VALUES (54, '王丽丽', 11, 15, '9577535253', '2021-02-03', '15907896080', NULL, 0, 0);
INSERT INTO `student` VALUES (55, '张华', 367, 11, '5086015811', '2021-02-03', '13205165113', NULL, 0, 0);
INSERT INTO `student` VALUES (56, '郭浩', 258, 15, '0446099567', '2021-02-03', '15505734607', NULL, 0, 0);
INSERT INTO `student` VALUES (57, '林秀云', 264, 11, '4292594872', '2021-02-03', '13400187825', NULL, 0, 0);
INSERT INTO `student` VALUES (58, '卢利', 387, 12, '3722042478', '2021-02-03', '13404145220', NULL, 0, 0);
INSERT INTO `student` VALUES (59, '刘宇', 110, 11, '0195182380', '2021-02-03', '13100916755', NULL, 0, 0);
INSERT INTO `student` VALUES (60, '卫成', 333, 19, '5793028434', '2021-02-03', '15002408486', NULL, 0, 0);
INSERT INTO `student` VALUES (61, '隋红梅', 50, 10, '0343175749', '2021-02-03', '15005033212', NULL, 0, 0);
INSERT INTO `student` VALUES (62, '李岩', 137, 10, '1173756607', '2021-02-03', '15804433565', NULL, 0, 0);
INSERT INTO `student` VALUES (63, '王淑兰', 302, 19, '3871470183', '2021-02-03', '13802778660', NULL, 0, 0);
INSERT INTO `student` VALUES (64, '郭玲', 268, 12, '4891736017', '2021-02-03', '13607428891', NULL, 0, 0);
INSERT INTO `student` VALUES (65, '穆强', 284, 15, '2991659941', '2021-02-03', '15306315589', NULL, 0, 0);
INSERT INTO `student` VALUES (66, '晏桂兰', 67, 18, '0127069967', '2021-02-03', '13705774578', NULL, 0, 0);
INSERT INTO `student` VALUES (67, '陶莉', 135, 23, '4305212925', '2021-02-03', '15701180352', NULL, 0, 0);
INSERT INTO `student` VALUES (68, '周静', 7, 10, '1904474750', '2021-02-03', '15606277615', NULL, 0, 0);
INSERT INTO `student` VALUES (69, '魏瑜', 326, 10, '5889438009', '2021-02-03', '15001209082', NULL, 0, 0);
INSERT INTO `student` VALUES (70, '路瑜', 314, 12, '8115246439', '2021-02-03', '15001605865', NULL, 0, 0);
INSERT INTO `student` VALUES (71, '陈桂芝', 34, 16, '8059943841', '2021-02-03', '15707054991', NULL, 0, 0);
INSERT INTO `student` VALUES (72, '耿红霞', 277, 18, '3246184237', '2021-02-03', '15607246817', NULL, 0, 0);
INSERT INTO `student` VALUES (73, '车峰', 316, 18, '3406178732', '2021-02-03', '13604973289', NULL, 0, 0);
INSERT INTO `student` VALUES (74, '危波', 239, 11, '7311442846', '2021-02-03', '15500846471', NULL, 0, 0);
INSERT INTO `student` VALUES (75, '李婷', 159, 16, '0268811578', '2021-02-03', '15908672327', NULL, 0, 0);
INSERT INTO `student` VALUES (76, '刘桂香', 10, 22, '5092787438', '2021-02-03', '13007424451', NULL, 0, 0);
INSERT INTO `student` VALUES (77, '谢岩', 314, 19, '2928023930', '2021-02-03', '15201391432', NULL, 0, 0);
INSERT INTO `student` VALUES (78, '冯柳', 46, 18, '1481253731', '2021-02-03', '15206004033', NULL, 0, 0);
INSERT INTO `student` VALUES (79, '王磊', 380, 19, '8704770833', '2021-02-03', '13005306585', NULL, 0, 0);
INSERT INTO `student` VALUES (80, '雷岩', 333, 11, '7096211332', '2021-02-03', '15304190244', NULL, 0, 0);
INSERT INTO `student` VALUES (81, '江丽', 89, 15, '6931015212', '2021-02-03', '13001498041', NULL, 0, 0);
INSERT INTO `student` VALUES (82, '刘颖', 74, 15, '9971553127', '2021-02-03', '15107350906', NULL, 0, 0);
INSERT INTO `student` VALUES (83, '田楠', 260, 15, '2260615899', '2021-02-03', '13308125861', NULL, 0, 0);
INSERT INTO `student` VALUES (84, '贺飞', 40, 22, '9943283245', '2021-02-03', '13203802585', NULL, 0, 0);
INSERT INTO `student` VALUES (85, '刘帆', 231, 19, '3230377928', '2021-02-03', '15908238944', NULL, 0, 0);
INSERT INTO `student` VALUES (86, '毕金凤', 340, 11, '7276471215', '2021-02-03', '13808033911', NULL, 0, 0);
INSERT INTO `student` VALUES (87, '张飞', 96, 20, '8274989288', '2021-02-03', '15904262274', NULL, 0, 0);
INSERT INTO `student` VALUES (88, '滕鑫', 208, 20, '0449150209', '2021-02-03', '13508083108', NULL, 0, 0);
INSERT INTO `student` VALUES (89, '郭冬梅', 82, 11, '0585673079', '2021-02-03', '15308495931', NULL, 0, 0);
INSERT INTO `student` VALUES (90, '凌淑华', 339, 20, '6319790875', '2021-02-03', '15902491142', NULL, 0, 0);
INSERT INTO `student` VALUES (91, '吴丹丹', 387, 19, '4839815273', '2021-02-03', '15206764762', NULL, 0, 0);
INSERT INTO `student` VALUES (92, '张玉', 97, 18, '2163821847', '2021-02-03', '13006620183', NULL, 0, 0);
INSERT INTO `student` VALUES (93, '杨桂香', 262, 22, '2905654163', '2021-02-03', '13803337117', NULL, 0, 0);
INSERT INTO `student` VALUES (94, '李桂兰', 149, 23, '0154395452', '2021-02-03', '15500504175', NULL, 0, 0);
INSERT INTO `student` VALUES (95, '党雪梅', 391, 18, '4247129761', '2021-02-03', '15903592506', NULL, 0, 0);
INSERT INTO `student` VALUES (96, '张娜', 171, 20, '2830497761', '2021-02-03', '15202994452', NULL, 0, 0);
INSERT INTO `student` VALUES (97, '杨畅', 259, 12, '8765632289', '2021-02-03', '15905763930', NULL, 0, 0);
INSERT INTO `student` VALUES (98, '祝红', 348, 20, '2965481038', '2021-02-03', '15005949013', NULL, 0, 0);
INSERT INTO `student` VALUES (99, '王霞', 6, 22, '1054976617', '2021-02-03', '13806683799', NULL, 0, 0);
INSERT INTO `student` VALUES (100, '芦淑英', 192, 15, '9106896950', '2021-02-03', '15006053953', NULL, 0, 0);
INSERT INTO `student` VALUES (101, '王健', 389, 11, '1251848495', '2021-02-03', '15205447283', NULL, 0, 0);
INSERT INTO `student` VALUES (102, '卞丽', 230, 10, '9600903422', '2021-02-03', '15200640673', NULL, 0, 0);
INSERT INTO `student` VALUES (103, '张颖', 53, 16, '9278994717', '2021-02-03', '15605678241', NULL, 0, 0);
INSERT INTO `student` VALUES (104, '陆斌', 130, 15, '5017189892', '2021-02-03', '13905733300', NULL, 0, 0);
INSERT INTO `student` VALUES (105, '李宁', 283, 20, '2611305527', '2021-02-03', '13906686093', NULL, 0, 0);
INSERT INTO `student` VALUES (106, '刘杰', 257, 22, '1536145024', '2021-02-03', '13703723368', NULL, 0, 0);
INSERT INTO `student` VALUES (107, '张亮', 325, 19, '8411559510', '2021-02-03', '15104348206', NULL, 0, 0);
INSERT INTO `student` VALUES (108, '蔡云', 28, 22, '2885716775', '2021-02-03', '15604577404', NULL, 0, 0);
INSERT INTO `student` VALUES (109, '唐林', 386, 15, '0571249733', '2021-02-03', '13308836050', NULL, 0, 0);
INSERT INTO `student` VALUES (110, '杜阳', 292, 18, '3904592244', '2021-02-03', '15707576712', NULL, 0, 0);
INSERT INTO `student` VALUES (111, '杨丽华', 322, 11, '7490054885', '2021-02-03', '13803946043', NULL, 0, 0);
INSERT INTO `student` VALUES (112, '张旭', 96, 16, '0609386434', '2021-02-03', '13805315491', NULL, 0, 0);
INSERT INTO `student` VALUES (113, '李桂芳', 170, 20, '1398524702', '2021-02-03', '15705334401', NULL, 0, 0);
INSERT INTO `student` VALUES (114, '牛倩', 264, 20, '3772286879', '2021-02-03', '13200526116', NULL, 0, 0);
INSERT INTO `student` VALUES (115, '李飞', 208, 12, '4776561557', '2021-02-03', '15000826272', NULL, 0, 0);
INSERT INTO `student` VALUES (116, '张建', 2, 19, '7870207876', '2021-02-03', '15107372026', NULL, 0, 0);
INSERT INTO `student` VALUES (117, '鲍欢', 129, 19, '4831537933', '2021-02-03', '13004254576', NULL, 0, 0);
INSERT INTO `student` VALUES (118, '王桂珍', 372, 18, '7993451622', '2021-02-03', '13005794974', NULL, 0, 0);
INSERT INTO `student` VALUES (119, '李楠', 341, 10, '3399052521', '2021-02-03', '13206891747', NULL, 0, 0);
INSERT INTO `student` VALUES (120, '吴林', 393, 12, '7299389392', '2021-02-03', '15601948534', NULL, 0, 0);
INSERT INTO `student` VALUES (121, '李建华', 117, 10, '9366378272', '2021-02-03', '15901984879', NULL, 0, 0);
INSERT INTO `student` VALUES (122, '王帅', 110, 19, '5501625507', '2021-02-03', '15305118451', NULL, 0, 0);
INSERT INTO `student` VALUES (123, '靳华', 380, 12, '3162058975', '2021-02-03', '13607280850', NULL, 0, 0);
INSERT INTO `student` VALUES (124, '李飞', 285, 16, '3029593905', '2021-02-03', '13303724102', NULL, 0, 0);
INSERT INTO `student` VALUES (125, '李凯', 264, 18, '0779436113', '2021-02-03', '15605872712', NULL, 0, 0);
INSERT INTO `student` VALUES (126, '陈凤英', 367, 15, '3400832154', '2021-02-03', '13103385643', NULL, 0, 0);
INSERT INTO `student` VALUES (127, '董雷', 333, 23, '5452299580', '2021-02-03', '15301665455', NULL, 0, 0);
INSERT INTO `student` VALUES (128, '雷建', 15, 11, '6162873372', '2021-02-03', '13104837921', NULL, 0, 0);
INSERT INTO `student` VALUES (129, '况超', 337, 19, '0439269505', '2021-02-03', '15803455756', NULL, 0, 0);
INSERT INTO `student` VALUES (130, '杨小红', 79, 19, '2682030687', '2021-02-03', '15303835124', NULL, 0, 0);
INSERT INTO `student` VALUES (131, '唐玉', 37, 19, '3706254725', '2021-02-03', '13501795506', NULL, 0, 0);
INSERT INTO `student` VALUES (132, '杨红', 40, 10, '7573266601', '2021-02-03', '13004843632', NULL, 0, 0);
INSERT INTO `student` VALUES (133, '张桂兰', 96, 15, '7101391587', '2021-02-03', '13602955161', NULL, 0, 0);
INSERT INTO `student` VALUES (134, '门欢', 137, 10, '5089051621', '2021-02-03', '15506865709', NULL, 0, 0);
INSERT INTO `student` VALUES (135, '范琳', 209, 23, '9256512069', '2021-02-03', '13204488012', NULL, 0, 0);
INSERT INTO `student` VALUES (136, '邓涛', 148, 12, '7739241486', '2021-02-03', '15304616910', NULL, 0, 0);
INSERT INTO `student` VALUES (137, '李秀珍', 176, 22, '3705543604', '2021-02-03', '13105137860', NULL, 0, 0);
INSERT INTO `student` VALUES (138, '雷瑜', 381, 20, '5912653884', '2021-02-03', '13806033828', NULL, 0, 0);
INSERT INTO `student` VALUES (139, '刘颖', 234, 19, '5241256324', '2021-02-03', '13608512735', NULL, 0, 0);
INSERT INTO `student` VALUES (140, '陈健', 353, 16, '4641052812', '2021-02-03', '15705050804', NULL, 0, 0);
INSERT INTO `student` VALUES (141, '李帆', 348, 10, '7086353025', '2021-02-03', '13305596763', NULL, 0, 0);
INSERT INTO `student` VALUES (142, '陶桂花', 205, 23, '6694094396', '2021-02-03', '13706337491', NULL, 0, 0);
INSERT INTO `student` VALUES (143, '王敏', 320, 15, '1778776494', '2021-02-03', '15106294870', NULL, 0, 0);
INSERT INTO `student` VALUES (144, '栾红梅', 387, 19, '3869107019', '2021-02-03', '15201991170', NULL, 0, 0);
INSERT INTO `student` VALUES (145, '卢丽娟', 33, 19, '7306963438', '2021-02-03', '13203073160', NULL, 0, 0);
INSERT INTO `student` VALUES (146, '孟玲', 25, 12, '0937851618', '2021-02-03', '15208476304', NULL, 0, 0);
INSERT INTO `student` VALUES (147, '姜玉华', 95, 16, '7111384008', '2021-02-03', '15208101239', NULL, 0, 0);
INSERT INTO `student` VALUES (148, '王璐', 239, 11, '9265694893', '2021-02-03', '15102077436', NULL, 0, 0);
INSERT INTO `student` VALUES (149, '黄丹', 323, 12, '9263072194', '2021-02-03', '13805815416', NULL, 0, 0);
INSERT INTO `student` VALUES (150, '严丽华', 166, 22, '5124505909', '2021-02-03', '15208486071', NULL, 0, 0);
INSERT INTO `student` VALUES (151, '刘冬梅', 283, 15, '6748374176', '2021-02-03', '13101557976', NULL, 0, 0);
INSERT INTO `student` VALUES (152, '郑建', 1, 18, '5012737510', '2021-02-03', '15606502837', NULL, 0, 0);
INSERT INTO `student` VALUES (153, '王涛', 378, 22, '9698066279', '2021-02-03', '13305000860', NULL, 0, 0);
INSERT INTO `student` VALUES (154, '郭秀华', 231, 12, '4758577870', '2021-02-03', '15706605636', NULL, 0, 0);
INSERT INTO `student` VALUES (155, '张秀兰', 122, 18, '1775099701', '2021-02-03', '13403654836', NULL, 0, 0);
INSERT INTO `student` VALUES (156, '魏春梅', 372, 23, '9169125766', '2021-02-03', '13903660645', NULL, 0, 0);
INSERT INTO `student` VALUES (157, '宁超', 130, 19, '6009361358', '2021-02-03', '13501346106', NULL, 0, 0);
INSERT INTO `student` VALUES (158, '房秀珍', 169, 15, '5713606473', '2021-02-03', '13807951058', NULL, 0, 0);
INSERT INTO `student` VALUES (159, '黄雷', 347, 18, '8907623329', '2021-02-03', '13205690184', NULL, 0, 0);
INSERT INTO `student` VALUES (160, '胡阳', 252, 23, '4895810209', '2021-02-03', '15902997790', NULL, 0, 0);
INSERT INTO `student` VALUES (161, '刘丽娟', 49, 19, '3592753963', '2021-02-03', '13108328176', NULL, 0, 0);
INSERT INTO `student` VALUES (162, '薛丹丹', 56, 18, '7066090057', '2021-02-03', '15502431605', NULL, 0, 0);
INSERT INTO `student` VALUES (163, '金涛', 324, 16, '4083615757', '2021-02-03', '15902048869', NULL, 0, 0);
INSERT INTO `student` VALUES (164, '侯丽娟', 386, 22, '9923514232', '2021-02-03', '15903913804', NULL, 0, 0);
INSERT INTO `student` VALUES (165, '江淑珍', 22, 18, '1249416625', '2021-02-03', '13504626618', NULL, 0, 0);
INSERT INTO `student` VALUES (166, '刘秀云', 263, 16, '5840198207', '2021-02-03', '15905056556', NULL, 0, 0);
INSERT INTO `student` VALUES (167, '成莹', 158, 15, '8231520559', '2021-02-03', '15101913137', NULL, 0, 0);
INSERT INTO `student` VALUES (168, '冯欣', 390, 18, '7300008317', '2021-02-03', '15205641716', NULL, 0, 0);
INSERT INTO `student` VALUES (169, '萧红梅', 118, 11, '8007576428', '2021-02-03', '15103828522', NULL, 0, 0);
INSERT INTO `student` VALUES (170, '李秀兰', 398, 23, '2558235860', '2021-02-03', '15201233417', NULL, 0, 0);
INSERT INTO `student` VALUES (171, '李玲', 18, 19, '6836920138', '2021-02-03', '13505625523', NULL, 0, 0);
INSERT INTO `student` VALUES (172, '陈畅', 82, 12, '1127082061', '2021-02-03', '15805454616', NULL, 0, 0);
INSERT INTO `student` VALUES (173, '管想', 33, 16, '1367492036', '2021-02-03', '13707716073', NULL, 0, 0);
INSERT INTO `student` VALUES (174, '曹建平', 158, 11, '6498779153', '2021-02-03', '15508796370', NULL, 0, 0);
INSERT INTO `student` VALUES (175, '李丽娟', 164, 22, '8289560087', '2021-02-03', '15002044566', NULL, 0, 0);
INSERT INTO `student` VALUES (176, '车亮', 89, 23, '7975553858', '2021-02-03', '13801367145', NULL, 0, 0);
INSERT INTO `student` VALUES (177, '陆杨', 191, 15, '3207429708', '2021-02-03', '15904066686', NULL, 0, 0);
INSERT INTO `student` VALUES (178, '杨瑜', 47, 19, '7880855837', '2021-02-03', '13608484321', NULL, 0, 0);
INSERT INTO `student` VALUES (179, '陶健', 107, 22, '8870698729', '2021-02-03', '15104679034', NULL, 0, 0);
INSERT INTO `student` VALUES (180, '朱秀梅', 219, 18, '6717653335', '2021-02-03', '13506144807', NULL, 0, 0);
INSERT INTO `student` VALUES (181, '舒峰', 265, 20, '1216411801', '2021-02-03', '13701046876', NULL, 0, 0);
INSERT INTO `student` VALUES (182, '陆成', 52, 10, '1262743146', '2021-02-03', '13402133902', NULL, 0, 0);
INSERT INTO `student` VALUES (183, '沈婷', 166, 15, '8549777903', '2021-02-03', '15808682833', NULL, 0, 0);
INSERT INTO `student` VALUES (184, '李柳', 247, 12, '4270956355', '2021-02-03', '15504362972', NULL, 0, 0);
INSERT INTO `student` VALUES (185, '刘莹', 154, 20, '1842507696', '2021-02-03', '15208483532', NULL, 0, 0);
INSERT INTO `student` VALUES (186, '李刚', 323, 11, '5841727061', '2021-02-03', '13904885944', NULL, 0, 0);
INSERT INTO `student` VALUES (187, '马华', 111, 23, '8140272812', '2021-02-03', '13707684859', NULL, 0, 0);
INSERT INTO `student` VALUES (188, '张畅', 108, 20, '8040930955', '2021-02-03', '13304246822', NULL, 0, 0);
INSERT INTO `student` VALUES (189, '崔建华', 305, 19, '2321635369', '2021-02-03', '13203401172', NULL, 0, 0);
INSERT INTO `student` VALUES (190, '吴波', 229, 19, '2362984306', '2021-02-03', '15808449093', NULL, 0, 0);
INSERT INTO `student` VALUES (191, '张霞', 33, 18, '6228802439', '2021-02-03', '13605811094', NULL, 0, 0);
INSERT INTO `student` VALUES (192, '李梅', 283, 18, '5334073195', '2021-02-03', '15601615316', NULL, 0, 0);
INSERT INTO `student` VALUES (193, '邱冬梅', 110, 15, '6325470226', '2021-02-03', '15206261640', NULL, 0, 0);
INSERT INTO `student` VALUES (194, '刘超', 52, 12, '2261040783', '2021-02-03', '13204068627', NULL, 0, 0);
INSERT INTO `student` VALUES (195, '黄淑华', 11, 20, '4457248819', '2021-02-03', '13506722121', NULL, 0, 0);
INSERT INTO `student` VALUES (196, '谢桂花', 99, 20, '2444396895', '2021-02-03', '15207329082', NULL, 0, 0);
INSERT INTO `student` VALUES (197, '陈璐', 304, 16, '4329280796', '2021-02-03', '15001227944', NULL, 0, 0);
INSERT INTO `student` VALUES (198, '刘文', 118, 16, '2648452512', '2021-02-03', '15600697244', NULL, 0, 0);
INSERT INTO `student` VALUES (199, '林凤英', 378, 10, '4790928336', '2021-02-03', '13400334191', NULL, 0, 0);
INSERT INTO `student` VALUES (200, '邹兰英', 139, 10, '9500422031', '2021-02-03', '15206410184', NULL, 0, 0);
INSERT INTO `student` VALUES (201, '谢婷', 298, 23, '7649558607', '2021-02-03', '15504479072', NULL, 0, 0);
INSERT INTO `student` VALUES (202, '路彬', 164, 22, '1683095928', '2021-02-03', '13206664623', NULL, 0, 0);
INSERT INTO `student` VALUES (203, '郭峰', 380, 10, '1620112790', '2021-02-03', '15808206956', NULL, 0, 0);
INSERT INTO `student` VALUES (204, '李玲', 342, 18, '3920195140', '2021-02-03', '13805501727', NULL, 0, 0);
INSERT INTO `student` VALUES (205, '符秀英', 27, 22, '2712649950', '2021-02-03', '15707741691', NULL, 0, 0);
INSERT INTO `student` VALUES (206, '李桂英', 140, 10, '0102817730', '2021-02-03', '13800842301', NULL, 0, 0);
INSERT INTO `student` VALUES (207, '袁海燕', 278, 19, '0287766277', '2021-02-03', '13806300776', NULL, 0, 0);
INSERT INTO `student` VALUES (208, '陈荣', 113, 19, '0529012876', '2021-02-03', '15004353117', NULL, 0, 0);
INSERT INTO `student` VALUES (209, '郭小红', 245, 12, '7570466471', '2021-02-03', '15300601639', NULL, 0, 0);
INSERT INTO `student` VALUES (210, '夏红霞', 356, 20, '0759385811', '2021-02-03', '13704064195', NULL, 0, 0);
INSERT INTO `student` VALUES (211, '裴彬', 111, 18, '8618287911', '2021-02-03', '13203970540', NULL, 0, 0);
INSERT INTO `student` VALUES (212, '陈丽丽', 126, 20, '8375198381', '2021-02-03', '15005492557', NULL, 0, 0);
INSERT INTO `student` VALUES (213, '张璐', 118, 20, '0589805849', '2021-02-03', '15802263592', NULL, 0, 0);
INSERT INTO `student` VALUES (214, '张颖', 257, 12, '2659681968', '2021-02-03', '13100201988', NULL, 0, 0);
INSERT INTO `student` VALUES (215, '蔡莉', 202, 10, '1929341263', '2021-02-03', '13407826520', NULL, 0, 0);
INSERT INTO `student` VALUES (216, '王秀兰', 278, 15, '2463815510', '2021-02-03', '15004424572', NULL, 0, 0);
INSERT INTO `student` VALUES (217, '孙涛', 112, 19, '2480907412', '2021-02-03', '13806846499', NULL, 0, 0);
INSERT INTO `student` VALUES (218, '余俊', 250, 18, '2905326521', '2021-02-03', '15200968617', NULL, 0, 0);
INSERT INTO `student` VALUES (219, '王秀芳', 36, 12, '1192585730', '2021-02-03', '15108837852', NULL, 0, 0);
INSERT INTO `student` VALUES (220, '叶桂芳', 372, 10, '4341240527', '2021-02-03', '15801522248', NULL, 0, 0);
INSERT INTO `student` VALUES (221, '郭阳', 190, 15, '7356826575', '2021-02-03', '13600287718', NULL, 0, 0);
INSERT INTO `student` VALUES (222, '覃宁', 84, 15, '1833032843', '2021-02-03', '13208205535', NULL, 0, 0);
INSERT INTO `student` VALUES (223, '魏丹', 127, 11, '7661905505', '2021-02-03', '15300980794', NULL, 0, 0);
INSERT INTO `student` VALUES (224, '宋丽娟', 23, 18, '4358819993', '2021-02-03', '13101647935', NULL, 0, 0);
INSERT INTO `student` VALUES (225, '赵平', 347, 10, '5744002667', '2021-02-03', '13805008110', NULL, 0, 0);
INSERT INTO `student` VALUES (226, '邱红霞', 137, 19, '3815112935', '2021-02-03', '13901381089', NULL, 0, 0);
INSERT INTO `student` VALUES (227, '彭桂香', 65, 11, '6065546629', '2021-02-03', '13008158808', NULL, 0, 0);
INSERT INTO `student` VALUES (228, '胡玉兰', 83, 19, '0364551861', '2021-02-03', '15901828695', NULL, 0, 0);
INSERT INTO `student` VALUES (229, '王秀华', 167, 15, '5868474662', '2021-02-03', '15601338671', NULL, 0, 0);
INSERT INTO `student` VALUES (230, '刘小红', 81, 19, '6321593679', '2021-02-03', '15206822432', NULL, 0, 0);
INSERT INTO `student` VALUES (231, '张玉梅', 95, 15, '4536876382', '2021-02-03', '13804130990', NULL, 0, 0);
INSERT INTO `student` VALUES (232, '张丹丹', 129, 10, '9580730016', '2021-02-03', '15306475384', NULL, 0, 0);
INSERT INTO `student` VALUES (233, '董凯', 5, 11, '8415443924', '2021-02-03', '15706487718', NULL, 0, 0);
INSERT INTO `student` VALUES (234, '杨秀兰', 38, 11, '5233353194', '2021-02-03', '13802731498', NULL, 0, 0);
INSERT INTO `student` VALUES (235, '黄淑华', 378, 19, '9160165748', '2021-02-03', '15908260780', NULL, 0, 0);
INSERT INTO `student` VALUES (236, '金慧', 357, 11, '6207849982', '2021-02-03', '15900180432', NULL, 0, 0);
INSERT INTO `student` VALUES (237, '刘杨', 282, 20, '3422814648', '2021-02-03', '15007387942', NULL, 0, 0);
INSERT INTO `student` VALUES (238, '王秀梅', 157, 11, '8632352079', '2021-02-03', '15207071990', NULL, 0, 0);
INSERT INTO `student` VALUES (239, '何璐', 319, 19, '5041626097', '2021-02-03', '15808322225', NULL, 0, 0);
INSERT INTO `student` VALUES (240, '张倩', 32, 22, '5550705123', '2021-02-03', '13304862952', NULL, 0, 0);
INSERT INTO `student` VALUES (241, '龙秀梅', 193, 10, '5982218074', '2021-02-03', '15602685659', NULL, 0, 0);
INSERT INTO `student` VALUES (242, '阳瑞', 131, 11, '7576818373', '2021-02-03', '15100365782', NULL, 0, 0);
INSERT INTO `student` VALUES (243, '赵娜', 160, 10, '2938207371', '2021-02-03', '13502435079', NULL, 0, 0);
INSERT INTO `student` VALUES (244, '位琴', 138, 23, '9383865653', '2021-02-03', '13106721701', NULL, 0, 0);
INSERT INTO `student` VALUES (245, '陈杨', 96, 19, '7086294616', '2021-02-03', '13205476031', NULL, 0, 0);
INSERT INTO `student` VALUES (246, '赖伟', 40, 12, '5134780114', '2021-02-03', '13407116610', NULL, 0, 0);
INSERT INTO `student` VALUES (247, '李雪', 350, 19, '4027619706', '2021-02-03', '13901383869', NULL, 0, 0);
INSERT INTO `student` VALUES (248, '王桂英', 97, 16, '9426874558', '2021-02-03', '15508698240', NULL, 0, 0);
INSERT INTO `student` VALUES (249, '陶彬', 195, 18, '8015782891', '2021-02-03', '15202345596', NULL, 0, 0);
INSERT INTO `student` VALUES (250, '韩瑜', 252, 23, '6546028623', '2021-02-03', '13807046010', NULL, 0, 0);
INSERT INTO `student` VALUES (251, '李静', 393, 10, '3158806375', '2021-02-03', '13204883360', NULL, 0, 0);
INSERT INTO `student` VALUES (252, '钟柳', 338, 11, '4304611060', '2021-02-03', '13805192686', NULL, 0, 0);
INSERT INTO `student` VALUES (253, '邓秀珍', 79, 18, '0238701150', '2021-02-03', '15605147774', NULL, 0, 0);
INSERT INTO `student` VALUES (254, '隋玉华', 364, 12, '0280124183', '2021-02-03', '13508387689', NULL, 0, 0);
INSERT INTO `student` VALUES (255, '任倩', 38, 15, '7244581667', '2021-02-03', '15906190768', NULL, 0, 0);
INSERT INTO `student` VALUES (256, '胡勇', 93, 10, '5816558439', '2021-02-03', '15502965700', NULL, 0, 0);
INSERT INTO `student` VALUES (257, '秦桂芝', 17, 19, '1962400912', '2021-02-03', '13505697444', NULL, 0, 0);
INSERT INTO `student` VALUES (258, '王欢', 316, 12, '6402849142', '2021-02-03', '13105751492', NULL, 0, 0);
INSERT INTO `student` VALUES (259, '王淑珍', 104, 22, '1904783795', '2021-02-03', '13908655748', NULL, 0, 0);
INSERT INTO `student` VALUES (260, '叶志强', 395, 16, '6713616677', '2021-02-03', '15702016945', NULL, 0, 0);
INSERT INTO `student` VALUES (261, '王明', 216, 20, '7336056798', '2021-02-03', '13400223492', NULL, 0, 0);
INSERT INTO `student` VALUES (262, '李晶', 180, 22, '3674883157', '2021-02-03', '15804881349', NULL, 0, 0);
INSERT INTO `student` VALUES (263, '李桂荣', 7, 15, '5672818668', '2021-02-03', '15506871279', NULL, 0, 0);
INSERT INTO `student` VALUES (264, '袁小红', 297, 12, '4764409773', '2021-02-03', '15908767158', NULL, 0, 0);
INSERT INTO `student` VALUES (265, '谢婷婷', 274, 22, '1546879145', '2021-02-03', '15803926677', NULL, 0, 0);
INSERT INTO `student` VALUES (266, '叶建华', 266, 19, '2489695573', '2021-02-03', '13403942084', NULL, 0, 0);
INSERT INTO `student` VALUES (267, '周春梅', 220, 12, '0954659472', '2021-02-03', '13705507589', NULL, 0, 0);
INSERT INTO `student` VALUES (268, '冯建平', 398, 16, '7342746860', '2021-02-03', '15707230358', NULL, 0, 0);
INSERT INTO `student` VALUES (269, '李文', 232, 23, '0310779962', '2021-02-03', '15202974200', NULL, 0, 0);
INSERT INTO `student` VALUES (270, '黄淑英', 19, 16, '5506817215', '2021-02-03', '15104670554', NULL, 0, 0);
INSERT INTO `student` VALUES (271, '张帅', 32, 15, '1972468956', '2021-02-03', '15303561838', NULL, 0, 0);
INSERT INTO `student` VALUES (272, '陈玉英', 95, 20, '7113973614', '2021-02-03', '13906586354', NULL, 0, 0);
INSERT INTO `student` VALUES (273, '裴彬', 180, 18, '1727303436', '2021-02-03', '13801695875', NULL, 0, 0);
INSERT INTO `student` VALUES (274, '王晨', 143, 10, '7641767500', '2021-02-03', '15907502571', NULL, 0, 0);
INSERT INTO `student` VALUES (275, '李磊', 362, 18, '3126299466', '2021-02-03', '15800552074', NULL, 0, 0);
INSERT INTO `student` VALUES (276, '牛倩', 366, 20, '0104565609', '2021-02-03', '15704350691', NULL, 0, 0);
INSERT INTO `student` VALUES (277, '曾华', 253, 15, '4060959036', '2021-02-03', '15806001614', NULL, 0, 0);
INSERT INTO `student` VALUES (278, '荣桂花', 336, 11, '4562418381', '2021-02-03', '15207438359', NULL, 0, 0);
INSERT INTO `student` VALUES (279, '朱晶', 338, 11, '8238119870', '2021-02-03', '13306738530', NULL, 0, 0);
INSERT INTO `student` VALUES (280, '杨柳', 400, 23, '2215301270', '2021-02-03', '15208457806', NULL, 0, 0);
INSERT INTO `student` VALUES (281, '卢娜', 389, 23, '2729462748', '2021-02-03', '13806960623', NULL, 0, 0);
INSERT INTO `student` VALUES (282, '汪丹', 197, 19, '9324716242', '2021-02-03', '13205073648', NULL, 0, 0);
INSERT INTO `student` VALUES (283, '易荣', 213, 15, '6732290795', '2021-02-03', '13904533288', NULL, 0, 0);
INSERT INTO `student` VALUES (284, '陈芳', 221, 15, '0506590049', '2021-02-03', '13907923324', NULL, 0, 0);
INSERT INTO `student` VALUES (285, '汪玉英', 264, 18, '8125365867', '2021-02-03', '15800070970', NULL, 0, 0);
INSERT INTO `student` VALUES (286, '温平', 396, 10, '9994018848', '2021-02-03', '15304436168', NULL, 0, 0);
INSERT INTO `student` VALUES (287, '关瑜', 330, 10, '5038820731', '2021-02-03', '15008286794', NULL, 0, 0);
INSERT INTO `student` VALUES (288, '柯丽', 324, 19, '8215986987', '2021-02-03', '15205067084', NULL, 0, 0);
INSERT INTO `student` VALUES (289, '周刚', 362, 19, '3042805299', '2021-02-03', '13602857649', NULL, 0, 0);
INSERT INTO `student` VALUES (290, '王春梅', 48, 16, '7903409028', '2021-02-03', '13101746879', NULL, 0, 0);
INSERT INTO `student` VALUES (291, '晋欣', 129, 12, '5207695614', '2021-02-03', '15000127745', NULL, 0, 0);
INSERT INTO `student` VALUES (292, '谢秀英', 371, 22, '8545313864', '2021-02-03', '15106354434', NULL, 0, 0);
INSERT INTO `student` VALUES (293, '夏欢', 350, 11, '0486134960', '2021-02-03', '15500577607', NULL, 0, 0);
INSERT INTO `student` VALUES (294, '张淑华', 366, 18, '6979402886', '2021-02-03', '13106386369', NULL, 0, 0);
INSERT INTO `student` VALUES (295, '龙琴', 168, 11, '5355835071', '2021-02-03', '13203497161', NULL, 0, 0);
INSERT INTO `student` VALUES (296, '张博', 329, 11, '5315873676', '2021-02-03', '13704073939', NULL, 0, 0);
INSERT INTO `student` VALUES (297, '胡玉兰', 213, 11, '8679020920', '2021-02-03', '15305643624', NULL, 0, 0);
INSERT INTO `student` VALUES (298, '唐桂荣', 176, 16, '7086979001', '2021-02-03', '13008390652', NULL, 0, 0);
INSERT INTO `student` VALUES (299, '荣桂花', 135, 20, '9096757155', '2021-02-03', '13200831822', NULL, 0, 0);
INSERT INTO `student` VALUES (300, '杜婷', 297, 12, '8176848543', '2021-02-03', '13204862638', NULL, 0, 0);
INSERT INTO `student` VALUES (301, '钱磊', 183, 10, '9914129985', '2021-02-03', '15301226550', NULL, 0, 0);
INSERT INTO `student` VALUES (302, '陈玲', 36, 11, '9495391369', '2021-02-03', '13406264464', NULL, 0, 0);
INSERT INTO `student` VALUES (303, '雷岩', 41, 22, '7222649292', '2021-02-03', '15600820123', NULL, 0, 0);
INSERT INTO `student` VALUES (304, '刘杨', 67, 23, '3293966178', '2021-02-03', '13804108311', NULL, 0, 0);
INSERT INTO `student` VALUES (305, '白慧', 386, 18, '8449360341', '2021-02-03', '15306461599', NULL, 0, 0);
INSERT INTO `student` VALUES (306, '王霞', 353, 15, '7861161515', '2021-02-03', '13304744725', NULL, 0, 0);
INSERT INTO `student` VALUES (307, '何莉', 302, 23, '0251733535', '2021-02-03', '13401352771', NULL, 0, 0);
INSERT INTO `student` VALUES (308, '韦丹丹', 353, 18, '0759256643', '2021-02-03', '15000961846', NULL, 0, 0);
INSERT INTO `student` VALUES (309, '晏桂兰', 285, 23, '7175251957', '2021-02-03', '13501876041', NULL, 0, 0);
INSERT INTO `student` VALUES (310, '彭阳', 284, 12, '0467839770', '2021-02-03', '15703102381', NULL, 0, 0);
INSERT INTO `student` VALUES (311, '邬亮', 88, 10, '7070643555', '2021-02-03', '13800541296', NULL, 0, 0);
INSERT INTO `student` VALUES (312, '宋想', 119, 22, '3274427604', '2021-02-03', '15107723809', NULL, 0, 0);
INSERT INTO `student` VALUES (313, '刘旭', 29, 16, '4094792785', '2021-02-03', '13502424234', NULL, 0, 0);
INSERT INTO `student` VALUES (314, '张淑珍', 380, 11, '6178829857', '2021-02-03', '15002068159', NULL, 0, 0);
INSERT INTO `student` VALUES (315, '彭波', 176, 10, '0041012949', '2021-02-03', '15006933305', NULL, 0, 0);
INSERT INTO `student` VALUES (316, '陈红', 85, 23, '0285395689', '2021-02-03', '13305800202', NULL, 0, 0);
INSERT INTO `student` VALUES (317, '黄杰', 363, 10, '2090691921', '2021-02-03', '13607920794', NULL, 0, 0);
INSERT INTO `student` VALUES (318, '范桂珍', 113, 10, '0451403597', '2021-02-03', '15506307852', NULL, 0, 0);
INSERT INTO `student` VALUES (319, '魏军', 257, 16, '0771027648', '2021-02-03', '13100472969', NULL, 0, 0);
INSERT INTO `student` VALUES (320, '李龙', 80, 20, '7528547384', '2021-02-03', '15104442896', NULL, 0, 0);
INSERT INTO `student` VALUES (321, '田想', 62, 16, '0380149827', '2021-02-03', '13605558548', NULL, 0, 0);
INSERT INTO `student` VALUES (322, '李杨', 295, 15, '4406209331', '2021-02-03', '13705825106', NULL, 0, 0);
INSERT INTO `student` VALUES (323, '陈梅', 58, 19, '4964164133', '2021-02-03', '15705796076', NULL, 0, 0);
INSERT INTO `student` VALUES (324, '曹建平', 88, 11, '4865880534', '2021-02-03', '13208804692', NULL, 0, 0);
INSERT INTO `student` VALUES (325, '冯桂花', 140, 23, '2702838225', '2021-02-03', '15108064505', NULL, 0, 0);
INSERT INTO `student` VALUES (326, '林明', 92, 15, '5396326976', '2021-02-03', '15208832220', NULL, 0, 0);
INSERT INTO `student` VALUES (327, '戴宇', 109, 19, '7098901254', '2021-02-03', '15607718523', NULL, 0, 0);
INSERT INTO `student` VALUES (328, '何玲', 172, 10, '5417940295', '2021-02-03', '15503793131', NULL, 0, 0);
INSERT INTO `student` VALUES (329, '吕海燕', 121, 23, '1103897172', '2021-02-03', '13000017215', NULL, 0, 0);
INSERT INTO `student` VALUES (330, '张鹏', 205, 23, '1288499726', '2021-02-03', '15907592080', NULL, 0, 0);
INSERT INTO `student` VALUES (331, '刘楠', 130, 10, '9794171334', '2021-02-03', '15006507179', NULL, 0, 0);
INSERT INTO `student` VALUES (332, '胡琳', 322, 11, '6037845918', '2021-02-03', '15902110220', NULL, 0, 0);
INSERT INTO `student` VALUES (333, '季秀珍', 360, 16, '7213777322', '2021-02-03', '13308476750', NULL, 0, 0);
INSERT INTO `student` VALUES (334, '周丽华', 166, 18, '3188025036', '2021-02-03', '13706556201', NULL, 0, 0);
INSERT INTO `student` VALUES (335, '杨帅', 35, 19, '0744563184', '2021-02-03', '15901790885', NULL, 0, 0);
INSERT INTO `student` VALUES (336, '邓霞', 95, 12, '2159562078', '2021-02-03', '13605481889', NULL, 0, 0);
INSERT INTO `student` VALUES (337, '叶成', 54, 11, '6822098731', '2021-02-03', '15506786484', NULL, 0, 0);
INSERT INTO `student` VALUES (338, '唐琴', 331, 10, '8988158142', '2021-02-03', '15304990018', NULL, 0, 0);
INSERT INTO `student` VALUES (339, '黄鹏', 83, 16, '4711787075', '2021-02-03', '13207098474', NULL, 0, 0);
INSERT INTO `student` VALUES (340, '李艳', 213, 10, '2006132547', '2021-02-03', '15806314424', NULL, 0, 0);
INSERT INTO `student` VALUES (341, '陈帅', 99, 18, '5343409749', '2021-02-03', '15308512913', NULL, 0, 0);
INSERT INTO `student` VALUES (342, '孟玲', 315, 15, '1292387896', '2021-02-03', '13001082383', NULL, 0, 0);
INSERT INTO `student` VALUES (343, '张玉英', 295, 22, '4823160784', '2021-02-03', '15801317872', NULL, 0, 0);
INSERT INTO `student` VALUES (344, '岳坤', 48, 19, '4069430166', '2021-02-03', '13408771808', NULL, 0, 0);
INSERT INTO `student` VALUES (345, '崔晨', 66, 19, '2848680996', '2021-02-03', '15608711177', NULL, 0, 0);
INSERT INTO `student` VALUES (346, '陈龙', 120, 20, '3972352084', '2021-02-03', '13105772207', NULL, 0, 0);
INSERT INTO `student` VALUES (347, '张浩', 91, 12, '6354038435', '2021-02-03', '13604614317', NULL, 0, 0);
INSERT INTO `student` VALUES (348, '王秀英', 151, 11, '3742863914', '2021-02-03', '13605395075', NULL, 0, 0);
INSERT INTO `student` VALUES (349, '郑俊', 139, 19, '5300216343', '2021-02-03', '15600422317', NULL, 0, 0);
INSERT INTO `student` VALUES (350, '姚鹏', 16, 12, '2968679204', '2021-02-03', '13305823253', NULL, 0, 0);
INSERT INTO `student` VALUES (351, '郭瑜', 75, 20, '8470522522', '2021-02-03', '15106281818', NULL, 0, 0);
INSERT INTO `student` VALUES (352, '陈倩', 106, 12, '7900284465', '2021-02-03', '15806035106', NULL, 0, 0);
INSERT INTO `student` VALUES (353, '鲍建平', 166, 19, '2957095736', '2021-02-03', '13606154205', NULL, 0, 0);
INSERT INTO `student` VALUES (354, '祝红', 317, 23, '4908881637', '2021-02-03', '15601301338', NULL, 0, 0);
INSERT INTO `student` VALUES (355, '蒋萍', 40, 22, '6125107253', '2021-02-03', '15604868842', NULL, 0, 0);
INSERT INTO `student` VALUES (356, '徐洋', 314, 22, '0634215414', '2021-02-03', '15203166900', NULL, 0, 0);
INSERT INTO `student` VALUES (357, '郭峰', 300, 19, '6615040493', '2021-02-03', '13706863952', NULL, 0, 0);
INSERT INTO `student` VALUES (358, '杜欣', 310, 18, '5363375032', '2021-02-03', '15506020761', NULL, 0, 0);
INSERT INTO `student` VALUES (359, '罗海燕', 276, 15, '1061314064', '2021-02-03', '15908231094', NULL, 0, 0);
INSERT INTO `student` VALUES (360, '马丽华', 211, 20, '9990953313', '2021-02-03', '13704696370', NULL, 0, 0);
INSERT INTO `student` VALUES (361, '吴秀珍', 172, 10, '1922684212', '2021-02-03', '13904912810', NULL, 0, 0);
INSERT INTO `student` VALUES (362, '孙兰英', 212, 10, '6074385059', '2021-02-03', '13103501322', NULL, 0, 0);
INSERT INTO `student` VALUES (363, '何丹', 302, 12, '3289470394', '2021-02-03', '13603671128', NULL, 0, 0);
INSERT INTO `student` VALUES (364, '任洁', 63, 11, '4253729412', '2021-02-03', '15607077406', NULL, 0, 0);
INSERT INTO `student` VALUES (365, '马辉', 267, 15, '2898668149', '2021-02-03', '13903604224', NULL, 0, 0);
INSERT INTO `student` VALUES (366, '陈鑫', 208, 23, '2670555136', '2021-02-03', '13603358879', NULL, 0, 0);
INSERT INTO `student` VALUES (367, '罗柳', 113, 18, '8248057274', '2021-02-03', '15904616272', NULL, 0, 0);
INSERT INTO `student` VALUES (368, '朱秀梅', 26, 16, '3146882012', '2021-02-03', '15500364728', NULL, 0, 0);
INSERT INTO `student` VALUES (369, '张勇', 149, 23, '4800480129', '2021-02-03', '13406917212', NULL, 0, 0);
INSERT INTO `student` VALUES (370, '蔡刚', 355, 18, '0235803726', '2021-02-03', '13201514360', NULL, 0, 0);
INSERT INTO `student` VALUES (371, '潘岩', 315, 12, '5051522852', '2021-02-03', '13201414550', NULL, 0, 0);
INSERT INTO `student` VALUES (372, '王英', 279, 20, '2679221800', '2021-02-03', '13805075705', NULL, 0, 0);
INSERT INTO `student` VALUES (373, '张慧', 345, 20, '3223655338', '2021-02-03', '13202963370', NULL, 0, 0);
INSERT INTO `student` VALUES (374, '李萍', 141, 11, '5071410308', '2021-02-03', '13202513413', NULL, 0, 0);
INSERT INTO `student` VALUES (375, '李波', 324, 20, '4400602143', '2021-02-03', '13900796584', NULL, 0, 0);
INSERT INTO `student` VALUES (376, '杜欣', 142, 12, '2997713050', '2021-02-03', '13503294021', NULL, 0, 0);
INSERT INTO `student` VALUES (377, '陈柳', 363, 12, '3000618807', '2021-02-03', '15905124733', NULL, 0, 0);
INSERT INTO `student` VALUES (378, '雷芳', 361, 10, '6389341271', '2021-02-03', '15007645263', NULL, 0, 0);
INSERT INTO `student` VALUES (379, '罗玉英', 142, 11, '7807555886', '2021-02-03', '15208760194', NULL, 0, 0);
INSERT INTO `student` VALUES (380, '李淑华', 222, 16, '3005296828', '2021-02-03', '13503324966', NULL, 0, 0);
INSERT INTO `student` VALUES (381, '王旭', 63, 23, '3273686048', '2021-02-03', '15507776717', NULL, 0, 0);
INSERT INTO `student` VALUES (382, '张斌', 51, 12, '8237378043', '2021-02-03', '13104052364', NULL, 0, 0);
INSERT INTO `student` VALUES (383, '陈凤英', 166, 23, '7732533045', '2021-02-03', '13802843379', NULL, 0, 0);
INSERT INTO `student` VALUES (384, '田淑兰', 150, 15, '7623429712', '2021-02-03', '15600618278', NULL, 0, 0);
INSERT INTO `student` VALUES (385, '廖岩', 74, 11, '6953750807', '2021-02-03', '13404257812', NULL, 0, 0);
INSERT INTO `student` VALUES (386, '斯静', 195, 19, '9756559016', '2021-02-03', '15100200864', NULL, 0, 0);
INSERT INTO `student` VALUES (387, '何桂珍', 70, 22, '9637288577', '2021-02-03', '15903494389', NULL, 0, 0);
INSERT INTO `student` VALUES (388, '施淑兰', 277, 19, '4577389663', '2021-02-03', '15608577835', NULL, 0, 0);
INSERT INTO `student` VALUES (389, '曹坤', 187, 22, '8157308714', '2021-02-03', '15100471064', NULL, 0, 0);
INSERT INTO `student` VALUES (390, '裴丹丹', 98, 12, '0694669223', '2021-02-03', '15307254656', NULL, 0, 0);
INSERT INTO `student` VALUES (391, '张健', 254, 20, '7622522000', '2021-02-03', '15906528686', NULL, 0, 0);
INSERT INTO `student` VALUES (392, '桂欣', 308, 19, '1537845093', '2021-02-03', '15505653828', NULL, 0, 0);
INSERT INTO `student` VALUES (393, '葛龙', 366, 20, '6566780261', '2021-02-03', '15102314439', NULL, 0, 0);
INSERT INTO `student` VALUES (394, '余东', 347, 23, '4869594578', '2021-02-03', '13408036470', NULL, 0, 0);
INSERT INTO `student` VALUES (395, '吴萍', 123, 16, '0962656422', '2021-02-03', '13304695681', NULL, 0, 0);
INSERT INTO `student` VALUES (396, '张金凤', 101, 19, '0887273915', '2021-02-03', '13300696416', NULL, 0, 0);
INSERT INTO `student` VALUES (397, '王玉', 265, 19, '6705844290', '2021-02-03', '13901237031', NULL, 0, 0);
INSERT INTO `student` VALUES (398, '梁磊', 125, 20, '5542717821', '2021-02-03', '15202847775', NULL, 0, 0);
INSERT INTO `student` VALUES (399, '许志强', 41, 20, '7591626828', '2021-02-03', '15708076530', NULL, 0, 0);
INSERT INTO `student` VALUES (400, '戴鑫', 311, 10, '5062370886', '2021-02-03', '15801253616', NULL, 0, 0);
INSERT INTO `student` VALUES (401, '马芳', 303, 18, '1032658296', '2021-02-03', '13303223982', NULL, 0, 0);
INSERT INTO `student` VALUES (402, '陈雷', 257, 19, '4051212992', '2021-02-03', '13706830738', NULL, 0, 0);
INSERT INTO `student` VALUES (403, '裴彬', 72, 18, '8673014028', '2021-02-03', '13306904854', NULL, 0, 0);
INSERT INTO `student` VALUES (404, '苗彬', 313, 18, '4871459402', '2021-02-03', '15305517090', NULL, 0, 0);
INSERT INTO `student` VALUES (405, '吴秀珍', 58, 16, '4327420259', '2021-02-03', '15608871106', NULL, 0, 0);
INSERT INTO `student` VALUES (406, '张丽丽', 294, 19, '6526140376', '2021-02-03', '13108348692', NULL, 0, 0);
INSERT INTO `student` VALUES (407, '赵伟', 29, 12, '7700273098', '2021-02-03', '15001983447', NULL, 0, 0);
INSERT INTO `student` VALUES (408, '龙琴', 314, 10, '7717662545', '2021-02-03', '13303704011', NULL, 0, 0);
INSERT INTO `student` VALUES (409, '赵秀荣', 46, 11, '7883138704', '2021-02-03', '13400040564', NULL, 0, 0);
INSERT INTO `student` VALUES (410, '吴浩', 354, 16, '6375266951', '2021-02-03', '13100844778', NULL, 0, 0);
INSERT INTO `student` VALUES (411, '王英', 125, 23, '3068761292', '2021-02-03', '13106973478', NULL, 0, 0);
INSERT INTO `student` VALUES (412, '邹健', 395, 15, '2005691683', '2021-02-03', '13107285313', NULL, 0, 0);
INSERT INTO `student` VALUES (413, '耿帅', 323, 15, '1632842321', '2021-02-03', '13905103867', NULL, 0, 0);
INSERT INTO `student` VALUES (414, '陆秀梅', 200, 10, '9860579072', '2021-02-03', '15905963852', NULL, 0, 0);
INSERT INTO `student` VALUES (415, '袁颖', 170, 11, '5913488782', '2021-02-03', '15104795727', NULL, 0, 0);
INSERT INTO `student` VALUES (416, '吴桂兰', 264, 20, '4884118307', '2021-02-03', '15305517009', NULL, 0, 0);
INSERT INTO `student` VALUES (417, '何红霞', 397, 19, '6929648373', '2021-02-03', '13903516036', NULL, 0, 0);
INSERT INTO `student` VALUES (418, '靳华', 94, 18, '4409714189', '2021-02-03', '15308743022', NULL, 0, 0);
INSERT INTO `student` VALUES (419, '杨莉', 289, 20, '0133584170', '2021-02-03', '13803877126', NULL, 0, 0);
INSERT INTO `student` VALUES (420, '施丽丽', 298, 11, '3107028219', '2021-02-03', '13101740733', NULL, 0, 0);
INSERT INTO `student` VALUES (421, '周璐', 375, 11, '1700175827', '2021-02-03', '15500055273', NULL, 0, 0);
INSERT INTO `student` VALUES (422, '祝辉', 217, 18, '7701883815', '2021-02-03', '15600016356', NULL, 0, 0);
INSERT INTO `student` VALUES (423, '崔宇', 33, 20, '3065513401', '2021-02-03', '15203658849', NULL, 0, 0);
INSERT INTO `student` VALUES (424, '萧利', 78, 15, '8818623821', '2021-02-03', '15201488181', NULL, 0, 0);
INSERT INTO `student` VALUES (425, '刘亮', 263, 15, '4999858344', '2021-02-03', '15006616539', NULL, 0, 0);
INSERT INTO `student` VALUES (426, '支凯', 339, 16, '8572390858', '2021-02-03', '15703327200', NULL, 0, 0);
INSERT INTO `student` VALUES (427, '余秀荣', 22, 10, '7931515507', '2021-02-03', '13304502507', NULL, 0, 0);
INSERT INTO `student` VALUES (428, '孙坤', 144, 11, '3158966307', '2021-02-03', '13804618717', NULL, 0, 0);
INSERT INTO `student` VALUES (429, '杨博', 217, 20, '6698379669', '2021-02-03', '15602150750', NULL, 0, 0);
INSERT INTO `student` VALUES (430, '钟涛', 262, 23, '7178167070', '2021-02-03', '13504910584', NULL, 0, 0);
INSERT INTO `student` VALUES (431, '姜帅', 108, 22, '7920262875', '2021-02-03', '13006034998', NULL, 0, 0);
INSERT INTO `student` VALUES (432, '黄琴', 307, 12, '0981223339', '2021-02-03', '13302657720', NULL, 0, 0);
INSERT INTO `student` VALUES (433, '韩霞', 350, 20, '4682162911', '2021-02-03', '15708608351', NULL, 0, 0);
INSERT INTO `student` VALUES (434, '谢岩', 160, 15, '9363204049', '2021-02-03', '15307672822', NULL, 0, 0);
INSERT INTO `student` VALUES (435, '邹兰英', 293, 12, '1380828485', '2021-02-03', '15108776498', NULL, 0, 0);
INSERT INTO `student` VALUES (436, '郑瑜', 83, 16, '1823517613', '2021-02-03', '15301178453', NULL, 0, 0);
INSERT INTO `student` VALUES (437, '邹丽丽', 359, 10, '6942712464', '2021-02-03', '15901404614', NULL, 0, 0);
INSERT INTO `student` VALUES (438, '朱丹丹', 68, 22, '6501060283', '2021-02-03', '13107772506', NULL, 0, 0);
INSERT INTO `student` VALUES (439, '黄军', 185, 15, '9484453187', '2021-02-03', '15105187687', NULL, 0, 0);
INSERT INTO `student` VALUES (440, '彭波', 66, 16, '5360812275', '2021-02-03', '13507354075', NULL, 0, 0);
INSERT INTO `student` VALUES (441, '曾华', 13, 12, '3842418301', '2021-02-03', '13602654276', NULL, 0, 0);
INSERT INTO `student` VALUES (442, '潘磊', 165, 19, '5270876602', '2021-02-03', '13902262154', NULL, 0, 0);
INSERT INTO `student` VALUES (443, '路瑜', 184, 20, '1358215768', '2021-02-03', '15302815266', NULL, 0, 0);
INSERT INTO `student` VALUES (444, '张晨', 389, 20, '0392304631', '2021-02-03', '15202636701', NULL, 0, 0);
INSERT INTO `student` VALUES (445, '陈金凤', 225, 10, '5557992469', '2021-02-03', '15804390603', NULL, 0, 0);
INSERT INTO `student` VALUES (446, '李雪', 301, 12, '8972691394', '2021-02-03', '15305014911', NULL, 0, 0);
INSERT INTO `student` VALUES (447, '罗刚', 276, 15, '5789181559', '2021-02-03', '15706523814', NULL, 0, 0);
INSERT INTO `student` VALUES (448, '杨慧', 106, 23, '7657511506', '2021-02-03', '13707194781', NULL, 0, 0);
INSERT INTO `student` VALUES (449, '刁云', 172, 15, '1321370649', '2021-02-03', '13701683502', NULL, 0, 0);
INSERT INTO `student` VALUES (450, '邓霞', 258, 12, '2321024710', '2021-02-03', '13001152235', NULL, 0, 0);
INSERT INTO `student` VALUES (451, '李秀珍', 270, 11, '2146160388', '2021-02-03', '13200054320', NULL, 0, 0);
INSERT INTO `student` VALUES (452, '赵琴', 92, 23, '8925606648', '2021-02-03', '13803987190', NULL, 0, 0);
INSERT INTO `student` VALUES (453, '马桂芳', 192, 15, '9655888748', '2021-02-03', '13701440916', NULL, 0, 0);
INSERT INTO `student` VALUES (454, '史桂芝', 22, 10, '5538810954', '2021-02-03', '13901727624', NULL, 0, 0);
INSERT INTO `student` VALUES (455, '杨秀兰', 21, 22, '1528662753', '2021-02-03', '15205110529', NULL, 0, 0);
INSERT INTO `student` VALUES (456, '陈兵', 137, 11, '5948061174', '2021-02-03', '15001460339', NULL, 0, 0);
INSERT INTO `student` VALUES (457, '林凤英', 305, 12, '6183853491', '2021-02-03', '15301966242', NULL, 0, 0);
INSERT INTO `student` VALUES (458, '陈淑英', 120, 22, '1089033968', '2021-02-03', '13500453676', NULL, 0, 0);
INSERT INTO `student` VALUES (459, '邓欢', 367, 19, '3815590657', '2021-02-03', '15103533143', NULL, 0, 0);
INSERT INTO `student` VALUES (460, '王洁', 387, 10, '8288723820', '2021-02-03', '13704535585', NULL, 0, 0);
INSERT INTO `student` VALUES (461, '夏艳', 358, 11, '6776515931', '2021-02-03', '13406425187', NULL, 0, 0);
INSERT INTO `student` VALUES (462, '李鹏', 393, 11, '1493170162', '2021-02-03', '15606617508', NULL, 0, 0);
INSERT INTO `student` VALUES (463, '黄建国', 254, 23, '0379080971', '2021-02-03', '15201728988', NULL, 0, 0);
INSERT INTO `student` VALUES (464, '杨杨', 383, 18, '8013366258', '2021-02-03', '15904663976', NULL, 0, 0);
INSERT INTO `student` VALUES (465, '唐志强', 240, 19, '1120762103', '2021-02-03', '13708156949', NULL, 0, 0);
INSERT INTO `student` VALUES (466, '邓涛', 383, 12, '9986221962', '2021-02-03', '13901922542', NULL, 0, 0);
INSERT INTO `student` VALUES (467, '段桂珍', 223, 10, '4187617682', '2021-02-03', '13104901475', NULL, 0, 0);
INSERT INTO `student` VALUES (468, '赵淑珍', 370, 19, '9714399466', '2021-02-03', '13105764775', NULL, 0, 0);
INSERT INTO `student` VALUES (469, '罗帆', 133, 12, '1113015886', '2021-02-03', '15600778016', NULL, 0, 0);
INSERT INTO `student` VALUES (470, '王杰', 154, 12, '6604583716', '2021-02-03', '13004447268', NULL, 0, 0);
INSERT INTO `student` VALUES (471, '颜楠', 7, 16, '5617315111', '2021-02-03', '15805160425', NULL, 0, 0);
INSERT INTO `student` VALUES (472, '陈文', 208, 15, '0673180325', '2021-02-03', '13107347611', NULL, 0, 0);
INSERT INTO `student` VALUES (473, '余龙', 82, 18, '8808727257', '2021-02-03', '15105802950', NULL, 0, 0);
INSERT INTO `student` VALUES (474, '吴秀梅', 201, 23, '8099371411', '2021-02-03', '15205746387', NULL, 0, 0);
INSERT INTO `student` VALUES (475, '李萍', 12, 18, '2006511643', '2021-02-03', '13104341058', NULL, 0, 0);
INSERT INTO `student` VALUES (476, '柏涛', 180, 15, '4130603959', '2021-02-03', '13901242059', NULL, 0, 0);
INSERT INTO `student` VALUES (477, '叶莉', 20, 19, '4616844694', '2021-02-03', '13606485769', NULL, 0, 0);
INSERT INTO `student` VALUES (478, '曹楠', 327, 23, '4159984170', '2021-02-03', '15305454295', NULL, 0, 0);
INSERT INTO `student` VALUES (479, '刘超', 186, 11, '2298239388', '2021-02-03', '15206488772', NULL, 0, 0);
INSERT INTO `student` VALUES (480, '贾欢', 196, 10, '9741120165', '2021-02-03', '13203646904', NULL, 0, 0);
INSERT INTO `student` VALUES (481, '李玉兰', 173, 23, '3716269709', '2021-02-03', '13900615842', NULL, 0, 0);
INSERT INTO `student` VALUES (482, '管飞', 210, 20, '5018456433', '2021-02-03', '13302150424', NULL, 0, 0);
INSERT INTO `student` VALUES (483, '周兰英', 222, 19, '1994132524', '2021-02-03', '13702435269', NULL, 0, 0);
INSERT INTO `student` VALUES (484, '张玉珍', 363, 19, '6870417109', '2021-02-03', '13701872125', NULL, 0, 0);
INSERT INTO `student` VALUES (485, '郭玉华', 51, 20, '5727830793', '2021-02-03', '13608791100', NULL, 0, 0);
INSERT INTO `student` VALUES (486, '吴晨', 341, 23, '8144922133', '2021-02-03', '13107124930', NULL, 0, 0);
INSERT INTO `student` VALUES (487, '吕桂香', 299, 23, '7516622634', '2021-02-03', '15301401194', NULL, 0, 0);
INSERT INTO `student` VALUES (488, '李志强', 277, 19, '4816227336', '2021-02-03', '13705714850', NULL, 0, 0);
INSERT INTO `student` VALUES (489, '张娟', 3, 18, '8756457213', '2021-02-03', '15906120653', NULL, 0, 0);
INSERT INTO `student` VALUES (490, '李春梅', 117, 22, '3202481373', '2021-02-03', '15802621334', NULL, 0, 0);
INSERT INTO `student` VALUES (491, '陈玲', 29, 11, '6888765385', '2021-02-03', '13306273183', NULL, 0, 0);
INSERT INTO `student` VALUES (492, '张婷婷', 149, 22, '1259681376', '2021-02-03', '15900192845', NULL, 0, 0);
INSERT INTO `student` VALUES (493, '刘桂香', 303, 19, '4946752509', '2021-02-03', '15502025953', NULL, 0, 0);
INSERT INTO `student` VALUES (494, '李建华', 260, 11, '5695784691', '2021-02-03', '15307772628', NULL, 0, 0);
INSERT INTO `student` VALUES (495, '马芳', 269, 18, '4112800222', '2021-02-03', '15106524728', NULL, 0, 0);
INSERT INTO `student` VALUES (496, '杨淑英', 66, 23, '3910296285', '2021-02-03', '15603225765', NULL, 0, 0);
INSERT INTO `student` VALUES (497, '敖杨', 162, 20, '4001990976', '2021-02-03', '13305800269', NULL, 0, 0);
INSERT INTO `student` VALUES (498, '潘鑫', 18, 11, '8290935863', '2021-02-03', '13602391836', NULL, 0, 0);
INSERT INTO `student` VALUES (499, '李楠', 114, 16, '7706464134', '2021-02-03', '15204998769', NULL, 0, 0);
INSERT INTO `student` VALUES (500, '梅刚', 365, 20, '3113422334', '2021-02-03', '13001593251', NULL, 0, 0);
INSERT INTO `student` VALUES (501, '鞠建国', 169, 12, '8990550864', '2021-02-03', '13708180560', NULL, 0, 0);
INSERT INTO `student` VALUES (502, '刘玉英', 115, 16, '2293394718', '2021-02-03', '13300446350', NULL, 0, 0);
INSERT INTO `student` VALUES (503, '李芳', 28, 10, '4699805200', '2021-02-03', '13408195753', NULL, 0, 0);
INSERT INTO `student` VALUES (504, '赖红', 274, 20, '9996691893', '2021-02-03', '15205504662', NULL, 0, 0);
INSERT INTO `student` VALUES (505, '曹军', 161, 22, '2948084496', '2021-02-03', '15706538152', NULL, 0, 0);
INSERT INTO `student` VALUES (506, '韦婷', 295, 23, '4238270315', '2021-02-03', '15708522691', NULL, 0, 0);
INSERT INTO `student` VALUES (507, '叶成', 302, 20, '4087365172', '2021-02-03', '13205980685', NULL, 0, 0);
INSERT INTO `student` VALUES (508, '霍兵', 199, 19, '9460003596', '2021-02-03', '15203743438', NULL, 0, 0);
INSERT INTO `student` VALUES (509, '陈慧', 115, 22, '4523151911', '2021-02-03', '13908638435', NULL, 0, 0);
INSERT INTO `student` VALUES (510, '玉兰英', 288, 15, '0001917956', '2021-02-03', '15207065806', NULL, 0, 0);
INSERT INTO `student` VALUES (511, '杨飞', 232, 15, '7985098747', '2021-02-03', '13604626618', NULL, 0, 0);
INSERT INTO `student` VALUES (512, '朱畅', 12, 12, '3445054006', '2021-02-03', '15600785025', NULL, 0, 0);
INSERT INTO `student` VALUES (513, '陈洁', 55, 15, '1869814138', '2021-02-03', '15003023503', NULL, 0, 0);
INSERT INTO `student` VALUES (514, '杨霞', 95, 20, '7061191052', '2021-02-03', '13402531741', NULL, 0, 0);
INSERT INTO `student` VALUES (515, '符玲', 328, 20, '9708949500', '2021-02-03', '15003234827', NULL, 0, 0);
INSERT INTO `student` VALUES (516, '卢娜', 16, 23, '5554187182', '2021-02-03', '13307123734', NULL, 0, 0);
INSERT INTO `student` VALUES (517, '杜春梅', 36, 11, '6200049225', '2021-02-03', '15500044429', NULL, 0, 0);
INSERT INTO `student` VALUES (518, '祝辉', 374, 16, '5654724269', '2021-02-03', '13403900741', NULL, 0, 0);
INSERT INTO `student` VALUES (519, '杨亮', 316, 15, '4763465591', '2021-02-03', '15901583779', NULL, 0, 0);
INSERT INTO `student` VALUES (520, '邵磊', 99, 16, '7368591360', '2021-02-03', '15703364597', NULL, 0, 0);
INSERT INTO `student` VALUES (521, '江雷', 339, 19, '6380600865', '2021-02-03', '15306087940', NULL, 0, 0);
INSERT INTO `student` VALUES (522, '李宁', 42, 10, '0461324910', '2021-02-03', '15204212445', NULL, 0, 0);
INSERT INTO `student` VALUES (523, '张飞', 72, 10, '1071817988', '2021-02-03', '13504183285', NULL, 0, 0);
INSERT INTO `student` VALUES (524, '侯丽娟', 218, 10, '5843658803', '2021-02-03', '15300146625', NULL, 0, 0);
INSERT INTO `student` VALUES (525, '隋红梅', 75, 20, '2091948035', '2021-02-03', '13601152245', NULL, 0, 0);
INSERT INTO `student` VALUES (526, '王刚', 118, 15, '2825462733', '2021-02-03', '15605497389', NULL, 0, 0);
INSERT INTO `student` VALUES (527, '安凤兰', 36, 15, '9578067545', '2021-02-03', '13400353760', NULL, 0, 0);
INSERT INTO `student` VALUES (528, '杜军', 213, 19, '0320803502', '2021-02-03', '15702197331', NULL, 0, 0);
INSERT INTO `student` VALUES (529, '盛文', 136, 22, '8506066273', '2021-02-03', '13107201183', NULL, 0, 0);
INSERT INTO `student` VALUES (530, '和秀荣', 298, 15, '0740280722', '2021-02-03', '15305168640', NULL, 0, 0);
INSERT INTO `student` VALUES (531, '刘建华', 205, 22, '8259148301', '2021-02-03', '15105526269', NULL, 0, 0);
INSERT INTO `student` VALUES (532, '李红霞', 269, 19, '6345014119', '2021-02-03', '15206145696', NULL, 0, 0);
INSERT INTO `student` VALUES (533, '周琴', 323, 15, '9778627035', '2021-02-03', '13600345701', NULL, 0, 0);
INSERT INTO `student` VALUES (534, '陈龙', 191, 23, '1055204620', '2021-02-03', '13007050270', NULL, 0, 0);
INSERT INTO `student` VALUES (535, '刘超', 263, 18, '6128200411', '2021-02-03', '15200975229', NULL, 0, 0);
INSERT INTO `student` VALUES (536, '周楠', 363, 16, '8542467363', '2021-02-03', '13302282017', NULL, 0, 0);
INSERT INTO `student` VALUES (537, '李欢', 184, 10, '6263266598', '2021-02-03', '15104465295', NULL, 0, 0);
INSERT INTO `student` VALUES (538, '刘娟', 25, 12, '4387682143', '2021-02-03', '15308144109', NULL, 0, 0);
INSERT INTO `student` VALUES (539, '王强', 22, 20, '6678033237', '2021-02-03', '15908327357', NULL, 0, 0);
INSERT INTO `student` VALUES (540, '蓝红', 52, 15, '9589187541', '2021-02-03', '15805363891', NULL, 0, 0);
INSERT INTO `student` VALUES (541, '刘文', 192, 19, '0375129542', '2021-02-03', '15608877653', NULL, 0, 0);
INSERT INTO `student` VALUES (542, '黎鑫', 290, 11, '7763022269', '2021-02-03', '13507875352', NULL, 0, 0);
INSERT INTO `student` VALUES (543, '张洋', 376, 12, '5137948852', '2021-02-03', '15807530783', NULL, 0, 0);
INSERT INTO `student` VALUES (544, '王桂兰', 297, 16, '4131987221', '2021-02-03', '13706873361', NULL, 0, 0);
INSERT INTO `student` VALUES (545, '王洁', 110, 19, '2441100762', '2021-02-03', '15604111942', NULL, 0, 0);
INSERT INTO `student` VALUES (546, '韩建', 79, 23, '1160264099', '2021-02-03', '13001963502', NULL, 0, 0);
INSERT INTO `student` VALUES (547, '楚玉兰', 30, 10, '0589926520', '2021-02-03', '13906638475', NULL, 0, 0);
INSERT INTO `student` VALUES (548, '卢娜', 38, 15, '5776865005', '2021-02-03', '15508184444', NULL, 0, 0);
INSERT INTO `student` VALUES (549, '张楠', 184, 22, '4618726341', '2021-02-03', '15502892808', NULL, 0, 0);
INSERT INTO `student` VALUES (550, '刘玉', 219, 15, '5477953573', '2021-02-03', '13103248675', NULL, 0, 0);
INSERT INTO `student` VALUES (551, '金玉华', 108, 12, '1407455040', '2021-02-03', '13606647562', NULL, 0, 0);
INSERT INTO `student` VALUES (552, '杨凤兰', 92, 22, '4623988712', '2021-02-03', '13403886934', NULL, 0, 0);
INSERT INTO `student` VALUES (553, '吴敏', 239, 18, '4445512056', '2021-02-03', '15003345625', NULL, 0, 0);
INSERT INTO `student` VALUES (554, '张玉梅', 333, 15, '3737235666', '2021-02-03', '15505470107', NULL, 0, 0);
INSERT INTO `student` VALUES (555, '秦金凤', 73, 20, '6779055245', '2021-02-03', '13007530441', NULL, 0, 0);
INSERT INTO `student` VALUES (556, '董红', 282, 11, '7198311486', '2021-02-03', '13101631272', NULL, 0, 0);
INSERT INTO `student` VALUES (557, '鞠俊', 113, 20, '4123670694', '2021-02-03', '15100310796', NULL, 0, 0);
INSERT INTO `student` VALUES (558, '卢飞', 214, 11, '5762080856', '2021-02-03', '15904994181', NULL, 0, 0);
INSERT INTO `student` VALUES (559, '李婷', 383, 18, '5144377143', '2021-02-03', '13507750949', NULL, 0, 0);
INSERT INTO `student` VALUES (560, '温丽丽', 56, 16, '1022582105', '2021-02-03', '13401348928', NULL, 0, 0);
INSERT INTO `student` VALUES (561, '钟柳', 181, 10, '8898192523', '2021-02-03', '13307988603', NULL, 0, 0);
INSERT INTO `student` VALUES (562, '张浩', 72, 10, '8198181030', '2021-02-03', '13000346581', NULL, 0, 0);
INSERT INTO `student` VALUES (563, '缪凤英', 349, 23, '6927967838', '2021-02-03', '13204035773', NULL, 0, 0);
INSERT INTO `student` VALUES (564, '王刚', 183, 11, '8588750192', '2021-02-03', '15805454126', NULL, 0, 0);
INSERT INTO `student` VALUES (565, '王杰', 57, 16, '9840790185', '2021-02-03', '15908496728', NULL, 0, 0);
INSERT INTO `student` VALUES (566, '张云', 259, 15, '2132519700', '2021-02-03', '13102536900', NULL, 0, 0);
INSERT INTO `student` VALUES (567, '文瑞', 147, 15, '0354617607', '2021-02-03', '15607732065', NULL, 0, 0);
INSERT INTO `student` VALUES (568, '冯倩', 364, 19, '5336377380', '2021-02-03', '15807013909', NULL, 0, 0);
INSERT INTO `student` VALUES (569, '刘丽', 21, 12, '1546825997', '2021-02-03', '15006043310', NULL, 0, 0);
INSERT INTO `student` VALUES (570, '苑成', 232, 19, '1518558614', '2021-02-03', '13203506802', NULL, 0, 0);
INSERT INTO `student` VALUES (571, '郑建军', 139, 20, '4767127186', '2021-02-03', '13304117935', NULL, 0, 0);
INSERT INTO `student` VALUES (572, '张秀荣', 257, 15, '1427971965', '2021-02-03', '15900483714', NULL, 0, 0);
INSERT INTO `student` VALUES (573, '熊磊', 110, 23, '1804890873', '2021-02-03', '13404313253', NULL, 0, 0);
INSERT INTO `student` VALUES (574, '崔想', 391, 23, '1583308060', '2021-02-03', '15701175512', NULL, 0, 0);
INSERT INTO `student` VALUES (575, '颜晶', 141, 10, '7785770456', '2021-02-03', '13602087840', NULL, 0, 0);
INSERT INTO `student` VALUES (576, '韦婷', 216, 11, '0275290351', '2021-02-03', '13900093377', NULL, 0, 0);
INSERT INTO `student` VALUES (577, '汤凤英', 122, 19, '3438988105', '2021-02-03', '13006458205', NULL, 0, 0);
INSERT INTO `student` VALUES (578, '祝林', 45, 11, '7945494971', '2021-02-03', '15308183303', NULL, 0, 0);
INSERT INTO `student` VALUES (579, '梁玉英', 66, 20, '7683974776', '2021-02-03', '13608532933', NULL, 0, 0);
INSERT INTO `student` VALUES (580, '石璐', 26, 10, '6329388440', '2021-02-03', '15904086811', NULL, 0, 0);
INSERT INTO `student` VALUES (581, '洪丽娟', 272, 18, '4427275496', '2021-02-03', '15200793465', NULL, 0, 0);
INSERT INTO `student` VALUES (582, '韦俊', 398, 20, '1415262804', '2021-02-03', '13207300733', NULL, 0, 0);
INSERT INTO `student` VALUES (583, '黄建国', 141, 23, '1233154981', '2021-02-03', '13207781965', NULL, 0, 0);
INSERT INTO `student` VALUES (584, '詹淑英', 346, 23, '6833006300', '2021-02-03', '15006297094', NULL, 0, 0);
INSERT INTO `student` VALUES (585, '李玉珍', 359, 12, '9146356158', '2021-02-03', '13004401220', NULL, 0, 0);
INSERT INTO `student` VALUES (586, '王阳', 388, 16, '2094745871', '2021-02-03', '13400781963', NULL, 0, 0);
INSERT INTO `student` VALUES (587, '马海燕', 48, 11, '2354658727', '2021-02-03', '13201233867', NULL, 0, 0);
INSERT INTO `student` VALUES (588, '徐淑珍', 356, 12, '3729254898', '2021-02-03', '13107540052', NULL, 0, 0);
INSERT INTO `student` VALUES (589, '罗玉英', 156, 15, '2309508350', '2021-02-03', '13602608926', NULL, 0, 0);
INSERT INTO `student` VALUES (590, '邹雷', 1, 22, '0434311328', '2021-02-03', '15308184431', NULL, 0, 0);
INSERT INTO `student` VALUES (591, '张桂香', 143, 10, '1703205730', '2021-02-03', '15601862336', NULL, 0, 0);
INSERT INTO `student` VALUES (592, '马秀荣', 112, 23, '7023375025', '2021-02-03', '15700235432', NULL, 0, 0);
INSERT INTO `student` VALUES (593, '杨丽', 290, 19, '1428518530', '2021-02-03', '13507798549', NULL, 0, 0);
INSERT INTO `student` VALUES (594, '高桂香', 203, 23, '6215420936', '2021-02-03', '15505937188', NULL, 0, 0);
INSERT INTO `student` VALUES (595, '彭帆', 27, 16, '6589672014', '2021-02-03', '13205504727', NULL, 0, 0);
INSERT INTO `student` VALUES (596, '江勇', 68, 23, '4893893007', '2021-02-03', '15201998761', NULL, 0, 0);
INSERT INTO `student` VALUES (597, '韦婷', 228, 22, '2990798832', '2021-02-03', '13500578987', NULL, 0, 0);
INSERT INTO `student` VALUES (598, '林婷', 283, 18, '2170709146', '2021-02-03', '13903168537', NULL, 0, 0);
INSERT INTO `student` VALUES (599, '杜阳', 94, 19, '9926629488', '2021-02-03', '15207402855', NULL, 0, 0);
INSERT INTO `student` VALUES (600, '杨萍', 66, 23, '4552918352', '2021-02-03', '15606458978', NULL, 0, 0);
INSERT INTO `student` VALUES (601, '郭桂兰', 47, 12, '7718460301', '2021-02-03', '15301077394', NULL, 0, 0);
INSERT INTO `student` VALUES (602, '章冬梅', 70, 11, '5304864925', '2021-02-03', '13902193188', NULL, 0, 0);
INSERT INTO `student` VALUES (603, '董倩', 396, 19, '9139118870', '2021-02-03', '15203462614', NULL, 0, 0);
INSERT INTO `student` VALUES (604, '崔波', 206, 16, '9306712620', '2021-02-03', '13601812413', NULL, 0, 0);
INSERT INTO `student` VALUES (605, '张红', 82, 18, '2932012257', '2021-02-03', '15805122265', NULL, 0, 0);
INSERT INTO `student` VALUES (606, '苏旭', 120, 11, '1389534921', '2021-02-03', '13303836140', NULL, 0, 0);
INSERT INTO `student` VALUES (607, '叶红梅', 325, 18, '5929431594', '2021-02-03', '15301429071', NULL, 0, 0);
INSERT INTO `student` VALUES (608, '赵建华', 83, 11, '2573782399', '2021-02-03', '13805375463', NULL, 0, 0);
INSERT INTO `student` VALUES (609, '李旭', 210, 11, '3757969541', '2021-02-03', '15105847858', NULL, 0, 0);
INSERT INTO `student` VALUES (610, '程兰英', 44, 10, '6934467753', '2021-02-03', '13203858916', NULL, 0, 0);
INSERT INTO `student` VALUES (611, '王健', 155, 19, '8276715769', '2021-02-03', '15101050892', NULL, 0, 0);
INSERT INTO `student` VALUES (612, '王丹', 236, 23, '7923627277', '2021-02-03', '15003100437', NULL, 0, 0);
INSERT INTO `student` VALUES (613, '隋红梅', 259, 23, '9393844044', '2021-02-03', '13606902471', NULL, 0, 0);
INSERT INTO `student` VALUES (614, '彭帆', 161, 18, '5931471765', '2021-02-03', '15706268231', NULL, 0, 0);
INSERT INTO `student` VALUES (615, '杨峰', 18, 23, '4175519270', '2021-02-03', '13606794897', NULL, 0, 0);
INSERT INTO `student` VALUES (616, '彭超', 270, 22, '4669975317', '2021-02-03', '15700504907', NULL, 0, 0);
INSERT INTO `student` VALUES (617, '连欢', 298, 16, '2665817792', '2021-02-03', '13906837299', NULL, 0, 0);
INSERT INTO `student` VALUES (618, '姜秀华', 238, 10, '4275111836', '2021-02-03', '15206120652', NULL, 0, 0);
INSERT INTO `student` VALUES (619, '杨春梅', 254, 18, '7294087590', '2021-02-03', '13002867162', NULL, 0, 0);
INSERT INTO `student` VALUES (620, '杨琳', 296, 15, '2874905261', '2021-02-03', '15701704178', NULL, 0, 0);
INSERT INTO `student` VALUES (621, '邓宁', 219, 10, '9840139525', '2021-02-03', '13003710608', NULL, 0, 0);
INSERT INTO `student` VALUES (622, '杨建', 344, 12, '4136351403', '2021-02-03', '13007891291', NULL, 0, 0);
INSERT INTO `student` VALUES (623, '李杨', 340, 10, '6065844861', '2021-02-03', '15808043705', NULL, 0, 0);
INSERT INTO `student` VALUES (624, '谭艳', 233, 19, '7667222699', '2021-02-03', '13504775378', NULL, 0, 0);
INSERT INTO `student` VALUES (625, '白慧', 176, 22, '5846855373', '2021-02-03', '13104017572', NULL, 0, 0);
INSERT INTO `student` VALUES (626, '李宇', 111, 10, '3036926811', '2021-02-03', '13308461032', NULL, 0, 0);
INSERT INTO `student` VALUES (627, '田丹', 319, 20, '9857813005', '2021-02-03', '15501288554', NULL, 0, 0);
INSERT INTO `student` VALUES (628, '胡婷', 368, 11, '1810850573', '2021-02-03', '13003434688', NULL, 0, 0);
INSERT INTO `student` VALUES (629, '叶东', 342, 19, '0427298185', '2021-02-03', '15702743158', NULL, 0, 0);
INSERT INTO `student` VALUES (630, '王鹏', 217, 10, '9467598198', '2021-02-03', '13003267773', NULL, 0, 0);
INSERT INTO `student` VALUES (631, '邱婷婷', 250, 23, '6639527889', '2021-02-03', '15606128093', NULL, 0, 0);
INSERT INTO `student` VALUES (632, '刘娜', 356, 10, '4219926724', '2021-02-03', '15608078502', NULL, 0, 0);
INSERT INTO `student` VALUES (633, '彭杨', 243, 22, '5567091204', '2021-02-03', '15706723606', NULL, 0, 0);
INSERT INTO `student` VALUES (634, '冯磊', 304, 18, '9529791761', '2021-02-03', '15301522152', NULL, 0, 0);
INSERT INTO `student` VALUES (635, '王阳', 48, 22, '4417341991', '2021-02-03', '15901370262', NULL, 0, 0);
INSERT INTO `student` VALUES (636, '兰丽华', 14, 12, '4940223822', '2021-02-03', '15101471957', NULL, 0, 0);
INSERT INTO `student` VALUES (637, '刘建华', 21, 15, '4098313259', '2021-02-03', '15504032138', NULL, 0, 0);
INSERT INTO `student` VALUES (638, '张秀云', 87, 19, '9284168071', '2021-02-03', '13004297791', NULL, 0, 0);
INSERT INTO `student` VALUES (639, '阳瑞', 168, 19, '4639137757', '2021-02-03', '13501337383', NULL, 0, 0);
INSERT INTO `student` VALUES (640, '屈勇', 278, 22, '8971857572', '2021-02-03', '15106435239', NULL, 0, 0);
INSERT INTO `student` VALUES (641, '陈芳', 245, 12, '6426357184', '2021-02-03', '13207376231', NULL, 0, 0);
INSERT INTO `student` VALUES (642, '陈丽娟', 297, 20, '7593090455', '2021-02-03', '15204505416', NULL, 0, 0);
INSERT INTO `student` VALUES (643, '陈亮', 355, 15, '4389252226', '2021-02-03', '13105876749', NULL, 0, 0);
INSERT INTO `student` VALUES (644, '温超', 197, 15, '2772872592', '2021-02-03', '15801100177', NULL, 0, 0);
INSERT INTO `student` VALUES (645, '康军', 271, 23, '4518939846', '2021-02-03', '15605925893', NULL, 0, 0);
INSERT INTO `student` VALUES (646, '杜玉兰', 179, 20, '3797613798', '2021-02-03', '15808384939', NULL, 0, 0);
INSERT INTO `student` VALUES (647, '张畅', 297, 19, '7100591799', '2021-02-03', '15304050090', NULL, 0, 0);
INSERT INTO `student` VALUES (648, '殷淑华', 138, 22, '8860941864', '2021-02-03', '13005222373', NULL, 0, 0);
INSERT INTO `student` VALUES (649, '彭杨', 120, 15, '4087627738', '2021-02-03', '13701647547', NULL, 0, 0);
INSERT INTO `student` VALUES (650, '卢飞', 39, 16, '2156698465', '2021-02-03', '15808367985', NULL, 0, 0);
INSERT INTO `student` VALUES (651, '练畅', 167, 22, '5255459639', '2021-02-03', '13404730696', NULL, 0, 0);
INSERT INTO `student` VALUES (652, '傅玉兰', 307, 23, '9274396665', '2021-02-03', '13202470446', NULL, 0, 0);
INSERT INTO `student` VALUES (653, '尹红梅', 344, 18, '8640809756', '2021-02-03', '13907737228', NULL, 0, 0);
INSERT INTO `student` VALUES (654, '张超', 29, 10, '4954217930', '2021-02-03', '15702706646', NULL, 0, 0);
INSERT INTO `student` VALUES (655, '蔡秀英', 86, 12, '5178356797', '2021-02-03', '15805949035', NULL, 0, 0);
INSERT INTO `student` VALUES (656, '孙帆', 263, 23, '9048399031', '2021-02-03', '13001140495', NULL, 0, 0);
INSERT INTO `student` VALUES (657, '吴佳', 47, 20, '7076171637', '2021-02-03', '13101482412', NULL, 0, 0);
INSERT INTO `student` VALUES (658, '周玉珍', 151, 23, '6641744119', '2021-02-03', '13105046168', NULL, 0, 0);
INSERT INTO `student` VALUES (659, '顾玉梅', 81, 19, '4509225542', '2021-02-03', '15107808970', NULL, 0, 0);
INSERT INTO `student` VALUES (660, '王飞', 4, 12, '3519427070', '2021-02-03', '13806844175', NULL, 0, 0);
INSERT INTO `student` VALUES (661, '张晶', 171, 15, '4135813912', '2021-02-03', '15902227466', NULL, 0, 0);
INSERT INTO `student` VALUES (662, '王秀梅', 358, 22, '8092182536', '2021-02-03', '13705823695', NULL, 0, 0);
INSERT INTO `student` VALUES (663, '刘玉珍', 17, 18, '6904100201', '2021-02-03', '15305091631', NULL, 0, 0);
INSERT INTO `student` VALUES (664, '杜帆', 241, 20, '3551570129', '2021-02-03', '15606026600', NULL, 0, 0);
INSERT INTO `student` VALUES (665, '杨莹', 289, 18, '1565196474', '2021-02-03', '15607764843', NULL, 0, 0);
INSERT INTO `student` VALUES (666, '韦金凤', 183, 23, '5840696796', '2021-02-03', '15908778754', NULL, 0, 0);
INSERT INTO `student` VALUES (667, '余秀珍', 68, 22, '0776256206', '2021-02-03', '15002238792', NULL, 0, 0);
INSERT INTO `student` VALUES (668, '程小红', 200, 10, '0090144319', '2021-02-03', '13105452377', NULL, 0, 0);
INSERT INTO `student` VALUES (669, '刘刚', 248, 23, '8320264757', '2021-02-03', '13503984326', NULL, 0, 0);
INSERT INTO `student` VALUES (670, '赵辉', 307, 15, '8569673120', '2021-02-03', '13907482021', NULL, 0, 0);
INSERT INTO `student` VALUES (671, '任桂芝', 142, 15, '4794632979', '2021-02-03', '13400773933', NULL, 0, 0);
INSERT INTO `student` VALUES (672, '陈萍', 392, 10, '1482096466', '2021-02-03', '15701636901', NULL, 0, 0);
INSERT INTO `student` VALUES (673, '郭红', 354, 15, '3698615915', '2021-02-03', '15105277457', NULL, 0, 0);
INSERT INTO `student` VALUES (674, '刘兰英', 44, 11, '0936567899', '2021-02-03', '15802992732', NULL, 0, 0);
INSERT INTO `student` VALUES (675, '赵辉', 115, 10, '6264316348', '2021-02-03', '13900668225', NULL, 0, 0);
INSERT INTO `student` VALUES (676, '陈建', 367, 10, '8540213374', '2021-02-03', '15903008291', NULL, 0, 0);
INSERT INTO `student` VALUES (677, '田成', 294, 15, '4687484954', '2021-02-03', '15303517513', NULL, 0, 0);
INSERT INTO `student` VALUES (678, '周桂珍', 75, 10, '7192100808', '2021-02-03', '15802510402', NULL, 0, 0);
INSERT INTO `student` VALUES (679, '黄建国', 54, 15, '2769094459', '2021-02-03', '13702501643', NULL, 0, 0);
INSERT INTO `student` VALUES (680, '鞠丹丹', 187, 10, '0017695952', '2021-02-03', '13803265642', NULL, 0, 0);
INSERT INTO `student` VALUES (681, '马红梅', 137, 10, '7690401367', '2021-02-03', '13505247141', NULL, 0, 0);
INSERT INTO `student` VALUES (682, '陈秀梅', 306, 12, '2860317239', '2021-02-03', '13707063966', NULL, 0, 0);
INSERT INTO `student` VALUES (683, '尹志强', 270, 18, '0528828198', '2021-02-03', '13705661179', NULL, 0, 0);
INSERT INTO `student` VALUES (684, '严丽华', 34, 20, '5130496569', '2021-02-03', '13005670939', NULL, 0, 0);
INSERT INTO `student` VALUES (685, '罗霞', 274, 19, '9409991162', '2021-02-03', '15203423637', NULL, 0, 0);
INSERT INTO `student` VALUES (686, '钟涛', 19, 19, '5069113857', '2021-02-03', '15107408498', NULL, 0, 0);
INSERT INTO `student` VALUES (687, '谢桂花', 146, 12, '5809117143', '2021-02-03', '15004350208', NULL, 0, 0);
INSERT INTO `student` VALUES (688, '韩秀英', 351, 16, '9029578981', '2021-02-03', '15301517415', NULL, 0, 0);
INSERT INTO `student` VALUES (689, '倪英', 244, 20, '0449201018', '2021-02-03', '15106618022', NULL, 0, 0);
INSERT INTO `student` VALUES (690, '赵欢', 214, 20, '6840571930', '2021-02-03', '13604074411', NULL, 0, 0);
INSERT INTO `student` VALUES (691, '卢凤英', 83, 11, '8081092808', '2021-02-03', '13003250357', NULL, 0, 0);
INSERT INTO `student` VALUES (692, '李燕', 165, 20, '4394864362', '2021-02-03', '15202107442', NULL, 0, 0);
INSERT INTO `student` VALUES (693, '马欢', 141, 20, '1461624335', '2021-02-03', '13503518950', NULL, 0, 0);
INSERT INTO `student` VALUES (694, '管红', 56, 19, '0440777801', '2021-02-03', '13901440535', NULL, 0, 0);
INSERT INTO `student` VALUES (695, '李晨', 191, 16, '4215128226', '2021-02-03', '13805261671', NULL, 0, 0);
INSERT INTO `student` VALUES (696, '郭桂兰', 270, 22, '0825218911', '2021-02-03', '15706301473', NULL, 0, 0);
INSERT INTO `student` VALUES (697, '刘东', 17, 23, '3784694660', '2021-02-03', '15606775286', NULL, 0, 0);
INSERT INTO `student` VALUES (698, '蔡建华', 383, 15, '5602656896', '2021-02-03', '15003981585', NULL, 0, 0);
INSERT INTO `student` VALUES (699, '彭帆', 108, 10, '8755859783', '2021-02-03', '13006532967', NULL, 0, 0);
INSERT INTO `student` VALUES (700, '吴淑英', 39, 20, '6664082243', '2021-02-03', '15802935808', NULL, 0, 0);
INSERT INTO `student` VALUES (701, '吴桂芝', 228, 23, '9970147672', '2021-02-03', '13703693234', NULL, 0, 0);
INSERT INTO `student` VALUES (702, '潘欣', 107, 19, '0297270283', '2021-02-03', '15902450241', NULL, 0, 0);
INSERT INTO `student` VALUES (703, '张龙', 137, 20, '5536827788', '2021-02-03', '15806285628', NULL, 0, 0);
INSERT INTO `student` VALUES (704, '刘浩', 114, 22, '5025191048', '2021-02-03', '13702143071', NULL, 0, 0);
INSERT INTO `student` VALUES (705, '杨洁', 134, 16, '5022174512', '2021-02-03', '15302832585', NULL, 0, 0);
INSERT INTO `student` VALUES (706, '黄金凤', 289, 19, '8251030294', '2021-02-03', '13905895406', NULL, 0, 0);
INSERT INTO `student` VALUES (707, '马丽丽', 320, 12, '0257477130', '2021-02-03', '15604829011', NULL, 0, 0);
INSERT INTO `student` VALUES (708, '刘兰英', 371, 11, '7599997334', '2021-02-03', '13502301825', NULL, 0, 0);
INSERT INTO `student` VALUES (709, '王玲', 94, 20, '8275175294', '2021-02-03', '13001754996', NULL, 0, 0);
INSERT INTO `student` VALUES (710, '李飞', 352, 11, '1451143716', '2021-02-03', '13103364608', NULL, 0, 0);
INSERT INTO `student` VALUES (711, '尹丽', 389, 11, '5433297958', '2021-02-03', '13004581668', NULL, 0, 0);
INSERT INTO `student` VALUES (712, '黄秀英', 98, 16, '0615288299', '2021-02-03', '13604543452', NULL, 0, 0);
INSERT INTO `student` VALUES (713, '蓝红', 271, 23, '4818855274', '2021-02-03', '15108867976', NULL, 0, 0);
INSERT INTO `student` VALUES (714, '孙俊', 50, 11, '2109129900', '2021-02-03', '15905764428', NULL, 0, 0);
INSERT INTO `student` VALUES (715, '陆楠', 343, 18, '9065516298', '2021-02-03', '13904132939', NULL, 0, 0);
INSERT INTO `student` VALUES (716, '余俊', 290, 23, '4291448337', '2021-02-03', '13900466321', NULL, 0, 0);
INSERT INTO `student` VALUES (717, '王玉', 277, 19, '4297829868', '2021-02-03', '13904065224', NULL, 0, 0);
INSERT INTO `student` VALUES (718, '周秀兰', 114, 20, '7503535476', '2021-02-03', '13202484675', NULL, 0, 0);
INSERT INTO `student` VALUES (719, '李兰英', 215, 23, '3984291141', '2021-02-03', '13205903650', NULL, 0, 0);
INSERT INTO `student` VALUES (720, '陈杨', 337, 11, '4937290571', '2021-02-03', '13005080681', NULL, 0, 0);
INSERT INTO `student` VALUES (721, '张燕', 241, 19, '1019284344', '2021-02-03', '15303280253', NULL, 0, 0);
INSERT INTO `student` VALUES (722, '李桂珍', 346, 15, '2016701825', '2021-02-03', '15502675958', NULL, 0, 0);
INSERT INTO `student` VALUES (723, '周桂珍', 226, 16, '4648514205', '2021-02-03', '13007319043', NULL, 0, 0);
INSERT INTO `student` VALUES (724, '张宁', 332, 23, '9915947705', '2021-02-03', '13702857423', NULL, 0, 0);
INSERT INTO `student` VALUES (725, '黄瑜', 51, 20, '0092902451', '2021-02-03', '15208332244', NULL, 0, 0);
INSERT INTO `student` VALUES (726, '徐玉英', 182, 10, '7336418507', '2021-02-03', '13002871270', NULL, 0, 0);
INSERT INTO `student` VALUES (727, '左浩', 289, 20, '1032423152', '2021-02-03', '15105158352', NULL, 0, 0);
INSERT INTO `student` VALUES (728, '王杰', 289, 20, '2099977159', '2021-02-03', '15708060702', NULL, 0, 0);
INSERT INTO `student` VALUES (729, '陆平', 270, 20, '5150110459', '2021-02-03', '13500022397', NULL, 0, 0);
INSERT INTO `student` VALUES (730, '田想', 47, 12, '4189995423', '2021-02-03', '13005031073', NULL, 0, 0);
INSERT INTO `student` VALUES (731, '刘建', 113, 22, '7052990025', '2021-02-03', '15305446787', NULL, 0, 0);
INSERT INTO `student` VALUES (732, '朱洁', 113, 16, '2851596699', '2021-02-03', '13901360703', NULL, 0, 0);
INSERT INTO `student` VALUES (733, '魏文', 224, 10, '8924041245', '2021-02-03', '15301143174', NULL, 0, 0);
INSERT INTO `student` VALUES (734, '刘坤', 150, 20, '3850236758', '2021-02-03', '13407464933', NULL, 0, 0);
INSERT INTO `student` VALUES (735, '岳坤', 325, 11, '3680168966', '2021-02-03', '13905851584', NULL, 0, 0);
INSERT INTO `student` VALUES (736, '陶莉', 375, 18, '3779629588', '2021-02-03', '15807615094', NULL, 0, 0);
INSERT INTO `student` VALUES (737, '王丽', 28, 10, '9158459490', '2021-02-03', '13604295752', NULL, 0, 0);
INSERT INTO `student` VALUES (738, '白桂香', 296, 15, '8751013618', '2021-02-03', '13304576820', NULL, 0, 0);
INSERT INTO `student` VALUES (739, '陶海燕', 271, 22, '2982713488', '2021-02-03', '15602832019', NULL, 0, 0);
INSERT INTO `student` VALUES (740, '王丽丽', 13, 11, '9774323905', '2021-02-03', '13408093911', NULL, 0, 0);
INSERT INTO `student` VALUES (741, '梁芳', 118, 19, '8245875568', '2021-02-03', '15707616004', NULL, 0, 0);
INSERT INTO `student` VALUES (742, '魏桂兰', 159, 22, '8915719297', '2021-02-03', '15600466441', NULL, 0, 0);
INSERT INTO `student` VALUES (743, '俞琳', 384, 10, '1679247123', '2021-02-03', '13901845823', NULL, 0, 0);
INSERT INTO `student` VALUES (744, '黄建国', 16, 15, '8460456247', '2021-02-03', '15804485135', NULL, 0, 0);
INSERT INTO `student` VALUES (745, '李欢', 264, 22, '0538777750', '2021-02-03', '13706560156', NULL, 0, 0);
INSERT INTO `student` VALUES (746, '黄艳', 123, 20, '5209920367', '2021-02-03', '15107567773', NULL, 0, 0);
INSERT INTO `student` VALUES (747, '张秀梅', 128, 18, '9476246965', '2021-02-03', '15705236903', NULL, 0, 0);
INSERT INTO `student` VALUES (748, '刘雷', 170, 11, '0803440777', '2021-02-03', '15108541757', NULL, 0, 0);
INSERT INTO `student` VALUES (749, '苏兵', 94, 10, '7849215085', '2021-02-03', '13101412633', NULL, 0, 0);
INSERT INTO `student` VALUES (750, '费瑜', 107, 19, '7358758313', '2021-02-03', '15008442251', NULL, 0, 0);
INSERT INTO `student` VALUES (751, '倪利', 107, 18, '3108766242', '2021-02-03', '15503881437', NULL, 0, 0);
INSERT INTO `student` VALUES (752, '李燕', 293, 15, '7913104446', '2021-02-03', '13405204299', NULL, 0, 0);
INSERT INTO `student` VALUES (753, '李华', 150, 16, '1082389434', '2021-02-03', '13404050958', NULL, 0, 0);
INSERT INTO `student` VALUES (754, '陈娟', 349, 20, '5626768324', '2021-02-03', '13407908609', NULL, 0, 0);
INSERT INTO `student` VALUES (755, '宋婷', 202, 23, '7954804749', '2021-02-03', '13903293416', NULL, 0, 0);
INSERT INTO `student` VALUES (756, '彭杨', 147, 12, '6875900880', '2021-02-03', '15301290203', NULL, 0, 0);
INSERT INTO `student` VALUES (757, '郑建军', 356, 18, '1895388968', '2021-02-03', '15508155661', NULL, 0, 0);
INSERT INTO `student` VALUES (758, '胡雪', 60, 22, '0699220603', '2021-02-03', '13200206528', NULL, 0, 0);
INSERT INTO `student` VALUES (759, '陈玉华', 134, 18, '2173101868', '2021-02-03', '15803645720', NULL, 0, 0);
INSERT INTO `student` VALUES (760, '郭欣', 93, 22, '8733383101', '2021-02-03', '13202722557', NULL, 0, 0);
INSERT INTO `student` VALUES (761, '滕辉', 18, 11, '2207793723', '2021-02-03', '13608073365', NULL, 0, 0);
INSERT INTO `student` VALUES (762, '隆秀华', 222, 22, '5482902057', '2021-02-03', '13705998219', NULL, 0, 0);
INSERT INTO `student` VALUES (763, '李琴', 386, 11, '0025638981', '2021-02-03', '13007972006', NULL, 0, 0);
INSERT INTO `student` VALUES (764, '邵娜', 260, 12, '6218729655', '2021-02-03', '15903420157', NULL, 0, 0);
INSERT INTO `student` VALUES (765, '刘凤兰', 54, 23, '8053557284', '2021-02-03', '15603381380', NULL, 0, 0);
INSERT INTO `student` VALUES (766, '谭桂香', 338, 18, '9890734962', '2021-02-03', '15000482367', NULL, 0, 0);
INSERT INTO `student` VALUES (767, '支辉', 142, 20, '1261249648', '2021-02-03', '15802007497', NULL, 0, 0);
INSERT INTO `student` VALUES (768, '刘强', 322, 18, '2230325496', '2021-02-03', '15501414055', NULL, 0, 0);
INSERT INTO `student` VALUES (769, '杨萍', 273, 15, '0867114459', '2021-02-03', '13808157049', NULL, 0, 0);
INSERT INTO `student` VALUES (770, '陈莹', 49, 18, '3114128632', '2021-02-03', '13004231810', NULL, 0, 0);
INSERT INTO `student` VALUES (771, '吴龙', 53, 23, '9745850497', '2021-02-03', '15901015157', NULL, 0, 0);
INSERT INTO `student` VALUES (772, '曹桂花', 61, 16, '2922667748', '2021-02-03', '15305782361', NULL, 0, 0);
INSERT INTO `student` VALUES (773, '余晨', 155, 16, '9977590130', '2021-02-03', '13701204199', NULL, 0, 0);
INSERT INTO `student` VALUES (774, '李东', 251, 18, '6395228802', '2021-02-03', '15506272460', NULL, 0, 0);
INSERT INTO `student` VALUES (775, '朱丹丹', 179, 16, '7686666207', '2021-02-03', '13203573587', NULL, 0, 0);
INSERT INTO `student` VALUES (776, '吕玉英', 99, 23, '5214498449', '2021-02-03', '15204017538', NULL, 0, 0);
INSERT INTO `student` VALUES (777, '萧秀云', 208, 23, '2008651149', '2021-02-03', '13101926323', NULL, 0, 0);
INSERT INTO `student` VALUES (778, '张波', 100, 18, '2897531615', '2021-02-03', '15801350603', NULL, 0, 0);
INSERT INTO `student` VALUES (779, '刘瑞', 156, 15, '3692827653', '2021-02-03', '13705766096', NULL, 0, 0);
INSERT INTO `student` VALUES (780, '林凤英', 205, 23, '6986134438', '2021-02-03', '13800195855', NULL, 0, 0);
INSERT INTO `student` VALUES (781, '林宁', 196, 10, '0407613399', '2021-02-03', '15808398649', NULL, 0, 0);
INSERT INTO `student` VALUES (782, '张桂兰', 223, 12, '6959258433', '2021-02-03', '13906603531', NULL, 0, 0);
INSERT INTO `student` VALUES (783, '迟桂芝', 138, 22, '2777924407', '2021-02-03', '13903638701', NULL, 0, 0);
INSERT INTO `student` VALUES (784, '殷林', 309, 20, '6134648870', '2021-02-03', '13208080157', NULL, 0, 0);
INSERT INTO `student` VALUES (785, '李建国', 329, 18, '2086753132', '2021-02-03', '13208091841', NULL, 0, 0);
INSERT INTO `student` VALUES (786, '张博', 11, 11, '2137208785', '2021-02-03', '15507235140', NULL, 0, 0);
INSERT INTO `student` VALUES (787, '王燕', 37, 23, '5363257983', '2021-02-03', '13208178534', NULL, 0, 0);
INSERT INTO `student` VALUES (788, '张文', 34, 12, '6765158678', '2021-02-03', '15505867892', NULL, 0, 0);
INSERT INTO `student` VALUES (789, '吴淑英', 268, 18, '1196874772', '2021-02-03', '15206886235', NULL, 0, 0);
INSERT INTO `student` VALUES (790, '刘婷', 78, 20, '3635632271', '2021-02-03', '15305336317', NULL, 0, 0);
INSERT INTO `student` VALUES (791, '汪建', 141, 23, '8484098829', '2021-02-03', '15003663742', NULL, 0, 0);
INSERT INTO `student` VALUES (792, '何敏', 139, 11, '1010081494', '2021-02-03', '13701986707', NULL, 0, 0);
INSERT INTO `student` VALUES (793, '韦兰英', 162, 16, '3500619247', '2021-02-03', '13307500077', NULL, 0, 0);
INSERT INTO `student` VALUES (794, '杨红霞', 226, 10, '2157684173', '2021-02-03', '15606414772', NULL, 0, 0);
INSERT INTO `student` VALUES (795, '聂建平', 136, 11, '2131502112', '2021-02-03', '13601470116', NULL, 0, 0);
INSERT INTO `student` VALUES (796, '侯秀英', 82, 10, '2689909972', '2021-02-03', '13805671805', NULL, 0, 0);
INSERT INTO `student` VALUES (797, '潘鹏', 207, 16, '2948256054', '2021-02-03', '15301104443', NULL, 0, 0);
INSERT INTO `student` VALUES (798, '汪红霞', 21, 18, '5364571243', '2021-02-03', '13907824810', NULL, 0, 0);
INSERT INTO `student` VALUES (799, '虞丽华', 257, 19, '8197741434', '2021-02-03', '13502261159', NULL, 0, 0);
INSERT INTO `student` VALUES (800, '唐燕', 393, 11, '3772954756', '2021-02-03', '13307650868', NULL, 0, 0);
INSERT INTO `student` VALUES (801, '姜柳', 135, 11, '1941731384', '2021-02-03', '13806871277', NULL, 0, 0);
INSERT INTO `student` VALUES (802, '叶红霞', 141, 15, '7317300985', '2021-02-03', '13405650262', NULL, 0, 0);
INSERT INTO `student` VALUES (803, '范慧', 397, 15, '3263625002', '2021-02-03', '13807245847', NULL, 0, 0);
INSERT INTO `student` VALUES (804, '王磊', 339, 16, '2855124505', '2021-02-03', '15006924125', NULL, 0, 0);
INSERT INTO `student` VALUES (805, '张楠', 385, 22, '0127424579', '2021-02-03', '13603228631', NULL, 0, 0);
INSERT INTO `student` VALUES (806, '李慧', 14, 12, '2000349834', '2021-02-03', '13803777352', NULL, 0, 0);
INSERT INTO `student` VALUES (807, '王冬梅', 161, 12, '4293612507', '2021-02-03', '15906034932', NULL, 0, 0);
INSERT INTO `student` VALUES (808, '高志强', 45, 10, '2598158135', '2021-02-03', '15207327515', NULL, 0, 0);
INSERT INTO `student` VALUES (809, '张畅', 211, 12, '3700473410', '2021-02-03', '13405021667', NULL, 0, 0);
INSERT INTO `student` VALUES (810, '吕金凤', 92, 20, '7976601634', '2021-02-03', '15308688199', NULL, 0, 0);
INSERT INTO `student` VALUES (811, '李梅', 294, 18, '7458576021', '2021-02-03', '15502455346', NULL, 0, 0);
INSERT INTO `student` VALUES (812, '方平', 234, 19, '9996960785', '2021-02-03', '15900912758', NULL, 0, 0);
INSERT INTO `student` VALUES (813, '李雪', 13, 23, '4506324668', '2021-02-03', '15102087491', NULL, 0, 0);
INSERT INTO `student` VALUES (814, '杨洋', 80, 19, '5239837919', '2021-02-03', '15707053905', NULL, 0, 0);
INSERT INTO `student` VALUES (815, '赵璐', 328, 10, '9453001405', '2021-02-03', '13503340264', NULL, 0, 0);
INSERT INTO `student` VALUES (816, '伍倩', 358, 11, '0788215456', '2021-02-03', '13107091433', NULL, 0, 0);
INSERT INTO `student` VALUES (817, '郭雪梅', 152, 10, '5208767578', '2021-02-03', '13902713474', NULL, 0, 0);
INSERT INTO `student` VALUES (818, '武静', 192, 12, '8740749511', '2021-02-03', '13705504622', NULL, 0, 0);
INSERT INTO `student` VALUES (819, '费瑜', 71, 22, '2283893060', '2021-02-03', '15904914819', NULL, 0, 0);
INSERT INTO `student` VALUES (820, '范琳', 229, 10, '5769071853', '2021-02-03', '13106004272', NULL, 0, 0);
INSERT INTO `student` VALUES (821, '韩成', 9, 11, '3822375363', '2021-02-03', '13704372204', NULL, 0, 0);
INSERT INTO `student` VALUES (822, '李云', 251, 16, '1052435640', '2021-02-03', '13004623249', NULL, 0, 0);
INSERT INTO `student` VALUES (823, '张兵', 255, 23, '2697542835', '2021-02-03', '15000977795', NULL, 0, 0);
INSERT INTO `student` VALUES (824, '李鑫', 322, 20, '8498830543', '2021-02-03', '15906003265', NULL, 0, 0);
INSERT INTO `student` VALUES (825, '杨红', 230, 19, '3811870995', '2021-02-03', '15505475990', NULL, 0, 0);
INSERT INTO `student` VALUES (826, '梁芳', 210, 20, '2810744816', '2021-02-03', '13103592774', NULL, 0, 0);
INSERT INTO `student` VALUES (827, '黄佳', 27, 20, '6969105879', '2021-02-03', '15608509095', NULL, 0, 0);
INSERT INTO `student` VALUES (828, '颜帅', 271, 10, '0228613833', '2021-02-03', '15100386451', NULL, 0, 0);
INSERT INTO `student` VALUES (829, '朱刚', 139, 10, '2257613605', '2021-02-03', '15902403988', NULL, 0, 0);
INSERT INTO `student` VALUES (830, '陈建国', 277, 19, '6170782930', '2021-02-03', '13105050060', NULL, 0, 0);
INSERT INTO `student` VALUES (831, '尚洋', 282, 19, '5102009351', '2021-02-03', '15106827041', NULL, 0, 0);
INSERT INTO `student` VALUES (832, '张畅', 273, 15, '0311940727', '2021-02-03', '15304638975', NULL, 0, 0);
INSERT INTO `student` VALUES (833, '盛玉', 196, 10, '5402118648', '2021-02-03', '15901154182', NULL, 0, 0);
INSERT INTO `student` VALUES (834, '米雪', 60, 12, '7781253698', '2021-02-03', '13702064384', NULL, 0, 0);
INSERT INTO `student` VALUES (835, '萧秀云', 223, 19, '0365895000', '2021-02-03', '15203815985', NULL, 0, 0);
INSERT INTO `student` VALUES (836, '戴春梅', 63, 11, '4821000529', '2021-02-03', '13108604672', NULL, 0, 0);
INSERT INTO `student` VALUES (837, '吕荣', 151, 22, '4128860610', '2021-02-03', '13805477736', NULL, 0, 0);
INSERT INTO `student` VALUES (838, '赵俊', 293, 19, '8535618545', '2021-02-03', '13604035747', NULL, 0, 0);
INSERT INTO `student` VALUES (839, '钱丽华', 244, 20, '2311096038', '2021-02-03', '15000744910', NULL, 0, 0);
INSERT INTO `student` VALUES (840, '李艳', 196, 18, '1393891776', '2021-02-03', '13107639094', NULL, 0, 0);
INSERT INTO `student` VALUES (841, '陈凯', 34, 22, '7334424097', '2021-02-03', '15203667638', NULL, 0, 0);
INSERT INTO `student` VALUES (842, '张建', 64, 16, '6945644296', '2021-02-03', '13707286752', NULL, 0, 0);
INSERT INTO `student` VALUES (843, '朱畅', 349, 12, '4488433912', '2021-02-03', '13100755027', NULL, 0, 0);
INSERT INTO `student` VALUES (844, '黄云', 236, 19, '1957402697', '2021-02-03', '13100845042', NULL, 0, 0);
INSERT INTO `student` VALUES (845, '袁玉梅', 319, 20, '3364483332', '2021-02-03', '15103037452', NULL, 0, 0);
INSERT INTO `student` VALUES (846, '张明', 74, 23, '7566566062', '2021-02-03', '13607535056', NULL, 0, 0);
INSERT INTO `student` VALUES (847, '杜佳', 119, 20, '9313088013', '2021-02-03', '13206314338', NULL, 0, 0);
INSERT INTO `student` VALUES (848, '卢飞', 370, 20, '5280045767', '2021-02-03', '13106870376', NULL, 0, 0);
INSERT INTO `student` VALUES (849, '王霞', 59, 11, '0822527050', '2021-02-03', '15605431395', NULL, 0, 0);
INSERT INTO `student` VALUES (850, '王丽华', 128, 20, '0972565938', '2021-02-03', '13103415833', NULL, 0, 0);
INSERT INTO `student` VALUES (851, '王健', 61, 22, '6470588459', '2021-02-03', '13200030380', NULL, 0, 0);
INSERT INTO `student` VALUES (852, '刘云', 321, 22, '2139676104', '2021-02-03', '15107548391', NULL, 0, 0);
INSERT INTO `student` VALUES (853, '殷淑华', 140, 11, '0275127548', '2021-02-03', '13404490544', NULL, 0, 0);
INSERT INTO `student` VALUES (854, '郜桂香', 10, 23, '6735501427', '2021-02-03', '13501255909', NULL, 0, 0);
INSERT INTO `student` VALUES (855, '金静', 220, 20, '9566787933', '2021-02-03', '13504653595', NULL, 0, 0);
INSERT INTO `student` VALUES (856, '郭梅', 381, 16, '9815120724', '2021-02-03', '13102339079', NULL, 0, 0);
INSERT INTO `student` VALUES (857, '李超', 368, 23, '9840984463', '2021-02-03', '13106586410', NULL, 0, 0);
INSERT INTO `student` VALUES (858, '王秀云', 192, 15, '3027255628', '2021-02-03', '13904298621', NULL, 0, 0);
INSERT INTO `student` VALUES (859, '孔帆', 221, 22, '9568375832', '2021-02-03', '13305251905', NULL, 0, 0);
INSERT INTO `student` VALUES (860, '黎秀华', 25, 19, '4198213018', '2021-02-03', '13102306007', NULL, 0, 0);
INSERT INTO `student` VALUES (861, '裴丹丹', 189, 20, '5116848958', '2021-02-03', '13504868567', NULL, 0, 0);
INSERT INTO `student` VALUES (862, '蔡莉', 176, 23, '9117580232', '2021-02-03', '13400262392', NULL, 0, 0);
INSERT INTO `student` VALUES (863, '杨玉华', 266, 16, '3526961354', '2021-02-03', '13502791418', NULL, 0, 0);
INSERT INTO `student` VALUES (864, '杨淑珍', 173, 11, '2289098599', '2021-02-03', '15900125048', NULL, 0, 0);
INSERT INTO `student` VALUES (865, '徐玉英', 216, 22, '1008356124', '2021-02-03', '13106476721', NULL, 0, 0);
INSERT INTO `student` VALUES (866, '王建军', 117, 23, '4982641404', '2021-02-03', '15200230794', NULL, 0, 0);
INSERT INTO `student` VALUES (867, '哈建', 77, 18, '5198058272', '2021-02-03', '13400548759', NULL, 0, 0);
INSERT INTO `student` VALUES (868, '冯秀英', 266, 20, '6509704041', '2021-02-03', '15101798222', NULL, 0, 0);
INSERT INTO `student` VALUES (869, '张淑珍', 150, 22, '7311380174', '2021-02-03', '15205642376', NULL, 0, 0);
INSERT INTO `student` VALUES (870, '李杨', 251, 11, '7072591533', '2021-02-03', '13501490954', NULL, 0, 0);
INSERT INTO `student` VALUES (871, '宋娟', 230, 19, '0023616350', '2021-02-03', '13906544252', NULL, 0, 0);
INSERT INTO `student` VALUES (872, '游桂芝', 236, 15, '3639853208', '2021-02-03', '15203826033', NULL, 0, 0);
INSERT INTO `student` VALUES (873, '罗凯', 274, 10, '8645051229', '2021-02-03', '13600352180', NULL, 0, 0);
INSERT INTO `student` VALUES (874, '王丽丽', 395, 15, '6715108354', '2021-02-03', '15102442760', NULL, 0, 0);
INSERT INTO `student` VALUES (875, '赵峰', 289, 10, '3498880839', '2021-02-03', '13707217982', NULL, 0, 0);
INSERT INTO `student` VALUES (876, '柏涛', 292, 23, '1776249605', '2021-02-03', '15002637674', NULL, 0, 0);
INSERT INTO `student` VALUES (877, '余淑兰', 177, 15, '2138124054', '2021-02-03', '15104615151', NULL, 0, 0);
INSERT INTO `student` VALUES (878, '沈建军', 375, 15, '3695278276', '2021-02-03', '13305686442', NULL, 0, 0);
INSERT INTO `student` VALUES (879, '王刚', 355, 16, '9039566629', '2021-02-03', '13204923861', NULL, 0, 0);
INSERT INTO `student` VALUES (880, '李莉', 92, 16, '5226868617', '2021-02-03', '13200017580', NULL, 0, 0);
INSERT INTO `student` VALUES (881, '任倩', 148, 22, '0209646756', '2021-02-03', '15104094828', NULL, 0, 0);
INSERT INTO `student` VALUES (882, '方秀珍', 315, 20, '3993725589', '2021-02-03', '15307585468', NULL, 0, 0);
INSERT INTO `student` VALUES (883, '武静', 154, 16, '9389713054', '2021-02-03', '15600585679', NULL, 0, 0);
INSERT INTO `student` VALUES (884, '张荣', 283, 18, '1609272359', '2021-02-03', '15006962202', NULL, 0, 0);
INSERT INTO `student` VALUES (885, '马雪梅', 344, 23, '8714000979', '2021-02-03', '15503261610', NULL, 0, 0);
INSERT INTO `student` VALUES (886, '陈英', 296, 15, '4898305956', '2021-02-03', '15506914602', NULL, 0, 0);
INSERT INTO `student` VALUES (887, '危勇', 58, 12, '3729943628', '2021-02-03', '13407491000', NULL, 0, 0);
INSERT INTO `student` VALUES (888, '路瑜', 123, 15, '9755891934', '2021-02-03', '15000943659', NULL, 0, 0);
INSERT INTO `student` VALUES (889, '周帅', 377, 20, '0677998492', '2021-02-03', '15708297289', NULL, 0, 0);
INSERT INTO `student` VALUES (890, '孟瑜', 301, 23, '4469179522', '2021-02-03', '15204268259', NULL, 0, 0);
INSERT INTO `student` VALUES (891, '刘楠', 167, 18, '7113240653', '2021-02-03', '15708714434', NULL, 0, 0);
INSERT INTO `student` VALUES (892, '杜帆', 143, 16, '7460946588', '2021-02-03', '13406325231', NULL, 0, 0);
INSERT INTO `student` VALUES (893, '王淑珍', 102, 19, '2192044014', '2021-02-03', '15508004778', NULL, 0, 0);
INSERT INTO `student` VALUES (894, '潘鹏', 331, 19, '0283285319', '2021-02-03', '13105588431', NULL, 0, 0);
INSERT INTO `student` VALUES (895, '范华', 77, 19, '8320427125', '2021-02-03', '15503712406', NULL, 0, 0);
INSERT INTO `student` VALUES (896, '袁玉梅', 73, 20, '6540362841', '2021-02-03', '13000169093', NULL, 0, 0);
INSERT INTO `student` VALUES (897, '孙彬', 260, 19, '2110480241', '2021-02-03', '15100960750', NULL, 0, 0);
INSERT INTO `student` VALUES (898, '陈桂英', 396, 23, '5540303358', '2021-02-03', '13704431101', NULL, 0, 0);
INSERT INTO `student` VALUES (899, '朱梅', 357, 18, '8187550572', '2021-02-03', '13403733788', NULL, 0, 0);
INSERT INTO `student` VALUES (900, '郭雪梅', 364, 23, '1074990680', '2021-02-03', '15704573659', NULL, 0, 0);
INSERT INTO `student` VALUES (901, '许峰', 99, 15, '3543595092', '2021-02-03', '15300304152', NULL, 0, 0);
INSERT INTO `student` VALUES (902, '张建军', 279, 10, '5981051243', '2021-02-03', '15501339088', NULL, 0, 0);
INSERT INTO `student` VALUES (903, '项玉', 209, 18, '1329388639', '2021-02-03', '15701187899', NULL, 0, 0);
INSERT INTO `student` VALUES (904, '凌淑华', 186, 12, '0153825435', '2021-02-03', '13107466437', NULL, 0, 0);
INSERT INTO `student` VALUES (905, '蒋洁', 111, 16, '9967505071', '2021-02-03', '15506573606', NULL, 0, 0);
INSERT INTO `student` VALUES (906, '张帆', 176, 10, '6367198073', '2021-02-03', '13101795178', NULL, 0, 0);
INSERT INTO `student` VALUES (907, '田淑兰', 147, 15, '4302768144', '2021-02-03', '13205655450', NULL, 0, 0);
INSERT INTO `student` VALUES (908, '卢彬', 23, 16, '4847259153', '2021-02-03', '15705197462', NULL, 0, 0);
INSERT INTO `student` VALUES (909, '马林', 126, 22, '0460750127', '2021-02-03', '13802695475', NULL, 0, 0);
INSERT INTO `student` VALUES (910, '祖丹丹', 170, 11, '8510448992', '2021-02-03', '15304705691', NULL, 0, 0);
INSERT INTO `student` VALUES (911, '唐海燕', 199, 19, '3812163468', '2021-02-03', '13504053786', NULL, 0, 0);
INSERT INTO `student` VALUES (912, '邓欢', 300, 20, '0986391686', '2021-02-03', '15600828181', NULL, 0, 0);
INSERT INTO `student` VALUES (913, '萧兰英', 385, 20, '0250385904', '2021-02-03', '15708268936', NULL, 0, 0);
INSERT INTO `student` VALUES (914, '郭阳', 159, 22, '7022255788', '2021-02-03', '13201240756', NULL, 0, 0);
INSERT INTO `student` VALUES (915, '白东', 228, 23, '9894433020', '2021-02-03', '15004266081', NULL, 0, 0);
INSERT INTO `student` VALUES (916, '薛丽华', 23, 23, '2589606461', '2021-02-03', '15707754747', NULL, 0, 0);
INSERT INTO `student` VALUES (917, '张敏', 311, 19, '2352618528', '2021-02-03', '13806480665', NULL, 0, 0);
INSERT INTO `student` VALUES (918, '黄红霞', 109, 10, '9958135237', '2021-02-03', '15004952381', NULL, 0, 0);
INSERT INTO `student` VALUES (919, '牟芳', 45, 22, '4792227086', '2021-02-03', '13503608464', NULL, 0, 0);
INSERT INTO `student` VALUES (920, '裴彬', 227, 22, '3543531464', '2021-02-03', '13006352849', NULL, 0, 0);
INSERT INTO `student` VALUES (921, '刘秀华', 334, 11, '2416626688', '2021-02-03', '13906341659', NULL, 0, 0);
INSERT INTO `student` VALUES (922, '姜玉华', 161, 23, '7709088348', '2021-02-03', '13301298244', NULL, 0, 0);
INSERT INTO `student` VALUES (923, '王刚', 76, 23, '0947048090', '2021-02-03', '13202867929', NULL, 0, 0);
INSERT INTO `student` VALUES (924, '曾超', 63, 10, '1122749212', '2021-02-03', '15901194239', NULL, 0, 0);
INSERT INTO `student` VALUES (925, '李超', 392, 22, '9337272802', '2021-02-03', '13002155936', NULL, 0, 0);
INSERT INTO `student` VALUES (926, '陶彬', 290, 22, '0856701201', '2021-02-03', '13305075388', NULL, 0, 0);
INSERT INTO `student` VALUES (927, '孔建军', 233, 19, '6319245673', '2021-02-03', '15302648101', NULL, 0, 0);
INSERT INTO `student` VALUES (928, '魏春梅', 111, 22, '0015924094', '2021-02-03', '13605686913', NULL, 0, 0);
INSERT INTO `student` VALUES (929, '傅秀华', 343, 16, '5053648886', '2021-02-03', '15203670490', NULL, 0, 0);
INSERT INTO `student` VALUES (930, '李秀珍', 161, 19, '0122686236', '2021-02-03', '15006344255', NULL, 0, 0);
INSERT INTO `student` VALUES (931, '卢利', 24, 18, '4557467680', '2021-02-03', '13704112921', NULL, 0, 0);
INSERT INTO `student` VALUES (932, '王阳', 338, 23, '5912478297', '2021-02-03', '13207493890', NULL, 0, 0);
INSERT INTO `student` VALUES (933, '马晶', 266, 22, '1341023440', '2021-02-03', '15903441851', NULL, 0, 0);
INSERT INTO `student` VALUES (934, '刘金凤', 325, 11, '6210075011', '2021-02-03', '15100086061', NULL, 0, 0);
INSERT INTO `student` VALUES (935, '王丹', 80, 16, '4235709402', '2021-02-03', '15306993223', NULL, 0, 0);
INSERT INTO `student` VALUES (936, '程小红', 357, 18, '9420361720', '2021-02-03', '15801854463', NULL, 0, 0);
INSERT INTO `student` VALUES (937, '孙淑华', 348, 12, '4411035461', '2021-02-03', '13202790552', NULL, 0, 0);
INSERT INTO `student` VALUES (938, '韦丹丹', 173, 16, '4269027248', '2021-02-03', '13006680539', NULL, 0, 0);
INSERT INTO `student` VALUES (939, '祝鹏', 263, 22, '0450830927', '2021-02-03', '15804254589', NULL, 0, 0);
INSERT INTO `student` VALUES (940, '吴建军', 80, 18, '1711379801', '2021-02-03', '13102484014', NULL, 0, 0);
INSERT INTO `student` VALUES (941, '王玉', 104, 23, '5933646200', '2021-02-03', '15208221325', NULL, 0, 0);
INSERT INTO `student` VALUES (942, '甘超', 330, 22, '0303171035', '2021-02-03', '13602312554', NULL, 0, 0);
INSERT INTO `student` VALUES (943, '李龙', 235, 12, '5834669664', '2021-02-03', '13201266630', NULL, 0, 0);
INSERT INTO `student` VALUES (944, '宋丽华', 199, 22, '2362116437', '2021-02-03', '13705455833', NULL, 0, 0);
INSERT INTO `student` VALUES (945, '张桂芝', 255, 10, '2388192135', '2021-02-03', '15107927278', NULL, 0, 0);
INSERT INTO `student` VALUES (946, '单宇', 90, 11, '2914724019', '2021-02-03', '13104005885', NULL, 0, 0);
INSERT INTO `student` VALUES (947, '钟阳', 281, 12, '4235649323', '2021-02-03', '15608754815', NULL, 0, 0);
INSERT INTO `student` VALUES (948, '柴荣', 125, 15, '9178400728', '2021-02-03', '15004263956', NULL, 0, 0);
INSERT INTO `student` VALUES (949, '丁涛', 143, 18, '1686556156', '2021-02-03', '15305661073', NULL, 0, 0);
INSERT INTO `student` VALUES (950, '陈建', 140, 23, '2854321663', '2021-02-03', '15207952378', NULL, 0, 0);
INSERT INTO `student` VALUES (951, '彭桂花', 371, 22, '3510971242', '2021-02-03', '13608632599', NULL, 0, 0);
INSERT INTO `student` VALUES (952, '张淑珍', 143, 19, '6532698955', '2021-02-03', '13400210841', NULL, 0, 0);
INSERT INTO `student` VALUES (953, '刘丽娟', 292, 11, '2248032298', '2021-02-03', '13108854436', NULL, 0, 0);
INSERT INTO `student` VALUES (954, '谭桂香', 75, 16, '0192414672', '2021-02-03', '13101976660', NULL, 0, 0);
INSERT INTO `student` VALUES (955, '钱玉兰', 75, 12, '2976283580', '2021-02-03', '13301238126', NULL, 0, 0);
INSERT INTO `student` VALUES (956, '徐金凤', 62, 12, '7140486747', '2021-02-03', '15900871262', NULL, 0, 0);
INSERT INTO `student` VALUES (957, '李红霞', 296, 12, '0786919092', '2021-02-03', '13003872530', NULL, 0, 0);
INSERT INTO `student` VALUES (958, '韩桂香', 237, 10, '4666529265', '2021-02-03', '13803681174', NULL, 0, 0);
INSERT INTO `student` VALUES (959, '谢鑫', 80, 11, '0589569922', '2021-02-03', '13006550775', NULL, 0, 0);
INSERT INTO `student` VALUES (960, '王浩', 313, 12, '5416873458', '2021-02-03', '13201597291', NULL, 0, 0);
INSERT INTO `student` VALUES (961, '牛欢', 120, 18, '8513390824', '2021-02-03', '13601672000', NULL, 0, 0);
INSERT INTO `student` VALUES (962, '黄旭', 306, 23, '3991336606', '2021-02-03', '13906366362', NULL, 0, 0);
INSERT INTO `student` VALUES (963, '葛龙', 77, 10, '6422138163', '2021-02-03', '13100448342', NULL, 0, 0);
INSERT INTO `student` VALUES (964, '张刚', 148, 22, '8538528463', '2021-02-03', '13305764369', NULL, 0, 0);
INSERT INTO `student` VALUES (965, '倪秀芳', 12, 11, '5318530061', '2021-02-03', '15308765635', NULL, 0, 0);
INSERT INTO `student` VALUES (966, '许宇', 100, 10, '4657098737', '2021-02-03', '15701330375', NULL, 0, 0);
INSERT INTO `student` VALUES (967, '徐飞', 346, 16, '6040554514', '2021-02-03', '13406641324', NULL, 0, 0);
INSERT INTO `student` VALUES (968, '苗燕', 312, 16, '1519945356', '2021-02-03', '15000411011', NULL, 0, 0);
INSERT INTO `student` VALUES (969, '刘玲', 388, 16, '2881446286', '2021-02-03', '15901480404', NULL, 0, 0);
INSERT INTO `student` VALUES (970, '郭秀英', 328, 11, '9951362213', '2021-02-03', '13807040129', NULL, 0, 0);
INSERT INTO `student` VALUES (971, '郑建', 237, 19, '8423564224', '2021-02-03', '15602069008', NULL, 0, 0);
INSERT INTO `student` VALUES (972, '李丽娟', 1, 19, '2274591517', '2021-02-03', '15600452594', NULL, 0, 0);
INSERT INTO `student` VALUES (973, '王峰', 78, 18, '7483650007', '2021-02-03', '13907841440', NULL, 0, 0);
INSERT INTO `student` VALUES (974, '李欢', 131, 20, '1714763296', '2021-02-03', '13905794368', NULL, 0, 0);
INSERT INTO `student` VALUES (975, '刘丹丹', 255, 18, '0532831865', '2021-02-03', '13304844000', NULL, 0, 0);
INSERT INTO `student` VALUES (976, '王金凤', 241, 22, '2022623157', '2021-02-03', '13902155194', NULL, 0, 0);
INSERT INTO `student` VALUES (977, '袁平', 350, 19, '7123161077', '2021-02-03', '13200770280', NULL, 0, 0);
INSERT INTO `student` VALUES (978, '王阳', 203, 22, '0506236796', '2021-02-03', '13006695190', NULL, 0, 0);
INSERT INTO `student` VALUES (979, '李欢', 63, 10, '4628309732', '2021-02-03', '15501968354', NULL, 0, 0);
INSERT INTO `student` VALUES (980, '宗莉', 6, 10, '9506151772', '2021-02-03', '15101781687', NULL, 0, 0);
INSERT INTO `student` VALUES (981, '喻鑫', 147, 11, '2111755064', '2021-02-03', '13602350944', NULL, 0, 0);
INSERT INTO `student` VALUES (982, '王建华', 69, 16, '3753533683', '2021-02-03', '15300236409', NULL, 0, 0);
INSERT INTO `student` VALUES (983, '赵超', 184, 20, '9525651904', '2021-02-03', '15504922965', NULL, 0, 0);
INSERT INTO `student` VALUES (984, '王静', 77, 20, '2553551185', '2021-02-03', '15003998116', NULL, 0, 0);
INSERT INTO `student` VALUES (985, '刘淑华', 235, 12, '1263504806', '2021-02-03', '15705881757', NULL, 0, 0);
INSERT INTO `student` VALUES (986, '王阳', 107, 18, '1260249806', '2021-02-03', '15307235517', NULL, 0, 0);
INSERT INTO `student` VALUES (987, '李浩', 162, 20, '9316881094', '2021-02-03', '13207262197', NULL, 0, 0);
INSERT INTO `student` VALUES (988, '陈静', 280, 16, '0258633548', '2021-02-03', '13003903900', NULL, 0, 0);
INSERT INTO `student` VALUES (989, '龚兰英', 69, 10, '8027983073', '2021-02-03', '13303975384', NULL, 0, 0);
INSERT INTO `student` VALUES (990, '刘莉', 126, 18, '9061463234', '2021-02-03', '15705996035', NULL, 0, 0);
INSERT INTO `student` VALUES (991, '王淑兰', 166, 19, '9280071164', '2021-02-03', '15307458418', NULL, 0, 0);
INSERT INTO `student` VALUES (992, '张柳', 286, 22, '1301036094', '2021-02-03', '13503974602', NULL, 0, 0);
INSERT INTO `student` VALUES (993, '邢欣', 175, 11, '8700157092', '2021-02-03', '13405583955', NULL, 0, 0);
INSERT INTO `student` VALUES (994, '茹丽', 66, 20, '4538128983', '2021-02-03', '15903322499', NULL, 0, 0);
INSERT INTO `student` VALUES (995, '刘浩', 146, 16, '4715656663', '2021-02-03', '15302677115', NULL, 0, 0);
INSERT INTO `student` VALUES (996, '杨云', 93, 11, '1822646692', '2021-02-03', '13608886981', NULL, 0, 0);
INSERT INTO `student` VALUES (997, '刘建', 238, 20, '8835818719', '2021-02-03', '15802003947', NULL, 0, 0);
INSERT INTO `student` VALUES (998, '杨淑珍', 250, 15, '1018248807', '2021-02-03', '15901778894', NULL, 0, 0);
INSERT INTO `student` VALUES (999, '单宇', 111, 22, '9199332925', '2021-02-03', '13508393933', NULL, 0, 0);
INSERT INTO `student` VALUES (1000, '李桂荣', 73, 20, '4936947677', '2021-02-03', '13600603335', NULL, 0, 0);
INSERT INTO `student` VALUES (1001, '章桂兰', 239, 16, '3391547223', '2021-02-03', '15007241740', NULL, 0, 0);
INSERT INTO `student` VALUES (1002, '谭玉华', 164, 18, '5471803093', '2021-02-03', '13001708403', NULL, 0, 0);
INSERT INTO `student` VALUES (1003, '李涛', 156, 10, '2273656865', '2021-02-03', '15700581124', NULL, 0, 0);
INSERT INTO `student` VALUES (1004, '董金凤', 390, 20, '3242250813', '2021-02-03', '15000798181', NULL, 0, 0);
INSERT INTO `student` VALUES (1005, '李旭', 214, 22, '9856830008', '2021-02-03', '15801249037', NULL, 0, 0);
INSERT INTO `student` VALUES (1006, '许淑兰', 294, 10, '0398519820', '2021-02-03', '13007075875', NULL, 0, 0);
INSERT INTO `student` VALUES (1007, '余龙', 226, 12, '1435371555', '2021-02-03', '13904792593', NULL, 0, 0);
INSERT INTO `student` VALUES (1008, '刘娜', 105, 20, '5581032216', '2021-02-03', '15504740170', NULL, 0, 0);
INSERT INTO `student` VALUES (1009, '罗雪', 355, 22, '5685770208', '2021-02-03', '13805361180', NULL, 0, 0);
INSERT INTO `student` VALUES (1010, '张彬', 41, 16, '5348989557', '2021-02-03', '13806620252', NULL, 0, 0);
INSERT INTO `student` VALUES (1011, '魏林', 392, 18, '1651434558', '2021-02-03', '13906194529', NULL, 0, 0);
INSERT INTO `student` VALUES (1012, '夏林', 332, 10, '0460196549', '2021-02-03', '15307323576', NULL, 0, 0);
INSERT INTO `student` VALUES (1013, '董玉华', 3, 19, '5033006324', '2021-02-03', '13004396679', NULL, 0, 0);
INSERT INTO `student` VALUES (1014, '冯荣', 94, 19, '6234332628', '2021-02-03', '13707080004', NULL, 0, 0);
INSERT INTO `student` VALUES (1015, '李明', 316, 19, '2577618303', '2021-02-03', '15608750434', NULL, 0, 0);
INSERT INTO `student` VALUES (1016, '杨建华', 212, 11, '4273062618', '2021-02-03', '13400303138', NULL, 0, 0);
INSERT INTO `student` VALUES (1017, '高红梅', 247, 19, '2952519045', '2021-02-03', '13404702521', NULL, 0, 0);
INSERT INTO `student` VALUES (1018, '尹凯', 241, 15, '8381058942', '2021-02-03', '15607054782', NULL, 0, 0);
INSERT INTO `student` VALUES (1019, '张红霞', 344, 23, '7921388681', '2021-02-03', '15503908405', NULL, 0, 0);
INSERT INTO `student` VALUES (1020, '王英', 115, 10, '6677299092', '2021-02-03', '13908096712', NULL, 0, 0);
INSERT INTO `student` VALUES (1021, '王健', 384, 10, '3168103274', '2021-02-03', '13803773240', NULL, 0, 0);
INSERT INTO `student` VALUES (1022, '卢凤英', 163, 20, '1424287112', '2021-02-03', '15907766500', NULL, 0, 0);
INSERT INTO `student` VALUES (1023, '翟丽娟', 118, 16, '9105084375', '2021-02-03', '13406915597', NULL, 0, 0);
INSERT INTO `student` VALUES (1024, '金慧', 115, 10, '3745297337', '2021-02-03', '13300954442', NULL, 0, 0);
INSERT INTO `student` VALUES (1025, '李琳', 163, 16, '2318331186', '2021-02-03', '13800197142', NULL, 0, 0);
INSERT INTO `student` VALUES (1026, '章桂兰', 185, 10, '4549065870', '2021-02-03', '15301342760', NULL, 0, 0);
INSERT INTO `student` VALUES (1027, '黄秀荣', 237, 22, '4342376145', '2021-02-03', '15707784547', NULL, 0, 0);
INSERT INTO `student` VALUES (1028, '何龙', 269, 16, '4805484177', '2021-02-03', '15700344496', NULL, 0, 0);
INSERT INTO `student` VALUES (1029, '倪英', 201, 20, '4618184395', '2021-02-03', '13208050166', NULL, 0, 0);
INSERT INTO `student` VALUES (1030, '林建华', 303, 18, '9806956991', '2021-02-03', '13100816170', NULL, 0, 0);
INSERT INTO `student` VALUES (1031, '许刚', 311, 16, '8594826162', '2021-02-03', '13103069071', NULL, 0, 0);
INSERT INTO `student` VALUES (1032, '刘刚', 106, 19, '0036670536', '2021-02-03', '13005215019', NULL, 0, 0);
INSERT INTO `student` VALUES (1033, '费瑜', 139, 23, '9186386709', '2021-02-03', '15307820196', NULL, 0, 0);
INSERT INTO `student` VALUES (1034, '罗洋', 123, 19, '5292218408', '2021-02-03', '13005882529', NULL, 0, 0);
INSERT INTO `student` VALUES (1035, '王云', 23, 18, '0411543863', '2021-02-03', '15903145670', NULL, 0, 0);
INSERT INTO `student` VALUES (1036, '陈刚', 190, 18, '3433237855', '2021-02-03', '13100588913', NULL, 0, 0);
INSERT INTO `student` VALUES (1037, '韦俊', 75, 12, '8670749051', '2021-02-03', '13005652843', NULL, 0, 0);
INSERT INTO `student` VALUES (1038, '王燕', 270, 20, '7318475772', '2021-02-03', '13807138066', NULL, 0, 0);
INSERT INTO `student` VALUES (1039, '段桂珍', 117, 23, '9166913110', '2021-02-03', '15602344722', NULL, 0, 0);
INSERT INTO `student` VALUES (1040, '柳凤英', 98, 20, '7788424972', '2021-02-03', '13306876998', NULL, 0, 0);
INSERT INTO `student` VALUES (1041, '周云', 67, 10, '5946618756', '2021-02-03', '13308103589', NULL, 0, 0);
INSERT INTO `student` VALUES (1042, '牟芳', 142, 10, '3059703072', '2021-02-03', '15308256981', NULL, 0, 0);
INSERT INTO `student` VALUES (1043, '李晶', 213, 16, '4531454429', '2021-02-03', '15706594393', NULL, 0, 0);
INSERT INTO `student` VALUES (1044, '李璐', 68, 11, '6149392706', '2021-02-03', '15107505687', NULL, 0, 0);
INSERT INTO `student` VALUES (1045, '王燕', 84, 23, '4941340969', '2021-02-03', '13403443266', NULL, 0, 0);
INSERT INTO `student` VALUES (1046, '黄宇', 375, 11, '1625465470', '2021-02-03', '15602187508', NULL, 0, 0);
INSERT INTO `student` VALUES (1047, '张红', 105, 16, '2761589064', '2021-02-03', '13000545116', NULL, 0, 0);
INSERT INTO `student` VALUES (1048, '朱平', 37, 19, '6132478396', '2021-02-03', '13005297522', NULL, 0, 0);
INSERT INTO `student` VALUES (1049, '奚桂兰', 181, 18, '7050805555', '2021-02-03', '15108400808', NULL, 0, 0);
INSERT INTO `student` VALUES (1050, '杨秀梅', 279, 20, '3709842236', '2021-02-03', '13502186287', NULL, 0, 0);
INSERT INTO `student` VALUES (1051, '康军', 145, 16, '0016213232', '2021-02-03', '15700335251', NULL, 0, 0);
INSERT INTO `student` VALUES (1052, '周桂香', 222, 11, '8860315683', '2021-02-03', '15604907986', NULL, 0, 0);
INSERT INTO `student` VALUES (1053, '郭想', 262, 19, '3480365363', '2021-02-03', '15603844207', NULL, 0, 0);
INSERT INTO `student` VALUES (1054, '孙玉', 239, 12, '2374487504', '2021-02-03', '15105802720', NULL, 0, 0);
INSERT INTO `student` VALUES (1055, '叶鑫', 304, 22, '7416383728', '2021-02-03', '15706156690', NULL, 0, 0);
INSERT INTO `student` VALUES (1056, '刘冬梅', 163, 22, '5218927680', '2021-02-03', '15006437285', NULL, 0, 0);
INSERT INTO `student` VALUES (1057, '赖秀梅', 266, 23, '0914660584', '2021-02-03', '15806834499', NULL, 0, 0);
INSERT INTO `student` VALUES (1058, '刘文', 360, 10, '0269225613', '2021-02-03', '15005548615', NULL, 0, 0);
INSERT INTO `student` VALUES (1059, '黄晨', 52, 23, '5303229347', '2021-02-03', '13804150096', NULL, 0, 0);
INSERT INTO `student` VALUES (1060, '李建', 85, 11, '6492241020', '2021-02-03', '13207617617', NULL, 0, 0);
INSERT INTO `student` VALUES (1061, '何敏', 284, 15, '2010448320', '2021-02-03', '15905292776', NULL, 0, 0);
INSERT INTO `student` VALUES (1062, '张玉梅', 175, 15, '8689117492', '2021-02-03', '13003254397', NULL, 0, 0);
INSERT INTO `student` VALUES (1063, '赵飞', 211, 16, '7320273258', '2021-02-03', '13404585620', NULL, 0, 0);
INSERT INTO `student` VALUES (1064, '严霞', 304, 22, '4170733511', '2021-02-03', '15307372039', NULL, 0, 0);
INSERT INTO `student` VALUES (1065, '苗彬', 49, 10, '2483198385', '2021-02-03', '13900908531', NULL, 0, 0);
INSERT INTO `student` VALUES (1066, '李成', 283, 16, '7009757797', '2021-02-03', '15000733272', NULL, 0, 0);
INSERT INTO `student` VALUES (1067, '姚鹏', 208, 16, '0010776805', '2021-02-03', '13105353680', NULL, 0, 0);
INSERT INTO `student` VALUES (1068, '樊佳', 319, 12, '0496439859', '2021-02-03', '15301556455', NULL, 0, 0);
INSERT INTO `student` VALUES (1069, '张丽丽', 150, 18, '8478593495', '2021-02-03', '13804635655', NULL, 0, 0);
INSERT INTO `student` VALUES (1070, '吴雷', 364, 15, '5903034147', '2021-02-03', '13200135418', NULL, 0, 0);
INSERT INTO `student` VALUES (1071, '杨云', 379, 15, '3274835822', '2021-02-03', '13503234412', NULL, 0, 0);
INSERT INTO `student` VALUES (1072, '景云', 256, 12, '9301236366', '2021-02-03', '15903632152', NULL, 0, 0);
INSERT INTO `student` VALUES (1073, '张燕', 217, 18, '3766206561', '2021-02-03', '15806263760', NULL, 0, 0);
INSERT INTO `student` VALUES (1074, '邹帅', 329, 16, '1229886215', '2021-02-03', '15201890821', NULL, 0, 0);
INSERT INTO `student` VALUES (1075, '丁坤', 376, 16, '6039730153', '2021-02-03', '13904973666', NULL, 0, 0);
INSERT INTO `student` VALUES (1076, '路瑜', 263, 15, '8329407187', '2021-02-03', '15302461993', NULL, 0, 0);
INSERT INTO `student` VALUES (1077, '王晶', 229, 23, '8001863899', '2021-02-03', '15603836589', NULL, 0, 0);
INSERT INTO `student` VALUES (1078, '王峰', 28, 23, '2850249382', '2021-02-03', '13405630531', NULL, 0, 0);
INSERT INTO `student` VALUES (1079, '王东', 20, 18, '5589434023', '2021-02-03', '15201901847', NULL, 0, 0);
INSERT INTO `student` VALUES (1080, '武霞', 346, 19, '3260395505', '2021-02-03', '15907916495', NULL, 0, 0);
INSERT INTO `student` VALUES (1081, '朱丹', 194, 16, '6878641499', '2021-02-03', '13905440924', NULL, 0, 0);
INSERT INTO `student` VALUES (1082, '兰秀芳', 332, 10, '4440464807', '2021-02-03', '13307687688', NULL, 0, 0);
INSERT INTO `student` VALUES (1083, '陆峰', 38, 22, '2968314602', '2021-02-03', '13604698837', NULL, 0, 0);
INSERT INTO `student` VALUES (1084, '姜帅', 226, 20, '2399219660', '2021-02-03', '13300662862', NULL, 0, 0);
INSERT INTO `student` VALUES (1085, '黄丽娟', 8, 18, '6584772694', '2021-02-03', '13000494145', NULL, 0, 0);
INSERT INTO `student` VALUES (1086, '李瑞', 182, 20, '6123693943', '2021-02-03', '13703695916', NULL, 0, 0);
INSERT INTO `student` VALUES (1087, '周玉梅', 368, 18, '9012800229', '2021-02-03', '13305502656', NULL, 0, 0);
INSERT INTO `student` VALUES (1088, '李萍', 249, 19, '5326221308', '2021-02-03', '13903760164', NULL, 0, 0);
INSERT INTO `student` VALUES (1089, '靳华', 358, 10, '6191079605', '2021-02-03', '15208857114', NULL, 0, 0);
INSERT INTO `student` VALUES (1090, '杨勇', 160, 16, '2149691113', '2021-02-03', '15106452803', NULL, 0, 0);
INSERT INTO `student` VALUES (1091, '孙兰英', 189, 12, '8455263737', '2021-02-03', '13605931576', NULL, 0, 0);
INSERT INTO `student` VALUES (1092, '王磊', 145, 16, '7098427570', '2021-02-03', '13303711847', NULL, 0, 0);
INSERT INTO `student` VALUES (1093, '祁桂花', 214, 22, '4331810969', '2021-02-03', '13307646228', NULL, 0, 0);
INSERT INTO `student` VALUES (1094, '陶海燕', 250, 10, '5363496088', '2021-02-03', '13506971168', NULL, 0, 0);
INSERT INTO `student` VALUES (1095, '王成', 25, 23, '8611824208', '2021-02-03', '13400880890', NULL, 0, 0);
INSERT INTO `student` VALUES (1096, '刘宁', 124, 20, '9181098162', '2021-02-03', '15904707691', NULL, 0, 0);
INSERT INTO `student` VALUES (1097, '王桂荣', 342, 23, '9468763822', '2021-02-03', '13904905978', NULL, 0, 0);
INSERT INTO `student` VALUES (1098, '张秀云', 151, 16, '8786069082', '2021-02-03', '13300474425', NULL, 0, 0);
INSERT INTO `student` VALUES (1099, '陈春梅', 128, 12, '5795867155', '2021-02-03', '13904116994', NULL, 0, 0);
INSERT INTO `student` VALUES (1100, '傅桂兰', 167, 19, '0608378750', '2021-02-03', '15506212270', NULL, 0, 0);
INSERT INTO `student` VALUES (1101, '刘佳', 133, 16, '6604982535', '2021-02-03', '13101447192', NULL, 0, 0);
INSERT INTO `student` VALUES (1102, '牛楠', 269, 22, '9316967650', '2021-02-03', '15002670644', NULL, 0, 0);
INSERT INTO `student` VALUES (1103, '戴帅', 167, 15, '0108917629', '2021-02-03', '15705266974', NULL, 0, 0);
INSERT INTO `student` VALUES (1104, '陈刚', 150, 23, '2474236715', '2021-02-03', '15005863786', NULL, 0, 0);
INSERT INTO `student` VALUES (1105, '陈萍', 94, 16, '5594761635', '2021-02-03', '13804818125', NULL, 0, 0);
INSERT INTO `student` VALUES (1106, '汪玉英', 230, 15, '7062300410', '2021-02-03', '15601487433', NULL, 0, 0);
INSERT INTO `student` VALUES (1107, '冯秀荣', 88, 16, '5753306048', '2021-02-03', '13100318135', NULL, 0, 0);
INSERT INTO `student` VALUES (1108, '莫晨', 390, 12, '3880485248', '2021-02-03', '15602201346', NULL, 0, 0);
INSERT INTO `student` VALUES (1109, '杨红', 186, 19, '0058222944', '2021-02-03', '13405138060', NULL, 0, 0);
INSERT INTO `student` VALUES (1110, '汪红霞', 86, 20, '3275251116', '2021-02-03', '15001894165', NULL, 0, 0);
INSERT INTO `student` VALUES (1111, '彭帆', 50, 23, '3414686403', '2021-02-03', '15103803912', NULL, 0, 0);
INSERT INTO `student` VALUES (1112, '郭玉华', 210, 19, '5514994170', '2021-02-03', '15007515675', NULL, 0, 0);
INSERT INTO `student` VALUES (1113, '刘柳', 312, 20, '3145101345', '2021-02-03', '15700176782', NULL, 0, 0);
INSERT INTO `student` VALUES (1114, '赵玉', 30, 12, '3195468907', '2021-02-03', '13906957396', NULL, 0, 0);
INSERT INTO `student` VALUES (1115, '李柳', 272, 16, '3833219790', '2021-02-03', '13604091587', NULL, 0, 0);
INSERT INTO `student` VALUES (1116, '张桂荣', 153, 23, '7575429018', '2021-02-03', '13100868365', NULL, 0, 0);
INSERT INTO `student` VALUES (1117, '徐英', 93, 15, '7980527966', '2021-02-03', '13907500947', NULL, 0, 0);
INSERT INTO `student` VALUES (1118, '黄建国', 286, 23, '5853013649', '2021-02-03', '13702146656', NULL, 0, 0);
INSERT INTO `student` VALUES (1119, '张华', 390, 20, '6376596511', '2021-02-03', '13601276734', NULL, 0, 0);
INSERT INTO `student` VALUES (1120, '马萍', 244, 11, '7610837242', '2021-02-03', '15608883135', NULL, 0, 0);
INSERT INTO `student` VALUES (1121, '刘超', 376, 12, '6444075141', '2021-02-03', '13802971720', NULL, 0, 0);
INSERT INTO `student` VALUES (1122, '舒峰', 189, 19, '8332579096', '2021-02-03', '13300687977', NULL, 0, 0);
INSERT INTO `student` VALUES (1123, '曾华', 126, 23, '3015001027', '2021-02-03', '13208736426', NULL, 0, 0);
INSERT INTO `student` VALUES (1124, '庞婷婷', 244, 11, '9359877909', '2021-02-03', '13805545949', NULL, 0, 0);
INSERT INTO `student` VALUES (1125, '施玲', 88, 10, '3143670321', '2021-02-03', '15203678222', NULL, 0, 0);
INSERT INTO `student` VALUES (1126, '苟明', 100, 22, '8883542697', '2021-02-03', '15305056207', NULL, 0, 0);
INSERT INTO `student` VALUES (1127, '孟瑜', 321, 18, '5990983198', '2021-02-03', '13108581014', NULL, 0, 0);
INSERT INTO `student` VALUES (1128, '庞雪梅', 15, 19, '9367975240', '2021-02-03', '13300743603', NULL, 0, 0);
INSERT INTO `student` VALUES (1129, '蒋萍', 229, 11, '1251663394', '2021-02-03', '13400712063', NULL, 0, 0);
INSERT INTO `student` VALUES (1130, '陈丽丽', 167, 22, '2156897206', '2021-02-03', '13808466780', NULL, 0, 0);
INSERT INTO `student` VALUES (1131, '李杰', 374, 10, '0381936959', '2021-02-03', '13905554009', NULL, 0, 0);
INSERT INTO `student` VALUES (1132, '彭桂香', 285, 18, '7461669309', '2021-02-03', '13406515415', NULL, 0, 0);
INSERT INTO `student` VALUES (1133, '高秀云', 61, 15, '2965686344', '2021-02-03', '15106192673', NULL, 0, 0);
INSERT INTO `student` VALUES (1134, '罗博', 134, 18, '6606519306', '2021-02-03', '15606985714', NULL, 0, 0);
INSERT INTO `student` VALUES (1135, '王淑珍', 82, 12, '5211632668', '2021-02-03', '13106637582', NULL, 0, 0);
INSERT INTO `student` VALUES (1136, '杨亮', 237, 12, '6794381791', '2021-02-03', '15604802175', NULL, 0, 0);
INSERT INTO `student` VALUES (1137, '萧颖', 238, 12, '5902679775', '2021-02-03', '15808735175', NULL, 0, 0);
INSERT INTO `student` VALUES (1138, '徐丹丹', 164, 16, '8512517418', '2021-02-03', '15808831378', NULL, 0, 0);
INSERT INTO `student` VALUES (1139, '韩桂珍', 165, 12, '5355991251', '2021-02-03', '13105868981', NULL, 0, 0);
INSERT INTO `student` VALUES (1140, '杨莹', 90, 23, '9190796983', '2021-02-03', '13500851430', NULL, 0, 0);
INSERT INTO `student` VALUES (1141, '张慧', 68, 16, '2579036358', '2021-02-03', '13402831125', NULL, 0, 0);
INSERT INTO `student` VALUES (1142, '周欢', 210, 11, '7327154932', '2021-02-03', '13707864804', NULL, 0, 0);
INSERT INTO `student` VALUES (1143, '李宁', 126, 10, '0368197031', '2021-02-03', '13200094181', NULL, 0, 0);
INSERT INTO `student` VALUES (1144, '黄瑞', 58, 10, '9600660050', '2021-02-03', '13201455463', NULL, 0, 0);
INSERT INTO `student` VALUES (1145, '吕红霞', 93, 23, '1653708580', '2021-02-03', '13707483550', NULL, 0, 0);
INSERT INTO `student` VALUES (1146, '毛桂珍', 186, 10, '7514338427', '2021-02-03', '15904751003', NULL, 0, 0);
INSERT INTO `student` VALUES (1147, '李建国', 8, 12, '5203742238', '2021-02-03', '13703766829', NULL, 0, 0);
INSERT INTO `student` VALUES (1148, '李霞', 110, 20, '5366782715', '2021-02-03', '15600714932', NULL, 0, 0);
INSERT INTO `student` VALUES (1149, '苏玉兰', 127, 22, '7501831577', '2021-02-03', '13005175951', NULL, 0, 0);
INSERT INTO `student` VALUES (1150, '韦娟', 218, 18, '0496070066', '2021-02-03', '13502431722', NULL, 0, 0);
INSERT INTO `student` VALUES (1151, '翁博', 60, 18, '2227949170', '2021-02-03', '15206530326', NULL, 0, 0);
INSERT INTO `student` VALUES (1152, '朱畅', 8, 15, '5922467066', '2021-02-03', '13200726567', NULL, 0, 0);
INSERT INTO `student` VALUES (1153, '杨秀芳', 205, 11, '3230112058', '2021-02-03', '13102327610', NULL, 0, 0);
INSERT INTO `student` VALUES (1154, '张丽', 78, 15, '3742120907', '2021-02-03', '15201895633', NULL, 0, 0);
INSERT INTO `student` VALUES (1155, '王佳', 193, 20, '6385158443', '2021-02-03', '13703750974', NULL, 0, 0);
INSERT INTO `student` VALUES (1156, '吴志强', 107, 23, '5637031598', '2021-02-03', '13008317694', NULL, 0, 0);
INSERT INTO `student` VALUES (1157, '杨淑英', 26, 19, '0936466514', '2021-02-03', '13802778315', NULL, 0, 0);
INSERT INTO `student` VALUES (1158, '任芳', 268, 18, '6946910765', '2021-02-03', '13705481333', NULL, 0, 0);
INSERT INTO `student` VALUES (1159, '程兰英', 71, 12, '0543056110', '2021-02-03', '13604686459', NULL, 0, 0);
INSERT INTO `student` VALUES (1160, '陈刚', 70, 16, '9992999452', '2021-02-03', '15708322784', NULL, 0, 0);
INSERT INTO `student` VALUES (1161, '孙帆', 222, 22, '1350738660', '2021-02-03', '15504385027', NULL, 0, 0);
INSERT INTO `student` VALUES (1162, '陈龙', 287, 10, '7726775557', '2021-02-03', '13905543006', NULL, 0, 0);
INSERT INTO `student` VALUES (1163, '王丽丽', 308, 19, '2939866102', '2021-02-03', '13003178481', NULL, 0, 0);
INSERT INTO `student` VALUES (1164, '刘超', 109, 16, '1542401462', '2021-02-03', '13702094192', NULL, 0, 0);
INSERT INTO `student` VALUES (1165, '赵秀梅', 9, 16, '2935367029', '2021-02-03', '13706334006', NULL, 0, 0);
INSERT INTO `student` VALUES (1166, '陈建军', 298, 20, '5528644793', '2021-02-03', '15600134979', NULL, 0, 0);
INSERT INTO `student` VALUES (1167, '叶红', 395, 16, '4298236449', '2021-02-03', '15007304592', NULL, 0, 0);
INSERT INTO `student` VALUES (1168, '周桂珍', 117, 23, '5664008122', '2021-02-03', '15803922751', NULL, 0, 0);
INSERT INTO `student` VALUES (1169, '冯晶', 232, 23, '3300955145', '2021-02-03', '15700531584', NULL, 0, 0);
INSERT INTO `student` VALUES (1170, '邓桂兰', 301, 18, '0751764338', '2021-02-03', '15504804755', NULL, 0, 0);
INSERT INTO `student` VALUES (1171, '白林', 246, 22, '2681761436', '2021-02-03', '13300570827', NULL, 0, 0);
INSERT INTO `student` VALUES (1172, '李娟', 181, 23, '8184412867', '2021-02-03', '15005037021', NULL, 0, 0);
INSERT INTO `student` VALUES (1173, '李艳', 352, 23, '6472239278', '2021-02-03', '15000796294', NULL, 0, 0);
INSERT INTO `student` VALUES (1174, '钟桂花', 160, 18, '8660864595', '2021-02-03', '13006878832', NULL, 0, 0);
INSERT INTO `student` VALUES (1175, '陈倩', 100, 20, '4703786603', '2021-02-03', '15201083154', NULL, 0, 0);
INSERT INTO `student` VALUES (1176, '朱丹丹', 195, 22, '3769846064', '2021-02-03', '13707551528', NULL, 0, 0);
INSERT INTO `student` VALUES (1177, '孙淑华', 192, 11, '3054836380', '2021-02-03', '15201927184', NULL, 0, 0);
INSERT INTO `student` VALUES (1178, '黄宁', 42, 11, '1793958120', '2021-02-03', '13406018747', NULL, 0, 0);
INSERT INTO `student` VALUES (1179, '萧秀荣', 39, 22, '2658723295', '2021-02-03', '15200258557', NULL, 0, 0);
INSERT INTO `student` VALUES (1180, '潘洁', 313, 15, '0743519234', '2021-02-03', '15205304158', NULL, 0, 0);
INSERT INTO `student` VALUES (1181, '刘岩', 171, 10, '7670044403', '2021-02-03', '15008425429', NULL, 0, 0);
INSERT INTO `student` VALUES (1182, '尹凯', 43, 11, '3231460810', '2021-02-03', '15000776324', NULL, 0, 0);
INSERT INTO `student` VALUES (1183, '陈娜', 83, 19, '9928426111', '2021-02-03', '13202409059', NULL, 0, 0);
INSERT INTO `student` VALUES (1184, '王海燕', 225, 11, '6437405451', '2021-02-03', '15205526460', NULL, 0, 0);
INSERT INTO `student` VALUES (1185, '苏旭', 131, 20, '7033563067', '2021-02-03', '13803803354', NULL, 0, 0);
INSERT INTO `student` VALUES (1186, '董瑞', 341, 11, '8254079801', '2021-02-03', '15007444748', NULL, 0, 0);
INSERT INTO `student` VALUES (1187, '张秀梅', 147, 12, '6335820770', '2021-02-03', '15800806968', NULL, 0, 0);
INSERT INTO `student` VALUES (1188, '赵琴', 226, 20, '5337253384', '2021-02-03', '15001833323', NULL, 0, 0);
INSERT INTO `student` VALUES (1189, '魏洋', 108, 10, '4411945873', '2021-02-03', '15602151207', NULL, 0, 0);
INSERT INTO `student` VALUES (1190, '朱莹', 347, 23, '1041373132', '2021-02-03', '15200442067', NULL, 0, 0);
INSERT INTO `student` VALUES (1191, '尹洁', 135, 18, '5449008206', '2021-02-03', '15800540253', NULL, 0, 0);
INSERT INTO `student` VALUES (1192, '梅平', 303, 20, '0604875868', '2021-02-03', '13207247234', NULL, 0, 0);
INSERT INTO `student` VALUES (1193, '唐玉', 223, 20, '0880707396', '2021-02-03', '15902392227', NULL, 0, 0);
INSERT INTO `student` VALUES (1194, '张磊', 388, 20, '6024292442', '2021-02-03', '15701786163', NULL, 0, 0);
INSERT INTO `student` VALUES (1195, '何燕', 276, 12, '8039483884', '2021-02-03', '15307523665', NULL, 0, 0);
INSERT INTO `student` VALUES (1196, '游桂芝', 382, 15, '8647483694', '2021-02-03', '13607939047', NULL, 0, 0);
INSERT INTO `student` VALUES (1197, '张秀华', 130, 19, '1911220721', '2021-02-03', '15000744005', NULL, 0, 0);
INSERT INTO `student` VALUES (1198, '陈静', 14, 10, '1183655917', '2021-02-03', '15508881503', NULL, 0, 0);
INSERT INTO `student` VALUES (1199, '杨萍', 371, 10, '9438088906', '2021-02-03', '15307677345', NULL, 0, 0);
INSERT INTO `student` VALUES (1200, '王辉', 56, 19, '6877535823', '2021-02-03', '15601717085', NULL, 0, 0);
INSERT INTO `student` VALUES (1201, '孟丽丽', 335, 16, '4113870485', '2021-02-03', '13403845723', NULL, 0, 0);
INSERT INTO `student` VALUES (1202, '石冬梅', 109, 16, '3052968028', '2021-02-03', '13307473733', NULL, 0, 0);
INSERT INTO `student` VALUES (1203, '王淑兰', 258, 19, '7696508034', '2021-02-03', '15004346859', NULL, 0, 0);
INSERT INTO `student` VALUES (1204, '杨琴', 294, 11, '1106487574', '2021-02-03', '13307950279', NULL, 0, 0);
INSERT INTO `student` VALUES (1205, '杜云', 249, 10, '3454883076', '2021-02-03', '13106906976', NULL, 0, 0);
INSERT INTO `student` VALUES (1206, '滕鑫', 91, 12, '9882141354', '2021-02-03', '15201865082', NULL, 0, 0);
INSERT INTO `student` VALUES (1207, '陈秀梅', 260, 19, '6038089333', '2021-02-03', '15308542029', NULL, 0, 0);
INSERT INTO `student` VALUES (1208, '孙涛', 247, 19, '0421208095', '2021-02-03', '15703097513', NULL, 0, 0);
INSERT INTO `student` VALUES (1209, '王佳', 399, 20, '8073164690', '2021-02-03', '13701465738', NULL, 0, 0);
INSERT INTO `student` VALUES (1210, '李刚', 87, 16, '4852536265', '2021-02-03', '13106757403', NULL, 0, 0);
INSERT INTO `student` VALUES (1211, '王杰', 14, 16, '8935362003', '2021-02-03', '13805373831', NULL, 0, 0);
INSERT INTO `student` VALUES (1212, '李云', 171, 10, '8751118140', '2021-02-03', '15502757234', NULL, 0, 0);
INSERT INTO `student` VALUES (1213, '郑瑞', 331, 23, '1731046203', '2021-02-03', '13506338520', NULL, 0, 0);
INSERT INTO `student` VALUES (1214, '叶超', 240, 11, '6842843386', '2021-02-03', '13305327573', NULL, 0, 0);
INSERT INTO `student` VALUES (1215, '邓金凤', 272, 16, '9704133437', '2021-02-03', '15808341845', NULL, 0, 0);
INSERT INTO `student` VALUES (1216, '萧飞', 173, 12, '2669260171', '2021-02-03', '13307018484', NULL, 0, 0);
INSERT INTO `student` VALUES (1217, '张雪', 239, 22, '7325953479', '2021-02-03', '13403208354', NULL, 0, 0);
INSERT INTO `student` VALUES (1218, '蒋桂香', 394, 12, '1335522888', '2021-02-03', '15905162883', NULL, 0, 0);
INSERT INTO `student` VALUES (1219, '黄红霞', 305, 20, '7975866323', '2021-02-03', '15501950613', NULL, 0, 0);
INSERT INTO `student` VALUES (1220, '冯兰英', 268, 11, '0125438269', '2021-02-03', '15508064497', NULL, 0, 0);
INSERT INTO `student` VALUES (1221, '安凯', 194, 18, '6956301033', '2021-02-03', '15604351052', NULL, 0, 0);
INSERT INTO `student` VALUES (1222, '曹浩', 173, 19, '4699013446', '2021-02-03', '15601351248', NULL, 0, 0);
INSERT INTO `student` VALUES (1223, '刘瑜', 376, 23, '3077606736', '2021-02-03', '15000500591', NULL, 0, 0);
INSERT INTO `student` VALUES (1224, '李明', 16, 16, '6132971435', '2021-02-03', '13004566902', NULL, 0, 0);
INSERT INTO `student` VALUES (1225, '海鹏', 8, 11, '2348835185', '2021-02-03', '13008303836', NULL, 0, 0);
INSERT INTO `student` VALUES (1226, '张勇', 296, 16, '4794386297', '2021-02-03', '15107196865', NULL, 0, 0);
INSERT INTO `student` VALUES (1227, '徐文', 311, 15, '7657245900', '2021-02-03', '13600448696', NULL, 0, 0);
INSERT INTO `student` VALUES (1228, '龙洋', 155, 19, '9181926537', '2021-02-03', '13206343783', NULL, 0, 0);
INSERT INTO `student` VALUES (1229, '田桂花', 198, 15, '4842553655', '2021-02-03', '13308564185', NULL, 0, 0);
INSERT INTO `student` VALUES (1230, '李宇', 282, 20, '8936609125', '2021-02-03', '15505791569', NULL, 0, 0);
INSERT INTO `student` VALUES (1231, '苗彬', 140, 16, '7086620100', '2021-02-03', '13802470155', NULL, 0, 0);
INSERT INTO `student` VALUES (1232, '李欣', 216, 23, '7658059908', '2021-02-03', '15207422549', NULL, 0, 0);
INSERT INTO `student` VALUES (1233, '符秀英', 212, 23, '4003393141', '2021-02-03', '15000723937', NULL, 0, 0);
INSERT INTO `student` VALUES (1234, '赵华', 129, 10, '0439715577', '2021-02-03', '15607401223', NULL, 0, 0);
INSERT INTO `student` VALUES (1235, '李丽华', 20, 10, '0476326602', '2021-02-03', '13102345305', NULL, 0, 0);
INSERT INTO `student` VALUES (1236, '张玉华', 201, 19, '6359961087', '2021-02-03', '15100147452', NULL, 0, 0);
INSERT INTO `student` VALUES (1237, '夏志强', 201, 18, '6285829624', '2021-02-03', '15303230914', NULL, 0, 0);
INSERT INTO `student` VALUES (1238, '傅玉兰', 230, 12, '6943460866', '2021-02-03', '13804975052', NULL, 0, 0);
INSERT INTO `student` VALUES (1239, '张建国', 272, 16, '6912804382', '2021-02-03', '15506834647', NULL, 0, 0);
INSERT INTO `student` VALUES (1240, '黄淑英', 294, 23, '4170494498', '2021-02-03', '15306084116', NULL, 0, 0);
INSERT INTO `student` VALUES (1241, '周云', 187, 18, '5337126036', '2021-02-03', '13900130117', NULL, 0, 0);
INSERT INTO `student` VALUES (1242, '王秀英', 15, 23, '8810556111', '2021-02-03', '15701046590', NULL, 0, 0);
INSERT INTO `student` VALUES (1243, '朱林', 235, 10, '0994969757', '2021-02-03', '13005105729', NULL, 0, 0);
INSERT INTO `student` VALUES (1244, '廖冬梅', 193, 23, '8624814186', '2021-02-03', '13606474475', NULL, 0, 0);
INSERT INTO `student` VALUES (1245, '刘强', 80, 23, '9494188966', '2021-02-03', '13803540714', NULL, 0, 0);
INSERT INTO `student` VALUES (1246, '张宁', 157, 22, '3792565334', '2021-02-03', '15105225311', NULL, 0, 0);
INSERT INTO `student` VALUES (1247, '李淑英', 273, 23, '9799610801', '2021-02-03', '15002054326', NULL, 0, 0);
INSERT INTO `student` VALUES (1248, '张桂兰', 231, 22, '9941077876', '2021-02-03', '13203293709', NULL, 0, 0);
INSERT INTO `student` VALUES (1249, '温志强', 73, 23, '4682615391', '2021-02-03', '15302596087', NULL, 0, 0);
INSERT INTO `student` VALUES (1250, '黄秀荣', 124, 19, '5665561595', '2021-02-03', '15003234197', NULL, 0, 0);
INSERT INTO `student` VALUES (1251, '裴丹丹', 306, 20, '1913051173', '2021-02-03', '13203295484', NULL, 0, 0);
INSERT INTO `student` VALUES (1252, '李旭', 236, 18, '9423571777', '2021-02-03', '13805398250', NULL, 0, 0);
INSERT INTO `student` VALUES (1253, '邹帅', 362, 22, '1630265754', '2021-02-03', '15901054257', NULL, 0, 0);
INSERT INTO `student` VALUES (1254, '李静', 159, 15, '3596117566', '2021-02-03', '13401735477', NULL, 0, 0);
INSERT INTO `student` VALUES (1255, '郭峰', 308, 15, '7349157271', '2021-02-03', '13308171002', NULL, 0, 0);
INSERT INTO `student` VALUES (1256, '童军', 157, 22, '7988880797', '2021-02-03', '13208824334', NULL, 0, 0);
INSERT INTO `student` VALUES (1257, '李超', 234, 16, '0985494203', '2021-02-03', '15302500166', NULL, 0, 0);
INSERT INTO `student` VALUES (1258, '杨楠', 2, 15, '6724632197', '2021-02-03', '15804551492', NULL, 0, 0);
INSERT INTO `student` VALUES (1259, '段荣', 199, 23, '4291980556', '2021-02-03', '13001142433', NULL, 0, 0);
INSERT INTO `student` VALUES (1260, '张华', 276, 10, '4641445732', '2021-02-03', '13102004963', NULL, 0, 0);
INSERT INTO `student` VALUES (1261, '王涛', 359, 15, '8110522527', '2021-02-03', '13707552372', NULL, 0, 0);
INSERT INTO `student` VALUES (1262, '陆杨', 285, 18, '1952069932', '2021-02-03', '15503787576', NULL, 0, 0);
INSERT INTO `student` VALUES (1263, '夏超', 55, 23, '7629520620', '2021-02-03', '13300192213', NULL, 0, 0);
INSERT INTO `student` VALUES (1264, '陈洋', 65, 20, '6769117203', '2021-02-03', '13006137523', NULL, 0, 0);
INSERT INTO `student` VALUES (1265, '张飞', 290, 18, '8941440158', '2021-02-03', '13408851129', NULL, 0, 0);
INSERT INTO `student` VALUES (1266, '彭亮', 123, 20, '3303762166', '2021-02-03', '15801174172', NULL, 0, 0);
INSERT INTO `student` VALUES (1267, '杨楠', 259, 22, '8880053468', '2021-02-03', '15602047227', NULL, 0, 0);
INSERT INTO `student` VALUES (1268, '曾雪梅', 168, 18, '1990787328', '2021-02-03', '15503403595', NULL, 0, 0);
INSERT INTO `student` VALUES (1269, '李秀珍', 260, 19, '6417607369', '2021-02-03', '13401778683', NULL, 0, 0);
INSERT INTO `student` VALUES (1270, '孙博', 330, 11, '3456767522', '2021-02-03', '15300374117', NULL, 0, 0);
INSERT INTO `student` VALUES (1271, '陈秀梅', 15, 20, '7219985642', '2021-02-03', '13908806508', NULL, 0, 0);
INSERT INTO `student` VALUES (1272, '陈玉兰', 203, 16, '2910689831', '2021-02-03', '13702226747', NULL, 0, 0);
INSERT INTO `student` VALUES (1273, '王丽丽', 123, 22, '3454195999', '2021-02-03', '15701168852', NULL, 0, 0);
INSERT INTO `student` VALUES (1274, '杨畅', 105, 19, '8020566168', '2021-02-03', '13502527190', NULL, 0, 0);
INSERT INTO `student` VALUES (1275, '王荣', 55, 18, '0035786460', '2021-02-03', '15300681512', NULL, 0, 0);
INSERT INTO `student` VALUES (1276, '胡淑珍', 394, 11, '7032578576', '2021-02-03', '13002356608', NULL, 0, 0);
INSERT INTO `student` VALUES (1277, '陈瑜', 149, 15, '9644134008', '2021-02-03', '13302310966', NULL, 0, 0);
INSERT INTO `student` VALUES (1278, '范琳', 299, 15, '7307429296', '2021-02-03', '13001755826', NULL, 0, 0);
INSERT INTO `student` VALUES (1279, '路丽华', 146, 10, '8944954705', '2021-02-03', '15504747940', NULL, 0, 0);
INSERT INTO `student` VALUES (1280, '王春梅', 318, 19, '5791398319', '2021-02-03', '13704591133', NULL, 0, 0);
INSERT INTO `student` VALUES (1281, '闻娟', 9, 15, '7916817032', '2021-02-03', '13206821929', NULL, 0, 0);
INSERT INTO `student` VALUES (1282, '戴宇', 253, 12, '7588052364', '2021-02-03', '13500068182', NULL, 0, 0);
INSERT INTO `student` VALUES (1283, '杨柳', 274, 16, '3564979741', '2021-02-03', '15203856701', NULL, 0, 0);
INSERT INTO `student` VALUES (1284, '张云', 290, 11, '1424928539', '2021-02-03', '13300237562', NULL, 0, 0);
INSERT INTO `student` VALUES (1285, '张秀荣', 266, 12, '8407955877', '2021-02-03', '15804798424', NULL, 0, 0);
INSERT INTO `student` VALUES (1286, '薛龙', 265, 10, '5846359855', '2021-02-03', '13708188597', NULL, 0, 0);
INSERT INTO `student` VALUES (1287, '白淑英', 229, 23, '7498253952', '2021-02-03', '15806077727', NULL, 0, 0);
INSERT INTO `student` VALUES (1288, '张峰', 354, 11, '4780445567', '2021-02-03', '13302320096', NULL, 0, 0);
INSERT INTO `student` VALUES (1289, '张金凤', 336, 19, '7954987291', '2021-02-03', '15500602197', NULL, 0, 0);
INSERT INTO `student` VALUES (1290, '胡建', 168, 16, '9174357528', '2021-02-03', '13703324596', NULL, 0, 0);
INSERT INTO `student` VALUES (1291, '白玉华', 240, 15, '5080217858', '2021-02-03', '15305504052', NULL, 0, 0);
INSERT INTO `student` VALUES (1292, '苗桂兰', 345, 18, '9301275734', '2021-02-03', '15903803440', NULL, 0, 0);
INSERT INTO `student` VALUES (1293, '齐桂芳', 341, 11, '1452735505', '2021-02-03', '15701124282', NULL, 0, 0);
INSERT INTO `student` VALUES (1294, '刘辉', 206, 23, '3857251828', '2021-02-03', '15906177178', NULL, 0, 0);
INSERT INTO `student` VALUES (1295, '曾龙', 295, 18, '9665082553', '2021-02-03', '15106158460', NULL, 0, 0);
INSERT INTO `student` VALUES (1296, '刘小红', 121, 11, '3237748363', '2021-02-03', '15708590019', NULL, 0, 0);
INSERT INTO `student` VALUES (1297, '林秀兰', 115, 12, '3983629125', '2021-02-03', '15600161798', NULL, 0, 0);
INSERT INTO `student` VALUES (1298, '刘萍', 159, 23, '8517054695', '2021-02-03', '15108117777', NULL, 0, 0);
INSERT INTO `student` VALUES (1299, '黄瑜', 235, 22, '7926655936', '2021-02-03', '13605861071', NULL, 0, 0);
INSERT INTO `student` VALUES (1300, '柳秀荣', 174, 10, '1020421010', '2021-02-03', '15802030668', NULL, 0, 0);
INSERT INTO `student` VALUES (1301, '余佳', 64, 20, '7069050930', '2021-02-03', '15301380850', NULL, 0, 0);
INSERT INTO `student` VALUES (1302, '杨玉', 207, 19, '0163453721', '2021-02-03', '15305469062', NULL, 0, 0);
INSERT INTO `student` VALUES (1303, '温兵', 225, 11, '6297190813', '2021-02-03', '13004776210', NULL, 0, 0);
INSERT INTO `student` VALUES (1304, '段桂珍', 381, 18, '7849550170', '2021-02-03', '15803007823', NULL, 0, 0);
INSERT INTO `student` VALUES (1305, '胡帅', 71, 23, '0469330714', '2021-02-03', '13805145163', NULL, 0, 0);
INSERT INTO `student` VALUES (1306, '周兰英', 42, 19, '9955203713', '2021-02-03', '15304668628', NULL, 0, 0);
INSERT INTO `student` VALUES (1307, '刘倩', 335, 23, '9872834424', '2021-02-03', '15802176305', NULL, 0, 0);
INSERT INTO `student` VALUES (1308, '李雪', 398, 23, '4876723797', '2021-02-03', '15803645440', NULL, 0, 0);
INSERT INTO `student` VALUES (1309, '傅秀兰', 226, 20, '2842396568', '2021-02-03', '15003525021', NULL, 0, 0);
INSERT INTO `student` VALUES (1310, '龙亮', 193, 22, '9335139673', '2021-02-03', '15008857099', NULL, 0, 0);
INSERT INTO `student` VALUES (1311, '叶霞', 127, 12, '4432381205', '2021-02-03', '13401058076', NULL, 0, 0);
INSERT INTO `student` VALUES (1312, '张畅', 144, 10, '7783471102', '2021-02-03', '15803240209', NULL, 0, 0);
INSERT INTO `student` VALUES (1313, '林博', 77, 10, '5595405548', '2021-02-03', '13802207672', NULL, 0, 0);
INSERT INTO `student` VALUES (1314, '陈峰', 246, 15, '0789911165', '2021-02-03', '13108198888', NULL, 0, 0);
INSERT INTO `student` VALUES (1315, '彭辉', 327, 22, '9247360836', '2021-02-03', '15301938518', NULL, 0, 0);
INSERT INTO `student` VALUES (1316, '朱晶', 251, 15, '3803077877', '2021-02-03', '13105530438', NULL, 0, 0);
INSERT INTO `student` VALUES (1317, '顾玉梅', 267, 22, '1381604027', '2021-02-03', '13402770840', NULL, 0, 0);
INSERT INTO `student` VALUES (1318, '毛莹', 46, 19, '2880259196', '2021-02-03', '13405096100', NULL, 0, 0);
INSERT INTO `student` VALUES (1319, '黄英', 134, 16, '2104576114', '2021-02-03', '15002668170', NULL, 0, 0);
INSERT INTO `student` VALUES (1320, '钟阳', 182, 16, '6804179797', '2021-02-03', '13203236647', NULL, 0, 0);
INSERT INTO `student` VALUES (1321, '卢娜', 214, 18, '4574606082', '2021-02-03', '13805402059', NULL, 0, 0);
INSERT INTO `student` VALUES (1322, '张岩', 280, 10, '9883242426', '2021-02-03', '15501153387', NULL, 0, 0);
INSERT INTO `student` VALUES (1323, '朱丹丹', 244, 16, '2584275317', '2021-02-03', '13202475550', NULL, 0, 0);
INSERT INTO `student` VALUES (1324, '孔帆', 145, 10, '0788138923', '2021-02-03', '15107321430', NULL, 0, 0);
INSERT INTO `student` VALUES (1325, '沈建军', 329, 19, '4968246638', '2021-02-03', '13600251936', NULL, 0, 0);
INSERT INTO `student` VALUES (1326, '李婷', 360, 23, '0389249003', '2021-02-03', '13704080070', NULL, 0, 0);
INSERT INTO `student` VALUES (1327, '宋建国', 127, 19, '9421190180', '2021-02-03', '13206932959', NULL, 0, 0);
INSERT INTO `student` VALUES (1328, '吴秀珍', 327, 11, '7338200781', '2021-02-03', '15206484507', NULL, 0, 0);
INSERT INTO `student` VALUES (1329, '陈英', 247, 23, '2645776951', '2021-02-03', '15504228427', NULL, 0, 0);
INSERT INTO `student` VALUES (1330, '邹帅', 61, 16, '2104059100', '2021-02-03', '13906506816', NULL, 0, 0);
INSERT INTO `student` VALUES (1331, '易荣', 185, 11, '9903467578', '2021-02-03', '15000176459', NULL, 0, 0);
INSERT INTO `student` VALUES (1332, '雷宇', 124, 22, '0404722289', '2021-02-03', '15306403632', NULL, 0, 0);
INSERT INTO `student` VALUES (1333, '钟桂花', 200, 20, '0918116467', '2021-02-03', '15807680421', NULL, 0, 0);
INSERT INTO `student` VALUES (1334, '李玉', 234, 15, '5490676953', '2021-02-03', '15607007784', NULL, 0, 0);
INSERT INTO `student` VALUES (1335, '陈静', 199, 19, '3965222171', '2021-02-03', '15301684097', NULL, 0, 0);
INSERT INTO `student` VALUES (1336, '陈华', 177, 19, '0458900960', '2021-02-03', '15007041168', NULL, 0, 0);
INSERT INTO `student` VALUES (1337, '尹桂芝', 222, 20, '2483656298', '2021-02-03', '15707058013', NULL, 0, 0);
INSERT INTO `student` VALUES (1338, '焦桂芳', 370, 15, '3339618342', '2021-02-03', '15202553732', NULL, 0, 0);
INSERT INTO `student` VALUES (1339, '王云', 63, 22, '5025730853', '2021-02-03', '15601184126', NULL, 0, 0);
INSERT INTO `student` VALUES (1340, '陈洋', 205, 11, '6213186433', '2021-02-03', '13701637753', NULL, 0, 0);
INSERT INTO `student` VALUES (1341, '王玲', 5, 18, '5685210097', '2021-02-03', '15903155964', NULL, 0, 0);
INSERT INTO `student` VALUES (1342, '王刚', 250, 19, '0398031021', '2021-02-03', '15907127250', NULL, 0, 0);
INSERT INTO `student` VALUES (1343, '陈红梅', 261, 10, '8482854548', '2021-02-03', '15707758662', NULL, 0, 0);
INSERT INTO `student` VALUES (1344, '尹洁', 317, 15, '9298758870', '2021-02-03', '13400793281', NULL, 0, 0);
INSERT INTO `student` VALUES (1345, '康帅', 121, 18, '2482069181', '2021-02-03', '15007508263', NULL, 0, 0);
INSERT INTO `student` VALUES (1346, '郭桂英', 394, 19, '0919719860', '2021-02-03', '15503830028', NULL, 0, 0);
INSERT INTO `student` VALUES (1347, '邹桂珍', 13, 12, '8351907517', '2021-02-03', '13408478458', NULL, 0, 0);
INSERT INTO `student` VALUES (1348, '蔡莉', 138, 15, '6349470136', '2021-02-03', '15804458331', NULL, 0, 0);
INSERT INTO `student` VALUES (1349, '房秀珍', 6, 19, '5042964500', '2021-02-03', '13802577903', NULL, 0, 0);
INSERT INTO `student` VALUES (1350, '顾健', 211, 12, '4361068822', '2021-02-03', '15504154038', NULL, 0, 0);
INSERT INTO `student` VALUES (1351, '李建华', 140, 12, '5448804855', '2021-02-03', '13201043842', NULL, 0, 0);
INSERT INTO `student` VALUES (1352, '王艳', 157, 10, '2741477237', '2021-02-03', '13706373055', NULL, 0, 0);
INSERT INTO `student` VALUES (1353, '龙淑英', 184, 22, '9289701437', '2021-02-03', '15505992702', NULL, 0, 0);
INSERT INTO `student` VALUES (1354, '张彬', 108, 12, '1190203285', '2021-02-03', '13104174369', NULL, 0, 0);
INSERT INTO `student` VALUES (1355, '韦娟', 307, 23, '4541904360', '2021-02-03', '13306982673', NULL, 0, 0);
INSERT INTO `student` VALUES (1356, '施玲', 317, 18, '7669404865', '2021-02-03', '15708263285', NULL, 0, 0);
INSERT INTO `student` VALUES (1357, '张斌', 69, 22, '6261489870', '2021-02-03', '15908393466', NULL, 0, 0);
INSERT INTO `student` VALUES (1358, '齐敏', 49, 11, '5453414998', '2021-02-03', '13008692995', NULL, 0, 0);
INSERT INTO `student` VALUES (1359, '黄秀荣', 345, 23, '9791232686', '2021-02-03', '15304788774', NULL, 0, 0);
INSERT INTO `student` VALUES (1360, '孙艳', 305, 11, '9465058535', '2021-02-03', '15005291943', NULL, 0, 0);
INSERT INTO `student` VALUES (1361, '王刚', 236, 23, '2949769962', '2021-02-03', '13303910303', NULL, 0, 0);
INSERT INTO `student` VALUES (1362, '萧利', 160, 11, '9986253478', '2021-02-03', '15907742637', NULL, 0, 0);
INSERT INTO `student` VALUES (1363, '覃秀华', 101, 11, '5364245231', '2021-02-03', '15304010200', NULL, 0, 0);
INSERT INTO `student` VALUES (1364, '郭成', 252, 10, '9872351977', '2021-02-03', '15801053244', NULL, 0, 0);
INSERT INTO `student` VALUES (1365, '李军', 301, 16, '1801471571', '2021-02-03', '13503903023', NULL, 0, 0);
INSERT INTO `student` VALUES (1366, '谢春梅', 138, 10, '4393660628', '2021-02-03', '13004642621', NULL, 0, 0);
INSERT INTO `student` VALUES (1367, '钱伟', 41, 11, '2976375537', '2021-02-03', '15902112283', NULL, 0, 0);
INSERT INTO `student` VALUES (1368, '李玲', 394, 15, '7747565464', '2021-02-03', '15907760367', NULL, 0, 0);
INSERT INTO `student` VALUES (1369, '张阳', 182, 15, '4650407620', '2021-02-03', '13104176993', NULL, 0, 0);
INSERT INTO `student` VALUES (1370, '叶成', 5, 16, '4493182480', '2021-02-03', '15900076134', NULL, 0, 0);
INSERT INTO `student` VALUES (1371, '陈波', 202, 18, '7748831316', '2021-02-03', '13008231890', NULL, 0, 0);
INSERT INTO `student` VALUES (1372, '熊静', 168, 20, '4557608349', '2021-02-03', '15204838908', NULL, 0, 0);
INSERT INTO `student` VALUES (1373, '李淑英', 171, 15, '1072594264', '2021-02-03', '15705495249', NULL, 0, 0);
INSERT INTO `student` VALUES (1374, '马芳', 156, 16, '6988489712', '2021-02-03', '15003370019', NULL, 0, 0);
INSERT INTO `student` VALUES (1375, '熊秀英', 185, 16, '1774265175', '2021-02-03', '13107661353', NULL, 0, 0);
INSERT INTO `student` VALUES (1376, '赵娟', 235, 15, '2843711429', '2021-02-03', '15300164863', NULL, 0, 0);
INSERT INTO `student` VALUES (1377, '叶飞', 84, 18, '2504543127', '2021-02-03', '15300503352', NULL, 0, 0);
INSERT INTO `student` VALUES (1378, '叶佳', 351, 18, '7301125062', '2021-02-03', '15903700588', NULL, 0, 0);
INSERT INTO `student` VALUES (1379, '钱伟', 64, 19, '0977643853', '2021-02-03', '13308711437', NULL, 0, 0);
INSERT INTO `student` VALUES (1380, '张坤', 31, 11, '3843976298', '2021-02-03', '15807570582', NULL, 0, 0);
INSERT INTO `student` VALUES (1381, '郑红梅', 106, 15, '7513313638', '2021-02-03', '15506334092', NULL, 0, 0);
INSERT INTO `student` VALUES (1382, '张亮', 131, 22, '5774286560', '2021-02-03', '13004360791', NULL, 0, 0);
INSERT INTO `student` VALUES (1383, '林桂香', 76, 11, '3931726449', '2021-02-03', '13107778130', NULL, 0, 0);
INSERT INTO `student` VALUES (1384, '夏宇', 65, 12, '4473060359', '2021-02-03', '15904105739', NULL, 0, 0);
INSERT INTO `student` VALUES (1385, '兰丽华', 272, 10, '2241113670', '2021-02-03', '15008343357', NULL, 0, 0);
INSERT INTO `student` VALUES (1386, '赵娟', 295, 12, '4672009548', '2021-02-03', '15108573657', NULL, 0, 0);
INSERT INTO `student` VALUES (1387, '林婷', 87, 15, '7095385751', '2021-02-03', '13104267863', NULL, 0, 0);
INSERT INTO `student` VALUES (1388, '刘莹', 271, 10, '0744828364', '2021-02-03', '13002177993', NULL, 0, 0);
INSERT INTO `student` VALUES (1389, '汪杨', 342, 10, '8063479421', '2021-02-03', '13901816573', NULL, 0, 0);
INSERT INTO `student` VALUES (1390, '张芳', 396, 16, '7377777573', '2021-02-03', '15801318057', NULL, 0, 0);
INSERT INTO `student` VALUES (1391, '张春梅', 42, 23, '6460818075', '2021-02-03', '15104825721', NULL, 0, 0);
INSERT INTO `student` VALUES (1392, '刘岩', 352, 19, '4719833804', '2021-02-03', '15603138474', NULL, 0, 0);
INSERT INTO `student` VALUES (1393, '徐瑞', 292, 19, '5340648796', '2021-02-03', '13903718351', NULL, 0, 0);
INSERT INTO `student` VALUES (1394, '冯欣', 201, 10, '7340878155', '2021-02-03', '15501150001', NULL, 0, 0);
INSERT INTO `student` VALUES (1395, '魏丹', 235, 18, '5798721016', '2021-02-03', '13105516720', NULL, 0, 0);
INSERT INTO `student` VALUES (1396, '刘波', 236, 11, '9498734632', '2021-02-03', '13508652197', NULL, 0, 0);
INSERT INTO `student` VALUES (1397, '罗波', 177, 10, '7704339175', '2021-02-03', '15205717366', NULL, 0, 0);
INSERT INTO `student` VALUES (1398, '杨强', 99, 19, '2298248425', '2021-02-03', '13501487612', NULL, 0, 0);
INSERT INTO `student` VALUES (1399, '范亮', 382, 19, '2700980312', '2021-02-03', '13001598261', NULL, 0, 0);
INSERT INTO `student` VALUES (1400, '刘丹', 209, 22, '1167968448', '2021-02-03', '13007664636', NULL, 0, 0);
INSERT INTO `student` VALUES (1401, '熊磊', 131, 12, '8826653527', '2021-02-03', '13006005020', NULL, 0, 0);
INSERT INTO `student` VALUES (1402, '刘凤英', 87, 18, '1190601290', '2021-02-03', '15001160782', NULL, 0, 0);
INSERT INTO `student` VALUES (1403, '杨红霞', 345, 12, '5089427183', '2021-02-03', '15108429098', NULL, 0, 0);
INSERT INTO `student` VALUES (1404, '黄桂香', 73, 20, '1336736739', '2021-02-03', '15200853791', NULL, 0, 0);
INSERT INTO `student` VALUES (1405, '刘鹏', 85, 19, '0029619227', '2021-02-03', '15702896034', NULL, 0, 0);
INSERT INTO `student` VALUES (1406, '黄坤', 50, 11, '0345411618', '2021-02-03', '13307031393', NULL, 0, 0);
INSERT INTO `student` VALUES (1407, '童建国', 209, 12, '9426723303', '2021-02-03', '13001082348', NULL, 0, 0);
INSERT INTO `student` VALUES (1408, '侯秀英', 193, 19, '0449234262', '2021-02-03', '13206597752', NULL, 0, 0);
INSERT INTO `student` VALUES (1409, '吴云', 204, 18, '8007614344', '2021-02-03', '15207185358', NULL, 0, 0);
INSERT INTO `student` VALUES (1410, '马桂芝', 79, 12, '3196683480', '2021-02-03', '15504426889', NULL, 0, 0);
INSERT INTO `student` VALUES (1411, '吴彬', 68, 10, '2203980623', '2021-02-03', '15704621976', NULL, 0, 0);
INSERT INTO `student` VALUES (1412, '王飞', 74, 23, '9990999832', '2021-02-03', '15902075681', NULL, 0, 0);
INSERT INTO `student` VALUES (1413, '祖丹丹', 274, 22, '5345980596', '2021-02-03', '13808003060', NULL, 0, 0);
INSERT INTO `student` VALUES (1414, '刘玉珍', 124, 18, '2138448063', '2021-02-03', '13005361885', NULL, 0, 0);
INSERT INTO `student` VALUES (1415, '申英', 53, 19, '3212938516', '2021-02-03', '15302228326', NULL, 0, 0);
INSERT INTO `student` VALUES (1416, '祖丹丹', 296, 22, '2286414954', '2021-02-03', '15104417270', NULL, 0, 0);
INSERT INTO `student` VALUES (1417, '莫晨', 4, 23, '9378518391', '2021-02-03', '15106793634', NULL, 0, 0);
INSERT INTO `student` VALUES (1418, '陆成', 37, 16, '2013021796', '2021-02-03', '15600654974', NULL, 0, 0);
INSERT INTO `student` VALUES (1419, '林宁', 388, 12, '5401578350', '2021-02-03', '13002146794', NULL, 0, 0);
INSERT INTO `student` VALUES (1420, '郭玉华', 32, 18, '6276137124', '2021-02-03', '15807841371', NULL, 0, 0);
INSERT INTO `student` VALUES (1421, '周桂珍', 269, 19, '3157339703', '2021-02-03', '15606602111', NULL, 0, 0);
INSERT INTO `student` VALUES (1422, '赵荣', 26, 12, '4331073022', '2021-02-03', '13301767737', NULL, 0, 0);
INSERT INTO `student` VALUES (1423, '叶红霞', 240, 11, '1809273056', '2021-02-03', '15607303367', NULL, 0, 0);
INSERT INTO `student` VALUES (1424, '任云', 369, 11, '6875337461', '2021-02-03', '13003543618', NULL, 0, 0);
INSERT INTO `student` VALUES (1425, '卜洋', 119, 22, '3394442291', '2021-02-03', '13703591879', NULL, 0, 0);
INSERT INTO `student` VALUES (1426, '刘娟', 247, 19, '5825644916', '2021-02-03', '15002980204', NULL, 0, 0);
INSERT INTO `student` VALUES (1427, '张宁', 174, 15, '3779134681', '2021-02-03', '15000764694', NULL, 0, 0);
INSERT INTO `student` VALUES (1428, '杨亮', 223, 11, '1531152126', '2021-02-03', '15008580340', NULL, 0, 0);
INSERT INTO `student` VALUES (1429, '田桂花', 262, 22, '1614638971', '2021-02-03', '13005250804', NULL, 0, 0);
INSERT INTO `student` VALUES (1430, '周秀梅', 254, 23, '4831405045', '2021-02-03', '15302692979', NULL, 0, 0);
INSERT INTO `student` VALUES (1431, '李文', 187, 18, '0236012893', '2021-02-03', '13005993522', NULL, 0, 0);
INSERT INTO `student` VALUES (1432, '邵磊', 144, 19, '6281459957', '2021-02-03', '15902282894', NULL, 0, 0);
INSERT INTO `student` VALUES (1433, '任倩', 187, 15, '9570989470', '2021-02-03', '13305072502', NULL, 0, 0);
INSERT INTO `student` VALUES (1434, '黄娜', 247, 12, '2143259831', '2021-02-03', '13504926660', NULL, 0, 0);
INSERT INTO `student` VALUES (1435, '何莉', 164, 23, '1999864208', '2021-02-03', '13908142449', NULL, 0, 0);
INSERT INTO `student` VALUES (1436, '李梅', 255, 20, '7779698442', '2021-02-03', '13407993383', NULL, 0, 0);
INSERT INTO `student` VALUES (1437, '董兵', 120, 16, '3364922284', '2021-02-03', '15507241949', NULL, 0, 0);
INSERT INTO `student` VALUES (1438, '宋丽华', 122, 12, '6938082212', '2021-02-03', '13302473166', NULL, 0, 0);
INSERT INTO `student` VALUES (1439, '杜柳', 27, 22, '0906268780', '2021-02-03', '15201820404', NULL, 0, 0);
INSERT INTO `student` VALUES (1440, '高丽娟', 98, 15, '7042840313', '2021-02-03', '13205884882', NULL, 0, 0);
INSERT INTO `student` VALUES (1441, '吴桂珍', 114, 23, '4778195610', '2021-02-03', '13206224116', NULL, 0, 0);
INSERT INTO `student` VALUES (1442, '李秀珍', 190, 18, '4784781548', '2021-02-03', '15502314529', NULL, 0, 0);
INSERT INTO `student` VALUES (1443, '王淑兰', 138, 20, '1990783066', '2021-02-03', '13305782881', NULL, 0, 0);
INSERT INTO `student` VALUES (1444, '史玉华', 119, 15, '1699835272', '2021-02-03', '13902666140', NULL, 0, 0);
INSERT INTO `student` VALUES (1445, '尹桂芝', 369, 20, '8297310780', '2021-02-03', '13108075999', NULL, 0, 0);
INSERT INTO `student` VALUES (1446, '蔡兰英', 183, 20, '1482114267', '2021-02-03', '15704157954', NULL, 0, 0);
INSERT INTO `student` VALUES (1447, '李秀兰', 199, 22, '0500711648', '2021-02-03', '15604192766', NULL, 0, 0);
INSERT INTO `student` VALUES (1448, '张桂兰', 191, 12, '2276386807', '2021-02-03', '13808135771', NULL, 0, 0);
INSERT INTO `student` VALUES (1449, '李琳', 177, 19, '2050784576', '2021-02-03', '13502018515', NULL, 0, 0);
INSERT INTO `student` VALUES (1450, '邹鹏', 242, 22, '3760394032', '2021-02-03', '15303873781', NULL, 0, 0);
INSERT INTO `student` VALUES (1451, '尹志强', 101, 20, '3893104482', '2021-02-03', '13301005259', NULL, 0, 0);
INSERT INTO `student` VALUES (1452, '冯建平', 191, 12, '4640948688', '2021-02-03', '13005946588', NULL, 0, 0);
INSERT INTO `student` VALUES (1453, '赵鑫', 212, 20, '1332596796', '2021-02-03', '13206470531', NULL, 0, 0);
INSERT INTO `student` VALUES (1454, '张秀梅', 392, 12, '5646667531', '2021-02-03', '15903099062', NULL, 0, 0);
INSERT INTO `student` VALUES (1455, '张明', 251, 12, '2536423455', '2021-02-03', '15606325996', NULL, 0, 0);
INSERT INTO `student` VALUES (1456, '陈秀云', 20, 18, '8660837640', '2021-02-03', '15304470633', NULL, 0, 0);
INSERT INTO `student` VALUES (1457, '刘雷', 310, 12, '8132627241', '2021-02-03', '15003858574', NULL, 0, 0);
INSERT INTO `student` VALUES (1458, '韦洋', 223, 18, '4289158708', '2021-02-03', '13102171393', NULL, 0, 0);
INSERT INTO `student` VALUES (1459, '侯玲', 215, 10, '9806583200', '2021-02-03', '13200350394', NULL, 0, 0);
INSERT INTO `student` VALUES (1460, '周楠', 147, 18, '1204887358', '2021-02-03', '15504794052', NULL, 0, 0);
INSERT INTO `student` VALUES (1461, '沈秀云', 39, 18, '3579170061', '2021-02-03', '13002470248', NULL, 0, 0);
INSERT INTO `student` VALUES (1462, '任洁', 135, 19, '8955693229', '2021-02-03', '13202503587', NULL, 0, 0);
INSERT INTO `student` VALUES (1463, '钱小红', 244, 10, '7927786030', '2021-02-03', '13602642745', NULL, 0, 0);
INSERT INTO `student` VALUES (1464, '李春梅', 181, 12, '2635389175', '2021-02-03', '13400785625', NULL, 0, 0);
INSERT INTO `student` VALUES (1465, '刘娜', 70, 18, '9305884941', '2021-02-03', '13600293530', NULL, 0, 0);
INSERT INTO `student` VALUES (1466, '杨洋', 19, 11, '8497008617', '2021-02-03', '13807203458', NULL, 0, 0);
INSERT INTO `student` VALUES (1467, '赖伟', 195, 20, '1514258837', '2021-02-03', '15803228081', NULL, 0, 0);
INSERT INTO `student` VALUES (1468, '余俊', 146, 16, '3473029615', '2021-02-03', '13207799072', NULL, 0, 0);
INSERT INTO `student` VALUES (1469, '郑俊', 4, 22, '5205940124', '2021-02-03', '15600504071', NULL, 0, 0);
INSERT INTO `student` VALUES (1470, '白林', 337, 16, '7153937978', '2021-02-03', '15500365871', NULL, 0, 0);
INSERT INTO `student` VALUES (1471, '吴萍', 234, 22, '2922147230', '2021-02-03', '13303484680', NULL, 0, 0);
INSERT INTO `student` VALUES (1472, '温志强', 57, 20, '6084178070', '2021-02-03', '15805475288', NULL, 0, 0);
INSERT INTO `student` VALUES (1473, '陈琴', 91, 20, '5590795952', '2021-02-03', '15804460138', NULL, 0, 0);
INSERT INTO `student` VALUES (1474, '郭冬梅', 144, 15, '0644319954', '2021-02-03', '13104118262', NULL, 0, 0);
INSERT INTO `student` VALUES (1475, '张秀芳', 103, 16, '8427312981', '2021-02-03', '15601326571', NULL, 0, 0);
INSERT INTO `student` VALUES (1476, '余俊', 288, 20, '5311684117', '2021-02-03', '13703624673', NULL, 0, 0);
INSERT INTO `student` VALUES (1477, '陈宇', 65, 23, '6697445963', '2021-02-03', '13905342878', NULL, 0, 0);
INSERT INTO `student` VALUES (1478, '张岩', 79, 16, '1419340748', '2021-02-03', '13307686471', NULL, 0, 0);
INSERT INTO `student` VALUES (1479, '翟玉', 240, 16, '2346868047', '2021-02-03', '15308615257', NULL, 0, 0);
INSERT INTO `student` VALUES (1480, '马辉', 72, 12, '0382083609', '2021-02-03', '15601131222', NULL, 0, 0);
INSERT INTO `student` VALUES (1481, '郭淑兰', 219, 10, '6909057608', '2021-02-03', '13008784675', NULL, 0, 0);
INSERT INTO `student` VALUES (1482, '王琴', 159, 19, '8292689339', '2021-02-03', '13503508264', NULL, 0, 0);
INSERT INTO `student` VALUES (1483, '李桂兰', 119, 23, '8013449022', '2021-02-03', '13001591763', NULL, 0, 0);
INSERT INTO `student` VALUES (1484, '鲍建平', 134, 15, '5354962553', '2021-02-03', '15000826106', NULL, 0, 0);
INSERT INTO `student` VALUES (1485, '杨桂芝', 96, 15, '3915860096', '2021-02-03', '13503456962', NULL, 0, 0);
INSERT INTO `student` VALUES (1486, '黄宁', 62, 12, '5808513364', '2021-02-03', '13800449045', NULL, 0, 0);
INSERT INTO `student` VALUES (1487, '刘璐', 136, 11, '5363525470', '2021-02-03', '13403543791', NULL, 0, 0);
INSERT INTO `student` VALUES (1488, '舒兵', 194, 18, '7700248864', '2021-02-03', '13802878644', NULL, 0, 0);
INSERT INTO `student` VALUES (1489, '李娟', 262, 23, '0253336962', '2021-02-03', '13805296609', NULL, 0, 0);
INSERT INTO `student` VALUES (1490, '郭艳', 243, 11, '0429621387', '2021-02-03', '15100788292', NULL, 0, 0);
INSERT INTO `student` VALUES (1491, '张莉', 336, 23, '8841788651', '2021-02-03', '15306786036', NULL, 0, 0);
INSERT INTO `student` VALUES (1492, '王兰英', 335, 11, '6001250863', '2021-02-03', '13100034689', NULL, 0, 0);
INSERT INTO `student` VALUES (1493, '吕金凤', 101, 20, '9075135452', '2021-02-03', '13103893214', NULL, 0, 0);
INSERT INTO `student` VALUES (1494, '宁丽娟', 196, 10, '8621306105', '2021-02-03', '15707471415', NULL, 0, 0);
INSERT INTO `student` VALUES (1495, '荣桂花', 212, 15, '0548826594', '2021-02-03', '13402244157', NULL, 0, 0);
INSERT INTO `student` VALUES (1496, '谢伟', 238, 15, '0162501878', '2021-02-03', '13607211631', NULL, 0, 0);
INSERT INTO `student` VALUES (1497, '黄鹏', 112, 23, '0132742911', '2021-02-03', '13208247617', NULL, 0, 0);
INSERT INTO `student` VALUES (1498, '景云', 277, 10, '2455614110', '2021-02-03', '15904787023', NULL, 0, 0);
INSERT INTO `student` VALUES (1499, '叶秀云', 374, 15, '7271842583', '2021-02-03', '13300834429', NULL, 0, 0);
INSERT INTO `student` VALUES (1500, '刘云', 276, 20, '4594248612', '2021-02-03', '13901940773', NULL, 0, 0);
INSERT INTO `student` VALUES (1501, '杨华', 69, 12, '0732793613', '2021-02-03', '13106040691', NULL, 0, 0);
INSERT INTO `student` VALUES (1502, '刘萍', 187, 16, '5469481505', '2021-02-03', '13203547339', NULL, 0, 0);
INSERT INTO `student` VALUES (1503, '王玉', 46, 11, '4663420954', '2021-02-03', '15802747370', NULL, 0, 0);
INSERT INTO `student` VALUES (1504, '鞠龙', 62, 12, '9903269556', '2021-02-03', '15302444795', NULL, 0, 0);
INSERT INTO `student` VALUES (1505, '刘鑫', 194, 11, '6635851737', '2021-02-03', '15606026385', NULL, 0, 0);
INSERT INTO `student` VALUES (1506, '袁平', 19, 11, '7441415201', '2021-02-03', '13800023159', NULL, 0, 0);
INSERT INTO `student` VALUES (1507, '赵浩', 74, 16, '7709014326', '2021-02-03', '15108797100', NULL, 0, 0);
INSERT INTO `student` VALUES (1508, '郭阳', 170, 15, '0033626279', '2021-02-03', '13201313899', NULL, 0, 0);
INSERT INTO `student` VALUES (1509, '罗帆', 157, 12, '8777875222', '2021-02-03', '15503227031', NULL, 0, 0);
INSERT INTO `student` VALUES (1510, '陈兵', 193, 20, '7504392921', '2021-02-03', '15805628654', NULL, 0, 0);
INSERT INTO `student` VALUES (1511, '李凤兰', 286, 19, '0851762505', '2021-02-03', '13302655126', NULL, 0, 0);
INSERT INTO `student` VALUES (1512, '姚鹏', 128, 20, '4117872944', '2021-02-03', '13300697752', NULL, 0, 0);
INSERT INTO `student` VALUES (1513, '裴浩', 81, 12, '8510191866', '2021-02-03', '15503128302', NULL, 0, 0);
INSERT INTO `student` VALUES (1514, '杨玉英', 206, 12, '0275380012', '2021-02-03', '13903637190', NULL, 0, 0);
INSERT INTO `student` VALUES (1515, '武静', 191, 23, '3745534522', '2021-02-03', '15201142287', NULL, 0, 0);
INSERT INTO `student` VALUES (1516, '王宇', 221, 10, '3429480842', '2021-02-03', '15901126455', NULL, 0, 0);
INSERT INTO `student` VALUES (1517, '张旭', 306, 11, '6121251988', '2021-02-03', '13705538062', NULL, 0, 0);
INSERT INTO `student` VALUES (1518, '勾瑞', 157, 11, '4531254652', '2021-02-03', '15907224115', NULL, 0, 0);
INSERT INTO `student` VALUES (1519, '汪丹', 282, 19, '0788458018', '2021-02-03', '13403675980', NULL, 0, 0);
INSERT INTO `student` VALUES (1520, '玉兰英', 55, 20, '7375356848', '2021-02-03', '13005254714', NULL, 0, 0);
INSERT INTO `student` VALUES (1521, '吴佳', 348, 10, '7836323873', '2021-02-03', '13005764500', NULL, 0, 0);
INSERT INTO `student` VALUES (1522, '王磊', 343, 12, '9745909646', '2021-02-03', '15202816671', NULL, 0, 0);
INSERT INTO `student` VALUES (1523, '左志强', 12, 16, '4025970048', '2021-02-03', '15703208090', NULL, 0, 0);
INSERT INTO `student` VALUES (1524, '李秀梅', 158, 19, '1798942504', '2021-02-03', '15601180391', NULL, 0, 0);
INSERT INTO `student` VALUES (1525, '晏桂兰', 87, 11, '5447788825', '2021-02-03', '13202232397', NULL, 0, 0);
INSERT INTO `student` VALUES (1526, '黎晨', 169, 19, '8144167510', '2021-02-03', '13900142923', NULL, 0, 0);
INSERT INTO `student` VALUES (1527, '田丹', 196, 19, '2003884775', '2021-02-03', '13702356946', NULL, 0, 0);
INSERT INTO `student` VALUES (1528, '李鑫', 259, 23, '6391499346', '2021-02-03', '15703711343', NULL, 0, 0);
INSERT INTO `student` VALUES (1529, '柯丽', 298, 22, '2353535241', '2021-02-03', '13208435536', NULL, 0, 0);
INSERT INTO `student` VALUES (1530, '黄健', 224, 15, '6731664928', '2021-02-03', '15904156012', NULL, 0, 0);
INSERT INTO `student` VALUES (1531, '刘婷', 124, 18, '3291281340', '2021-02-03', '13307646073', NULL, 0, 0);
INSERT INTO `student` VALUES (1532, '杨慧', 202, 18, '6947355482', '2021-02-03', '13705466300', NULL, 0, 0);
INSERT INTO `student` VALUES (1533, '谢岩', 373, 18, '5784230803', '2021-02-03', '15805895334', NULL, 0, 0);
INSERT INTO `student` VALUES (1534, '鞠龙', 179, 22, '5686143819', '2021-02-03', '13905861498', NULL, 0, 0);
INSERT INTO `student` VALUES (1535, '陈荣', 245, 20, '5755248361', '2021-02-03', '13004853687', NULL, 0, 0);
INSERT INTO `student` VALUES (1536, '李秀云', 70, 15, '0372833218', '2021-02-03', '15705766492', NULL, 0, 0);
INSERT INTO `student` VALUES (1537, '李燕', 152, 11, '1309888217', '2021-02-03', '15200708646', NULL, 0, 0);
INSERT INTO `student` VALUES (1538, '熊慧', 231, 22, '5164523522', '2021-02-03', '15203646858', NULL, 0, 0);
INSERT INTO `student` VALUES (1539, '沈鑫', 170, 15, '7338164526', '2021-02-03', '15107052298', NULL, 0, 0);
INSERT INTO `student` VALUES (1540, '王建', 45, 11, '8534381795', '2021-02-03', '13901192168', NULL, 0, 0);
INSERT INTO `student` VALUES (1541, '徐金凤', 134, 16, '6224710709', '2021-02-03', '13701643273', NULL, 0, 0);
INSERT INTO `student` VALUES (1542, '解玉梅', 221, 19, '4322889620', '2021-02-03', '15800796163', NULL, 0, 0);
INSERT INTO `student` VALUES (1543, '马宇', 261, 15, '4918744621', '2021-02-03', '13705242766', NULL, 0, 0);
INSERT INTO `student` VALUES (1544, '杨桂芳', 171, 20, '7806877728', '2021-02-03', '15200973912', NULL, 0, 0);
INSERT INTO `student` VALUES (1545, '郭帅', 69, 19, '4520406578', '2021-02-03', '13805328774', NULL, 0, 0);
INSERT INTO `student` VALUES (1546, '陈杰', 65, 19, '0640134176', '2021-02-03', '15904391595', NULL, 0, 0);
INSERT INTO `student` VALUES (1547, '王丹', 9, 15, '3756566798', '2021-02-03', '15105720490', NULL, 0, 0);
INSERT INTO `student` VALUES (1548, '余秀珍', 130, 15, '2288852617', '2021-02-03', '15503756803', NULL, 0, 0);
INSERT INTO `student` VALUES (1549, '杨桂英', 155, 11, '5038980471', '2021-02-03', '13708416060', NULL, 0, 0);
INSERT INTO `student` VALUES (1550, '莫晨', 32, 11, '5316811447', '2021-02-03', '15803065589', NULL, 0, 0);
INSERT INTO `student` VALUES (1551, '王峰', 184, 22, '1686295346', '2021-02-03', '13706902482', NULL, 0, 0);
INSERT INTO `student` VALUES (1552, '葛建华', 105, 15, '5676899153', '2021-02-03', '15208226479', NULL, 0, 0);
INSERT INTO `student` VALUES (1553, '尹桂芝', 287, 10, '3349164721', '2021-02-03', '13902761691', NULL, 0, 0);
INSERT INTO `student` VALUES (1554, '邢琳', 62, 11, '9470183290', '2021-02-03', '15002351477', NULL, 0, 0);
INSERT INTO `student` VALUES (1555, '樊桂芝', 174, 15, '0014905345', '2021-02-03', '13507939063', NULL, 0, 0);
INSERT INTO `student` VALUES (1556, '罗洋', 67, 12, '3940224313', '2021-02-03', '13908851383', NULL, 0, 0);
INSERT INTO `student` VALUES (1557, '余俊', 204, 11, '8243285714', '2021-02-03', '15003286259', NULL, 0, 0);
INSERT INTO `student` VALUES (1558, '朱洁', 265, 22, '4579684602', '2021-02-03', '15107138898', NULL, 0, 0);
INSERT INTO `student` VALUES (1559, '丁鑫', 279, 12, '0236165724', '2021-02-03', '15705314858', NULL, 0, 0);
INSERT INTO `student` VALUES (1560, '陆平', 237, 11, '7087389254', '2021-02-03', '15703182597', NULL, 0, 0);
INSERT INTO `student` VALUES (1561, '路彬', 233, 19, '0578314046', '2021-02-03', '13400176021', NULL, 0, 0);
INSERT INTO `student` VALUES (1562, '向秀珍', 220, 11, '8184394560', '2021-02-03', '15503485676', NULL, 0, 0);
INSERT INTO `student` VALUES (1563, '燕波', 377, 22, '9902454431', '2021-02-03', '15301763723', NULL, 0, 0);
INSERT INTO `student` VALUES (1564, '危勇', 254, 11, '5111598899', '2021-02-03', '15705256926', NULL, 0, 0);
INSERT INTO `student` VALUES (1565, '李慧', 334, 23, '8095208969', '2021-02-03', '15307388162', NULL, 0, 0);
INSERT INTO `student` VALUES (1566, '邵玉英', 106, 15, '5149254702', '2021-02-03', '15902691244', NULL, 0, 0);
INSERT INTO `student` VALUES (1567, '任倩', 106, 16, '3003231853', '2021-02-03', '13901922816', NULL, 0, 0);
INSERT INTO `student` VALUES (1568, '郭瑜', 282, 22, '4064049036', '2021-02-03', '13406314367', NULL, 0, 0);
INSERT INTO `student` VALUES (1569, '刘秀兰', 313, 20, '5415642185', '2021-02-03', '15602258424', NULL, 0, 0);
INSERT INTO `student` VALUES (1570, '张凤兰', 24, 20, '5086469998', '2021-02-03', '15302445091', NULL, 0, 0);
INSERT INTO `student` VALUES (1571, '林淑华', 169, 23, '7320302728', '2021-02-03', '15104131580', NULL, 0, 0);
INSERT INTO `student` VALUES (1572, '刘芳', 254, 19, '2806210021', '2021-02-03', '13702580543', NULL, 0, 0);
INSERT INTO `student` VALUES (1573, '简凤兰', 217, 11, '5966544150', '2021-02-03', '13701453646', NULL, 0, 0);
INSERT INTO `student` VALUES (1574, '黄婷婷', 379, 18, '4441523385', '2021-02-03', '15503236372', NULL, 0, 0);
INSERT INTO `student` VALUES (1575, '孙荣', 267, 16, '0512770620', '2021-02-03', '13603692001', NULL, 0, 0);
INSERT INTO `student` VALUES (1576, '李杨', 117, 10, '3681014405', '2021-02-03', '13803030731', NULL, 0, 0);
INSERT INTO `student` VALUES (1577, '杨明', 190, 16, '4038496532', '2021-02-03', '13901811767', NULL, 0, 0);
INSERT INTO `student` VALUES (1578, '祝柳', 300, 16, '2304917114', '2021-02-03', '15706294318', NULL, 0, 0);
INSERT INTO `student` VALUES (1579, '颜帅', 230, 11, '3023793835', '2021-02-03', '15104297279', NULL, 0, 0);
INSERT INTO `student` VALUES (1580, '李璐', 6, 11, '3646172955', '2021-02-03', '15804772432', NULL, 0, 0);
INSERT INTO `student` VALUES (1581, '朱春梅', 262, 23, '8315941994', '2021-02-03', '13700016382', NULL, 0, 0);
INSERT INTO `student` VALUES (1582, '杨霞', 228, 12, '4933585257', '2021-02-03', '15205196899', NULL, 0, 0);
INSERT INTO `student` VALUES (1583, '李阳', 240, 20, '1530034345', '2021-02-03', '13804284649', NULL, 0, 0);
INSERT INTO `student` VALUES (1584, '张丽丽', 265, 22, '4664902003', '2021-02-03', '13703278812', NULL, 0, 0);
INSERT INTO `student` VALUES (1585, '李欣', 98, 18, '2778797811', '2021-02-03', '15605060742', NULL, 0, 0);
INSERT INTO `student` VALUES (1586, '漆兵', 332, 20, '5103647185', '2021-02-03', '13104281639', NULL, 0, 0);
INSERT INTO `student` VALUES (1587, '胡东', 173, 11, '3523136323', '2021-02-03', '13805035070', NULL, 0, 0);
INSERT INTO `student` VALUES (1588, '冯坤', 224, 11, '3443023425', '2021-02-03', '13300080442', NULL, 0, 0);
INSERT INTO `student` VALUES (1589, '刘丹', 373, 12, '2260984108', '2021-02-03', '13006903430', NULL, 0, 0);
INSERT INTO `student` VALUES (1590, '陈秀云', 287, 23, '7836295421', '2021-02-03', '15902171579', NULL, 0, 0);
INSERT INTO `student` VALUES (1591, '李小红', 183, 12, '9672914150', '2021-02-03', '13306078538', NULL, 0, 0);
INSERT INTO `student` VALUES (1592, '张荣', 144, 16, '2564668683', '2021-02-03', '13707994994', NULL, 0, 0);
INSERT INTO `student` VALUES (1593, '郭秀英', 4, 18, '0526935761', '2021-02-03', '13808611671', NULL, 0, 0);
INSERT INTO `student` VALUES (1594, '潘淑兰', 101, 23, '0389220677', '2021-02-03', '15903824071', NULL, 0, 0);
INSERT INTO `student` VALUES (1595, '杨宁', 279, 15, '5073714530', '2021-02-03', '15807971306', NULL, 0, 0);
INSERT INTO `student` VALUES (1596, '杨玉兰', 69, 10, '3248599024', '2021-02-03', '15602475177', NULL, 0, 0);
INSERT INTO `student` VALUES (1597, '王磊', 238, 10, '5715598365', '2021-02-03', '15902592165', NULL, 0, 0);
INSERT INTO `student` VALUES (1598, '王涛', 54, 18, '1199644748', '2021-02-03', '13803671577', NULL, 0, 0);
INSERT INTO `student` VALUES (1599, '万秀梅', 194, 10, '1126542983', '2021-02-03', '15305421022', NULL, 0, 0);
INSERT INTO `student` VALUES (1600, '鲍欢', 112, 15, '5700991864', '2021-02-03', '15108441506', NULL, 0, 0);
INSERT INTO `student` VALUES (1601, '李玉兰', 215, 22, '6153114072', '2021-02-03', '13700074096', NULL, 0, 0);
INSERT INTO `student` VALUES (1602, '杜婷', 352, 19, '9388881770', '2021-02-03', '13906143264', NULL, 0, 0);
INSERT INTO `student` VALUES (1603, '张健', 268, 20, '9667719196', '2021-02-03', '13806811131', NULL, 0, 0);
INSERT INTO `student` VALUES (1604, '张凤英', 143, 11, '8057797232', '2021-02-03', '15504866337', NULL, 0, 0);
INSERT INTO `student` VALUES (1605, '李兵', 72, 12, '3135864990', '2021-02-03', '13101896908', NULL, 0, 0);
INSERT INTO `student` VALUES (1606, '王磊', 182, 18, '0810363838', '2021-02-03', '15703561169', NULL, 0, 0);
INSERT INTO `student` VALUES (1607, '刘文', 246, 18, '3359641772', '2021-02-03', '13502496991', NULL, 0, 0);
INSERT INTO `student` VALUES (1608, '夏想', 185, 22, '1724803499', '2021-02-03', '13000075468', NULL, 0, 0);
INSERT INTO `student` VALUES (1609, '柏涛', 400, 23, '1742197273', '2021-02-03', '13205033685', NULL, 0, 0);
INSERT INTO `student` VALUES (1610, '刘桂香', 368, 20, '8605902592', '2021-02-03', '13206607133', NULL, 0, 0);
INSERT INTO `student` VALUES (1611, '颜桂兰', 109, 10, '4087962972', '2021-02-03', '15803560880', NULL, 0, 0);
INSERT INTO `student` VALUES (1612, '温莉', 53, 12, '9743276514', '2021-02-03', '13104240243', NULL, 0, 0);
INSERT INTO `student` VALUES (1613, '苟明', 233, 23, '4525895782', '2021-02-03', '13307225897', NULL, 0, 0);
INSERT INTO `student` VALUES (1614, '李春梅', 362, 15, '6883433522', '2021-02-03', '15206396926', NULL, 0, 0);
INSERT INTO `student` VALUES (1615, '杨秀梅', 10, 19, '7908206904', '2021-02-03', '13201802857', NULL, 0, 0);
INSERT INTO `student` VALUES (1616, '王刚', 384, 10, '3424254601', '2021-02-03', '15904193229', NULL, 0, 0);
INSERT INTO `student` VALUES (1617, '郑建军', 381, 12, '0979621736', '2021-02-03', '13207488647', NULL, 0, 0);
INSERT INTO `student` VALUES (1618, '李涛', 178, 16, '4719105751', '2021-02-03', '13803167294', NULL, 0, 0);
INSERT INTO `student` VALUES (1619, '毛利', 175, 16, '2694747929', '2021-02-03', '15904347483', NULL, 0, 0);
INSERT INTO `student` VALUES (1620, '陶秀云', 292, 19, '7333220369', '2021-02-03', '15901762015', NULL, 0, 0);
INSERT INTO `student` VALUES (1621, '杨桂花', 259, 16, '2381971297', '2021-02-03', '13607891693', NULL, 0, 0);
INSERT INTO `student` VALUES (1622, '李桂珍', 101, 19, '2380151103', '2021-02-03', '13708597940', NULL, 0, 0);
INSERT INTO `student` VALUES (1623, '郭冬梅', 211, 19, '6094684533', '2021-02-03', '15801783580', NULL, 0, 0);
INSERT INTO `student` VALUES (1624, '邓秀珍', 256, 12, '2008652503', '2021-02-03', '15703755847', NULL, 0, 0);
INSERT INTO `student` VALUES (1625, '李秀兰', 370, 16, '7251544803', '2021-02-03', '13801331819', NULL, 0, 0);
INSERT INTO `student` VALUES (1626, '王静', 234, 23, '9291467009', '2021-02-03', '13105361483', NULL, 0, 0);
INSERT INTO `student` VALUES (1627, '陈鹏', 160, 22, '0768862583', '2021-02-03', '15007967033', NULL, 0, 0);
INSERT INTO `student` VALUES (1628, '郭红', 163, 20, '4747218002', '2021-02-03', '15804396792', NULL, 0, 0);
INSERT INTO `student` VALUES (1629, '邵秀华', 211, 10, '1748166356', '2021-02-03', '15001658065', NULL, 0, 0);
INSERT INTO `student` VALUES (1630, '刘洁', 255, 19, '5312482575', '2021-02-03', '13800088976', NULL, 0, 0);
INSERT INTO `student` VALUES (1631, '黄敏', 61, 20, '5664097116', '2021-02-03', '15207278742', NULL, 0, 0);
INSERT INTO `student` VALUES (1632, '刘刚', 206, 19, '8744042178', '2021-02-03', '15701364612', NULL, 0, 0);
INSERT INTO `student` VALUES (1633, '王明', 330, 11, '6470399448', '2021-02-03', '13401748631', NULL, 0, 0);
INSERT INTO `student` VALUES (1634, '梁倩', 129, 15, '3862910378', '2021-02-03', '13605210352', NULL, 0, 0);
INSERT INTO `student` VALUES (1635, '邓倩', 335, 19, '0182970616', '2021-02-03', '13607997005', NULL, 0, 0);
INSERT INTO `student` VALUES (1636, '朱刚', 194, 10, '4389551812', '2021-02-03', '15808413290', NULL, 0, 0);
INSERT INTO `student` VALUES (1637, '胡杨', 198, 18, '3436919298', '2021-02-03', '13701524185', NULL, 0, 0);
INSERT INTO `student` VALUES (1638, '郑明', 102, 15, '5192223405', '2021-02-03', '13408133398', NULL, 0, 0);
INSERT INTO `student` VALUES (1639, '武静', 30, 20, '7590000426', '2021-02-03', '13403547077', NULL, 0, 0);
INSERT INTO `student` VALUES (1640, '沈秀兰', 93, 11, '6626428686', '2021-02-03', '13005463127', NULL, 0, 0);
INSERT INTO `student` VALUES (1641, '周兰英', 255, 16, '1398321070', '2021-02-03', '15906374813', NULL, 0, 0);
INSERT INTO `student` VALUES (1642, '申英', 219, 22, '5192134416', '2021-02-03', '15301613485', NULL, 0, 0);
INSERT INTO `student` VALUES (1643, '徐洋', 172, 20, '4823009398', '2021-02-03', '15200308278', NULL, 0, 0);
INSERT INTO `student` VALUES (1644, '孙俊', 74, 11, '5507161801', '2021-02-03', '15304176105', NULL, 0, 0);
INSERT INTO `student` VALUES (1645, '韦娟', 278, 12, '3851646739', '2021-02-03', '13106053779', NULL, 0, 0);
INSERT INTO `student` VALUES (1646, '程小红', 292, 11, '2613839598', '2021-02-03', '13402024016', NULL, 0, 0);
INSERT INTO `student` VALUES (1647, '赵莹', 269, 23, '7500387644', '2021-02-03', '15507597538', NULL, 0, 0);
INSERT INTO `student` VALUES (1648, '王琳', 190, 20, '8288242819', '2021-02-03', '13700278766', NULL, 0, 0);
INSERT INTO `student` VALUES (1649, '焦丹', 336, 22, '7774162510', '2021-02-03', '15608633536', NULL, 0, 0);
INSERT INTO `student` VALUES (1650, '赵倩', 90, 20, '2618690186', '2021-02-03', '13705688030', NULL, 0, 0);
INSERT INTO `student` VALUES (1651, '王秀芳', 44, 23, '6405127448', '2021-02-03', '15008409084', NULL, 0, 0);
INSERT INTO `student` VALUES (1652, '赵秀芳', 400, 19, '4373303720', '2021-02-03', '13803280628', NULL, 0, 0);
INSERT INTO `student` VALUES (1653, '白玉华', 104, 19, '8479645836', '2021-02-03', '15806974461', NULL, 0, 0);
INSERT INTO `student` VALUES (1654, '杨健', 310, 15, '1200608139', '2021-02-03', '15807106809', NULL, 0, 0);
INSERT INTO `student` VALUES (1655, '马峰', 326, 12, '5220652314', '2021-02-03', '13002110725', NULL, 0, 0);
INSERT INTO `student` VALUES (1656, '单玉珍', 391, 23, '2692334686', '2021-02-03', '15307097823', NULL, 0, 0);
INSERT INTO `student` VALUES (1657, '张欢', 60, 11, '2294258731', '2021-02-03', '15202830034', NULL, 0, 0);
INSERT INTO `student` VALUES (1658, '鲍欢', 125, 23, '9433752565', '2021-02-03', '15105328354', NULL, 0, 0);
INSERT INTO `student` VALUES (1659, '牛倩', 163, 19, '2979317602', '2021-02-03', '13204495891', NULL, 0, 0);
INSERT INTO `student` VALUES (1660, '莫晨', 287, 23, '9935788625', '2021-02-03', '13501541635', NULL, 0, 0);
INSERT INTO `student` VALUES (1661, '韩秀梅', 181, 10, '3428036633', '2021-02-03', '15805115383', NULL, 0, 0);
INSERT INTO `student` VALUES (1662, '杨平', 384, 10, '9140645859', '2021-02-03', '13201077266', NULL, 0, 0);
INSERT INTO `student` VALUES (1663, '李兵', 275, 15, '5669051226', '2021-02-03', '13106958197', NULL, 0, 0);
INSERT INTO `student` VALUES (1664, '毛斌', 231, 10, '3122843590', '2021-02-03', '15105825534', NULL, 0, 0);
INSERT INTO `student` VALUES (1665, '夏志强', 71, 16, '7185080954', '2021-02-03', '13006186526', NULL, 0, 0);
INSERT INTO `student` VALUES (1666, '李晶', 89, 15, '9516834743', '2021-02-03', '15503954999', NULL, 0, 0);
INSERT INTO `student` VALUES (1667, '邓金凤', 214, 16, '6074062926', '2021-02-03', '13404736493', NULL, 0, 0);
INSERT INTO `student` VALUES (1668, '陈雪', 125, 16, '9188482875', '2021-02-03', '15701106171', NULL, 0, 0);
INSERT INTO `student` VALUES (1669, '方斌', 210, 22, '4084562756', '2021-02-03', '15705607589', NULL, 0, 0);
INSERT INTO `student` VALUES (1670, '朱平', 129, 12, '0317961942', '2021-02-03', '15808440881', NULL, 0, 0);
INSERT INTO `student` VALUES (1671, '冯想', 357, 10, '3353325415', '2021-02-03', '13301382698', NULL, 0, 0);
INSERT INTO `student` VALUES (1672, '王丽华', 179, 20, '2293433651', '2021-02-03', '13504208160', NULL, 0, 0);
INSERT INTO `student` VALUES (1673, '蒋萍', 89, 16, '5322056559', '2021-02-03', '15008435368', NULL, 0, 0);
INSERT INTO `student` VALUES (1674, '支辉', 203, 18, '6536430093', '2021-02-03', '13106404482', NULL, 0, 0);
INSERT INTO `student` VALUES (1675, '屈凤英', 152, 22, '2704716223', '2021-02-03', '13300996820', NULL, 0, 0);
INSERT INTO `student` VALUES (1676, '张建军', 204, 12, '6563601444', '2021-02-03', '15307536116', NULL, 0, 0);
INSERT INTO `student` VALUES (1677, '张帆', 136, 18, '8495219312', '2021-02-03', '15103392532', NULL, 0, 0);
INSERT INTO `student` VALUES (1678, '阮秀华', 373, 22, '8495615611', '2021-02-03', '13608717202', NULL, 0, 0);
INSERT INTO `student` VALUES (1679, '陈雪梅', 61, 10, '9285874957', '2021-02-03', '13205158704', NULL, 0, 0);
INSERT INTO `student` VALUES (1680, '陶洋', 180, 23, '5971729615', '2021-02-03', '13801314981', NULL, 0, 0);
INSERT INTO `student` VALUES (1681, '冯欣', 172, 19, '4450250901', '2021-02-03', '13701826711', NULL, 0, 0);
INSERT INTO `student` VALUES (1682, '田桂花', 261, 23, '9501200886', '2021-02-03', '15000700219', NULL, 0, 0);
INSERT INTO `student` VALUES (1683, '李秀兰', 104, 23, '9480745589', '2021-02-03', '15306297085', NULL, 0, 0);
INSERT INTO `student` VALUES (1684, '徐金凤', 397, 18, '0734466109', '2021-02-03', '15507842243', NULL, 0, 0);
INSERT INTO `student` VALUES (1685, '马宇', 233, 20, '5217941136', '2021-02-03', '15905305376', NULL, 0, 0);
INSERT INTO `student` VALUES (1686, '叶建华', 59, 23, '8912997277', '2021-02-03', '13701807304', NULL, 0, 0);
INSERT INTO `student` VALUES (1687, '李玉珍', 400, 18, '7605550291', '2021-02-03', '15501378736', NULL, 0, 0);
INSERT INTO `student` VALUES (1688, '冯荣', 369, 23, '5439707796', '2021-02-03', '15803237946', NULL, 0, 0);
INSERT INTO `student` VALUES (1689, '张婷婷', 286, 20, '4635983673', '2021-02-03', '13201600905', NULL, 0, 0);
INSERT INTO `student` VALUES (1690, '夏宇', 231, 11, '9272200094', '2021-02-03', '15607490962', NULL, 0, 0);
INSERT INTO `student` VALUES (1691, '张涛', 233, 15, '8339732131', '2021-02-03', '15503256338', NULL, 0, 0);
INSERT INTO `student` VALUES (1692, '陈峰', 174, 23, '4302855398', '2021-02-03', '15204937045', NULL, 0, 0);
INSERT INTO `student` VALUES (1693, '岳成', 64, 19, '4608522192', '2021-02-03', '15903341579', NULL, 0, 0);
INSERT INTO `student` VALUES (1694, '冯霞', 243, 12, '0889485852', '2021-02-03', '13304098955', NULL, 0, 0);
INSERT INTO `student` VALUES (1695, '宋婷', 212, 23, '8304029053', '2021-02-03', '13703798744', NULL, 0, 0);
INSERT INTO `student` VALUES (1696, '杨坤', 197, 15, '9871161258', '2021-02-03', '15001313389', NULL, 0, 0);
INSERT INTO `student` VALUES (1697, '舒兵', 121, 10, '9265410923', '2021-02-03', '13705512001', NULL, 0, 0);
INSERT INTO `student` VALUES (1698, '李琳', 180, 12, '8637931583', '2021-02-03', '15802142101', NULL, 0, 0);
INSERT INTO `student` VALUES (1699, '俞琳', 337, 16, '1749743494', '2021-02-03', '15704297962', NULL, 0, 0);
INSERT INTO `student` VALUES (1700, '李军', 245, 12, '8504837045', '2021-02-03', '15200806802', NULL, 0, 0);
INSERT INTO `student` VALUES (1701, '贾宇', 152, 11, '9659909905', '2021-02-03', '13007578227', NULL, 0, 0);
INSERT INTO `student` VALUES (1702, '殷林', 220, 23, '5553723559', '2021-02-03', '13900767662', NULL, 0, 0);
INSERT INTO `student` VALUES (1703, '郭玉华', 121, 20, '7281214499', '2021-02-03', '15200861427', NULL, 0, 0);
INSERT INTO `student` VALUES (1704, '李坤', 151, 22, '3156945973', '2021-02-03', '13008598818', NULL, 0, 0);
INSERT INTO `student` VALUES (1705, '汤燕', 132, 11, '9686231555', '2021-02-03', '13502673388', NULL, 0, 0);
INSERT INTO `student` VALUES (1706, '向岩', 149, 15, '4061527594', '2021-02-03', '13207432320', NULL, 0, 0);
INSERT INTO `student` VALUES (1707, '李秀珍', 165, 22, '5091474808', '2021-02-03', '15606653453', NULL, 0, 0);
INSERT INTO `student` VALUES (1708, '高磊', 98, 20, '7087923146', '2021-02-03', '13107203019', NULL, 0, 0);
INSERT INTO `student` VALUES (1709, '王燕', 90, 16, '5202929907', '2021-02-03', '13900703539', NULL, 0, 0);
INSERT INTO `student` VALUES (1710, '刘雷', 151, 16, '8630114032', '2021-02-03', '13803958902', NULL, 0, 0);
INSERT INTO `student` VALUES (1711, '彭杨', 385, 20, '8497874433', '2021-02-03', '15307625666', NULL, 0, 0);
INSERT INTO `student` VALUES (1712, '舒斌', 197, 11, '2278833035', '2021-02-03', '15107658368', NULL, 0, 0);
INSERT INTO `student` VALUES (1713, '隋红梅', 87, 12, '0985637606', '2021-02-03', '15505312808', NULL, 0, 0);
INSERT INTO `student` VALUES (1714, '杨红', 284, 19, '0241794344', '2021-02-03', '15104887991', NULL, 0, 0);
INSERT INTO `student` VALUES (1715, '李强', 76, 11, '4090170462', '2021-02-03', '15807277329', NULL, 0, 0);
INSERT INTO `student` VALUES (1716, '姚鹏', 128, 19, '7150439169', '2021-02-03', '15108513920', NULL, 0, 0);
INSERT INTO `student` VALUES (1717, '徐萍', 197, 12, '2481313590', '2021-02-03', '15306357743', NULL, 0, 0);
INSERT INTO `student` VALUES (1718, '王强', 86, 16, '5058926598', '2021-02-03', '13801571414', NULL, 0, 0);
INSERT INTO `student` VALUES (1719, '潘欣', 249, 20, '6212370083', '2021-02-03', '13004356788', NULL, 0, 0);
INSERT INTO `student` VALUES (1720, '韦婷', 174, 16, '2911801746', '2021-02-03', '13408867303', NULL, 0, 0);
INSERT INTO `student` VALUES (1721, '罗林', 186, 23, '9535351488', '2021-02-03', '15105925204', NULL, 0, 0);
INSERT INTO `student` VALUES (1722, '王晶', 128, 10, '0721254321', '2021-02-03', '13401093324', NULL, 0, 0);
INSERT INTO `student` VALUES (1723, '常健', 77, 16, '0663284481', '2021-02-03', '13700727247', NULL, 0, 0);
INSERT INTO `student` VALUES (1724, '曲莉', 116, 16, '6383397754', '2021-02-03', '13305976750', NULL, 0, 0);
INSERT INTO `student` VALUES (1725, '陈红', 35, 10, '2807256243', '2021-02-03', '15207134381', NULL, 0, 0);
INSERT INTO `student` VALUES (1726, '夏红', 44, 15, '1256054854', '2021-02-03', '13506638554', NULL, 0, 0);
INSERT INTO `student` VALUES (1727, '陆英', 35, 15, '4972643069', '2021-02-03', '15807371946', NULL, 0, 0);
INSERT INTO `student` VALUES (1728, '陈娟', 158, 20, '9656318496', '2021-02-03', '13301804689', NULL, 0, 0);
INSERT INTO `student` VALUES (1729, '萧秀云', 149, 19, '2421598300', '2021-02-03', '13306114367', NULL, 0, 0);
INSERT INTO `student` VALUES (1730, '黄瑜', 343, 19, '4565236325', '2021-02-03', '13708801130', NULL, 0, 0);
INSERT INTO `student` VALUES (1731, '郑瑞', 96, 19, '5988965110', '2021-02-03', '13307480069', NULL, 0, 0);
INSERT INTO `student` VALUES (1732, '李成', 268, 10, '1628623267', '2021-02-03', '15001813926', NULL, 0, 0);
INSERT INTO `student` VALUES (1733, '徐倩', 59, 15, '9987261035', '2021-02-03', '13305255293', NULL, 0, 0);
INSERT INTO `student` VALUES (1734, '李秀兰', 391, 19, '8609490994', '2021-02-03', '13508880076', NULL, 0, 0);
INSERT INTO `student` VALUES (1735, '黄婷婷', 280, 16, '0763680405', '2021-02-03', '15703074253', NULL, 0, 0);
INSERT INTO `student` VALUES (1736, '徐晶', 361, 15, '3833939335', '2021-02-03', '13500516224', NULL, 0, 0);
INSERT INTO `student` VALUES (1737, '孙俊', 224, 23, '2792615567', '2021-02-03', '13506958872', NULL, 0, 0);
INSERT INTO `student` VALUES (1738, '刘华', 103, 12, '2931313289', '2021-02-03', '13801707804', NULL, 0, 0);
INSERT INTO `student` VALUES (1739, '曹云', 179, 18, '8036725888', '2021-02-03', '15305774417', NULL, 0, 0);
INSERT INTO `student` VALUES (1740, '石超', 64, 22, '1675839589', '2021-02-03', '13006983673', NULL, 0, 0);
INSERT INTO `student` VALUES (1741, '王桂芳', 215, 19, '5274712221', '2021-02-03', '13308110857', NULL, 0, 0);
INSERT INTO `student` VALUES (1742, '任芳', 224, 20, '7173553555', '2021-02-03', '15104804502', NULL, 0, 0);
INSERT INTO `student` VALUES (1743, '刘丽丽', 280, 11, '7762941280', '2021-02-03', '15305893496', NULL, 0, 0);
INSERT INTO `student` VALUES (1744, '陈英', 185, 16, '0492540848', '2021-02-03', '15204904701', NULL, 0, 0);
INSERT INTO `student` VALUES (1745, '李丽', 250, 11, '7512803172', '2021-02-03', '15302288256', NULL, 0, 0);
INSERT INTO `student` VALUES (1746, '王琳', 158, 23, '4101654595', '2021-02-03', '15601461578', NULL, 0, 0);
INSERT INTO `student` VALUES (1747, '王欢', 31, 11, '5393621468', '2021-02-03', '13600882789', NULL, 0, 0);
INSERT INTO `student` VALUES (1748, '屈勇', 241, 16, '8645612978', '2021-02-03', '13405783082', NULL, 0, 0);
INSERT INTO `student` VALUES (1749, '韩博', 154, 15, '9734005454', '2021-02-03', '13203386186', NULL, 0, 0);
INSERT INTO `student` VALUES (1750, '郭秀云', 127, 11, '4333067787', '2021-02-03', '13302439044', NULL, 0, 0);
INSERT INTO `student` VALUES (1751, '杨明', 24, 11, '5352925363', '2021-02-03', '13907065182', NULL, 0, 0);
INSERT INTO `student` VALUES (1752, '江雷', 156, 15, '9334863209', '2021-02-03', '15600186908', NULL, 0, 0);
INSERT INTO `student` VALUES (1753, '张晶', 84, 19, '4914823023', '2021-02-03', '13501097385', NULL, 0, 0);
INSERT INTO `student` VALUES (1754, '相东', 276, 19, '8677908011', '2021-02-03', '13403362515', NULL, 0, 0);
INSERT INTO `student` VALUES (1755, '陆婷', 197, 16, '4601528209', '2021-02-03', '13603912546', NULL, 0, 0);
INSERT INTO `student` VALUES (1756, '廖波', 286, 23, '5950886551', '2021-02-03', '15503490148', NULL, 0, 0);
INSERT INTO `student` VALUES (1757, '杨春梅', 198, 11, '9288067431', '2021-02-03', '15506683818', NULL, 0, 0);
INSERT INTO `student` VALUES (1758, '李建国', 377, 12, '1061267612', '2021-02-03', '13605822534', NULL, 0, 0);
INSERT INTO `student` VALUES (1759, '张桂花', 360, 10, '5750093017', '2021-02-03', '13205925524', NULL, 0, 0);
INSERT INTO `student` VALUES (1760, '秦强', 154, 12, '4880176718', '2021-02-03', '13605011482', NULL, 0, 0);
INSERT INTO `student` VALUES (1761, '李桂荣', 228, 10, '6584320908', '2021-02-03', '13905776886', NULL, 0, 0);
INSERT INTO `student` VALUES (1762, '王玲', 287, 23, '4150867939', '2021-02-03', '13402942680', NULL, 0, 0);
INSERT INTO `student` VALUES (1763, '李华', 102, 23, '4920564008', '2021-02-03', '15302338063', NULL, 0, 0);
INSERT INTO `student` VALUES (1764, '杨秀芳', 43, 22, '2706590894', '2021-02-03', '13807566750', NULL, 0, 0);
INSERT INTO `student` VALUES (1765, '张琴', 288, 18, '2907016867', '2021-02-03', '15801043447', NULL, 0, 0);
INSERT INTO `student` VALUES (1766, '薛婷婷', 248, 11, '9234077410', '2021-02-03', '13300973509', NULL, 0, 0);
INSERT INTO `student` VALUES (1767, '李旭', 201, 20, '9315959562', '2021-02-03', '13300578746', NULL, 0, 0);
INSERT INTO `student` VALUES (1768, '郑莹', 169, 10, '0421130714', '2021-02-03', '15702096818', NULL, 0, 0);
INSERT INTO `student` VALUES (1769, '郭俊', 327, 10, '2500637316', '2021-02-03', '15703735903', NULL, 0, 0);
INSERT INTO `student` VALUES (1770, '刘洁', 165, 16, '5073034780', '2021-02-03', '15900027310', NULL, 0, 0);
INSERT INTO `student` VALUES (1771, '许龙', 121, 15, '0745356580', '2021-02-03', '15904581361', NULL, 0, 0);
INSERT INTO `student` VALUES (1772, '张玉兰', 312, 20, '0476817941', '2021-02-03', '15305836806', NULL, 0, 0);
INSERT INTO `student` VALUES (1773, '缪凤英', 206, 11, '8600667260', '2021-02-03', '13905845293', NULL, 0, 0);
INSERT INTO `student` VALUES (1774, '萧佳', 300, 10, '0739647825', '2021-02-03', '13206436473', NULL, 0, 0);
INSERT INTO `student` VALUES (1775, '杨娜', 174, 12, '7792011465', '2021-02-03', '13403796223', NULL, 0, 0);
INSERT INTO `student` VALUES (1776, '黄燕', 2, 23, '8999095910', '2021-02-03', '15305215698', NULL, 0, 0);
INSERT INTO `student` VALUES (1777, '王玉兰', 217, 23, '1115186029', '2021-02-03', '15204456187', NULL, 0, 0);
INSERT INTO `student` VALUES (1778, '彭春梅', 152, 23, '2051652726', '2021-02-03', '15004967339', NULL, 0, 0);
INSERT INTO `student` VALUES (1779, '周玉梅', 59, 22, '3806107264', '2021-02-03', '13308092340', NULL, 0, 0);
INSERT INTO `student` VALUES (1780, '门欢', 300, 16, '6601145142', '2021-02-03', '15503453855', NULL, 0, 0);
INSERT INTO `student` VALUES (1781, '文文', 186, 16, '0948744548', '2021-02-03', '13504478164', NULL, 0, 0);
INSERT INTO `student` VALUES (1782, '赵玉梅', 195, 10, '0706710082', '2021-02-03', '15805718867', NULL, 0, 0);
INSERT INTO `student` VALUES (1783, '杜丹丹', 377, 23, '2587547094', '2021-02-03', '13401857391', NULL, 0, 0);
INSERT INTO `student` VALUES (1784, '张海燕', 65, 23, '5317967100', '2021-02-03', '13405214115', NULL, 0, 0);
INSERT INTO `student` VALUES (1785, '萧利', 43, 20, '7877059004', '2021-02-03', '15100091855', NULL, 0, 0);
INSERT INTO `student` VALUES (1786, '蔡建华', 203, 16, '4685038419', '2021-02-03', '15707420365', NULL, 0, 0);
INSERT INTO `student` VALUES (1787, '舒梅', 328, 15, '9432087981', '2021-02-03', '15504595226', NULL, 0, 0);
INSERT INTO `student` VALUES (1788, '张俊', 175, 16, '5128825566', '2021-02-03', '15300195687', NULL, 0, 0);
INSERT INTO `student` VALUES (1789, '李桂珍', 122, 20, '6844212140', '2021-02-03', '13905294412', NULL, 0, 0);
INSERT INTO `student` VALUES (1790, '朱倩', 207, 23, '7828325807', '2021-02-03', '15800931121', NULL, 0, 0);
INSERT INTO `student` VALUES (1791, '袁平', 152, 10, '0125763639', '2021-02-03', '15603248868', NULL, 0, 0);
INSERT INTO `student` VALUES (1792, '燕春梅', 253, 16, '2014316760', '2021-02-03', '13706632224', NULL, 0, 0);
INSERT INTO `student` VALUES (1793, '丁秀梅', 258, 11, '1447421048', '2021-02-03', '13807767093', NULL, 0, 0);
INSERT INTO `student` VALUES (1794, '赵超', 172, 23, '4971169226', '2021-02-03', '15501785567', NULL, 0, 0);
INSERT INTO `student` VALUES (1795, '梁慧', 207, 23, '1957380043', '2021-02-03', '15802808695', NULL, 0, 0);
INSERT INTO `student` VALUES (1796, '白林', 308, 19, '2248831460', '2021-02-03', '13204730090', NULL, 0, 0);
INSERT INTO `student` VALUES (1797, '宋秀珍', 287, 20, '5677374274', '2021-02-03', '13700848084', NULL, 0, 0);
INSERT INTO `student` VALUES (1798, '戴帅', 216, 11, '8208850802', '2021-02-03', '13602704635', NULL, 0, 0);
INSERT INTO `student` VALUES (1799, '黄桂英', 200, 22, '5003503542', '2021-02-03', '13300515484', NULL, 0, 0);
INSERT INTO `student` VALUES (1800, '张波', 241, 23, '6022887767', '2021-02-03', '13901732397', NULL, 0, 0);
INSERT INTO `student` VALUES (1801, '廖佳', 272, 18, '0483153243', '2021-02-03', '13406518840', NULL, 0, 0);
INSERT INTO `student` VALUES (1802, '吕海燕', 300, 11, '9978973937', '2021-02-03', '13502747274', NULL, 0, 0);
INSERT INTO `student` VALUES (1803, '王艳', 215, 18, '9260523614', '2021-02-03', '15300778296', NULL, 0, 0);
INSERT INTO `student` VALUES (1804, '董旭', 135, 11, '9294543121', '2021-02-03', '13700194062', NULL, 0, 0);
INSERT INTO `student` VALUES (1805, '张华', 219, 12, '9747413684', '2021-02-03', '13205710275', NULL, 0, 0);
INSERT INTO `student` VALUES (1806, '易红梅', 278, 23, '8833992912', '2021-02-03', '15602252621', NULL, 0, 0);
INSERT INTO `student` VALUES (1807, '雷玉英', 116, 11, '3615649793', '2021-02-03', '13903632428', NULL, 0, 0);
INSERT INTO `student` VALUES (1808, '阳倩', 365, 20, '8401231961', '2021-02-03', '13605210068', NULL, 0, 0);
INSERT INTO `student` VALUES (1809, '葛璐', 213, 11, '9077057243', '2021-02-03', '13007186806', NULL, 0, 0);
INSERT INTO `student` VALUES (1810, '孙艳', 97, 20, '7872954155', '2021-02-03', '15003246861', NULL, 0, 0);
INSERT INTO `student` VALUES (1811, '张凯', 284, 23, '4097884255', '2021-02-03', '15607900629', NULL, 0, 0);
INSERT INTO `student` VALUES (1812, '姚芳', 248, 20, '4076784527', '2021-02-03', '13906253313', NULL, 0, 0);
INSERT INTO `student` VALUES (1813, '刘波', 165, 18, '4379730597', '2021-02-03', '15603973463', NULL, 0, 0);
INSERT INTO `student` VALUES (1814, '何萍', 317, 10, '6854178056', '2021-02-03', '13802313879', NULL, 0, 0);
INSERT INTO `student` VALUES (1815, '鹿玲', 252, 20, '8017990629', '2021-02-03', '13801844033', NULL, 0, 0);
INSERT INTO `student` VALUES (1816, '张莉', 248, 23, '5463481439', '2021-02-03', '13106667789', NULL, 0, 0);
INSERT INTO `student` VALUES (1817, '张霞', 351, 19, '7519446159', '2021-02-03', '13905696658', NULL, 0, 0);
INSERT INTO `student` VALUES (1818, '李桂芳', 119, 19, '8262574542', '2021-02-03', '13506464226', NULL, 0, 0);
INSERT INTO `student` VALUES (1819, '杜佳', 285, 20, '9477752319', '2021-02-03', '15107127281', NULL, 0, 0);
INSERT INTO `student` VALUES (1820, '张晶', 84, 20, '1075043946', '2021-02-03', '13307086272', NULL, 0, 0);
INSERT INTO `student` VALUES (1821, '周云', 310, 19, '3852661142', '2021-02-03', '13705665336', NULL, 0, 0);
INSERT INTO `student` VALUES (1822, '冯秀兰', 385, 23, '3236390521', '2021-02-03', '13806101782', NULL, 0, 0);
INSERT INTO `student` VALUES (1823, '陶秀云', 179, 19, '7012749021', '2021-02-03', '13400117892', NULL, 0, 0);
INSERT INTO `student` VALUES (1824, '陈芳', 131, 23, '3592844402', '2021-02-03', '13507974561', NULL, 0, 0);
INSERT INTO `student` VALUES (1825, '王琴', 207, 12, '7231614752', '2021-02-03', '15603227478', NULL, 0, 0);
INSERT INTO `student` VALUES (1826, '唐玉珍', 248, 18, '1511672522', '2021-02-03', '13408537353', NULL, 0, 0);
INSERT INTO `student` VALUES (1827, '余秀华', 365, 16, '3259963637', '2021-02-03', '13405875956', NULL, 0, 0);
INSERT INTO `student` VALUES (1828, '喻鑫', 64, 18, '0967434304', '2021-02-03', '15806720378', NULL, 0, 0);
INSERT INTO `student` VALUES (1829, '张亮', 249, 10, '7635058452', '2021-02-03', '15201660909', NULL, 0, 0);
INSERT INTO `student` VALUES (1830, '余龙', 24, 16, '2701129058', '2021-02-03', '15907096467', NULL, 0, 0);
INSERT INTO `student` VALUES (1831, '刘帅', 181, 20, '5191696693', '2021-02-03', '13202966991', NULL, 0, 0);
INSERT INTO `student` VALUES (1832, '何璐', 125, 15, '5347108421', '2021-02-03', '15606585177', NULL, 0, 0);
INSERT INTO `student` VALUES (1833, '乔飞', 43, 11, '8204630335', '2021-02-03', '13102533344', NULL, 0, 0);
INSERT INTO `student` VALUES (1834, '李慧', 57, 18, '1876487501', '2021-02-03', '13908862766', NULL, 0, 0);
INSERT INTO `student` VALUES (1835, '林想', 399, 19, '3168667132', '2021-02-03', '15703137887', NULL, 0, 0);
INSERT INTO `student` VALUES (1836, '何璐', 97, 15, '0494203897', '2021-02-03', '13207438902', NULL, 0, 0);
INSERT INTO `student` VALUES (1837, '罗帆', 285, 16, '0995825255', '2021-02-03', '15601363362', NULL, 0, 0);
INSERT INTO `student` VALUES (1838, '赵秀荣', 249, 10, '2500803639', '2021-02-03', '13302304166', NULL, 0, 0);
INSERT INTO `student` VALUES (1839, '谭林', 261, 23, '3861555333', '2021-02-03', '13504342856', NULL, 0, 0);
INSERT INTO `student` VALUES (1840, '罗林', 122, 19, '4294117497', '2021-02-03', '13002524086', NULL, 0, 0);
INSERT INTO `student` VALUES (1841, '潘淑兰', 164, 11, '2786545696', '2021-02-03', '15004731417', NULL, 0, 0);
INSERT INTO `student` VALUES (1842, '傅玉兰', 299, 11, '6557751181', '2021-02-03', '15308375771', NULL, 0, 0);
INSERT INTO `student` VALUES (1843, '刘平', 126, 12, '5293390119', '2021-02-03', '15607546542', NULL, 0, 0);
INSERT INTO `student` VALUES (1844, '谢婷', 288, 12, '8983217738', '2021-02-03', '13306767011', NULL, 0, 0);
INSERT INTO `student` VALUES (1845, '杨桂芳', 62, 10, '0327662376', '2021-02-03', '15503845871', NULL, 0, 0);
INSERT INTO `student` VALUES (1846, '罗林', 291, 23, '6338352593', '2021-02-03', '15108402506', NULL, 0, 0);
INSERT INTO `student` VALUES (1847, '叶秀云', 281, 12, '9728072773', '2021-02-03', '15503676492', NULL, 0, 0);
INSERT INTO `student` VALUES (1848, '张璐', 382, 22, '1780693555', '2021-02-03', '15607905421', NULL, 0, 0);
INSERT INTO `student` VALUES (1849, '高玉珍', 79, 22, '4136286858', '2021-02-03', '15006853199', NULL, 0, 0);
INSERT INTO `student` VALUES (1850, '屈凤英', 204, 19, '4483519566', '2021-02-03', '13602288717', NULL, 0, 0);
INSERT INTO `student` VALUES (1851, '刘兰英', 156, 16, '8751013674', '2021-02-03', '15904334529', NULL, 0, 0);
INSERT INTO `student` VALUES (1852, '刘鑫', 78, 20, '2291372003', '2021-02-03', '15500883204', NULL, 0, 0);
INSERT INTO `student` VALUES (1853, '李莉', 97, 20, '1908195945', '2021-02-03', '15208834478', NULL, 0, 0);
INSERT INTO `student` VALUES (1854, '颜晶', 273, 19, '7912235837', '2021-02-03', '15605055051', NULL, 0, 0);
INSERT INTO `student` VALUES (1855, '欧莉', 326, 10, '0765992110', '2021-02-03', '13900260452', NULL, 0, 0);
INSERT INTO `student` VALUES (1856, '范华', 132, 23, '3027512666', '2021-02-03', '15606007055', NULL, 0, 0);
INSERT INTO `student` VALUES (1857, '张建', 267, 12, '9736380531', '2021-02-03', '15802698167', NULL, 0, 0);
INSERT INTO `student` VALUES (1858, '刘杰', 182, 22, '1981150124', '2021-02-03', '15204039003', NULL, 0, 0);
INSERT INTO `student` VALUES (1859, '符秀英', 177, 18, '1376726957', '2021-02-03', '15200541386', NULL, 0, 0);
INSERT INTO `student` VALUES (1860, '雷红梅', 331, 12, '2604907898', '2021-02-03', '13905992990', NULL, 0, 0);
INSERT INTO `student` VALUES (1861, '张伟', 275, 22, '8692603394', '2021-02-03', '15006522176', NULL, 0, 0);
INSERT INTO `student` VALUES (1862, '刘红霞', 293, 18, '2533966475', '2021-02-03', '15103877121', NULL, 0, 0);
INSERT INTO `student` VALUES (1863, '张淑华', 127, 16, '3561806014', '2021-02-03', '15905003694', NULL, 0, 0);
INSERT INTO `student` VALUES (1864, '白玉华', 281, 16, '1391588944', '2021-02-03', '15200460813', NULL, 0, 0);
INSERT INTO `student` VALUES (1865, '丁超', 275, 16, '0932445932', '2021-02-03', '15904253041', NULL, 0, 0);
INSERT INTO `student` VALUES (1866, '杨平', 88, 10, '2991798408', '2021-02-03', '15904540612', NULL, 0, 0);
INSERT INTO `student` VALUES (1867, '韩桂珍', 122, 23, '3275056737', '2021-02-03', '13306344812', NULL, 0, 0);
INSERT INTO `student` VALUES (1868, '费瑜', 3, 16, '6954585961', '2021-02-03', '13707837178', NULL, 0, 0);
INSERT INTO `student` VALUES (1869, '李桂荣', 295, 19, '2949820044', '2021-02-03', '13408817380', NULL, 0, 0);
INSERT INTO `student` VALUES (1870, '梅刚', 291, 11, '8402797895', '2021-02-03', '15308829026', NULL, 0, 0);
INSERT INTO `student` VALUES (1871, '马荣', 71, 18, '7519314603', '2021-02-03', '13708712489', NULL, 0, 0);
INSERT INTO `student` VALUES (1872, '张超', 397, 10, '6834925010', '2021-02-03', '15002666852', NULL, 0, 0);
INSERT INTO `student` VALUES (1873, '曹兵', 326, 23, '8298249948', '2021-02-03', '15204091289', NULL, 0, 0);
INSERT INTO `student` VALUES (1874, '李莉', 221, 23, '9597813905', '2021-02-03', '13306552209', NULL, 0, 0);
INSERT INTO `student` VALUES (1875, '张洁', 81, 20, '8988395331', '2021-02-03', '13001667763', NULL, 0, 0);
INSERT INTO `student` VALUES (1876, '温林', 190, 16, '5676666216', '2021-02-03', '13006748415', NULL, 0, 0);
INSERT INTO `student` VALUES (1877, '陈想', 76, 11, '3075095711', '2021-02-03', '13007374559', NULL, 0, 0);
INSERT INTO `student` VALUES (1878, '郭刚', 299, 19, '6061020346', '2021-02-03', '13903570697', NULL, 0, 0);
INSERT INTO `student` VALUES (1879, '王强', 132, 16, '4062968136', '2021-02-03', '13807644836', NULL, 0, 0);
INSERT INTO `student` VALUES (1880, '柏桂芝', 237, 19, '3226082263', '2021-02-03', '15200925513', NULL, 0, 0);
INSERT INTO `student` VALUES (1881, '陈建', 163, 10, '6695244787', '2021-02-03', '13700593506', NULL, 0, 0);
INSERT INTO `student` VALUES (1882, '桂欣', 91, 19, '4477151635', '2021-02-03', '13906882699', NULL, 0, 0);
INSERT INTO `student` VALUES (1883, '郭莉', 261, 11, '6692552487', '2021-02-03', '13701415023', NULL, 0, 0);
INSERT INTO `student` VALUES (1884, '王鹏', 246, 15, '9207531963', '2021-02-03', '13204877995', NULL, 0, 0);
INSERT INTO `student` VALUES (1885, '马峰', 132, 22, '9441138714', '2021-02-03', '15503283244', NULL, 0, 0);
INSERT INTO `student` VALUES (1886, '廖倩', 293, 10, '1340260690', '2021-02-03', '15705135167', NULL, 0, 0);
INSERT INTO `student` VALUES (1887, '刘丹', 312, 18, '3014628986', '2021-02-03', '13108193646', NULL, 0, 0);
INSERT INTO `student` VALUES (1888, '郑磊', 204, 15, '6766843032', '2021-02-03', '13901413223', NULL, 0, 0);
INSERT INTO `student` VALUES (1889, '周峰', 227, 23, '0629568853', '2021-02-03', '13503204416', NULL, 0, 0);
INSERT INTO `student` VALUES (1890, '李帆', 76, 15, '8883185351', '2021-02-03', '13201796810', NULL, 0, 0);
INSERT INTO `student` VALUES (1891, '董旭', 299, 18, '5894467476', '2021-02-03', '13105264994', NULL, 0, 0);
INSERT INTO `student` VALUES (1892, '李强', 202, 18, '3904218637', '2021-02-03', '15902208404', NULL, 0, 0);
INSERT INTO `student` VALUES (1893, '罗刚', 72, 15, '4150150189', '2021-02-03', '15900920286', NULL, 0, 0);
INSERT INTO `student` VALUES (1894, '文文', 291, 23, '3756396926', '2021-02-03', '13002391723', NULL, 0, 0);
INSERT INTO `student` VALUES (1895, '凌莉', 320, 22, '5196876430', '2021-02-03', '13006895892', NULL, 0, 0);
INSERT INTO `student` VALUES (1896, '贾欢', 256, 19, '6219316836', '2021-02-03', '15102023573', NULL, 0, 0);
INSERT INTO `student` VALUES (1897, '吴秀珍', 175, 16, '5392694358', '2021-02-03', '13602141039', NULL, 0, 0);
INSERT INTO `student` VALUES (1898, '祝辉', 278, 22, '8208642806', '2021-02-03', '13002848995', NULL, 0, 0);
INSERT INTO `student` VALUES (1899, '林博', 31, 12, '0642226074', '2021-02-03', '13902171052', NULL, 0, 0);
INSERT INTO `student` VALUES (1900, '胡淑英', 112, 11, '6538433456', '2021-02-03', '15706798777', NULL, 0, 0);
INSERT INTO `student` VALUES (1901, '吴彬', 258, 22, '8094130833', '2021-02-03', '13905264278', NULL, 0, 0);
INSERT INTO `student` VALUES (1902, '刘洁', 382, 12, '1211624243', '2021-02-03', '15705114842', NULL, 0, 0);
INSERT INTO `student` VALUES (1903, '裴浩', 320, 10, '7676548646', '2021-02-03', '15606604211', NULL, 0, 0);
INSERT INTO `student` VALUES (1904, '韩玉华', 155, 23, '4514791972', '2021-02-03', '13000401735', NULL, 0, 0);
INSERT INTO `student` VALUES (1905, '王婷婷', 178, 10, '2041306082', '2021-02-03', '13103939088', NULL, 0, 0);
INSERT INTO `student` VALUES (1906, '秦鹏', 188, 20, '1871495538', '2021-02-03', '15202134335', NULL, 0, 0);
INSERT INTO `student` VALUES (1907, '段博', 275, 16, '4683887268', '2021-02-03', '13002327334', NULL, 0, 0);
INSERT INTO `student` VALUES (1908, '冯坤', 189, 22, '5951491890', '2021-02-03', '13706873872', NULL, 0, 0);
INSERT INTO `student` VALUES (1909, '夏想', 154, 20, '2661016185', '2021-02-03', '15101295198', NULL, 0, 0);
INSERT INTO `student` VALUES (1910, '尹红梅', 216, 22, '6215908183', '2021-02-03', '13500858636', NULL, 0, 0);
INSERT INTO `student` VALUES (1911, '李玉兰', 280, 22, '0764937048', '2021-02-03', '15106588992', NULL, 0, 0);
INSERT INTO `student` VALUES (1912, '刘杨', 252, 19, '4749912746', '2021-02-03', '13407648626', NULL, 0, 0);
INSERT INTO `student` VALUES (1913, '白淑英', 258, 12, '6465024135', '2021-02-03', '13504832048', NULL, 0, 0);
INSERT INTO `student` VALUES (1914, '朱林', 116, 12, '9786693840', '2021-02-03', '15103098656', NULL, 0, 0);
INSERT INTO `student` VALUES (1915, '邱兵', 232, 10, '8062789318', '2021-02-03', '13707862784', NULL, 0, 0);
INSERT INTO `student` VALUES (1916, '张婷婷', 284, 18, '3866059537', '2021-02-03', '15101633814', NULL, 0, 0);
INSERT INTO `student` VALUES (1917, '杨平', 114, 20, '9787145117', '2021-02-03', '15701065341', NULL, 0, 0);
INSERT INTO `student` VALUES (1918, '陈艳', 86, 12, '6904046961', '2021-02-03', '15906278180', NULL, 0, 0);
INSERT INTO `student` VALUES (1919, '邱婷婷', 309, 12, '5489297160', '2021-02-03', '15907968498', NULL, 0, 0);
INSERT INTO `student` VALUES (1920, '陈玉华', 361, 18, '8137562809', '2021-02-03', '13408414437', NULL, 0, 0);
INSERT INTO `student` VALUES (1921, '梁丽丽', 227, 11, '5307101584', '2021-02-03', '15002568694', NULL, 0, 0);
INSERT INTO `student` VALUES (1922, '刘刚', 10, 11, '9314115365', '2021-02-03', '13500331806', NULL, 0, 0);
INSERT INTO `student` VALUES (1923, '毛涛', 88, 15, '8344860704', '2021-02-03', '13407650030', NULL, 0, 0);
INSERT INTO `student` VALUES (1924, '李静', 85, 20, '7395799322', '2021-02-03', '13101476665', NULL, 0, 0);
INSERT INTO `student` VALUES (1925, '杨桂芝', 76, 15, '3108423493', '2021-02-03', '15306267902', NULL, 0, 0);
INSERT INTO `student` VALUES (1926, '杨宁', 275, 10, '6351772641', '2021-02-03', '15702787384', NULL, 0, 0);
INSERT INTO `student` VALUES (1927, '陈杨', 218, 22, '0472495329', '2021-02-03', '13105246597', NULL, 0, 0);
INSERT INTO `student` VALUES (1928, '李桂珍', 246, 19, '2675069917', '2021-02-03', '13206675001', NULL, 0, 0);
INSERT INTO `student` VALUES (1929, '刘军', 169, 19, '4685648075', '2021-02-03', '15803343646', NULL, 0, 0);
INSERT INTO `student` VALUES (1930, '李成', 189, 18, '4932411768', '2021-02-03', '13702583850', NULL, 0, 0);
INSERT INTO `student` VALUES (1931, '赵玉兰', 200, 16, '4589256476', '2021-02-03', '13508584331', NULL, 0, 0);
INSERT INTO `student` VALUES (1932, '吴柳', 361, 10, '8618286977', '2021-02-03', '15902017590', NULL, 0, 0);
INSERT INTO `student` VALUES (1933, '黄军', 206, 18, '9437787868', '2021-02-03', '15808094350', NULL, 0, 0);
INSERT INTO `student` VALUES (1934, '金玉华', 3, 18, '0088800223', '2021-02-03', '13405361365', NULL, 0, 0);
INSERT INTO `student` VALUES (1935, '赵俊', 177, 10, '2597596485', '2021-02-03', '13901674520', NULL, 0, 0);
INSERT INTO `student` VALUES (1936, '邹兰英', 232, 23, '5967709585', '2021-02-03', '13602054378', NULL, 0, 0);
INSERT INTO `student` VALUES (1937, '马辉', 175, 16, '6799806933', '2021-02-03', '13702211101', NULL, 0, 0);
INSERT INTO `student` VALUES (1938, '张岩', 81, 18, '6483917191', '2021-02-03', '15808137202', NULL, 0, 0);
INSERT INTO `student` VALUES (1939, '张华', 299, 18, '2853883309', '2021-02-03', '13903351200', NULL, 0, 0);
INSERT INTO `student` VALUES (1940, '曹娟', 242, 22, '3633831352', '2021-02-03', '13300540065', NULL, 0, 0);
INSERT INTO `student` VALUES (1941, '马宇', 148, 19, '6107018858', '2021-02-03', '13206144224', NULL, 0, 0);
INSERT INTO `student` VALUES (1942, '朱坤', 105, 20, '2049018931', '2021-02-03', '13600387351', NULL, 0, 0);
INSERT INTO `student` VALUES (1943, '王晶', 124, 23, '0053504274', '2021-02-03', '15507485478', NULL, 0, 0);
INSERT INTO `student` VALUES (1944, '邹桂珍', 144, 22, '0700159376', '2021-02-03', '15306137562', NULL, 0, 0);
INSERT INTO `student` VALUES (1945, '杜婷', 114, 22, '7154534807', '2021-02-03', '13600900753', NULL, 0, 0);
INSERT INTO `student` VALUES (1946, '海鹏', 243, 15, '5207785849', '2021-02-03', '15004167461', NULL, 0, 0);
INSERT INTO `student` VALUES (1947, '门欢', 31, 23, '2336276339', '2021-02-03', '13204414114', NULL, 0, 0);
INSERT INTO `student` VALUES (1948, '董慧', 67, 16, '7523952040', '2021-02-03', '15603270095', NULL, 0, 0);
INSERT INTO `student` VALUES (1949, '胡超', 17, 11, '9981923072', '2021-02-03', '15906338323', NULL, 0, 0);
INSERT INTO `student` VALUES (1950, '敖杨', 279, 19, '7113136389', '2021-02-03', '15801942718', NULL, 0, 0);
INSERT INTO `student` VALUES (1951, '孙玉珍', 334, 10, '3936357597', '2021-02-03', '15807178834', NULL, 0, 0);
INSERT INTO `student` VALUES (1952, '程兰英', 189, 18, '0179648701', '2021-02-03', '13307436529', NULL, 0, 0);
INSERT INTO `student` VALUES (1953, '王桂芝', 183, 19, '3929450726', '2021-02-03', '13107271220', NULL, 0, 0);
INSERT INTO `student` VALUES (1954, '周桂珍', 204, 16, '3484927648', '2021-02-03', '15303222868', NULL, 0, 0);
INSERT INTO `student` VALUES (1955, '章梅', 252, 18, '5094446446', '2021-02-03', '15300730548', NULL, 0, 0);
INSERT INTO `student` VALUES (1956, '陈鹏', 148, 11, '7658446181', '2021-02-03', '13506574005', NULL, 0, 0);
INSERT INTO `student` VALUES (1957, '裴彬', 224, 16, '0446564081', '2021-02-03', '15607965794', NULL, 0, 0);
INSERT INTO `student` VALUES (1958, '马建平', 104, 18, '0326709288', '2021-02-03', '15807038609', NULL, 0, 0);
INSERT INTO `student` VALUES (1959, '黄斌', 116, 19, '7574035503', '2021-02-03', '15208360356', NULL, 0, 0);
INSERT INTO `student` VALUES (1960, '顾敏', 70, 16, '1123368947', '2021-02-03', '15906034831', NULL, 0, 0);
INSERT INTO `student` VALUES (1961, '徐晶', 158, 20, '3945201575', '2021-02-03', '13903442937', NULL, 0, 0);
INSERT INTO `student` VALUES (1962, '樊佳', 180, 20, '0581533960', '2021-02-03', '13406905197', NULL, 0, 0);
INSERT INTO `student` VALUES (1963, '李刚', 155, 16, '4330734303', '2021-02-03', '15007310936', NULL, 0, 0);
INSERT INTO `student` VALUES (1964, '周桂珍', 220, 15, '9837395006', '2021-02-03', '15707242129', NULL, 0, 0);
INSERT INTO `student` VALUES (1965, '徐伟', 78, 20, '4840059837', '2021-02-03', '15302882469', NULL, 0, 0);
INSERT INTO `student` VALUES (1966, '周云', 145, 10, '7639232059', '2021-02-03', '13906785127', NULL, 0, 0);
INSERT INTO `student` VALUES (1967, '郭梅', 97, 18, '7714067563', '2021-02-03', '15702234052', NULL, 0, 0);
INSERT INTO `student` VALUES (1968, '叶鑫', 291, 15, '2305685730', '2021-02-03', '13701548781', NULL, 0, 0);
INSERT INTO `student` VALUES (1969, '范勇', 153, 11, '4376066123', '2021-02-03', '13206863430', NULL, 0, 0);
INSERT INTO `student` VALUES (1970, '张明', 105, 15, '4150205757', '2021-02-03', '13605595098', NULL, 0, 0);
INSERT INTO `student` VALUES (1971, '郭雪梅', 365, 19, '2653908262', '2021-02-03', '15200448475', NULL, 0, 0);
INSERT INTO `student` VALUES (1972, '王丽丽', 249, 23, '0975810001', '2021-02-03', '13008111267', NULL, 0, 0);
INSERT INTO `student` VALUES (1973, '李桂珍', 153, 10, '1870234869', '2021-02-03', '13605392462', NULL, 0, 0);
INSERT INTO `student` VALUES (1974, '陈燕', 359, 23, '2438612297', '2021-02-03', '13107948144', NULL, 0, 0);
INSERT INTO `student` VALUES (1975, '唐帅', 84, 20, '6454814812', '2021-02-03', '15207584318', NULL, 0, 0);
INSERT INTO `student` VALUES (1976, '雷龙', 202, 15, '7572631959', '2021-02-03', '13102708786', NULL, 0, 0);
INSERT INTO `student` VALUES (1977, '张玉华', 132, 15, '9861628980', '2021-02-03', '13407745696', NULL, 0, 0);
INSERT INTO `student` VALUES (1978, '孙慧', 291, 22, '5595773565', '2021-02-03', '13306416530', NULL, 0, 0);
INSERT INTO `student` VALUES (1979, '陆婷', 104, 15, '2290148002', '2021-02-03', '13206996500', NULL, 0, 0);
INSERT INTO `student` VALUES (1980, '杜峰', 67, 23, '0663209905', '2021-02-03', '13000195743', NULL, 0, 0);
INSERT INTO `student` VALUES (1981, '施淑兰', 273, 12, '1308954670', '2021-02-03', '13706904700', NULL, 0, 0);
INSERT INTO `student` VALUES (1982, '李鹏', 253, 12, '6297334394', '2021-02-03', '13005655283', NULL, 0, 0);
INSERT INTO `student` VALUES (1983, '韩成', 280, 10, '1987632140', '2021-02-03', '15800536658', NULL, 0, 0);
INSERT INTO `student` VALUES (1984, '李红', 288, 10, '5759080190', '2021-02-03', '13606133516', NULL, 0, 0);
INSERT INTO `student` VALUES (1985, '谢玉华', 245, 19, '6428772765', '2021-02-03', '13807525697', NULL, 0, 0);
INSERT INTO `student` VALUES (1986, '李琴', 261, 22, '5802583874', '2021-02-03', '13400546427', NULL, 0, 0);
INSERT INTO `student` VALUES (1987, '王瑞', 399, 20, '6007187102', '2021-02-03', '15308060825', NULL, 0, 0);
INSERT INTO `student` VALUES (1988, '任桂芝', 256, 22, '6589457635', '2021-02-03', '13005780566', NULL, 0, 0);
INSERT INTO `student` VALUES (1989, '叶飞', 399, 23, '1124062303', '2021-02-03', '13803730401', NULL, 0, 0);
INSERT INTO `student` VALUES (1990, '舒峰', 288, 19, '7113843014', '2021-02-03', '13305820334', NULL, 0, 0);
INSERT INTO `student` VALUES (1991, '杜军', 221, 18, '8478246439', '2021-02-03', '15000994065', NULL, 0, 0);
INSERT INTO `student` VALUES (1992, '黄红梅', 90, 12, '0426150031', '2021-02-03', '15002986754', NULL, 0, 0);
INSERT INTO `student` VALUES (1993, '杜云', 242, 19, '1856252812', '2021-02-03', '13804888452', NULL, 0, 0);
INSERT INTO `student` VALUES (1994, '李莉', 85, 12, '4818154778', '2021-02-03', '15702243063', NULL, 0, 0);
INSERT INTO `student` VALUES (1995, '庄洁', 369, 20, '4101448671', '2021-02-03', '13702942237', NULL, 0, 0);
INSERT INTO `student` VALUES (1996, '郜桂香', 248, 19, '3651645836', '2021-02-03', '13705723627', NULL, 0, 0);
INSERT INTO `student` VALUES (1997, '郑艳', 35, 20, '2765359469', '2021-02-03', '13001843147', NULL, 0, 0);
INSERT INTO `student` VALUES (1998, '林强', 153, 15, '9930768538', '2021-02-03', '15801438690', NULL, 0, 0);
INSERT INTO `student` VALUES (1999, '曹平', 71, 22, '3450854157', '2021-02-03', '13206996950', NULL, 0, 0);
INSERT INTO `student` VALUES (2000, '祝志强', 198, 10, '5015539915', '2021-02-03', '13907030163', NULL, 0, 0);
INSERT INTO `student` VALUES (2001, '韦洋', 209, 16, '0709433986', '2021-02-03', '15308457915', NULL, 0, 0);
INSERT INTO `student` VALUES (2002, '张帆', 209, 15, '6114574719', '2021-02-03', '15006934657', NULL, 0, 0);
INSERT INTO `student` VALUES (2003, '黄辉', 218, 22, '9708790950', '2021-02-03', '13305107049', NULL, 0, 0);
INSERT INTO `student` VALUES (2004, '黄丹丹', 281, 10, '9848963206', '2021-02-03', '15301911892', NULL, 0, 0);
INSERT INTO `student` VALUES (2005, '曾凤英', 90, 18, '0482987725', '2021-02-03', '15001620346', NULL, 0, 0);
INSERT INTO `student` VALUES (2006, '夏林', 178, 11, '9780313315', '2021-02-03', '15206532669', NULL, 0, 0);
INSERT INTO `student` VALUES (2007, '周小红', 207, 20, '9482710838', '2021-02-03', '13502861947', NULL, 0, 0);
INSERT INTO `student` VALUES (2008, '滕兵', 162, 20, '5998585505', '2021-02-03', '13205824675', NULL, 0, 0);
INSERT INTO `student` VALUES (2009, '赵玉梅', 178, 15, '3804180027', '2021-02-03', '15806922512', NULL, 0, 0);
INSERT INTO `student` VALUES (2010, '陈凤英', 291, 12, '2942543913', '2021-02-03', '15706901262', NULL, 0, 0);
INSERT INTO `student` VALUES (2011, '吴建军', 73, 20, '7481291710', '2021-02-03', '13806011115', NULL, 0, 0);
INSERT INTO `student` VALUES (2012, '赖玉', 227, 20, '7416676787', '2021-02-03', '13803086026', NULL, 0, 0);
INSERT INTO `student` VALUES (2013, '刘鑫', 116, 19, '5202996156', '2021-02-03', '13404696324', NULL, 0, 0);
INSERT INTO `student` VALUES (2014, '张丽丽', 86, 10, '4855034627', '2021-02-03', '13304010680', NULL, 0, 0);
INSERT INTO `student` VALUES (2015, '朱刚', 188, 23, '7833443364', '2021-02-03', '15004490183', NULL, 0, 0);
INSERT INTO `student` VALUES (2016, '王桂荣', 379, 23, '4763467454', '2021-02-03', '15504957799', NULL, 0, 0);
INSERT INTO `student` VALUES (2017, '曾荣', 86, 12, '4270204693', '2021-02-03', '13506161091', NULL, 0, 0);
INSERT INTO `student` VALUES (2018, '梁建华', 148, 10, '3489053286', '2021-02-03', '15206035329', NULL, 0, 0);
INSERT INTO `student` VALUES (2019, '王阳', 220, 10, '6024377165', '2021-02-03', '13401419007', NULL, 0, 0);
INSERT INTO `student` VALUES (2020, '张磊', 340, 23, '1334423374', '2021-02-03', '15207076368', NULL, 0, 0);
INSERT INTO `student` VALUES (2021, '马琳', 256, 16, '0961277371', '2021-02-03', '15908405590', NULL, 0, 0);
INSERT INTO `student` VALUES (2022, '黄燕', 243, 22, '0578424131', '2021-02-03', '15202639032', NULL, 0, 0);
INSERT INTO `student` VALUES (2023, '吕秀梅', 281, 18, '2215756150', '2021-02-03', '13804934675', NULL, 0, 0);
INSERT INTO `student` VALUES (2024, '贾秀梅', 218, 16, '7367629575', '2021-02-03', '13702358539', NULL, 0, 0);
INSERT INTO `student` VALUES (2025, '曲莉', 85, 19, '7867689107', '2021-02-03', '13504892886', NULL, 0, 0);
INSERT INTO `student` VALUES (2026, '廖娟', 153, 20, '8256413072', '2021-02-03', '15603634704', NULL, 0, 0);
INSERT INTO `student` VALUES (2027, '雷英', 132, 20, '0606304614', '2021-02-03', '15502670212', NULL, 0, 0);
INSERT INTO `student` VALUES (2028, '林娟', 351, 22, '5561015148', '2021-02-03', '15002358292', NULL, 0, 0);
INSERT INTO `student` VALUES (2029, '李坤', 334, 11, '0984408670', '2021-02-03', '13201060298', NULL, 0, 0);
INSERT INTO `student` VALUES (2030, '朱坤', 215, 19, '8454661413', '2021-02-03', '15908320421', NULL, 0, 0);
INSERT INTO `student` VALUES (2031, '李瑜', 116, 19, '8398201384', '2021-02-03', '13708177942', NULL, 0, 0);
INSERT INTO `student` VALUES (2032, '蔡小红', 103, 20, '9395099382', '2021-02-03', '13003182722', NULL, 0, 0);
INSERT INTO `student` VALUES (2033, '江勇', 379, 11, '4991001446', '2021-02-03', '15703320372', NULL, 0, 0);
INSERT INTO `student` VALUES (2034, '张丽丽', 178, 11, '8654882641', '2021-02-03', '13202415144', NULL, 0, 0);
INSERT INTO `student` VALUES (2035, '黄晨', 251, 16, '7008392483', '2021-02-03', '15901077837', NULL, 0, 0);
INSERT INTO `student` VALUES (2036, '王燕', 133, 10, '9652100204', '2021-02-03', '13705027642', NULL, 0, 0);
INSERT INTO `student` VALUES (2037, '吴淑英', 178, 15, '7029294734', '2021-02-03', '15208021456', NULL, 0, 0);
INSERT INTO `student` VALUES (2038, '朱鑫', 145, 18, '0127299231', '2021-02-03', '13506237211', NULL, 0, 0);
INSERT INTO `student` VALUES (2039, '明利', 102, 11, '4304002868', '2021-02-03', '15103163669', NULL, 0, 0);
INSERT INTO `student` VALUES (2040, '程想', 281, 16, '0606046241', '2021-02-03', '13407516898', NULL, 0, 0);
INSERT INTO `student` VALUES (2041, '孙涛', 188, 12, '8131025066', '2021-02-03', '15708142941', NULL, 0, 0);
INSERT INTO `student` VALUES (2042, '唐海燕', 81, 15, '3223071226', '2021-02-03', '13408045687', NULL, 0, 0);
INSERT INTO `student` VALUES (2043, '杨峰', 103, 19, '7201857643', '2021-02-03', '13303010164', NULL, 0, 0);
INSERT INTO `student` VALUES (2044, '孔建军', 198, 18, '8888611515', '2021-02-03', '13207881542', NULL, 0, 0);
INSERT INTO `student` VALUES (2045, '苟涛', 145, 20, '5001242082', '2021-02-03', '15705738434', NULL, 0, 0);
INSERT INTO `student` VALUES (2046, '陈丽娟', 253, 15, '0902173743', '2021-02-03', '13900278437', NULL, 0, 0);
INSERT INTO `student` VALUES (2047, '邢军', NULL, 10, '8993439975', '2021-02-03', '13005662680', NULL, 0, 1);
INSERT INTO `student` VALUES (2048, '鹿玲', 245, 23, '4178109491', '2021-02-03', '13005338521', NULL, 0, 0);
INSERT INTO `student` VALUES (2049, '黄瑞', 253, 22, '9709052402', '2021-02-03', '15106153177', NULL, 0, 0);
INSERT INTO `student` VALUES (2050, '李婷', 133, 20, '2482131094', '2021-02-03', '15703442264', NULL, 0, 0);
INSERT INTO `student` VALUES (2051, '洪佳', 227, 20, '6832205206', '2021-02-03', '15906993423', NULL, 0, 0);
INSERT INTO `student` VALUES (2052, '牛楠', 188, 16, '1951085681', '2021-02-03', '13007458153', NULL, 0, 0);
INSERT INTO `student` VALUES (2053, '金玉华', NULL, 20, '5869957656', '2021-02-03', '15108831484', NULL, 0, 1);
INSERT INTO `student` VALUES (2054, '金涛', 102, 18, '3178036294', '2021-02-03', '13101170044', NULL, 0, 0);
INSERT INTO `student` VALUES (2055, '高梅', 273, 20, '9049805378', '2021-02-03', '13201712439', NULL, 0, 0);
INSERT INTO `student` VALUES (2056, '仝英', 188, 20, '1382433919', '2021-02-03', '13808428606', NULL, 0, 0);
INSERT INTO `student` VALUES (2057, '陶成', 293, 19, '1450242556', '2021-02-03', '15700100801', NULL, 0, 0);
INSERT INTO `student` VALUES (2058, '刁云', 103, 10, '6438434711', '2021-02-03', '13202995396', NULL, 0, 0);
INSERT INTO `student` VALUES (2059, '刘雪', 267, 16, '8687097931', '2021-02-03', '13905866064', NULL, 0, 0);
INSERT INTO `student` VALUES (2060, '张鑫', 267, 10, '3421263338', '2021-02-03', '15207386658', NULL, 0, 0);
INSERT INTO `student` VALUES (2061, '吴淑兰', 227, 22, '5497843483', '2021-02-03', '15101655932', NULL, 0, 0);
INSERT INTO `student` VALUES (2062, '李凤兰', 91, 16, '5759294871', '2021-02-03', '13102811733', NULL, 0, 0);
INSERT INTO `student` VALUES (2063, '吴志强', 103, 23, '4971400661', '2021-02-03', '15001696779', NULL, 0, 0);
INSERT INTO `student` VALUES (2064, '罗帅', 225, 18, '9713608844', '2021-02-03', '15201485816', NULL, 0, 0);
INSERT INTO `student` VALUES (2065, '罗霞', 188, 12, '5933298708', '2021-02-03', '15801004276', NULL, 0, 0);
INSERT INTO `student` VALUES (2066, '武红', 200, 19, '5806921133', '2021-02-03', '15800270052', NULL, 0, 0);
INSERT INTO `student` VALUES (2067, '徐莉', 225, 18, '0105194079', '2021-02-03', '15705536877', NULL, 0, 0);
INSERT INTO `student` VALUES (2068, '敖杨', 256, 20, '3133357428', '2021-02-03', '15502087013', NULL, 0, 0);
INSERT INTO `student` VALUES (2069, '姚宁', 309, 16, '1465558844', '2021-02-03', '15501375925', NULL, 0, 0);
INSERT INTO `student` VALUES (2070, '黎欣', 91, 10, '6222351277', '2021-02-03', '15105671276', NULL, 0, 0);
INSERT INTO `student` VALUES (2071, '孙帆', 225, 5, '4701128967', '2021-02-03', '15101321632', NULL, 0, 0);
INSERT INTO `student` VALUES (2072, '罗帆', NULL, 23, '5466619733', '2021-02-03', '13002422060', NULL, 0, 1);
INSERT INTO `student` VALUES (2073, '王桂芳', NULL, 18, '5984995065', '2021-02-03', '13307351155', NULL, 0, 1);
INSERT INTO `student` VALUES (2074, '杨玉梅', NULL, 12, '4875029081', '2021-02-03', '13905487930', NULL, 0, 1);
INSERT INTO `student` VALUES (2075, '李雷', NULL, 12, '3803656848', '2021-02-03', '15805147190', NULL, 0, 1);
INSERT INTO `student` VALUES (2076, '谢龙', NULL, 11, '4095674252', '2021-02-03', '13001728578', NULL, 0, 1);
INSERT INTO `student` VALUES (2077, '宋颖', NULL, 19, '4006157913', '2021-02-03', '15007074196', NULL, 0, 1);
INSERT INTO `student` VALUES (2078, '姬云', NULL, 11, '8281557634', '2021-02-03', '13603220615', NULL, 0, 1);
INSERT INTO `student` VALUES (2079, '李建华', NULL, 11, '2084844905', '2021-02-03', '15602035535', NULL, 0, 1);
INSERT INTO `student` VALUES (2080, '裴浩', NULL, 22, '3332816567', '2021-02-03', '13504648945', NULL, 0, 1);
INSERT INTO `student` VALUES (2082, '熊新欣', NULL, 10, '1811101041', '2021-02-09', NULL, NULL, 0, 1);
INSERT INTO `student` VALUES (2083, '马超', 401, 26, '7999582', '2021-03-17', '13745678989', NULL, 0, 0);

-- ----------------------------
-- Table structure for system_function
-- ----------------------------
DROP TABLE IF EXISTS `system_function`;
CREATE TABLE `system_function`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `permission` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_function
-- ----------------------------
INSERT INTO `system_function` VALUES (2, '系统管理', NULL, 2, NULL, NULL, 'M', NULL, 'iconflashlight_fill', '2020-12-09 11:07:14');
INSERT INTO `system_function` VALUES (3, '用户管理', 2, 1, 'system/user/index.html', 'views/system/user/index', 'C', 'system:user:list', 'iconpeople', '2020-12-10 09:46:31');
INSERT INTO `system_function` VALUES (4, '角色管理', 2, 2, 'system/role/index.html', 'views/system/role/index', 'C', 'system:role:list', 'iconaddressbook', '2020-12-10 09:48:07');
INSERT INTO `system_function` VALUES (5, '菜单管理', 2, 3, 'system/function/index', 'views/system/function/index', 'C', 'system:function:list', 'iconcreatetask', '2020-12-10 09:50:13');
INSERT INTO `system_function` VALUES (6, '用户添加', 3, 1, '', '', 'F', 'system:user:save', NULL, '2020-12-18 13:06:04');
INSERT INTO `system_function` VALUES (7, '用户修改', 3, 2, NULL, NULL, 'F', 'system:user:update', NULL, '2020-12-18 13:06:50');
INSERT INTO `system_function` VALUES (8, '用户删除', 3, 2, NULL, NULL, 'F', 'system:user:delete', NULL, '2020-12-18 13:07:15');
INSERT INTO `system_function` VALUES (10, '角色添加', 4, 1, NULL, NULL, 'F', 'system:role:save', NULL, '2020-12-18 13:34:18');
INSERT INTO `system_function` VALUES (11, '角色修改', 4, 2, NULL, NULL, 'F', 'system:role:update', NULL, '2020-12-18 13:34:32');
INSERT INTO `system_function` VALUES (12, '角色删除', 4, 3, NULL, NULL, 'F', 'system:role:delete', NULL, '2020-12-18 13:34:45');
INSERT INTO `system_function` VALUES (13, '角色查询', 4, 4, NULL, NULL, 'F', 'system:role:query', NULL, '2020-12-18 13:34:57');
INSERT INTO `system_function` VALUES (14, '用户查询', 3, 4, NULL, NULL, 'F', 'system:user:query', NULL, '2020-12-18 13:34:04');
INSERT INTO `system_function` VALUES (15, '菜单添加', 5, 1, NULL, NULL, 'F', 'system:function:save', NULL, '2020-12-18 15:14:18');
INSERT INTO `system_function` VALUES (16, '菜单修改', 5, 2, NULL, NULL, 'F', 'system:function:update', NULL, '2020-12-18 15:14:21');
INSERT INTO `system_function` VALUES (17, '菜单删除', 5, 3, NULL, NULL, 'F', 'system:function:delete', NULL, '2020-12-18 15:14:24');
INSERT INTO `system_function` VALUES (18, '菜单查询', 5, 4, NULL, NULL, 'F', 'system:function:query', NULL, '2020-12-18 15:14:26');
INSERT INTO `system_function` VALUES (38, '日志管理', 2, 4, 'system/log/index.html', 'views/system/log/index', 'C', 'system:log:list', 'iconworkbench_fill', '2020-12-30 13:49:37');
INSERT INTO `system_function` VALUES (44, '日志查询', 38, 1, '', '', 'F', 'system:log:query', '', '2021-01-08 11:45:42');
INSERT INTO `system_function` VALUES (45, '学生宿舍管理', NULL, 0, '', '', 'M', '', 'iconaccessory', '2021-01-19 13:43:28');
INSERT INTO `system_function` VALUES (46, '宿舍楼管理', 45, 3, 'building/index.html', 'views/manage/building/index', 'C', 'manage:building:list', 'iconhomepage_fill', '2021-01-19 13:47:12');
INSERT INTO `system_function` VALUES (47, '新增', 46, 1, '', '', 'F', 'manage:building:save', '', '2021-01-19 13:52:59');
INSERT INTO `system_function` VALUES (48, '更新', 46, 2, '', '', 'F', 'manage:building:update', '', '2021-01-19 13:53:35');
INSERT INTO `system_function` VALUES (49, '删除', 46, 3, '', '', 'F', 'manage:building:delete', '', '2021-01-19 13:53:55');
INSERT INTO `system_function` VALUES (50, '查询', 46, 4, '', '', 'F', 'manage:building:query', '', '2021-01-19 13:54:21');
INSERT INTO `system_function` VALUES (51, '班级管理', 45, 2, 'faculty/index.html', 'views/manage/faculty/index', 'C', 'faculty:list', 'iconquestions', '2021-01-19 15:22:22');
INSERT INTO `system_function` VALUES (52, '新增学院', 51, 1, '', '', 'F', 'faculty:save', '', '2021-01-19 17:06:11');
INSERT INTO `system_function` VALUES (53, '删除学院', 51, 2, '', '', 'F', 'faculty:delete', '', '2021-01-19 17:06:41');
INSERT INTO `system_function` VALUES (54, '查询学院', 51, 3, '', '', 'F', 'faculty:query', '', '2021-01-19 17:07:08');
INSERT INTO `system_function` VALUES (55, '修改学院', 51, 4, '', '', 'F', 'faculty:update', '', '2021-01-19 17:07:31');
INSERT INTO `system_function` VALUES (56, '学生管理', 45, 1, 'student/index.html', 'views/manage/student/index', 'C', 'student:list', 'iconpeople_fill', '2021-01-22 15:19:09');
INSERT INTO `system_function` VALUES (57, '新增学生', 56, 1, '', '', 'F', 'student:save', '', '2021-01-22 15:20:07');
INSERT INTO `system_function` VALUES (58, '更新学生', 56, 2, '', '', 'F', 'student:update', '', '2021-01-22 15:20:40');
INSERT INTO `system_function` VALUES (59, '删除学生', 56, 3, '', '', 'F', 'student:delete', '', '2021-01-22 15:21:11');
INSERT INTO `system_function` VALUES (60, '查询学生', 56, 4, '', '', 'F', 'student:query', '', '2021-01-22 15:22:32');
INSERT INTO `system_function` VALUES (61, '宿舍管理', 45, 0, 'room/index.html', 'views/manage/room/index', 'C', 'room:list', 'icontailor', '2021-01-22 15:25:08');
INSERT INTO `system_function` VALUES (62, '新增宿舍', 61, NULL, '', '', 'F', 'room:save', '', '2021-01-22 15:25:29');
INSERT INTO `system_function` VALUES (63, '修改宿舍', 61, 1, '', '', 'F', 'room:update', '', '2021-01-22 15:26:59');
INSERT INTO `system_function` VALUES (64, '删除宿舍', 61, 4, '', '', 'F', 'room:delete', '', '2021-01-22 15:27:47');
INSERT INTO `system_function` VALUES (65, '查询宿舍', 61, NULL, '', '', 'F', 'room:query', '', '2021-01-22 15:28:48');
INSERT INTO `system_function` VALUES (66, '发送消息', NULL, 3, '', '', 'F', 'home:send:msg', '', '2021-01-27 15:18:42');
INSERT INTO `system_function` VALUES (67, '晚归记录', 77, 4, 'back/index.html', 'views/manage/back/index', 'C', 'back:list', 'iconmarketing_fill', '2021-02-17 19:22:22');
INSERT INTO `system_function` VALUES (68, '晚归查询', 67, 1, '', '', 'F', 'back:query', '', '2021-02-17 19:23:50');
INSERT INTO `system_function` VALUES (69, '删除晚归记录', 67, 2, '', '', 'F', 'back:delete', '', '2021-02-17 19:24:20');
INSERT INTO `system_function` VALUES (70, '新增', 67, 3, '', '', 'F', 'back:save', '', '2021-02-17 19:25:01');
INSERT INTO `system_function` VALUES (71, '更新', 67, 4, '', '', 'F', 'back:update', '', '2021-02-17 19:25:24');
INSERT INTO `system_function` VALUES (72, '请假记录', 77, 5, 'leave/index.html', 'views/manage/leave/index', 'C', 'leave:list', 'iconaccessory', '2021-03-10 11:31:41');
INSERT INTO `system_function` VALUES (73, '新增记录', 72, 0, '', '', 'F', 'leave:save', '', '2021-03-10 15:29:57');
INSERT INTO `system_function` VALUES (74, '更新记录', 72, 1, '', '', 'F', 'leave:update', '', '2021-03-10 15:30:39');
INSERT INTO `system_function` VALUES (75, '删除记录', 72, 2, '', '', 'F', 'leave:delete', '', '2021-03-10 15:31:07');
INSERT INTO `system_function` VALUES (76, '查询记录', 72, 4, '', '', 'F', 'leave:query', '', '2021-03-10 15:31:30');
INSERT INTO `system_function` VALUES (77, '记录', 45, 4, '', '', 'M', '', 'iconactivity', '2021-03-12 14:44:19');
INSERT INTO `system_function` VALUES (78, '维修记录', 77, 1, 'repair/index.html', 'views/manage/repair/index', 'C', 'repair:list', 'iconclock_fill', '2021-04-12 15:15:45');
INSERT INTO `system_function` VALUES (79, '查询', 78, 1, '', '', 'F', 'repair:query', '', '2021-04-13 10:13:19');
INSERT INTO `system_function` VALUES (80, '新增', 78, 2, '', '', 'F', 'repair:save', '', '2021-04-13 11:18:23');
INSERT INTO `system_function` VALUES (81, '更新', 78, 3, '', '', 'F', 'repair:update', '', '2021-04-13 14:07:07');
INSERT INTO `system_function` VALUES (82, '删除', 78, 4, '', '', 'F', 'repair:delete', '', '2021-04-13 14:07:29');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operate_time` datetime(0) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `clas` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_ul`(`user_id`) USING BTREE,
  CONSTRAINT `fk_ul` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 676 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES (647, '2021-04-28 17:34:17', 1, 'LeaveController', 'save', '0:0:0:0:0:0:0:1', '{\"leave\":{\"reason\":\"123\",\"studentId\":2036,\"target\":\"123\",\"backDate\":{\"year\":2021,\"month\":\"APRIL\",\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"},\"era\":\"CE\",\"dayOfMonth\":28,\"dayOfWeek\":\"WEDNESDAY\",\"dayOfYear\":118,\"leapYear\":false,\"monthValue\":4}}}', '/leave/save', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (648, '2021-04-28 17:34:27', 1, 'LeaveController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":16}', '/leave/delete/16', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (649, '2021-04-29 12:28:42', 1, 'BackLateController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":4}', '/backlate/delete/4', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (650, '2021-04-29 12:28:57', 1, 'LeaveController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":15}', '/leave/delete/15', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (651, '2021-04-29 12:29:29', 1, 'RepairController', 'save', '0:0:0:0:0:0:0:1', '{\"repair\":{\"id\":5,\"roomId\":262,\"describe\":\"卫生间漏水\",\"status\":false,\"createDate\":{\"year\":2021,\"month\":\"APRIL\",\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"},\"era\":\"CE\",\"dayOfMonth\":13,\"dayOfWeek\":\"TUESDAY\",\"dayOfYear\":103,\"leapYear\":false,\"monthValue\":4},\"room\":{\"id\":262,\"number\":\"B3022\"}}}', '/repair/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (652, '2021-04-29 12:29:36', 1, 'RepairController', 'save', '0:0:0:0:0:0:0:1', '{\"repair\":{\"id\":5,\"roomId\":262,\"describe\":\"卫生间漏水\",\"picture\":[\"8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png\"],\"status\":false,\"createDate\":{\"year\":2021,\"month\":\"APRIL\",\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"},\"era\":\"CE\",\"dayOfMonth\":13,\"dayOfWeek\":\"TUESDAY\",\"dayOfYear\":103,\"leapYear\":false,\"monthValue\":4},\"room\":{\"id\":262,\"number\":\"B3022\"}}}', '/repair/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (653, '2021-04-29 16:21:02', 1, 'SystemUserController', 'resetPassword', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/system/user/resetPassword', '重置用户密码', '{\"statusCode\":200,\"msg\":\"密码重置成功\"}');
INSERT INTO `system_log` VALUES (654, '2021-04-29 16:21:04', 1, 'SystemUserController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/system/user/delete', '删除用户', '{\"statusCode\":500,\"msg\":\"该用户为其他人领导，无法删除\"}');
INSERT INTO `system_log` VALUES (655, '2021-04-29 16:21:15', 1, 'SystemUserController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":24}', '/system/user/delete', '删除用户', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (656, '2021-04-29 16:22:52', 1, 'SystemUserController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":29}', '/system/user/delete', '删除用户', '{\"statusCode\":500,\"msg\":\"该用户为其他人领导，无法删除\"}');
INSERT INTO `system_log` VALUES (657, '2021-05-07 11:21:54', 1, 'BuildingController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"building\":{\"id\":1,\"name\":\"清华大学\"}}', '/building/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (658, '2021-05-07 11:22:02', 1, 'BuildingController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"building\":{\"id\":20,\"name\":\"北京大学\"}}', '/building/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (659, '2021-05-07 11:22:13', 1, 'FacultyController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"faculty\":{\"id\":24,\"name\":\"清华大学\",\"orderNum\":1}}', '/faculty/saveOrUpdate', '添加或更新学院', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (660, '2021-05-07 11:22:19', 1, 'FacultyController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"faculty\":{\"id\":24,\"name\":\"北京大学\",\"orderNum\":1}}', '/faculty/saveOrUpdate', '添加或更新学院', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (661, '2021-05-07 11:22:27', 1, 'FacultyController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"faculty\":{\"id\":1,\"name\":\"清华大学\",\"orderNum\":2}}', '/faculty/saveOrUpdate', '添加或更新学院', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (662, '2021-05-07 11:54:03', 1, 'SystemUserController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemUser\":{\"id\":24,\"realName\":\"杨秀梅\",\"loginName\":\"279a797a\",\"icon\":\"8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png\",\"cellphone\":\"15601880680\",\"email\":\"279a797a@163.com\",\"userRoleId\":[2],\"leaderId\":29,\"leader\":{\"id\":29,\"realName\":\"刘琴\"},\"buildingId\":19,\"building\":{\"id\":19,\"name\":\"C2入口\"},\"isOnLine\":false}}', '/system/user/saveOrUpdate', '添加修改用户', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (663, '2021-05-07 14:08:31', 24, 'StudentController', 'delete', '0:0:0:0:0:0:0:1', '{\"departApplication\":{\"reason\":\".....\",\"studentId\":2033},\"string\":\"1d1ddcca-793b-49d2-8f09-0a31f87dce67\"}', '/student/delete', '', '{\"statusCode\":200,\"msg\":\"退宿申请已提交，等待上一级审核\"}');
INSERT INTO `system_log` VALUES (664, '2021-05-14 10:57:07', 1, 'BackLateController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"backLate\":{\"studentId\":1035,\"reason\":\"1234124\",\"backDate\":{\"hour\":10,\"minute\":57,\"second\":0,\"dayOfMonth\":14,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"month\":\"MAY\",\"monthValue\":5,\"year\":2021,\"nano\":0,\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"}}}}', '/backlate/saveOrUpdate', '', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (665, '2021-05-14 10:57:14', 1, 'BackLateController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/backlate/delete/1', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (666, '2021-05-14 10:57:45', 1, 'LeaveController', 'save', '0:0:0:0:0:0:0:1', '{\"leave\":{\"reason\":\"123\",\"studentId\":2062,\"target\":\"拉萨\",\"backDate\":{\"year\":2021,\"month\":\"MAY\",\"chronology\":{\"calendarType\":\"iso8601\",\"id\":\"ISO\"},\"era\":\"CE\",\"dayOfMonth\":14,\"dayOfWeek\":\"FRIDAY\",\"dayOfYear\":134,\"leapYear\":false,\"monthValue\":5}}}', '/leave/save', '', '{\"statusCode\":200,\"msg\":\"添加成功\"}');
INSERT INTO `system_log` VALUES (667, '2021-05-14 10:57:50', 1, 'LeaveController', 'update', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/leave/update/1', '', '{\"statusCode\":200,\"msg\":\"更新成功\"}');
INSERT INTO `system_log` VALUES (668, '2021-05-14 10:57:54', 1, 'LeaveController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/leave/delete/1', '', '{\"statusCode\":200,\"msg\":\"删除成功\"}');
INSERT INTO `system_log` VALUES (669, '2021-05-21 14:05:12', 1, 'RoomController', 'delete', '0:0:0:0:0:0:0:1', '{\"long\":1}', '/room/delete/1', '', '{\"statusCode\":500,\"msg\":\"该宿舍还有学生， 无法删除\"}');
INSERT INTO `system_log` VALUES (670, '2021-05-25 13:23:01', 23, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,46,45]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (671, '2021-05-25 13:23:14', 23, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,46]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (672, '2021-05-25 13:24:07', 23, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,46,45]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (673, '2021-05-25 13:24:19', 23, 'SystemRoleController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemRole\":{\"id\":3,\"name\":\"系统管理员\",\"functionIds\":[2,66,3,4,5,38,6,7,8,14,10,12,11,13,15,16,17,18,44,45]}}', '/system/role/saveOrUpdate', '添加修改角色', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (674, '2021-05-25 13:24:32', 23, 'SystemFunctionController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemFunction\":{\"id\":45,\"name\":\"学生宿舍管理\",\"orderNum\":0,\"menuType\":\"M\",\"icon\":\"iconaccessory\",\"createTime\":{\"hour\":13,\"minute\":43,\"second\":28,\"nano\":0,\"dayOfMonth\":19,\"dayOfWeek\":\"TUESDAY\",\"dayOfYear\":19,\"month\":\"JANUARY\",\"monthValue\":1,\"year\":2021,\"chronology\":{\"id\":\"ISO\",\"calendarType\":\"iso8601\"}}}}', '/system/function/saveOrUpdate', '添加修改功能', '{\"statusCode\":200,\"msg\":\"操作成功\"}');
INSERT INTO `system_log` VALUES (675, '2021-05-25 13:24:50', 23, 'SystemFunctionController', 'saveOrUpdate', '0:0:0:0:0:0:0:1', '{\"systemFunction\":{\"id\":2,\"name\":\"系统管理\",\"orderNum\":2,\"menuType\":\"M\",\"icon\":\"iconflashlight_fill\",\"createTime\":{\"hour\":11,\"minute\":7,\"second\":14,\"nano\":0,\"dayOfMonth\":9,\"dayOfWeek\":\"WEDNESDAY\",\"dayOfYear\":344,\"month\":\"DECEMBER\",\"monthValue\":12,\"year\":2020,\"chronology\":{\"id\":\"ISO\",\"calendarType\":\"iso8601\"}}}}', '/system/function/saveOrUpdate', '添加修改功能', '{\"statusCode\":200,\"msg\":\"操作成功\"}');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '超级管理员', '2020-12-09 11:05:12');
INSERT INTO `system_role` VALUES (2, '宿管', '2021-02-04 13:58:02');
INSERT INTO `system_role` VALUES (3, '系统管理员', '2021-03-19 16:44:17');

-- ----------------------------
-- Table structure for system_role_function
-- ----------------------------
DROP TABLE IF EXISTS `system_role_function`;
CREATE TABLE `system_role_function`  (
  `role_id` bigint(20) NOT NULL,
  `function_id` bigint(20) NOT NULL,
  INDEX `fk_ff`(`role_id`) USING BTREE,
  INDEX `fk_rr`(`function_id`) USING BTREE,
  CONSTRAINT `fk_rf` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rr` FOREIGN KEY (`function_id`) REFERENCES `system_function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_function
-- ----------------------------
INSERT INTO `system_role_function` VALUES (2, 45);
INSERT INTO `system_role_function` VALUES (2, 61);
INSERT INTO `system_role_function` VALUES (2, 56);
INSERT INTO `system_role_function` VALUES (2, 51);
INSERT INTO `system_role_function` VALUES (2, 60);
INSERT INTO `system_role_function` VALUES (2, 54);
INSERT INTO `system_role_function` VALUES (2, 50);
INSERT INTO `system_role_function` VALUES (2, 59);
INSERT INTO `system_role_function` VALUES (2, 67);
INSERT INTO `system_role_function` VALUES (2, 69);
INSERT INTO `system_role_function` VALUES (2, 68);
INSERT INTO `system_role_function` VALUES (2, 70);
INSERT INTO `system_role_function` VALUES (2, 71);
INSERT INTO `system_role_function` VALUES (2, 72);
INSERT INTO `system_role_function` VALUES (2, 74);
INSERT INTO `system_role_function` VALUES (2, 73);
INSERT INTO `system_role_function` VALUES (2, 75);
INSERT INTO `system_role_function` VALUES (2, 76);
INSERT INTO `system_role_function` VALUES (2, 77);
INSERT INTO `system_role_function` VALUES (2, 78);
INSERT INTO `system_role_function` VALUES (2, 79);
INSERT INTO `system_role_function` VALUES (2, 80);
INSERT INTO `system_role_function` VALUES (2, 81);
INSERT INTO `system_role_function` VALUES (1, 2);
INSERT INTO `system_role_function` VALUES (1, 3);
INSERT INTO `system_role_function` VALUES (1, 4);
INSERT INTO `system_role_function` VALUES (1, 5);
INSERT INTO `system_role_function` VALUES (1, 6);
INSERT INTO `system_role_function` VALUES (1, 7);
INSERT INTO `system_role_function` VALUES (1, 10);
INSERT INTO `system_role_function` VALUES (1, 11);
INSERT INTO `system_role_function` VALUES (1, 12);
INSERT INTO `system_role_function` VALUES (1, 13);
INSERT INTO `system_role_function` VALUES (1, 14);
INSERT INTO `system_role_function` VALUES (1, 15);
INSERT INTO `system_role_function` VALUES (1, 16);
INSERT INTO `system_role_function` VALUES (1, 18);
INSERT INTO `system_role_function` VALUES (1, 38);
INSERT INTO `system_role_function` VALUES (1, 44);
INSERT INTO `system_role_function` VALUES (1, 45);
INSERT INTO `system_role_function` VALUES (1, 46);
INSERT INTO `system_role_function` VALUES (1, 47);
INSERT INTO `system_role_function` VALUES (1, 48);
INSERT INTO `system_role_function` VALUES (1, 49);
INSERT INTO `system_role_function` VALUES (1, 50);
INSERT INTO `system_role_function` VALUES (1, 51);
INSERT INTO `system_role_function` VALUES (1, 52);
INSERT INTO `system_role_function` VALUES (1, 53);
INSERT INTO `system_role_function` VALUES (1, 54);
INSERT INTO `system_role_function` VALUES (1, 55);
INSERT INTO `system_role_function` VALUES (1, 57);
INSERT INTO `system_role_function` VALUES (1, 58);
INSERT INTO `system_role_function` VALUES (1, 59);
INSERT INTO `system_role_function` VALUES (1, 60);
INSERT INTO `system_role_function` VALUES (1, 62);
INSERT INTO `system_role_function` VALUES (1, 63);
INSERT INTO `system_role_function` VALUES (1, 64);
INSERT INTO `system_role_function` VALUES (1, 65);
INSERT INTO `system_role_function` VALUES (1, 66);
INSERT INTO `system_role_function` VALUES (1, 67);
INSERT INTO `system_role_function` VALUES (1, 68);
INSERT INTO `system_role_function` VALUES (1, 69);
INSERT INTO `system_role_function` VALUES (1, 70);
INSERT INTO `system_role_function` VALUES (1, 71);
INSERT INTO `system_role_function` VALUES (1, 72);
INSERT INTO `system_role_function` VALUES (1, 73);
INSERT INTO `system_role_function` VALUES (1, 74);
INSERT INTO `system_role_function` VALUES (1, 75);
INSERT INTO `system_role_function` VALUES (1, 76);
INSERT INTO `system_role_function` VALUES (1, 77);
INSERT INTO `system_role_function` VALUES (1, 8);
INSERT INTO `system_role_function` VALUES (1, 78);
INSERT INTO `system_role_function` VALUES (1, 79);
INSERT INTO `system_role_function` VALUES (1, 80);
INSERT INTO `system_role_function` VALUES (1, 61);
INSERT INTO `system_role_function` VALUES (1, 81);
INSERT INTO `system_role_function` VALUES (1, 82);
INSERT INTO `system_role_function` VALUES (1, 56);
INSERT INTO `system_role_function` VALUES (3, 2);
INSERT INTO `system_role_function` VALUES (3, 66);
INSERT INTO `system_role_function` VALUES (3, 3);
INSERT INTO `system_role_function` VALUES (3, 4);
INSERT INTO `system_role_function` VALUES (3, 5);
INSERT INTO `system_role_function` VALUES (3, 38);
INSERT INTO `system_role_function` VALUES (3, 6);
INSERT INTO `system_role_function` VALUES (3, 7);
INSERT INTO `system_role_function` VALUES (3, 8);
INSERT INTO `system_role_function` VALUES (3, 14);
INSERT INTO `system_role_function` VALUES (3, 10);
INSERT INTO `system_role_function` VALUES (3, 12);
INSERT INTO `system_role_function` VALUES (3, 11);
INSERT INTO `system_role_function` VALUES (3, 13);
INSERT INTO `system_role_function` VALUES (3, 15);
INSERT INTO `system_role_function` VALUES (3, 16);
INSERT INTO `system_role_function` VALUES (3, 17);
INSERT INTO `system_role_function` VALUES (3, 18);
INSERT INTO `system_role_function` VALUES (3, 44);
INSERT INTO `system_role_function` VALUES (3, 45);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cellphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_delete` tinyint(1) NULL DEFAULT NULL,
  `leader_id` bigint(20) NULL DEFAULT NULL,
  `building_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_leader`(`leader_id`) USING BTREE,
  INDEX `fk_building`(`building_id`) USING BTREE,
  CONSTRAINT `fk_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_leader` FOREIGN KEY (`leader_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '01c8c897-a9ce-43e0-b344-827e70149849.png', '15605859283', '1246761517@qq.com', '2020-12-09 11:04:54', NULL, NULL, 1);
INSERT INTO `system_user` VALUES (23, 'xxx', 'hzvtc', 'e10adc3949ba59abbe56e057f20f883e', '01c8c897-a9ce-43e0-b344-827e70149849.png', '13757586436', '644664588@qq.com', '2021-01-08 10:23:37', NULL, 1, 1);
INSERT INTO `system_user` VALUES (24, '杨秀梅', '279a797a', 'e10adc3949ba59abbe56e057f20f883e', '8c9b05b5-6820-4a6a-82f7-eb39ee2f5ffe.png', '15601880680', '279a797a@163.com', '2021-02-04 13:56:48', NULL, 29, 19);
INSERT INTO `system_user` VALUES (25, '杨阳', '3a6a3de4', 'e10adc3949ba59abbe56e057f20f883e', 'bf796bfa-8c1f-4352-83d6-514ec6b72c1c.png', '15008762602', '3a6a3de4@163.com', '2021-02-04 13:56:48', NULL, 29, 19);
INSERT INTO `system_user` VALUES (26, '曹欣', '8cc3a7e6', 'e10adc3949ba59abbe56e057f20f883e', '721e1934-39c1-4a39-a83e-46e613acda0e.png', '13101851177', '8cc3a7e6@163.com', '2021-02-04 13:56:48', NULL, 29, 18);
INSERT INTO `system_user` VALUES (27, '蒋梅', 'f4c639a9', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13807122867', 'f4c639a9@163.com', '2021-02-04 13:56:48', NULL, 29, 18);
INSERT INTO `system_user` VALUES (28, '乔洋', '8790f28c', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13507641393', '8790f28c@163.com', '2021-02-04 13:56:48', NULL, 29, 18);
INSERT INTO `system_user` VALUES (29, '刘琴', '0b748652', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13905364198', '0b748652@163.com', '2021-02-04 13:56:48', NULL, 23, 5);
INSERT INTO `system_user` VALUES (30, '余佳', 'f1f273a5', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13502280024', 'f1f273a5@163.com', '2021-02-04 13:56:48', NULL, 36, 17);
INSERT INTO `system_user` VALUES (31, '罗雪', '9bf9479b', 'e10adc3949ba59abbe56e057f20f883e', 'ecdbb708-1eba-4342-8c22-88481a5824cc.png', '13306452919', '9bf9479b@163.com', '2021-02-04 13:56:48', NULL, 36, 17);
INSERT INTO `system_user` VALUES (32, '刘雷', '1d411751', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13302481667', '1d411751@163.com', '2021-02-04 13:56:48', NULL, 36, 16);
INSERT INTO `system_user` VALUES (33, '陈静', '486bc452', 'e10adc3949ba59abbe56e057f20f883e', NULL, '15200926421', '486bc452@163.com', '2021-02-04 13:56:48', NULL, 36, 15);
INSERT INTO `system_user` VALUES (34, '谭淑华', 'dff82c67', 'e10adc3949ba59abbe56e057f20f883e', NULL, '15904705751', 'dff82c67@163.com', '2021-02-04 13:56:48', NULL, 36, 16);
INSERT INTO `system_user` VALUES (35, '姜欢', 'b01b6d11', 'e10adc3949ba59abbe56e057f20f883e', NULL, '15107911616', 'b01b6d11@163.com', '2021-02-04 13:56:48', NULL, 36, 15);
INSERT INTO `system_user` VALUES (36, '梁建华', 'fd408852', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13304622726', 'fd408852@163.com', '2021-02-04 13:56:48', NULL, 23, 3);
INSERT INTO `system_user` VALUES (37, '刘柳', 'b7720179', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13701032337', 'b7720179@163.com', '2021-02-04 13:56:48', NULL, 43, 14);
INSERT INTO `system_user` VALUES (38, '薛建', '38562784', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13306677690', '38562784@163.com', '2021-02-04 13:56:48', NULL, 43, 13);
INSERT INTO `system_user` VALUES (39, '丁佳', '5efdaea9', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13701556776', '5efdaea9@163.com', '2021-02-04 13:56:48', NULL, 43, 13);
INSERT INTO `system_user` VALUES (40, '张岩', 'f9a38829', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13205410107', 'f9a38829@163.com', '2021-02-04 13:56:48', NULL, 43, 6);
INSERT INTO `system_user` VALUES (41, '段辉', 'fc7191ba', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13301567786', 'fc7191ba@163.com', '2021-02-04 13:56:48', NULL, 43, 14);
INSERT INTO `system_user` VALUES (42, '李文', 'cdce39ad', 'e10adc3949ba59abbe56e057f20f883e', NULL, '13002174542', 'cdce39ad@163.com', '2021-02-04 13:56:48', NULL, 43, 6);
INSERT INTO `system_user` VALUES (43, '宋欢', 'ed19eef6', 'e10adc3949ba59abbe56e057f20f883e', 'bc21e192-bc6e-4a6b-a543-d61ce4cb49b2.png', '15503930879', 'ed19eef6@163.com', '2021-02-04 13:56:48', NULL, 23, 2);
INSERT INTO `system_user` VALUES (44, '123456', 'qwert', 'e10adc3949ba59abbe56e057f20f883e', NULL, '', NULL, '2021-02-05 17:34:15', 1, NULL, 1);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  INDEX `fk_uid`(`user_id`) USING BTREE,
  INDEX `fk_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_uid` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (43, 2);
INSERT INTO `system_user_role` VALUES (42, 2);
INSERT INTO `system_user_role` VALUES (41, 2);
INSERT INTO `system_user_role` VALUES (40, 2);
INSERT INTO `system_user_role` VALUES (39, 2);
INSERT INTO `system_user_role` VALUES (38, 2);
INSERT INTO `system_user_role` VALUES (37, 2);
INSERT INTO `system_user_role` VALUES (36, 2);
INSERT INTO `system_user_role` VALUES (35, 2);
INSERT INTO `system_user_role` VALUES (34, 2);
INSERT INTO `system_user_role` VALUES (33, 2);
INSERT INTO `system_user_role` VALUES (32, 2);
INSERT INTO `system_user_role` VALUES (31, 2);
INSERT INTO `system_user_role` VALUES (30, 2);
INSERT INTO `system_user_role` VALUES (29, 2);
INSERT INTO `system_user_role` VALUES (28, 2);
INSERT INTO `system_user_role` VALUES (27, 2);
INSERT INTO `system_user_role` VALUES (26, 2);
INSERT INTO `system_user_role` VALUES (25, 2);
INSERT INTO `system_user_role` VALUES (23, 3);
INSERT INTO `system_user_role` VALUES (1, 1);
INSERT INTO `system_user_role` VALUES (24, 2);

SET FOREIGN_KEY_CHECKS = 1;
