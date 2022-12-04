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

 Date: 02/12/2022 12:25:26
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
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'test1', 'test1', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test', 'test', 'Sci-Fiction', NULL, '2022-11-29 19:30:43', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (2, 'test2', 'test2', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2', 'test2', 'Fantasy', NULL, '2022-11-29 19:46:14', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (3, 'Harry potter 1', 'Harry potter 1', 0, 'https://m.media-amazon.com/images/I/5165He67NEL.jpg', 'Rolin', 'phoneix', 'Novel', '123', '2022-11-29 20:12:43', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (6, 'test1111111', 'test121221212', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test121', 'test1222', 'Fiction', NULL, '2022-11-29 22:17:45', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (7, 'test2222', 'test2222', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2222', 'test2222', 'Fiction', NULL, '2022-11-29 22:20:02', '2022-11-29 00:00:00');
INSERT INTO `book` VALUES (11, 'test888', 'test888', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test888', 'test888', 'Sci-Fiction', '', '2022-11-30 01:17:27', NULL);
INSERT INTO `book` VALUES (14, 'why777', 'why777', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'why777', 'why777', 'Adventure', NULL, '2022-11-30 01:36:34', NULL);
INSERT INTO `book` VALUES (15, 'test996', 'test996', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', 'test996', '2022-11-30 09:29:58', NULL);
INSERT INTO `book` VALUES (16, 'test996', 'test996', 1, 'https://dw9to29mmj727.cloudfront.net/properties/2016/371-SeriesThumbnails_MHA__400x320.jpg', 'test996', 'test996', 'Adventure', NULL, '2022-11-30 09:33:41', '2022-11-30 00:00:00');
INSERT INTO `book` VALUES (17, 'test123', 'test123', 0, 'https://dw9to29mmj727.cloudfront.net/properties/2016/371-SeriesThumbnails_MHA__400x320.jpg', 'test123', 'test123', 'Fantasy', NULL, '2022-11-30 11:22:25', NULL);
INSERT INTO `book` VALUES (18, 'test1111', 'test1111', 0, 'https://dw9to29mmj727.cloudfront.net/promo/2016/6408-image006.jpg', 'test1111', 'test1111', 'Sci-Fiction', NULL, '2022-11-30 11:22:25', NULL);
INSERT INTO `book` VALUES (19, 'Carrie Soto Is Back', 'Taylor Jenkins Reid is the New York Times bestselling author of eight novels, including Malibu Rising, Daisy Jones & The Six, and The Seven Husbands of Evelyn Hugo. She lives in Los Angeles with her husband and their daughter. --This text refers to the paperback edition.', 0, 'https://m.media-amazon.com/images/I/51W5Kgv0MgL._SY346_.jpg', 'Taylor Jenkins Reid', 'Kindle', 'Novel', NULL, '2022-11-30 11:23:57', NULL);
INSERT INTO `book` VALUES (20, 'Lessons in Chemistry', 'NEW YORK TIMES BESTSELLER • GOOD MORNING AMERICA BOOK CLUB PICK • ONE OF THE MOST ANTICIPATED BOOKS OF THE YEAR—New York Times, Bustle, Real Simple, Parade, CNN, Today, E! News, Library Journal', 0, 'https://m.media-amazon.com/images/I/71BpcOa1eeL._AC_UL320_.jpg', 'Bonnie Garmus ', 'Kindle', 'Fiction', NULL, '2022-11-30 11:27:40', NULL);
INSERT INTO `book` VALUES (21, 'Demon Copperhead: A Novel', 'Demon is a voice for the ages—akin to Huck Finn or Holden Caulfield—only even more resilient. I’m crazy about this book, which parses the epidemic in a beautiful and intimate new way. I think it’s her best.” — Beth Macy, author of Dopesick\r\n\"Demon is a voice for the ages—akin to Huck Finn or Holden Caulfield—only even more resilient. I’m crazy about this book, which parses the epidemic in a beautiful and intimate new way. I think it’s her best.” — Beth Macy, author of Dopesick\r\n', 0, 'https://m.media-amazon.com/images/I/91mP0HKLEwL._AC_UL320_.jpg', 'Barbara Kingsolver', 'Kindle', 'Novel', NULL, '2022-11-30 11:29:55', NULL);
INSERT INTO `book` VALUES (22, 'Fairy Tale', 'Stephen King --This text refers to the audioCD edition.', 0, 'https://m.media-amazon.com/images/I/81blQfKsLtL._AC_UL320_.jpg', 'Stephen King', 'Kindle', 'Fiction', NULL, '2022-11-30 11:30:37', NULL);
INSERT INTO `book` VALUES (23, 'Our Missing Hearts: A Novel', 'CELESTE NG grew up in Pittsburgh, Pennsylvania, and Shaker Heights, Ohio. She attended Harvard University and earned an MFA from the University of Michigan. She lives in Cambridge, Massachusetts, with her husband and son. She is the author of Everything I Never Told You, Little Fires Everywhere, and Our Missing Hearts. --This text refers to the hardcover edition.', 0, 'https://m.media-amazon.com/images/I/81xQjuzayAL._AC_UL320_.jpg', 'Celeste Ng', 'Kindle', 'Novel', NULL, '2022-11-30 11:31:57', NULL);
INSERT INTO `book` VALUES (24, 'Tomorrow, and Tomorrow, and Tomorrow: A novel', 'GABRIELLE ZEVIN is an internationally bestselling and critically acclaimed author whose books have been translated into thirty-eight languages. Her eighth novel, The Storied Life of A.J. Fikry, spent several months on the New York Times bestseller list, was a USA Today bestseller, and has been a bestseller all around the world. She has also written books for children and young adults, including the award-winning Elsewhere. She lives in Los Angeles. --This text refers to the hardcover edition.', 0, 'https://m.media-amazon.com/images/I/71duwitbLBL._AC_UL320_.jpg', 'Gabrielle Zevin', 'Kindle', 'Adventure', NULL, '2022-11-30 11:32:27', NULL);
INSERT INTO `book` VALUES (25, 'Horse', 'Geraldine Brooks is the author of the Pulitzer Prize-winning novel March and the international bestsellers The Secret Chord, Caleb’s Crossing, People of the Book, and Year of Wonders. She has also written the acclaimed nonfiction works Nine Parts of Desire and Foreign Correspondence. Born and raised in Australia, Brooks lives in Massachusetts. \r\n  --This text refers to an alternate kindle_edition edition.', 0, 'https://m.media-amazon.com/images/I/81P0W3YcvXL._AC_UL320_.jpg', 'Geraldine Brooks', 'Kindle', 'Novel', NULL, '2022-11-30 11:33:41', NULL);
INSERT INTO `book` VALUES (26, 'DEMON SLAYER', 'Tanjiro sets out on the path of the Demon Slayer to save his sister and avenge his family!', 1, 'https://dw9to29mmj727.cloudfront.net/properties/2016/1880-SeriesThumbnailsManga_DemonSlayer_400x320.jpg', 'Koyoharu Gotouge |', 'Shonen Jump', 'Comic', NULL, '2022-11-30 11:34:55', NULL);
INSERT INTO `book` VALUES (27, 'ONE-PUNCH MAN', 'Life gets pretty boring when you can beat the snot out of any villain with just one punch.', 1, 'https://dw9to29mmj727.cloudfront.net/properties/2016/527-SeriesThumb_OPM_400x320.jpg', 'Yusuke Murata', 'Shonen Jump', 'Comic', NULL, '2022-11-30 11:35:34', NULL);
INSERT INTO `book` VALUES (28, 'CHAINSAW MAN', 'Broke young man + chainsaw demon = Chainsaw Man', 1, 'https://dwgkfo5b3odmw.cloudfront.net/img/manga_series_link_img/580-th-WSJ_Chainsaw_400x320.jpg', 'Tatsuki Fujimoto', 'Shonen Jump', 'Comic', NULL, '2022-11-30 11:36:21', NULL);
INSERT INTO `book` VALUES (29, 'A Game of Thrones', '\'In the grand epic fantasy tradition, Martin is by far the best ... tense, surging, insomnia-inflicting\' Time Magazine \'The sheer mind-boggling scope of this epic has sent other fantasy writers away shaking their heads ...', 1, 'https://m.media-amazon.com/images/I/51Sc9+dTqDL.jpg', 'George R. R. Martin', 'Amazon', 'Kindle', NULL, '2022-11-30 11:45:25', NULL);
INSERT INTO `book` VALUES (30, 'MY HERO ACADEMIA', 'Midoriya inherits the superpower of the world’s greatest hero, but greatness won’t come easy.', 1, 'https://dw9to29mmj727.cloudfront.net/properties/2016/371-SeriesThumbnails_MHA__400x320.jpg', 'Kohei Horikoshi', 'Shonen Jump', 'Comic', NULL, '2022-11-30 11:49:31', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
-- Table structure for favourite
-- ----------------------------
DROP TABLE IF EXISTS `favourite`;
CREATE TABLE `favourite`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favourite
-- ----------------------------
INSERT INTO `favourite` VALUES (1, 'test1', 'test1', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test', 'test', 'Science Fiction', NULL, '2022-11-29 19:30:43', '2022-11-29 00:00:00');
INSERT INTO `favourite` VALUES (2, 'test2', 'test2', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2', 'test2', 'Fantasy', NULL, '2022-11-29 19:46:14', '2022-11-29 00:00:00');
INSERT INTO `favourite` VALUES (3, 'Harry potter 1', 'Harry potter 1', 1, 'https://m.media-amazon.com/images/I/5165He67NEL.jpg', 'Rolin', 'phoneix', 'Novel', '123', '2022-11-29 20:12:43', '2022-11-29 00:00:00');
INSERT INTO `favourite` VALUES (6, 'test1111111', 'test121221212', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test121', 'test1222', 'Comic', NULL, '2022-11-29 22:17:45', '2022-11-29 00:00:00');
INSERT INTO `favourite` VALUES (7, 'test2222', 'test2222', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2222', 'test2222', 'Comic', NULL, '2022-11-29 22:20:02', '2022-11-29 00:00:00');
INSERT INTO `favourite` VALUES (11, 'test888', 'test888', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test888', 'test888', 'Comic', '', '2022-11-30 01:17:27', NULL);
INSERT INTO `favourite` VALUES (14, 'why777', 'why777', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'why777', 'why777', 'Comic', NULL, '2022-11-30 01:36:34', NULL);
INSERT INTO `favourite` VALUES (15, 'test996', 'test996', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', 'test996', '2022-11-30 09:29:58', NULL);
INSERT INTO `favourite` VALUES (16, 'test996', 'test996', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', NULL, '2022-11-30 09:33:41', '2022-11-30 00:00:00');

-- ----------------------------
-- Table structure for read
-- ----------------------------
DROP TABLE IF EXISTS `read`;
CREATE TABLE `read`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `favourite` tinyint(1) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of read
-- ----------------------------
INSERT INTO `read` VALUES (1, 'test1', 'test1', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test', 'test', 'Science Fiction', NULL, '2022-11-29 19:30:43', '2022-11-29 00:00:00');
INSERT INTO `read` VALUES (2, 'test2', 'test2', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2', 'test2', 'Fantasy', NULL, '2022-11-29 19:46:14', '2022-11-29 00:00:00');
INSERT INTO `read` VALUES (3, 'Harry potter 1', 'Harry potter 1', 0, 'https://m.media-amazon.com/images/I/5165He67NEL.jpg', 'Rolin', 'phoneix', 'Novel', '123', '2022-11-29 20:12:43', '2022-11-29 00:00:00');
INSERT INTO `read` VALUES (6, 'test1111111', 'test121221212', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test121', 'test1222', 'Comic', NULL, '2022-11-29 22:17:45', '2022-11-29 00:00:00');
INSERT INTO `read` VALUES (7, 'test2222', 'test2222', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2222', 'test2222', 'Comic', NULL, '2022-11-29 22:20:02', '2022-11-29 00:00:00');
INSERT INTO `read` VALUES (11, 'test888', 'test888', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test888', 'test888', 'Comic', '', '2022-11-30 01:17:27', NULL);
INSERT INTO `read` VALUES (14, 'why777', 'why777', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'why777', 'why777', 'Comic', NULL, '2022-11-30 01:36:34', NULL);
INSERT INTO `read` VALUES (15, 'test996', 'test996', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', 'test996', '2022-11-30 09:29:58', NULL);
INSERT INTO `read` VALUES (16, 'test996', 'test996', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', NULL, '2022-11-30 09:33:41', '2022-11-30 00:00:00');

-- ----------------------------
-- Table structure for reading
-- ----------------------------
DROP TABLE IF EXISTS `reading`;
CREATE TABLE `reading`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `favourite` tinyint(1) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reading
-- ----------------------------
INSERT INTO `reading` VALUES (1, 'test1', 'test1', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test', 'test', 'Science Fiction', NULL, '2022-11-29 19:30:43', '2022-11-29 00:00:00');
INSERT INTO `reading` VALUES (2, 'test2', 'test2', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2', 'test2', 'Fantasy', NULL, '2022-11-29 19:46:14', '2022-11-29 00:00:00');
INSERT INTO `reading` VALUES (3, 'Harry potter 1', 'Harry potter 1', 0, 'https://m.media-amazon.com/images/I/5165He67NEL.jpg', 'Rolin', 'phoneix', 'Novel', '123', '2022-11-29 20:12:43', '2022-11-29 00:00:00');
INSERT INTO `reading` VALUES (6, 'test1111111', 'test121221212', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test121', 'test1222', 'Comic', NULL, '2022-11-29 22:17:45', '2022-11-29 00:00:00');
INSERT INTO `reading` VALUES (7, 'test2222', 'test2222', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2222', 'test2222', 'Comic', NULL, '2022-11-29 22:20:02', '2022-11-29 00:00:00');
INSERT INTO `reading` VALUES (11, 'test888', 'test888', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test888', 'test888', 'Comic', '', '2022-11-30 01:17:27', NULL);
INSERT INTO `reading` VALUES (14, 'why777', 'why777', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'why777', 'why777', 'Comic', NULL, '2022-11-30 01:36:34', NULL);
INSERT INTO `reading` VALUES (15, 'test996', 'test996', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', 'test996', '2022-11-30 09:29:58', NULL);
INSERT INTO `reading` VALUES (16, 'test996', 'test996', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', NULL, '2022-11-30 09:33:41', '2022-11-30 00:00:00');

-- ----------------------------
-- Table structure for recommendation
-- ----------------------------
DROP TABLE IF EXISTS `recommendation`;
CREATE TABLE `recommendation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `favourite` tinyint(1) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommendation
-- ----------------------------
INSERT INTO `recommendation` VALUES (1, 'test1', 'test1', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test', 'test', 'Science Fiction', NULL, '2022-11-29 19:30:43', '2022-11-29 00:00:00');
INSERT INTO `recommendation` VALUES (2, 'test2', 'test2', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2', 'test2', 'Fantasy', NULL, '2022-11-29 19:46:14', '2022-11-29 00:00:00');
INSERT INTO `recommendation` VALUES (3, 'Harry potter 1', 'Harry potter 1', 0, 'https://m.media-amazon.com/images/I/5165He67NEL.jpg', 'Rolin', 'phoneix', 'Novel', '123', '2022-11-29 20:12:43', '2022-11-29 00:00:00');
INSERT INTO `recommendation` VALUES (6, 'test1111111', 'test121221212', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test121', 'test1222', 'Comic', NULL, '2022-11-29 22:17:45', '2022-11-29 00:00:00');
INSERT INTO `recommendation` VALUES (7, 'test2222', 'test2222', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2222', 'test2222', 'Comic', NULL, '2022-11-29 22:20:02', '2022-11-29 00:00:00');
INSERT INTO `recommendation` VALUES (11, 'test888', 'test888', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test888', 'test888', 'Comic', '', '2022-11-30 01:17:27', NULL);
INSERT INTO `recommendation` VALUES (14, 'why777', 'why777', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'why777', 'why777', 'Novel', NULL, '2022-11-30 01:36:34', NULL);
INSERT INTO `recommendation` VALUES (15, 'test996', 'test996', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', 'test996', '2022-11-30 09:29:58', NULL);
INSERT INTO `recommendation` VALUES (16, 'test996', 'test996', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', NULL, '2022-11-30 09:33:41', '2022-11-30 00:00:00');

-- ----------------------------
-- Table structure for toread
-- ----------------------------
DROP TABLE IF EXISTS `toread`;
CREATE TABLE `toread`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `favourite` tinyint(1) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of toread
-- ----------------------------
INSERT INTO `toread` VALUES (1, 'test1', 'test1', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test', 'test', 'Science Fiction', NULL, '2022-11-29 19:30:43', '2022-11-29 00:00:00');
INSERT INTO `toread` VALUES (2, 'test2', 'test2', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2', 'test2', 'Fantasy', NULL, '2022-11-29 19:46:14', '2022-11-29 00:00:00');
INSERT INTO `toread` VALUES (3, 'Harry potter 1', 'Harry potter 1', 0, 'https://m.media-amazon.com/images/I/5165He67NEL.jpg', 'Rolin', 'phoneix', 'Novel', '123', '2022-11-29 20:12:43', '2022-11-29 00:00:00');
INSERT INTO `toread` VALUES (6, 'test1111111', 'test121221212', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test121', 'test1222', 'Comic', NULL, '2022-11-29 22:17:45', '2022-11-29 00:00:00');
INSERT INTO `toread` VALUES (7, 'test2222', 'test2222', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test2222', 'test2222', 'Comic', NULL, '2022-11-29 22:20:02', '2022-11-29 00:00:00');
INSERT INTO `toread` VALUES (11, 'test888', 'test888', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test888', 'test888', 'Comic', '', '2022-11-30 01:17:27', NULL);
INSERT INTO `toread` VALUES (14, 'why777', 'why777', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'why777', 'why777', 'Comic', NULL, '2022-11-30 01:36:34', NULL);
INSERT INTO `toread` VALUES (15, 'test996', 'test996', 0, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', 'test996', '2022-11-30 09:29:58', NULL);
INSERT INTO `toread` VALUES (16, 'test996', 'test996', 1, 'https://edit.org/photos/images/cat/book-covers-big-2019101610.jpg-1300.jpg', 'test996', 'test996', 'Adventure', NULL, '2022-11-30 09:33:41', '2022-11-30 00:00:00');
INSERT INTO `toread` VALUES (19, 'Carrie Soto Is Back', 'Taylor Jenkins Reid is the New York Times bestselling author of eight novels, including Malibu Rising, Daisy Jones & The Six, and The Seven Husbands of Evelyn Hugo. She lives in Los Angeles with her husband and their daughter. --This text refers to the paperback edition.', 0, 'https://m.media-amazon.com/images/I/51W5Kgv0MgL._SY346_.jpg', 'Taylor Jenkins Reid', 'Kindle', 'Novel', NULL, '2022-11-30 11:23:57', NULL);
INSERT INTO `toread` VALUES (20, 'Lessons in Chemistry', 'NEW YORK TIMES BESTSELLER • GOOD MORNING AMERICA BOOK CLUB PICK • ONE OF THE MOST ANTICIPATED BOOKS OF THE YEAR—New York Times, Bustle, Real Simple, Parade, CNN, Today, E! News, Library Journal', 0, 'https://m.media-amazon.com/images/I/71BpcOa1eeL._AC_UL320_.jpg', 'Bonnie Garmus ', 'Kindle', 'Fiction', NULL, '2022-11-30 11:27:40', NULL);
INSERT INTO `toread` VALUES (21, 'Demon Copperhead: A Novel', 'Demon is a voice for the ages—akin to Huck Finn or Holden Caulfield—only even more resilient. I’m crazy about this book, which parses the epidemic in a beautiful and intimate new way. I think it’s her best.” — Beth Macy, author of Dopesick\r\n\"Demon is a voice for the ages—akin to Huck Finn or Holden Caulfield—only even more resilient. I’m crazy about this book, which parses the epidemic in a beautiful and intimate new way. I think it’s her best.” — Beth Macy, author of Dopesick\r\n', 0, 'https://m.media-amazon.com/images/I/91mP0HKLEwL._AC_UL320_.jpg', 'Barbara Kingsolver', 'Kindle', 'Novel', NULL, '2022-11-30 11:29:55', NULL);
INSERT INTO `toread` VALUES (22, 'Fairy Tale', 'Stephen King --This text refers to the audioCD edition.', 0, 'https://m.media-amazon.com/images/I/81blQfKsLtL._AC_UL320_.jpg', 'Stephen King', 'Kindle', 'Fiction', NULL, '2022-11-30 11:30:37', NULL);
INSERT INTO `toread` VALUES (23, 'Our Missing Hearts: A Novel', 'CELESTE NG grew up in Pittsburgh, Pennsylvania, and Shaker Heights, Ohio. She attended Harvard University and earned an MFA from the University of Michigan. She lives in Cambridge, Massachusetts, with her husband and son. She is the author of Everything I Never Told You, Little Fires Everywhere, and Our Missing Hearts. --This text refers to the hardcover edition.', 0, 'https://m.media-amazon.com/images/I/81xQjuzayAL._AC_UL320_.jpg', 'Celeste Ng', 'Kindle', 'Novel', NULL, '2022-11-30 11:31:57', NULL);
INSERT INTO `toread` VALUES (24, 'Tomorrow, and Tomorrow, and Tomorrow: A novel', 'GABRIELLE ZEVIN is an internationally bestselling and critically acclaimed author whose books have been translated into thirty-eight languages. Her eighth novel, The Storied Life of A.J. Fikry, spent several months on the New York Times bestseller list, was a USA Today bestseller, and has been a bestseller all around the world. She has also written books for children and young adults, including the award-winning Elsewhere. She lives in Los Angeles. --This text refers to the hardcover edition.', 0, 'https://m.media-amazon.com/images/I/71duwitbLBL._AC_UL320_.jpg', 'Gabrielle Zevin', 'Kindle', 'Adventure', NULL, '2022-11-30 11:32:27', NULL);
INSERT INTO `toread` VALUES (25, 'Horse', 'Geraldine Brooks is the author of the Pulitzer Prize-winning novel March and the international bestsellers The Secret Chord, Caleb’s Crossing, People of the Book, and Year of Wonders. She has also written the acclaimed nonfiction works Nine Parts of Desire and Foreign Correspondence. Born and raised in Australia, Brooks lives in Massachusetts. \r\n  --This text refers to an alternate kindle_edition edition.', 0, 'https://m.media-amazon.com/images/I/81P0W3YcvXL._AC_UL320_.jpg', 'Geraldine Brooks', 'Kindle', 'Novel', NULL, '2022-11-30 11:33:41', NULL);
INSERT INTO `toread` VALUES (26, 'DEMON SLAYER', 'Tanjiro sets out on the path of the Demon Slayer to save his sister and avenge his family!', 1, 'https://dw9to29mmj727.cloudfront.net/properties/2016/1880-SeriesThumbnailsManga_DemonSlayer_400x320.jpg', 'Koyoharu Gotouge |', 'Shonen Jump', 'Comic', NULL, '2022-11-30 11:34:55', NULL);
INSERT INTO `toread` VALUES (27, 'ONE-PUNCH MAN', 'Life gets pretty boring when you can beat the snot out of any villain with just one punch.', 1, 'https://dw9to29mmj727.cloudfront.net/properties/2016/527-SeriesThumb_OPM_400x320.jpg', 'Yusuke Murata', 'Shonen Jump', 'Comic', NULL, '2022-11-30 11:35:34', NULL);
INSERT INTO `toread` VALUES (28, 'CHAINSAW MAN', 'Broke young man + chainsaw demon = Chainsaw Man', 1, 'https://dwgkfo5b3odmw.cloudfront.net/img/manga_series_link_img/580-th-WSJ_Chainsaw_400x320.jpg', 'Tatsuki Fujimoto', 'Shonen Jump', 'Comic', NULL, '2022-11-30 11:36:21', NULL);
INSERT INTO `toread` VALUES (29, 'A Game of Thrones', '\'In the grand epic fantasy tradition, Martin is by far the best ... tense, surging, insomnia-inflicting\' Time Magazine \'The sheer mind-boggling scope of this epic has sent other fantasy writers away shaking their heads ...', 1, 'https://m.media-amazon.com/images/I/51Sc9+dTqDL.jpg', 'George R. R. Martin', 'Amazon', 'Kindle', NULL, '2022-11-30 11:45:25', NULL);
INSERT INTO `toread` VALUES (30, 'MY HERO ACADEMIA', 'Midoriya inherits the superpower of the world’s greatest hero, but greatness won’t come easy.', 1, 'https://dw9to29mmj727.cloudfront.net/properties/2016/371-SeriesThumbnails_MHA__400x320.jpg', 'Kohei Horikoshi', 'Shonen Jump', 'Comic', NULL, '2022-11-30 11:49:31', NULL);

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
