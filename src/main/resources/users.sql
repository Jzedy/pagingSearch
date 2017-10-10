/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : mybatis

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-10-10 11:01:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'name1', '1', '青岛市');
INSERT INTO `users` VALUES ('2', 'name2', '2', '青岛市');
INSERT INTO `users` VALUES ('3', 'name3', '1', '青岛市');
INSERT INTO `users` VALUES ('4', 'name4', '2', '青岛市');
INSERT INTO `users` VALUES ('5', 'name5', '1', '青岛市');
INSERT INTO `users` VALUES ('6', 'name6', '2', '青岛市');
INSERT INTO `users` VALUES ('7', 'name7', '2', '青岛市');
INSERT INTO `users` VALUES ('8', 'name8', '1', '青岛市');
INSERT INTO `users` VALUES ('9', 'name9', '2', '青岛市');
INSERT INTO `users` VALUES ('10', 'name10', '2', '青岛市');
INSERT INTO `users` VALUES ('11', 'name11', '2', '青岛市');
INSERT INTO `users` VALUES ('12', 'name12', '1', '青岛市');
INSERT INTO `users` VALUES ('13', 'name13', '2', '青岛市');
INSERT INTO `users` VALUES ('14', 'name14', '2', '青岛市');
INSERT INTO `users` VALUES ('15', 'name15', '2', '青岛市');
INSERT INTO `users` VALUES ('16', 'name16', '1', '青岛市');
INSERT INTO `users` VALUES ('17', 'name17', '2', '青岛市');
INSERT INTO `users` VALUES ('18', 'name18', '2', '青岛市');
INSERT INTO `users` VALUES ('19', 'name19', '2', '青岛市');
INSERT INTO `users` VALUES ('20', 'name20', '2', '青岛市');
INSERT INTO `users` VALUES ('21', 'name21', '1', '青岛市');
INSERT INTO `users` VALUES ('22', 'name22', '2', '青岛市');
INSERT INTO `users` VALUES ('23', 'name23', '1', '青岛市');
INSERT INTO `users` VALUES ('24', 'name24', '2', '青岛市');
INSERT INTO `users` VALUES ('25', 'name25', '2', '青岛市');
INSERT INTO `users` VALUES ('26', 'name26', '1', '青岛市');
INSERT INTO `users` VALUES ('27', 'name27', '2', '青岛市');
INSERT INTO `users` VALUES ('28', 'name28', '2', '青岛市');
INSERT INTO `users` VALUES ('29', 'name29', '1', '青岛市');
INSERT INTO `users` VALUES ('30', 'name30', '2', '青岛市');
INSERT INTO `users` VALUES ('31', 'name31', '2', '青岛市');
INSERT INTO `users` VALUES ('32', 'name32', '1', '青岛市');
INSERT INTO `users` VALUES ('33', 'name33', '2', '青岛市');
INSERT INTO `users` VALUES ('34', 'name34', '1', '青岛市');
INSERT INTO `users` VALUES ('35', 'name35', '1', '青岛市');
INSERT INTO `users` VALUES ('36', 'name36', '2', '青岛市');
INSERT INTO `users` VALUES ('37', 'name37', '1', '青岛市');
INSERT INTO `users` VALUES ('38', 'name38', '2', '青岛市');
INSERT INTO `users` VALUES ('39', 'name39', '1', '青岛市');
INSERT INTO `users` VALUES ('40', 'name40', '1', '青岛市');
INSERT INTO `users` VALUES ('41', 'name41', '2', '青岛市');
INSERT INTO `users` VALUES ('42', 'name42', '1', '青岛市');
INSERT INTO `users` VALUES ('43', 'name43', '1', '青岛市');
INSERT INTO `users` VALUES ('44', 'name44', '1', '青岛市');
INSERT INTO `users` VALUES ('45', 'name45', '2', '青岛市');
INSERT INTO `users` VALUES ('46', 'name46', '1', '青岛市');
INSERT INTO `users` VALUES ('47', 'name47', '1', '青岛市');
INSERT INTO `users` VALUES ('48', 'name48', '1', '青岛市');
INSERT INTO `users` VALUES ('49', 'name49', '1', '青岛市');
INSERT INTO `users` VALUES ('50', 'name50', '1', '青岛市');
INSERT INTO `users` VALUES ('51', 'name51', '2', '青岛市');
INSERT INTO `users` VALUES ('52', 'name52', '1', '青岛市');
INSERT INTO `users` VALUES ('53', 'name53', '1', '青岛市');
INSERT INTO `users` VALUES ('54', 'name54', '2', '青岛市');
INSERT INTO `users` VALUES ('55', 'name55', '1', '青岛市');
INSERT INTO `users` VALUES ('56', 'name56', '1', '青岛市');
INSERT INTO `users` VALUES ('57', 'name57', '2', '青岛市');
INSERT INTO `users` VALUES ('58', 'name58', '1', '青岛市');
INSERT INTO `users` VALUES ('59', 'name59', '1', '青岛市');
INSERT INTO `users` VALUES ('60', 'name60', '1', '青岛市');
INSERT INTO `users` VALUES ('61', 'name61', '1', '青岛市');
INSERT INTO `users` VALUES ('62', 'name62', '1', '青岛市');
INSERT INTO `users` VALUES ('63', 'name63', '2', '青岛市');
INSERT INTO `users` VALUES ('64', 'name64', '1', '青岛市');
INSERT INTO `users` VALUES ('65', 'name65', '1', '青岛市');
INSERT INTO `users` VALUES ('66', 'name66', '1', '青岛市');
INSERT INTO `users` VALUES ('67', 'name67', '2', '青岛市');
INSERT INTO `users` VALUES ('68', 'name68', '1', '青岛市');
INSERT INTO `users` VALUES ('69', 'name69', '1', '青岛市');
INSERT INTO `users` VALUES ('70', 'name70', '2', '青岛市');
INSERT INTO `users` VALUES ('71', 'name71', '1', '青岛市');
INSERT INTO `users` VALUES ('72', 'name72', '1', '青岛市');
INSERT INTO `users` VALUES ('73', 'name73', '1', '青岛市');
INSERT INTO `users` VALUES ('74', 'name74', '2', '青岛市');
INSERT INTO `users` VALUES ('75', 'name75', '1', '青岛市');
INSERT INTO `users` VALUES ('76', 'name76', '1', '青岛市');
INSERT INTO `users` VALUES ('77', 'name77', '1', '青岛市');
INSERT INTO `users` VALUES ('78', 'name78', '1', '青岛市');
