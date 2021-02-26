-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2021 at 07:42 AM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `JuMJWPpv2T`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `ID` int(10) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`ID`, `Name`, `delete`, `createDate`, `modifileDate`) VALUES
(1, 'pop', 0, NULL, NULL),
(2, 'Young', 0, NULL, NULL),
(3, 'Rock', 0, NULL, NULL),
(4, 'Type1', 0, NULL, NULL),
(5, 'Type2', 0, NULL, NULL),
(6, 'Type3', 0, NULL, NULL),
(7, 'Type4', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Songs`
--

CREATE TABLE `Songs` (
  `ID` int(10) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Singer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `composer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` int(10) NOT NULL,
  `views` int(10) DEFAULT NULL,
  `likes` int(10) DEFAULT NULL,
  `category` int(10) NOT NULL,
  `status` int(10) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `publishDate` datetime(6) DEFAULT NULL,
  `delete` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Songs`
--

INSERT INTO `Songs` (`ID`, `Name`, `Singer`, `composer`, `author`, `views`, `likes`, `category`, `status`, `createDate`, `publishDate`, `delete`) VALUES
(1, 'thunder', 'minh hieu', 'minh hieu', 13, 26, 0, 1, 0, '2021-02-18 00:00:00.000000', NULL, NULL),
(2, '', '', '', 11, 1, 0, 1, 1, NULL, '2021-02-26 11:44:21.274000', NULL),
(3, 'hello', 'babye', '', 11, 6, 0, 1, 1, NULL, '2021-02-26 11:53:19.823000', NULL),
(4, 'hello', 'babye', '', 11, 2, 0, 1, 1, NULL, '2021-02-26 11:54:11.346000', NULL),
(5, 'hello', 'babye', '', 11, 0, 0, 1, NULL, NULL, NULL, NULL),
(6, 'hello', 'babye', '', 11, 0, 0, 1, NULL, NULL, NULL, NULL),
(7, 'song1', 'singer1', 'composer1', 11, 0, 0, 5, NULL, '2021-02-24 15:18:09.359000', NULL, NULL),
(8, 'we of present co the abc', 'sontungMTP123', 'sontungMTP', 11, 31, 0, 5, 1, '2021-02-24 15:34:31.735000', '2021-02-26 14:04:18.739000', NULL),
(9, 'thunder', 'minh hieu', 'minh hieu', 13, 16, 1, 1, 1, '2021-02-18 00:00:00.000000', '2021-02-19 00:00:00.000000', NULL),
(10, '', '', '', 12, 0, 0, 1, NULL, NULL, NULL, NULL),
(11, 'hello', 'babye', '', 12, 0, 0, 1, NULL, NULL, NULL, NULL),
(12, 'hello', 'babye', '', 12, 0, 0, 1, NULL, NULL, NULL, NULL),
(13, 'hello', 'babye', '', 11, 0, 0, 1, NULL, NULL, NULL, NULL),
(14, 'hello', 'babye', '', 11, 0, 0, 1, NULL, NULL, NULL, NULL),
(15, 'song1', 'singer1', 'composer1', 11, 0, 0, 5, NULL, '2021-02-24 15:18:09.359000', NULL, NULL),
(16, 'we of present', 'sontungMTP', 'sontungMTP', 11, 25, 0, 1, NULL, '2021-02-24 15:34:31.735000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `ID` int(10) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender` tinyint(3) DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permision` int(10) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `activeToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refreshToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`ID`, `userName`, `password`, `email`, `DOB`, `gender`, `avatar`, `permision`, `delete`, `createDate`, `modifileDate`, `status`, `activeToken`, `refreshToken`) VALUES
(11, 'test1', '$2b$08$AEudFnkbpZJDOS9MrKCUV.BQqYKy.2wvUKwBBVizVXfN1B8iI.EmG', 'herokutesterone@gmail.com', '2000-11-29', 1, '0', 1, 0, '2021-01-20 23:58:29.000000', '2021-01-30 18:29:40.407000', 1, NULL, NULL),
(12, 'xxxman', '$2b$08$c1UoQ6WQU0Vw0jKqb5aEe.m570K94vNSOS4LOX.XN2mZ4.UGe7ssq', 'buidangkhoa3572@gmail.com', '2000-12-15', 1, '1', 0, 0, '2021-01-21 21:07:01.000000', '2021-01-21 21:07:01.000000', 1, NULL, NULL),
(13, 'babe@gmail.com', '$2b$08$xuXFxYhMJtnrjkJKy.AYcen4rf0KQ37EGkl5HoE7qEY7izjbeN4Tu', 'babe@gmail.com', '2000-12-15', 1, NULL, 0, 0, '2021-01-24 14:37:51.000000', '2021-01-24 14:37:51.000000', 1, NULL, NULL),
(14, 'hieuttm', '$2b$08$V5abQFZRRVepz.v7z.po4eelvf7WEBdbCVu3P9VX2k4L62W0JjPge', 'ttmhieu08@gmail.com', '2000-12-15', 0, NULL, 0, 0, '2021-01-24 19:07:12.000000', '2021-01-24 19:07:12.000000', 1, NULL, NULL),
(16, 'skakdkdkd@vnzmail.xyz', '$2b$08$A2eb995908BV9jM/rKtzfu2MCJd60skzBT/yaSuj0ljjpiLnFZa8e', 'skakdkdkd@vnzmail.xyz', '2000-12-15', 0, NULL, 0, 0, '2021-01-30 10:47:13.000000', '2021-01-30 10:47:13.000000', 1, NULL, NULL),
(17, '123', '$2b$08$WkMUrDMsPivuEhTh6bVBuOsU8iaW7U1NJ2/rXBfDokzpVNyHEiHBW', 'vananh1998@gmail.com', '2000-12-15', NULL, NULL, 0, 0, '2021-02-15 20:01:16.000000', '2021-02-15 20:01:16.000000', 0, '649522', NULL),
(18, '123444', '$2b$08$1cVHsKFfBD.A8oyUV2vWEOAydOzAM1LMbpHU0XCJekMwWXgwCvDa6', 'vananh1998@gmail.com22', '2000-12-15', NULL, NULL, 0, 0, '2021-02-15 20:02:34.000000', '2021-02-15 20:02:34.000000', 0, '322290', NULL),
(19, 'khoa123', '$2b$08$CGuf/96RQP53qt1ahucxvuBzP.cOyySIQDuT19QUuJP9Y2ptLW8wS', 'vananh19298@gmail.com', '2000-12-15', NULL, NULL, 0, 0, '2021-02-15 20:04:57.000000', '2021-02-15 20:04:57.000000', 0, '949998', NULL),
(20, 'vuongtrieu0303', '$2b$08$kuRTmoe1NFPI/3BlwfVZluObS24N.1v9wGsapqu5W9xp7UswHkg5K', 'vuongtrieu0303@vnzmail.xyz', '2000-12-15', NULL, NULL, 0, 0, '2021-02-15 20:55:52.000000', '2021-02-15 20:55:52.000000', 0, '180469', NULL),
(21, 'vuongtrieu0303', '$2b$08$zrL4KOsvW3/rOKjoH76ci.C1.79k0ie3UXlP8ZJk3wgPYmazz4FnW', 'vuongtrieu0303@vnzmail.xyz', '2000-12-15', NULL, NULL, 0, 0, '2021-02-15 20:59:27.000000', '2021-02-15 20:59:27.000000', 1, NULL, NULL),
(124, 'test2', '$2b$08$tqzx0dKXjYWZ4UInh491WeiX7SWnd/6bfRC76EzCd68lYN7Uw682e', 'test2@yopmail.com', '2000-12-15', NULL, NULL, 0, 0, '2021-02-18 11:16:30.000000', '2021-02-18 11:37:15.332000', 1, NULL, NULL),
(125, 'test3', '$2b$08$xY2EttKnQzY9G1KcRe1DNuTINro7ogpQSV7EZnFbuTAKVTh6Xheq6', 'longlong0303@yopmail.com', '2000-12-15', NULL, NULL, 0, 0, '2021-02-20 17:03:00.000000', '2021-02-20 17:03:00.000000', 1, NULL, NULL),
(126, 'khoabd', '$2b$08$QLgcsR9vIXEbFtOjPVSqPezwhoTMbk5XDQFPCuc76qS3qHaya./oK', 'buidangkhoa357@gmail.com', '2000-12-15', NULL, NULL, 0, 0, '2021-02-21 14:28:11.000000', '2021-02-21 14:28:11.000000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Users_Comments`
--

CREATE TABLE `Users_Comments` (
  `ID` int(10) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `User` int(10) NOT NULL,
  `Song` int(10) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Users_Comments`
--

INSERT INTO `Users_Comments` (`ID`, `content`, `User`, `Song`, `delete`, `createDate`, `modifileDate`) VALUES
(1, 'chao2\n', 11, 1, 0, '2021-02-20 18:46:41.735000', '2021-02-20 18:46:41.735000'),
(2, 'oke', 11, 1, 0, '2021-02-20 18:47:46.696000', '2021-02-20 18:46:46.696000'),
(3, 'hello bai nay hay qua', 12, 1, 0, '2021-02-20 18:52:06.573000', '2021-02-20 18:52:06.573000'),
(4, 'asdsadas', 12, 1, 0, '2021-02-20 18:56:10.935000', '2021-02-20 18:56:10.935000'),
(5, 'adsadsa', 12, 1, 0, '2021-02-20 18:56:52.149000', '2021-02-20 18:56:52.149000'),
(6, 'a a a\naa a a\naa a a\naa a a\naa a a\naa a a\naa a a\na', 12, 1, 0, '2021-02-20 18:58:39.173000', '2021-02-20 18:58:39.173000'),
(7, 'hehe', 12, 1, 0, '2021-02-20 21:05:42.014000', '2021-02-20 21:05:42.014000'),
(8, 'adsa', 12, 1, 0, '2021-02-20 21:46:16.027000', '2021-02-20 21:46:16.027000'),
(9, 'asdas', 12, 1, 0, '2021-02-20 21:47:31.464000', '2021-02-20 21:47:31.464000'),
(10, '12321', 12, 1, 0, '2021-02-20 21:51:40.518000', '2021-02-20 21:51:40.518000'),
(11, '12312', 12, 1, 0, '2021-02-20 21:53:29.866000', '2021-02-20 21:53:29.866000'),
(12, 'hello', 12, 1, 0, '2021-02-20 21:55:30.509000', '2021-02-20 21:55:30.509000'),
(13, 'Bai nay hay qua', 12, 1, 0, '2021-02-20 21:55:42.463000', '2021-02-20 21:55:42.463000'),
(14, 'Good job', 12, 1, 0, '2021-02-20 21:56:02.881000', '2021-02-20 21:56:02.881000'),
(15, 'ssss', 12, 1, 0, '2021-02-20 21:57:26.955000', '2021-02-20 21:57:26.955000'),
(16, 'hehe', 12, 1, 0, '2021-02-20 22:17:19.860000', '2021-02-20 22:17:19.860000'),
(17, 'ádasdsa', 12, 1, 0, '2021-02-20 22:17:40.229000', '2021-02-20 22:17:40.229000'),
(18, '1123123hehe', 12, 1, 0, '2021-02-20 22:18:16.281000', '2021-02-20 22:18:16.281000'),
(19, '123', 126, 1, 0, '2021-02-21 16:17:41.635000', '2021-02-21 16:17:41.635000'),
(20, 'vl', 11, 8, 0, '2021-02-24 15:56:24.713000', '2021-02-24 15:56:24.713000'),
(21, 'asd', 11, 8, 0, '2021-02-25 10:46:47.841000', '2021-02-25 10:46:47.841000'),
(22, 'chao', 11, 8, 0, '2021-02-25 10:46:53.680000', '2021-02-25 10:46:53.680000'),
(23, 'lkjhgfxz', 11, 8, 0, '2021-02-25 16:36:16.919000', '2021-02-25 16:36:16.919000');

-- --------------------------------------------------------

--
-- Table structure for table `Users_Favorite_Songs`
--

CREATE TABLE `Users_Favorite_Songs` (
  `ID` int(10) NOT NULL,
  `User` int(10) NOT NULL,
  `Song` int(10) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` int(10) DEFAULT NULL,
  `modifileDate` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Users_Favorite_Songs`
--

INSERT INTO `Users_Favorite_Songs` (`ID`, `User`, `Song`, `delete`, `createDate`, `modifileDate`) VALUES
(1, 126, 15, 0, NULL, NULL),
(2, 126, 16, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Users_like_Songs`
--

CREATE TABLE `Users_like_Songs` (
  `ID` int(10) NOT NULL,
  `User` int(10) NOT NULL,
  `Song` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Songs`
--
ALTER TABLE `Songs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `author` (`author`);
ALTER TABLE `Songs` ADD FULLTEXT KEY `Name` (`Name`,`Singer`,`composer`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Users_Comments`
--
ALTER TABLE `Users_Comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKUsers_Comm215024` (`User`),
  ADD KEY `FKUsers_Comm193966` (`Song`);

--
-- Indexes for table `Users_Favorite_Songs`
--
ALTER TABLE `Users_Favorite_Songs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKUsers_Favo456767` (`User`),
  ADD KEY `FKUsers_Favo477825` (`Song`);

--
-- Indexes for table `Users_like_Songs`
--
ALTER TABLE `Users_like_Songs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKUsers_like408315` (`User`),
  ADD KEY `FKUsers_like387257` (`Song`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Songs`
--
ALTER TABLE `Songs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `Users_Comments`
--
ALTER TABLE `Users_Comments`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `Users_Favorite_Songs`
--
ALTER TABLE `Users_Favorite_Songs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Users_like_Songs`
--
ALTER TABLE `Users_like_Songs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Songs`
--
ALTER TABLE `Songs`
  ADD CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Users_Comments`
--
ALTER TABLE `Users_Comments`
  ADD CONSTRAINT `FKUsers_Comm193966` FOREIGN KEY (`Song`) REFERENCES `Songs` (`id`),
  ADD CONSTRAINT `FKUsers_Comm215024` FOREIGN KEY (`User`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Users_Favorite_Songs`
--
ALTER TABLE `Users_Favorite_Songs`
  ADD CONSTRAINT `FKUsers_Favo456767` FOREIGN KEY (`User`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `FKUsers_Favo477825` FOREIGN KEY (`Song`) REFERENCES `Songs` (`id`);

--
-- Constraints for table `Users_like_Songs`
--
ALTER TABLE `Users_like_Songs`
  ADD CONSTRAINT `FKUsers_like387257` FOREIGN KEY (`Song`) REFERENCES `Songs` (`id`),
  ADD CONSTRAINT `FKUsers_like408315` FOREIGN KEY (`User`) REFERENCES `Users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
