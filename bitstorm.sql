/*
SQLyog Ultimate - MySQL GUI v8.22 
MySQL - 5.1.53-log : Database - bitstorm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bitstorm` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `peer` */

CREATE TABLE `peer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(40) NOT NULL COMMENT 'peer_id',
  `user_agent` varchar(80) DEFAULT NULL,
  `ip_address` int(10) unsigned NOT NULL COMMENT 'ip',
  `key` char(40) NOT NULL COMMENT 'key',
  `port` smallint(5) unsigned NOT NULL COMMENT 'port',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_key` (`hash`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `peer_torrent` */

CREATE TABLE `peer_torrent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peer_id` int(10) unsigned NOT NULL,
  `torrent_id` int(10) unsigned NOT NULL,
  `uploaded` bigint(20) unsigned DEFAULT NULL COMMENT 'uploaded',
  `downloaded` bigint(20) unsigned DEFAULT NULL COMMENT 'downloaded',
  `left` bigint(20) unsigned DEFAULT NULL COMMENT 'left',
  `last_updated` datetime NOT NULL,
  `stopped` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `peer_torrent` (`peer_id`,`torrent_id`),
  KEY `update_torrent` (`torrent_id`,`stopped`,`last_updated`,`left`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `torrent` */

CREATE TABLE `torrent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(40) NOT NULL COMMENT 'info_hash',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
