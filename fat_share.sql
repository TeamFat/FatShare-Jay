DROP DATABASE IF EXISTS `fat_share`;
CREATE DATABASE `fat_share`;
USE `fat_share`;
SET CHARSET utf8;

DROP TABLE IF EXISTS `fat_option`;

CREATE TABLE `fat_option` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;



insert  into `fat_option`(`id`,`name`,`value`) values (1,'sitename','FatShare演示');
insert  into `fat_option`(`id`,`name`,`value`) values (2,'siteurl','http://www.teamfat.cn');
insert  into `fat_option`(`id`,`name`,`value`) values (3,'subtitle','基于Go语言和Beego框架的文档分享系统');
insert  into `fat_option`(`id`,`name`,`value`) values (4,'pagesize','10');
insert  into `fat_option`(`id`,`name`,`value`) values (5,'keywords','Go语言,文档分享程序,FatShare');
insert  into `fat_option`(`id`,`name`,`value`) values (6,'description','基于Go语言和Beego框架的文档分享系统');
insert  into `fat_option`(`id`,`name`,`value`) values (7,'email','chenjie@chenjie.info');
insert  into `fat_option`(`id`,`name`,`value`) values (8,'theme','default');
insert  into `fat_option`(`id`,`name`,`value`) values (9,'timezone','8');
insert  into `fat_option`(`id`,`name`,`value`) values (10,'stat','');



DROP TABLE IF EXISTS `fat_user`;

CREATE TABLE `fat_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `login_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_ip` varchar(15) NOT NULL DEFAULT '0' COMMENT '最后登录ip',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `authkey` char(10) NOT NULL DEFAULT '' COMMENT '登录key',
  `active` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否激活',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



insert  into `fat_user`(`id`,`user_name`,`password`,`email`,`login_count`,`last_ip`,`last_login`,`authkey`,`active`) values (1,'admin','7fef6171469e80d32c0559f88b377245','admin@admin.com',14,'127.0.0.1','2017-06-23 04:22:35','',1);


