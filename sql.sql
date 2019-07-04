/*
MySQL Backup
Database: renshi
Backup Time: 2019-07-04 09:55:50
*/

create database renshi;

use renshi;


SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `renshi`.`approval`;
DROP TABLE IF EXISTS `renshi`.`leader`;
DROP TABLE IF EXISTS `renshi`.`worker`;
CREATE TABLE `approval` (
  `worker_id` varchar(32) DEFAULT NULL,
  `worker_approval` varchar(32) DEFAULT NULL,
  `worker_name` varchar(32) DEFAULT NULL,
  `worker_reason` text,
  `worker_date` varchar(32) DEFAULT NULL,
  `worker_status` varchar(16) DEFAULT '等待审批',
  `worker_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_dept` varchar(32) DEFAULT NULL,
  `worker_address` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`worker_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
CREATE TABLE `leader` (
  `leader_id` varchar(32) NOT NULL DEFAULT '',
  `leader_name` varchar(32) DEFAULT NULL,
  `leader_pwd` varchar(32) DEFAULT NULL,
  `leader_phone` varchar(16) DEFAULT NULL,
  `leader_email` varchar(32) DEFAULT NULL,
  `leader_position` varchar(16) NOT NULL,
  `leader_age` bigint(20) DEFAULT NULL,
  `leader_gen` varchar(16) DEFAULT NULL,
  `leader_IDNUM` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`leader_id`),
  UNIQUE KEY `leader_leader_IDNUM_uindex` (`leader_IDNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `worker` (
  `worker_id` varchar(32) NOT NULL DEFAULT '',
  `worker_name` varchar(32) NOT NULL,
  `worker_pwd` varchar(32) NOT NULL,
  `worker_phone` varchar(16) DEFAULT NULL,
  `worker_email` varchar(32) DEFAULT NULL,
  `worker_position` varchar(16) DEFAULT NULL,
  `worker_gen` varchar(10) DEFAULT NULL,
  `worker_age` bigint(20) DEFAULT NULL,
  `worker_IDNUM` varchar(20) DEFAULT NULL,
  `worker_dept` varchar(32) DEFAULT NULL,
  `worker_address` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`worker_id`),
  UNIQUE KEY `worker_worker_IDNUM_uindex` (`worker_IDNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
BEGIN;
LOCK TABLES `renshi`.`approval` WRITE;
DELETE FROM `renshi`.`approval`;

UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `renshi`.`leader` WRITE;
DELETE FROM `renshi`.`leader`;
INSERT INTO `renshi`.`leader` (`leader_id`,`leader_name`,`leader_pwd`,`leader_phone`,`leader_email`,`leader_position`,`leader_age`,`leader_gen`,`leader_IDNUM`) VALUES ('1', 'admin', 'admin888', '13475623465', '101@qq.com', 'BOSS', 21, '男', '122345199802230040');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `renshi`.`worker` WRITE;
DELETE FROM `renshi`.`worker`;
INSERT INTO `renshi`.`worker` (`worker_id`,`worker_name`,`worker_pwd`,`worker_phone`,`worker_email`,`worker_position`,`worker_gen`,`worker_age`,`worker_IDNUM`,`worker_dept`,`worker_address`) VALUES ('1', 'admin', 'admin888', '15158234457', '1@qq.com', '员工', '男', 22, '610724199403025899', '技术部', '北京');
UNLOCK TABLES;
COMMIT;
