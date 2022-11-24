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

 Date: 24/11/2022 03:50:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Alex', 'alex', 1, 'M', '12346564', 'Montreal');
INSERT INTO `user` VALUES (2, 'Jackson', 'jackson', 2, 'M', '12122211', 'Toronto');
INSERT INTO `user` VALUES (3, 'Nick', 'nick', 3, 'M', '00022222', 'Vancouver');
INSERT INTO `user` VALUES (4, 'Mary', 'mary', 4, 'F', '00001111', 'Ottawa');
INSERT INTO `user` VALUES (5, 'Tom', 'tom', 5, 'M', '1', 'Calgary');
INSERT INTO `user` VALUES (6, 'Alice', 'alice', 6, 'F', NULL, 'Toronto');
INSERT INTO `user` VALUES (7, 'Ann', 'ann', 7, 'F', NULL, 'Montreal');
INSERT INTO `user` VALUES (8, 'Bob', 'bob', 8, 'M', NULL, 'Vancouver');
INSERT INTO `user` VALUES (9, 'Chris', 'chris', 9, 'M', NULL, 'Vancouver');
INSERT INTO `user` VALUES (10, 'Nathan', 'nathan', 10, 'M', NULL, 'Seattle');
INSERT INTO `user` VALUES (11, 'Zack', 'zack', 11, 'M', NULL, 'Tokyo');

SET FOREIGN_KEY_CHECKS = 1;
