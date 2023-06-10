-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 03:48 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts_pbo`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode` smallint UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` float NOT NULL
);

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode`, `nama`, `harga`) VALUES
(1111, 'Chitato', 10000),
(1112, 'Ginjal', 20000),
(1114, 'Hati', 69000),
(1115, 'Lays', 12000),
(1116, 'Indomie', 3000),
(1117, 'Popmie', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `item_in_transaksi`
--

CREATE TABLE `item_in_transaksi` (
  `kode` smallint UNSIGNED NOT NULL,
  `jumlah` int NOT NULL,
  `no_transaksi` int NOT NULL
);

--
-- Dumping data for table `item_in_transaksi`
--

INSERT INTO `item_in_transaksi` (`kode`, `jumlah`, `no_transaksi`) VALUES
(1111, 9, 2),
(1111, 6, 3),
(1112, 4, 3),
(1111, 1, 4),
(1111, 5, 5),
(1111, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password_hash` text NOT NULL
);

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password_hash`) VALUES
('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no` int NOT NULL,
  `totalBelanja` float NOT NULL,
  `dibayar` float NOT NULL,
  `kembalian` float NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no`, `totalBelanja`, `dibayar`, `kembalian`, `waktu`) VALUES
(1, 346000, 1500000, 1154000, '2023-04-26 02:38:18'),
(2, 90000, 100000, 10000, '2023-04-26 02:39:15'),
(3, 140000, 150000, 10000, '2023-04-26 04:11:11'),
(4, 10000, 20000, 10000, '2023-04-27 05:45:01'),
(5, 50000, 60000, 10000, '2023-04-27 00:59:19'),
(6, 60000, 70000, 10000, '2023-04-27 01:19:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `item_in_transaksi`
--
ALTER TABLE `item_in_transaksi`
  ADD KEY `item_ibfk_1` (`no_transaksi`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_in_transaksi`
--
ALTER TABLE `item_in_transaksi`
  ADD CONSTRAINT `item_in_transaksi_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `barang` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_in_transaksi_ibfk_3` FOREIGN KEY (`no_transaksi`) REFERENCES `transaksi` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
