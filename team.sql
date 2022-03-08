/*
 Navicat Premium Data Transfer

 Source Server         : mesrobyan77
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : team

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 07/03/2022 22:23:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for urls
-- ----------------------------
DROP TABLE IF EXISTS `urls`;
CREATE TABLE `urls`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of urls
-- ----------------------------
INSERT INTO `urls` VALUES (2, 'https://facebook.com', '2022-03-05 19:31:07', '2022-03-05 19:31:07');
INSERT INTO `urls` VALUES (3, 'https://www.google.com/', '2022-03-05 19:35:46', '2022-03-05 19:35:46');
INSERT INTO `urls` VALUES (4, 'https://www.youtube.com/', '2022-03-05 19:35:55', '2022-03-05 19:35:55');
INSERT INTO `urls` VALUES (5, 'https://web.telegram.org', '2022-03-05 19:36:13', '2022-03-05 19:36:13');
INSERT INTO `urls` VALUES (6, 'https://www.instagram.com/', '2022-03-05 19:36:41', '2022-03-05 19:36:41');
INSERT INTO `urls` VALUES (7, 'https://www.viber.com', '2022-03-05 19:36:58', '2022-03-05 19:36:58');
INSERT INTO `urls` VALUES (8, 'https://www.whatsapp.com', '2022-03-05 19:37:17', '2022-03-05 19:37:17');
INSERT INTO `urls` VALUES (9, 'facebook.com', '2022-03-05 19:37:41', '2022-03-05 19:37:41');
INSERT INTO `urls` VALUES (10, 'https://tinder.com/ru', '2022-03-05 19:38:07', '2022-03-05 19:38:07');
INSERT INTO `urls` VALUES (11, 'https://ok.ru/', '2022-03-05 19:38:20', '2022-03-05 19:38:20');
INSERT INTO `urls` VALUES (12, 'https://vk.com/', '2022-03-05 19:38:43', '2022-03-05 19:38:43');
INSERT INTO `urls` VALUES (13, 'https://mail.ru/', '2022-03-05 19:38:54', '2022-03-05 19:38:54');

-- ----------------------------
-- Table structure for votings
-- ----------------------------
DROP TABLE IF EXISTS `votings`;
CREATE TABLE `votings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `like` int(11) NULL DEFAULT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  `urlId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `urlId`(`urlId`) USING BTREE,
  CONSTRAINT `votings_ibfk_1` FOREIGN KEY (`urlId`) REFERENCES `urls` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of votings
-- ----------------------------
INSERT INTO `votings` VALUES (1, 4, '0000-00-00 00:00:00', '2022-03-05 20:24:21', 13);
INSERT INTO `votings` VALUES (7, 2, '2022-03-05 20:29:00', '2022-03-05 20:29:13', 5);

SET FOREIGN_KEY_CHECKS = 1;
