/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.1_3306
Source Server Version : 50173
Source Host           : 192.168.1.1:3306
Source Database       : studyonline

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-04 10:59:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '查看日志');

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissions_0e939a4f` (`group_id`) USING BTREE,
  KEY `auth_group_permissions_8373b171` (`permission_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  KEY `auth_permission_417f1b1c` (`content_type_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 邮箱验证码', '7', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 邮箱验证码', '7', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 邮箱验证码', '7', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 轮播图', '8', 'add_banner');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 轮播图', '8', 'change_banner');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 轮播图', '8', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 课程', '9', 'add_course');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 课程', '9', 'change_course');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 课程', '9', 'delete_course');
INSERT INTO `auth_permission` VALUES ('28', 'Can add lesson', '10', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('29', 'Can change lesson', '10', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete lesson', '10', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('31', 'Can add video', '11', 'add_video');
INSERT INTO `auth_permission` VALUES ('32', 'Can change video', '11', 'change_video');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete video', '11', 'delete_video');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 城市', '13', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 城市', '13', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 城市', '13', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 课程机构', '14', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 课程机构', '14', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 课程机构', '14', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 教师', '15', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 教师', '15', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 教师', '15', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 用户咨询', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 用户咨询', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 用户咨询', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 课程评论', '17', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 课程评论', '17', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 课程评论', '17', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 用户收藏', '18', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 用户收藏', '18', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 用户收藏', '18', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 用户消息', '19', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 用户消息', '19', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 用户消息', '19', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 用户课程', '20', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 用户课程', '20', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 用户课程', '20', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('61', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('62', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('63', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('64', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('65', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('66', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('67', 'Can view 邮箱验证码', '7', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 轮播图', '8', 'view_banner');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 课程', '9', 'view_course');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 章节', '10', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 视频', '11', 'view_video');
INSERT INTO `auth_permission` VALUES ('104', 'Can view 课程资源', '26', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 城市', '13', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 课程机构', '14', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 教师', '15', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 用户咨询', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 课程评论', '17', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 用户收藏', '18', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 用户消息', '19', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户课程', '20', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('96', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('101', 'Can add 课程资源', '26', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('102', 'Can change 课程资源', '26', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete 课程资源', '26', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('106', 'Can add 轮播课程', '9', 'add_bannercourse');
INSERT INTO `auth_permission` VALUES ('107', 'Can change 轮播课程', '9', 'change_bannercourse');
INSERT INTO `auth_permission` VALUES ('108', 'Can delete 轮播课程', '9', 'delete_bannercourse');
INSERT INTO `auth_permission` VALUES ('109', 'Can view 轮播课程', '28', 'view_bannercourse');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_e8701ad4` (`user_id`) USING BTREE,
  KEY `auth_user_groups_0e939a4f` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`) USING BTREE,
  KEY `auth_user_user_permissions_8373b171` (`permission_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `captcha_captchastore`
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('151', 'BGFG', 'bgfg', '10b8e5918d4d71e886f6f9e634e3d7b0b81297a1', '2017-04-24 18:19:24');
INSERT INTO `captcha_captchastore` VALUES ('150', 'HJHG', 'hjhg', 'a5fa6e073641397650686ef36fcab2ac26503ea6', '2017-04-24 18:19:07');
INSERT INTO `captcha_captchastore` VALUES ('149', 'ZMDA', 'zmda', '789e8bce2bd22de4d98a676b9d0f7737a120cc58', '2017-04-24 18:18:59');
INSERT INTO `captcha_captchastore` VALUES ('152', 'VFEZ', 'vfez', '56089c43e06a8ff8ac9866c13fd0ad62feae1a01', '2017-05-04 10:24:57');
INSERT INTO `captcha_captchastore` VALUES ('153', 'SPLF', 'splf', 'e315431655318ece0279f1006d06d84d248c526a', '2017-05-04 10:25:52');
INSERT INTO `captcha_captchastore` VALUES ('154', 'UTEX', 'utex', 'cebd4721960ebe205be331654d33e8b3fc717dd1', '2017-05-04 10:26:06');
INSERT INTO `captcha_captchastore` VALUES ('155', 'FUUT', 'fuut', '795ff476c5ffa46386f70b430a1d9e55e38977d8', '2017-05-04 10:26:30');
INSERT INTO `captcha_captchastore` VALUES ('156', 'ISWZ', 'iswz', '47bcb2334289306c1306c77756ecf64a71f102fa', '2017-05-04 10:27:04');
INSERT INTO `captcha_captchastore` VALUES ('157', 'TZFE', 'tzfe', '3ab84fb1f72d1e481ccd0761342b9dc83e524870', '2017-05-04 10:27:11');
INSERT INTO `captcha_captchastore` VALUES ('158', 'OFLK', 'oflk', '54e028af1f6d226a5a0c822f7cfacf8d6009d08c', '2017-05-04 10:27:20');
INSERT INTO `captcha_captchastore` VALUES ('159', 'CSPF', 'cspf', '03b751f6e782aa3cabce152acfa6b68a699a9be6', '2017-05-04 10:27:27');
INSERT INTO `captcha_captchastore` VALUES ('160', 'FPZR', 'fpzr', '1d75a498a467d2b5b9264d156e0cbc41e820f61b', '2017-05-04 10:27:36');
INSERT INTO `captcha_captchastore` VALUES ('161', 'DRWG', 'drwg', 'bd45b5384f2ac4a4c87442a0b3324aa900abcc23', '2017-05-04 10:27:54');
INSERT INTO `captcha_captchastore` VALUES ('162', 'MQUX', 'mqux', '61a50f1e5fa3b3b3d67c8bdb1606ca58e4f5ba26', '2017-05-04 10:28:18');
INSERT INTO `captcha_captchastore` VALUES ('163', 'MDPK', 'mdpk', '344c7ed6b14e53ad7d3133925b2f3cfe4107314a', '2017-05-04 10:28:27');
INSERT INTO `captcha_captchastore` VALUES ('164', 'KCHI', 'kchi', 'd1a48bde1994140cb8e4ffcd2502742b184d81fd', '2017-05-04 10:29:34');
INSERT INTO `captcha_captchastore` VALUES ('165', 'MZET', 'mzet', 'd74b3851fc9b4bbd03b20e34a65a4e8a7be38843', '2017-05-04 10:32:24');
INSERT INTO `captcha_captchastore` VALUES ('166', 'SDHR', 'sdhr', '82c1a5972e2dc53915e0f9374548d06ef4fa859d', '2017-05-04 10:36:02');
INSERT INTO `captcha_captchastore` VALUES ('167', 'QDIQ', 'qdiq', 'ac72dda9df456f23e10d0f2c1a215fb33b6c06b0', '2017-05-04 10:37:42');
INSERT INTO `captcha_captchastore` VALUES ('168', 'DZHH', 'dzhh', '3634487991f5533ab52ac85e71f3eabecd20f108', '2017-05-04 10:37:47');
INSERT INTO `captcha_captchastore` VALUES ('169', 'ADWP', 'adwp', '91ccc837226885b03625bdc1e1a0cad9d89b2531', '2017-05-04 10:40:02');

-- ----------------------------
-- Table structure for `courses_course`
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(5) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` date NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `you_need_to_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`) USING BTREE,
  KEY `courses_course_d9614d40` (`teacher_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('8', 'MySQL5.7复制功能实战', '实验课', '<p><span style=\"color: rgb(77, 85, 93); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">通过对服务器功能，复制功能，Replication功能及安全和管理功能的新增功能的介绍带您了解最新版的MySQL数据库。</span></p>', '2', '1', '24', '1', 'courses/2017/04/timg_MVkSzS1.jpg', '79', '2017-04-12', '11', '4', '后端开发', 'MySQL', '1、了解MySQL复制基本原理； 2、掌握基于日志点的复制配置方法；3、掌握如何在线变更复制类型；4、掌握多源复制的使用方法和场景；5、掌握多线程复制的使用方法和场景。', '本课程需要对MySQL有一定的使用基础。', '0');
INSERT INTO `courses_course` VALUES ('7', 'Java入门', '基础课', '<p><span style=\"color: rgb(77, 85, 93); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">简介：欢迎来到精彩的Java编程世界！Java语言已经成为当前软件开发行业中主流的开发语言。本课程将介绍Java环境搭建、工具使用、基础语法。带领大家一步一步的踏入Java达人殿堂！Let’s go!</span></p>', '1', '5', '2', '0', 'courses/2017/04/timg_1.jpg', '26', '2017-04-12', '11', '3', '后端开发', 'Java', '1、会配置Java开发环境，并使用工具进行程序开发； 2、掌握Java中基本语法的使用。', '此部分为Java入门课程，适合零基础的小伙伴们，赶紧开始学习吧。', '0');
INSERT INTO `courses_course` VALUES ('13', '算法导论', '拓展课', '<p>课程教授高效率算法的设计及分析技巧，并着重在有实用价值的方法上。课程主题包含了：排序、堆积及散列；各个击破法、动态规划、网络流、计算几何、数字理论性算法、高速缓存技术及并行运算等。</p>', '3', '10', '155', '1', 'courses/2017/04/2439825098144844828.png', '86', '2017-04-13', '13', '4', '后端开发', '算法', '在此基础上，想提升算法设计能力的同学，那这门课程非常适合你。', '适合具备基本编程思想，对基础数据结构已经有了解的同学。', '0');
INSERT INTO `courses_course` VALUES ('14', '高等数学', '基础课', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">广义地说，初等数学之外的数学都是高等数学，也有将中学较深入的代数、几何以及简单的集合论</span><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">初步、逻辑初步称为中等数学的，将其作为中小学阶段的初等数学与大学阶段的高等数学的过渡。</span></p>', '2', '10', '11', '0', 'courses/2017/04/maths.jpg', '26', '2017-04-15', '12', '3', '数学', '数学', '无', '工科、理科研究生考试的基础科目。', '0');
INSERT INTO `courses_course` VALUES ('15', '大学物理', '基础课', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">通过课程的学习，使学生熟悉自然界物质的结构，性质，相互作用及其运动的基本规律，为后继专业基础与专业课程的学习及进一步获取有关知识奠定必要的物理基础。但工科专业以力学基础和电磁学为主要授课。</span></p>', '1', '11', '1', '0', 'courses/2017/04/u26488501722356948398fm23gp0.jpg', '12', '2017-04-15', '12', '4', '物理', '物理', '无', '培养物理学研究问题的思路和方法', '0');
INSERT INTO `courses_course` VALUES ('12', '响应式开发', '实验课', '忘记设备尺寸吧，响应式开发让一切都是弹性的，一套代码失陪多终端，用户体验和开发效率完美结合。', '2', '0', '4', '0', 'courses/2017/04/1.jpg', '27', '2017-04-13', '13', '5', '后端开发', 'Python', '无', '无', '1');

-- ----------------------------
-- Table structure for `courses_courseresource`
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresourse_ea134da7` (`course_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('2', '课程大纲', 'course/resource/2017/04/课程表.doc', '2017-04-13', '13');
INSERT INTO `courses_courseresource` VALUES ('3', '课程大纲', 'course/resource/2017/04/test.txt', '2017-04-15', '8');
INSERT INTO `courses_courseresource` VALUES ('4', '课程大纲', 'course/resource/2017/04/test_v2veYZT.txt', '2017-04-15', '12');
INSERT INTO `courses_courseresource` VALUES ('5', '课程大纲', 'course/resource/2017/04/test_7ODjXuV.txt', '2017-04-15', '7');
INSERT INTO `courses_courseresource` VALUES ('6', '课程大纲', 'course/resource/2017/04/2.txt', '2017-04-15', '14');
INSERT INTO `courses_courseresource` VALUES ('7', '课程大纲', 'course/resource/2017/04/2_4d70Odn.txt', '2017-04-15', '15');

-- ----------------------------
-- Table structure for `courses_lesson`
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_ea134da7` (`course_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('18', '第一章   课程简介及算法分析', '2017-04-13', '13');
INSERT INTO `courses_lesson` VALUES ('19', '第一章 基础知识', '2017-04-15', '8');
INSERT INTO `courses_lesson` VALUES ('20', '第一章 基础知识', '2017-04-15', '12');
INSERT INTO `courses_lesson` VALUES ('21', '第一章 基础知识', '2017-04-15', '7');
INSERT INTO `courses_lesson` VALUES ('22', '第一章 简介', '2017-04-15', '14');
INSERT INTO `courses_lesson` VALUES ('23', '第一章 课程简介', '2017-04-15', '15');

-- ----------------------------
-- Table structure for `courses_video`
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` date NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_55174b7b` (`lesson_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('13', '课程简介及算法分析', '2017-04-13', '18', 'http://ooaovpott.bkt.clouddn.com/%E7%AC%AC1%E9%9B%86.%E8%AF%BE%E7%A8%8B%E7%AE%80%E4%BB%8B%E5%8F%8A%E7%AE%97%E6%B3%95%E5%88%86%E6%9E%90.mp4', '15');
INSERT INTO `courses_video` VALUES ('14', '基础知识', '2017-04-15', '19', 'http://ooaovpott.bkt.clouddn.com/%E7%AC%AC1%E9%9B%86.%E8%AF%BE%E7%A8%8B%E7%AE%80%E4%BB%8B%E5%8F%8A%E', '20');
INSERT INTO `courses_video` VALUES ('15', '基础知识', '2017-04-15', '20', 'http://ooaovpott.bkt.clouddn.com/%E7%AC%AC1%E9%9B%86.%E8%AF%BE%E7%A8%8B%E7%AE%80%E4%BB%8B%E5%8F%8A%E', '20');
INSERT INTO `courses_video` VALUES ('16', '基础知识', '2017-04-15', '21', 'http://ooaovpott.bkt.clouddn.com/%E7%AC%AC1%E9%9B%86.%E8%AF%BE%E7%A8%8B%E7%AE%80%E4%BB%8B%E5%8F%8A%E', '11');
INSERT INTO `courses_video` VALUES ('17', '课程简介', '2017-04-15', '23', 'http://ooaovpott.bkt.clouddn.com/%E7%AC%AC1%E9%9B%86.%E8%AF%BE%E7%A8%8B%E7%AE%80%E4%BB%8B%E5%8F%8A%E7%AE%97%E6%B3%95%E5%88%86%E6%9E%90.mp4', '55');
INSERT INTO `courses_video` VALUES ('18', '简介', '2017-04-15', '22', 'http://ooaovpott.bkt.clouddn.com/%E7%AC%AC1%E9%9B%86.%E8%AF%BE%E7%A8%8B%E7%AE%80%E4%BB%8B%E5%8F%8A%E7%AE%97%E6%B3%95%E5%88%86%E6%9E%90.mp4', '11');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('16', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('26', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('28', 'courses', 'bannercourse');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('10', 'users', '0001_initial', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('13', 'courses', '0001_initial', '2017-03-30 10:13:43');
INSERT INTO `django_migrations` VALUES ('14', 'operation', '0001_initial', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('15', 'organization', '0001_initial', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('17', 'users', '0002_banner', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('18', 'users', '0003_emailverifyrecord', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('19', 'users', '0004_auto_20170330_1610', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('20', 'users', '0005_banner_emailverifyrecord', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('21', 'users', '0006_auto_20170330_1613', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('22', 'users', '0007_banner_emailverifyrecord', '2017-03-30 10:13:44');
INSERT INTO `django_migrations` VALUES ('23', 'courses', '0002_auto_20170331_1346', '2017-03-31 05:46:14');
INSERT INTO `django_migrations` VALUES ('24', 'users', '0008_auto_20170331_1346', '2017-03-31 05:46:15');
INSERT INTO `django_migrations` VALUES ('25', 'xadmin', '0001_initial', '2017-03-31 05:46:15');
INSERT INTO `django_migrations` VALUES ('26', 'xadmin', '0002_log', '2017-03-31 05:46:15');
INSERT INTO `django_migrations` VALUES ('27', 'xadmin', '0003_auto_20160715_0100', '2017-03-31 05:46:15');
INSERT INTO `django_migrations` VALUES ('28', 'captcha', '0001_initial', '2017-03-31 23:29:48');
INSERT INTO `django_migrations` VALUES ('29', 'organization', '0002_auto_20170402_1241', '2017-04-02 12:41:31');
INSERT INTO `django_migrations` VALUES ('30', 'organization', '0003_auto_20170402_1646', '2017-04-02 16:46:50');
INSERT INTO `django_migrations` VALUES ('31', 'organization', '0004_auto_20170402_1701', '2017-04-02 17:01:36');
INSERT INTO `django_migrations` VALUES ('32', 'operation', '0002_auto_20170402_2201', '2017-04-02 22:01:26');
INSERT INTO `django_migrations` VALUES ('33', 'operation', '0003_auto_20170402_2202', '2017-04-02 22:02:59');
INSERT INTO `django_migrations` VALUES ('34', 'courses', '0003_course_course_org', '2017-04-03 11:03:43');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0004_auto_20170403_1231', '2017-04-03 12:31:33');
INSERT INTO `django_migrations` VALUES ('36', 'organization', '0005_teacher_image', '2017-04-03 12:31:33');
INSERT INTO `django_migrations` VALUES ('37', 'operation', '0004_userfavorite_add_time', '2017-04-03 14:43:57');
INSERT INTO `django_migrations` VALUES ('38', 'courses', '0005_course_teacher', '2017-04-03 17:01:24');
INSERT INTO `django_migrations` VALUES ('39', 'operation', '0005_auto_20170403_2104', '2017-04-03 21:04:34');
INSERT INTO `django_migrations` VALUES ('40', 'operation', '0006_auto_20170403_2105', '2017-04-03 21:05:36');
INSERT INTO `django_migrations` VALUES ('41', 'operation', '0007_auto_20170403_2115', '2017-04-03 21:15:57');
INSERT INTO `django_migrations` VALUES ('42', 'courses', '0006_course_category', '2017-04-04 14:08:22');
INSERT INTO `django_migrations` VALUES ('43', 'courses', '0007_course_tag', '2017-04-04 14:38:39');
INSERT INTO `django_migrations` VALUES ('44', 'courses', '0008_auto_20170404_1604', '2017-04-04 16:04:26');
INSERT INTO `django_migrations` VALUES ('45', 'courses', '0009_video_url', '2017-04-04 16:22:17');
INSERT INTO `django_migrations` VALUES ('46', 'courses', '0010_video_learn_times', '2017-04-04 20:42:11');
INSERT INTO `django_migrations` VALUES ('47', 'courses', '0011_auto_20170404_2105', '2017-04-04 21:05:15');
INSERT INTO `django_migrations` VALUES ('48', 'courses', '0012_auto_20170404_2105', '2017-04-04 21:05:56');
INSERT INTO `django_migrations` VALUES ('49', 'users', '0009_auto_20170405_1651', '2017-04-05 16:52:07');
INSERT INTO `django_migrations` VALUES ('50', 'courses', '0013_course_is_banner', '2017-04-05 23:14:53');
INSERT INTO `django_migrations` VALUES ('51', 'organization', '0006_courseorg_tag', '2017-04-05 23:34:14');
INSERT INTO `django_migrations` VALUES ('52', 'courses', '0014_bannercourse', '2017-04-12 15:57:46');
INSERT INTO `django_migrations` VALUES ('53', 'courses', '0015_auto_20170412_1559', '2017-04-12 16:00:09');
INSERT INTO `django_migrations` VALUES ('54', 'courses', '0016_auto_20170412_1604', '2017-04-12 16:04:38');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('6j2pkeswsvdl2pwc98x2qx8k3ied6tgw', 'N2M3MDc5M2RiMmFmOWNmMWIzMGM1NWRiMTQ5Njc3NjQyMmExZjFkODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiTElTVF9RVUVSWSI6W1sib3JnYW5pemF0aW9uIiwiY291cnNlb3JnIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiI3YzY0MWRiNWRjN2U2MmZmZDRjNWZkNGQ1MDk5MzFhNDFmNDBiNDQ0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCJ9', '2017-04-16 12:37:16');
INSERT INTO `django_session` VALUES ('gamyb8wm2tsrmqqhfsjmjxuv6oklcmw2', 'NDcxODZlNmE0MGM5YmI5ZDZhZWJhOGI0NjliZDA1MzNiYTU2NmFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc2MTYyMThiMjUxMWM2Yzg5M2FhNzgzZTQ1M2MyY2FiZmEzNDk3MzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-04-20 00:10:38');
INSERT INTO `django_session` VALUES ('ara1cl684mivuwfh2s7muz6hneog06l7', 'ZDM1NjljZTY1OTExNGUxMDA4YWZlNTRkYmE3OWVjMDQwNDhlM2MwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiI3NjE2MjE4YjI1MTFjNmM4OTNhYTc4M2U0NTNjMmNhYmZhMzQ5NzM5IiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-04-27 10:25:44');
INSERT INTO `django_session` VALUES ('ludf6fbx8ks0qc78ajwqk7jh2fek583a', 'NDcxODZlNmE0MGM5YmI5ZDZhZWJhOGI0NjliZDA1MzNiYTU2NmFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc2MTYyMThiMjUxMWM2Yzg5M2FhNzgzZTQ1M2MyY2FiZmEzNDk3MzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-04-27 14:45:27');
INSERT INTO `django_session` VALUES ('9c2iglbe7tpw2oj3wgn8d7gtqfcs3dq5', 'NTdmZDM0ZGU4ODA4ZTA0NzA5ZWI1ZWM5YWRlMDllOTQ3NmE4YmU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMzEzNzA5NzkxYTg2M2EyMzkxNDVmYTcxNDlkY2M0YjhhMjI1NjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==', '2017-04-27 16:59:09');
INSERT INTO `django_session` VALUES ('i14iota57u4spsw3w40niqcfketbna0m', 'NTdmZDM0ZGU4ODA4ZTA0NzA5ZWI1ZWM5YWRlMDllOTQ3NmE4YmU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMzEzNzA5NzkxYTg2M2EyMzkxNDVmYTcxNDlkY2M0YjhhMjI1NjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==', '2017-04-27 17:38:35');
INSERT INTO `django_session` VALUES ('kv65ksh0svhimca53xyllq6wqudy9334', 'NTdmZDM0ZGU4ODA4ZTA0NzA5ZWI1ZWM5YWRlMDllOTQ3NmE4YmU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMzEzNzA5NzkxYTg2M2EyMzkxNDVmYTcxNDlkY2M0YjhhMjI1NjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==', '2017-04-27 17:01:53');
INSERT INTO `django_session` VALUES ('g8wwyl2p4xzbf1lofef1qb2j0ten9lif', 'NTdmZDM0ZGU4ODA4ZTA0NzA5ZWI1ZWM5YWRlMDllOTQ3NmE4YmU5ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyMzEzNzA5NzkxYTg2M2EyMzkxNDVmYTcxNDlkY2M0YjhhMjI1NjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==', '2017-04-27 17:46:43');
INSERT INTO `django_session` VALUES ('eqz197lt8qgpnv53pqnwu4yebg1jgdlu', 'NDcxODZlNmE0MGM5YmI5ZDZhZWJhOGI0NjliZDA1MzNiYTU2NmFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc2MTYyMThiMjUxMWM2Yzg5M2FhNzgzZTQ1M2MyY2FiZmEzNDk3MzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-04-28 19:52:41');
INSERT INTO `django_session` VALUES ('17l9qxivztkcjm6ulmdc9qezuh9nfwfb', 'MTVkNjFiMmMzZThlMjgyNmZjNTkyNzkzYWFlZmFjNGM0NzUyMzBkNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjNkMDhlMzQzYzE2NzU3OGNiMDEzYWY4ZTlhNGE4MThiOGQxZWU5NGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjExIn0=', '2017-04-27 19:06:13');
INSERT INTO `django_session` VALUES ('4y1kyfuagbr1ssa664z22rn7k2ngd8kw', 'ZmNhZGYzZDg5Y2MyMTdlZmU3NjdjMzBiNmI2OGMwMmY0Mjc3YzcyMjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiTElTVF9RVUVSWSI6W1sib3JnYW5pemF0aW9uIiwiY2l0eWRpY3QiXSwiIl0sIm5hdl9tZW51IjoiW3tcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbi9jaXR5ZGljdC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTIsIFwidGl0bGVcIjogXCJcXHU1N2NlXFx1NWUwMlwifSwge1widXJsXCI6IFwiL3hhZG1pbi9vcmdhbml6YXRpb24vY291cnNlb3JnL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMywgXCJ0aXRsZVwiOiBcIlxcdThiZmVcXHU3YTBiXFx1NjczYVxcdTY3ODRcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL3RlYWNoZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0LCBcInRpdGxlXCI6IFwiXFx1NjU1OVxcdTVlMDhcIn1dLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wiLCBcInRpdGxlXCI6IFwiXFx1NjczYVxcdTY3ODRcXHU3YmExXFx1NzQwNlwifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJhc2svXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE1LCBcInRpdGxlXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU1NGE4XFx1OGJlMlwifSwge1widXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vY291cnNlY29tbWVudHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE2LCBcInRpdGxlXCI6IFwiXFx1OGJmZVxcdTdhMGJcXHU4YmM0XFx1OGJiYVwifSwge1widXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcmZhdm9yaXRlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNywgXCJ0aXRsZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NjUzNlxcdTg1Y2ZcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJtZXNzYWdlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxOCwgXCJ0aXRsZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NmQ4OFxcdTYwNmZcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJjb3Vyc2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE5LCBcInRpdGxlXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU4YmZlXFx1N2EwYlwifV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcm1lc3NhZ2UvXCIsIFwidGl0bGVcIjogXCJcXHU3NTI4XFx1NjIzN1xcdTY0Y2RcXHU0ZjVjXCJ9LCB7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL3hhZG1pbi91c2Vycy91c2VycHJvZmlsZS9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDMsIFwidGl0bGVcIjogXCJcXHU3NTI4XFx1NjIzN1xcdTRmZTFcXHU2MDZmXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2VtYWlsdmVyaWZ5cmVjb3JkL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA1LCBcInRpdGxlXCI6IFwiXFx1OTBhZVxcdTdiYjFcXHU5YThjXFx1OGJjMVxcdTc4MDFcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvYmFubmVyL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA2LCBcInRpdGxlXCI6IFwiXFx1OGY2ZVxcdTY0YWRcXHU1NmZlXCJ9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vdXNlcnMvZW1haWx2ZXJpZnlyZWNvcmQvXCIsIFwidGl0bGVcIjogXCJcXHU3NTI4XFx1NjIzN1xcdTdiYTFcXHU3NDA2XCJ9LCB7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wiLCBcImljb25cIjogXCJmYSBmYS1jb2dcIiwgXCJvcmRlclwiOiAyMSwgXCJ0aXRsZVwiOiBcIlxcdTY1ZTVcXHU1ZmQ3XFx1OGJiMFxcdTVmNTVcIn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1jb2dcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwidGl0bGVcIjogXCJcXHU3YmExXFx1NzQwNlwifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vYXV0aC9ncm91cC9cIiwgXCJpY29uXCI6IFwiZmEgZmEtZ3JvdXBcIiwgXCJvcmRlclwiOiAyLCBcInRpdGxlXCI6IFwiXFx1N2VjNFwifSwge1widXJsXCI6IFwiL3hhZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0LCBcInRpdGxlXCI6IFwiXFx1Njc0M1xcdTk2NTBcIn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwidGl0bGVcIjogXCJcXHU4YmE0XFx1OGJjMVxcdTU0OGNcXHU2Mzg4XFx1Njc0M1wifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9jb3Vyc2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDcsIFwidGl0bGVcIjogXCJcXHU4YmZlXFx1N2EwYlwifSwge1widXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2Jhbm5lcmNvdXJzZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogOCwgXCJ0aXRsZVwiOiBcIlxcdThmNmVcXHU2NGFkXFx1OGJmZVxcdTdhMGJcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9sZXNzb24vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDksIFwidGl0bGVcIjogXCJcXHU3YWUwXFx1ODI4MlwifSwge1widXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL3ZpZGVvL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMCwgXCJ0aXRsZVwiOiBcIlxcdTg5YzZcXHU5ODkxXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlcmVzb3VyY2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExLCBcInRpdGxlXCI6IFwiXFx1OGJmZVxcdTdhMGJcXHU4ZDQ0XFx1NmU5MFwifV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2NvdXJzZXJlc291cmNlL1wiLCBcInRpdGxlXCI6IFwiXFx1OGJmZVxcdTdhMGJcXHU3YmExXFx1NzQwNlwifV0iLCJfYXV0aF91c2VyX2hhc2giOiI3NjE2MjE4YjI1MTFjNmM4OTNhYTc4M2U0NTNjMmNhYmZhMzQ5NzM5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCJ9', '2017-05-08 18:17:19');
INSERT INTO `django_session` VALUES ('tcdrzoueduoz4o79q79ph3vphwhemyx2', 'YzY4MGZhNTgxZjI4MDM0ZDc1ZjRlZmRkOGViY2MyOTljM2JlNTg3ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsInZpZGVvIl0sIiJdLCJuYXZfbWVudSI6Ilt7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL3hhZG1pbi9vcmdhbml6YXRpb24vY2l0eWRpY3QvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyLCBcInRpdGxlXCI6IFwiXFx1NTdjZVxcdTVlMDJcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NvdXJzZW9yZy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTMsIFwidGl0bGVcIjogXCJcXHU4YmZlXFx1N2EwYlxcdTY3M2FcXHU2Nzg0XCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbi90ZWFjaGVyL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNCwgXCJ0aXRsZVwiOiBcIlxcdTY1NTlcXHU1ZTA4XCJ9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbi9jaXR5ZGljdC9cIiwgXCJ0aXRsZVwiOiBcIlxcdTY3M2FcXHU2Nzg0XFx1N2JhMVxcdTc0MDZcIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyYXNrL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNSwgXCJ0aXRsZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NTRhOFxcdThiZTJcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL2NvdXJzZWNvbW1lbnRzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNiwgXCJ0aXRsZVwiOiBcIlxcdThiZmVcXHU3YTBiXFx1OGJjNFxcdThiYmFcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJmYXZvcml0ZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTcsIFwidGl0bGVcIjogXCJcXHU3NTI4XFx1NjIzN1xcdTY1MzZcXHU4NWNmXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VybWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTgsIFwidGl0bGVcIjogXCJcXHU3NTI4XFx1NjIzN1xcdTZkODhcXHU2MDZmXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyY291cnNlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxOSwgXCJ0aXRsZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1OGJmZVxcdTdhMGJcIn1dLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJtZXNzYWdlL1wiLCBcInRpdGxlXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU2NGNkXFx1NGY1Y1wifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJvcmRlclwiOiAzLCBcInRpdGxlXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwifSwge1widXJsXCI6IFwiL3hhZG1pbi91c2Vycy9lbWFpbHZlcmlmeXJlY29yZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNSwgXCJ0aXRsZVwiOiBcIlxcdTkwYWVcXHU3YmIxXFx1OWE4Y1xcdThiYzFcXHU3ODAxXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2Jhbm5lci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNiwgXCJ0aXRsZVwiOiBcIlxcdThmNmVcXHU2NGFkXFx1NTZmZVwifV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3VzZXJzL2VtYWlsdmVyaWZ5cmVjb3JkL1wiLCBcInRpdGxlXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU3YmExXFx1NzQwNlwifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi94YWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMjEsIFwidGl0bGVcIjogXCJcXHU2NWU1XFx1NWZkN1xcdThiYjBcXHU1ZjU1XCJ9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wiLCBcInRpdGxlXCI6IFwiXFx1N2JhMVxcdTc0MDZcIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL2F1dGgvZ3JvdXAvXCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwib3JkZXJcIjogMiwgXCJ0aXRsZVwiOiBcIlxcdTdlYzRcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwib3JkZXJcIjogNCwgXCJ0aXRsZVwiOiBcIlxcdTY3NDNcXHU5NjUwXCJ9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtbG9ja1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcInRpdGxlXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA3LCBcInRpdGxlXCI6IFwiXFx1OGJmZVxcdTdhMGJcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9iYW5uZXJjb3Vyc2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDgsIFwidGl0bGVcIjogXCJcXHU4ZjZlXFx1NjRhZFxcdThiZmVcXHU3YTBiXCJ9LCB7XCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvbGVzc29uL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA5LCBcInRpdGxlXCI6IFwiXFx1N2FlMFxcdTgyODJcIn0sIHtcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy92aWRlby9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTAsIFwidGl0bGVcIjogXCJcXHU4OWM2XFx1OTg5MVwifSwge1widXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2NvdXJzZXJlc291cmNlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMSwgXCJ0aXRsZVwiOiBcIlxcdThiZmVcXHU3YTBiXFx1OGQ0NFxcdTZlOTBcIn1dLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vY291cnNlcy9jb3Vyc2VyZXNvdXJjZS9cIiwgXCJ0aXRsZVwiOiBcIlxcdThiZmVcXHU3YTBiXFx1N2JhMVxcdTc0MDZcIn1dIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzYxNjIxOGIyNTExYzZjODkzYWE3ODNlNDUzYzJjYWJmYTM0OTczOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2017-05-04 10:54:29');
INSERT INTO `django_session` VALUES ('fn08f0ap9zifx5za6e28dva0tfade3ak', 'ZDc3MzhmNDA1MzE1MmUyNTZlZjU2ZWM4OTgxYmE0ODYxNzQ4YWVjYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZhNmQ0NDA4MGQwZjYzN2Y2ZjM5YjVhNTZlOWUyNzFiYjA4MzNjYzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE1In0=', '2017-05-04 11:14:45');
INSERT INTO `django_session` VALUES ('jergavruojn7opx2xpvgej24t85d0k6v', 'NDcxODZlNmE0MGM5YmI5ZDZhZWJhOGI0NjliZDA1MzNiYTU2NmFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc2MTYyMThiMjUxMWM2Yzg5M2FhNzgzZTQ1M2MyY2FiZmEzNDk3MzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-05-12 18:37:47');
INSERT INTO `django_session` VALUES ('335ivpiz22n00povlf38c149pnco0uif', 'NDcxODZlNmE0MGM5YmI5ZDZhZWJhOGI0NjliZDA1MzNiYTU2NmFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc2MTYyMThiMjUxMWM2Yzg5M2FhNzgzZTQ1M2MyY2FiZmEzNDk3MzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2017-05-18 10:35:06');

-- ----------------------------
-- Table structure for `operation_coursecomments`
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_ea134da7` (`course_id`) USING BTREE,
  KEY `operation_coursecomments_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('5', '啊', '2017-04-13 11:11:11', '13', '2');

-- ----------------------------
-- Table structure for `operation_userask`
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES ('1', 'ywh', '15622262330', 'django', '2017-04-02 22:01:45');
INSERT INTO `operation_userask` VALUES ('2', 'hwy', '13642639223', 'django', '2017-04-02 22:08:49');
INSERT INTO `operation_userask` VALUES ('3', 'ywh', '15622262330', '1', '2017-04-12 21:56:20');

-- ----------------------------
-- Table structure for `operation_usercourse`
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` date NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_ea134da7` (`course_id`) USING BTREE,
  KEY `operation_usercourse_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('4', '2017-04-12', '8', '2');
INSERT INTO `operation_usercourse` VALUES ('8', '2017-04-13', '13', '4');
INSERT INTO `operation_usercourse` VALUES ('5', '2017-04-13', '13', '2');
INSERT INTO `operation_usercourse` VALUES ('7', '2017-04-13', '12', '2');
INSERT INTO `operation_usercourse` VALUES ('9', '2017-04-13', '8', '4');
INSERT INTO `operation_usercourse` VALUES ('10', '2017-04-13', '7', '4');
INSERT INTO `operation_usercourse` VALUES ('11', '2017-04-13', '12', '9');
INSERT INTO `operation_usercourse` VALUES ('12', '2017-04-13', '13', '11');
INSERT INTO `operation_usercourse` VALUES ('13', '2017-04-15', '7', '2');
INSERT INTO `operation_usercourse` VALUES ('14', '2017-04-15', '15', '2');
INSERT INTO `operation_usercourse` VALUES ('15', '2017-04-15', '14', '2');
INSERT INTO `operation_usercourse` VALUES ('16', '2017-04-20', '12', '13');
INSERT INTO `operation_usercourse` VALUES ('17', '2017-04-20', '13', '15');

-- ----------------------------
-- Table structure for `operation_userfavorite`
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('144', '13', '1', '2', '2017-04-13 12:41:41');
INSERT INTO `operation_userfavorite` VALUES ('145', '13', '2', '2', '2017-04-13 12:44:15');
INSERT INTO `operation_userfavorite` VALUES ('146', '12', '2', '2', '2017-04-13 12:51:56');
INSERT INTO `operation_userfavorite` VALUES ('147', '11', '2', '2', '2017-04-15 20:12:31');
INSERT INTO `operation_userfavorite` VALUES ('149', '8', '1', '2', '2017-04-20 11:25:27');

-- ----------------------------
-- Table structure for `operation_usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES ('2', '6', '欢迎注册慕学在线网', '0', '2017-04-13');
INSERT INTO `operation_usermessage` VALUES ('3', '7', '欢迎注册慕学在线网', '0', '2017-04-13');
INSERT INTO `operation_usermessage` VALUES ('4', '8', '欢迎注册慕学在线网', '0', '2017-04-13');
INSERT INTO `operation_usermessage` VALUES ('5', '9', '欢迎注册慕学在线网', '1', '2017-04-13');
INSERT INTO `operation_usermessage` VALUES ('6', '10', '欢迎注册慕学在线网', '0', '2017-04-13');
INSERT INTO `operation_usermessage` VALUES ('7', '11', '欢迎注册慕学在线网', '1', '2017-04-13');
INSERT INTO `operation_usermessage` VALUES ('8', '12', '欢迎注册慕学在线网', '0', '2017-04-13');
INSERT INTO `operation_usermessage` VALUES ('9', '13', '欢迎注册慕学在线网', '1', '2017-04-20');
INSERT INTO `operation_usermessage` VALUES ('10', '14', '欢迎注册慕学在线网', '0', '2017-04-20');
INSERT INTO `operation_usermessage` VALUES ('11', '15', '欢迎注册慕学在线网', '1', '2017-04-20');

-- ----------------------------
-- Table structure for `organization_citydict`
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('8', '南京市', '南京市', '2017-04-12');
INSERT INTO `organization_citydict` VALUES ('7', '上海市', '上海市', '2017-04-12');
INSERT INTO `organization_citydict` VALUES ('6', '北京市', '首都', '2017-04-12');
INSERT INTO `organization_citydict` VALUES ('9', '广州市', '广州市', '2017-04-15');

-- ----------------------------
-- Table structure for `organization_courseorg`
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` date NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `courses_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseorg_c7141997` (`city_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('13', '南京大学', '南京大学（Nanjing University），简称“南大”  ，是教育部直属、中央直管副部级建制的全国重点大学，国家首批“211工程”、“985工程”高校，首批“珠峰计划”、“111计划”、“2011计划”、“卓越计划”实施高校，也是九校联盟、中国大学校长联谊会、环太平洋大学联盟、21世纪学术联盟和东亚研究型大学协会的重要成员。', '36', '1', 'org/2017/04/nanjing.jpg', '鼓楼区汉口路22号', '2017-04-12', '8', 'gx', '2', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('14', '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '19', '0', 'org/2017/04/14920074011.jpg', 'http://www.imooc.com/', '2017-04-12', '6', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('11', '北京大学', '北京大学（Peking University）简称“北大”，诞生于1898年，初名京师大学堂，是中国近代第一所国立大学，也是第一个以“大学”之名创办的学校，其成立标志着中国近代高等教育的开端。北大是中国近代以来唯一以国家最高学府身份创立的学校，最初也是国家最高教育行政机关，行使教育部职能，统管全国教育。北大催生了中国最早的现代学制，开创了中国最早的文科、理科、社科、农科、医科等大学学科，是近代以来中国高等教育的奠基者。', '19', '1', 'org/2017/04/bjdx.jpg', '北京市海淀区颐和园路5号', '2017-04-12', '6', 'gx', '2', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('12', '清华大学', '清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”，入选”珠峰计划“、”2011计划“、”111计划“、”卓越工程师教育培养计划“、”卓越法律人才教育培养计划“、”卓越医生教育培养计划“，为九校联盟、东亚研究型大学协会、环太平洋大学联盟、亚洲大学联盟、清华大学—剑桥大学—麻省理工学院低碳能源大学联盟成员。', '12', '1', 'org/2017/04/tsing.png', '海淀区中关村北大街', '2017-04-12', '6', 'gx', '2', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('15', '广东工业大学', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '1', '0', 'org/2017/04/gg.jpg', '广东省广州市', '2017-04-15', '9', 'gx', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('16', '广州大学', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一[1]  ，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '5', '0', 'org/2017/04/gzhu.jpg', '广东省广州市', '2017-04-15', '9', 'gx', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('17', 'Github', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一[1]  ，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '2', '0', 'org/2017/04/Github.jpg', 'http://www.imooc.com/', '2017-04-15', '8', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('18', '斯坦福大学', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一[1]  ，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '3', '0', 'org/2017/04/sitabfu.jpg', '北京市海淀区颐和园路5号', '2017-04-15', '6', 'gx', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('19', '实验楼', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一[1]  ，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '1', '0', 'org/2017/04/shiyanlou.jpg', '鼓楼区汉口路22号', '2017-04-15', '8', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('20', '腾讯课堂', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一[1]  ，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '12', '0', 'org/2017/04/tengxun.jpg', '鼓楼区汉口路22号', '2017-04-15', '8', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('21', '新东方', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一[1]  ，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '1', '0', 'org/2017/04/xindongfang.jpg', '鼓楼区汉口路22号', '2017-04-15', '7', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('22', '沪江网', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一[1]  ，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '2', '0', 'org/2017/04/hujiang.jpg', '广东省广州市', '2017-04-15', '9', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('23', '网易云课堂', '广东工业大学（Guangdong University of Technology）是一所以工学为主，工、理、经、管、文、法、艺术多科性协调发展的省属重点大学、广东省“九五”和“十五”期间重点建设的10所省级211--广东省“211工程”高校和广东省高水平大学重点建设高校之一[1]  ，是教育部本科教学评估优秀学校，教育部“卓越工程师教育培养计划“高校。', '8', '0', 'org/2017/04/1512_KO3iLIu.jpg', '鼓楼区汉口路22号', '2017-04-15', '8', 'pxjg', '0', '0', '全国知名');

-- ----------------------------
-- Table structure for `organization_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `point` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` date NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_9cf869aa` (`org_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('3', '牛岛若利', '1', '白鸟泽学院', '主攻手', '王牌球员，左撇子。', '46', '0', '2017-04-12', '11', 'teachers/2017/04/20170412223806.jpg');
INSERT INTO `organization_teacher` VALUES ('4', '阿库娅', '0', '阿克西斯教', '女神', '智障', '22', '0', '2017-04-12', '12', 'teachers/2017/04/20170412223748.jpg');
INSERT INTO `organization_teacher` VALUES ('5', '英梨梨', '0', '丰之崎学园', '同人画师', '死宅', '4', '0', '2017-04-12', '11', 'teachers/2017/04/20170412223810.jpg');

-- ----------------------------
-- Table structure for `users_banner`
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('11', '44', 'banner/2017/04/44.jpg', 'http://www.baidu.com', '1', '2017-04-13');
INSERT INTO `users_banner` VALUES ('8', '响应式开发', 'banner/2017/04/22.jpg', 'http://www.baidu.com', '3', '2017-04-13');
INSERT INTO `users_banner` VALUES ('10', '33', 'banner/2017/04/33.jpg', 'http://www.baidu.com', '2', '2017-04-13');

-- ----------------------------
-- Table structure for `users_emailverifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', '7wO3cdEE8gFwQ5YH', 'yipwinghong@sina.com', 'register', '2017-04-01');
INSERT INTO `users_emailverifyrecord` VALUES ('2', '8IS4i0i9FJ24Sa9T', '418704861@qq.com', 'register', '2017-04-01');
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'ocKYa4kDCADgI4qY', '418704861@qq.com', 'forget', '2017-04-01');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'R3a8Z2aNFvTna5Si', '418704861@qq.com', 'forget', '2017-04-01');
INSERT INTO `users_emailverifyrecord` VALUES ('5', 'V3iv2aOuQGGPTWbX', '418704861@qq.com', 'forget', '2017-04-01');
INSERT INTO `users_emailverifyrecord` VALUES ('6', 'j0UK1JvIUtHeSL2w', '418704861@qq.com', 'forget', '2017-04-01');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'Kxw4b4rEN1ye17wH', '418704861@qq.com', 'forget', '2017-04-01');
INSERT INTO `users_emailverifyrecord` VALUES ('8', '9OY1jRNHGqX2QjFI', '418704861@qq.com', 'forget', '2017-04-01');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'HcmL4Opnp1kvgecj', '418704861@qq.com', 'register', '2017-04-13');
INSERT INTO `users_emailverifyrecord` VALUES ('10', '8i4JaUKY6elLHweg', '418704861@qq.com', 'register', '2017-04-13');
INSERT INTO `users_emailverifyrecord` VALUES ('11', 'dGGiXfHphyUnr58o', '641638018y@sina.cn', 'register', '2017-04-13');
INSERT INTO `users_emailverifyrecord` VALUES ('12', 'Z8CrkLj6skpVKghF', '418704861@qq.com', 'register', '2017-04-13');
INSERT INTO `users_emailverifyrecord` VALUES ('13', 'bq5Ma2f3kT8LSHr4', '641638018y@sina.cn', 'register', '2017-04-13');
INSERT INTO `users_emailverifyrecord` VALUES ('14', 'hJtSjZ6ZMO62gSPt', '574219575@qq.com', 'register', '2017-04-13');
INSERT INTO `users_emailverifyrecord` VALUES ('15', 'v34bgmIpq7vHuzmY', '492205309@qq.com', 'register', '2017-04-13');
INSERT INTO `users_emailverifyrecord` VALUES ('16', 'B84iRLTqoj2Awqmo', '1520752231@qq.com', 'register', '2017-04-20');
INSERT INTO `users_emailverifyrecord` VALUES ('17', 'lQbuoBEsmIZQbGci', '2932614896@qq.com', 'register', '2017-04-20');
INSERT INTO `users_emailverifyrecord` VALUES ('18', 'HWfmXDywFiMptvPy', '2932614806@qq.com', 'register', '2017-04-20');

-- ----------------------------
-- Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$24000$ZZXQ3DA3lRuy$UNGTxHP3G1SXOIHgVZlS04WvAUKQB0ksrX24L1pwz4Q=', '2017-05-04 10:35:06', '1', 'admin', '', '', 'yipwinghong@outlook.com', '1', '1', '2017-03-31 06:13:52', 'ywh', null, 'female', '', '1562226233', 'image/2017/04/20170413144821.jpg');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$24000$p1rSYCIeB6I5$EF6aChJa9o8DOPJ/eo8HM1nKrNomK/93p+i3oEftbN4=', '2017-04-13 18:24:09', '0', 'test', '', '', 'yipwinghong@sina.com', '0', '1', '2017-04-01 10:04:00', 'test', null, 'male', '海淀区中关村北大街', '110', 'image/2017/04/20170413153405.jpg');
INSERT INTO `users_userprofile` VALUES ('9', 'pbkdf2_sha256$24000$VlyHYkxAg9r4$124SgoRVkT7ZZE1kOgNLu+DgDNEDNyFeMksWf1XneJA=', '2017-04-13 18:33:46', '0', '418704861@qq.com', '', '', '418704861@qq.com', '0', '1', '2017-04-13 18:32:58', 'ywh', null, 'female', '', '', 'image/2017/04/111.png');
INSERT INTO `users_userprofile` VALUES ('11', 'pbkdf2_sha256$24000$AA3TiUeULleD$HBMZix9myhjIkBVcVFVIU8q2aCLj7zho1o8gSEnzknQ=', '2017-04-13 19:06:13', '0', '574219575@qq.com', '', '', '574219575@qq.com', '0', '1', '2017-04-13 19:05:36', 'CKamadev', null, 'male', '', '', 'image/2017/04/bebbecf33a87e950a9c61a7119385343faf2b412.jpg');
INSERT INTO `users_userprofile` VALUES ('13', 'pbkdf2_sha256$24000$NFy8cuBngEJ6$csxfb9RMMj5e2zJMbkzNS7iv2T63oBALlQQbiScVhKk=', '2017-04-20 10:50:59', '0', '1520752231@qq.com', '', '', '1520752231@qq.com', '0', '1', '2017-04-20 10:49:36', '', null, 'female', '', null, 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('14', 'pbkdf2_sha256$24000$NsKB2s5LzzYH$ZXMoQhW+4KZX6PQHClKPEk/i5I3NXjbNg9Winr9bvPM=', null, '0', '2932614896@qq.com', '', '', '2932614896@qq.com', '0', '0', '2017-04-20 11:11:12', '', null, 'female', '', null, 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('15', 'pbkdf2_sha256$24000$J9fYXC973BOn$TwlAOdMs2KiSixCnxgu9P8tuu7LWXay2ClRxq331pks=', '2017-04-20 11:14:45', '0', '2932614806@qq.com', '', '', '2932614806@qq.com', '0', '1', '2017-04-20 11:13:31', '', null, 'female', '', null, 'image/default.png');

-- ----------------------------
-- Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`) USING BTREE,
  KEY `users_userprofile_groups_9c2a73e9` (`userprofile_id`) USING BTREE,
  KEY `users_userprofile_groups_0e939a4f` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`) USING BTREE,
  KEY `users_userprofile_user_permissions_9c2a73e9` (`userprofile_id`) USING BTREE,
  KEY `users_userprofile_user_permissions_8373b171` (`permission_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_417f1b1c` (`content_type_id`) USING BTREE,
  KEY `xadmin_bookmark_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_417f1b1c` (`content_type_id`) USING BTREE,
  KEY `xadmin_log_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('2', '2017-04-02 12:18:22', '127.0.0.1', '1', '广州市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('3', '2017-04-02 12:19:06', '127.0.0.1', '2', '北京市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('4', '2017-04-02 12:19:47', '127.0.0.1', '3', '上海市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('5', '2017-04-02 12:20:55', '127.0.0.1', '4', '深圳市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('6', '2017-04-02 12:21:13', '127.0.0.1', '5', '杭州市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('7', '2017-04-02 12:29:55', '127.0.0.1', '1', 'CourseOrg object', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('8', '2017-04-02 12:33:19', '127.0.0.1', '2', '慕课网2', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('9', '2017-04-02 12:33:44', '127.0.0.1', '3', '慕课网3', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('10', '2017-04-02 12:34:23', '127.0.0.1', '4', '慕课网4', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('11', '2017-04-02 12:34:51', '127.0.0.1', '5', '慕课网5', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('12', '2017-04-02 12:35:54', '127.0.0.1', '6', '慕课网6', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('13', '2017-04-02 12:36:19', '127.0.0.1', '7', '慕课网7', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('14', '2017-04-02 12:36:39', '127.0.0.1', '8', '慕课网8', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('15', '2017-04-02 12:36:57', '127.0.0.1', '9', '慕课网9', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('16', '2017-04-02 12:37:11', '127.0.0.1', '10', '慕课网10', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('17', '2017-04-03 10:59:58', '127.0.0.1', '1', '周杰伦', 'create', '已添加', '15', '2');
INSERT INTO `xadmin_log` VALUES ('18', '2017-04-03 11:00:44', '127.0.0.1', '2', '杰伦周', 'create', '已添加', '15', '2');
INSERT INTO `xadmin_log` VALUES ('19', '2017-04-03 11:05:42', '127.0.0.1', '1', 'Django入门', 'create', '已添加', '9', '2');
INSERT INTO `xadmin_log` VALUES ('20', '2017-04-03 11:40:21', '127.0.0.1', '1', 'Python入门', 'change', '已修改 name，desc 和 detail 。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('21', '2017-04-03 13:25:58', '127.0.0.1', '2', '杰伦周', 'change', '已修改 image 。', '15', '2');
INSERT INTO `xadmin_log` VALUES ('22', '2017-04-03 13:30:18', '127.0.0.1', '1', '周杰伦', 'change', '已修改 image 。', '15', '2');
INSERT INTO `xadmin_log` VALUES ('23', '2017-04-04 02:56:10', '127.0.0.1', '2', 'Python进阶', 'create', '已添加', '9', '2');
INSERT INTO `xadmin_log` VALUES ('24', '2017-04-04 02:56:50', '127.0.0.1', '3', 'Python高级', 'create', '已添加', '9', '2');
INSERT INTO `xadmin_log` VALUES ('25', '2017-04-04 02:57:14', '127.0.0.1', '4', 'Java入门', 'create', '已添加', '9', '2');
INSERT INTO `xadmin_log` VALUES ('26', '2017-04-04 02:57:43', '127.0.0.1', '5', 'Java进阶', 'create', '已添加', '9', '2');
INSERT INTO `xadmin_log` VALUES ('27', '2017-04-04 02:58:05', '127.0.0.1', '6', 'Java高级', 'create', '已添加', '9', '2');
INSERT INTO `xadmin_log` VALUES ('28', '2017-04-04 16:15:12', '127.0.0.1', '1', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('29', '2017-04-04 16:15:17', '127.0.0.1', '2', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('30', '2017-04-04 16:15:25', '127.0.0.1', '3', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('31', '2017-04-04 16:15:31', '127.0.0.1', '4', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('32', '2017-04-04 16:15:36', '127.0.0.1', '5', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('33', '2017-04-04 16:15:42', '127.0.0.1', '6', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('34', '2017-04-04 16:15:47', '127.0.0.1', '7', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('35', '2017-04-04 16:15:53', '127.0.0.1', '8', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('36', '2017-04-04 16:16:29', '127.0.0.1', '8', 'Lesson object', 'delete', '', '10', '2');
INSERT INTO `xadmin_log` VALUES ('37', '2017-04-04 16:16:34', '127.0.0.1', null, '', 'delete', '批量删除 7 个 章节', null, '2');
INSERT INTO `xadmin_log` VALUES ('38', '2017-04-04 16:17:05', '127.0.0.1', '9', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('39', '2017-04-04 16:17:08', '127.0.0.1', '10', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('40', '2017-04-04 16:17:16', '127.0.0.1', '11', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('41', '2017-04-04 16:17:30', '127.0.0.1', '12', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('42', '2017-04-04 16:17:34', '127.0.0.1', '13', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('43', '2017-04-04 16:17:37', '127.0.0.1', '14', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('44', '2017-04-04 16:17:43', '127.0.0.1', '15', 'Lesson object', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('45', '2017-04-04 16:18:49', '127.0.0.1', '16', '第8章 基础知识', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('46', '2017-04-04 16:18:54', '127.0.0.1', '17', '第8章 基础知识9', 'create', '已添加', '10', '2');
INSERT INTO `xadmin_log` VALUES ('47', '2017-04-04 16:19:14', '127.0.0.1', '17', '第9章 基础知识', 'change', '已修改 name 。', '10', '2');
INSERT INTO `xadmin_log` VALUES ('48', '2017-04-04 16:23:09', '127.0.0.1', '1', 'Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('49', '2017-04-04 16:23:27', '127.0.0.1', null, '', 'delete', '批量删除 1 个 视频', null, '2');
INSERT INTO `xadmin_log` VALUES ('50', '2017-04-04 16:23:41', '127.0.0.1', '2', '1.1 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('51', '2017-04-04 16:23:46', '127.0.0.1', '3', '1.2 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('52', '2017-04-04 16:23:57', '127.0.0.1', '4', '1.3 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('53', '2017-04-04 16:24:05', '127.0.0.1', '5', '1.4 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('54', '2017-04-04 16:24:12', '127.0.0.1', '6', '1.5 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('55', '2017-04-04 16:24:18', '127.0.0.1', '7', '1.6 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('56', '2017-04-04 16:24:31', '127.0.0.1', '7', '1.6 Hello World', 'change', '已修改 url 。', '11', '2');
INSERT INTO `xadmin_log` VALUES ('57', '2017-04-04 16:25:06', '127.0.0.1', '8', '2.1 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('58', '2017-04-04 16:25:11', '127.0.0.1', '9', '2.2 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('59', '2017-04-04 16:25:16', '127.0.0.1', '10', '2.3 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('60', '2017-04-04 16:25:21', '127.0.0.1', '11', '2.4 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('61', '2017-04-04 16:25:26', '127.0.0.1', '12', '2.5 Hello World', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('62', '2017-04-04 16:36:52', '127.0.0.1', null, '', 'delete', '批量删除 6 个 章节', null, '2');
INSERT INTO `xadmin_log` VALUES ('63', '2017-04-04 20:51:54', '127.0.0.1', '1', '前端页面', 'create', '已添加', '26', '2');
INSERT INTO `xadmin_log` VALUES ('64', '2017-04-04 21:00:51', '127.0.0.1', '1', 'Python入门', 'change', '已修改 teacher 和 tag 。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('65', '2017-04-04 21:09:27', '127.0.0.1', '1', 'Python入门', 'change', '已修改 you_need_to_know 和 teacher_tell 。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('66', '2017-04-04 21:09:44', '127.0.0.1', '1', 'Python入门', 'change', '已修改 teacher_tell 。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('67', '2017-04-05 10:59:25', '127.0.0.1', null, '', 'delete', '批量删除 1 个 章节', null, '2');
INSERT INTO `xadmin_log` VALUES ('68', '2017-04-05 10:59:59', '127.0.0.1', '2', '1.1 Hello World', 'change', '已修改 url 。', '11', '2');
INSERT INTO `xadmin_log` VALUES ('69', '2017-04-12 14:17:47', '127.0.0.1', '1', '查看日志', 'create', '已添加', '3', '2');
INSERT INTO `xadmin_log` VALUES ('70', '2017-04-12 21:41:07', '127.0.0.1', '1', 'Python入门', 'change', '已修改 image 。', '28', '2');
INSERT INTO `xadmin_log` VALUES ('71', '2017-04-12 21:43:44', '127.0.0.1', '1', 'Banner object', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('72', '2017-04-12 21:46:28', '127.0.0.1', '2', 'Banner object', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('73', '2017-04-12 21:46:41', '127.0.0.1', '1', 'Banner object', 'delete', '', '8', '2');
INSERT INTO `xadmin_log` VALUES ('74', '2017-04-12 21:54:17', '127.0.0.1', null, '', 'delete', '批量删除 1 个 轮播图', null, '2');
INSERT INTO `xadmin_log` VALUES ('75', '2017-04-12 21:54:58', '127.0.0.1', '3', 'Banner object', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('76', '2017-04-12 21:55:23', '127.0.0.1', '4', 'Banner object', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('77', '2017-04-12 22:13:23', '127.0.0.1', '1', 'Python入门', 'change', '已修改 image 。', '28', '2');
INSERT INTO `xadmin_log` VALUES ('78', '2017-04-12 22:16:55', '127.0.0.1', null, '', 'delete', '批量删除 2 个 轮播图', null, '2');
INSERT INTO `xadmin_log` VALUES ('79', '2017-04-12 22:17:13', '127.0.0.1', '5', 'Banner object', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('80', '2017-04-12 22:18:02', '127.0.0.1', null, '', 'delete', '批量删除 1 个 轮播图', null, '2');
INSERT INTO `xadmin_log` VALUES ('81', '2017-04-12 22:25:03', '127.0.0.1', null, '', 'delete', '批量删除 5 个 课程', null, '2');
INSERT INTO `xadmin_log` VALUES ('82', '2017-04-12 22:25:11', '127.0.0.1', null, '', 'delete', '批量删除 2 个 章节', null, '2');
INSERT INTO `xadmin_log` VALUES ('83', '2017-04-12 22:25:33', '127.0.0.1', null, '', 'delete', '批量删除 1 个 轮播课程', null, '2');
INSERT INTO `xadmin_log` VALUES ('84', '2017-04-12 22:26:00', '127.0.0.1', null, '', 'delete', '批量删除 10 个 课程机构', null, '2');
INSERT INTO `xadmin_log` VALUES ('85', '2017-04-12 22:26:09', '127.0.0.1', null, '', 'delete', '批量删除 5 个 城市', null, '2');
INSERT INTO `xadmin_log` VALUES ('86', '2017-04-12 22:28:59', '127.0.0.1', '6', '北京市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('87', '2017-04-12 22:29:08', '127.0.0.1', '7', '上海市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('88', '2017-04-12 22:29:19', '127.0.0.1', '8', '南京市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('89', '2017-04-12 22:30:36', '127.0.0.1', '11', '北京市', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('90', '2017-04-12 22:31:37', '127.0.0.1', '12', '清华大学', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('91', '2017-04-12 22:32:36', '127.0.0.1', '13', '南京市', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('92', '2017-04-12 22:33:12', '127.0.0.1', '14', '慕课网', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('93', '2017-04-12 22:38:35', '127.0.0.1', '11', '北京大学', 'change', '已修改 name 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('94', '2017-04-12 22:38:43', '127.0.0.1', '13', '南京大学', 'change', '已修改 name 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('95', '2017-04-12 22:43:48', '127.0.0.1', '3', '牛岛若利', 'create', '已添加', '15', '2');
INSERT INTO `xadmin_log` VALUES ('96', '2017-04-12 22:44:39', '127.0.0.1', '4', '阿库娅', 'create', '已添加', '15', '2');
INSERT INTO `xadmin_log` VALUES ('97', '2017-04-12 22:46:09', '127.0.0.1', '5', '泽村·斯潘塞·英梨梨', 'create', '已添加', '15', '2');
INSERT INTO `xadmin_log` VALUES ('98', '2017-04-12 22:47:22', '127.0.0.1', '6', 'Banner object', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('99', '2017-04-12 22:47:59', '127.0.0.1', '7', '遇见好答案', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('100', '2017-04-12 23:41:20', '127.0.0.1', '5', '泽村·斯潘塞·英梨', 'change', '已修改 name 。', '15', '2');
INSERT INTO `xadmin_log` VALUES ('101', '2017-04-12 23:41:48', '127.0.0.1', '5', '英梨梨', 'change', '已修改 name 。', '15', '2');
INSERT INTO `xadmin_log` VALUES ('102', '2017-04-13 00:26:51', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程', null, '2');
INSERT INTO `xadmin_log` VALUES ('103', '2017-04-13 00:28:41', '127.0.0.1', '12', 'Python错误和异常', 'create', '已添加', '28', '2');
INSERT INTO `xadmin_log` VALUES ('104', '2017-04-13 00:39:14', '127.0.0.1', '12', '响应式开发', 'change', '已修改 name，desc，detail，image，you_need_to_know，teacher_tell 和 tag 。', '28', '2');
INSERT INTO `xadmin_log` VALUES ('105', '2017-04-13 09:52:35', '127.0.0.1', '13', '课程简介及算法分析', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('106', '2017-04-13 14:51:19', '121.68.98.169', null, '', 'delete', '批量删除 2 个 轮播图', null, '2');
INSERT INTO `xadmin_log` VALUES ('107', '2017-04-13 14:52:16', '121.68.98.169', '8', '响应式开发', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('108', '2017-04-13 14:52:34', '121.68.98.169', '9', '遇见好答案', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('109', '2017-04-13 14:53:20', '121.68.98.169', null, '', 'delete', '批量删除 2 个 课程', null, '2');
INSERT INTO `xadmin_log` VALUES ('110', '2017-04-13 14:54:00', '121.68.98.169', '13', '南京大学', 'change', '已修改 image 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('111', '2017-04-13 14:54:31', '121.68.98.169', '12', '清华大学', 'change', '已修改 image 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('112', '2017-04-13 14:57:23', '121.68.98.169', '12', '响应式开发', 'change', '已修改 image 。', '28', '2');
INSERT INTO `xadmin_log` VALUES ('113', '2017-04-13 14:58:35', '121.68.98.169', '5', '英梨梨', 'change', '已修改 image 。', '15', '2');
INSERT INTO `xadmin_log` VALUES ('114', '2017-04-13 14:58:42', '121.68.98.169', '4', '阿库娅', 'change', '已修改 image 。', '15', '2');
INSERT INTO `xadmin_log` VALUES ('115', '2017-04-13 14:58:49', '121.68.98.169', '3', '牛岛若利', 'change', '已修改 image 。', '15', '2');
INSERT INTO `xadmin_log` VALUES ('116', '2017-04-13 15:02:47', '121.68.98.169', null, '', 'delete', '批量删除 1 个 用户消息', null, '2');
INSERT INTO `xadmin_log` VALUES ('117', '2017-04-13 15:02:57', '121.68.98.169', null, '', 'delete', '批量删除 1 个 用户信息', null, '2');
INSERT INTO `xadmin_log` VALUES ('118', '2017-04-13 15:10:06', '121.68.98.169', null, '', 'delete', '批量删除 1 个 用户信息', null, '2');
INSERT INTO `xadmin_log` VALUES ('119', '2017-04-13 15:25:20', '121.68.98.169', '4', 'test', 'change', '已修改 last_login，username，nick_name，gender，address 和 image 。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('120', '2017-04-13 15:38:29', '121.68.98.169', '9', '遇见好答案', 'change', '已修改 image 。', '8', '2');
INSERT INTO `xadmin_log` VALUES ('121', '2017-04-13 15:39:02', '121.68.98.169', '9', '遇见好答案', 'change', '已修改 image 。', '8', '2');
INSERT INTO `xadmin_log` VALUES ('122', '2017-04-13 15:41:08', '121.68.98.169', '9', '遇见好答案', 'change', '已修改 image 。', '8', '2');
INSERT INTO `xadmin_log` VALUES ('123', '2017-04-13 15:44:38', '121.68.98.169', '9', '遇见好答案', 'change', '已修改 image 。', '8', '2');
INSERT INTO `xadmin_log` VALUES ('124', '2017-04-13 15:48:10', '121.68.98.169', '8', '响应式开发', 'change', '已修改 image 。', '8', '2');
INSERT INTO `xadmin_log` VALUES ('125', '2017-04-13 15:54:14', '121.68.98.169', '10', '33', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('126', '2017-04-13 15:54:33', '121.68.98.169', '9', '遇见好答案', 'delete', '', '8', '2');
INSERT INTO `xadmin_log` VALUES ('127', '2017-04-13 15:54:49', '121.68.98.169', '11', '44', 'create', '已添加', '8', '2');
INSERT INTO `xadmin_log` VALUES ('128', '2017-04-13 15:54:56', '121.68.98.169', '8', '响应式开发', 'change', '已修改 index 。', '8', '2');
INSERT INTO `xadmin_log` VALUES ('129', '2017-04-13 15:55:00', '121.68.98.169', '10', '33', 'change', '已修改 index 。', '8', '2');
INSERT INTO `xadmin_log` VALUES ('130', '2017-04-15 14:37:57', '42.197.163.13', '9', '广州市', 'create', '已添加', '13', '2');
INSERT INTO `xadmin_log` VALUES ('131', '2017-04-15 14:38:35', '42.197.163.13', '15', '广东工业大学', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('132', '2017-04-15 14:38:58', '42.197.163.13', '16', '广州大学', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('133', '2017-04-15 14:39:31', '42.197.163.13', '17', 'Github', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('134', '2017-04-15 14:39:52', '42.197.163.13', '18', '斯坦福大学', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('135', '2017-04-15 14:40:16', '42.197.163.13', '19', '实验楼', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('136', '2017-04-15 14:40:39', '42.197.163.13', '20', '腾讯课堂', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('137', '2017-04-15 14:41:20', '42.197.163.13', '21', '新东方', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('138', '2017-04-15 14:41:43', '42.197.163.13', '22', '沪江网', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('139', '2017-04-15 14:42:09', '42.197.163.13', '23', '网易云课堂', 'create', '已添加', '14', '2');
INSERT INTO `xadmin_log` VALUES ('140', '2017-04-15 15:13:31', '42.197.163.13', '13', '课程简介及算法分析', 'change', '已修改 learn_times 。', '11', '2');
INSERT INTO `xadmin_log` VALUES ('141', '2017-04-15 15:17:21', '42.197.163.13', '14', '基础知识', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('142', '2017-04-15 15:20:06', '42.197.163.13', '12', 'Python 错误与异常', 'change', '已修改 name 和 tag 。', '28', '2');
INSERT INTO `xadmin_log` VALUES ('143', '2017-04-15 15:21:04', '42.197.163.13', '15', '基础知识', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('144', '2017-04-15 15:21:27', '42.197.163.13', '12', 'Python 错误与异常', 'change', '已修改 image 。', '28', '2');
INSERT INTO `xadmin_log` VALUES ('145', '2017-04-15 15:23:35', '42.197.163.13', '12', 'Python 错误与异常', 'change', '没有字段被修改。', '28', '2');
INSERT INTO `xadmin_log` VALUES ('146', '2017-04-15 15:25:00', '42.197.163.13', '16', '基础知识', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('147', '2017-04-15 16:51:32', '42.197.163.13', '18', '斯坦福大学', 'change', '已修改 image 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('148', '2017-04-15 16:59:00', '42.197.163.13', '12', '响应式开发', 'change', '已修改 course_org，name 和 image 。', '28', '2');
INSERT INTO `xadmin_log` VALUES ('149', '2017-04-15 20:51:05', '121.68.97.1', '18', '斯坦福大学', 'change', '已修改 address 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('150', '2017-04-15 20:51:44', '121.68.97.1', '22', '沪江网', 'change', '已修改 address 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('151', '2017-04-15 20:52:02', '121.68.97.1', '19', '实验楼', 'change', '已修改 address 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('152', '2017-04-15 20:52:20', '121.68.97.1', '23', '网易云课堂', 'change', '已修改 address 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('153', '2017-04-15 20:53:19', '121.68.97.1', '17', '课程简介', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('154', '2017-04-15 20:53:29', '121.68.97.1', '18', '简介', 'create', '已添加', '11', '2');
INSERT INTO `xadmin_log` VALUES ('155', '2017-04-16 08:59:24', '121.68.97.1', '23', '网易云课堂', 'change', '已修改 image 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('156', '2017-04-16 09:01:54', '121.68.97.1', '23', '网易云课堂', 'change', '已修改 image 。', '14', '2');
INSERT INTO `xadmin_log` VALUES ('157', '2017-04-24 18:16:51', '118.196.39.187', null, '', 'delete', '批量删除 1 个 用户信息', null, '2');

-- ----------------------------
-- Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', 'https://bootswatch.com/cerulean/bootstrap.min.css', '2');
INSERT INTO `xadmin_usersettings` VALUES ('3', 'dashboard:home:pos', '', '2');
INSERT INTO `xadmin_usersettings` VALUES ('4', 'courses_course_editform_portal', 'box-0,lesson_set-group,,courseresource_set-group', '2');

-- ----------------------------
-- Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_e8701ad4` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
