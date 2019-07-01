-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019 年 06 月 15 日 01:54
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `fly_ticket_pre_book`
--
CREATE DATABASE `fly_ticket_pre_book` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fly_ticket_pre_book`;

-- --------------------------------------------------------

--
-- 表的结构 `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `user` varchar(16) NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(32) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员用户表';

--
-- 转存表中的数据 `admin_user`
--

INSERT INTO `admin_user` (`user`, `pwd`) VALUES
('admin', '74D839D98630E280DF752E8939454A6B');

-- --------------------------------------------------------

--
-- 表的结构 `common_user`
--

CREATE TABLE IF NOT EXISTS `common_user` (
  `user_name` varchar(16) NOT NULL,
  `user_pwd` varchar(32) NOT NULL,
  `avatar_img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `common_user`
--

INSERT INTO `common_user` (`user_name`, `user_pwd`, `avatar_img`) VALUES
('admin', '74D839D98630E280DF752E8939454A6B', '9c77f9e7-6334-49df-a444-149e7bd49f81.png');

-- --------------------------------------------------------

--
-- 表的结构 `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
  `f_n` varchar(6) NOT NULL COMMENT '航班号',
  `f_s_p` varchar(4) NOT NULL COMMENT '航班起点',
  `f_e_p` varchar(4) NOT NULL COMMENT '航班终点',
  `f_s_a` varchar(12) NOT NULL COMMENT '航班起飞机场',
  `f_a_a` varchar(12) NOT NULL COMMENT '航班到达机场',
  `f_d_t` varchar(5) NOT NULL COMMENT '起飞(departure)时间',
  `f_a_t` varchar(5) NOT NULL COMMENT '到达时间',
  `f_f_c_p` int(11) NOT NULL COMMENT '头等舱价格First class price',
  `f_s_c_p` int(11) NOT NULL COMMENT '商务舱价格',
  `f_t_c_p` int(11) NOT NULL COMMENT '经济舱价格',
  PRIMARY KEY (`f_n`),
  UNIQUE KEY `f_n` (`f_n`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='航班信息';

--
-- 转存表中的数据 `flight`
--

INSERT INTO `flight` (`f_n`, `f_s_p`, `f_e_p`, `f_s_a`, `f_a_a`, `f_d_t`, `f_a_t`, `f_f_c_p`, `f_s_c_p`, `f_t_c_p`) VALUES
('SU2312', '北京', '郑州', '大兴机场', '新郑机场', '07:30', '12:00', 2100, 1500, 800),
('CA3060', '北京', '上海', '首都机场', '虹桥机场', '08:30', '12:30', 2100, 1600, 1200);

-- --------------------------------------------------------

--
-- 表的结构 `t_order`
--

CREATE TABLE IF NOT EXISTS `t_order` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `order_user` varchar(16) NOT NULL COMMENT '下单用户',
  `f_n` varchar(6) NOT NULL COMMENT '航班号',
  `p_name` varchar(6) NOT NULL COMMENT '乘客姓名',
  `date` varchar(12) NOT NULL COMMENT '订单日期',
  `grade` varchar(3) NOT NULL COMMENT '舱别',
  `p_id` varchar(18) NOT NULL COMMENT '乘客身份证号',
  `contact` varchar(6) NOT NULL COMMENT '联系人',
  `c_p` varchar(11) NOT NULL COMMENT '联系人电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `t_order`
--

INSERT INTO `t_order` (`id`, `order_user`, `f_n`, `p_name`, `date`, `grade`, `p_id`, `contact`, `c_p`) VALUES
(5, 'test1', 'CA3060', '张三', '2019-06-28', '头等舱', '412728199511322832', '章二', '15839607201'),
(4, 'test1', 'SU2312', '小糊涂仙 ', '2019-06-14', '头等舱', '412728199511322806', '小糊涂仙', '15839607201'),


-- --------------------------------------------------------

--
-- 表的结构 `user_message`
--

CREATE TABLE IF NOT EXISTS `user_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(10) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `message_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `user_message`
--

INSERT INTO `user_message` (`id`, `time`, `user_name`, `message_content`) VALUES
(24, '2019-6-14', '小糊涂仙', '贵公司服务态度很好，继续努力^c^');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
