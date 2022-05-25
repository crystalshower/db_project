-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.28 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table fuel_db.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `admin_tanggal_ditambahkan` datetime DEFAULT CURRENT_TIMESTAMP,
  `admin_tanggal_dihapus` datetime DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `admin_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fuel_db.admin: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id_admin`, `username`, `password`, `admin_tanggal_ditambahkan`, `admin_tanggal_dihapus`, `active_status`) VALUES
	(1, 'crystal', 'fe4c0f30aa359c41d9f9a5f69c8c4192', '2022-04-25 15:13:26', NULL, 1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table fuel_db.company
CREATE TABLE IF NOT EXISTS `company` (
  `id_company` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL,
  `comp_tanggal_ditambahkan` datetime DEFAULT CURRENT_TIMESTAMP,
  `comp_tanggal_dihapus` datetime DEFAULT NULL,
  `comp_active_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_company`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fuel_db.company: ~0 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id_company`, `company_name`, `alamat`, `comp_tanggal_ditambahkan`, `comp_tanggal_dihapus`, `comp_active_status`) VALUES
	(1, 'Crystal Studios', 'Dublin, Ireland', '2022-04-25 12:02:17', NULL, 1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Dumping structure for table fuel_db.merk_fuel
CREATE TABLE IF NOT EXISTS `merk_fuel` (
  `ID_MERK` int NOT NULL,
  `NAMA_MERK` varchar(10) DEFAULT NULL,
  `MERK_TANGGAL_DITAMBAH` datetime DEFAULT NULL,
  `MERK_TANGGAL_DIHAPUS` datetime DEFAULT NULL,
  `MERK_ACTIVE_STATUS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_MERK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fuel_db.merk_fuel: ~0 rows (approximately)
/*!40000 ALTER TABLE `merk_fuel` DISABLE KEYS */;
/*!40000 ALTER TABLE `merk_fuel` ENABLE KEYS */;

-- Dumping structure for table fuel_db.stok_fuel
CREATE TABLE IF NOT EXISTS `stok_fuel` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `id_merk` int DEFAULT NULL,
  `serial_tong` varchar(16) NOT NULL,
  `stock_tanggal_ditambahkan` datetime DEFAULT CURRENT_TIMESTAMP,
  `stock_tanggal_dihapus` datetime DEFAULT NULL,
  `is_transaction` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_STOK_FUE_MEMPUNYAI_MERK_FUE` (`id_merk`),
  CONSTRAINT `FK_STOK_FUE_MEMPUNYAI_MERK_FUE` FOREIGN KEY (`id_merk`) REFERENCES `merk_fuel` (`ID_MERK`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fuel_db.stok_fuel: ~0 rows (approximately)
/*!40000 ALTER TABLE `stok_fuel` DISABLE KEYS */;
/*!40000 ALTER TABLE `stok_fuel` ENABLE KEYS */;

-- Dumping structure for table fuel_db.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` int NOT NULL AUTO_INCREMENT,
  `id_admin` int DEFAULT NULL,
  `id_vessel` int DEFAULT NULL,
  `tipe_transaksi` varchar(3) DEFAULT NULL,
  `tanggal_transaksi` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `FK_TRANSAKS_MELAKUKAN_VESSEL` (`id_vessel`),
  KEY `FK_TRANSAKS_MENCATAT_ADMIN` (`id_admin`),
  CONSTRAINT `FK_TRANSAKS_MELAKUKAN_VESSEL` FOREIGN KEY (`id_vessel`) REFERENCES `vessel` (`id_vessel`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TRANSAKS_MENCATAT_ADMIN` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fuel_db.transaksi: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;

-- Dumping structure for table fuel_db.vessel
CREATE TABLE IF NOT EXISTS `vessel` (
  `id_vessel` int NOT NULL AUTO_INCREMENT,
  `id_company` int DEFAULT NULL,
  `nama_vessel` varchar(20) DEFAULT NULL,
  `vs_tanggal_ditambahkan` datetime DEFAULT CURRENT_TIMESTAMP,
  `vs_tanggal_dihapus` datetime DEFAULT NULL,
  `vs_active_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_vessel`),
  KEY `FK_VESSEL_MEMILIKI_COMPANY` (`id_company`),
  CONSTRAINT `FK_VESSEL_MEMILIKI_COMPANY` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fuel_db.vessel: ~0 rows (approximately)
/*!40000 ALTER TABLE `vessel` DISABLE KEYS */;
INSERT INTO `vessel` (`id_vessel`, `id_company`, `nama_vessel`, `vs_tanggal_ditambahkan`, `vs_tanggal_dihapus`, `vs_active_status`) VALUES
	(1, 1, 'USV CRYSTAL', '2022-04-25 12:13:19', NULL, 1);
/*!40000 ALTER TABLE `vessel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
