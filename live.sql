-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-08-03 04:35:46
-- 服务器版本： 5.7.19
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `live`
--

-- --------------------------------------------------------

--
-- 表的结构 `commentary`
--

DROP TABLE IF EXISTS `commentary`;
CREATE TABLE IF NOT EXISTS `commentary` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `time` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '时间 例如 12:00',
  `team_id` smallint(6) NOT NULL,
  `content` varchar(300) COLLATE utf8_bin NOT NULL,
  `img` varchar(250) COLLATE utf8_bin NOT NULL,
  `time_zone` tinyint(4) NOT NULL COMMENT '上半场 0 / 下半场 1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `goal`
--

DROP TABLE IF EXISTS `goal`;
CREATE TABLE IF NOT EXISTS `goal` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `time` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '进球时间 例如：35:32',
  `player_id` smallint(6) NOT NULL,
  `match_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='进球记录';

-- --------------------------------------------------------

--
-- 表的结构 `match`
--

DROP TABLE IF EXISTS `match`;
CREATE TABLE IF NOT EXISTS `match` (
  `id` int(11) NOT NULL,
  `team1_id` int(11) NOT NULL COMMENT '主队id',
  `team2_id` int(11) NOT NULL COMMENT '客队id',
  `time` int(11) NOT NULL COMMENT '开始时间',
  `first_score` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '上半场比分',
  `second_score` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '下半场比分',
  `score` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '总比分',
  `type` tinyint(4) NOT NULL COMMENT '比赛类型',
  `banner` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '比赛页面banner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '球员名称',
  `icon` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '球员头像',
  `team_id` smallint(6) NOT NULL COMMENT '球员所属球队id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '球队名称',
  `icon` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '球队图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
