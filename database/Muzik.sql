-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation time: Jan 10, 2021 at 12:50 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Muzik`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `ID` int(10) NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Permision`
--

CREATE TABLE `Permision` (
  `ID` int(10) NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Songs`
--

CREATE TABLE `Songs` (
  `ID` int(10) NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lyric` int(10) DEFAULT NULL,
  `Singer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `composer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` int(10) NOT NULL,
  `views` int(10) DEFAULT NULL,
  `likes` int(10) DEFAULT NULL,
  `category` int(10) NOT NULL,
  `status` int(10) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `publishDate` datetime(6) DEFAULT NULL,
  `delete` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Song_category`
--

CREATE TABLE `Song_category` (
  `ID` int(10) NOT NULL,
  `Song` int(10) NOT NULL,
  `category` int(10) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `ID` int(10) NOT NULL,
  `userName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender` tinyint(3) DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permision` int(10) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `activeToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refreshToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users_Comments`
--

CREATE TABLE `Users_Comments` (
  `ID` int(10) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `User` int(10) NOT NULL,
  `Song` int(10) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `Permision`
--
ALTER TABLE `Permision`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Songs`
--
ALTER TABLE `Songs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `author` (`author`);

--
-- Indexes for table `Song_category`
--
ALTER TABLE `Song_category`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKSong_categ986104` (`category`),
  ADD KEY `FKSong_categ859474` (`Song`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `permision` (`permision`);

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
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Permision`
--
ALTER TABLE `Permision`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Songs`
--
ALTER TABLE `Songs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Song_category`
--
ALTER TABLE `Song_category`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users_Comments`
--
ALTER TABLE `Users_Comments`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users_Favorite_Songs`
--
ALTER TABLE `Users_Favorite_Songs`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `Users` (`ID`);

--
-- Constraints for table `Song_category`
--
ALTER TABLE `Song_category`
  ADD CONSTRAINT `FKSong_categ859474` FOREIGN KEY (`Song`) REFERENCES `Songs` (`ID`),
  ADD CONSTRAINT `FKSong_categ986104` FOREIGN KEY (`category`) REFERENCES `Categories` (`ID`);


--
-- Constraints for table `Users_Comments`
--
ALTER TABLE `Users_Comments`
  ADD CONSTRAINT `FKUsers_Comm193966` FOREIGN KEY (`Song`) REFERENCES `Songs` (`ID`),
  ADD CONSTRAINT `FKUsers_Comm215024` FOREIGN KEY (`User`) REFERENCES `Users` (`ID`);

--
-- Constraints for table `Users_Favorite_Songs`
--
ALTER TABLE `Users_Favorite_Songs`
  ADD CONSTRAINT `FKUsers_Favo456767` FOREIGN KEY (`User`) REFERENCES `Users` (`ID`),
  ADD CONSTRAINT `FKUsers_Favo477825` FOREIGN KEY (`Song`) REFERENCES `Songs` (`ID`);

--
-- Constraints for table `Users_like_Songs`
--
ALTER TABLE `Users_like_Songs`
  ADD CONSTRAINT `FKUsers_like387257` FOREIGN KEY (`Song`) REFERENCES `Songs` (`ID`),
  ADD CONSTRAINT `FKUsers_like408315` FOREIGN KEY (`User`) REFERENCES `Users` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
