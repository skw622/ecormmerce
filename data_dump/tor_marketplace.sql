-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 25, 2019 at 03:41 PM
-- Server version: 5.6.33-0ubuntu0.14.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tor_marketplace`
--
CREATE DATABASE IF NOT EXISTS `tor_marketplace` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tor_marketplace`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
CREATE TABLE IF NOT EXISTS `accounts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `username` varchar(120) NOT NULL,
  `code_bip39` longtext,
  `pgp_key` longtext,
  `image` varchar(100) NOT NULL,
  `level` varchar(120) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_vendor` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_tfalogin` tinyint(1) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `username`, `code_bip39`, `pgp_key`, `image`, `level`, `is_admin`, `is_staff`, `is_vendor`, `is_active`, `created_at`, `updated_at`, `is_tfalogin`, `country`) VALUES
(1, 'pbkdf2_sha256$150000$gAsXwhffgkhp$EnOatijh8yL+9o/883SuzMlR3Pr7N7Nge2vwxTgVzVA=', '2019-06-25 11:44:51.851868', 'admin', '', 'hi it''s me', '', 'member', 1, 1, 1, 1, '2019-01-29 00:00:00.000000', '2019-04-19 00:00:00.000000', 0, NULL),
(2, 'pbkdf2_sha256$120000$ABAF6fPiH4dW$zaKoAMROaXrNHZz5xj5L8nCQIfdLvu5tmEs3P1jiuvs=', '2019-02-01 00:00:00.000000', 'king', '', '', '', 'member', 0, 0, 0, 1, '2019-01-31 00:00:00.000000', '2019-01-31 00:00:00.000000', 0, NULL),
(3, 'pbkdf2_sha256$120000$oeT4JGNnMTit$q6rCsye7LkeDA3Wm2fTM+OiQ9pXloxkWYBNjcSWwIzQ=', '2019-02-03 00:00:00.000000', 'Tester', '', '', '', 'member', 0, 0, 1, 1, '2019-02-02 00:00:00.000000', '2019-02-03 00:00:00.000000', 0, NULL),
(4, 'pbkdf2_sha256$120000$VyepjMamsYpi$E0Rmu7Z39wvm3A7J0M4bUKXOmH8wGpZ7LmLXcNxI3go=', '2019-03-06 00:00:00.000000', 'simba', '', '-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: BCPG C# v1.6.1.0\r\n\r\nmQENBFx1STEBCACgpeMQ46WN9fYOEmC+/KkEfISQYY7jPRnRSufaVnN0XZUMBpxG\r\ntguJGXDiNAboFZpnQUGYnZSJNrFz89kXfTRUTf4ooGETDanMRkmZEKOisA+rqEfj\r\nhbwJOI4VDXYrnMU+0lULyOEVdFozGP9GUzD+irYqOQqZwih+CEPEk5vGaDP8n1em\r\nJYpbCJgCdnn22fAuMT/DCGz3O2A5ACReWcoj2kKizhLdHq/o0jJX+cXf4ECfQGTb\r\n/pwr+IXY28zHYG4MInySb45Z8JM75VdJaO+hxCVWQ4tqdMxnzLp2C1CRZRAUAwQg\r\n9DTOcFnvbBaKl/IDPa25pa77c4oHdDcbjU5VABEBAAG0EnhkZXY0NDIwQGdtYWls\r\nLmNvbYkBHAQQAQIABgUCXHVJMQAKCRBo3QnCCC2C+ik0B/0ZaDHMkNdq1toqSi8l\r\nUVfZsz9VgjzQU3a4aSR/zl3/B8fIgEBTaZNJmx1KZnSr4bZQsjw7tA1XzAgRwgHc\r\nj3/Xe4thELHxbExdeI8WqnkufKVknrSjXGOaSdFh6JGafPRyNjCNqpl/o9avtvs7\r\ncqSxD/2gxSuwq6+uVPWifSxY91YE9zCnAmH9vxqakzFiX7OsqbzXXDhAFYjYJnx5\r\nJ91DpnahaC2WU/pd72saKmi8+Lz5hmxjT6FZdgxLgRZsMZ61PB7RLY5AJhYv8Fue\r\nfsQtCXW/65KUiqpolaJuqJkppQ/04n3NqdOgBBJh0Nk70qSV/RUa+xUObVhJ4Iit\r\nJN3P\r\n=QWgj\r\n-----END PGP PUBLIC KEY BLOCK-----', '', 'Member', 1, 1, 1, 1, '2019-02-25 00:00:00.000000', '2019-03-06 00:00:00.000000', 1, NULL),
(5, 'pbkdf2_sha256$120000$2MNg7dM7qB5a$o98XLmvWPxHw/WyFjbZVmRIdTWXUTZy+RmyW0M7qkRk=', '2019-03-06 00:00:00.000000', 'test', '', '', '', 'Member', 0, 0, 0, 1, '2019-03-01 00:00:00.000000', '2019-03-01 00:00:00.000000', 0, NULL),
(6, 'pbkdf2_sha256$120000$xUnacsQLMqpD$Fx/fu5tozKF+pTgNHgyf9Dzg1/Zc9e1GkGhBSw/eMCQ=', '2019-03-10 00:00:00.000000', 'alexnum', '', '', '', 'Member', 0, 0, 0, 1, '2019-03-10 00:00:00.000000', '2019-03-10 00:00:00.000000', 0, NULL),
(7, 'pbkdf2_sha256$120000$ooukXRE8w1PH$zoPTo8EjRLTpN36p935on1zoZljm1mK0Pm60FAIFBGQ=', '2019-03-17 00:00:00.000000', 'leadermalang', '', '', '', 'Member', 0, 0, 0, 1, '2019-03-17 00:00:00.000000', '2019-03-17 00:00:00.000000', 0, NULL),
(8, 'pbkdf2_sha256$120000$sqbtb5LNyHQK$5Y2VgFUbrFl5S8AAL3unDLMMTy/a8pVq2XcPLflcpSY=', '2019-04-08 00:00:00.000000', 'test1', '', '', '', 'Member', 0, 0, 0, 1, '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', 0, NULL),
(9, 'pbkdf2_sha256$120000$pDZ4vbbJXLqq$sbgIhS8M3XdA84M60cb+C0wIEQ7LjL0jmFnGLYM2PNk=', '2019-04-19 00:00:00.000000', 'saadelkheety', '', 'test2', '', 'Member', 0, 0, 0, 1, '2019-04-19 00:00:00.000000', '2019-04-19 00:00:00.000000', 0, NULL),
(10, 'pbkdf2_sha256$120000$ChWNa4Brch0N$xIeBbD4KFosao2ob4hWkCbxsKMJYgbqM0ZUup9o7cO0=', '2019-04-21 00:00:00.000000', 'huylee', '', '', '', 'Admin', 1, 1, 1, 1, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', 0, NULL),
(11, 'pbkdf2_sha256$120000$CAWnMSpaQPm5$2RVzebTW+dFWYaig7MbqRIqNv+VbjqcNF1wp9ZaRMCg=', '2019-04-21 00:00:00.000000', 'ldh', '', '', '', 'Member', 0, 0, 0, 1, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', 0, NULL),
(12, 'pbkdf2_sha256$120000$QEz1gY5VHIIs$rXSU1zIVQce/AVWGYqPxLauR2fuYb5PNY0+OL1z6SdM=', '2019-04-21 00:00:00.000000', 'demo', 'velvet behind observe ability mesh drastic afford bag', '', '', 'Member', 0, 0, 0, 1, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', 0, NULL),
(13, 'pbkdf2_sha256$120000$FeME6NhZddt5$Ln7bBA4bMThyqavycKjGq4QeBw3xxfb+82i731hxfrk=', '2019-04-21 00:00:00.000000', 'ldh1', 'advance message shoe claw van income elbow idea', '', '', 'Member', 0, 0, 0, 1, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', 0, NULL),
(14, 'pbkdf2_sha256$120000$DC4nSUKcOdEF$KO0rDqQUuSHsX1oD9Gr6fd7ewZUiSij9gvZ9fu8AVow=', '2019-04-21 00:00:00.000000', 'ldh2', 'banana lonely enrich nest want write never drum', '', '', 'Member', 0, 0, 0, 1, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', 0, NULL),
(15, 'pbkdf2_sha256$120000$pIolIZSEoUxB$3PYtyCFlfEPNdG6EK9a231w6x5wLCIYTNDQXFwBVJmA=', '2019-04-21 00:00:00.000000', 'test3', 'service panel use river miss evil speak awkward', '', '', 'Member', 0, 0, 0, 1, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', 0, NULL),
(16, 'pbkdf2_sha256$120000$EG7mDSDeLCqW$DmsngdhV5unSbCMa4f1HesNSGt/fS/5nRZVo/gX6WZY=', '2019-04-21 00:00:00.000000', 'test4', 'tomato loan ball depend conduct subject purse orchard', '', '', 'Member', 0, 0, 0, 1, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', 0, NULL),
(17, 'pbkdf2_sha256$120000$KYZ3kgh94sg9$cEUV2/UfjRnHW1jyz0udHSJzznXuUHrfeVUlfeShTqQ=', '2019-04-24 00:00:00.000000', 'wayne4989', 'horn curious soon desert cruise drill van cloud', '', '', 'Member', 0, 0, 0, 1, '2019-04-22 00:00:00.000000', '2019-04-22 00:00:00.000000', 0, NULL),
(18, 'pbkdf2_sha256$120000$GCJl7WN1KgSb$DiVGB7O5PTEjh8oLNHmuUKznjh35rvqsdom1dpuAhhY=', '2019-04-26 00:00:00.000000', 'white', 'puzzle burden answer test duck popular divert copy', '', '', 'Member', 0, 0, 0, 1, '2019-04-25 00:00:00.000000', '2019-04-25 00:00:00.000000', 0, NULL),
(19, 'pbkdf2_sha256$120000$EMbdMTZ1DR1U$7KZRJfQLDNzwWt2S6Kfv3G7kAmDaxIj9ZqhrdDHJCDI=', '2019-04-28 00:00:00.000000', 'hello123', 'denial meat stuff human concert kiwi tornado humor', '', '', 'Member', 0, 0, 0, 1, '2019-04-27 00:00:00.000000', '2019-04-27 00:00:00.000000', 0, NULL),
(20, 'pbkdf2_sha256$150000$h7tEV6Iil6L9$gMDsKTG+s1MwcZPNV4Fx2m1MPYBLmo30Sl/Kc9Nm6zo=', '2019-06-17 18:15:11.000000', 'testing', NULL, NULL, '', 'Member', 1, 1, 0, 1, '2019-04-27 00:00:00.000000', '2019-04-27 00:00:00.000000', 0, NULL),
(21, 'pbkdf2_sha256$150000$QWtfgEXD93IM$gIPLAqELlbDvlU+bgTpicKp0gYD1feATiLq3XDhEJvs=', '2019-06-25 19:07:35.642148', 'luis1235711', 'scare fade ceiling letter rabbit daughter useless shell', NULL, '', 'Member', 0, 0, 0, 1, '2019-06-25 19:07:35.173337', '2019-06-25 19:07:35.173395', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_vendorfavorite`
--

DROP TABLE IF EXISTS `accounts_vendorfavorite`;
CREATE TABLE IF NOT EXISTS `accounts_vendorfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_vendorfavorite_user_id_8c4869fe_fk_accounts_user_id` (`user_id`),
  KEY `accounts_vendorfavorite_vendor_id_074ad68d_fk_accounts_user_id` (`vendor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `accounts_vendorfavorite`
--

INSERT INTO `accounts_vendorfavorite` (`id`, `user_id`, `vendor_id`) VALUES
(15, 18, 4),
(16, 19, 4);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_vendorterm`
--

DROP TABLE IF EXISTS `accounts_vendorterm`;
CREATE TABLE IF NOT EXISTS `accounts_vendorterm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `userId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_vendorterm_userId_id_66337cd0_fk_accounts_user_id` (`userId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `accounts_vendorterm`
--

INSERT INTO `accounts_vendorterm` (`id`, `description`, `userId_id`) VALUES
(6, 'test', 1),
(7, 'vvvv', 2),
(8, 'ccc', 3),
(9, '4444', 4),
(10, '5555', 5),
(11, '666', 6),
(12, '777', 7),
(13, '888', 8),
(14, '999', 9),
(15, '10', 10),
(16, '11', 11);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add task result', 6, 'add_taskresult'),
(22, 'Can change task result', 6, 'change_taskresult'),
(23, 'Can delete task result', 6, 'delete_taskresult'),
(24, 'Can view task result', 6, 'view_taskresult'),
(25, 'Can add captcha store', 7, 'add_captchastore'),
(26, 'Can change captcha store', 7, 'change_captchastore'),
(27, 'Can delete captcha store', 7, 'delete_captchastore'),
(28, 'Can view captcha store', 7, 'view_captchastore'),
(29, 'Can add rating', 8, 'add_rating'),
(30, 'Can change rating', 8, 'change_rating'),
(31, 'Can delete rating', 8, 'delete_rating'),
(32, 'Can view rating', 8, 'view_rating'),
(33, 'Can add user rating', 9, 'add_userrating'),
(34, 'Can change user rating', 9, 'change_userrating'),
(35, 'Can delete user rating', 9, 'delete_userrating'),
(36, 'Can view user rating', 9, 'view_userrating'),
(37, 'Can add user', 10, 'add_user'),
(38, 'Can change user', 10, 'change_user'),
(39, 'Can delete user', 10, 'delete_user'),
(40, 'Can view user', 10, 'view_user'),
(41, 'Can add vendor term', 11, 'add_vendorterm'),
(42, 'Can change vendor term', 11, 'change_vendorterm'),
(43, 'Can delete vendor term', 11, 'delete_vendorterm'),
(44, 'Can view vendor term', 11, 'view_vendorterm'),
(45, 'Can add vendor favorite', 12, 'add_vendorfavorite'),
(46, 'Can change vendor favorite', 12, 'change_vendorfavorite'),
(47, 'Can delete vendor favorite', 12, 'delete_vendorfavorite'),
(48, 'Can view vendor favorite', 12, 'view_vendorfavorite'),
(49, 'Can add btc price', 13, 'add_btcprice'),
(50, 'Can change btc price', 13, 'change_btcprice'),
(51, 'Can delete btc price', 13, 'delete_btcprice'),
(52, 'Can view btc price', 13, 'view_btcprice'),
(53, 'Can add category', 14, 'add_category'),
(54, 'Can change category', 14, 'change_category'),
(55, 'Can delete category', 14, 'delete_category'),
(56, 'Can view category', 14, 'view_category'),
(57, 'Can add message', 15, 'add_message'),
(58, 'Can change message', 15, 'change_message'),
(59, 'Can delete message', 15, 'delete_message'),
(60, 'Can view message', 15, 'view_message'),
(61, 'Can add product', 16, 'add_product'),
(62, 'Can change product', 16, 'change_product'),
(63, 'Can delete product', 16, 'delete_product'),
(64, 'Can view product', 16, 'view_product'),
(65, 'Can add order', 17, 'add_order'),
(66, 'Can change order', 17, 'change_order'),
(67, 'Can delete order', 17, 'delete_order'),
(68, 'Can view order', 17, 'view_order'),
(69, 'Can add pay', 18, 'add_pay'),
(70, 'Can change pay', 18, 'change_pay'),
(71, 'Can delete pay', 18, 'delete_pay'),
(72, 'Can view pay', 18, 'view_pay'),
(73, 'Can add order item', 19, 'add_orderitem'),
(74, 'Can change order item', 19, 'change_orderitem'),
(75, 'Can delete order item', 19, 'delete_orderitem'),
(76, 'Can view order item', 19, 'view_orderitem'),
(77, 'Can add chat', 20, 'add_chat'),
(78, 'Can change chat', 20, 'change_chat'),
(79, 'Can delete chat', 20, 'delete_chat'),
(80, 'Can view chat', 20, 'view_chat'),
(81, 'Can add ticket', 21, 'add_ticket'),
(82, 'Can change ticket', 21, 'change_ticket'),
(83, 'Can delete ticket', 21, 'delete_ticket'),
(84, 'Can view ticket', 21, 'view_ticket'),
(85, 'Can add ticket replay', 22, 'add_ticketreplay'),
(86, 'Can change ticket replay', 22, 'change_ticketreplay'),
(87, 'Can delete ticket replay', 22, 'delete_ticketreplay'),
(88, 'Can view ticket replay', 22, 'view_ticketreplay'),
(89, 'Can add chat message', 23, 'add_chatmessage'),
(90, 'Can change chat message', 23, 'change_chatmessage'),
(91, 'Can delete chat message', 23, 'delete_chatmessage'),
(92, 'Can view chat message', 23, 'view_chatmessage'),
(93, 'Can add shipping type', 24, 'add_shippingtype'),
(94, 'Can change shipping type', 24, 'change_shippingtype'),
(95, 'Can delete shipping type', 24, 'delete_shippingtype'),
(96, 'Can view shipping type', 24, 'view_shippingtype'),
(97, 'Can add shipping option', 25, 'add_shippingoption'),
(98, 'Can change shipping option', 25, 'change_shippingoption'),
(99, 'Can delete shipping option', 25, 'delete_shippingoption'),
(100, 'Can view shipping option', 25, 'view_shippingoption');

-- --------------------------------------------------------

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE IF NOT EXISTS `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `captcha_captchastore`
--

INSERT INTO `captcha_captchastore` (`id`, `challenge`, `response`, `hashkey`, `expiration`) VALUES
(1, 'UKMX', 'ukmx', 'e283a5eb15cc93fff6cfccb15b2c5cbcdc885144', '2019-06-25 19:11:37.991307'),
(2, 'XZMZ', 'xzmz', '7c2719f7bbbf3a7ed30676ae04c1b96a7c22fa91', '2019-06-25 19:11:38.075401'),
(3, 'GWQW', 'gwqw', '0a1b96268b85cbf7ad35e9525ab19fe10b844c37', '2019-06-25 19:11:41.323766');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
CREATE TABLE IF NOT EXISTS `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_hidden_cd77412f` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'accounts', 'user'),
(12, 'accounts', 'vendorfavorite'),
(11, 'accounts', 'vendorterm'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(7, 'captcha', 'captchastore'),
(4, 'contenttypes', 'contenttype'),
(6, 'django_celery_results', 'taskresult'),
(13, 'main', 'btcprice'),
(14, 'main', 'category'),
(15, 'main', 'message'),
(16, 'main', 'product'),
(17, 'orders', 'order'),
(19, 'orders', 'orderitem'),
(18, 'orders', 'pay'),
(5, 'sessions', 'session'),
(8, 'star_ratings', 'rating'),
(9, 'star_ratings', 'userrating'),
(20, 'support', 'chat'),
(23, 'support', 'chatmessage'),
(21, 'support', 'ticket'),
(22, 'support', 'ticketreplay'),
(25, 'vendorpanel', 'shippingoption'),
(24, 'vendorpanel', 'shippingtype');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2019-06-25 08:26:42.595995'),
(2, 'contenttypes', '0001_initial', '2019-06-25 08:26:45.022002'),
(3, 'admin', '0001_initial', '2019-06-25 08:26:45.372527'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-06-25 08:26:46.854056'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-06-25 08:26:46.908422'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-06-25 08:26:47.872725'),
(7, 'auth', '0001_initial', '2019-06-25 08:26:48.787022'),
(8, 'auth', '0002_alter_permission_name_max_length', '2019-06-25 08:26:52.136060'),
(9, 'auth', '0003_alter_user_email_max_length', '2019-06-25 08:26:52.178360'),
(10, 'auth', '0004_alter_user_username_opts', '2019-06-25 08:26:52.223482'),
(11, 'auth', '0005_alter_user_last_login_null', '2019-06-25 08:26:52.268489'),
(12, 'auth', '0006_require_contenttypes_0002', '2019-06-25 08:26:52.303491'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2019-06-25 08:26:52.346727'),
(14, 'auth', '0008_alter_user_username_max_length', '2019-06-25 08:26:52.393400'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2019-06-25 08:26:52.449890'),
(16, 'auth', '0010_alter_group_name_max_length', '2019-06-25 08:26:53.174714'),
(17, 'auth', '0011_update_proxy_permissions', '2019-06-25 08:26:53.238497'),
(18, 'captcha', '0001_initial', '2019-06-25 08:26:53.582657'),
(19, 'django_celery_results', '0001_initial', '2019-06-25 08:26:53.933333'),
(20, 'django_celery_results', '0002_add_task_name_args_kwargs', '2019-06-25 08:26:55.603574'),
(21, 'django_celery_results', '0003_auto_20181106_1101', '2019-06-25 08:26:55.641557'),
(22, 'main', '0001_initial', '2019-06-25 08:26:56.873590'),
(23, 'orders', '0001_initial', '2019-06-25 08:27:02.738968'),
(24, 'sessions', '0001_initial', '2019-06-25 08:27:06.542493'),
(25, 'star_ratings', '0001_initial', '2019-06-25 08:27:08.039286'),
(26, 'star_ratings', '0002_auto_20160608_1119', '2019-06-25 08:27:12.467069'),
(27, 'star_ratings', '0003_auto_20160721_1127', '2019-06-25 08:27:12.924438'),
(28, 'support', '0001_initial', '2019-06-25 08:27:14.273819'),
(29, 'vendorpanel', '0001_initial', '2019-06-25 08:27:18.901303');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('xn2i9005hpdasaxmd21nelqypcwbafwt', 'NDQzYTg5OTNiNDRjZmUzNDRkNTEyZDcyMDMxNDdmMzc0MGU0ZTEwODp7ImNhcnQiOnt9LCJfYXV0aF91c2VyX2lkIjoiMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjgyMTQ1ODJhODNjM2IyNTAzMzYyMmMwOGRiN2Y0ZmYwOGFmZDcyNTMifQ==', '2019-07-09 19:07:35.889389');

-- --------------------------------------------------------

--
-- Table structure for table `main_btcprice`
--

DROP TABLE IF EXISTS `main_btcprice`;
CREATE TABLE IF NOT EXISTS `main_btcprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `btcgbp` double NOT NULL,
  `btcusd` double NOT NULL,
  `btceur` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `main_category`
--

DROP TABLE IF EXISTS `main_category`;
CREATE TABLE IF NOT EXISTS `main_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `main_category_name_eb0f0831` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `main_category`
--

INSERT INTO `main_category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(4, 'onionshop', 'onionshop', '2019-01-12 00:00:00.000000', '2019-01-12 00:00:00.000000'),
(5, 'category 1', 'category_1', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000'),
(6, 'category 2', 'category_2', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000'),
(7, 'category 3', 'category_3', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `main_message`
--

DROP TABLE IF EXISTS `main_message`;
CREATE TABLE IF NOT EXISTS `main_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `check` tinyint(1) NOT NULL,
  `sender_removed` tinyint(1) NOT NULL,
  `receiver_removed` tinyint(1) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_message_receiver_id_27da35a6_fk_accounts_user_id` (`receiver_id`),
  KEY `main_message_sender_id_37f0c886_fk_accounts_user_id` (`sender_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `main_message`
--

INSERT INTO `main_message` (`id`, `content`, `created_at`, `updated_at`, `check`, `sender_removed`, `receiver_removed`, `receiver_id`, `sender_id`) VALUES
(2, 'test message', '2019-04-09 00:00:00.000000', '2019-04-09 00:00:00.000000', 0, 0, 0, 1, 2),
(3, 'test message', '2019-04-09 00:00:00.000000', '2019-04-09 00:00:00.000000', 0, 0, 0, 3, 1),
(5, 'Your payment are confirmed. Thank you.', '2019-04-09 00:00:00.000000', '2019-04-09 00:00:00.000000', 0, 0, 0, 1, 1),
(6, 'Your payment are confirmed. Thank you.', '2019-04-09 00:00:00.000000', '2019-04-09 00:00:00.000000', 0, 0, 0, 1, 1),
(19, 'Sorry but your shopping cart are canceled by vendor. Please send BTC refund address to Site manager.', '2019-04-10 00:00:00.000000', '2019-04-10 00:00:00.000000', 0, 0, 0, 1, 1),
(20, 'Sorry but your shopping cart are canceled by vendor. Please send BTC refund address to Site manager.', '2019-04-10 00:00:00.000000', '2019-04-10 00:00:00.000000', 0, 0, 0, 1, 1),
(21, 'Sorry but your shopping cart are canceled by vendor. Please send BTC refund address to Site manager.', '2019-04-10 00:00:00.000000', '2019-04-10 00:00:00.000000', 0, 0, 0, 1, 1),
(22, 'Your payment are confirmed. Thank you.', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', 0, 0, 0, 1, 1),
(23, 'Your payment are confirmed. Thank you.', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', 0, 0, 0, 1, 1),
(24, 'Your payment are confirmed. Thank you.', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', 0, 0, 0, 1, 1),
(25, 'Order are completed by customer.', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', 0, 0, 0, 1, 1),
(26, 'Customer require order to dispute. To dispute order can be approved by the staff. Please contact with staff.', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', 0, 0, 0, 1, 1),
(27, 'Your shipping product are deleted by vendor so your shipping are cancelled. Please contact staff for refunding your payment.', '2019-04-16 00:00:00.000000', '2019-04-16 00:00:00.000000', 0, 1, 0, 1, 1),
(28, 'Hi Hello', '2019-04-28 00:00:00.000000', '2019-04-28 00:00:00.000000', 0, 1, 1, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `main_product`
--

DROP TABLE IF EXISTS `main_product`;
CREATE TABLE IF NOT EXISTS `main_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `productOwnerID_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_product_category_id_c0d90f41_fk_main_category_id` (`category_id`),
  KEY `main_product_productOwnerID_id_f7f78d50_fk_accounts_user_id` (`productOwnerID_id`),
  KEY `main_product_name_1d18c288` (`name`),
  KEY `main_product_slug_85058272` (`slug`),
  KEY `main_product_id_slug_c7e6db1c_idx` (`id`,`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `main_product`
--

INSERT INTO `main_product` (`id`, `name`, `slug`, `description`, `price`, `available`, `stock`, `created_at`, `updated_at`, `image`, `country`, `category_id`, `productOwnerID_id`) VALUES
(2, 'tor shop', 'onionshop', ' this is test product by vendor', 1.00, 1, 761, '2019-01-12 00:00:00.000000', '2019-01-13 00:00:00.000000', 'products/2019/01/12/Download.jpeg', '', 4, 1),
(3, 'Test Product by vendor', 'testVendorProduct', 'This is a test product by vendor.', 1.00, 1, 90, '2019-03-18 00:00:00.000000', '2019-03-18 00:00:00.000000', '', '', 4, 1),
(4, 'Test Product by vendor', 'testVendorProduct', 'This is a test product by vendor.', 2.00, 1, 77, '2019-03-18 00:00:00.000000', '2019-03-18 00:00:00.000000', 'products/2019/01/12/Download.jpeg', '', 4, 4),
(5, 'Test Product by vendor', 'testVendorProduct', 'This is a test product by vendor.', 2.00, 1, 100, '2019-03-18 00:00:00.000000', '2019-03-18 00:00:00.000000', 'products/2019/01/12/Download.jpeg', '', 4, 4),
(6, 'PRODUCT-2 REVENUE', 'testVendorProduct', 'wow its raining out side', 3.00, 1, 45, '2019-03-18 00:00:00.000000', '2019-03-18 00:00:00.000000', 'products/2019/01/12/Download.jpeg', '', 5, 4),
(7, 'test product1', 'testVendorProduct', 'test product1\r\nexample', 222.00, 0, 100, '2019-04-12 00:00:00.000000', '2019-04-12 00:00:00.000000', '', 'AT', 5, 1),
(8, 'test product1', 'test-product-1', 'test product for updating function', 3.00, 1, 57, '2019-04-12 00:00:00.000000', '2019-04-12 00:00:00.000000', '', 'AU', 5, 1),
(9, 'test product1', 'test-product-1', 'test product1 for slug', 1.00, 0, 50, '2019-04-16 00:00:00.000000', '2019-04-16 00:00:00.000000', '', 'AU', 5, 1),
(10, 'test product1', 'test-product-1', 'test product1 for slug', 1.00, 0, 50, '2019-04-16 00:00:00.000000', '2019-04-16 00:00:00.000000', '', 'AU', 5, 1),
(11, 'huylee', 'Trf', '12312', 12.00, 1, 12, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', '', 'VN', 4, 1),
(12, 'Brunswick Sable Pharmacy', 'vv', 'vv', 66.00, 1, 994, '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', '', 'VN', 6, 1),
(14, 'DrugMilk123123', 'Test', 'DrugMilkDrugMilkDrugMilkDrugMilk', 2.00, 1, 100, '2019-04-28 00:00:00.000000', '2019-04-28 00:00:00.000000', '', 'AF', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
CREATE TABLE IF NOT EXISTS `orders_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `paid` varchar(5) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_payment_id_46928ccc_fk_orders_pay_id` (`payment_id`),
  KEY `orders_order_user_id_e9b59eb1_fk_accounts_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `orders_order`
--

INSERT INTO `orders_order` (`id`, `address`, `created_at`, `updated_at`, `paid`, `payment_id`, `user_id`) VALUES
(1, '45467', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000', '0', NULL, 3),
(2, '45467', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000', '0', NULL, 3),
(3, 'mefl,fl,l,lv\r\n\r\nkw dvvmkfkfkfvk f  kf ', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000', '0', NULL, 1),
(4, '-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: BCPG C# v1.6.1.0\r\n\r\nmQENBFw6VtgBCACaOvXdw5zXNiEkSRu0bO0Pi0NP8R+ME0CcTAa4FCoelOfHJpvb\r\nLpcFVKFe4dIHyIXXYstBhoSARurrbQCGDRj1URz5If96E4TskzKtN0rT2kR+mot+\r\nRvzRC+a2RsPCIXJJj7eQrSt7E9XVHfy25DiXZ5uWfUTcXxPSIgqCBcvIYuGB5228\r\nFYG8Arm/xZUXJhXPpuKNGmU2sN1LFqXcGIkgDXtel2HLeZnrHZ3On8cd3svivGfK\r\nkd7GM0icrr9/UvjfyO3C22hzbOH/GiEnH5SmwBmu0o4lp87LIBVlEFw8nncNudW8\r\nb4uBPq0TP1znc8YYxw7G9MFn7Y3U+s+rrsl9ABEBAAG0AIkBHAQQAQIABgUCXDpW\r\n2AAKCRC2/XDym/8RCIxAB/9IBwosbYyq4fKiAX5cq+Z2il8gsAvQLD9PZFdr4gRa\r\ncsN5w5R4xRtDK1/GccYGD2GazrNU+UZYYB0emVPaaXL0O6p/pAsHw0UQwEjAbqpC\r\nOCc7kKTCOkuHoIyNQh+adVYaCOkbMzfES0RH1KoQOc4EH7wEq9cRUmYxWLd27bwC\r\n0IGdK3F9V/GLBfjw2EJoRhSkfDIHKCJY98Vpfz8JLFCBnO+7cl0wHiSeRH216sav\r\n2u0EkajJeJW0uU5t/D7OqK0oFqmH+bK9vTGLw7GtQs2PC1r/BHBKgrz/aYeO9jyT\r\nfFYNABWHgilV/MhFZSIcqg19fkO3H1LlL45WaipSggtX=nv9F\r\n\r\n-----END PGP PUBLIC KEY BLOCK-----', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000', '0', 1, 1),
(5, '5467', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000', '0', 2, 3),
(6, '-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: BCPG C# v1.6.1.0\r\n\r\nmQENBFw6VtgBCACaOvXdw5zXNiEkSRu0bO0Pi0NP8R+ME0CcTAa4FCoelOfHJpvb\r\nLpcFVKFe4dIHyIXXYstBhoSARurrbQCGDRj1URz5If96E4TskzKtN0rT2kR+mot+\r\nRvzRC+a2RsPCIXJJj7eQrSt7E9XVHfy25DiXZ5uWfUTcXxPSIgqCBcvIYuGB5228\r\nFYG8Arm/xZUXJhXPpuKNGmU2sN1LFqXcGIkgDXtel2HLeZnrHZ3On8cd3svivGfK\r\nkd7GM0icrr9/UvjfyO3C22hzbOH/GiEnH5SmwBmu0o4lp87LIBVlEFw8nncNudW8\r\nb4uBPq0TP1znc8YYxw7G9MFn7Y3U+s+rrsl9ABEBAAG0AIkBHAQQAQIABgUCXDpW\r\n2AAKCRC2/XDym/8RCIxAB/9IBwosbYyq4fKiAX5cq+Z2il8gsAvQLD9PZFdr4gRa\r\ncsN5w5R4xRtDK1/GccYGD2GazrNU+UZYYB0emVPaaXL0O6p/pAsHw0UQwEjAbqpC\r\nOCc7kKTCOkuHoIyNQh+adVYaCOkbMzfES0RH1KoQOc4EH7wEq9cRUmYxWLd27bwC\r\n0IGdK3F9V/GLBfjw2EJoRhSkfDIHKCJY98Vpfz8JLFCBnO+7cl0wHiSeRH216sav\r\n2u0EkajJeJW0uU5t/D7OqK0oFqmH+bK9vTGLw7GtQs2PC1r/BHBKgrz/aYeO9jyT\r\nfFYNABWHgilV/MhFZSIcqg19fkO3H1LlL45WaipSggtX=nv9F\r\n\r\n-----END PGP PUBLIC KEY BLOCK-----', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000', '0', 3, 1),
(7, '-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: BCPG C# v1.6.1.0\r\n\r\nmQENBFw6VtgBCACaOvXdw5zXNiEkSRu0bO0Pi0NP8R+ME0CcTAa4FCoelOfHJpvb\r\nLpcFVKFe4dIHyIXXYstBhoSARurrbQCGDRj1URz5If96E4TskzKtN0rT2kR+mot+\r\nRvzRC+a2RsPCIXJJj7eQrSt7E9XVHfy25DiXZ5uWfUTcXxPSIgqCBcvIYuGB5228\r\nFYG8Arm/xZUXJhXPpuKNGmU2sN1LFqXcGIkgDXtel2HLeZnrHZ3On8cd3svivGfK\r\nkd7GM0icrr9/UvjfyO3C22hzbOH/GiEnH5SmwBmu0o4lp87LIBVlEFw8nncNudW8\r\nb4uBPq0TP1znc8YYxw7G9MFn7Y3U+s+rrsl9ABEBAAG0AIkBHAQQAQIABgUCXDpW\r\n2AAKCRC2/XDym/8RCIxAB/9IBwosbYyq4fKiAX5cq+Z2il8gsAvQLD9PZFdr4gRa\r\ncsN5w5R4xRtDK1/GccYGD2GazrNU+UZYYB0emVPaaXL0O6p/pAsHw0UQwEjAbqpC\r\nOCc7kKTCOkuHoIyNQh+adVYaCOkbMzfES0RH1KoQOc4EH7wEq9cRUmYxWLd27bwC\r\n0IGdK3F9V/GLBfjw2EJoRhSkfDIHKCJY98Vpfz8JLFCBnO+7cl0wHiSeRH216sav\r\n2u0EkajJeJW0uU5t/D7OqK0oFqmH+bK9vTGLw7GtQs2PC1r/BHBKgrz/aYeO9jyT\r\nfFYNABWHgilV/MhFZSIcqg19fkO3H1LlL45WaipSggtX=nv9F\r\n\r\n-----END PGP PUBLIC KEY BLOCK-----', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000', '0', 4, 1),
(8, 'sas', '2019-02-03 00:00:00.000000', '2019-02-03 00:00:00.000000', '0', 5, 3),
(9, 'esdfgh,m', '2019-02-04 00:00:00.000000', '2019-02-04 00:00:00.000000', '0', NULL, 1),
(10, 'esdfgh,m', '2019-02-04 00:00:00.000000', '2019-02-04 00:00:00.000000', '0', NULL, 1),
(11, 'esdfgh,m', '2019-02-04 00:00:00.000000', '2019-02-04 00:00:00.000000', '0', 6, 1),
(12, 'hhhh\r\n', '2019-03-10 00:00:00.000000', '2019-03-10 00:00:00.000000', '0', 7, 1),
(13, 'fdgf', '2019-03-10 00:00:00.000000', '2019-03-10 00:00:00.000000', '0', 8, 1),
(14, 'Millat Town ', '2019-03-17 00:00:00.000000', '2019-03-17 00:00:00.000000', '0', NULL, 7),
(15, 'sgsgsadfsdfasdf', '2019-04-03 00:00:00.000000', '2019-04-03 00:00:00.000000', '0', NULL, 1),
(16, 'sgsgsadfsdfasdf', '2019-04-03 00:00:00.000000', '2019-04-03 00:00:00.000000', '0', NULL, 1),
(17, 'sgsgsadfsdfasdf', '2019-04-03 00:00:00.000000', '2019-04-03 00:00:00.000000', '0', NULL, 1),
(18, 'sgsgsadfsdfasdf', '2019-04-03 00:00:00.000000', '2019-04-03 00:00:00.000000', '0', NULL, 1),
(19, 'sgsgsadfsdfasdf', '2019-04-03 00:00:00.000000', '2019-04-03 00:00:00.000000', '0', 9, 1),
(20, 'fgsdfgfdfgsdfg\r\ngdsfgfd', '2019-04-04 00:00:00.000000', '2019-04-04 00:00:00.000000', '0', 10, 1),
(21, 'test address', '2019-04-04 00:00:00.000000', '2019-04-04 00:00:00.000000', '0', NULL, 1),
(22, 'test address', '2019-04-04 00:00:00.000000', '2019-04-04 00:00:00.000000', '0', NULL, 1),
(23, 'test address', '2019-04-05 00:00:00.000000', '2019-04-05 00:00:00.000000', '0', 11, 1),
(24, 'test address', '2019-04-05 00:00:00.000000', '2019-04-05 00:00:00.000000', '0', 12, 1),
(25, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(26, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(27, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(28, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(29, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(30, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(31, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(32, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(33, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', 13, 1),
(34, 'test address\r\n', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', 14, 1),
(35, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', 15, 1),
(36, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', 17, 1),
(37, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', 18, 1),
(38, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', 19, 1),
(39, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(40, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', NULL, 1),
(41, 'test address', '2019-04-08 00:00:00.000000', '2019-04-08 00:00:00.000000', '0', 20, 1),
(42, 'test address', '2019-04-09 00:00:00.000000', '2019-04-09 00:00:00.000000', '3', 21, 1),
(44, 'test address', '2019-04-09 00:00:00.000000', '2019-04-09 00:00:00.000000', '0', NULL, 1),
(50, 'test address', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', '0', NULL, 1),
(51, 'test address', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', '0', NULL, 1),
(52, 'test address', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', '8', 25, 1),
(53, 'test address', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', '1', 26, 1),
(54, 'test address', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', '5', 27, 1),
(55, 'test address', '2019-04-11 00:00:00.000000', '2019-04-11 00:00:00.000000', '7', 28, 1),
(56, 'delete test address', '2019-04-21 00:00:00.000000', '2019-04-21 00:00:00.000000', '3', 29, 1),
(57, 'Shenyang China', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(58, 'china', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(59, 'China', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(60, 'df', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(61, 'China', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(62, 'as', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(63, 'dd', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(64, 'as', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(65, 'as', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(66, 'as', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(67, 'as', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(68, 'as', '2019-04-23 00:00:00.000000', '2019-04-23 00:00:00.000000', '0', NULL, 17),
(69, 'aa', '2019-04-24 00:00:00.000000', '2019-04-24 00:00:00.000000', '1', 30, 17),
(70, 'Shenyang, China', '2019-04-24 00:00:00.000000', '2019-04-24 00:00:00.000000', '1', 31, 17),
(71, 'Shenyang, China', '2019-04-24 00:00:00.000000', '2019-04-24 00:00:00.000000', '0', NULL, 17),
(72, 'China', '2019-04-24 00:00:00.000000', '2019-04-24 00:00:00.000000', '1', 32, 17),
(73, 'Liaoning', '2019-04-24 00:00:00.000000', '2019-04-24 00:00:00.000000', '1', 33, 17),
(74, 'YuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuriYuri', '2019-04-26 00:00:00.000000', '2019-04-26 00:00:00.000000', '0', NULL, 18),
(75, 'asdfasdfasdf', '2019-04-26 00:00:00.000000', '2019-04-26 00:00:00.000000', '0', NULL, 18),
(76, '123123123123', '2019-04-26 00:00:00.000000', '2019-04-26 00:00:00.000000', '0', NULL, 18),
(77, 'kingkingking', '2019-04-26 00:00:00.000000', '2019-04-26 00:00:00.000000', '0', NULL, 18),
(78, 'gcvhbnm', '2019-04-26 00:00:00.000000', '2019-04-26 00:00:00.000000', '0', NULL, 18),
(84, 'upgrade_vendor__', '2019-04-28 00:00:00.000000', '2019-04-28 00:00:00.000000', '1', 50, 19);

-- --------------------------------------------------------

--
-- Table structure for table `orders_orderitem`
--

DROP TABLE IF EXISTS `orders_orderitem`;
CREATE TABLE IF NOT EXISTS `orders_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_author_id_fe3f122b_fk_accounts_user_id` (`author_id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  KEY `orders_orderitem_product_id_afe4254a_fk_main_product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `orders_orderitem`
--

INSERT INTO `orders_orderitem` (`id`, `price`, `quantity`, `author_id`, `order_id`, `product_id`) VALUES
(1, 2500.00, 6, 3, 1, 2),
(2, 2500.00, 6, 3, 2, 2),
(3, 2500.00, 1, 1, 4, 2),
(4, 2500.00, 6, 3, 5, 2),
(5, 2500.00, 1, 1, 7, 2),
(6, 2500.00, 1, 3, 8, 2),
(7, 2500.00, 1, 1, 9, 2),
(8, 2500.00, 1, 1, 10, 2),
(9, 2500.00, 1, 1, 11, 2),
(10, 2500.00, 1, 1, 12, 2),
(11, 2500.00, 2, 1, 13, 2),
(12, 2500.00, 1, 7, 14, 2),
(13, 100.00, 2, 1, 15, 4),
(14, 100.00, 1, 1, 15, 5),
(15, 990.00, 1, 1, 15, 6),
(16, 2500.00, 1, 1, 15, 2),
(17, 100.00, 4, 1, 15, 3),
(18, 100.00, 2, 1, 16, 4),
(19, 100.00, 1, 1, 16, 5),
(20, 990.00, 1, 1, 16, 6),
(21, 2500.00, 1, 1, 16, 2),
(22, 100.00, 4, 1, 16, 3),
(23, 100.00, 2, 1, 17, 4),
(24, 100.00, 1, 1, 17, 5),
(25, 990.00, 1, 1, 17, 6),
(26, 2500.00, 1, 1, 17, 2),
(27, 100.00, 4, 1, 17, 3),
(28, 100.00, 2, 1, 18, 4),
(29, 100.00, 1, 1, 18, 5),
(30, 990.00, 1, 1, 18, 6),
(31, 2500.00, 1, 1, 18, 2),
(32, 100.00, 4, 1, 18, 3),
(33, 100.00, 2, 1, 19, 4),
(34, 100.00, 1, 1, 19, 5),
(35, 990.00, 1, 1, 19, 6),
(36, 2500.00, 1, 1, 19, 2),
(37, 100.00, 4, 1, 19, 3),
(38, 100.00, 2, 1, 20, 4),
(39, 100.00, 3, 1, 21, 4),
(40, 100.00, 3, 1, 22, 4),
(41, 100.00, 3, 1, 23, 3),
(42, 100.00, 3, 1, 24, 4),
(43, 1.00, 1, 1, 25, 3),
(44, 1.00, 1, 1, 26, 3),
(45, 1.00, 1, 1, 27, 3),
(46, 1.00, 1, 1, 28, 3),
(47, 1.00, 1, 1, 29, 3),
(48, 1.00, 1, 1, 30, 3),
(49, 1.00, 1, 1, 31, 3),
(50, 1.00, 1, 1, 32, 3),
(51, 1.00, 1, 1, 33, 3),
(52, 1.00, 1, 1, 34, 3),
(53, 2.00, 1, 1, 35, 4),
(54, 2.00, 1, 1, 36, 4),
(55, 1.00, 1, 1, 38, 3),
(56, 3.00, 5, 1, 39, 6),
(57, 3.00, 5, 1, 40, 6),
(58, 3.00, 5, 1, 41, 6),
(59, 1.00, 1, 1, 42, 3),
(65, 1.00, 5, 1, 50, 2),
(66, 1.00, 5, 1, 51, 2),
(67, 1.00, 5, 1, 52, 2),
(68, 2.00, 7, 1, 53, 4),
(69, 1.00, 1, 1, 54, 3),
(70, 1.00, 1, 1, 55, 3),
(71, 222.00, 2, 1, 56, 7),
(72, 333.00, 1, 10, 56, 6),
(73, 66.00, 2, 17, 57, 12),
(74, 66.00, 2, 17, 58, 12),
(75, 3.00, 1, 17, 59, 8),
(76, 3.00, 1, 17, 61, 8),
(77, 66.00, 1, 17, 62, 12),
(78, 2.00, 1, 17, 63, 4),
(79, 2.00, 1, 17, 64, 4),
(80, 2.00, 1, 17, 65, 4),
(81, 2.00, 1, 17, 66, 4),
(82, 2.00, 1, 17, 67, 4),
(83, 2.00, 1, 17, 68, 4),
(84, 2.00, 1, 17, 69, 4),
(85, 1.00, 1, 17, 70, 2),
(86, 3.00, 1, 17, 72, 8),
(87, 2.00, 1, 17, 73, 4),
(88, 1.00, 1, 18, 74, 3),
(89, 1.00, 2, 18, 75, 3),
(90, 3.00, 1, 18, 76, 6),
(91, 3.00, 2, 18, 77, 6),
(92, 3.00, 3, 18, 78, 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders_pay`
--

DROP TABLE IF EXISTS `orders_pay`;
CREATE TABLE IF NOT EXISTS `orders_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) DEFAULT NULL,
  `address` varchar(300) NOT NULL,
  `btc_course` decimal(20,8) NOT NULL,
  `amount_expected` decimal(20,8) NOT NULL,
  `amount_received` decimal(20,8) NOT NULL,
  `vendor_amount` decimal(20,8) NOT NULL,
  `fee_amount` decimal(20,8) NOT NULL,
  `status` varchar(5) NOT NULL,
  `author` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `orders_pay`
--

INSERT INTO `orders_pay` (`id`, `timestamp`, `address`, `btc_course`, `amount_expected`, `amount_received`, `vendor_amount`, `fee_amount`, `status`, `author`) VALUES
(1, '2019-02-03 00:00:00.000000', '38zvbPMjS6RZzJRmfiiwW6rPv3rkzn1bGz', 0.00000000, 1.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(2, '2019-02-03 00:00:00.000000', '3GFziT6vWkxhpZcmEMn21XkVYMihNnY6Cs', 0.00000000, 4.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'Tester'),
(3, '2019-02-03 00:00:00.000000', '3JxfJUyEsvqtnBXiSFvoBAVZj6t3fJd7Rd', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(4, '2019-02-03 00:00:00.000000', '3PLYa6Dz9P3JjatPsW8Tn5z6PP4gymyAcW', 0.00000000, 1.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(5, '2019-02-03 00:00:00.000000', '3HuuNnfUMdjmpuTVL18iHEvAMQEQHp9HeD', 0.00000000, 1.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'Tester'),
(6, '2019-02-04 00:00:00.000000', '3BtuuVasBfqXGnkaSUhY11i3nM7qGGo8KN', 0.00000000, 1.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(7, '2019-03-10 00:00:00.000000', '36mtfqGbM6k8uyGYhX3V5tfLokABQXNBJ6', 0.00000000, 1.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(8, '2019-03-10 00:00:00.000000', '3KYqA9qxuGveKphcGbNgM8bEVkVZcxCYfY', 0.00000000, 1.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(9, '2019-04-03 00:00:00.000000', '3K5rHxLV61sPgioBXe4Rnao1iU9wZLCjGk', 0.00000000, 1.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(10, '2019-04-04 00:00:00.000000', '39sXoz8D2tUqmuMhA6F7iGqqPVW1BK569k', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(11, '2019-04-05 00:00:00.000000', '3NFidjBMeQjQzvMDAf7ipxaF6i3vq6djfZ', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(12, '2019-04-05 00:00:00.000000', '36pFDDKNnCPmLMuGkbh8EFH2vqgi1FyXNo', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(13, '2019-04-08 00:00:00.000000', '3PX9dSd2TBcxsHJ6y3CXtQiMJnPtpYVrqc', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(14, '2019-04-08 00:00:00.000000', '3KE8S4CWC5vrbNDQF6V7WLyCcMYmZp1xYc', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(15, '2019-04-08 00:00:00.000000', '3KJSZySDQ1MVYjEQy9H3MvYhAdVaUm7odT', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(16, '2019-04-08 00:00:00.000000', '3J8fS8eXb6ahdB9XWKmzr17oe8qGyvF2Qw', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(17, '2019-04-08 00:00:00.000000', '3PHGrxnenZGpuVkJ1t6Bgqokcb1A5KUvyc', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(18, '2019-04-08 00:00:00.000000', '3Mi1U6dYfUpYxpbh3R5FqeHHemT6Ft5vCa', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(19, '2019-04-08 00:00:00.000000', '3JBNX9dyrmTv9KD7BjApMnjgwCubKgnUYR', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(20, '2019-04-08 00:00:00.000000', '3ANk5u7PXSJoHbV6n8TgtWAvYey8s6jKy5', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(21, '2019-04-09 00:00:00.000000', '3Gm62UGpaAFQU4KRqgmbLrQSVs59jcgrna', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '3', 'admin'),
(25, '2019-04-11 00:00:00.000000', '3EBk68zgCaau5ppP1Zu83LeiH54XcuR6VV', 5090.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '8', 'admin'),
(26, '2019-04-11 00:00:00.000000', '36mPStRZRUEkiawiTaEYscPNUf8hfBsjZj', 5048.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'admin'),
(27, '2019-04-11 00:00:00.000000', '32FoNLT3h1V1hPgsYvhnQhEqh7YTgh3oSY', 5047.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '5', 'admin'),
(28, '2019-04-11 00:00:00.000000', '3GnspFgQqCmKeFbcawEGf5cKW3decAxjen', 5036.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '7', 'admin'),
(29, NULL, 'asfsdfdsfsdasdgsalgafgjafppafd''nbif[]nbi', 5000.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '3', 'admin'),
(30, '2019-04-24 00:00:00.000000', '35EhxW9dUuLVR8fa39pC7jGqJCLSfrQa4D', 5580.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'wayne4989'),
(31, '2019-04-24 00:00:00.000000', '3LjhToUUYKk31xUaGELpNc8JFREQ7kMUqM', 5606.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'wayne4989'),
(32, '2019-04-24 00:00:00.000000', '3PZoogD9YnUA4xNJdtHC1SffQbpzkZWvdv', 5480.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'wayne4989'),
(33, '2019-04-24 00:00:00.000000', '3KRnc4Mnq16BYED9bhU2XyvAfVgVaux2VV', 5492.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'wayne4989'),
(50, '2019-04-28 00:00:00.000000', '3M1465pxCwozsKUrAKFrebeE9nyKhEQgLD', 5306.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, '0', 'hello123');

-- --------------------------------------------------------

--
-- Table structure for table `star_ratings_rating`
--

DROP TABLE IF EXISTS `star_ratings_rating`;
CREATE TABLE IF NOT EXISTS `star_ratings_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `average` decimal(6,3) NOT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `star_ratings_rating_content_type_id_object_id_f170c88b_uniq` (`content_type_id`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `star_ratings_userrating`
--

DROP TABLE IF EXISTS `star_ratings_userrating`;
CREATE TABLE IF NOT EXISTS `star_ratings_userrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `ip` char(39) DEFAULT NULL,
  `score` smallint(5) unsigned NOT NULL,
  `rating_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `star_ratings_userrating_user_id_rating_id_25ba0a69_uniq` (`user_id`,`rating_id`),
  KEY `star_ratings_userrat_rating_id_e7ac9370_fk_star_rati` (`rating_id`),
  KEY `star_ratings_userrating_user_id_33d5d349` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `support_chat`
--

DROP TABLE IF EXISTS `support_chat`;
CREATE TABLE IF NOT EXISTS `support_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `read` tinyint(1) NOT NULL,
  `started` datetime(6) NOT NULL,
  `ended` datetime(6) DEFAULT NULL,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `support_chat_name_id_1886c584_fk_accounts_user_id` (`name_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `support_chat`
--

INSERT INTO `support_chat` (`id`, `read`, `started`, `ended`, `name_id`) VALUES
(1, 0, '2019-02-02 00:00:00.000000', NULL, 3),
(2, 0, '2019-02-03 00:00:00.000000', NULL, 1),
(3, 0, '2019-03-06 00:00:00.000000', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `support_chatmessage`
--

DROP TABLE IF EXISTS `support_chatmessage`;
CREATE TABLE IF NOT EXISTS `support_chatmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) NOT NULL,
  `message` longtext NOT NULL,
  `sent` datetime(6) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `support_chatmessage_chat_id_2f1da49a_fk_support_chat_id` (`chat_id`),
  KEY `support_chatmessage_name_id_791876bf_fk_accounts_user_id` (`name_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `support_chatmessage`
--

INSERT INTO `support_chatmessage` (`id`, `admin`, `message`, `sent`, `chat_id`, `name_id`) VALUES
(1, 0, 'hi', '2019-02-03 00:00:00.000000', 2, 1),
(2, 0, 'hhä', '2019-02-03 00:00:00.000000', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket`
--

DROP TABLE IF EXISTS `support_ticket`;
CREATE TABLE IF NOT EXISTS `support_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_title` varchar(200) NOT NULL,
  `sub_description` longtext NOT NULL,
  `state` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `sent` datetime(6) NOT NULL,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `support_ticket_name_id_d83819e1_fk_accounts_user_id` (`name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticketreplay`
--

DROP TABLE IF EXISTS `support_ticketreplay`;
CREATE TABLE IF NOT EXISTS `support_ticketreplay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_description` longtext NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `sent` datetime(6) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `support_ticketreplay_ticket_id_61b231b1_fk_support_ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendorpanel_shippingoption`
--

DROP TABLE IF EXISTS `vendorpanel_shippingoption`;
CREATE TABLE IF NOT EXISTS `vendorpanel_shippingoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_area` varchar(20) DEFAULT NULL,
  `price` double NOT NULL,
  `description` longtext NOT NULL,
  `shipping_type_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendorpanel_shipping_shipping_type_id_c9234aec_fk_vendorpan` (`shipping_type_id`),
  KEY `vendorpanel_shipping_vendor_id_78b16391_fk_accounts_` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendorpanel_shippingtype`
--

DROP TABLE IF EXISTS `vendorpanel_shippingtype`;
CREATE TABLE IF NOT EXISTS `vendorpanel_shippingtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_vendorfavorite`
--
ALTER TABLE `accounts_vendorfavorite`
  ADD CONSTRAINT `accounts_vendorfavorite_user_id_8c4869fe_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `accounts_vendorfavorite_vendor_id_074ad68d_fk_accounts_user_id` FOREIGN KEY (`vendor_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_vendorterm`
--
ALTER TABLE `accounts_vendorterm`
  ADD CONSTRAINT `accounts_vendorterm_userId_id_66337cd0_fk_accounts_user_id` FOREIGN KEY (`userId_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `main_message`
--
ALTER TABLE `main_message`
  ADD CONSTRAINT `main_message_receiver_id_27da35a6_fk_accounts_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `main_message_sender_id_37f0c886_fk_accounts_user_id` FOREIGN KEY (`sender_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `main_product`
--
ALTER TABLE `main_product`
  ADD CONSTRAINT `main_product_category_id_c0d90f41_fk_main_category_id` FOREIGN KEY (`category_id`) REFERENCES `main_category` (`id`),
  ADD CONSTRAINT `main_product_productOwnerID_id_f7f78d50_fk_accounts_user_id` FOREIGN KEY (`productOwnerID_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `orders_order`
--
ALTER TABLE `orders_order`
  ADD CONSTRAINT `orders_order_payment_id_46928ccc_fk_orders_pay_id` FOREIGN KEY (`payment_id`) REFERENCES `orders_pay` (`id`),
  ADD CONSTRAINT `orders_order_user_id_e9b59eb1_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `orders_orderitem`
--
ALTER TABLE `orders_orderitem`
  ADD CONSTRAINT `orders_orderitem_author_id_fe3f122b_fk_accounts_user_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  ADD CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_main_product_id` FOREIGN KEY (`product_id`) REFERENCES `main_product` (`id`);

--
-- Constraints for table `star_ratings_rating`
--
ALTER TABLE `star_ratings_rating`
  ADD CONSTRAINT `star_ratings_rating_content_type_id_176abacc_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `star_ratings_userrating`
--
ALTER TABLE `star_ratings_userrating`
  ADD CONSTRAINT `star_ratings_userrat_rating_id_e7ac9370_fk_star_rati` FOREIGN KEY (`rating_id`) REFERENCES `star_ratings_rating` (`id`),
  ADD CONSTRAINT `star_ratings_userrating_user_id_33d5d349_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `support_chat`
--
ALTER TABLE `support_chat`
  ADD CONSTRAINT `support_chat_name_id_1886c584_fk_accounts_user_id` FOREIGN KEY (`name_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `support_chatmessage`
--
ALTER TABLE `support_chatmessage`
  ADD CONSTRAINT `support_chatmessage_chat_id_2f1da49a_fk_support_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `support_chat` (`id`),
  ADD CONSTRAINT `support_chatmessage_name_id_791876bf_fk_accounts_user_id` FOREIGN KEY (`name_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `support_ticket`
--
ALTER TABLE `support_ticket`
  ADD CONSTRAINT `support_ticket_name_id_d83819e1_fk_accounts_user_id` FOREIGN KEY (`name_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `support_ticketreplay`
--
ALTER TABLE `support_ticketreplay`
  ADD CONSTRAINT `support_ticketreplay_ticket_id_61b231b1_fk_support_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `support_ticket` (`id`);

--
-- Constraints for table `vendorpanel_shippingoption`
--
ALTER TABLE `vendorpanel_shippingoption`
  ADD CONSTRAINT `vendorpanel_shipping_shipping_type_id_c9234aec_fk_vendorpan` FOREIGN KEY (`shipping_type_id`) REFERENCES `vendorpanel_shippingtype` (`id`),
  ADD CONSTRAINT `vendorpanel_shipping_vendor_id_78b16391_fk_accounts_` FOREIGN KEY (`vendor_id`) REFERENCES `accounts_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
