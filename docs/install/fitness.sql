/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : fitness

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-03-12 10:45:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aus_demo
-- ----------------------------
DROP TABLE IF EXISTS `aus_demo`;
CREATE TABLE `aus_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `username` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jhyji8q4ox03h0ocs3f1nob3n` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of aus_demo
-- ----------------------------

-- ----------------------------
-- Table structure for com_type_codes
-- ----------------------------
DROP TABLE IF EXISTS `com_type_codes`;
CREATE TABLE `com_type_codes` (
  `code` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`code`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of com_type_codes
-- ----------------------------
INSERT INTO `com_type_codes` VALUES ('2019-临床医学五年制-入学入伍训练', 'score_title', 'test', '2019-03-01 06:31:57.934000', 'score_title', '', '2019-临床医学五年制-入学入伍训练', 'test', '2019-03-01 06:31:57.934000');
INSERT INTO `com_type_codes` VALUES ('2019-临床医学五年制-课程考核', 'score_title', 'test', '2019-03-01 06:35:27.763000', 'score_title', '', '2019-临床医学五年制-课程考核', 'test', '2019-03-01 06:35:27.763000');
INSERT INTO `com_type_codes` VALUES ('testbug', 'score_title', 'test', '2019-03-04 02:07:16.099000', 'score_title', '', 'testbug', 'test', '2019-03-04 02:07:16.099000');

-- ----------------------------
-- Table structure for demo_student
-- ----------------------------
DROP TABLE IF EXISTS `demo_student`;
CREATE TABLE `demo_student` (
  `code` varchar(255) NOT NULL,
  `age` bigint(20) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sclass` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of demo_student
-- ----------------------------
INSERT INTO `demo_student` VALUES ('1000000', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2019', '李四', null, '临床医学五年制', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000001', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2017', '李四', null, '临床医学五年制', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000002', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000003', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000004', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000005', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000006', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000007', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000008', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000009', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000010', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '李四', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000011', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000012', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000013', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000014', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000015', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000016', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000017', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000018', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000019', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000020', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000021', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000022', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000023', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年1', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000024', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000025', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000026', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年2', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000027', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000028', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000029', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000030', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000031', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000032', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000033', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000034', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000035', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000036', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000037', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000038', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000039', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000040', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000041', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000042', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000043', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000044', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000045', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000046', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000047', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000048', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000049', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000050', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000051', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000052', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000053', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000054', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000055', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000056', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000057', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000058', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000059', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000060', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000061', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000062', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000063', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000064', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000065', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000066', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000067', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000068', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000069', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000070', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000071', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000072', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000073', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000074', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000075', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000076', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000077', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000078', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000079', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000080', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000081', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000082', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000083', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000084', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000085', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000086', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000087', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000088', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000089', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000090', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000091', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000092', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000093', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000094', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000095', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000096', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000097', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000098', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000099', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000100', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000101', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000102', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000103', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000104', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000105', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000106', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000107', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000108', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000109', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000110', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000111', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000112', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000113', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000114', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000115', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000116', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000117', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000118', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000119', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000120', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000121', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000122', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000123', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000124', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000125', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000126', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000127', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000128', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000129', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000130', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000131', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000132', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000133', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000134', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000135', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000136', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000137', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000138', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000139', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000140', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000141', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000142', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000143', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000144', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000145', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000146', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000147', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000148', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000149', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000150', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000151', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000152', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000153', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000154', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000155', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000156', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000157', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000158', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000159', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000160', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000161', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000162', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000163', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000164', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000165', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000166', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000167', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000168', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000169', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000170', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000171', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000172', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000173', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000174', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000175', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000176', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000177', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000178', null, 'admin', '2019-01-30 16:00:00.000000', '男', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000179', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000180', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000181', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000182', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000183', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000184', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000185', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000186', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000187', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000188', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000189', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000190', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000191', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000192', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000193', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000194', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000195', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000196', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000197', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000198', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000199', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000200', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000201', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床五年', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000202', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2018', '张飞', null, '临床医学五年制', 'admin', '2019-01-30 16:00:00.000000');
INSERT INTO `demo_student` VALUES ('1000203', null, 'admin', '2019-01-30 16:00:00.000000', '女', '2019', '张飞', null, '临床医学五年制', 'admin', '2019-01-30 16:00:00.000000');

-- ----------------------------
-- Table structure for fit_item_criterion
-- ----------------------------
DROP TABLE IF EXISTS `fit_item_criterion`;
CREATE TABLE `fit_item_criterion` (
  `fic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `good` varchar(255) DEFAULT NULL,
  `great` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`fic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fit_item_criterion
-- ----------------------------
INSERT INTO `fit_item_criterion` VALUES ('1', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', '80', '90', '基本理论（Ⅰ）★', '60', '分数', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('2', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', '80', '90', '基本理论（Ⅰ）★', '60', '分数', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('3', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', '10', '15', '单杠引体向上★', '5', '次', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('4', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', '30', '45', '低单杠直腿屈臂悬垂★', '20', '秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('5', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', '12', '18', '双杠臂屈伸★', '6', '次', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('6', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', '2.8', '3.4', '低双杠支撑前移★', '1.5', '米', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('7', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', '62', '70', '仰卧起坐★', '45', '次', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('8', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', '50', '60', '仰卧起坐★', '40', '次', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('9', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', '00:13:30', '0:12:40', '3000米跑★', '0:14:20', '分:秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('10', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', '0:16:00', '0:15:30', '3000米跑★', '0:17:00', '分:秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('11', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', '13.5', '12', '基础体能组合1▲', '15', '秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('12', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', '18', '15', '基础体能组合1▲', '21', '秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('13', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', '12.5', '11.5', '基础体能组合2▲', '14', '秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('14', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', '14.5', '13.5', '基础体能组合2▲', '16', '秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('15', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', '0:12:30', '0:11:30', '400米蛙泳☆', '0:13:30', '分:秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('16', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', '0:6:45', '0:6:15', '200米蛙泳☆', '0:7:15', '分:秒', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('17', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', null, '18.5', '体质指数(BMI)', '25.9', '指数', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('18', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', null, '18.5', '体质指数(BMI)', '23.9', '指数', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('19', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '男', null, '0.06', '体脂比(PBF)', '0.207', '指数', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('20', '入学入伍训练', 'admin', '2019-03-01 06:30:05.000000', '女', null, '0.14', '体脂比(PBF)', '0.301', '指数', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('21', '课程考核标准', 'admin', '2019-03-01 06:30:05.000000', '男', '14', '18', '坐蹬★', '12', '次', 'admin', '2019-03-01 06:30:05.000000');
INSERT INTO `fit_item_criterion` VALUES ('22', '课程考核标准', 'admin', '2019-03-01 06:30:05.000000', '女', '14', '18', '坐蹬★', '12', '次', 'admin', '2019-03-01 06:30:05.000000');

-- ----------------------------
-- Table structure for fit_static_score
-- ----------------------------
DROP TABLE IF EXISTS `fit_static_score`;
CREATE TABLE `fit_static_score` (
  `item` varchar(255) NOT NULL,
  `joinrate` varchar(255) DEFAULT NULL,
  `notjoin` bigint(20) DEFAULT NULL,
  `pass` bigint(20) DEFAULT NULL,
  `passrate` varchar(255) DEFAULT NULL,
  `sjoin` bigint(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fit_static_score
-- ----------------------------

-- ----------------------------
-- Table structure for fit_student
-- ----------------------------
DROP TABLE IF EXISTS `fit_student`;
CREATE TABLE `fit_student` (
  `code` varchar(255) NOT NULL,
  `age` bigint(20) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sclass` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fit_student
-- ----------------------------
INSERT INTO `fit_student` VALUES ('3012016001', null, 'admin', '2019-03-01 06:29:54.000000', '男', '2019', '任爽', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016002', null, 'admin', '2019-03-01 06:29:54.000000', '男', '2018', '许家俊', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016003', null, 'admin', '2019-03-01 06:29:54.000000', '男', '2018', '吴子声', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016004', null, 'admin', '2019-03-01 06:29:54.000000', '男', '2019', '马赛', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016114', null, 'admin', '2019-03-01 06:29:54.000000', '男', '2019', '张国兴', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016115', null, 'admin', '2019-03-01 06:29:54.000000', '男', '2019', '郭添', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016116', null, 'admin', '2019-03-01 06:29:54.000000', '男', '2019', '徐榕', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016150', null, 'admin', '2019-03-01 06:29:54.000000', '女', '2019', '杨岚洁', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016151', null, 'admin', '2019-03-01 06:29:54.000000', '女', '2019', '王立辉', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016152', null, 'admin', '2019-03-01 06:29:54.000000', '女', '2019', '宋娟', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016153', null, 'admin', '2019-03-01 06:29:54.000000', '女', '2018', '陈秀丽', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016154', null, 'admin', '2019-03-01 06:29:54.000000', '女', '2018', '杨帆', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');
INSERT INTO `fit_student` VALUES ('3012016155', null, 'admin', '2019-03-01 06:29:54.000000', '女', '2019', '李雨珊', null, '临床医学五年制', 'admin', '2019-03-01 06:29:54.000000');

-- ----------------------------
-- Table structure for fit_student_item_score
-- ----------------------------
DROP TABLE IF EXISTS `fit_student_item_score`;
CREATE TABLE `fit_student_item_score` (
  `fsis_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `fic_id` bigint(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `good` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `great` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `sremark` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fsis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fit_student_item_score
-- ----------------------------
INSERT INTO `fit_student_item_score` VALUES ('144', '入学入伍训练', '3012016001', '优秀', 'admin', '2019-03-01 06:31:55.000000', '1', '男', '80', '2019', '90', '基本理论（Ⅰ）★', '任爽', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '90');
INSERT INTO `fit_student_item_score` VALUES ('145', '入学入伍训练', '3012016001', '优秀', 'admin', '2019-03-01 06:31:55.000000', '3', '男', '10', '2019', '15', '单杠引体向上★', '任爽', '5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '15');
INSERT INTO `fit_student_item_score` VALUES ('146', '入学入伍训练', '3012016001', '优秀', 'admin', '2019-03-01 06:31:55.000000', '5', '男', '12', '2019', '18', '双杠臂屈伸★', '任爽', '6', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '19');
INSERT INTO `fit_student_item_score` VALUES ('147', '入学入伍训练', '3012016001', '优秀', 'admin', '2019-03-01 06:31:55.000000', '7', '男', '62', '2019', '70', '仰卧起坐★', '任爽', '45', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '70');
INSERT INTO `fit_student_item_score` VALUES ('148', '入学入伍训练', '3012016001', '优秀', 'admin', '2019-03-01 06:31:55.000000', '9', '男', '00:13:30', '2019', '0:12:40', '3000米跑★', '任爽', '0:14:20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:12:20');
INSERT INTO `fit_student_item_score` VALUES ('149', '入学入伍训练', '3012016001', '及格', 'admin', '2019-03-01 06:31:55.000000', '11', '男', '13.5', '2019', '12', '基础体能组合1▲', '任爽', '15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '14');
INSERT INTO `fit_student_item_score` VALUES ('150', '入学入伍训练', '3012016001', '优秀', 'admin', '2019-03-01 06:31:55.000000', '13', '男', '12.5', '2019', '11.5', '基础体能组合2▲', '任爽', '14', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '10.5');
INSERT INTO `fit_student_item_score` VALUES ('151', '入学入伍训练', '3012016001', '优秀', 'admin', '2019-03-01 06:31:55.000000', '15', '男', '0:12:30', '2019', '0:11:30', '400米蛙泳☆', '任爽', '0:13:30', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:11:20');
INSERT INTO `fit_student_item_score` VALUES ('152', '入学入伍训练', '3012016001', '及格', 'admin', '2019-03-01 06:31:55.000000', '17', '男', null, '2019', '18.5', '体质指数(BMI)', '任爽', '25.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '70/1.73');
INSERT INTO `fit_student_item_score` VALUES ('153', '入学入伍训练', '3012016001', '及格', 'admin', '2019-03-01 06:31:55.000000', '19', '男', null, '2019', '0.06', '体脂比(PBF)', '任爽', '0.207', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.12');
INSERT INTO `fit_student_item_score` VALUES ('154', '入学入伍训练', '3012016002', '良好', 'admin', '2019-03-01 06:31:55.000000', '1', '男', '80', '2018', '90', '基本理论（Ⅰ）★', '许家俊', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '85');
INSERT INTO `fit_student_item_score` VALUES ('155', '入学入伍训练', '3012016002', '及格', 'admin', '2019-03-01 06:31:55.000000', '3', '男', '10', '2018', '15', '单杠引体向上★', '许家俊', '5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '9');
INSERT INTO `fit_student_item_score` VALUES ('156', '入学入伍训练', '3012016002', '及格', 'admin', '2019-03-01 06:31:55.000000', '5', '男', '12', '2018', '18', '双杠臂屈伸★', '许家俊', '6', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '10');
INSERT INTO `fit_student_item_score` VALUES ('157', '入学入伍训练', '3012016002', '及格', 'admin', '2019-03-01 06:31:55.000000', '7', '男', '62', '2018', '70', '仰卧起坐★', '许家俊', '45', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '45');
INSERT INTO `fit_student_item_score` VALUES ('158', '入学入伍训练', '3012016002', '不及格', 'admin', '2019-03-01 06:31:55.000000', '9', '男', '00:13:30', '2018', '0:12:40', '3000米跑★', '许家俊', '0:14:20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:15:20');
INSERT INTO `fit_student_item_score` VALUES ('159', '入学入伍训练', '3012016002', '优秀', 'admin', '2019-03-01 06:31:55.000000', '11', '男', '13.5', '2018', '12', '基础体能组合1▲', '许家俊', '15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '12');
INSERT INTO `fit_student_item_score` VALUES ('160', '入学入伍训练', '3012016002', '不及格', 'admin', '2019-03-01 06:31:55.000000', '13', '男', '12.5', '2018', '11.5', '基础体能组合2▲', '许家俊', '14', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '15.5');
INSERT INTO `fit_student_item_score` VALUES ('161', '入学入伍训练', '3012016002', '及格', 'admin', '2019-03-01 06:31:55.000000', '15', '男', '0:12:30', '2018', '0:11:30', '400米蛙泳☆', '许家俊', '0:13:30', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:13:20');
INSERT INTO `fit_student_item_score` VALUES ('162', '入学入伍训练', '3012016002', '不及格', 'admin', '2019-03-01 06:31:55.000000', '17', '男', null, '2018', '18.5', '体质指数(BMI)', '许家俊', '25.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '85/1.73');
INSERT INTO `fit_student_item_score` VALUES ('163', '入学入伍训练', '3012016002', '不及格', 'admin', '2019-03-01 06:31:55.000000', '19', '男', null, '2018', '0.06', '体脂比(PBF)', '许家俊', '0.207', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.32');
INSERT INTO `fit_student_item_score` VALUES ('164', '入学入伍训练', '3012016003', '优秀', 'admin', '2019-03-01 06:31:55.000000', '1', '男', '80', '2018', '90', '基本理论（Ⅰ）★', '吴子声', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '90');
INSERT INTO `fit_student_item_score` VALUES ('165', '入学入伍训练', '3012016003', '优秀', 'admin', '2019-03-01 06:31:55.000000', '3', '男', '10', '2018', '15', '单杠引体向上★', '吴子声', '5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '15');
INSERT INTO `fit_student_item_score` VALUES ('166', '入学入伍训练', '3012016003', '优秀', 'admin', '2019-03-01 06:31:55.000000', '5', '男', '12', '2018', '18', '双杠臂屈伸★', '吴子声', '6', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '19');
INSERT INTO `fit_student_item_score` VALUES ('167', '入学入伍训练', '3012016003', '优秀', 'admin', '2019-03-01 06:31:55.000000', '7', '男', '62', '2018', '70', '仰卧起坐★', '吴子声', '45', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '70');
INSERT INTO `fit_student_item_score` VALUES ('168', '入学入伍训练', '3012016003', '优秀', 'admin', '2019-03-01 06:31:55.000000', '9', '男', '00:13:30', '2018', '0:12:40', '3000米跑★', '吴子声', '0:14:20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:12:20');
INSERT INTO `fit_student_item_score` VALUES ('169', '入学入伍训练', '3012016003', '及格', 'admin', '2019-03-01 06:31:55.000000', '11', '男', '13.5', '2018', '12', '基础体能组合1▲', '吴子声', '15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '14');
INSERT INTO `fit_student_item_score` VALUES ('170', '入学入伍训练', '3012016003', '优秀', 'admin', '2019-03-01 06:31:55.000000', '13', '男', '12.5', '2018', '11.5', '基础体能组合2▲', '吴子声', '14', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '10.5');
INSERT INTO `fit_student_item_score` VALUES ('171', '入学入伍训练', '3012016003', '优秀', 'admin', '2019-03-01 06:31:55.000000', '15', '男', '0:12:30', '2018', '0:11:30', '400米蛙泳☆', '吴子声', '0:13:30', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:11:20');
INSERT INTO `fit_student_item_score` VALUES ('172', '入学入伍训练', '3012016003', '及格', 'admin', '2019-03-01 06:31:55.000000', '17', '男', null, '2018', '18.5', '体质指数(BMI)', '吴子声', '25.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '70/1.73');
INSERT INTO `fit_student_item_score` VALUES ('173', '入学入伍训练', '3012016003', '及格', 'admin', '2019-03-01 06:31:55.000000', '19', '男', null, '2018', '0.06', '体脂比(PBF)', '吴子声', '0.207', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.12');
INSERT INTO `fit_student_item_score` VALUES ('174', '入学入伍训练', '3012016004', '优秀', 'admin', '2019-03-01 06:31:55.000000', '1', '男', '80', '2019', '90', '基本理论（Ⅰ）★', '马赛', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '90');
INSERT INTO `fit_student_item_score` VALUES ('175', '入学入伍训练', '3012016004', '优秀', 'admin', '2019-03-01 06:31:55.000000', '3', '男', '10', '2019', '15', '单杠引体向上★', '马赛', '5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '15');
INSERT INTO `fit_student_item_score` VALUES ('176', '入学入伍训练', '3012016004', '优秀', 'admin', '2019-03-01 06:31:55.000000', '5', '男', '12', '2019', '18', '双杠臂屈伸★', '马赛', '6', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '19');
INSERT INTO `fit_student_item_score` VALUES ('177', '入学入伍训练', '3012016004', '优秀', 'admin', '2019-03-01 06:31:55.000000', '7', '男', '62', '2019', '70', '仰卧起坐★', '马赛', '45', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '70');
INSERT INTO `fit_student_item_score` VALUES ('178', '入学入伍训练', '3012016004', '优秀', 'admin', '2019-03-01 06:31:55.000000', '9', '男', '00:13:30', '2019', '0:12:40', '3000米跑★', '马赛', '0:14:20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:12:20');
INSERT INTO `fit_student_item_score` VALUES ('179', '入学入伍训练', '3012016004', '及格', 'admin', '2019-03-01 06:31:55.000000', '11', '男', '13.5', '2019', '12', '基础体能组合1▲', '马赛', '15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '14');
INSERT INTO `fit_student_item_score` VALUES ('180', '入学入伍训练', '3012016004', '优秀', 'admin', '2019-03-01 06:31:55.000000', '13', '男', '12.5', '2019', '11.5', '基础体能组合2▲', '马赛', '14', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '10.5');
INSERT INTO `fit_student_item_score` VALUES ('181', '入学入伍训练', '3012016004', '优秀', 'admin', '2019-03-01 06:31:55.000000', '15', '男', '0:12:30', '2019', '0:11:30', '400米蛙泳☆', '马赛', '0:13:30', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:11:20');
INSERT INTO `fit_student_item_score` VALUES ('182', '入学入伍训练', '3012016004', '及格', 'admin', '2019-03-01 06:31:55.000000', '17', '男', null, '2019', '18.5', '体质指数(BMI)', '马赛', '25.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '70/1.73');
INSERT INTO `fit_student_item_score` VALUES ('183', '入学入伍训练', '3012016004', '及格', 'admin', '2019-03-01 06:31:55.000000', '19', '男', null, '2019', '0.06', '体脂比(PBF)', '马赛', '0.207', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.12');
INSERT INTO `fit_student_item_score` VALUES ('184', '入学入伍训练', '3012016114', '优秀', 'admin', '2019-03-01 06:31:55.000000', '1', '男', '80', '2019', '90', '基本理论（Ⅰ）★', '张国兴', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '90');
INSERT INTO `fit_student_item_score` VALUES ('185', '入学入伍训练', '3012016114', '优秀', 'admin', '2019-03-01 06:31:55.000000', '3', '男', '10', '2019', '15', '单杠引体向上★', '张国兴', '5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '15');
INSERT INTO `fit_student_item_score` VALUES ('186', '入学入伍训练', '3012016114', '优秀', 'admin', '2019-03-01 06:31:55.000000', '5', '男', '12', '2019', '18', '双杠臂屈伸★', '张国兴', '6', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '19');
INSERT INTO `fit_student_item_score` VALUES ('187', '入学入伍训练', '3012016114', '优秀', 'admin', '2019-03-01 06:31:55.000000', '7', '男', '62', '2019', '70', '仰卧起坐★', '张国兴', '45', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '70');
INSERT INTO `fit_student_item_score` VALUES ('188', '入学入伍训练', '3012016114', '优秀', 'admin', '2019-03-01 06:31:55.000000', '9', '男', '00:13:30', '2019', '0:12:40', '3000米跑★', '张国兴', '0:14:20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:12:20');
INSERT INTO `fit_student_item_score` VALUES ('189', '入学入伍训练', '3012016114', '及格', 'admin', '2019-03-01 06:31:55.000000', '11', '男', '13.5', '2019', '12', '基础体能组合1▲', '张国兴', '15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '14');
INSERT INTO `fit_student_item_score` VALUES ('190', '入学入伍训练', '3012016114', '优秀', 'admin', '2019-03-01 06:31:55.000000', '13', '男', '12.5', '2019', '11.5', '基础体能组合2▲', '张国兴', '14', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '10.5');
INSERT INTO `fit_student_item_score` VALUES ('191', '入学入伍训练', '3012016114', '优秀', 'admin', '2019-03-01 06:31:55.000000', '15', '男', '0:12:30', '2019', '0:11:30', '400米蛙泳☆', '张国兴', '0:13:30', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:11:20');
INSERT INTO `fit_student_item_score` VALUES ('192', '入学入伍训练', '3012016114', '及格', 'admin', '2019-03-01 06:31:55.000000', '17', '男', null, '2019', '18.5', '体质指数(BMI)', '张国兴', '25.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '70/1.73');
INSERT INTO `fit_student_item_score` VALUES ('193', '入学入伍训练', '3012016114', '及格', 'admin', '2019-03-01 06:31:55.000000', '19', '男', null, '2019', '0.06', '体脂比(PBF)', '张国兴', '0.207', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.12');
INSERT INTO `fit_student_item_score` VALUES ('194', '入学入伍训练', '3012016115', '缺勤', 'admin', '2019-03-01 06:31:55.000000', '1', '男', '80', '2019', '90', '基本理论（Ⅰ）★', '郭添', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '缺勤');
INSERT INTO `fit_student_item_score` VALUES ('195', '入学入伍训练', '3012016115', '优秀', 'admin', '2019-03-01 06:31:55.000000', '3', '男', '10', '2019', '15', '单杠引体向上★', '郭添', '5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '15');
INSERT INTO `fit_student_item_score` VALUES ('196', '入学入伍训练', '3012016115', '优秀', 'admin', '2019-03-01 06:31:55.000000', '5', '男', '12', '2019', '18', '双杠臂屈伸★', '郭添', '6', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '19');
INSERT INTO `fit_student_item_score` VALUES ('197', '入学入伍训练', '3012016115', '优秀', 'admin', '2019-03-01 06:31:55.000000', '7', '男', '62', '2019', '70', '仰卧起坐★', '郭添', '45', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '70');
INSERT INTO `fit_student_item_score` VALUES ('198', '入学入伍训练', '3012016115', '优秀', 'admin', '2019-03-01 06:31:55.000000', '9', '男', '00:13:30', '2019', '0:12:40', '3000米跑★', '郭添', '0:14:20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:12:20');
INSERT INTO `fit_student_item_score` VALUES ('199', '入学入伍训练', '3012016115', '及格', 'admin', '2019-03-01 06:31:55.000000', '11', '男', '13.5', '2019', '12', '基础体能组合1▲', '郭添', '15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '14');
INSERT INTO `fit_student_item_score` VALUES ('200', '入学入伍训练', '3012016115', '优秀', 'admin', '2019-03-01 06:31:55.000000', '13', '男', '12.5', '2019', '11.5', '基础体能组合2▲', '郭添', '14', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '10.5');
INSERT INTO `fit_student_item_score` VALUES ('201', '入学入伍训练', '3012016115', '优秀', 'admin', '2019-03-01 06:31:55.000000', '15', '男', '0:12:30', '2019', '0:11:30', '400米蛙泳☆', '郭添', '0:13:30', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:11:20');
INSERT INTO `fit_student_item_score` VALUES ('202', '入学入伍训练', '3012016115', '及格', 'admin', '2019-03-01 06:31:55.000000', '17', '男', null, '2019', '18.5', '体质指数(BMI)', '郭添', '25.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '70/1.73');
INSERT INTO `fit_student_item_score` VALUES ('203', '入学入伍训练', '3012016115', '及格', 'admin', '2019-03-01 06:31:55.000000', '19', '男', null, '2019', '0.06', '体脂比(PBF)', '郭添', '0.207', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.12');
INSERT INTO `fit_student_item_score` VALUES ('204', '入学入伍训练', '3012016116', '优秀', 'admin', '2019-03-01 06:31:55.000000', '1', '男', '80', '2019', '90', '基本理论（Ⅰ）★', '徐榕', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '优秀');
INSERT INTO `fit_student_item_score` VALUES ('205', '入学入伍训练', '3012016116', '良好', 'admin', '2019-03-01 06:31:55.000000', '3', '男', '10', '2019', '15', '单杠引体向上★', '徐榕', '5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '良好');
INSERT INTO `fit_student_item_score` VALUES ('206', '入学入伍训练', '3012016116', '良好', 'admin', '2019-03-01 06:31:55.000000', '5', '男', '12', '2019', '18', '双杠臂屈伸★', '徐榕', '6', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '良好');
INSERT INTO `fit_student_item_score` VALUES ('207', '入学入伍训练', '3012016116', '不及格', 'admin', '2019-03-01 06:31:55.000000', '7', '男', '62', '2019', '70', '仰卧起坐★', '徐榕', '45', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '不及格');
INSERT INTO `fit_student_item_score` VALUES ('208', '入学入伍训练', '3012016116', '及格', 'admin', '2019-03-01 06:31:55.000000', '9', '男', '00:13:30', '2019', '0:12:40', '3000米跑★', '徐榕', '0:14:20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '及格');
INSERT INTO `fit_student_item_score` VALUES ('209', '入学入伍训练', '3012016116', '良好', 'admin', '2019-03-01 06:31:55.000000', '11', '男', '13.5', '2019', '12', '基础体能组合1▲', '徐榕', '15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '良好');
INSERT INTO `fit_student_item_score` VALUES ('210', '入学入伍训练', '3012016116', '良好', 'admin', '2019-03-01 06:31:55.000000', '13', '男', '12.5', '2019', '11.5', '基础体能组合2▲', '徐榕', '14', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '良好');
INSERT INTO `fit_student_item_score` VALUES ('211', '入学入伍训练', '3012016116', '良好', 'admin', '2019-03-01 06:31:55.000000', '15', '男', '0:12:30', '2019', '0:11:30', '400米蛙泳☆', '徐榕', '0:13:30', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '良好');
INSERT INTO `fit_student_item_score` VALUES ('212', '入学入伍训练', '3012016116', '缺勤', 'admin', '2019-03-01 06:31:55.000000', '17', '男', null, '2019', '18.5', '体质指数(BMI)', '徐榕', '25.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '缺勤');
INSERT INTO `fit_student_item_score` VALUES ('213', '入学入伍训练', '3012016116', '优秀', 'admin', '2019-03-01 06:31:55.000000', '19', '男', null, '2019', '0.06', '体脂比(PBF)', '徐榕', '0.207', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '优秀');
INSERT INTO `fit_student_item_score` VALUES ('214', '入学入伍训练', '3012016150', '优秀', 'admin', '2019-03-01 06:31:55.000000', '2', '女', '80', '2019', '90', '基本理论（Ⅰ）★', '杨岚洁', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '90');
INSERT INTO `fit_student_item_score` VALUES ('215', '入学入伍训练', '3012016150', '优秀', 'admin', '2019-03-01 06:31:55.000000', '4', '女', '30', '2019', '45', '低单杠直腿屈臂悬垂★', '杨岚洁', '20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '50');
INSERT INTO `fit_student_item_score` VALUES ('216', '入学入伍训练', '3012016150', '优秀', 'admin', '2019-03-01 06:31:55.000000', '6', '女', '2.8', '2019', '3.4', '低双杠支撑前移★', '杨岚洁', '1.5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '米', 'admin', '2019-03-01 06:33:09.000000', '3.6');
INSERT INTO `fit_student_item_score` VALUES ('217', '入学入伍训练', '3012016150', '优秀', 'admin', '2019-03-01 06:31:55.000000', '8', '女', '50', '2019', '60', '仰卧起坐★', '杨岚洁', '40', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '65');
INSERT INTO `fit_student_item_score` VALUES ('218', '入学入伍训练', '3012016150', '优秀', 'admin', '2019-03-01 06:31:55.000000', '10', '女', '0:16:00', '2019', '0:15:30', '3000米跑★', '杨岚洁', '0:17:00', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:15:30');
INSERT INTO `fit_student_item_score` VALUES ('219', '入学入伍训练', '3012016150', '优秀', 'admin', '2019-03-01 06:31:55.000000', '12', '女', '18', '2019', '15', '基础体能组合1▲', '杨岚洁', '21', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '15');
INSERT INTO `fit_student_item_score` VALUES ('220', '入学入伍训练', '3012016150', '优秀', 'admin', '2019-03-01 06:31:55.000000', '14', '女', '14.5', '2019', '13.5', '基础体能组合2▲', '杨岚洁', '16', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '13.5');
INSERT INTO `fit_student_item_score` VALUES ('221', '入学入伍训练', '3012016150', '优秀', 'admin', '2019-03-01 06:31:55.000000', '16', '女', '0:6:45', '2019', '0:6:15', '200米蛙泳☆', '杨岚洁', '0:7:15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:06:10');
INSERT INTO `fit_student_item_score` VALUES ('222', '入学入伍训练', '3012016150', '及格', 'admin', '2019-03-01 06:31:55.000000', '18', '女', null, '2019', '18.5', '体质指数(BMI)', '杨岚洁', '23.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '18.5');
INSERT INTO `fit_student_item_score` VALUES ('223', '入学入伍训练', '3012016150', '及格', 'admin', '2019-03-01 06:31:55.000000', '20', '女', null, '2019', '0.14', '体脂比(PBF)', '杨岚洁', '0.301', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.14');
INSERT INTO `fit_student_item_score` VALUES ('224', '入学入伍训练', '3012016151', '良好', 'admin', '2019-03-01 06:31:55.000000', '2', '女', '80', '2019', '90', '基本理论（Ⅰ）★', '王立辉', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '80');
INSERT INTO `fit_student_item_score` VALUES ('225', '入学入伍训练', '3012016151', '良好', 'admin', '2019-03-01 06:31:55.000000', '4', '女', '30', '2019', '45', '低单杠直腿屈臂悬垂★', '王立辉', '20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '30');
INSERT INTO `fit_student_item_score` VALUES ('226', '入学入伍训练', '3012016151', '良好', 'admin', '2019-03-01 06:31:55.000000', '6', '女', '2.8', '2019', '3.4', '低双杠支撑前移★', '王立辉', '1.5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '米', 'admin', '2019-03-01 06:33:09.000000', '2.8');
INSERT INTO `fit_student_item_score` VALUES ('227', '入学入伍训练', '3012016151', '良好', 'admin', '2019-03-01 06:31:55.000000', '8', '女', '50', '2019', '60', '仰卧起坐★', '王立辉', '40', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '54');
INSERT INTO `fit_student_item_score` VALUES ('228', '入学入伍训练', '3012016151', '优秀', 'admin', '2019-03-01 06:31:55.000000', '10', '女', '0:16:00', '2019', '0:15:30', '3000米跑★', '王立辉', '0:17:00', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:15:10');
INSERT INTO `fit_student_item_score` VALUES ('229', '入学入伍训练', '3012016151', '良好', 'admin', '2019-03-01 06:31:55.000000', '12', '女', '18', '2019', '15', '基础体能组合1▲', '王立辉', '21', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '18');
INSERT INTO `fit_student_item_score` VALUES ('230', '入学入伍训练', '3012016151', '良好', 'admin', '2019-03-01 06:31:55.000000', '14', '女', '14.5', '2019', '13.5', '基础体能组合2▲', '王立辉', '16', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '14.5');
INSERT INTO `fit_student_item_score` VALUES ('231', '入学入伍训练', '3012016151', '良好', 'admin', '2019-03-01 06:31:55.000000', '16', '女', '0:6:45', '2019', '0:6:15', '200米蛙泳☆', '王立辉', '0:7:15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:06:45');
INSERT INTO `fit_student_item_score` VALUES ('232', '入学入伍训练', '3012016151', '及格', 'admin', '2019-03-01 06:31:55.000000', '18', '女', null, '2019', '18.5', '体质指数(BMI)', '王立辉', '23.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '18.5');
INSERT INTO `fit_student_item_score` VALUES ('233', '入学入伍训练', '3012016151', '及格', 'admin', '2019-03-01 06:31:55.000000', '20', '女', null, '2019', '0.14', '体脂比(PBF)', '王立辉', '0.301', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.14');
INSERT INTO `fit_student_item_score` VALUES ('234', '入学入伍训练', '3012016152', '优秀', 'admin', '2019-03-01 06:31:55.000000', '2', '女', '80', '2019', '90', '基本理论（Ⅰ）★', '宋娟', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '90');
INSERT INTO `fit_student_item_score` VALUES ('235', '入学入伍训练', '3012016152', '优秀', 'admin', '2019-03-01 06:31:55.000000', '4', '女', '30', '2019', '45', '低单杠直腿屈臂悬垂★', '宋娟', '20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '50');
INSERT INTO `fit_student_item_score` VALUES ('236', '入学入伍训练', '3012016152', '优秀', 'admin', '2019-03-01 06:31:55.000000', '6', '女', '2.8', '2019', '3.4', '低双杠支撑前移★', '宋娟', '1.5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '米', 'admin', '2019-03-01 06:33:09.000000', '3.6');
INSERT INTO `fit_student_item_score` VALUES ('237', '入学入伍训练', '3012016152', '优秀', 'admin', '2019-03-01 06:31:55.000000', '8', '女', '50', '2019', '60', '仰卧起坐★', '宋娟', '40', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '65');
INSERT INTO `fit_student_item_score` VALUES ('238', '入学入伍训练', '3012016152', '优秀', 'admin', '2019-03-01 06:31:55.000000', '10', '女', '0:16:00', '2019', '0:15:30', '3000米跑★', '宋娟', '0:17:00', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:15:30');
INSERT INTO `fit_student_item_score` VALUES ('239', '入学入伍训练', '3012016152', '优秀', 'admin', '2019-03-01 06:31:55.000000', '12', '女', '18', '2019', '15', '基础体能组合1▲', '宋娟', '21', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '15');
INSERT INTO `fit_student_item_score` VALUES ('240', '入学入伍训练', '3012016152', '优秀', 'admin', '2019-03-01 06:31:55.000000', '14', '女', '14.5', '2019', '13.5', '基础体能组合2▲', '宋娟', '16', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '13.5');
INSERT INTO `fit_student_item_score` VALUES ('241', '入学入伍训练', '3012016152', '优秀', 'admin', '2019-03-01 06:31:55.000000', '16', '女', '0:6:45', '2019', '0:6:15', '200米蛙泳☆', '宋娟', '0:7:15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:06:10');
INSERT INTO `fit_student_item_score` VALUES ('242', '入学入伍训练', '3012016152', '及格', 'admin', '2019-03-01 06:31:55.000000', '18', '女', null, '2019', '18.5', '体质指数(BMI)', '宋娟', '23.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '18.5');
INSERT INTO `fit_student_item_score` VALUES ('243', '入学入伍训练', '3012016152', '及格', 'admin', '2019-03-01 06:31:55.000000', '20', '女', null, '2019', '0.14', '体脂比(PBF)', '宋娟', '0.301', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.14');
INSERT INTO `fit_student_item_score` VALUES ('244', '入学入伍训练', '3012016153', '良好', 'admin', '2019-03-01 06:31:55.000000', '2', '女', '80', '2018', '90', '基本理论（Ⅰ）★', '陈秀丽', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '80');
INSERT INTO `fit_student_item_score` VALUES ('245', '入学入伍训练', '3012016153', '良好', 'admin', '2019-03-01 06:31:55.000000', '4', '女', '30', '2018', '45', '低单杠直腿屈臂悬垂★', '陈秀丽', '20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '30');
INSERT INTO `fit_student_item_score` VALUES ('246', '入学入伍训练', '3012016153', '良好', 'admin', '2019-03-01 06:31:55.000000', '6', '女', '2.8', '2018', '3.4', '低双杠支撑前移★', '陈秀丽', '1.5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '米', 'admin', '2019-03-01 06:33:09.000000', '2.8');
INSERT INTO `fit_student_item_score` VALUES ('247', '入学入伍训练', '3012016153', '良好', 'admin', '2019-03-01 06:31:55.000000', '8', '女', '50', '2018', '60', '仰卧起坐★', '陈秀丽', '40', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '54');
INSERT INTO `fit_student_item_score` VALUES ('248', '入学入伍训练', '3012016153', '优秀', 'admin', '2019-03-01 06:31:55.000000', '10', '女', '0:16:00', '2018', '0:15:30', '3000米跑★', '陈秀丽', '0:17:00', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:15:10');
INSERT INTO `fit_student_item_score` VALUES ('249', '入学入伍训练', '3012016153', '良好', 'admin', '2019-03-01 06:31:55.000000', '12', '女', '18', '2018', '15', '基础体能组合1▲', '陈秀丽', '21', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '18');
INSERT INTO `fit_student_item_score` VALUES ('250', '入学入伍训练', '3012016153', '良好', 'admin', '2019-03-01 06:31:55.000000', '14', '女', '14.5', '2018', '13.5', '基础体能组合2▲', '陈秀丽', '16', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '14.5');
INSERT INTO `fit_student_item_score` VALUES ('251', '入学入伍训练', '3012016153', '良好', 'admin', '2019-03-01 06:31:55.000000', '16', '女', '0:6:45', '2018', '0:6:15', '200米蛙泳☆', '陈秀丽', '0:7:15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:06:45');
INSERT INTO `fit_student_item_score` VALUES ('252', '入学入伍训练', '3012016153', '及格', 'admin', '2019-03-01 06:31:55.000000', '18', '女', null, '2018', '18.5', '体质指数(BMI)', '陈秀丽', '23.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '18.5');
INSERT INTO `fit_student_item_score` VALUES ('253', '入学入伍训练', '3012016153', '及格', 'admin', '2019-03-01 06:31:55.000000', '20', '女', null, '2018', '0.14', '体脂比(PBF)', '陈秀丽', '0.301', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.14');
INSERT INTO `fit_student_item_score` VALUES ('254', '入学入伍训练', '3012016154', '优秀', 'admin', '2019-03-01 06:31:55.000000', '2', '女', '80', '2018', '90', '基本理论（Ⅰ）★', '杨帆', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '90');
INSERT INTO `fit_student_item_score` VALUES ('255', '入学入伍训练', '3012016154', '优秀', 'admin', '2019-03-01 06:31:55.000000', '4', '女', '30', '2018', '45', '低单杠直腿屈臂悬垂★', '杨帆', '20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '50');
INSERT INTO `fit_student_item_score` VALUES ('256', '入学入伍训练', '3012016154', '优秀', 'admin', '2019-03-01 06:31:55.000000', '6', '女', '2.8', '2018', '3.4', '低双杠支撑前移★', '杨帆', '1.5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '米', 'admin', '2019-03-01 06:33:09.000000', '3.6');
INSERT INTO `fit_student_item_score` VALUES ('257', '入学入伍训练', '3012016154', '缺勤', 'admin', '2019-03-01 06:31:55.000000', '8', '女', '50', '2018', '60', '仰卧起坐★', '杨帆', '40', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '缺勤');
INSERT INTO `fit_student_item_score` VALUES ('258', '入学入伍训练', '3012016154', '优秀', 'admin', '2019-03-01 06:31:55.000000', '10', '女', '0:16:00', '2018', '0:15:30', '3000米跑★', '杨帆', '0:17:00', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:15:30');
INSERT INTO `fit_student_item_score` VALUES ('259', '入学入伍训练', '3012016154', '优秀', 'admin', '2019-03-01 06:31:55.000000', '12', '女', '18', '2018', '15', '基础体能组合1▲', '杨帆', '21', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '15');
INSERT INTO `fit_student_item_score` VALUES ('260', '入学入伍训练', '3012016154', '优秀', 'admin', '2019-03-01 06:31:55.000000', '14', '女', '14.5', '2018', '13.5', '基础体能组合2▲', '杨帆', '16', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '13.5');
INSERT INTO `fit_student_item_score` VALUES ('261', '入学入伍训练', '3012016154', '优秀', 'admin', '2019-03-01 06:31:55.000000', '16', '女', '0:6:45', '2018', '0:6:15', '200米蛙泳☆', '杨帆', '0:7:15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:06:10');
INSERT INTO `fit_student_item_score` VALUES ('262', '入学入伍训练', '3012016154', '及格', 'admin', '2019-03-01 06:31:55.000000', '18', '女', null, '2018', '18.5', '体质指数(BMI)', '杨帆', '23.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '18.5');
INSERT INTO `fit_student_item_score` VALUES ('263', '入学入伍训练', '3012016154', '及格', 'admin', '2019-03-01 06:31:55.000000', '20', '女', null, '2018', '0.14', '体脂比(PBF)', '杨帆', '0.301', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.14');
INSERT INTO `fit_student_item_score` VALUES ('264', '入学入伍训练', '3012016155', '不及格', 'admin', '2019-03-01 06:31:55.000000', '2', '女', '80', '2019', '90', '基本理论（Ⅰ）★', '李雨珊', '60', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分数', 'admin', '2019-03-01 06:33:09.000000', '55');
INSERT INTO `fit_student_item_score` VALUES ('265', '入学入伍训练', '3012016155', '良好', 'admin', '2019-03-01 06:31:55.000000', '4', '女', '30', '2019', '45', '低单杠直腿屈臂悬垂★', '李雨珊', '20', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '30');
INSERT INTO `fit_student_item_score` VALUES ('266', '入学入伍训练', '3012016155', '不及格', 'admin', '2019-03-01 06:31:55.000000', '6', '女', '2.8', '2019', '3.4', '低双杠支撑前移★', '李雨珊', '1.5', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '米', 'admin', '2019-03-01 06:33:09.000000', '0.5');
INSERT INTO `fit_student_item_score` VALUES ('267', '入学入伍训练', '3012016155', '良好', 'admin', '2019-03-01 06:31:55.000000', '8', '女', '50', '2019', '60', '仰卧起坐★', '李雨珊', '40', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '次', 'admin', '2019-03-01 06:33:09.000000', '54');
INSERT INTO `fit_student_item_score` VALUES ('268', '入学入伍训练', '3012016155', '优秀', 'admin', '2019-03-01 06:31:55.000000', '10', '女', '0:16:00', '2019', '0:15:30', '3000米跑★', '李雨珊', '0:17:00', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:15:10');
INSERT INTO `fit_student_item_score` VALUES ('269', '入学入伍训练', '3012016155', '良好', 'admin', '2019-03-01 06:31:55.000000', '12', '女', '18', '2019', '15', '基础体能组合1▲', '李雨珊', '21', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '18');
INSERT INTO `fit_student_item_score` VALUES ('270', '入学入伍训练', '3012016155', '良好', 'admin', '2019-03-01 06:31:55.000000', '14', '女', '14.5', '2019', '13.5', '基础体能组合2▲', '李雨珊', '16', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '秒', 'admin', '2019-03-01 06:33:09.000000', '14.5');
INSERT INTO `fit_student_item_score` VALUES ('271', '入学入伍训练', '3012016155', '良好', 'admin', '2019-03-01 06:31:55.000000', '16', '女', '0:6:45', '2019', '0:6:15', '200米蛙泳☆', '李雨珊', '0:7:15', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '分:秒', 'admin', '2019-03-01 06:33:09.000000', '0:06:45');
INSERT INTO `fit_student_item_score` VALUES ('272', '入学入伍训练', '3012016155', '及格', 'admin', '2019-03-01 06:31:55.000000', '18', '女', null, '2019', '18.5', '体质指数(BMI)', '李雨珊', '23.9', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '18.5');
INSERT INTO `fit_student_item_score` VALUES ('273', '入学入伍训练', '3012016155', '及格', 'admin', '2019-03-01 06:31:55.000000', '20', '女', null, '2019', '0.14', '体脂比(PBF)', '李雨珊', '0.301', '临床医学五年制', 'build', '2019-临床医学五年制-入学入伍训练', '指数', 'admin', '2019-03-01 06:33:09.000000', '0.14');
INSERT INTO `fit_student_item_score` VALUES ('274', '课程考核标准', '3012016001', '及格', 'admin', '2019-03-01 06:35:26.000000', '21', '男', '14', '2019', '18', '坐蹬★', '任爽', '12', '临床医学五年制', 'build', '2019-临床医学五年制-课程考核', '次', 'admin', '2019-03-01 06:35:42.000000', '13');
INSERT INTO `fit_student_item_score` VALUES ('275', '课程考核标准', '3012016004', '优秀', 'admin', '2019-03-01 06:35:26.000000', '21', '男', '14', '2019', '18', '坐蹬★', '马赛', '12', '临床医学五年制', 'build', '2019-临床医学五年制-课程考核', '次', 'admin', '2019-03-01 06:35:42.000000', '20');
INSERT INTO `fit_student_item_score` VALUES ('276', '课程考核标准', '3012016150', '良好', 'admin', '2019-03-01 06:35:26.000000', '22', '女', '14', '2019', '18', '坐蹬★', '杨岚洁', '12', '临床医学五年制', 'build', '2019-临床医学五年制-课程考核', '次', 'admin', '2019-03-01 06:35:42.000000', '14');
INSERT INTO `fit_student_item_score` VALUES ('277', '入学入伍训练', '3012016001', '及格', 'admin', '2019-03-04 02:07:12.000000', '1', '男', '80', '2019', '90', '基本理论（Ⅰ）★', '任爽', '60', '临床医学五年制', 'build', 'testbug', '分数', 'admin', '2019-03-04 02:08:53.000000', '70');
INSERT INTO `fit_student_item_score` VALUES ('278', '入学入伍训练', '3012016002', '不及格', 'admin', '2019-03-04 02:07:12.000000', '1', '男', '80', '2018', '90', '基本理论（Ⅰ）★', '许家俊', '60', '临床医学五年制', 'build', 'testbug', '分数', 'admin', '2019-03-04 02:08:53.000000', '30');
INSERT INTO `fit_student_item_score` VALUES ('279', '入学入伍训练', '3012016151', '良好', 'admin', '2019-03-04 02:07:12.000000', '2', '女', '80', '2019', '90', '基本理论（Ⅰ）★', '王立辉', '60', '临床医学五年制', 'build', 'testbug', '分数', 'admin', '2019-03-04 02:08:53.000000', '80');

-- ----------------------------
-- Table structure for sys_operation
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation`;
CREATE TABLE `sys_operation` (
  `operation_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `enable` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_operation
-- ----------------------------
INSERT INTO `sys_operation` VALUES ('2', '新增权限', '', '新增', null, 'create');
INSERT INTO `sys_operation` VALUES ('3', '修改权限', '', '修改', null, 'update');
INSERT INTO `sys_operation` VALUES ('4', '删除权限', '', '删除', null, 'delete');
INSERT INTO `sys_operation` VALUES ('5', '查看权限', '', '查看', null, 'view');
INSERT INTO `sys_operation` VALUES ('6', '审核权限', '', '审核', null, 'audit');
INSERT INTO `sys_operation` VALUES ('7', '驳回权限', '', '驳回', null, 'reject');
INSERT INTO `sys_operation` VALUES ('8', '导入权限', '', '导入', null, 'import');
INSERT INTO `sys_operation` VALUES ('9', '导出权限', '', '导出', null, 'export');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `permit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alert` varchar(255) DEFAULT NULL,
  `elink` varchar(255) DEFAULT NULL,
  `enable` bit(1) DEFAULT NULL,
  `heading` bit(1) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `operation_ids` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '1', null, '', '\0', 'icon-grid', 'badge badge-danger', '/security', '系统权限', '', null, '0', '2', null, '系统权限');
INSERT INTO `sys_permission` VALUES ('2', '1', null, '', '\0', '', 'badge badge-danger', '/security/user', '用户权限', 'all', 'user', '1', '1', null, '用户管理');
INSERT INTO `sys_permission` VALUES ('3', null, null, '', '\0', 'icon-grid', 'badge badge-info', '/api', '案例演示权限', null, 'demo', '0', '3', null, '案例演示');
INSERT INTO `sys_permission` VALUES ('4', '3', null, '', '\0', '', 'badge badge-info', '/security/permission', '权限管理', '6,7', 'permit', '1', '3', null, '权限管理');
INSERT INTO `sys_permission` VALUES ('5', null, 'http://www.daphne.com.cn', '', '\0', '', 'badge badge-info', '', '二级演示1权限', '1', null, '3', '1', null, '二级演示1');
INSERT INTO `sys_permission` VALUES ('6', null, null, '', '\0', null, 'badge badge-info', '/api/demo/techure', '二级演示2权限', 'all', null, '3', '2', null, '学生管理');
INSERT INTO `sys_permission` VALUES ('7', null, null, '', '\0', '', null, '/demo/ng2table', '三级演示3权限', 'all', 'student', '6', '1', null, 'ng2table');
INSERT INTO `sys_permission` VALUES ('8', '2', null, '', '\0', '', 'badge badge-success', '/security/role', '角色权限', '2,3,4,5', 'role', '1', '2', null, '角色管理');
INSERT INTO `sys_permission` VALUES ('9', '', '', '', '\0', '', '', '/demo/ngxtable', '三级演示3权限', 'all', 'student', '6', '1', '', 'ngxtable(推荐)');
INSERT INTO `sys_permission` VALUES ('10', '', '', '', '', '', '', '', '系统管理', '', '', '0', '1', '', '系统管理');
INSERT INTO `sys_permission` VALUES ('11', '', '', '', '', '', '', '', '其他管理', '', '', '0', '4', '', '其他管理');
INSERT INTO `sys_permission` VALUES ('12', '', '', '', '\0', '', '', '/fitness/student', '学生管理', 'all', 'student', '13', '1', '', '学生管理');
INSERT INTO `sys_permission` VALUES ('13', '', '', '', '\0', 'icon-grid', '', '', '体能管理', '', '', '0', '5', '', '体能管理');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '最高权限', '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通权限', '管理员');
INSERT INTO `sys_role` VALUES ('4', 'demo权限', 'demo');
INSERT INTO `sys_role` VALUES ('5', '哈', '哈');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1');
INSERT INTO `sys_role_permission` VALUES ('2', '1', '2');
INSERT INTO `sys_role_permission` VALUES ('3', '1', '3');
INSERT INTO `sys_role_permission` VALUES ('4', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('5', '1', '5');
INSERT INTO `sys_role_permission` VALUES ('6', '1', '6');
INSERT INTO `sys_role_permission` VALUES ('7', '1', '7');
INSERT INTO `sys_role_permission` VALUES ('8', '1', '8');
INSERT INTO `sys_role_permission` VALUES ('9', '1', '9');
INSERT INTO `sys_role_permission` VALUES ('10', '1', '10');
INSERT INTO `sys_role_permission` VALUES ('11', '1', '11');
INSERT INTO `sys_role_permission` VALUES ('12', '1', '12');
INSERT INTO `sys_role_permission` VALUES ('13', '1', '13');
INSERT INTO `sys_role_permission` VALUES ('14', '1', '14');
INSERT INTO `sys_role_permission` VALUES ('15', '1', '15');
INSERT INTO `sys_role_permission` VALUES ('16', '1', '16');
INSERT INTO `sys_role_permission` VALUES ('17', '1', '17');
INSERT INTO `sys_role_permission` VALUES ('18', '1', '18');
INSERT INTO `sys_role_permission` VALUES ('19', '1', '19');
INSERT INTO `sys_role_permission` VALUES ('20', '1', '20');

-- ----------------------------
-- Table structure for sys_task_schedule
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_schedule`;
CREATE TABLE `sys_task_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bean_class` varchar(255) DEFAULT NULL,
  `bean_name` varchar(255) DEFAULT NULL,
  `cron` varchar(255) DEFAULT NULL,
  `lastTime` datetime(6) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `number_of_threads` int(11) DEFAULT NULL,
  `is_start` bit(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `task_info` varchar(255) DEFAULT NULL,
  `maxnum_per_execution` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_task_schedule
-- ----------------------------
INSERT INTO `sys_task_schedule` VALUES ('1', 'dynamictask.testtask.TestTask1', '', '0/2 * * * * ?', '2018-09-05 15:35:34.000000', 'run', '1', '', '已启动', '测试', '任务启动成功', '12');
INSERT INTO `sys_task_schedule` VALUES ('2', 'sys.service.UserService', '', '0/2 * * * * ?', '2018-09-07 08:59:32.035000', 'syncMockUser', '100', '', '已完成', '更新用户手机号', '等待下次执行，20 ms 处理表数据11条', '12');
INSERT INTO `sys_task_schedule` VALUES ('5', 'sys.service.UserService', null, '0 0 0/2 * 2 ?', '2018-09-06 03:25:39.000000', 'syncMockUserByException', '12', '\0', '启动异常', '异常测试', '请检查任务配置信息是否正确! 失败信息：sys.service.UserService$$EnhancerBySpringCGLIB$$6fde03af.syncMockUserByException()', '12');
INSERT INTO `sys_task_schedule` VALUES ('6', 'sys.service.UserService', null, '0/2 * * * * ?', '2018-09-06 05:56:31.000000', 'syncMockUserByPassword', '2', '\0', '已停止', '按密码更新手机号', '任务停止成功', '12');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '2018-09-29 02:27:08.894000', 'admin@163.com1', '123456', '12345678909', null, '1', '2018-09-29 01:31:26.095000', 'admin');
INSERT INTO `sys_user` VALUES ('5', '2018-09-29 02:27:08.894000', 'suzhenyun@gmail.com', '123456', '13795467304', null, '1', '2018-09-29 02:27:08.894000', 'asu');
INSERT INTO `sys_user` VALUES ('8', '2018-10-11 09:47:33.099000', 'admin@163.com1', '123456', '5103518903', null, '1', '2018-10-11 09:47:33.099000', '1232');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('9', '1', '2');
INSERT INTO `sys_user_role` VALUES ('10', '1', '1');
INSERT INTO `sys_user_role` VALUES ('11', '6', '4');
INSERT INTO `sys_user_role` VALUES ('12', '8', '5');

-- ----------------------------
-- Procedure structure for get_concat_strs
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_concat_strs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_concat_strs`(in i_title varchar(30))
begin
  declare b int default 0;
  declare l_subsql, l_sql varchar(3000) default '';
  declare cur_1 cursor for 
	SELECT
		GROUP_CONCAT(
			DISTINCT CONCAT(
				'MAX(IF(fsis.item = ''',
				fsis.item,
				''', fsis.value, 0)) AS ''',
				fsis.item,
				''',',
				'MAX(IF(fsis.item = ''',
				fsis.item,
				''', fsis.comment, 0)) AS ''',
				'评价',
				''''
			)
		) as sstr
	FROM
		fit_student_item_score fsis
	WHERE
		fsis.title = i_title
  group by fsis.item,fsis.fic_id order by fsis.fic_id;

  declare continue handler for not found set b=1;

  open cur_1;
    repeat
      fetch cur_1 into l_subsql;
      if (l_sql = '') then 
        set l_sql= l_subsql;
      else
        set l_sql= CONCAT(l_sql,',',l_subsql);
      end if;
    until b=1 end repeat;
  close cur_1;
  
  select l_sql;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for myselect3
-- ----------------------------
DROP PROCEDURE IF EXISTS `myselect3`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myselect3`()
begin
set @subsql='';

set @subsql='33';

select @subsql;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for myselect4
-- ----------------------------
DROP PROCEDURE IF EXISTS `myselect4`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myselect4`()
begin
declare subsql varchar(3000);

	SELECT
		GROUP_CONCAT(
			DISTINCT CONCAT(
				'MAX(IF(fsis.item = ''',
				fsis.item,
				''', fsis.value, 0)) AS ''',
				fsis.item,

				''''
			)
		) into subsql
	FROM
		fit_student_item_score fsis
	WHERE
		fsis.title = 'test1';

select subsql;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_ItemGroup
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_ItemGroup`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ItemGroup`(i_title varchar(30))
    READS SQL DATA
BEGIN
	select t.item, t.total as '总人数', 
		t.notjoin as '缺勤人数', 
		concat(truncate((t.total - t.notjoin)/t.total *100,2),'%') as '参考率', 
		(t.pass - t.notjoin) as '及格数', 
		concat(truncate((t.pass - t.notjoin)/(t.total) *100,2),'%') as '及格率'
	from (
		select fsis.item, 
		 count(fsis.code) as 'total',
		 sum(if(fsis.value ='缺勤',1, 0)) as 'notjoin',
		 sum(if(fsis.value ='不及格',0, 1)) as 'pass'
		from fit_student_item_score fsis 
		where fsis.title = i_title
		group by fsis.item
	) t;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_QueryData
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_QueryData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_QueryData`(i_title varchar(30))
    READS SQL DATA
BEGIN
 
  set @subsql= get_concat_strs(i_title);
  set @mainsql= CONCAT('SELECT fsis.NAME as 姓名, fsis.CODE as 学号, fsis.gender as 性别, fsis.specialty as 专业, ', @subsql, 
											' FROM fit_student_item_score fsis ',
											'	WHERE fsis.title = ''', i_title, '''',
											'	GROUP BY fsis.NAME, fsis.CODE, fsis.gender, fsis.specialty order by fsis.gender desc, fsis.CODE');

	PREPARE stmt FROM @mainsql;
	EXECUTE stmt ;
	DEALLOCATE PREPARE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_QueryData_col
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_QueryData_col`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_QueryData_col`(i_title varchar(30))
    READS SQL DATA
BEGIN
select t.item FROM
(SELECT item, min(fic_id) as fic_id
	FROM fit_student_item_score
	WHERE title = i_title group by item ) t
order by t.fic_id;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for SP_QueryTest
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_QueryTest`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_QueryTest`(IN title VARCHAR(30))
    READS SQL DATA
BEGIN
	SET @subsql = '' ;
	SET @title = title ; 
  SELECT
		GROUP_CONCAT(
			DISTINCT CONCAT(
				'MAX(IF(fsis.item = ''',
				fsis.item,
				''', fsis.great, 0)) AS ''',
				fsis.item,
				''''
			)
		) INTO @subsql
	FROM
		fit_student_item_score fsis
	WHERE
		fsis.title = @title ;
	SET @SQL = CONCAT(
		' SELECT fsis.CODE, fsis.NAME, ',
		@subsql,
		' FROM fit_student_item_score fsis WHERE fsis.title = ''',
		@title,
		'''GROUP BY fsis.CODE, fsis.NAME') ; 
	PREPARE stmt FROM @SQL ; 
  EXECUTE stmt ; 
  DEALLOCATE PREPARE stmt ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_scoreComment
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_scoreComment`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_scoreComment`(IN value INT, IN num INT)
    READS SQL DATA
BEGIN
  if num = 1 THEN
     select case value when 3 then '优秀' when 2 then '良好' when 1 then '及格' else '不及格' end;
  else  
		if (value >= num*3-1) then
			select '优秀';
		elseif (value < num*3-1) and (value >=num*2-1) then
			select '良好';
		elseif (value < num*2-1) and (value >=num) then
			select '及格';
		else 
			select '不及格'; 
		end if;
  end if;  

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_statistics_item
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_statistics_item`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_statistics_item`(i_title varchar(30))
    READS SQL DATA
BEGIN
 
  set @subsql= sp_scoreRTC(i_title);
  set @mainsql= CONCAT('SELECT fsis.NAME as 姓名, fsis.CODE as 学号, fsis.gender as 性别, fsis.specialty as 专业, ', @subsql, 
											' FROM fit_student_item_score fsis ',
											'	WHERE fsis.title = ''', i_title, '''',
											'	GROUP BY fsis.NAME, fsis.CODE, fsis.gender, fsis.specialty order by fsis.gender desc, fsis.CODE');

	PREPARE stmt FROM @mainsql;
	EXECUTE stmt ;
	DEALLOCATE PREPARE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_statistics_item_col
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_statistics_item_col`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_statistics_item_col`(i_title varchar(30))
    READS SQL DATA
BEGIN
select CONCAT(t.item,',评价',t.fic_id) as item FROM
(SELECT item, min(fic_id) as fic_id
	FROM fit_student_item_score
	WHERE title = i_title group by item ) t
order by t.fic_id;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_statistics_student
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_statistics_student`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_statistics_student`(i_title varchar(30))
    READS SQL DATA
BEGIN
	select t.item, t.total, 
		t.notjoin, 
    (t.total - t.notjoin) as sjoin, 
		concat(ROUND((t.total - t.notjoin)/t.total *100,2),'%') as 'joinrate', 
		(t.pass - t.notjoin) as 'pass', 
		concat(ROUND((t.pass - t.notjoin)/(t.total) *100,2),'%') as 'passrate'
	from (
		select fsis.item, 
		 count(fsis.item) as 'total',
		 sum(if(IFNULL(fsis.comment,'缺勤') ='缺勤',1, 0)) as 'notjoin',
		 sum(if(fsis.comment ='不及格',0, 1)) as 'pass'
		from fit_student_item_score fsis 
		where fsis.title = i_title
		group by fsis.item
	) t;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for get_concat_strs
-- ----------------------------
DROP FUNCTION IF EXISTS `get_concat_strs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_concat_strs`(i_title varchar(30)) RETURNS varchar(3000) CHARSET utf8mb4
begin
  declare b int default 0;
  declare l_subsql, l_sql varchar(3000) default '';
  declare cur_1 cursor for 
	select t.sstr FROM
	(SELECT
			GROUP_CONCAT(
				DISTINCT CONCAT(
					'MAX(IF(fsis.item = ''',
					fsis.item,
					''', fsis.value, ''-'')) AS ''',
					fsis.item,
					''',',
					'MAX(IF(fsis.item = ''',
					fsis.item,
					''', fsis.comment, ''-'')) AS ''',
					'评价',
					''''
				)
			) as sstr,
			min(fsis.fic_id) as fic_id
		FROM
			fit_student_item_score fsis
		WHERE
			fsis.title = 'test1'
		group by fsis.item) t
	order by t.fic_id;

  declare continue handler for not found set b=1;

  open cur_1;
    repeat
      fetch cur_1 into l_subsql;
      if (l_sql = '') then 
        set l_sql= l_subsql;
      else
        set l_sql= CONCAT(l_sql,',',l_subsql);
      end if;
    until b=1 end repeat;
  close cur_1;
  
  return l_sql;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for get_test1
-- ----------------------------
DROP FUNCTION IF EXISTS `get_test1`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_test1`(i_title varchar(20)) RETURNS int(11)
begin
  return 1;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for sp_scoreRTC
-- ----------------------------
DROP FUNCTION IF EXISTS `sp_scoreRTC`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sp_scoreRTC`(i_title varchar(30)) RETURNS varchar(3000) CHARSET utf8mb4
begin
  declare b int default 0;
  declare l_subsql, l_sql varchar(3000) default '';
  declare cur_1 cursor for 
	select CONCAT(t.sstr, t.fic_id,'''') FROM
		(SELECT
				GROUP_CONCAT(
					DISTINCT CONCAT(
						'MAX(IF(fsis.item = ''',
						fsis.item,
						''', fsis.value, ''-'')) AS ''',
						fsis.item,
						''',',
						'MAX(IF(fsis.item = ''',
						fsis.item,
						''', fsis.comment, ''-'')) AS ''',
						'评价'
					)
				) as sstr,
				min(fsis.fic_id) as fic_id
			FROM
				fit_student_item_score fsis
			WHERE
				fsis.title = i_title
			group by fsis.item) t
		order by t.fic_id;


  declare continue handler for not found set b=1;

  open cur_1;
    repeat
    	fetch cur_1 into l_subsql;
			if b = 0 then
				if l_sql = '' then
					set l_sql= l_subsql;
				else
					set l_sql= CONCAT(l_sql,',',l_subsql);
				end if;
			end if;
		until b = 1 end repeat;
  close cur_1;
  
  return l_sql;
end
;;
DELIMITER ;
