-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-08-10 15:35:57
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
(1, '00:00', 1, 1, '比赛开始啦', '', 0, 1533857951, 1533857951, NULL),
(2, '6:54', 10, 2, '比赛开始了...', '', 0, 1533915648, 1533915648, NULL),
(3, '8:10', 4, 2, '进球了', '', 0, 1533915724, 1533915724, NULL),
(4, '55:12', 10, 2, '进球了', '', 1, 1533915846, 1533915846, NULL),
(5, '55:41', 4, 2, '进球了', '', 1, 1533915875, 1533915875, NULL),
(6, '13:28', 1, 1, '进球了', '', 0, 1533915997, 1533915997, NULL),
(9, '44:17', 8, 1, '下半场开始了', 'http://wx.live.com/static/upload/20180811/1e8fc0354d2c2c05058510cc69aba320.jpeg', 1, 1533917845, 1533917845, NULL);

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
(1, '8:9', 19, 4, 2, 1533915723, NULL, 1533915723),
(2, '9:9', 5, 10, 2, 1533915783, NULL, 1533915783),
(3, '55:12', 8, 10, 2, 1533915845, NULL, 1533915845),
(4, '55:40', 20, 4, 2, 1533915875, NULL, 1533915875),
(5, '13:28', 13, 1, 1, 1533915997, NULL, 1533915997),
(6, '34:6', 3, 8, 1, 1533917235, NULL, 1533917235);

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
(1, 1, 8, 1533915189, 1, 1533917835, 1, 'http://wx.live.com/static/upload/20180810/ad63346219540611c3f7dfa43a5917b3.jpg', 1533857425, 1533917835, NULL),
(2, 4, 10, 1534104000, 0, 0, 1, 'http://wx.live.com/static/upload/20180810/e34ac0f8def737a266cf949e53371673.jpg', 1533857512, 1533915775, NULL),
(3, 1, 4, 1533970800, 0, 0, 1, 'http://wx.live.com/static/upload/20180810/bdd7114a89e320e4854f6504ed80f988.jpg', 1533916445, 1533916445, NULL),
(4, 7, 1, 1534050000, 0, 0, 1, 'http://wx.live.com/static/upload/20180811/85e9fba352aeb567ec1bdbe37f6bd120.jpg', 1533917113, 1533917113, NULL);

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
(1, '莱万', 'http://wx.live.com/static/upload/20180810/d0014cee614dee7dfdaca7f5fd5c0dd0.png', 8, 1533856655, 1533856655, NULL),
(2, '穆勒', 'http://wx.live.com/static/upload/20180810/247993f72ede756b01e06d7ea7ef2f15.png', 8, 1533856671, 1533856671, NULL),
(3, '罗本', 'http://wx.live.com/static/upload/20180810/fac42b27b122733b06bf148e54074eba.jpg', 8, 1533856697, 1533856697, NULL),
(4, '博阿滕', 'http://wx.live.com/static/upload/20180810/444f59cf9a6a0e64ebd06b5f3af3b3bb.png', 8, 1533856725, 1533856725, NULL),
(5, '内马尔', 'http://wx.live.com/static/upload/20180810/10a318d38dda1350a357780c23912efc.png', 10, 1533856761, 1533856761, NULL),
(6, '姆巴佩', 'http://wx.live.com/static/upload/20180810/d0362e17685623c1bbe9ab4d02b639f4.png', 10, 1533856892, 1533856892, NULL),
(7, '布冯', 'http://wx.live.com/static/upload/20180810/817aa2fdbde0fc7b64dd58bacc020a59.jpg', 10, 1533856903, 1533856903, NULL),
(8, '席尔瓦', 'http://wx.live.com/static/upload/20180810/8920a7adf3fa8466b4e147b34e64fc03.png', 10, 1533856924, 1533856924, NULL),
(9, '曼朱基奇', 'http://wx.live.com/static/upload/20180810/7394e7ce22453e419e900208246de7e0.png', 5, 1533857004, 1533857004, NULL),
(10, '皮亚尼奇', 'http://wx.live.com/static/upload/20180810/2fa4fa54a5a148827c213a5982b93e64.jpg', 5, 1533857018, 1533857018, NULL),
(11, 'C罗', 'http://wx.live.com/static/upload/20180810/d481c7ee53bf5563bc319a7929f6b328.png', 5, 1533857042, 1533857042, NULL),
(12, '保罗', 'http://wx.live.com/static/upload/20180810/07a4d580b07dffbd72e76bc6a14b13b9.png', 5, 1533857054, 1533857054, NULL),
(13, '梅西', 'http://wx.live.com/static/upload/20180810/651b5582a46e23149bea226c3182eb2b.png', 1, 1533857135, 1533857135, NULL),
(14, '皮克', 'http://wx.live.com/static/upload/20180810/d5dbf76137ae3a587990c6538539026b.png', 1, 1533857143, 1533857143, NULL),
(15, '拉基蒂奇', 'http://wx.live.com/static/upload/20180810/509ebc1e4615cabbe256ce842945605a.png', 1, 1533857158, 1533857158, NULL),
(16, '苏亚雷斯', 'http://wx.live.com/static/upload/20180810/85d0f433c60c95373a344de1b5146ecd.png', 1, 1533857167, 1533857167, NULL),
(17, '凯恩', 'http://wx.live.com/static/upload/20180810/a6d84b3c92948282e5f0f089c74a0578.png', 2, 1533857228, 1533857228, NULL),
(18, '阿里', 'http://wx.live.com/static/upload/20180810/2808ee092c82722d1022c4fca938df27.png', 2, 1533857236, 1533857236, NULL),
(19, '莫德里奇', 'http://wx.live.com/static/upload/20180810/f5ec0aa31164cc7fa5f03d88b2e33aeb.png', 4, 1533857274, 1533857274, NULL),
(20, '贝尔', 'http://wx.live.com/static/upload/20180810/b37badd191890beeb1ec2f815d2cb0f5.jpg', 4, 1533857283, 1533857283, NULL),
(21, '马塞洛', 'http://wx.live.com/static/upload/20180810/d4d97fb38fd9f89b82d89580fb5da223.png', 4, 1533857291, 1533857291, NULL),
(22, '本泽马', 'http://wx.live.com/static/upload/20180810/286ade7597f6e83fba046c1eeeea78b2.jpg', 4, 1533857300, 1533857300, NULL);

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
(1, 1, 1, 1, 1, 0, 0, 1, 1533857425, NULL),
(2, 2, 2, 2, 1, 0, 1, 2, 1533857512, NULL),
(3, 3, 0, 0, 0, 0, 0, 0, 1533916445, NULL),
(4, 4, 0, 0, 0, 0, 0, 0, 1533917113, NULL);

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
(1, '巴塞罗那', 'http://wx.live.com/static/upload/20180810/f947fbdebb44ae478ccb242e248b87b1.png', 1533855705, 1533855705, NULL),
(2, '热刺', 'http://wx.live.com/static/upload/20180810/8df620d76b4b6c5a30f41e3f2285d19c.png', 1533855738, 1533855738, NULL),
(3, 'AC米兰', 'http://wx.live.com/static/upload/20180810/6017ce49f6e8892cd51e9be749edde41.png', 1533855770, 1533855770, NULL),
(4, '皇家马德里', 'http://wx.live.com/static/upload/20180810/a80374d850f4b8d52175b71c1153fe9a.png', 1533855802, 1533855802, NULL),
(5, '尤文图斯', 'http://wx.live.com/static/upload/20180810/18b9bec651a69a76ae4f04139448f096.png', 1533855837, 1533855837, NULL),
(6, '马德里竞技', 'http://wx.live.com/static/upload/20180810/8c971b89716b33ede3f5e491f1d2cfb0.png', 1533855870, 1533855870, NULL),
(7, '切尔西', 'http://wx.live.com/static/upload/20180810/4589c96d1d68e7b66d112c4f70d21572.png', 1533855937, 1533855937, NULL),
(8, '拜仁慕尼黑', 'http://wx.live.com/static/upload/20180810/67e22a377b7f7d1996792293c421219e.png', 1533855981, 1533855981, NULL),
(10, '巴黎圣日耳曼', 'http://wx.live.com/static/upload/20180810/5b57da2949c8f663cc17fc3db56dfd9f.png', 1533856024, 1533856024, NULL);

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
(1, '51f13c1e733c4409718fc85e5b21933f', 1534114877),
(2, 'f11b12dbc5aa36baa5c31e14b454cf3b', 1534170790),
(3, '8a7a4d7de8942f8d44de30cff2808587', 1534173591),
(4, '77bb01527a6a89a4018bff5a322ef045', 1534175566),
(5, '6d08c98da72bcdd7246702bf7d9859a9', 1534176166);

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
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `goal`
--
ALTER TABLE `goal`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `match`
--
ALTER TABLE `match`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `player`
--
ALTER TABLE `player`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用表AUTO_INCREMENT `score`
--
ALTER TABLE `score`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `team`
--
ALTER TABLE `team`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `token`
--
ALTER TABLE `token`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
