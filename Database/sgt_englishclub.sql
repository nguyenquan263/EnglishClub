-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th3 20, 2019 lúc 02:28 AM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sgt_englishclub`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `EMAIL` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `FIRSTNAME` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `LASTNAME` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `PHONE` varchar(15) COLLATE utf8_vietnamese_ci NOT NULL,
  `ROLE` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `STATUS` bit(1) NOT NULL,
  `USERNAME` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`ID`, `EMAIL`, `FIRSTNAME`, `LASTNAME`, `PASSWORD`, `PHONE`, `ROLE`, `STATUS`, `USERNAME`) VALUES
(1, 'thupvm15@saigontech.edu.vn', 'Thu', 'Phan', '123abc', '0855574063', 'ADMIN', b'1', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `file`
--

CREATE TABLE `file` (
  `ID` int(11) NOT NULL,
  `LINK` varchar(1000) COLLATE utf8_vietnamese_ci NOT NULL,
  `STATUS` bit(1) NOT NULL,
  `MATERIALID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `material`
--

CREATE TABLE `material` (
  `ID` int(11) NOT NULL,
  `CONTENT` varchar(10000) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `POSTDATE` date DEFAULT NULL,
  `STATUS` bit(1) NOT NULL,
  `TITLE` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `TITLEPICTURE` varchar(255) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `ADMINID` int(11) NOT NULL,
  `MATERIALTYPEID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `materialtype`
--

CREATE TABLE `materialtype` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `STATUS` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tip`
--

CREATE TABLE `tip` (
  `ID` int(11) NOT NULL,
  `CONTENT` longtext COLLATE utf8_vietnamese_ci NOT NULL,
  `POSTDATE` date DEFAULT NULL,
  `STATUS` bit(1) NOT NULL,
  `TITLE` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `TITLEPICTURE` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADMINID` int(11) NOT NULL,
  `TIPTYPEID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tiptype`
--

CREATE TABLE `tiptype` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `STATUS` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `video`
--

CREATE TABLE `video` (
  `ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_vietnamese_ci NOT NULL,
  `LINK` varchar(500) COLLATE utf8_vietnamese_ci NOT NULL,
  `POSTDATE` date DEFAULT NULL,
  `STATUS` bit(1) NOT NULL,
  `TITLE` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `ADMINID` int(11) NOT NULL,
  `CLIPTYPEID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `videotype`
--

CREATE TABLE `videotype` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `STATUS` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_22cyd8s0depa03gprxm3gn6c0` (`USERNAME`);

--
-- Chỉ mục cho bảng `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKhnergsu60q0k6gsh38tjkqu6m` (`MATERIALID`);

--
-- Chỉ mục cho bảng `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK8g74j658rwc38gsop3e48rwrt` (`ADMINID`),
  ADD KEY `FK382qnnts34g98nj72l6r4r9eq` (`MATERIALTYPEID`);

--
-- Chỉ mục cho bảng `materialtype`
--
ALTER TABLE `materialtype`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tip`
--
ALTER TABLE `tip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKj3y54ldpl0god071r5wipr0xe` (`ADMINID`),
  ADD KEY `FK9s1jmnoe1ybgmvw54lml5eti6` (`TIPTYPEID`);

--
-- Chỉ mục cho bảng `tiptype`
--
ALTER TABLE `tiptype`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKfhbuxw4xe8c1f5y0tfh6gjihd` (`ADMINID`),
  ADD KEY `FKjul9x6ikquy5dd5tarvw8ekj5` (`CLIPTYPEID`);

--
-- Chỉ mục cho bảng `videotype`
--
ALTER TABLE `videotype`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `file`
--
ALTER TABLE `file`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `material`
--
ALTER TABLE `material`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `materialtype`
--
ALTER TABLE `materialtype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tip`
--
ALTER TABLE `tip`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tiptype`
--
ALTER TABLE `tiptype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `video`
--
ALTER TABLE `video`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `videotype`
--
ALTER TABLE `videotype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `FKhnergsu60q0k6gsh38tjkqu6m` FOREIGN KEY (`MATERIALID`) REFERENCES `material` (`ID`);

--
-- Các ràng buộc cho bảng `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `FK382qnnts34g98nj72l6r4r9eq` FOREIGN KEY (`MATERIALTYPEID`) REFERENCES `materialtype` (`ID`),
  ADD CONSTRAINT `FK8g74j658rwc38gsop3e48rwrt` FOREIGN KEY (`ADMINID`) REFERENCES `admin` (`ID`);

--
-- Các ràng buộc cho bảng `tip`
--
ALTER TABLE `tip`
  ADD CONSTRAINT `FK9s1jmnoe1ybgmvw54lml5eti6` FOREIGN KEY (`TIPTYPEID`) REFERENCES `tiptype` (`ID`),
  ADD CONSTRAINT `FKj3y54ldpl0god071r5wipr0xe` FOREIGN KEY (`ADMINID`) REFERENCES `admin` (`ID`);

--
-- Các ràng buộc cho bảng `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `FKfhbuxw4xe8c1f5y0tfh6gjihd` FOREIGN KEY (`ADMINID`) REFERENCES `admin` (`ID`),
  ADD CONSTRAINT `FKjul9x6ikquy5dd5tarvw8ekj5` FOREIGN KEY (`CLIPTYPEID`) REFERENCES `videotype` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
