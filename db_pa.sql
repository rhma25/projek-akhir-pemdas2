-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2024 at 02:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pa`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangg`
--

CREATE TABLE `barangg` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `kategori` enum('makanan hewan','kandang hewan','tempat makan hewan','aksesoris') DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangg`
--

INSERT INTO `barangg` (`kode_barang`, `nama_barang`, `kategori`, `stok`, `harga`) VALUES
('BR001', 'Kandang Kucing Portable', 'kandang hewan', 5, 250000),
('BR002', 'Whiskas Dry Food Adult Tuna', 'makanan hewan', 37, 90000),
('BR003', 'Kalung Anjing Anti Kutu', 'aksesoris', 15, 50000),
('BR004', 'Me-O Wet Food Tuna', 'makanan hewan', 23, 25000),
('BR005', 'Mangkuk Plastik', 'tempat makan hewan', 10, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawaii`
--

CREATE TABLE `pegawaii` (
  `id_pegawai` varchar(20) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `alamat_pegawai` varchar(100) DEFAULT NULL,
  `no_telepon` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawaii`
--

INSERT INTO `pegawaii` (`id_pegawai`, `nama_pegawai`, `alamat_pegawai`, `no_telepon`) VALUES
('PEG001', 'asep', 'cendana', '085688315399'),
('PEG002', 'udinn', 'kayu tangi', '082354784122'),
('PEG003', 'nasa', 'Jl. Pangeran', '083411997723'),
('PEG004', 'Intan', 'Flamboyan', '084567882213'),
('PEG005', 'agus', 'Pelaihari', '082256678433'),
('PEG006', 'cecep', 'Sultan Adam', '083577213562');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `NoFaktur` varchar(20) NOT NULL,
  `Tanggal` varchar(20) DEFAULT NULL,
  `id_pegawai` varchar(20) DEFAULT NULL,
  `nama_customer` varchar(20) DEFAULT NULL,
  `total_beli` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`NoFaktur`, `Tanggal`, `id_pegawai`, `nama_customer`, `total_beli`) VALUES
('TR0002', '18-12-2024', 'PEG004', 'mamat', 930000),
('TR0003', '18-12-2024', 'PEG001', 'asep', 375000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualanrinci`
--

CREATE TABLE `penjualanrinci` (
  `NoFaktur` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualanrinci`
--

INSERT INTO `penjualanrinci` (`NoFaktur`, `kode_barang`, `nama_barang`, `jumlah`, `harga`, `total`) VALUES
('TR0002', 'BR001', 'Kandang Kucing Portable', 3, 250000, 750000),
('TR0003', 'BR004', 'Me-O Wet Food Tuna', 2, 25000, 50000),
('TR0003', 'BR001', 'Kandang Kucing Portable', 1, 250000, 250000),
('TR0003', 'BR005', 'Mangkuk Plastik', 5, 15000, 75000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_telpon` varchar(100) NOT NULL,
  `saldo_user` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `no_telpon`, `saldo_user`) VALUES
('rahma', '25', '082256678433', 50000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangg`
--
ALTER TABLE `barangg`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `pegawaii`
--
ALTER TABLE `pegawaii`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`NoFaktur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
