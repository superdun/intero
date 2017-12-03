/*
Navicat MySQL Data Transfer

Source Server         : db
Source Server Version : 50718
Source Host           : 127.0.0.1:3306
Source Database       : intero

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-11-28 09:21:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for field
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of field
-- ----------------------------

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `content` varchar(4005) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `img` varchar(415) DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for post_comment
-- ----------------------------
DROP TABLE IF EXISTS `post_comment`;
CREATE TABLE `post_comment` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `disagree` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `form` varchar(255) DEFAULT NULL,
  `post` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_post_comment` (`post`),
  CONSTRAINT `post_id_post_comment` FOREIGN KEY (`post`) REFERENCES `post` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_comment
-- ----------------------------

-- ----------------------------
-- Table structure for post_field_mid
-- ----------------------------
DROP TABLE IF EXISTS `post_field_mid`;
CREATE TABLE `post_field_mid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `filed_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_post_field_mid` (`post_id`),
  KEY `field_id_post_field_mid` (`filed_id`),
  CONSTRAINT `field_id_post_field_mid` FOREIGN KEY (`filed_id`) REFERENCES `field` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_id_post_field_mid` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_field_mid
-- ----------------------------

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_tag
-- ----------------------------

-- ----------------------------
-- Table structure for post_tag_mid
-- ----------------------------
DROP TABLE IF EXISTS `post_tag_mid`;
CREATE TABLE `post_tag_mid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_post_tag_mid` (`post_id`),
  KEY `tag_id_tag_post_tag_mid` (`tag_id`),
  CONSTRAINT `post_id_post_tag_mid` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tag_id_tag_post_tag_mid` FOREIGN KEY (`tag_id`) REFERENCES `post_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_tag_mid
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `disagree` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for project_comment
-- ----------------------------
DROP TABLE IF EXISTS `project_comment`;
CREATE TABLE `project_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `disagree` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `form` varchar(255) DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id_project_comment` (`project`),
  CONSTRAINT `project_id_project_comment` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_comment
-- ----------------------------

-- ----------------------------
-- Table structure for project_field_mid
-- ----------------------------
DROP TABLE IF EXISTS `project_field_mid`;
CREATE TABLE `project_field_mid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `filed_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id_project_field_mid` (`project_id`),
  KEY `field_id_project_field_mid` (`filed_id`),
  CONSTRAINT `field_id_project_field_mid` FOREIGN KEY (`filed_id`) REFERENCES `field` (`id`) ON DELETE SET NULL,
  CONSTRAINT `project_id_project_field_mid` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_field_mid
-- ----------------------------

-- ----------------------------
-- Table structure for project_tag
-- ----------------------------
DROP TABLE IF EXISTS `project_tag`;
CREATE TABLE `project_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_tag
-- ----------------------------

-- ----------------------------
-- Table structure for project_tag_mid
-- ----------------------------
DROP TABLE IF EXISTS `project_tag_mid`;
CREATE TABLE `project_tag_mid` (
  `project_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `tag_id_tag_project_tag_mid` (`project_id`),
  KEY `tag_id_project_tag_mid` (`tag_id`),
  CONSTRAINT `project_id_project_tag_mid` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tag_id_project_tag_mid` FOREIGN KEY (`tag_id`) REFERENCES `project_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_tag_mid
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `content` varchar(4005) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `img` varchar(415) DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for question_comment
-- ----------------------------
DROP TABLE IF EXISTS `question_comment`;
CREATE TABLE `question_comment` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `disagree` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `form` varchar(255) DEFAULT NULL,
  `question` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id_question_comment` (`question`),
  CONSTRAINT `question_id_question_comment` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_comment
-- ----------------------------

-- ----------------------------
-- Table structure for question_field_mid
-- ----------------------------
DROP TABLE IF EXISTS `question_field_mid`;
CREATE TABLE `question_field_mid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `filed_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id_question_field_mid` (`filed_id`),
  KEY `question_id_question_field_mid` (`question_id`),
  CONSTRAINT `field_id_question_field_mid` FOREIGN KEY (`filed_id`) REFERENCES `field` (`id`) ON DELETE SET NULL,
  CONSTRAINT `question_id_question_field_mid` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_field_mid
-- ----------------------------

-- ----------------------------
-- Table structure for question_tag
-- ----------------------------
DROP TABLE IF EXISTS `question_tag`;
CREATE TABLE `question_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_tag
-- ----------------------------

-- ----------------------------
-- Table structure for question_tag_mid
-- ----------------------------
DROP TABLE IF EXISTS `question_tag_mid`;
CREATE TABLE `question_tag_mid` (
  `question_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `question_id_question_tag_mid` (`question_id`),
  KEY `tag_id_question_tag_mid` (`tag_id`),
  CONSTRAINT `question_id_question_tag_mid` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tag_id_question_tag_mid` FOREIGN KEY (`tag_id`) REFERENCES `question_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_tag_mid
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `auth` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `work_id` varchar(45) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `avartar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `level` int(11) DEFAULT NULL,
  `prestige` int(11) DEFAULT NULL,
  `v` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `level_id` (`level`),
  KEY `prestige_id` (`prestige`),
  KEY `v_id` (`v`),
  CONSTRAINT `level_id` FOREIGN KEY (`level`) REFERENCES `user_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `prestige_id` FOREIGN KEY (`prestige`) REFERENCES `user_prestige` (`id`) ON DELETE SET NULL,
  CONSTRAINT `v_id` FOREIGN KEY (`v`) REFERENCES `user_v` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'antshell', '0', 'lhz', 'antshell', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_field_mid
-- ----------------------------
DROP TABLE IF EXISTS `user_field_mid`;
CREATE TABLE `user_field_mid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `filed_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id_user_field_mid` (`filed_id`),
  KEY `user_id_user_field_mid` (`user_id`),
  CONSTRAINT `field_id_user_field_mid` FOREIGN KEY (`filed_id`) REFERENCES `field` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_id_user_field_mid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_field_mid
-- ----------------------------

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_level
-- ----------------------------

-- ----------------------------
-- Table structure for user_prestige
-- ----------------------------
DROP TABLE IF EXISTS `user_prestige`;
CREATE TABLE `user_prestige` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `avartar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_prestige
-- ----------------------------

-- ----------------------------
-- Table structure for user_v
-- ----------------------------
DROP TABLE IF EXISTS `user_v`;
CREATE TABLE `user_v` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `avartar` varchar(255) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_v
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
