-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 21, 2023 at 06:40 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jsp_ocs`
--
CREATE DATABASE IF NOT EXISTS `jsp_ocs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jsp_ocs`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `userid` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`userid`, `pwd`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cname` varchar(200) NOT NULL,
  PRIMARY KEY (`cname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cname`) VALUES
('Mobile'),
('Refrigerator'),
('Television'),
('Washing Machine');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city`) VALUES
('Chennai'),
('Dindigul'),
('Madurai'),
('Trichy');

-- --------------------------------------------------------

--
-- Table structure for table `newproduct`
--

CREATE TABLE IF NOT EXISTS `newproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(100) NOT NULL,
  `cname` varchar(150) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `modelname` varchar(100) NOT NULL,
  `specs` varchar(500) NOT NULL,
  `price` float NOT NULL,
  `discount` varchar(10) NOT NULL,
  `oprice` float NOT NULL,
  `gmap` varchar(200) NOT NULL,
  `fn1` varchar(500) NOT NULL,
  `fn2` varchar(500) NOT NULL,
  `fn3` varchar(500) NOT NULL,
  `fn4` varchar(500) NOT NULL,
  `fn5` varchar(500) NOT NULL,
  PRIMARY KEY (`shopid`,`modelname`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `newproduct`
--

INSERT INTO `newproduct` (`id`, `shopid`, `cname`, `brand`, `modelname`, `specs`, `price`, `discount`, `oprice`, `gmap`, `fn1`, `fn2`, `fn3`, `fn4`, `fn5`) VALUES
(3, 'vasanth@gmail.com', 'Washing Machine', 'Samsung', 'EasyWash 7W', 'Top Load, 8 Kg', 12500, '2', 12250, 'https://maps.app.goo.gl/RsWTuJcH6y5Zfp519', '1700214407images3.jpg', '1700214407images2.jpg', '1700214407images3.jpg', '1700214407images3.jpg', ''),
(4, 'vasanth@gmail.com', 'Television', 'Samsung', 'MV135', '32Inch LED, Smart Television', 28500, '2', 27930, 'https://maps.app.goo.gl/RsWTuJcH6y5Zfp519', '1700285495images8.jpg', '1700285495images1.jpg', '1700285495images6.jpg', '1700285495images7.jpg', '1700285495images9.jpg'),
(2, 'vasanth@gmail.com', 'Mobile', 'Nokia', 'N1', '4GB RAM, 2MP Camera', 25000, '5', 23750, 'https://maps.app.goo.gl/RsWTuJcH6y5Zfp519', '17002142741_Nokia_2330_pbilogo.jpg', '17002142741_Nokia_2323_pbilogo.jpg', '17002142741_Nokia_2700_pbilogo.jpg', '17002142741_nokia_5130_pbilogo.jpg', '17002142741_Nokia_E75_pbilogo.jpg'),
(5, 'viveks@gmail.com', 'Television', 'Sony', 'Bravia15T', '32-Inch LED, Smart Television, Woofer', 32500, '1', 32175, 'https://maps.app.goo.gl/RsWTuJcH6y5Zfp519', '1700285678images11.jpg', '1700285678images9.jpg', '1700285678images1.jpg', '1700285678images7.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `newuser`
--

CREATE TABLE IF NOT EXISTS `newuser` (
  `name` varchar(100) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `aname` varchar(50) NOT NULL,
  `city` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `pwd` varchar(40) NOT NULL,
  `utype` varchar(20) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newuser`
--

INSERT INTO `newuser` (`name`, `addr`, `aname`, `city`, `mobile`, `userid`, `pwd`, `utype`) VALUES
('Kamal', '44, Greams Road,', 'Nungambakkam', 'Chennai', '8923950932', 'kamal@gmail.com', 'k', 'user'),
('Kumar', '343,South Car Street,', 'KK Nagar', 'Madurai', '9823948329', 'kumar@gmail.com', 'k', 'user'),
('Ram', '54,Greames Road,', 'Adayar', 'Chennai', '9238492849', 'ram@gmail.com', 'r', 'seller'),
('Samuel', '324,AA Road,', 'Aarapalayam', 'Madurai', '8823492384', 'sam@gmail.com', 's', 'seller'),
('Vasanth & Co.,', '343, South Masi Street,', 'South Gate', 'Madurai', '8283493289', 'vasanth@gmail.com', 'v', 'shop'),
('Viveks Electronics', '898, West Masi Street,', 'Nethaji Road', 'Madurai', '8889034292', 'viveks@gmail.com', 'v', 'shop');

-- --------------------------------------------------------

--
-- Table structure for table `ninterest`
--

CREATE TABLE IF NOT EXISTS `ninterest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date NOT NULL,
  `userid` varchar(200) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`dt`,`userid`,`pid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ninterest`
--

INSERT INTO `ninterest` (`id`, `dt`, `userid`, `pid`) VALUES
(7, '2023-11-18', 'kumar@gmail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ointerest`
--

CREATE TABLE IF NOT EXISTS `ointerest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date NOT NULL,
  `userid` varchar(200) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`dt`,`userid`,`pid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ointerest`
--

INSERT INTO `ointerest` (`id`, `dt`, `userid`, `pid`) VALUES
(3, '2023-11-18', 'kumar@gmail.com', 2),
(5, '2023-11-21', 'kamal@gmail.com', 1),
(7, '2023-11-21', 'kamal@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oldproduct`
--

CREATE TABLE IF NOT EXISTS `oldproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellerid` varchar(100) NOT NULL,
  `cname` varchar(150) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `modelname` varchar(100) NOT NULL,
  `specs` varchar(500) NOT NULL,
  `price` float NOT NULL,
  `discount` varchar(10) NOT NULL,
  `yr` int(11) NOT NULL,
  `oprice` float NOT NULL,
  `gmap` varchar(200) NOT NULL,
  `fn1` varchar(500) NOT NULL,
  `fn2` varchar(500) NOT NULL,
  `fn3` varchar(500) NOT NULL,
  `fn4` varchar(500) NOT NULL,
  `fn5` varchar(500) NOT NULL,
  PRIMARY KEY (`sellerid`,`modelname`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oldproduct`
--

INSERT INTO `oldproduct` (`id`, `sellerid`, `cname`, `brand`, `modelname`, `specs`, `price`, `discount`, `yr`, `oprice`, `gmap`, `fn1`, `fn2`, `fn3`, `fn4`, `fn5`) VALUES
(1, 'ram@gmail.com', 'Mobile', 'Nokia', 'N1', '2MP Camera, 4GB RAM', 22500, '50', 2021, 11250, 'https://maps.app.goo.gl/SgX6ZyFt8PTBHgHX9', '17002168611_Sony_Ericsson_C510_1_pbilogo.jpg', '17002168611_nokia_5130_pbilogo.jpg', '17002168611_Nokia_2700_pbilogo.jpg', '17002168611_Nokia_2323_pbilogo.jpg', '17002168611_Sony_Ericsson_Yari_pbilogo.jpg'),
(3, 'ram@gmail.com', 'Television', 'Samsung', 'Smart X78', '32 Inch LED, With Twin Ports, Internet', 104350, '50', 2022, 52175, 'https://maps.app.goo.gl/RsWTuJcH6y5Zfp519', '17005463671.jpg', '17005463672.jpg', '17005463673.jpg', '17005463674.jpg', '17005463675.jpg'),
(2, 'sam@gmail.com', 'Mobile', 'Nokia', 'N8', '2MP Camera, 4GB RAM', 25000, '45', 2020, 13750, 'https://maps.app.goo.gl/4ZTpNXkxxTuWFkNk8', '17003014101_Nokia_N97_mini_pbilogo.jpg', '17003014101_Nokia_N97_pbilogo.jpg', '17003014101_sew595_pbilogo.jpg', '17003014101_Nokia-5230-black_pbilogo.jpg', '17003014101_Nokia_5800a_pbilogo.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
