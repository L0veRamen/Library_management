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

 Date: 29/11/2022 22:33:55
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
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_key`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin666', '666666', 'admin666@test.com', '2022-11-25 23:27:42', NULL, 'b4ed7cf93b3fc26ad12af78be9d04a8e', 1);
INSERT INTO `admin` VALUES (2, 'admin', '77777', 'admin@test.com', '2022-11-25 23:27:44', NULL, 'd5614a9a88c1532d9ff4464d9b2e3623', 1);
INSERT INTO `admin` VALUES (3, 'test123', '999999', 'test123@test.com', '2022-11-25 23:36:33', '2022-11-25 23:36:34', 'd5614a9a88c1532d9ff4464d9b2e3623', 1);
INSERT INTO `admin` VALUES (4, 'test111', '11111', 'test111@gmail.com', '2022-11-25 23:41:54', NULL, 'd5614a9a88c1532d9ff4464d9b2e3623', 1);
INSERT INTO `admin` VALUES (5, 'test222', '222222222', 'test222@test.com', '2022-11-25 23:59:37', '2022-11-25 23:59:38', 'd5614a9a88c1532d9ff4464d9b2e3623', 1);
INSERT INTO `admin` VALUES (8, 'test333', '11111111', 'test333@test.com', '2022-11-29 19:36:42', '2022-11-29 19:36:42', 'd5614a9a88c1532d9ff4464d9b2e3623', 1);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `favourite` tinyint(1) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `author` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'test1', 'test1', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test', 'test', 'Science Fiction', NULL, '2022-11-29 19:30:43', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (2, 'test2', 'test2', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2', 'test2', 'Fantasy', NULL, '2022-11-29 19:46:14', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (3, 'Harry potter 1', 'Harry potter 1', 0, 'https://m.media-amazon.com/images/I/5165He67NEL.jpg', 'Rolin', 'phoneix', 'Novel', '123', '2022-11-29 20:12:43', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (6, 'test1111111', 'test121221212', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test121', 'test1222', 'Comic', NULL, '2022-11-29 22:17:45', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (7, 'test2222', 'test2222', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2222', 'test2222', 'Comic', NULL, '2022-11-29 22:20:02', '2022-11-29 00:00:00');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'comment',
  `pid` int(11) NULL DEFAULT NULL COMMENT 'parent id',
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, 'Fiction', 'Fiction', NULL, '2022-11-26 19:50:55', NULL);
INSERT INTO `category` VALUES (3, 'Non-Fiction', NULL, NULL, '2022-11-29 20:42:25', '2022-11-29 00:00:00');
INSERT INTO `category` VALUES (4, 'Novel', NULL, NULL, '2022-11-29 20:43:07', NULL);
INSERT INTO `category` VALUES (5, 'Science Fiction', NULL, NULL, '2022-11-29 20:43:19', NULL);
INSERT INTO `category` VALUES (6, 'Adventure', NULL, NULL, '2022-11-29 20:43:41', NULL);
INSERT INTO `category` VALUES (7, 'Comic', NULL, NULL, '2022-11-29 20:43:54', NULL);
INSERT INTO `category` VALUES (8, 'Fantasy', NULL, NULL, '2022-11-29 20:44:07', '2022-11-29 00:00:00');

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
