-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(20)  NOT NULL COMMENT 'user_name',
  `password` varchar(20)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '����',
  `userImage` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `city` varchar(20)  NOT NULL COMMENT '���ڳ���',
  `address` varchar(80)  NOT NULL COMMENT '��ͥ��ַ',
  `email` varchar(50)  NULL COMMENT '����',
  `paypalAccount` varchar(20)  NOT NULL COMMENT 'paypal�˻���',
  `createTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_itemClass` (
  `classId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʒ����id',
  `className` varchar(50)  NOT NULL COMMENT '��Ʒ�������',
  `classDesc` varchar(2000)  NOT NULL COMMENT '�������',
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_item` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʒid',
  `itemClassObj` int(11) NOT NULL COMMENT '��Ʒ����',
  `pTitle` varchar(80)  NOT NULL COMMENT '��Ʒ����',
  `itemPhoto` varchar(60)  NOT NULL COMMENT '��ƷͼƬ',
  `itemDesc` varchar(5000)  NOT NULL COMMENT '��Ʒ����',
  `userObj` varchar(20)  NOT NULL COMMENT '������',
  `startPrice` float NOT NULL COMMENT '���ļ�',
  `startTime` varchar(20)  NULL COMMENT '����ʱ��',
  `endTime` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_productBidding` (
  `biddingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������',
  `itemObj` int(11) NOT NULL COMMENT '������Ʒ',
  `userObj` varchar(20)  NOT NULL COMMENT '�����û�',
  `biddingTime` varchar(20)  NULL COMMENT '����ʱ��',
  `biddingPrice` float NOT NULL COMMENT '���ĳ���',
  PRIMARY KEY (`biddingId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_postInfo` (
  `postInfoId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `pTitle` varchar(80)  NOT NULL COMMENT '���ӱ���',
  `content` varchar(5000)  NOT NULL COMMENT '��������',
  `userObj` varchar(20)  NOT NULL COMMENT '������',
  `addTime` varchar(20)  NULL COMMENT '����ʱ��',
  `hitNum` int(11) NOT NULL COMMENT '�����',
  PRIMARY KEY (`postInfoId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_reply` (
  `replyId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ظ�id',
  `postInfoObj` int(11) NOT NULL COMMENT '��������',
  `content` varchar(2000)  NOT NULL COMMENT '�ظ�����',
  `userObj` varchar(20)  NOT NULL COMMENT '�ظ���',
  `replyTime` varchar(20)  NULL COMMENT '�ظ�ʱ��',
  PRIMARY KEY (`replyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_userFollow` (
  `followId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼id',
  `userObj1` varchar(20)  NOT NULL COMMENT '����ע��',
  `userObj2` varchar(20)  NOT NULL COMMENT '��ע��',
  `followTime` varchar(20)  NULL COMMENT '��עʱ��',
  PRIMARY KEY (`followId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_item ADD CONSTRAINT FOREIGN KEY (itemClassObj) REFERENCES t_itemClass(classId);
ALTER TABLE t_item ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_productBidding ADD CONSTRAINT FOREIGN KEY (itemObj) REFERENCES t_item(itemId);
ALTER TABLE t_productBidding ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_postInfo ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_reply ADD CONSTRAINT FOREIGN KEY (postInfoObj) REFERENCES t_postInfo(postInfoId);
ALTER TABLE t_reply ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_userFollow ADD CONSTRAINT FOREIGN KEY (userObj1) REFERENCES t_userInfo(user_name);
ALTER TABLE t_userFollow ADD CONSTRAINT FOREIGN KEY (userObj2) REFERENCES t_userInfo(user_name);


