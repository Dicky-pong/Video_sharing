/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : video

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2016-10-25 17:59:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_roles`
-- ----------------------------
DROP TABLE IF EXISTS `cms_roles`;
CREATE TABLE `cms_roles` (
  `id` int(11) NOT NULL,
  `despripe` varchar(255) DEFAULT NULL,
  `roleCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_roles
-- ----------------------------
INSERT INTO `cms_roles` VALUES ('0', '管理员', 'ROLE_ADMIN');
INSERT INTO `cms_roles` VALUES ('1', '登录权限', 'ROLE_LOGIN');
INSERT INTO `cms_roles` VALUES ('2', '操作权限', 'ROLE_OPERATE');

-- ----------------------------
-- Table structure for `cms_users`
-- ----------------------------
DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE `cms_users` (
  `id` varchar(32) NOT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `createDate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_users
-- ----------------------------
INSERT INTO `cms_users` VALUES ('4028818b5495c09f015495c2d7d90003', 'admin', '5690dddfa28ae085d23518a035707282', '0', '2016-05-09 21:44:15');
INSERT INTO `cms_users` VALUES ('4028818b54992df30154992e58dc0001', 'laoxie', 'a8e4fb602f5ebc50787ffd866792eb16', '0', '2016-05-10 13:40:32');
INSERT INTO `cms_users` VALUES ('4028818b54992df30154993592fa0003', 'tanchao', 'e10adc3949ba59abbe56e057f20f883e', '0', '2016-05-10 13:48:25');
INSERT INTO `cms_users` VALUES ('4028818b549e4f9201549e526bac0003', 'admmm', '733d7be2196ff70efaf6913fc8bdcabf', '0', '2016-05-11 13:38:02');
INSERT INTO `cms_users` VALUES ('4028818b549e80e601549e81ab4e0001', 'admmn', '4297f44b13955235245b2497399d7a93', '0', '2016-05-11 14:29:38');
INSERT INTO `cms_users` VALUES ('4028818b549eef7801549ef69faf0001', '12333', '4297f44b13955235245b2497399d7a93', '0', '2016-05-11 16:37:23');

-- ----------------------------
-- Table structure for `cms_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_role`;
CREATE TABLE `cms_user_role` (
  `id` varchar(32) NOT NULL,
  `cms_roleId` int(11) DEFAULT NULL,
  `cms_userId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK663754D4278ADFDF` (`cms_roleId`),
  KEY `FK663754D42D0AC93F` (`cms_userId`),
  KEY `FK218828F4278ADFDF` (`cms_roleId`),
  KEY `FK218828F42D0AC93F` (`cms_userId`),
  CONSTRAINT `FK218828F4278ADFDF` FOREIGN KEY (`cms_roleId`) REFERENCES `cms_roles` (`id`),
  CONSTRAINT `FK218828F42D0AC93F` FOREIGN KEY (`cms_userId`) REFERENCES `cms_users` (`id`),
  CONSTRAINT `FK663754D4278ADFDF` FOREIGN KEY (`cms_roleId`) REFERENCES `cms_roles` (`id`),
  CONSTRAINT `FK663754D42D0AC93F` FOREIGN KEY (`cms_userId`) REFERENCES `cms_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_user_role
-- ----------------------------
INSERT INTO `cms_user_role` VALUES ('4028818b5495c09f015495c2d7e80004', '0', '4028818b5495c09f015495c2d7d90003');
INSERT INTO `cms_user_role` VALUES ('4028818b54992df30154992e58f00002', '1', '4028818b54992df30154992e58dc0001');
INSERT INTO `cms_user_role` VALUES ('4028818b54992df30154993593160004', '1', '4028818b54992df30154993592fa0003');
INSERT INTO `cms_user_role` VALUES ('4028818b549e4f9201549e526bcb0004', '1', '4028818b549e4f9201549e526bac0003');
INSERT INTO `cms_user_role` VALUES ('4028818b549e80e601549e81ab7c0002', '1', '4028818b549e80e601549e81ab4e0001');
INSERT INTO `cms_user_role` VALUES ('4028818b549eef7801549ef69fed0002', '1', '4028818b549eef7801549ef69faf0001');

-- ----------------------------
-- Table structure for `msgchannel`
-- ----------------------------
DROP TABLE IF EXISTS `msgchannel`;
CREATE TABLE `msgchannel` (
  `id` varchar(32) NOT NULL,
  `c_code` varchar(255) DEFAULT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `c_url` varchar(255) DEFAULT NULL,
  `msgLevel` varchar(255) DEFAULT NULL,
  `msgNumber` int(11) DEFAULT NULL,
  `msgPassword` varchar(255) DEFAULT NULL,
  `msgSign` varchar(255) DEFAULT NULL,
  `msgUseObj` varchar(255) DEFAULT NULL,
  `msgUserName` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `tranNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msgchannel
-- ----------------------------
INSERT INTO `msgchannel` VALUES ('4028810455fbfdfd0155fc088c110001', 'test001', 'test001', 'test001', '1', '100', '123456', 'test001', null, 'test001', '1', '0');
INSERT INTO `msgchannel` VALUES ('4028818a4eaa2a5e014eaa35b1d40001', 'MSG-001', '君诚科技', 'http://www.jc-chn.cn/smsSend.do', '1', '625', 'sigfcfn2', '【一点点】', null, 'yidiandian88', '0', '1');
INSERT INTO `msgchannel` VALUES ('http://www.jc-chn.cn/smsSend.do', 'MSG-002', '君诚科技', 'http://www.jc-chn.cn/smsSend.do', '1', '8769', 'i35ynke7', '【亿企联】', null, 'yql', '0', '0');

-- ----------------------------
-- Table structure for `msgsend`
-- ----------------------------
DROP TABLE IF EXISTS `msgsend`;
CREATE TABLE `msgsend` (
  `id` varchar(32) NOT NULL,
  `operDate` varchar(255) DEFAULT NULL,
  `operId` varchar(255) DEFAULT NULL,
  `openType` varchar(255) DEFAULT NULL,
  `openTypeId` varchar(255) DEFAULT NULL,
  `sendChannelName` varchar(255) DEFAULT NULL,
  `sendContent` varchar(255) DEFAULT NULL,
  `sendDate` varchar(255) DEFAULT NULL,
  `sendNumber` int(11) DEFAULT NULL,
  `sendPhone` varchar(255) DEFAULT NULL,
  `sendStatus` varchar(255) DEFAULT NULL,
  `verifyCode` varchar(255) DEFAULT NULL,
  `verifyCodeValidity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msgsend
-- ----------------------------
INSERT INTO `msgsend` VALUES ('40288104540e1e0601540e1e8c1b0001', '2016-04-13 13:36:38', '', '1', '250638603@qq.com', 'yql', '验证码为：721885（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-13 13:36:03', '1', '250638603@qq.com', '1', '721885', '60');
INSERT INTO `msgsend` VALUES ('40288104540e1e0601540e24f4070004', '2016-04-13 13:57:43', '', '6', '13262689115', 'yql', '验证码为：504227（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-04-13 13:57:29', '3', '13262689115', '1', '504227', '3');
INSERT INTO `msgsend` VALUES ('40288131556c902201556c95c38b0001', '2016-06-20 14:56:17', '', '5', '844655353@qq.com', 'yql', '验证码为：847335（您正在邮箱找回密码，60分钟内有效，请尽快验证）【亿企联】', '2016-06-20 14:56:17', '2', '844655353@qq.com', '0', '847335', '60');
INSERT INTO `msgsend` VALUES ('40288131556c902201556c9998a20002', '2016-06-20 14:57:33', '', '5', '1729183741@qq.com', 'yql', '验证码为：377842（您正在邮箱找回密码，60分钟内有效，请尽快验证）', '2016-06-20 14:57:33', '1', '1729183741@qq.com', '0', '377842', '60');
INSERT INTO `msgsend` VALUES ('40288131556c902201556c9b7ee40003', '2016-06-20 14:59:37', '', '5', 'zc@duchunyang.com', 'yql', '验证码为：623401（您正在邮箱找回密码，60分钟内有效，请尽快验证）', '2016-06-20 14:59:37', '1', 'zc@duchunyang.com', '0', '623401', '60');
INSERT INTO `msgsend` VALUES ('40288131556ca05a01556ca15ded0001', '2016-06-20 15:06:02', '', '5', '1194388356@qq.com', 'yql', '验证码为：486528（您正在邮箱找回密码，60分钟内有效，请尽快验证）', '2016-06-20 15:06:02', '1', '1194388356@qq.com', '0', '486528', '60');
INSERT INTO `msgsend` VALUES ('4028813155c34c180155c34f384f0001', '2016-07-07 11:04:30', '', '1', '3206559852@qq.com', 'yql', '验证码为：865221（您正在注册亿企联，60分钟内有效，请尽快验证）【亿企联】', '2016-07-07 11:04:18', '2', '3206559852@qq.com', '1', '865221', '60');
INSERT INTO `msgsend` VALUES ('4028818b54096eb50154096f145e0001', '2016-04-12 15:46:07', '', '1', '271362874@qq.com', 'yql', '验证码为：830441（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 15:45:55', '1', '271362874@qq.com', '1', '830441', '60');
INSERT INTO `msgsend` VALUES ('4028818b5432293c01543229e9040001', '2016-04-20 13:35:00', '', '1', '1679549502@qq.com', 'yql', '验证码为：033307（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-20 13:34:48', '1', '1679549502@qq.com', '1', '033307', '60');
INSERT INTO `msgsend` VALUES ('402881e7540870a20154098709aa0001', '2016-04-12 16:12:05', '', '1', 'aaaa@qq.com', 'yql', '验证码为：381823（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 16:12:05', '1', 'aaaa@qq.com', '0', '381823', '60');
INSERT INTO `msgsend` VALUES ('402881e7540870a2015409892ca60002', '2016-04-12 16:14:25', '', '1', 'aaa165@qq.com', 'yql', '验证码为：043156（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 16:14:25', '1', 'aaa165@qq.com', '0', '043156', '60');
INSERT INTO `msgsend` VALUES ('402881e7540870a20154098988830003', '2016-04-12 16:14:48', '', '1', 'fafd@qq.com', 'yql', '验证码为：681360（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 16:14:48', '1', 'fafd@qq.com', '0', '681360', '60');
INSERT INTO `msgsend` VALUES ('402881e7540870a201540989e22c0004', '2016-04-12 16:15:27', '', '1', '447043567@qq.com', 'yql', '验证码为：883244（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 16:15:11', '1', '447043567@qq.com', '1', '883244', '60');
INSERT INTO `msgsend` VALUES ('402881e856f3260d0156f3265b620000', '2016-09-15 17:36:49', '', '6', '18661691903', 'yql', '验证码为：677778（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-09-15 17:36:41', '22', '18661691903', '1', '677778', '3');
INSERT INTO `msgsend` VALUES ('402881e856f331580156f331a3190000', '2016-09-04 11:15:31', '', '6', '18661691903', 'yql', '验证码为：322665（您正在注册商户，3分钟内有效，请尽快验证）', '2016-09-04 11:15:31', '1', '18661691903', '0', '322665', '3');
INSERT INTO `msgsend` VALUES ('402881e856f3b5340156f3b5801f0000', '2016-09-04 13:39:33', '', '6', '18661691903', 'yql', '验证码为：756063（您正在注册商户，3分钟内有效，请尽快验证）', '2016-09-04 13:39:33', '1', '18661691903', '0', '756063', '3');
INSERT INTO `msgsend` VALUES ('402881e856f3ba6d0156f3baa45b0000', '2016-09-04 13:45:10', '', '6', '18661691903', 'yql', '验证码为：223018（您正在注册商户，3分钟内有效，请尽快验证）', '2016-09-04 13:45:10', '1', '18661691903', '0', '223018', '3');
INSERT INTO `msgsend` VALUES ('402881e856f3bd420156f3bdee6e0000', '2016-09-04 17:58:03', '', '6', '18661691903', null, '验证码为：670158（您正在注册商户，3分钟内有效，请尽快验证）【亿企联】', '2016-09-04 17:58:03', '3', '18661691903', '0', '670158', '3');
INSERT INTO `msgsend` VALUES ('402881ea54092b240154096ee3f20005', '2016-04-20 13:40:35', '', '1', '1194388356@qq.com', 'yql', '验证码为：373187（您正在注册亿企联，60分钟内有效，请尽快验证）【亿企联】', '2016-04-20 13:40:07', '5', '1194388356@qq.com', '1', '373187', '60');
INSERT INTO `msgsend` VALUES ('402881ea54129a8e015412a2d2df0001', '2016-04-14 10:40:41', '', '1', '1729183741@qq.com', 'yql', '验证码为：188117（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-14 10:39:01', '1', '1729183741@qq.com', '1', '188117', '60');
INSERT INTO `msgsend` VALUES ('402881ea575fcc7301575fce20300000', '2016-09-25 13:25:45', '', '6', '15589820305', 'yql', '验证码为：434036（您正在绑定手机号码，3分钟内有效，请尽快验证）', '2016-09-25 13:25:26', '1', '15589820305', '1', '434036', '3');
INSERT INTO `msgsend` VALUES ('402881eb5432483b015432fd47140001', '2016-08-31 12:11:34', '', '1', 'Wencong.bian@ipunion.net', 'yql', '验证码为：377634（您正在注册亿企联，60分钟内有效，请尽快验证）【亿企联】', '2016-08-31 12:11:08', '3', 'Wencong.bian@ipunion.net', '1', '377634', '60');
INSERT INTO `msgsend` VALUES ('402881f056eb35eb0156eb3687000001', '2016-09-02 22:03:54', '', '1', '18661691903@qq.com', 'yql', '验证码为：788701（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-09-02 22:03:54', '1', '18661691903@qq.com', '0', '788701', '60');
INSERT INTO `msgsend` VALUES ('402881f5547e876b01547fea2774004a', '2016-07-04 09:31:05', '', '1', '13725581150@139.com', 'yql', '验证码为：688322（您正在注册亿企联，60分钟内有效，请尽快验证）【亿企联】', '2016-07-04 09:30:54', '5', '13725581150@139.com', '1', '688322', '60');
INSERT INTO `msgsend` VALUES ('402881f956f7fbf70156f7fe0b650000', '2016-09-05 09:37:16', '', '6', 'ertyuio', 'yql', '验证码为：051066（您正在注册商户，3分钟内有效，请尽快验证）', '2016-09-05 09:37:16', '1', 'ertyuio', '0', '051066', '3');
INSERT INTO `msgsend` VALUES ('402881f956f93fe60156f9743c2a0000', '2016-09-23 09:50:37', '', '4', '18661691903', 'yql', '验证码为：087457（您正在找回密码，3分钟内有效，请尽快验证）【亿企联】', '2016-09-23 09:50:37', '11', '18661691903', '0', '087457', '3');
INSERT INTO `msgsend` VALUES ('402881fb55b3812a0155b38b5ac70003', '2016-07-04 09:36:43', '', '6', '13725581150', 'yql', '验证码为：361271（您正在绑定手机号码，3分钟内有效，请尽快验证）', '2016-07-04 09:35:02', '1', '13725581150', '1', '361271', '3');
INSERT INTO `msgsend` VALUES ('402881fc56e4dc580156e4dd75900001', '2016-09-01 16:29:26', '', '1', '631353911@qq.com', 'yql', '验证码为：810514（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-09-01 16:28:54', '1', '631353911@qq.com', '1', '810514', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b9540959520154097a29350006', '2016-04-12 15:58:49', '', '1', '719151448@qq.com', 'yql', '验证码为：536833（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 15:58:01', '1', '719151448@qq.com', '1', '536833', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015409814b470009', '2016-04-12 16:06:38', '', '6', '13352973810', 'yql', '验证码为：262774（您正在绑定手机号码，3分钟内有效，请尽快验证）', '2016-04-12 16:05:48', '1', '13352973810', '1', '262774', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b9540959520154098251a0000a', '2016-04-12 16:07:27', '', '1', '1592431092@qq.com', 'yql', '验证码为：664476（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 16:06:56', '1', '1592431092@qq.com', '1', '664476', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201540989645c001e', '2016-09-12 17:59:01', '', '6', '13128224192', 'yql', '验证码为：222064（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-09-12 17:58:50', '6', '13128224192', '1', '222064', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b9540959520154098febea001f', '2016-04-12 16:25:10', '', '1', 'lihong3546@163.com', 'yql', '验证码为：667141（您正在注册亿企联，60分钟内有效，请尽快验证）【亿企联】', '2016-04-12 16:24:15', '2', 'lihong3546@163.com', '1', '667141', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015409a091f40027', '2016-04-12 16:40:11', '', '1', '383882946@qq.com', 'yql', '验证码为：533723（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 16:39:58', '1', '383882946@qq.com', '1', '533723', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015409a2f44c002a', '2016-04-12 16:42:49', '', '1', '150550505@qq.com', 'yql', '验证码为：073211（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 16:42:34', '1', '150550505@qq.com', '1', '073211', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015409a97de9002d', '2016-04-12 16:49:54', '', '1', '844655353@qq.com', 'yql', '验证码为：022122（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-12 16:49:43', '1', '844655353@qq.com', '1', '022122', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015409aafd720030', '2016-07-07 11:05:40', '', '6', '13632866337', 'yql', '验证码为：230821（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-07-07 11:05:28', '21', '13632866337', '1', '230821', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015409abd2e50031', '2016-04-12 16:52:49', '', '6', '13824829201', 'yql', '验证码为：080183（您正在绑定手机号码，3分钟内有效，请尽快验证）', '2016-04-12 16:52:16', '1', '13824829201', '1', '080183', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201540d8b8191004b', '2016-04-13 10:57:30', '', '1', '1612273083@qq.com', 'yql', '验证码为：803564（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-13 10:55:27', '1', '1612273083@qq.com', '1', '803564', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201540dbfb211004e', '2016-04-13 11:52:53', '', '1', '635322381@qq.com', 'yql', '验证码为：271678（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-13 11:52:27', '1', '635322381@qq.com', '1', '271678', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201540dc299ac0051', '2016-08-26 14:06:24', '', '6', '13926570904', 'yql', '验证码为：522375（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-08-26 14:06:24', '6', '13926570904', '0', '522375', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201540e2d081f0052', '2016-09-07 17:25:46', '', '6', '18682093780', 'yql', '验证码为：380632（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-09-07 17:25:37', '8', '18682093780', '1', '380632', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201540ec453360058', '2016-04-13 16:37:39', '', '1', 'xyc_acen@163.com', 'yql', '验证码为：653177（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-13 16:37:08', '1', 'xyc_acen@163.com', '1', '653177', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201540ec6749b005b', '2016-06-12 12:40:01', '', '6', '17051132830', 'yql', '验证码为：536026（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-06-12 12:39:37', '2', '17051132830', '1', '536026', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201540edd1e42005c', '2016-05-19 10:08:52', '', '6', '18217365559', 'yql', '验证码为：055747（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-05-19 10:08:52', '7', '18217365559', '0', '055747', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201541263468e005d', '2016-04-14 09:29:47', '', '1', 'dragon.qu@ipunion.net', 'yql', '验证码为：420604（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-14 09:29:36', '1', 'dragon.qu@ipunion.net', '1', '420604', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201541266a1660060', '2016-04-14 09:34:06', '', '6', '18565687317', 'yql', '验证码为：253277（您正在绑定手机号码，3分钟内有效，请尽快验证）', '2016-04-14 09:33:16', '1', '18565687317', '1', '253277', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015412c3b7600095', '2016-04-14 11:15:20', '', '1', 'xc_qin@163.com', 'yql', '验证码为：026637（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-14 11:14:56', '1', 'xc_qin@163.com', '1', '026637', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015413ff5f1c00b1', '2016-04-14 17:07:18', '', '1', 'quintin.mo@ipunion.net', 'yql', '验证码为：577376（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-14 16:59:43', '1', 'quintin.mo@ipunion.net', '1', '577376', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015417dbcb7700b7', '2016-04-21 18:28:06', '', '6', '13510976385', 'yql', '验证码为：358783（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-04-21 18:27:48', '6', '13510976385', '1', '358783', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015427f7ae4400bc', '2016-06-07 15:30:10', '', '1', '375777302@qq.com', 'yql', '验证码为：731822（您正在注册亿企联，60分钟内有效，请尽快验证）【亿企联】', '2016-06-07 15:29:42', '2', '375777302@qq.com', '1', '731822', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015427f95e4900bf', '2016-06-08 15:27:25', '', '6', '18617159527', 'yql', '验证码为：577026（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-06-08 15:27:08', '4', '18617159527', '1', '577026', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b9540959520154281c0c2700c0', '2016-04-25 16:37:09', '', '6', '13480189782', 'yql', '验证码为：068160（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-04-25 16:36:56', '4', '13480189782', '1', '068160', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b954095952015428abee0200c7', '2016-04-18 17:21:29', '', '1', 'zc@duchunyang.com', 'yql', '验证码为：052555（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-18 17:20:36', '1', 'zc@duchunyang.com', '1', '052555', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201542d1fff6600cc', '2016-04-19 14:08:55', '', '1', '3166877934@qq.com', 'yql', '验证码为：834438（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-19 14:05:52', '1', '3166877934@qq.com', '1', '834438', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201542d23b6a700cf', '2016-04-19 14:10:38', '', '1', '690796229@qq.com', 'yql', '验证码为：100881（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-19 14:09:55', '1', '690796229@qq.com', '1', '100881', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201542d74337700d6', '2016-04-19 15:40:29', '', '1', '2582108982@qq.com', 'yql', '验证码为：827181（您正在注册亿企联，60分钟内有效，请尽快验证）【亿企联】', '2016-04-19 15:40:14', '2', '2582108982@qq.com', '1', '827181', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95409595201542d78b1eb00d9', '2016-04-19 15:43:34', '', '1', 'wujianghuan08@163.com', 'yql', '验证码为：237033（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-04-19 15:42:45', '1', 'wujianghuan08@163.com', '1', '237033', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b9552ed269015542e4a19f001a', '2016-09-06 16:32:18', '', '1', 'yacheng.xie@ipunion.net', 'yql', '验证码为：130502（您正在注册亿企联，60分钟内有效，请尽快验证）【亿企联】', '2016-09-06 16:31:24', '2', 'yacheng.xie@ipunion.net', '1', '130502', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b9557ca35101557cf70d810001', '2016-06-23 19:14:02', '', '1', 'hdruanjian1121@163.com', 'yql', '验证码为：133418（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-06-23 19:13:33', '1', 'hdruanjian1121@163.com', '1', '133418', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b955950761015595a48baf0001', '2016-06-28 14:14:39', '', '1', '526888692@qq.com', 'yql', '验证码为：608706（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-06-28 14:13:56', '1', '526888692@qq.com', '1', '608706', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b955950761015595ce4f000004', '2016-06-28 15:01:49', '', '6', '13530210006', 'yql', '验证码为：330284（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-06-28 15:01:29', '2', '13530210006', '1', '330284', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b955ec6b930155ec765ec60001', '2016-07-15 10:50:45', '', '1', '415818657@qq.com', 'yql', '验证码为：554405（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-07-15 10:50:28', '1', '415818657@qq.com', '1', '554405', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95606dedc015607247f260018', '2016-07-20 15:11:04', '', '5', '1592431092@qq.com', 'yql', '验证码为：104340（您正在邮箱找回密码，60分钟内有效，请尽快验证）', '2016-07-20 15:10:47', '1', '1592431092@qq.com', '1', '104340', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b9560b294001560b377ecf0001', '2016-07-21 10:10:13', '', '5', '3166877934@qq.com', 'yql', '验证码为：086811（您正在邮箱找回密码，60分钟内有效，请尽快验证）', '2016-07-21 10:10:01', '1', '3166877934@qq.com', '1', '086811', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b9560d16bf0156106a54c7000e', '2016-07-22 10:23:57', '', '1', '503925002@qq.com', 'yql', '验证码为：757650（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-07-22 10:23:39', '1', '503925002@qq.com', '1', '757650', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b9566e6e250156733894000031', '2016-08-10 14:52:01', '', '1', '495030205@qq.com', 'yql', '验证码为：752523（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-08-10 14:51:42', '1', '495030205@qq.com', '1', '752523', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b9568be12401568c0425b20006', '2016-08-15 10:27:22', '', '5', 'lihong3546@163.com', 'yql', '验证码为：724788（您正在邮箱找回密码，60分钟内有效，请尽快验证）', '2016-08-15 10:24:57', '1', 'lihong3546@163.com', '1', '724788', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b95697c49a015697cecd930005', '2016-08-17 17:22:26', '', '5', '495030205@qq.com', 'yql', '验证码为：642588（您正在邮箱找回密码，60分钟内有效，请尽快验证）', '2016-08-17 17:22:07', '1', '495030205@qq.com', '1', '642588', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b956b61c370156b62b78790001', '2016-08-23 14:52:26', '', '5', '383882946@qq.com', 'yql', '验证码为：048524（您正在邮箱找回密码，60分钟内有效，请尽快验证）', '2016-08-23 14:51:57', '1', '383882946@qq.com', '1', '048524', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b956b651fa0156b67a73830003', '2016-09-08 16:00:50', '', '6', '15673792918', 'yql', '验证码为：457464（您正在绑定手机号码，3分钟内有效，请尽快验证）【亿企联】', '2016-09-08 16:00:21', '2', '15673792918', '1', '457464', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b95703e24a015703f0abcf0002', '2016-09-07 17:18:33', '', '1', 'jianghuan.wu@ipunion.net', 'yql', '验证码为：680443（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-09-07 17:18:06', '1', 'jianghuan.wu@ipunion.net', '1', '680443', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b9570884c70157090f74510004', '2016-09-08 17:09:50', '', '1', '1272079921@qq.com', 'yql', '验证码为：642418（您正在注册亿企联，60分钟内有效，请尽快验证）', '2016-09-08 17:09:50', '1', '1272079921@qq.com', '0', '642418', '60');
INSERT INTO `msgsend` VALUES ('8af4d8b957bbac680157c12764b20011', '2016-10-14 11:06:21', '', '2', 'aedd54bf-8c3d-424c-954a-b032ea4af5cf', 'yql', '验证码为：664061（您正在领取优惠券，3分钟内有效，请尽快验证）', '2016-10-14 11:06:06', '1', '13926570904', '1', '664061', '3');
INSERT INTO `msgsend` VALUES ('8af4d8b957bbac680157c1279f020012', '2016-10-14 11:06:21', '', '3', 'aedd54bf-8c3d-424c-954a-b032ea4af5cf', 'yql', '您已成功领取[greger]优惠券，券凭证码[0201610141000]，有效期至[2016-10-15]。', '2016-10-14 11:06:21', '1', '13926570904', '0', '', '');

-- ----------------------------
-- Table structure for `msguser`
-- ----------------------------
DROP TABLE IF EXISTS `msguser`;
CREATE TABLE `msguser` (
  `id` varchar(32) NOT NULL,
  `createDate` varchar(255) DEFAULT NULL,
  `msgChannelId` varchar(255) DEFAULT NULL,
  `msgName` varchar(255) DEFAULT NULL,
  `msgPwd` varchar(255) DEFAULT NULL,
  `msgSign` varchar(255) DEFAULT NULL,
  `msgUserNumber` varchar(255) DEFAULT NULL,
  `msgUserState` varchar(255) DEFAULT NULL,
  `operDate` varchar(255) DEFAULT NULL,
  `operId` varchar(255) DEFAULT NULL,
  `payAmt` int(11) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `verifyMsgNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msguser
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `despripe` varchar(255) DEFAULT NULL,
  `roleCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '管理员', 'ROLE_ADMIN');
INSERT INTO `roles` VALUES ('2', '会员', 'ROLE_VIP');
INSERT INTO `roles` VALUES ('3', '普通会员', 'ROLE_COMM');

-- ----------------------------
-- Table structure for `systemdatadictionary`
-- ----------------------------
DROP TABLE IF EXISTS `systemdatadictionary`;
CREATE TABLE `systemdatadictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILEDNAME` varchar(255) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `PNAME` varchar(255) DEFAULT NULL,
  `REALVALUE` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `SORTNO` int(11) DEFAULT NULL,
  `TEXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemdatadictionary
-- ----------------------------
INSERT INTO `systemdatadictionary` VALUES ('12', '', null, 'picPath', 'sysNotice', '系统公告存储路径', null, 'sysNotice');
INSERT INTO `systemdatadictionary` VALUES ('13', '', null, 'picPath', 'vipCardTemplate', '会员卡模板存储路径', null, 'vipCard');
INSERT INTO `systemdatadictionary` VALUES ('14', null, null, 'picPath', 'material', '图片素材库存储路径', null, 'material');
INSERT INTO `systemdatadictionary` VALUES ('15', '', null, 'picPath', 'commodity', '存储文件路劲--->文件夹名称商品信息', null, 'commodity');
INSERT INTO `systemdatadictionary` VALUES ('16', '', null, 'picPath', 'picSrc', '图片映射地址', '0', '/imagesData');
INSERT INTO `systemdatadictionary` VALUES ('17', '', null, 'picPath', 'ShowPicSrc', '图片映射显示地址', null, 'http://test.yidiandian.net/images/');
INSERT INTO `systemdatadictionary` VALUES ('18', '', null, 'picPath', 'coupons', '存储文件路径--->文件夹名称-->优惠券图片', null, 'coupons');
INSERT INTO `systemdatadictionary` VALUES ('19', '', null, 'picPath', 'info', '存储文件路径--->文件夹名称-->商家用户证件信息', null, 'infos');
INSERT INTO `systemdatadictionary` VALUES ('20', null, null, 'picPath', 'openPicSrc', '二维码图片扫描后打开页面地址', null, 'http://test.yidiandian.net/business_union/couponsList/getImgCodeInfo.do?');
INSERT INTO `systemdatadictionary` VALUES ('21', null, null, 'use_Coupons', '2', '用户使用优惠券', null, '已使用');
INSERT INTO `systemdatadictionary` VALUES ('22', null, null, 'use_Coupons', '0', '用户使用优惠券', null, '未使用');
INSERT INTO `systemdatadictionary` VALUES ('23', '', null, 'use_Coupons', '1', '用户使用优惠券', null, '已过期');
INSERT INTO `systemdatadictionary` VALUES ('24', '', null, 'use_Coupons', '3', '用户使用优惠券', null, '已删除');
INSERT INTO `systemdatadictionary` VALUES ('25', null, null, 'picPath', 'wechatPayAllpy', '申请微信支付，证书地址', null, 'wechatPayAllpy');
INSERT INTO `systemdatadictionary` VALUES ('26', null, null, 'picPath', 'proUploadFile', '货品规格显示图片', null, 'proUploadFile');
INSERT INTO `systemdatadictionary` VALUES ('27', null, null, 'picPath', 'wifi', 'wifi二维码存储路径', null, 'wifi');
INSERT INTO `systemdatadictionary` VALUES ('28', null, null, 'picPath', 'qrcodePay', '商家二维码路径', null, 'qrcodePay');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `accUUID` varchar(255) DEFAULT NULL,
  `contact_Email` varchar(255) DEFAULT NULL,
  `createDate` varchar(255) DEFAULT NULL,
  `isSetPayPwd` varchar(255) DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_state` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginName` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('402881095726d3be015726d6d8d50000', 'b7cb07a9a5254ffe88d68a49b93d7b0a', null, '2016-09-15 17:36:49', null, '18661691903', 'c5feb1bdab862b76b1d3af9d649f3fe6', '1', null);
INSERT INTO `users` VALUES ('40288110574f8d8501574fb0fcdf0001', '26dd6702db974024b76c34cf7cd37e3c', null, '2016-09-22 10:19:41', null, '18202089785', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql7b517917cdf84ed6b058020843dc2b38');
INSERT INTO `users` VALUES ('4028813155c34c180155c35056a60002', null, null, '2016-07-07 11:05:40', null, '3206559852@qq.com', null, '0', 'yql19995a75bb8f400688b6001b2f4ff5d8');
INSERT INTO `users` VALUES ('40288131570e534c01570e58de380003', '00ea061e1f144887aa391d0475bbd7e9', null, '2016-09-09 17:48:07', null, '15972980296', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yqlf6ae2b77e9f14394b9a60984fff2c735');
INSERT INTO `users` VALUES ('40288131570e534c01570e5a3e960005', 'a496f4f3a310421baecb2a0f001c0100', null, '2016-09-09 17:49:37', null, '13655555555', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql92219bfd9fcc4ef6aece3925342f4e96');
INSERT INTO `users` VALUES ('40288131570e534c01570e5b82a90007', '02c4f536b2124cdf8d7fbfc9abc723cd', null, '2016-09-09 17:51:00', null, '13611111111', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yqlc49eef28ee264f92963ee9c336b0d6cf');
INSERT INTO `users` VALUES ('402881315741c94d015741ca6f3f0001', null, null, '2016-09-19 17:32:48', null, '15889626521', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql7e6c6e5894c2443caf6b9551dc5af867');
INSERT INTO `users` VALUES ('402881315741cc98015741cf54c70001', '90d59abce3fd4192be54b1d1e3424c2a', null, '2016-09-19 17:38:09', null, '13632811111', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yqlbdd43094605245af95dd845e562c04d3');
INSERT INTO `users` VALUES ('402881315741d0bc015741d1f66e0001', '5973e9b15c004eb7a9547b175b87d593', null, '2016-09-19 17:41:01', null, '13632811112', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql4936b77eff634837a538b055a15c22a8');
INSERT INTO `users` VALUES ('402881315741d2cb015741d3dfd20001', 'b677701002e843499c9d640ca2bb0d69', null, '2016-09-19 17:43:06', null, '13658555555', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql02fa29b7dd52407b9eb008a8f0e8268f');
INSERT INTO `users` VALUES ('402881315741d2cb015741d4f5d10003', '24b94056a4aa4306b8a2067ed77f8013', null, '2016-09-19 17:44:18', null, '13658555558', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql01c58771c23f4308a74e26ab747e09df');
INSERT INTO `users` VALUES ('40288131576b65de01576b665f760001', '18686eb656ad404d924f096fc29e2baa', null, '2016-09-27 19:27:33', null, '16555555555', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql3bb27d3dd249434faf535521b13f3709');
INSERT INTO `users` VALUES ('4028813c5529b3c7015529c4c8a10001', null, null, '2016-06-08 15:27:26', null, '375777302@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yql5095e99976174560821c2f49d603006a');
INSERT INTO `users` VALUES ('4028818b54096eb50154096f45740002', '121e89d36434430db9196fb4117da36a', null, '2016-04-15 10:59:45', null, '271362874@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yql6bc5f5de72bc4b31a188d51816412f1a');
INSERT INTO `users` VALUES ('4028818b5432293c0154322a1a3b0002', null, null, '2016-04-21 13:52:43', null, '1679549502@qq.com', null, '3', 'yql00939f9125074968a78eb4c60cfd59eb');
INSERT INTO `users` VALUES ('4028818b5432293c0154322f35870004', null, null, '2016-04-20 17:23:43', null, '1194388356@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '5', 'yql2bca434608414f3d817f6cb190122690');
INSERT INTO `users` VALUES ('402881e7540870a20154098a20010005', null, null, null, null, '447043567@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yqlf2554f77b07a4dd8a33a438458b0e51f');
INSERT INTO `users` VALUES ('402881ea54129a8e015412a459480002', null, null, '2016-04-18 17:02:26', null, 'wencong.bian@ipunion.net', 'dc483e80a7a0bd9ef71d8cf973673924', '3', 'yql9fe93bc088144acb831f719fc98f4076');
INSERT INTO `users` VALUES ('402881ea575fcc7301575fce649f0001', '90c83d45287a4b77946710a940e7badd', null, '2016-09-25 13:25:44', null, '15589820305', 'c5feb1bdab862b76b1d3af9d649f3fe6', '1', null);
INSERT INTO `users` VALUES ('402881fb55b3812a0155b387c0fd0001', '264d57319bfd4a7e82eef791dfb77399', null, '2016-07-04 09:36:43', null, '13725581150@139.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yql562954d67934483ba701d2e0abaa32d7');
INSERT INTO `users` VALUES ('8af4d8b9540959520154097ae39e0007', 'c6b5b2ba0c454e0ab4eac2234e5254d3', null, '2016-04-12 16:06:38', null, '719151448@qq.com', 'df07971778aea19a1db283f901108af3', '0', 'yql578e000c26cb44ada2b36c50fd5e6a3e');
INSERT INTO `users` VALUES ('8af4d8b95409595201540982cc74000b', 'dcb285d265fd44349ebee0a87872e4df', null, '2016-04-12 16:15:39', null, '1592431092@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yql7e23f280378044699701ccc4b2e439ad');
INSERT INTO `users` VALUES ('8af4d8b9540959520154099303d40020', 'abe4b6c5d4a64d4488c6f0a54c3f87f3', null, '2016-09-12 17:59:01', null, 'lihong3546@163.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yqlfb135b50d046488b878f29e13656d28b');
INSERT INTO `users` VALUES ('8af4d8b954095952015409a0c2310028', 'f68d15a0d973482cb370120e128d9a61', null, '2016-04-12 16:52:49', null, '383882946@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yqlcc02144074c941cc9129657e3daa4bc1');
INSERT INTO `users` VALUES ('8af4d8b954095952015409a32c35002b', null, null, '2016-04-25 16:37:09', null, null, null, '3', 'yql68296140327140ceae0c7962b038779b');
INSERT INTO `users` VALUES ('8af4d8b954095952015409a9aaab002e', '21d80e42c47c4945abe60165f3180f16', null, '2016-04-12 16:51:35', null, '844655353@qq.com', '5690dddfa28ae085d23518a035707282', '0', 'yqld2b43388327342e480a92fba52eac4d3');
INSERT INTO `users` VALUES ('8af4d8b95409595201540d8d63a6004c', null, null, '2016-04-13 17:14:34', null, '1612273083@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '5', 'yqlf41e8c0f5a7542b19bc3ce3f8e953246');
INSERT INTO `users` VALUES ('8af4d8b95409595201540dc01685004f', 'd66aae430f1b4682b53b943ca3cc89e4', null, '2016-04-13 13:56:58', null, '635322381@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yql999a5b5873e5480788da02a5088beadb');
INSERT INTO `users` VALUES ('8af4d8b95409595201540ec4cf200059', '7b6acfde7c304badab688d3c70e01fe2', null, '2016-04-13 16:39:54', null, 'xyc_acen@163.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yqlb9a1c65974694562b2b16740c215176d');
INSERT INTO `users` VALUES ('8af4d8b9540959520154126371c0005e', 'b1d80e2ce8e04e2dbf4424a0fe87608e', null, '2016-04-14 09:34:06', null, 'dragon.qu@ipunion.net', 'd6cb23b81ad1b2b65e83b7bbaefffffb', '0', 'yqld2096785e7af452c8824b741cd8d14a2');
INSERT INTO `users` VALUES ('8af4d8b954095952015412c4132a0096', null, null, null, null, 'xc_qin@163.com', '8545d800351f001fa893d15a6d5fd568', '1', 'yqla65f6e28488d47b5bbb6959f2a6ecb76');
INSERT INTO `users` VALUES ('8af4d8b954095952015414064ece00b3', null, null, null, null, 'quintin.mo@ipunion.net', '815d0306b997d90e8325be6d8a53943f', '1', 'yql40b08a12d2554741a489873f063dcb24');
INSERT INTO `users` VALUES ('8af4d8b954095952015428acbd3200c8', '9de6e0dc803e42609ba811aa0a0d480f', null, '2016-04-18 17:25:18', null, 'zc@duchunyang.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yql092fcf793c284f1c9a145369bf8fde9c');
INSERT INTO `users` VALUES ('8af4d8b95409595201542d22cc0400cd', null, null, '2016-04-19 14:48:23', null, '3166877934@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yql022fb9c010134985b30c5dae95cbf05c');
INSERT INTO `users` VALUES ('8af4d8b95409595201542d245d7b00d0', null, null, '2016-04-19 14:32:28', null, '690796229@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '4', 'yql7757fe4231d545c8800f28edaaee4c1d');
INSERT INTO `users` VALUES ('8af4d8b95409595201542d769e7b00d7', null, null, '2016-04-19 15:47:50', null, '2582108982@qq.com', '327bc4e22b649d47c4546a3ec93f376b', '4', 'yql1b2c1703af194c958ca366416884fbc1');
INSERT INTO `users` VALUES ('8af4d8b95409595201542d7973c600da', '11081682111c4f6fa15a8e685100add8', null, '2016-04-19 15:56:20', null, 'wujianghuan08@163.com', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yqld0d216a62a4b4211aa64b8ce5a5d723a');
INSERT INTO `users` VALUES ('8af4d8b9552ed269015542e50e40001b', null, null, '2016-06-12 12:40:01', null, 'yacheng.xie2@ipunion.net', 'dc483e80a7a0bd9ef71d8cf973673924', '3', 'yqlb1b5589ad2eb49808336a9bfb09d0ade');
INSERT INTO `users` VALUES ('8af4d8b9557ca35101557cf77ffe0002', null, null, null, null, 'hdruanjian1121@163.com', '7d26a7ab7c020e79d0b6f53b5d796eb7', '1', 'yqla9e9cbeb8e524ed4b2339e4662c283aa');
INSERT INTO `users` VALUES ('8af4d8b955950761015595a532b00002', null, null, '2016-06-28 15:01:49', null, '526888692@qq.com', 'adf239af653edecd6cfad90badd9bf5f', '3', 'yqle9feae3b29ff4f8493fbb57794b5bc16');
INSERT INTO `users` VALUES ('8af4d8b955ec6b930155ec76a33d0002', null, null, null, null, '415818657@qq.com', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql2bff4c1b9a9344dbaad5d2e3a09313bc');
INSERT INTO `users` VALUES ('8af4d8b9560d16bf0156106a9c8d000f', null, null, '2016-08-05 09:33:32', null, '503925002@qq.com', '5aa83310d9dcf6ee6ac94ac69e5fe417', '5', 'yql8e61639ea4854db8b4ad209a11ab2431');
INSERT INTO `users` VALUES ('8af4d8b9566a910a01566d0cd3e50013', null, null, null, null, null, null, null, null);
INSERT INTO `users` VALUES ('8af4d8b9566e6e2501567338de520032', null, null, '2016-09-08 16:00:50', null, '495030205@qq.com', '3d510823673ac4d5d710ce96502b8a87', '3', 'yqlaafd1922dced429fb9c3c5a521197ef9');
INSERT INTO `users` VALUES ('8af4d8b95703e24a015703f115570003', '3e9f9904482c4f25bee80d009009dace', null, '2016-09-07 17:25:46', null, 'jianghuan.wu@ipunion.net', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yqla8a046d783c141c79246c844b539cd39');
INSERT INTO `users` VALUES ('8af4d8b9574fd89f01574fd9491b0001', 'a6ac8a9950a841d19267d1292f9aa077', '1729183744@qq.com', '2016-09-22 11:03:42', null, '13632866337', 'dc483e80a7a0bd9ef71d8cf973673924', '3', 'yql8a90c83280a34e609e5d01da3365518a');
INSERT INTO `users` VALUES ('8af4d8b9576a4ecc01576ade36210001', '37fbc84548ca40babb4f32e8054e8675', null, '2016-09-27 16:58:50', null, '13635555555', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql347e91fe7736414e869a4bfdb4020c47');
INSERT INTO `users` VALUES ('8af4d8b9576a4ecc01576adead330003', 'd03053929ed94407878581ff6f7c706b', null, '2016-09-27 16:59:20', null, '13632865555', 'dc483e80a7a0bd9ef71d8cf973673924', '0', 'yql8e2824e317bf44de8dedc95c065c023f');
INSERT INTO `users` VALUES ('8af4d8b9576b258801576eaf7777000a', '105cda4ea7e34f738085d015ecf558de', null, '2016-09-28 10:46:15', null, '12345678901', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql11e7a6ea0a0049dc96c992b98d44c388');
INSERT INTO `users` VALUES ('8af4d8b9576b258801576eb0f583000c', '3f937838e1554d1cb0820948d64db772', null, '2016-09-28 10:47:53', null, '23456789012', '01bcc3a6d9af25d795986ab0ceec83d5', '1', 'yql1378cdb77f9d44ed91016ef8de5bc276');
INSERT INTO `users` VALUES ('8af4d8b9577043510157a33e5791005a', '0c604e2b1c3247fc93a231d1b336b8b9', null, '2016-10-08 15:42:34', null, '15673792918', '01bcc3a6d9af25d795986ab0ceec83d5', '1', 'yql4782a89f4f794b77a70e68e6a7a3d07b');
INSERT INTO `users` VALUES ('8af4d8b957a80feb0157a84a74b90003', 'eb8eca4dd6ec45809869030f6f3b860d', null, '2016-10-09 15:13:54', null, '13128224192', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql16c25edbdff34ce89b6112f2fdec823f');
INSERT INTO `users` VALUES ('8af4d8b957a80feb0157a86bc64a000e', '314e627190ff48cd82e716e8f2830016', null, '2016-10-09 15:50:17', null, '18682093780', 'dc483e80a7a0bd9ef71d8cf973673924', '1', 'yql0a64247b53214f0b9dfa7956b44f6693');
INSERT INTO `users` VALUES ('ff8080815432985a0154330b99a7001a', null, null, '2016-04-21 18:28:07', null, '18928225772@163.com', 'dc483e80a7a0bd9ef71d8cf973673924', '3', null);

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` varchar(32) NOT NULL,
  `roleid` int(11) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC16F46AD5256BA4` (`roleid`),
  KEY `FKBC16F46ADAA55504` (`userid`),
  KEY `FK143BF46AD5256BA4` (`roleid`),
  KEY `FK143BF46ADAA55504` (`userid`),
  KEY `FKBC16F46AC62EF551` (`roleid`),
  KEY `FKBC16F46ACBAEDEB1` (`userid`),
  KEY `FK143BF46AC62EF551` (`roleid`),
  KEY `FK143BF46ACBAEDEB1` (`userid`),
  CONSTRAINT `FK143BF46AC62EF551` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK143BF46ACBAEDEB1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  CONSTRAINT `FK143BF46AD5256BA4` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK143BF46ADAA55504` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  CONSTRAINT `FKBC16F46AC62EF551` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKBC16F46ACBAEDEB1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  CONSTRAINT `FKBC16F46AD5256BA4` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKBC16F46ADAA55504` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('40288110574f8d8501574fb0fcec0002', '3', '40288110574f8d8501574fb0fcdf0001');
INSERT INTO `user_role` VALUES ('40288131570e534c01570e58de4e0004', '3', '40288131570e534c01570e58de380003');
INSERT INTO `user_role` VALUES ('40288131570e534c01570e5a3ea40006', '3', '40288131570e534c01570e5a3e960005');
INSERT INTO `user_role` VALUES ('40288131570e534c01570e5b82b60008', '3', '40288131570e534c01570e5b82a90007');
INSERT INTO `user_role` VALUES ('402881315741c94d015741ca6f550002', '3', '402881315741c94d015741ca6f3f0001');
INSERT INTO `user_role` VALUES ('402881315741cc98015741cf54ef0002', '3', '402881315741cc98015741cf54c70001');
INSERT INTO `user_role` VALUES ('402881315741d0bc015741d1f6830002', '3', '402881315741d0bc015741d1f66e0001');
INSERT INTO `user_role` VALUES ('402881315741d2cb015741d3dfed0002', '3', '402881315741d2cb015741d3dfd20001');
INSERT INTO `user_role` VALUES ('402881315741d2cb015741d4f5dd0004', '3', '402881315741d2cb015741d4f5d10003');
INSERT INTO `user_role` VALUES ('40288131576b65de01576b665f890002', '3', '40288131576b65de01576b665f760001');
INSERT INTO `user_role` VALUES ('4028813c5529b3c7015529c4c8ad0002', '3', '4028813c5529b3c7015529c4c8a10001');
INSERT INTO `user_role` VALUES ('4028818b54096eb50154096f45740002', '2', '4028818b54096eb50154096f45740002');
INSERT INTO `user_role` VALUES ('4028818b54096eb50154096f45860003', '3', '4028818b54096eb50154096f45740002');
INSERT INTO `user_role` VALUES ('4028818b5432293c0154322f35930005', '3', '4028818b5432293c0154322f35870004');
INSERT INTO `user_role` VALUES ('402881e7540870a20154098a200c0006', '3', '402881e7540870a20154098a20010005');
INSERT INTO `user_role` VALUES ('402881ea54129a8e015412a459560003', '3', '402881ea54129a8e015412a459480002');
INSERT INTO `user_role` VALUES ('402881ea575fcc7301575fce6c2d0002', '3', '402881ea575fcc7301575fce649f0001');
INSERT INTO `user_role` VALUES ('402881fb55b3812a0155b387c12d0002', '3', '402881fb55b3812a0155b387c0fd0001');
INSERT INTO `user_role` VALUES ('8af4d8b9540959520154097ae39f0008', '3', '8af4d8b9540959520154097ae39e0007');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201540982cc76000c', '3', '8af4d8b95409595201540982cc74000b');
INSERT INTO `user_role` VALUES ('8af4d8b9540959520154098332d4000d', '2', '8af4d8b9540959520154097ae39e0007');
INSERT INTO `user_role` VALUES ('8af4d8b9540959520154099303d50021', '3', '8af4d8b9540959520154099303d40020');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201540999377c0022', '2', '8af4d8b95409595201540982cc74000b');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015409a0c2320029', '3', '8af4d8b954095952015409a0c2310028');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015409a32c37002c', '3', '8af4d8b954095952015409a32c35002b');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015409a9aaac002f', '3', '8af4d8b954095952015409a9aaab002e');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015409abf35a0032', '2', '8af4d8b954095952015409a9aaab002e');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201540d8d63a7004d', '3', '8af4d8b95409595201540d8d63a6004c');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201540dc016860050', '3', '8af4d8b95409595201540dc01685004f');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201540e33764b0055', '2', '8af4d8b95409595201540dc01685004f');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201540ec4cf20005a', '3', '8af4d8b95409595201540ec4cf200059');
INSERT INTO `user_role` VALUES ('8af4d8b9540959520154126371c1005f', '3', '8af4d8b9540959520154126371c0005e');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201541273b8b80062', '2', '8af4d8b95409595201540ec4cf200059');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015412c4132b0097', '3', '8af4d8b954095952015412c4132a0096');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015413f60b4400b0', '2', '402881ea54129a8e015412a459480002');
INSERT INTO `user_role` VALUES ('8af4d8b9540959520154140263d300b2', '2', '402881ea54129a8e015412a459480002');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015414064ecf00b4', '3', '8af4d8b954095952015414064ece00b3');
INSERT INTO `user_role` VALUES ('8af4d8b9540959520154144b1eca00b5', '2', '8af4d8b954095952015409a0c2310028');
INSERT INTO `user_role` VALUES ('8af4d8b9540959520154282316e100c1', '2', '402881ea54129a8e015412a459480002');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015428acbd3200c9', '3', '8af4d8b954095952015428acbd3200c8');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015428afae5700ca', '2', '8af4d8b954095952015428acbd3200c8');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015428b0688700cb', '2', '8af4d8b954095952015428acbd3200c8');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d22cc0500ce', '3', '8af4d8b95409595201542d22cc0400cd');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d245d7c00d1', '3', '8af4d8b95409595201542d245d7b00d0');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d36b3c800d2', '2', '8af4d8b95409595201542d245d7b00d0');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d3fff2700d3', '2', '8af4d8b95409595201542d245d7b00d0');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d45e9b200d4', '2', '8af4d8b95409595201542d22cc0400cd');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d58723900d5', '2', '8af4d8b9540959520154099303d40020');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d769e7c00d8', '3', '8af4d8b95409595201542d769e7b00d7');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d7973c700db', '3', '8af4d8b95409595201542d7973c600da');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d8468bc00dc', '2', '8af4d8b95409595201542d7973c600da');
INSERT INTO `user_role` VALUES ('8af4d8b95409595201542d96287100dd', '2', '8af4d8b95409595201542d7973c600da');
INSERT INTO `user_role` VALUES ('8af4d8b954095952015432e1a51a00e6', '2', '8af4d8b95409595201542d769e7b00d7');
INSERT INTO `user_role` VALUES ('8af4d8b9552ed269015542e50e42001c', '3', '8af4d8b9552ed269015542e50e40001b');
INSERT INTO `user_role` VALUES ('8af4d8b9557ca35101557cf780000003', '3', '8af4d8b9557ca35101557cf77ffe0002');
INSERT INTO `user_role` VALUES ('8af4d8b955950761015595a532b20003', '3', '8af4d8b955950761015595a532b00002');
INSERT INTO `user_role` VALUES ('8af4d8b955a5c81d0155b38f8f640001', '2', '402881fb55b3812a0155b387c0fd0001');
INSERT INTO `user_role` VALUES ('8af4d8b955ec6b930155ec76a33f0003', '3', '8af4d8b955ec6b930155ec76a33d0002');
INSERT INTO `user_role` VALUES ('8af4d8b9560d16bf0156106a9c8e0010', '3', '8af4d8b9560d16bf0156106a9c8d000f');
INSERT INTO `user_role` VALUES ('8af4d8b9566a910a01566d0cd3e70014', '3', '8af4d8b9566a910a01566d0cd3e50013');
INSERT INTO `user_role` VALUES ('8af4d8b9566e6e2501567338de530033', '3', '8af4d8b9566e6e2501567338de520032');
INSERT INTO `user_role` VALUES ('8af4d8b95703e24a015703f115590004', '3', '8af4d8b95703e24a015703f115570003');
INSERT INTO `user_role` VALUES ('8af4d8b95703e24a015703f5f3df0005', '2', '8af4d8b95703e24a015703f115570003');
INSERT INTO `user_role` VALUES ('8af4d8b95703e24a015703f7db0d0006', '2', '8af4d8b95703e24a015703f115570003');
INSERT INTO `user_role` VALUES ('8af4d8b9571da59201571dd67963000e', '2', '8af4d8b9540959520154099303d40020');
INSERT INTO `user_role` VALUES ('8af4d8b9574fd89f01574fd9492a0002', '3', '8af4d8b9574fd89f01574fd9491b0001');
INSERT INTO `user_role` VALUES ('8af4d8b9576a4ecc01576ade36260002', '3', '8af4d8b9576a4ecc01576ade36210001');
INSERT INTO `user_role` VALUES ('8af4d8b9576a4ecc01576adead350004', '3', '8af4d8b9576a4ecc01576adead330003');
INSERT INTO `user_role` VALUES ('8af4d8b9576b258801576eaf7778000b', '3', '8af4d8b9576b258801576eaf7777000a');
INSERT INTO `user_role` VALUES ('8af4d8b9576b258801576eb0f585000d', '3', '8af4d8b9576b258801576eb0f583000c');
INSERT INTO `user_role` VALUES ('8af4d8b9577043510157a33e5792005b', '3', '8af4d8b9577043510157a33e5791005a');
INSERT INTO `user_role` VALUES ('8af4d8b957a80feb0157a84a74ba0004', '3', '8af4d8b957a80feb0157a84a74b90003');
INSERT INTO `user_role` VALUES ('8af4d8b957a80feb0157a86bc64d000f', '3', '8af4d8b957a80feb0157a86bc64a000e');
INSERT INTO `user_role` VALUES ('ff8080815432985a0154330b99a71234', '3', 'ff8080815432985a0154330b99a7001a');
