-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-08-07 16:29:22
-- 服务器版本： 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `commentary` (
  `id` smallint(6) NOT NULL,
  `time` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '时间 例如 12:00',
  `team_id` smallint(6) NOT NULL,
  `match_id` smallint(6) NOT NULL,
  `content` varchar(300) COLLATE utf8_bin NOT NULL,
  `img` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `section` tinyint(4) DEFAULT '0' COMMENT '上半场 0 / 下半场 1',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `commentary`
--

INSERT INTO `commentary` (`id`, `time`, `team_id`, `match_id`, `content`, `img`, `section`, `create_time`, `update_time`, `delete_time`) VALUES
(1, '6:01', 1, 1, '梅西带球突破底线，获得角球', NULL, 0, 1533329706, 1533329706, NULL),
(4, '15:00', 2, 1, 'C罗单刀突破后防线，将球打入对方球门', NULL, 0, 1533329921, 1533329921, NULL),
(3, '8:32', 1, 1, '内马尔受侵犯倒地，巴塞罗那获得任意球', 'http://wx.live.com/static/upload/20180804\\0ebfe72f36aeceb47e38296e3ad7acdf.png', 0, 1533329857, 1533329857, NULL),
(5, '20:01', 1, 1, '苏亚雷斯又咬人了', NULL, 0, 1533329989, 1533329989, NULL),
(59, '45:00', 1, 2, '下半场开场了', NULL, 1, 1533680625, 1533680625, NULL),
(57, '46:00', 1, 2, '裁判终止了上半场比赛', NULL, 0, 1533680519, 1533680519, NULL),
(53, '3:30', 3, 2, '穆勒中场长传，球出了底线', NULL, 0, 1533680400, 1533680400, NULL),
(54, '44:00', 3, 2, '上半场快结束了..', NULL, 0, 1533680460, 1533680460, NULL),
(48, '0:30', 1, 2, '比赛开始了', NULL, 0, 1533678489, 1533678489, NULL),
(55, '44:00', 1, 1, '上半场快结束了..', NULL, 0, 1533680473, 1533680473, NULL),
(56, '46:00', 1, 1, '裁判终止了上半场比赛', NULL, 0, 1533680510, 1533680510, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `goal`
--

CREATE TABLE `goal` (
  `id` smallint(6) NOT NULL,
  `time` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '进球时间 例如：35:32',
  `player_id` smallint(6) NOT NULL,
  `team_id` smallint(6) NOT NULL,
  `match_id` smallint(6) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='进球记录';

--
-- 转存表中的数据 `goal`
--

INSERT INTO `goal` (`id`, `time`, `player_id`, `team_id`, `match_id`, `create_time`, `delete_time`, `update_time`) VALUES
(1, '10:43', 1, 1, 1, 1533327846, NULL, 1533327846),
(2, '55:32', 4, 1, 1, 1533328688, NULL, 1533328688),
(3, '55:32', 4, 1, 1, 1533328708, NULL, 1533328708);

-- --------------------------------------------------------

--
-- 表的结构 `match`
--

CREATE TABLE `match` (
  `id` int(11) NOT NULL,
  `team1_id` int(11) NOT NULL COMMENT '主队id',
  `team2_id` int(11) NOT NULL COMMENT '客队id',
  `time` int(11) NOT NULL COMMENT '开始时间',
  `live` tinyint(4) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '下半场开场时间',
  `type` tinyint(4) NOT NULL COMMENT '比赛类型',
  `banner` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '比赛页面banner',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `match`
--

INSERT INTO `match` (`id`, `team1_id`, `team2_id`, `time`, `live`, `status`, `type`, `banner`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 1, 2, 1533691248, 1, 0, 1, 'http://wx.live.com/static/upload/20180804\\65e019d5c014b2cb8c194121b1d6e0ad.jpg', 1533316078, 1533316078, NULL),
(2, 1, 3, 1533777648, 1, 0, 1, 'http://wx.live.com/static/upload/20180804\\65e019d5c014b2cb8c194121b1d6e0ad.jpg', 1533316133, 1533316133, NULL),
(3, 2, 3, 1533777648, 0, 0, 1, 'http://wx.live.com/static/upload/20180804\\65e019d5c014b2cb8c194121b1d6e0ad.jpg', 1533316143, 1533316143, NULL),
(4, 4, 3, 1533777648, 0, 0, 1, 'http://wx.live.com/static/upload/20180804\\65e019d5c014b2cb8c194121b1d6e0ad.jpg', 1533316158, 1533316158, NULL),
(5, 4, 1, 1533864048, 0, 0, 1, 'http://wx.live.com/static/upload/20180804\\65e019d5c014b2cb8c194121b1d6e0ad.jpg', 1533316164, 1533316164, NULL),
(8, 4, 2, 1533864048, 0, 0, 1, 'http://wx.live.com/static/upload/20180804\\65e019d5c014b2cb8c194121b1d6e0ad.jpg', 1533326724, 1533326724, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `player`
--

CREATE TABLE `player` (
  `id` smallint(6) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '球员名称',
  `icon` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '球员头像',
  `team_id` smallint(6) NOT NULL COMMENT '球员所属球队id',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `player`
--

INSERT INTO `player` (`id`, `name`, `icon`, `team_id`, `create_time`, `update_time`, `delete_time`) VALUES
(1, '梅西', 'http://wx.live.com/static/upload/20180804\\367d573dbbeb618a8f0fc9a3b1320f04.jpg', 1, 1533313216, 1533313216, NULL),
(2, 'C罗', 'http://wx.live.com/static/upload/20180804\\f08015ba358bdb44c2889654f1104d06.jpg', 2, 1533313362, 1533313362, NULL),
(3, '马塞洛', 'http://wx.live.com/static/upload/20180804\\b5a8cb36b765b0fefc89ca60f623ce23.png', 2, 1533313396, 1533313396, NULL),
(4, '内马尔', 'http://wx.live.com/static/upload/20180804\\c7665f562a877405c01cb4e446190df8.jpg', 1, 1533313418, 1533313418, NULL),
(5, '托马斯-穆勒', 'http://wx.live.com/static/upload/20180804\\a67ab481c3b14414cd5627f2c273ea87.jpg', 3, 1533313529, 1533313529, NULL),
(6, '莱万多夫斯基', 'http://wx.live.com/static/upload/20180804\\142647abf255997a2f21692e4eb088ef.jpg', 3, 1533313578, 1533313578, NULL),
(7, '保罗', 'http://wx.live.com/static/upload/20180804\\9c3f0f4b7c488d90725ebe70eff39d58.png', 4, 1533313643, 1533313643, NULL),
(8, '斯科塔', 'http://wx.live.com/static/upload/20180804\\5886a0a6208396ac0a3aafbc1087c160.png', 4, 1533313692, 1533313692, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `score`
--

CREATE TABLE `score` (
  `id` smallint(6) NOT NULL,
  `match_id` smallint(6) NOT NULL,
  `team1_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '主队得分',
  `team2_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客队得分',
  `team1_first` tinyint(4) NOT NULL DEFAULT '0' COMMENT '主队上半场得分',
  `team2_first` tinyint(4) DEFAULT '0' COMMENT '客队上半场得分',
  `team1_second` tinyint(4) DEFAULT '0' COMMENT '主队下半场得分',
  `team2_second` tinyint(4) DEFAULT '0' COMMENT '客队下半场得分',
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `score`
--

INSERT INTO `score` (`id`, `match_id`, `team1_score`, `team2_score`, `team1_first`, `team2_first`, `team1_second`, `team2_second`, `create_time`, `delete_time`) VALUES
(1, 1, 3, 0, 1, 0, 2, 0, NULL, NULL),
(2, 2, 0, 0, 0, 0, 0, 0, NULL, NULL),
(3, 3, 0, 0, 0, 0, 0, 0, NULL, NULL),
(4, 4, 0, 0, 0, 0, 0, 0, NULL, NULL),
(5, 5, 0, 0, 0, 0, 0, 0, NULL, NULL),
(6, 6, 0, 0, 0, 0, 0, 0, 1533326192, NULL),
(8, 8, 0, 0, 0, 0, 0, 0, 1533326724, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `team`
--

CREATE TABLE `team` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '球队名称',
  `icon` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '球队图标',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `team`
--

INSERT INTO `team` (`id`, `name`, `icon`, `update_time`, `create_time`, `delete_time`) VALUES
(1, '巴塞罗那', 'http://wx.live.com/static/upload/20180803\\4b7429fa1d3c591cb770d0e398d4cd41.jpg', 1533311982, 1533311982, NULL),
(2, '皇家马德里', 'http://wx.live.com/static/upload/20180804\\e1c6cc148a89cb5a0082bc37ad863420.png', 1533312024, 1533312024, NULL),
(3, '拜仁慕尼黑', 'http://wx.live.com/static/upload/20180804\\e9508e5d4e0b5de5cc85536df61d893d.png', 1533312146, 1533312146, NULL),
(4, '尤文图斯', 'http://wx.live.com/static/upload/20180804\\22a85e25e845230101f72da2c1742ad4.png', 1533312163, 1533312163, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `token`
--

CREATE TABLE `token` (
  `id` smallint(6) NOT NULL,
  `token` char(32) COLLATE utf8_bin NOT NULL,
  `expire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `token`
--

INSERT INTO `token` (`id`, `token`, `expire`) VALUES
(1, 'e5ea9b6d71086dfef3a15f726abcc5bf', 1533856326);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentary`
--
ALTER TABLE `commentary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal`
--
ALTER TABLE `goal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `commentary`
--
ALTER TABLE `commentary`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- 使用表AUTO_INCREMENT `goal`
--
ALTER TABLE `goal`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `match`
--
ALTER TABLE `match`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `player`
--
ALTER TABLE `player`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `score`
--
ALTER TABLE `score`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `team`
--
ALTER TABLE `team`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `token`
--
ALTER TABLE `token`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
