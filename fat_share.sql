/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.29-log : Database - fat_share
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fat_share` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

/*Table structure for table `fat_option` */

DROP TABLE IF EXISTS `fat_option`;

CREATE TABLE `fat_option` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `fat_option` */

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

/*Table structure for table `fat_post` */

DROP TABLE IF EXISTS `fat_post`;

CREATE TABLE `fat_post` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` varchar(7) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `url_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'url名',
  `url_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'url访问形式',
  `content` mediumtext NOT NULL COMMENT '内容',
  `tags` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `views` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态{0:正常,1:草稿,2:回收站}',
  `post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `is_top` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `up_file_path` varchar(100) NOT NULL DEFAULT '' COMMENT '文件信息',
  PRIMARY KEY (`id`),
  KEY `userid` (`user_id`),
  KEY `posttime` (`post_time`),
  KEY `urlname` (`url_name`),
  KEY `up_file_path` (`up_file_path`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `fat_post` */

insert  into `fat_post`(`id`,`user_id`,`author`,`title`,`color`,`url_name`,`url_type`,`content`,`tags`,`views`,`status`,`post_time`,`update_time`,`is_top`,`up_file_path`) values (6,1,'admin','测试','','',0,'',',测试,',0,0,'2017-06-30 01:45:33','2017-06-30 01:46:51',0,'');
insert  into `fat_post`(`id`,`user_id`,`author`,`title`,`color`,`url_name`,`url_type`,`content`,`tags`,`views`,`status`,`post_time`,`update_time`,`is_top`,`up_file_path`) values (7,1,'admin','test','','',0,'','',0,0,'2017-07-01 02:11:00','2017-07-01 02:11:26',0,'/static/upload/20170630/1498817470010270100.jpg');

/*Table structure for table `fat_tag` */

DROP TABLE IF EXISTS `fat_tag`;

CREATE TABLE `fat_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '标签名',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `fat_tag` */

insert  into `fat_tag`(`id`,`name`,`count`) values (3,'测试',1);

/*Table structure for table `fat_tag_post` */

DROP TABLE IF EXISTS `fat_tag_post`;

CREATE TABLE `fat_tag_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '标签id',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '内容id',
  `post_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '内容状态',
  `post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `tagid` (`tag_id`),
  KEY `postid` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `fat_tag_post` */

insert  into `fat_tag_post`(`id`,`tag_id`,`post_id`,`post_status`,`post_time`) values (7,3,6,0,'2017-06-30 01:46:51');

/*Table structure for table `fat_user` */

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

/*Data for the table `fat_user` */

insert  into `fat_user`(`id`,`user_name`,`password`,`email`,`login_count`,`last_ip`,`last_login`,`authkey`,`active`) values (1,'admin','7fef6171469e80d32c0559f88b377245','admin@admin.com',18,'127.0.0.1','2017-06-30 23:48:20','',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
