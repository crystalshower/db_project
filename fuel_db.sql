-- MariaDB dump 10.19  Distrib 10.8.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: fuel_db
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB-1:10.6.5+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin`
(
    `id_admin`                  int(11)     NOT NULL AUTO_INCREMENT,
    `username`                  varchar(16) NOT NULL,
    `password`                  varchar(32) NOT NULL,
    `admin_tanggal_ditambahkan` datetime   DEFAULT current_timestamp(),
    `admin_tanggal_dihapus`     datetime   DEFAULT NULL,
    `active_status`             tinyint(1) DEFAULT 1,
    PRIMARY KEY (`id_admin`),
    UNIQUE KEY `admin_username_uindex` (`username`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin`
    DISABLE KEYS */;
INSERT INTO `admin`
VALUES (1, 'crystal', 'fe4c0f30aa359c41d9f9a5f69c8c4192', '2022-04-25 15:13:26', NULL, 1);
/*!40000 ALTER TABLE `admin`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company`
(
    `id_company`               int(11) NOT NULL AUTO_INCREMENT,
    `company_name`             varchar(100) DEFAULT NULL,
    `alamat`                   varchar(100) DEFAULT NULL,
    `comp_tanggal_ditambahkan` datetime     DEFAULT current_timestamp(),
    `comp_tanggal_dihapus`     datetime     DEFAULT NULL,
    `comp_active_status`       tinyint(1)   DEFAULT 1,
    PRIMARY KEY (`id_company`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 54
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company`
    DISABLE KEYS */;
INSERT INTO `company`
VALUES (1, 'Crystal Studios', 'Dublin, Ireland', '2022-04-25 12:02:17', NULL, 1),
       (2, 'Parker Industries', 'New York, NY', '2022-05-29 12:03:10', NULL, 1),
       (3, 'Filan Mobile Corp', 'Sligo, Ireland', '2022-05-31 04:41:34', NULL, 1),
       (4, 'Peter Electronic LLC', '62 Little Clarendon St', '2022-05-09 17:25:16', NULL, 1),
       (5, 'Wagner\'s Pharmaceutical LLC', '442 Little Clarendon St', '2022-04-30 07:10:34', NULL, 1),
       (6, 'Phyllis Software Inc.', '386 East Alley', '2022-05-20 01:33:16', NULL, 1),
       (7, 'Martinez\'s Inc.', '392 Tremont Road', '2022-06-05 09:00:45', NULL, 1),
       (8, 'Wayne Software Inc.', '956 Aigburth Rd, Aigburth', '2022-04-28 16:06:13', NULL, 1),
       (9, 'Holmes LLC', '979 Redfern St', '2022-05-10 20:13:59', NULL, 1),
       (10, 'Katherine Inc.', '776 East Alley', '2022-05-30 23:03:40', NULL, 1),
       (11, 'Walter Inc.', '674 Tremont Road', '2022-06-01 09:44:42', NULL, 1),
       (12, 'Jeremy Software Inc.', '339 Osney Mead', '2022-04-26 01:27:23', NULL, 1),
       (13, 'Daniel Software LLC', '973 Columbia St', '2022-05-22 06:12:57', NULL, 1),
       (14, 'Robert Food Inc.', '54 Park End St', '2022-05-26 11:39:55', NULL, 1),
       (15, 'Chen Inc.', '739 Spring Gardens', '2022-05-16 15:32:16', NULL, 1),
       (16, 'Carolyn Electronic Inc.', '537 Abingdon Rd, Cumnor', '2022-06-09 21:55:24', NULL, 1),
       (17, 'Daniels\'s Inc.', '40 Figueroa Street', '2022-05-27 23:11:08', NULL, 1),
       (18, 'Pauline LLC', '205 Lower Temple Street', '2022-05-08 01:11:16', NULL, 1),
       (19, 'Laura Inc.', '667 West Houston Street', '2022-05-16 22:44:29', NULL, 1),
       (20, 'Ethel LLC', '682 The Pavilion, Lammas Field, Driftway', '2022-06-01 15:50:09', NULL, 1),
       (21, 'Lee Brothers Telecommunication Inc.', '527 Mosley St', '2022-06-12 16:15:06', NULL, 1),
       (22, 'Lewis LLC', '679 49/50 Strand, Charing Cross', '2022-04-27 03:50:17', NULL, 1),
       (23, 'Ruiz Brothers Electronic LLC', '94 Whitehouse Lane, Huntingdon Rd', '2022-06-01 13:19:14', NULL, 1),
       (24, 'Manuel LLC', '735 Regent Street', '2022-05-12 08:50:18', NULL, 1),
       (25, 'Barbara Consultants Inc.', '594 West Market Street', '2022-06-01 09:17:40', NULL, 1),
       (26, 'Lee Inc.', '372 Mosley St', '2022-05-04 16:46:06', NULL, 1),
       (27, 'Rodney LLC', '147 Whitehouse Lane, Huntingdon Rd', '2022-05-12 12:41:14', NULL, 1),
       (28, 'Emily LLC', '436 Narborough Rd', '2022-04-28 22:13:17', '2022-06-14 12:25:48', 0),
       (29, 'Morales\'s Trading Inc.', '719 Hanover Street', '2022-05-27 05:11:22', NULL, 1),
       (30, 'Davis\'s Communications Inc.', '210 North Michigan Ave', '2022-05-11 06:33:42', NULL, 1),
       (31, 'Jerry Toy Inc.', '948 Park End St', '2022-05-18 12:07:53', NULL, 1),
       (32, 'Jacqueline LLC', '7 49/50 Strand, Charing Cross', '2022-05-12 22:50:38', NULL, 1),
       (33, 'Maria Inc.', '963 49/50 Strand, Charing Cross', '2022-05-01 17:34:12', NULL, 1),
       (34, 'Steve LLC', '253 Park End St', '2022-04-28 14:10:42', NULL, 1),
       (35, 'Russell\'s Logistic LLC', '626 West Houston Street', '2022-05-06 06:20:19', NULL, 1),
       (36, 'Herrera Brothers Food Inc.', '787 Wooster Street', '2022-06-05 19:07:10', NULL, 1),
       (37, 'Philip Electronic LLC', '912 49/50 Strand, Charing Cross', '2022-05-26 01:34:01', NULL, 1),
       (38, 'Dixon Brothers Food LLC', '819 Papworth Rd, Trumpington', '2022-04-29 10:43:59', NULL, 1),
       (39, 'Payne Brothers LLC', '365 Sky Way', '2022-05-12 00:25:38', NULL, 1),
       (40, 'Cooper\'s Food Inc.', '403 North Michigan Ave', '2022-06-12 04:04:27', NULL, 1),
       (41, 'Theresa LLC', '351 Broadway', '2022-05-16 15:39:14', NULL, 1),
       (42, 'Griffin Inc.', '274 Central Avenue', '2022-05-22 17:36:50', NULL, 1),
       (43, 'Foster\'s Network Systems Inc.', '192 Portland St', '2022-06-05 02:22:16', NULL, 1),
       (44, 'Bruce LLC', '819 Osney Mead', '2022-05-22 19:18:37', NULL, 1),
       (45, 'Ruth Trading LLC', '999 Central Avenue', '2022-05-03 00:11:35', NULL, 1),
       (46, 'Ellen Inc.', '860 The Pavilion, Lammas Field, Driftway', '2022-05-10 11:42:12', NULL, 1),
       (47, 'Frank Communications Inc.', '936 Spring Gardens', '2022-05-15 11:12:45', NULL, 1),
       (48, 'Burns Brothers LLC', '380 East Alley', '2022-06-13 11:58:14', NULL, 1),
       (49, 'Billy LLC', '612 Portland St', '2022-06-01 23:16:08', NULL, 1),
       (50, 'Graham\'s Pharmaceutical Inc.', '235 New Wakefield St', '2022-05-29 09:15:12', NULL, 1),
       (51, 'Jackson Brothers Communications LLC', '222 Earle Rd', '2022-05-19 11:38:06', NULL, 1),
       (52, 'Jacqueline Telecommunication LLC', '767 Sackville St', '2022-05-02 08:38:06', NULL, 1),
       (53, 'Phyllis Logistic Inc.', '988 Edward Ave, Braunstone Town', '2022-05-28 08:19:01', NULL, 1);
/*!40000 ALTER TABLE `company`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merk_fuel`
--

DROP TABLE IF EXISTS `merk_fuel`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merk_fuel`
(
    `ID_MERK`               int(11) NOT NULL AUTO_INCREMENT,
    `NAMA_MERK`             varchar(10) DEFAULT NULL,
    `MERK_TANGGAL_DITAMBAH` datetime    DEFAULT current_timestamp(),
    `MERK_TANGGAL_DIHAPUS`  datetime    DEFAULT NULL,
    `MERK_ACTIVE_STATUS`    tinyint(1)  DEFAULT 1,
    PRIMARY KEY (`ID_MERK`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merk_fuel`
--

LOCK TABLES `merk_fuel` WRITE;
/*!40000 ALTER TABLE `merk_fuel`
    DISABLE KEYS */;
INSERT INTO `merk_fuel`
VALUES (1, 'Shell V+', '2022-06-03 14:15:29', NULL, 1),
       (2, 'VR++', '2022-06-03 07:16:16', NULL, 1),
       (3, 'Filan Plus', '2022-06-05 12:01:54', NULL, 1);
/*!40000 ALTER TABLE `merk_fuel`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `stock_list`
--

DROP TABLE IF EXISTS `stock_list`;
/*!50001 DROP VIEW IF EXISTS `stock_list`*/;
SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stock_list`
(
    `item_id`                   tinyint NOT NULL,
    `serial_tong`               tinyint NOT NULL,
    `NAMA_MERK`                 tinyint NOT NULL,
    `stock_tanggal_ditambahkan` tinyint NOT NULL
) ENGINE = MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stok_fuel`
--

DROP TABLE IF EXISTS `stok_fuel`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stok_fuel`
(
    `item_id`                   int(11)     NOT NULL AUTO_INCREMENT,
    `id_merk`                   int(11)    DEFAULT NULL,
    `serial_tong`               varchar(16) NOT NULL,
    `stock_tanggal_ditambahkan` datetime   DEFAULT current_timestamp(),
    `stock_tanggal_dihapus`     datetime   DEFAULT NULL,
    `is_transaction`            tinyint(1) DEFAULT 0,
    `is_deleted`                tinyint(1) DEFAULT 0,
    PRIMARY KEY (`item_id`),
    KEY `FK_STOK_FUE_MEMPUNYAI_MERK_FUE` (`id_merk`),
    CONSTRAINT `FK_STOK_FUE_MEMPUNYAI_MERK_FUE` FOREIGN KEY (`id_merk`) REFERENCES `merk_fuel` (`ID_MERK`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 55
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stok_fuel`
--

LOCK TABLES `stok_fuel` WRITE;
/*!40000 ALTER TABLE `stok_fuel`
    DISABLE KEYS */;
INSERT INTO `stok_fuel`
VALUES (1, 3, '140600', '2022-06-10 01:41:36', NULL, 1, 0),
       (2, 2, '171400', '2022-06-10 01:54:09', NULL, 1, 0),
       (3, 2, '111000111', '2022-06-13 07:09:07', NULL, 1, 0),
       (4, 2, 'SdV4HgvRBt', '2022-05-23 15:16:14', NULL, 1, 0),
       (5, 2, 'lxhJD22Lgs', '2022-06-04 07:41:08', NULL, 0, 0),
       (6, 2, 'NiVjmcYDPw', '2022-05-31 13:48:22', NULL, 0, 0),
       (7, 2, 'j3dSKoFCH3', '2022-05-19 07:11:40', NULL, 0, 0),
       (8, 1, 'qNeEfwFqY1', '2022-05-31 19:46:44', NULL, 0, 0),
       (9, 1, 'HdXZnDybPK', '2022-05-17 23:33:29', NULL, 0, 0),
       (10, 3, 'aq8QjgWJSB', '2022-05-15 11:50:21', NULL, 0, 0),
       (11, 2, 'AQzqMzdeLY', '2022-05-18 10:43:26', NULL, 0, 0),
       (12, 1, 'dAdflAdmCF', '2022-06-02 21:38:26', NULL, 0, 0),
       (13, 1, 'aSo2okLKk8', '2022-05-30 22:42:24', NULL, 0, 0),
       (14, 1, 'UK2Z3zPsc1', '2022-05-31 06:26:20', NULL, 0, 0),
       (15, 3, 'i3IKLOkJoK', '2022-05-16 22:26:53', NULL, 0, 0),
       (16, 1, 'fYIqX1b5h2', '2022-06-11 16:34:01', NULL, 0, 0),
       (17, 3, 'VxcAOYfrzf', '2022-05-28 20:05:06', NULL, 0, 0),
       (18, 1, 'j0033PmxAc', '2022-05-21 19:30:20', NULL, 0, 0),
       (19, 3, 'TjVKABiBR1', '2022-05-18 01:20:19', NULL, 0, 0),
       (20, 2, 'eiART6d6I0', '2022-05-14 11:29:15', NULL, 0, 0),
       (21, 1, 'd6J6zzhkkT', '2022-06-04 22:43:34', NULL, 0, 0),
       (22, 3, '7o0BOA7vBq', '2022-05-18 12:52:12', NULL, 0, 0),
       (23, 3, 'PyHVlQ7R8V', '2022-05-30 00:45:06', NULL, 0, 0),
       (24, 2, '6fwBgVrAbE', '2022-06-13 22:42:03', NULL, 0, 0),
       (25, 1, '0RzJsyjRtO', '2022-05-23 18:31:59', NULL, 0, 0),
       (26, 1, 'vrYE6SAIhp', '2022-06-07 09:22:14', NULL, 0, 0),
       (27, 1, 'RyRXBY8LPc', '2022-06-01 08:06:45', NULL, 0, 0),
       (28, 2, '5e2sF8CjUI', '2022-05-24 00:32:53', NULL, 0, 0),
       (29, 3, 'JYEaV32lba', '2022-06-01 12:57:12', NULL, 0, 0),
       (30, 2, 'Hx6NtgPHVz', '2022-05-22 02:25:42', NULL, 0, 0),
       (31, 2, 'wOQJfLOrt1', '2022-05-12 02:41:31', NULL, 0, 0),
       (32, 2, 'SQngPnusk5', '2022-05-15 09:39:24', NULL, 0, 0),
       (33, 2, 'WAWi45qPNi', '2022-06-12 18:11:07', NULL, 0, 0),
       (34, 3, 'OLw3phMp9v', '2022-05-15 09:39:36', NULL, 0, 0),
       (35, 3, 'vncqDEy3Iy', '2022-06-04 03:20:14', NULL, 0, 0),
       (36, 3, 'WOEgilrxIt', '2022-05-30 14:45:08', NULL, 0, 0),
       (37, 1, 'EMqQv6XXek', '2022-05-30 11:39:30', NULL, 0, 0),
       (38, 2, '9nKXiWCqbg', '2022-06-01 13:48:25', NULL, 0, 0),
       (39, 2, '5pAw5pxWOy', '2022-05-20 00:52:37', NULL, 0, 0),
       (40, 2, 'D9Her74EKS', '2022-05-24 20:08:32', NULL, 0, 0),
       (41, 1, '9zhOSRkgJL', '2022-05-15 09:36:54', NULL, 1, 0),
       (42, 2, 'bX83YFJmbE', '2022-05-11 18:31:24', NULL, 0, 0),
       (43, 1, 'WVYx7SWY7Y', '2022-05-19 00:43:10', NULL, 0, 0),
       (44, 1, 'Yx4a7BOZzq', '2022-05-12 00:45:24', NULL, 0, 0),
       (45, 2, 'yZ3hCs9BV7', '2022-06-01 12:29:48', NULL, 0, 0),
       (46, 2, 'kH73y9Ya7h', '2022-05-20 22:13:05', NULL, 0, 0),
       (47, 2, '7Qa75026NB', '2022-05-31 11:15:47', NULL, 0, 0),
       (48, 2, '1f5KZKZW2V', '2022-05-23 14:31:01', NULL, 0, 0),
       (49, 2, '1gtymmWytc', '2022-05-16 00:33:26', NULL, 0, 0),
       (50, 1, 'KuLJeI8hii', '2022-05-26 08:57:21', NULL, 0, 0),
       (51, 2, 'meHPact9Qc', '2022-06-13 03:13:50', NULL, 0, 0),
       (52, 2, 'BBb69gKJPx', '2022-05-21 09:38:22', NULL, 0, 0),
       (53, 1, 'ZOqpX1u6tQ', '2022-06-04 06:27:15', NULL, 0, 0),
       (54, 2, '1qwerty', '2022-06-14 12:26:32', NULL, 0, 0);
/*!40000 ALTER TABLE `stok_fuel`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `transaction_list`
--

DROP TABLE IF EXISTS `transaction_list`;
/*!50001 DROP VIEW IF EXISTS `transaction_list`*/;
SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `transaction_list`
(
    `id_transaksi`   tinyint NOT NULL,
    `id_stock`       tinyint NOT NULL,
    `tgl_transaksi`  tinyint NOT NULL,
    `serial_tong`    tinyint NOT NULL,
    `NAMA_MERK`      tinyint NOT NULL,
    `id_admin`       tinyint NOT NULL,
    `username`       tinyint NOT NULL,
    `id_vessel`      tinyint NOT NULL,
    `nama_vessel`    tinyint NOT NULL,
    `tipe_transaksi` tinyint NOT NULL
) ENGINE = MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi`
(
    `id_transaksi`      int(11)   NOT NULL AUTO_INCREMENT,
    `id_stock`          int(11)        DEFAULT NULL,
    `id_admin`          int(11)        DEFAULT NULL,
    `id_vessel`         int(11)        DEFAULT NULL,
    `tipe_transaksi`    varchar(3)     DEFAULT NULL,
    `tanggal_transaksi` timestamp NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id_transaksi`),
    KEY `FK_TRANSAKS_MELAKUKAN_VESSEL` (`id_vessel`),
    KEY `FK_TRANSAKS_MENCATAT_ADMIN` (`id_admin`),
    KEY `FK_MENGAMBIL_STOK` (`id_stock`),
    CONSTRAINT `FK_TRANSAKS_MELAKUKAN_VESSEL` FOREIGN KEY (`id_vessel`) REFERENCES `vessel` (`id_vessel`),
    CONSTRAINT `FK_TRANSAKS_MENCATAT_ADMIN` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
    CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_stock`) REFERENCES `stok_fuel` (`item_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 53
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi`
    DISABLE KEYS */;
INSERT INTO `transaksi`
VALUES (1, 1, 1, NULL, 'in', '2022-06-10 01:41:36'),
       (2, 2, 1, NULL, 'in', '2022-06-10 01:54:09'),
       (3, 3, 1, NULL, 'in', '2022-06-13 07:09:07'),
       (4, 4, 1, NULL, 'in', '2022-05-23 15:16:14'),
       (5, 5, 1, NULL, 'in', '2022-06-04 07:41:08'),
       (6, 6, 1, NULL, 'in', '2022-05-31 13:48:22'),
       (7, 7, 1, NULL, 'in', '2022-05-19 07:11:40'),
       (8, 8, 1, NULL, 'in', '2022-05-31 19:46:44'),
       (9, 9, 1, NULL, 'in', '2022-05-17 23:33:29'),
       (10, 10, 1, NULL, 'in', '2022-05-15 11:50:21'),
       (11, 11, 1, NULL, 'in', '2022-05-18 10:43:26'),
       (12, 12, 1, NULL, 'in', '2022-06-02 21:38:26'),
       (13, 13, 1, NULL, 'in', '2022-05-30 22:42:24'),
       (14, 14, 1, NULL, 'in', '2022-05-31 06:26:20'),
       (15, 15, 1, NULL, 'in', '2022-05-16 22:26:53'),
       (16, 16, 1, NULL, 'in', '2022-06-11 16:34:01'),
       (17, 17, 1, NULL, 'in', '2022-05-28 20:05:06'),
       (18, 18, 1, NULL, 'in', '2022-05-21 19:30:20'),
       (19, 19, 1, NULL, 'in', '2022-05-18 01:20:19'),
       (20, 20, 1, NULL, 'in', '2022-05-14 11:29:15'),
       (21, 21, 1, NULL, 'in', '2022-06-04 22:43:34'),
       (22, 22, 1, NULL, 'in', '2022-05-18 12:52:12'),
       (23, 23, 1, NULL, 'in', '2022-05-30 00:45:06'),
       (24, 24, 1, NULL, 'in', '2022-06-13 22:42:03'),
       (25, 25, 1, NULL, 'in', '2022-05-23 18:31:59'),
       (26, 26, 1, NULL, 'in', '2022-06-07 09:22:14'),
       (27, 27, 1, NULL, 'in', '2022-06-01 08:06:45'),
       (28, 28, 1, NULL, 'in', '2022-05-24 00:32:53'),
       (29, 29, 1, NULL, 'in', '2022-06-01 12:57:12'),
       (30, 30, 1, NULL, 'in', '2022-05-22 02:25:42'),
       (31, 31, 1, NULL, 'in', '2022-05-12 02:41:31'),
       (32, 32, 1, NULL, 'in', '2022-05-15 09:39:24'),
       (33, 33, 1, NULL, 'in', '2022-06-12 18:11:07'),
       (34, 34, 1, NULL, 'in', '2022-05-15 09:39:36'),
       (35, 35, 1, NULL, 'in', '2022-06-04 03:20:14'),
       (36, 36, 1, NULL, 'in', '2022-05-30 14:45:08'),
       (37, 37, 1, NULL, 'in', '2022-05-30 11:39:30'),
       (38, 38, 1, NULL, 'in', '2022-06-01 13:48:25'),
       (39, 39, 1, NULL, 'in', '2022-05-20 00:52:37'),
       (40, 40, 1, NULL, 'in', '2022-05-24 20:08:32'),
       (41, 41, 1, NULL, 'in', '2022-05-15 09:36:54'),
       (42, 42, 1, NULL, 'in', '2022-05-11 18:31:24'),
       (43, 43, 1, NULL, 'in', '2022-05-19 00:43:10'),
       (44, 44, 1, NULL, 'in', '2022-05-12 00:45:24'),
       (45, 45, 1, NULL, 'in', '2022-06-01 12:29:48'),
       (46, 46, 1, NULL, 'in', '2022-05-20 22:13:05'),
       (47, 47, 1, NULL, 'in', '2022-05-31 11:15:47'),
       (48, 48, 1, NULL, 'in', '2022-05-23 14:31:01'),
       (49, 49, 1, NULL, 'in', '2022-05-18 01:20:19'),
       (50, 50, 1, NULL, 'in', '2022-06-10 01:41:36'),
       (51, 4, 1, 3, 'out', '2022-06-14 12:11:59'),
       (52, 54, 1, NULL, 'in', '2022-06-14 12:26:32');
/*!40000 ALTER TABLE `transaksi`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vessel`
--

DROP TABLE IF EXISTS `vessel`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vessel`
(
    `id_vessel`              int(11) NOT NULL AUTO_INCREMENT,
    `id_company`             int(11)     DEFAULT NULL,
    `nama_vessel`            varchar(20) DEFAULT NULL,
    `vs_tanggal_ditambahkan` datetime    DEFAULT current_timestamp(),
    `vs_tanggal_dihapus`     datetime    DEFAULT NULL,
    `vs_active_status`       tinyint(1)  DEFAULT 1,
    PRIMARY KEY (`id_vessel`),
    KEY `FK_VESSEL_MEMILIKI_COMPANY` (`id_company`),
    CONSTRAINT `FK_VESSEL_MEMILIKI_COMPANY` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vessel`
--

LOCK TABLES `vessel` WRITE;
/*!40000 ALTER TABLE `vessel`
    DISABLE KEYS */;
INSERT INTO `vessel`
VALUES (1, 1, 'USV CRYSTAL', '2022-04-25 12:13:19', NULL, 1),
       (2, 3, 'RMS Titanic 2021', '2022-05-31 07:49:40', '2022-05-31 13:15:43', 0),
       (3, 1, 'RMS Crystal', '2022-06-13 07:07:41', NULL, 1),
       (4, 3, 'Filan 1714', '2022-06-13 07:08:02', NULL, 1),
       (5, 41, 'Joe Stars', '2022-06-13 09:34:42', NULL, 1);
/*!40000 ALTER TABLE `vessel`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vessel_list`
--

DROP TABLE IF EXISTS `vessel_list`;
/*!50001 DROP VIEW IF EXISTS `vessel_list`*/;
SET @saved_cs_client = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vessel_list`
(
    `id_vessel`              tinyint NOT NULL,
    `id_company`             tinyint NOT NULL,
    `nama_vessel`            tinyint NOT NULL,
    `vs_tanggal_ditambahkan` tinyint NOT NULL,
    `vs_tanggal_dihapus`     tinyint NOT NULL,
    `vs_active_status`       tinyint NOT NULL,
    `company_name`           tinyint NOT NULL
) ENGINE = MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `stock_list`
--

/*!50001 DROP TABLE IF EXISTS `stock_list`*/;
/*!50001 DROP VIEW IF EXISTS `stock_list`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM = UNDEFINED */ /*!50013 DEFINER =`root`@`%` SQL SECURITY DEFINER */ /*!50001 VIEW `stock_list` AS
select `s`.`item_id`                   AS `item_id`,
       `s`.`serial_tong`               AS `serial_tong`,
       `m`.`NAMA_MERK`                 AS `NAMA_MERK`,
       `s`.`stock_tanggal_ditambahkan` AS `stock_tanggal_ditambahkan`
from (`stok_fuel` `s` left join `merk_fuel` `m` on (`s`.`id_merk` = `m`.`ID_MERK`))
where `s`.`is_transaction` <> 1
  and `s`.`is_deleted` <> 1
        */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;

--
-- Final view structure for view `transaction_list`
--

/*!50001 DROP TABLE IF EXISTS `transaction_list`*/;
/*!50001 DROP VIEW IF EXISTS `transaction_list`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM = UNDEFINED */ /*!50013 DEFINER =`root`@`%` SQL SECURITY DEFINER */ /*!50001 VIEW `transaction_list` AS
select `t`.`id_transaksi`      AS `id_transaksi`,
       `t`.`id_stock`          AS `id_stock`,
       `t`.`tanggal_transaksi` AS `tgl_transaksi`,
       `sf`.`serial_tong`      AS `serial_tong`,
       `mf`.`NAMA_MERK`        AS `NAMA_MERK`,
       `t`.`id_admin`          AS `id_admin`,
       `a`.`username`          AS `username`,
       `t`.`id_vessel`         AS `id_vessel`,
       `v`.`nama_vessel`       AS `nama_vessel`,
       `t`.`tipe_transaksi`    AS `tipe_transaksi`
from ((((`transaksi` `t` left join `stok_fuel` `sf` on (`sf`.`item_id` = `t`.`id_stock`)) left join `merk_fuel` `mf`
        on (`mf`.`ID_MERK` = `sf`.`id_merk`)) left join `admin` `a`
       on (`t`.`id_admin` = `a`.`id_admin`)) left join `vessel` `v` on (`t`.`id_vessel` = `v`.`id_vessel`))
        */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;

--
-- Final view structure for view `vessel_list`
--

/*!50001 DROP TABLE IF EXISTS `vessel_list`*/;
/*!50001 DROP VIEW IF EXISTS `vessel_list`*/;
/*!50001 SET @saved_cs_client = @@character_set_client */;
/*!50001 SET @saved_cs_results = @@character_set_results */;
/*!50001 SET @saved_col_connection = @@collation_connection */;
/*!50001 SET character_set_client = utf8mb4 */;
/*!50001 SET character_set_results = utf8mb4 */;
/*!50001 SET collation_connection = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM = UNDEFINED */ /*!50013 DEFINER =`root`@`%` SQL SECURITY DEFINER */ /*!50001 VIEW `vessel_list` AS
select `vs`.`id_vessel`              AS `id_vessel`,
       `vs`.`id_company`             AS `id_company`,
       `vs`.`nama_vessel`            AS `nama_vessel`,
       `vs`.`vs_tanggal_ditambahkan` AS `vs_tanggal_ditambahkan`,
       `vs`.`vs_tanggal_dihapus`     AS `vs_tanggal_dihapus`,
       `vs`.`vs_active_status`       AS `vs_active_status`,
       `cm`.`company_name`           AS `company_name`
from (`vessel` `vs` left join `company` `cm` on (`vs`.`id_company` = `cm`.`id_company`))
where `vs`.`vs_active_status` = 1
        */;
/*!50001 SET character_set_client = @saved_cs_client */;
/*!50001 SET character_set_results = @saved_cs_results */;
/*!50001 SET collation_connection = @saved_col_connection */;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23  8:27:32
