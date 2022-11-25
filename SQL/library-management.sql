/*
 Navicat Premium Data Transfer

 Source Server         : mydb
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : library-management

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 25/11/2022 02:46:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin666', '666666', 'admin666@test.com', '2022-11-25 02:44:44', NULL, 'd5614a9a88c1532d9ff4464d9b2e3623');
INSERT INTO `admin` VALUES (2, 'admin', '77777', 'admin@test.com', '2022-11-25 02:46:12', NULL, 'd5614a9a88c1532d9ff4464d9b2e3623');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `updatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Alex', 'alex', 1, 'M', '11', 'Montreal', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (2, 'Jackson', 'jackson', 2, 'M', '12', 'Toronto', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (3, 'Nick', 'nick', 3, 'M', '13', 'Vancouver', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (4, 'Mary', 'mary', 4, 'F', '14', 'Ottawa', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (5, 'Tom', 'tom', 5, 'M', '15', 'Calgary', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (6, 'Alice', 'alice', 6, 'F', '16', 'Toronto', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (7, 'Ann', 'ann', 7, 'F', '17', 'Montreal', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (8, 'Bob', 'bob', 8, 'M', '18', 'Vancouver', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (9, 'Chris', 'chris', 9, 'M', '19', 'Vancouver', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (10, 'Nathan', 'nathan', 10, 'M', '20', 'Seattle', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (11, 'Zack', 'zack', 11, 'M', '21', 'Tokyo', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (12, 'test1', 'test1', 1, 'M', '1111111', 'Vancouver', NULL, '2022-11-24 19:49:17');
INSERT INTO `user` VALUES (13, 'test26', 'test2', 26, 'M', '66666', 'Montreal', NULL, '2022-11-24 21:05:58');
INSERT INTO `user` VALUES (16, 'test111111', '20221124c6858d4a-cb49-4742-929d-4fc851adc18c', 21, 'M', '9999999', 'Toronto', '2022-11-24 21:07:07', NULL);
INSERT INTO `user` VALUES (17, 'test7777', '20221124582128781', 7777, 'M', '77777', 'Ottawa', '2022-11-24 21:11:51', NULL);

SET FOREIGN_KEY_CHECKS = 1;
