-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 172.17.0.2
-- Generation Time: Jun 10, 2022 at 03:26 AM
-- Server version: 8.0.29
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fuel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int NOT NULL,
  `username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_tanggal_ditambahkan` datetime DEFAULT CURRENT_TIMESTAMP,
  `admin_tanggal_dihapus` datetime DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `admin_tanggal_ditambahkan`, `admin_tanggal_dihapus`, `active_status`) VALUES
(1, 'crystal', 'fe4c0f30aa359c41d9f9a5f69c8c4192', '2022-04-25 15:13:26', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id_company` int NOT NULL,
  `company_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comp_tanggal_ditambahkan` datetime DEFAULT CURRENT_TIMESTAMP,
  `comp_tanggal_dihapus` datetime DEFAULT NULL,
  `comp_active_status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `company_name`, `alamat`, `comp_tanggal_ditambahkan`, `comp_tanggal_dihapus`, `comp_active_status`) VALUES
(1, 'Crystal Studios', 'Dublin, Ireland', '2022-04-25 12:02:17', NULL, 1),
(2, 'Parker Industries', 'New York, NY', '2022-05-29 12:03:10', NULL, 1),
(3, 'Filan Mobile Corp', 'Sligo, Ireland', '2022-05-31 04:41:34', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `merk_fuel`
--

CREATE TABLE `merk_fuel` (
  `ID_MERK` int NOT NULL,
  `NAMA_MERK` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MERK_TANGGAL_DITAMBAH` datetime DEFAULT CURRENT_TIMESTAMP,
  `MERK_TANGGAL_DIHAPUS` datetime DEFAULT NULL,
  `MERK_ACTIVE_STATUS` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merk_fuel`
--

INSERT INTO `merk_fuel` (`ID_MERK`, `NAMA_MERK`, `MERK_TANGGAL_DITAMBAH`, `MERK_TANGGAL_DIHAPUS`, `MERK_ACTIVE_STATUS`) VALUES
(1, 'Shell V+', '2022-06-03 14:15:29', NULL, 1),
(2, 'VR++', '2022-06-03 07:16:16', NULL, 1),
(3, 'Filan Plus', '2022-06-05 12:01:54', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stock_list`
-- (See below for the actual view)
--
CREATE TABLE `stock_list` (
`item_id` int
,`NAMA_MERK` varchar(10)
,`serial_tong` varchar(16)
,`stock_tanggal_ditambahkan` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `stok_fuel`
--

CREATE TABLE `stok_fuel` (
  `item_id` int NOT NULL,
  `id_merk` int DEFAULT NULL,
  `serial_tong` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `stock_tanggal_ditambahkan` datetime DEFAULT CURRENT_TIMESTAMP,
  `stock_tanggal_dihapus` datetime DEFAULT NULL,
  `is_transaction` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_fuel`
--

INSERT INTO `stok_fuel` (`item_id`, `id_merk`, `serial_tong`, `stock_tanggal_ditambahkan`, `stock_tanggal_dihapus`, `is_transaction`, `is_deleted`) VALUES
(1, 3, '140600', '2022-06-10 01:41:36', NULL, 1, 0),
(2, 2, '171400', '2022-06-10 01:54:09', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int NOT NULL,
  `id_stock` int DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  `id_vessel` int DEFAULT NULL,
  `tipe_transaksi` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal_transaksi` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_stock`, `id_admin`, `id_vessel`, `tipe_transaksi`, `tanggal_transaksi`) VALUES
(1, 1, 1, 1, 'out', '2022-06-10 02:40:41');

-- --------------------------------------------------------

--
-- Table structure for table `vessel`
--

CREATE TABLE `vessel` (
  `id_vessel` int NOT NULL,
  `id_company` int DEFAULT NULL,
  `nama_vessel` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vs_tanggal_ditambahkan` datetime DEFAULT CURRENT_TIMESTAMP,
  `vs_tanggal_dihapus` datetime DEFAULT NULL,
  `vs_active_status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vessel`
--

INSERT INTO `vessel` (`id_vessel`, `id_company`, `nama_vessel`, `vs_tanggal_ditambahkan`, `vs_tanggal_dihapus`, `vs_active_status`) VALUES
(1, 1, 'USV CRYSTAL', '2022-04-25 12:13:19', NULL, 1),
(2, 3, 'RMS Titanic 2021', '2022-05-31 07:49:40', '2022-05-31 13:15:43', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vessel_list`
-- (See below for the actual view)
--
CREATE TABLE `vessel_list` (
`company_name` varchar(20)
,`id_company` int
,`id_vessel` int
,`nama_vessel` varchar(20)
,`vs_active_status` tinyint(1)
,`vs_tanggal_dihapus` datetime
,`vs_tanggal_ditambahkan` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `stock_list`
--
DROP TABLE IF EXISTS `stock_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `stock_list`  AS SELECT `s`.`item_id` AS `item_id`, `s`.`serial_tong` AS `serial_tong`, `m`.`NAMA_MERK` AS `NAMA_MERK`, `s`.`stock_tanggal_ditambahkan` AS `stock_tanggal_ditambahkan` FROM (`stok_fuel` `s` left join `merk_fuel` `m` on((`s`.`id_merk` = `m`.`ID_MERK`))) WHERE ((`s`.`is_transaction` <> 1) AND (`s`.`is_deleted` <> 1))  ;

-- --------------------------------------------------------

--
-- Structure for view `vessel_list`
--
DROP TABLE IF EXISTS `vessel_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vessel_list`  AS SELECT `vs`.`id_vessel` AS `id_vessel`, `vs`.`id_company` AS `id_company`, `vs`.`nama_vessel` AS `nama_vessel`, `vs`.`vs_tanggal_ditambahkan` AS `vs_tanggal_ditambahkan`, `vs`.`vs_tanggal_dihapus` AS `vs_tanggal_dihapus`, `vs`.`vs_active_status` AS `vs_active_status`, `cm`.`company_name` AS `company_name` FROM (`vessel` `vs` left join `company` `cm` on((`vs`.`id_company` = `cm`.`id_company`))) WHERE (`vs`.`vs_active_status` = 1)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `admin_username_uindex` (`username`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id_company`);

--
-- Indexes for table `merk_fuel`
--
ALTER TABLE `merk_fuel`
  ADD PRIMARY KEY (`ID_MERK`);

--
-- Indexes for table `stok_fuel`
--
ALTER TABLE `stok_fuel`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `FK_STOK_FUE_MEMPUNYAI_MERK_FUE` (`id_merk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `FK_TRANSAKS_MELAKUKAN_VESSEL` (`id_vessel`),
  ADD KEY `FK_TRANSAKS_MENCATAT_ADMIN` (`id_admin`),
  ADD KEY `FK_MENGAMBIL_STOK` (`id_stock`);

--
-- Indexes for table `vessel`
--
ALTER TABLE `vessel`
  ADD PRIMARY KEY (`id_vessel`),
  ADD KEY `FK_VESSEL_MEMILIKI_COMPANY` (`id_company`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id_company` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `merk_fuel`
--
ALTER TABLE `merk_fuel`
  MODIFY `ID_MERK` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stok_fuel`
--
ALTER TABLE `stok_fuel`
  MODIFY `item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vessel`
--
ALTER TABLE `vessel`
  MODIFY `id_vessel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stok_fuel`
--
ALTER TABLE `stok_fuel`
  ADD CONSTRAINT `FK_STOK_FUE_MEMPUNYAI_MERK_FUE` FOREIGN KEY (`id_merk`) REFERENCES `merk_fuel` (`ID_MERK`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_TRANSAKS_MELAKUKAN_VESSEL` FOREIGN KEY (`id_vessel`) REFERENCES `vessel` (`id_vessel`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_TRANSAKS_MENCATAT_ADMIN` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_stock`) REFERENCES `stok_fuel` (`item_id`);

--
-- Constraints for table `vessel`
--
ALTER TABLE `vessel`
  ADD CONSTRAINT `FK_VESSEL_MEMILIKI_COMPANY` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
