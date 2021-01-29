-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2021 at 09:57 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmdstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbbarang`
--

CREATE TABLE `tbbarang` (
  `id` int(11) NOT NULL,
  `nama_brg` varchar(128) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `kategori` varchar(64) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbbarang`
--

INSERT INTO `tbbarang` (`id`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Kaos Polos Combad 30s Hitam', 'Kaos Polos Bahan 100% Combad 30s Warna Hitam', 'kaos', 35000, 9, 'cbd30s_hitam.jpg'),
(2, 'Kaos Polos Combad 30s Putih', 'Kaos Polos Bahan 100% Combad 30s Warna Putih', 'kaos', 35000, 10, 'cbd30s_putih.jpg'),
(3, 'Kaos Polos Combad 30s Marun', 'Kaos Polos Bahan 100% Combad 30s Warna Marun', 'kaos', 36000, 15, 'cbd30s_marun.jpg'),
(4, 'Kaos Polos Combad 30s Navy', 'Kaos Polos Bahan 100% Combad 30s Warna Navy', 'kaos', 35000, 6, 'cbd30s_Navy.jpg'),
(6, 'Jaket Hoodie Zipper Abu', 'Jaket Hoodie Zipper Polos Warna Abu Bahan Fleece', 'jaket', 120000, 6, 'zipper_abu1.png'),
(7, 'Jaket Hoodie Zipper Navy', 'Jaket Hoodie Zipper Polos Warna Navy Bahan Fleece', 'jaket', 125000, 8, 'zipper_navy1.png'),
(8, 'Jaket Hoodie Zipper Marun', 'Jaket Hoodie Zipper Polos Warna Marun Bahan Fleece', 'jaket', 125000, 8, 'zipper_maroon1.png'),
(9, 'Jaket Hoodie Zipper Hitam', 'Jaket Hoodie Zipper Polos Warna Hitam Bahan Fleece', 'jaket', 120000, 12, 'zipper_hitam1.png'),
(10, 'Celana Pendek Chinos Cream', 'Celana Pendek Chinos Cream Bahan Bagus, Jahitan Rapi dan Nyaman dipakai', 'celana pendek', 60000, 6, 'cp_chinos_cream1.png'),
(11, 'Celana Pendek Chinos Mocca', 'Celana Pendek Chinos Mocca Bahan Bagus, Jahitan Rapi dan Nyaman dipakai', 'celana pendek', 60000, 8, 'cp_chinos_cream1.png'),
(12, 'Celana Pendek Chinos Abu', 'Celana Pendek Chinos Abu Bahan Bagus, Jahitan Rapi dan Nyaman dipakai', 'celana pendek', 60000, 6, 'cp_chinos_abu1.png'),
(13, 'Celana Pendek Chinos Hitam', 'Celana Pendek Chinos HitamBahan Bagus, Jahitan Rapi dan Nyaman dipakai', 'celana pendek', 60000, 12, 'cp_chinos_hitam1.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbinvoice`
--

CREATE TABLE `tbinvoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `alamat` varchar(256) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbinvoice`
--

INSERT INTO `tbinvoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(7, 'Musthofa', 'Solo', '2021-01-25 13:33:07', '2021-01-26 13:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbpesanan`
--

CREATE TABLE `tbpesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(64) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbpesanan`
--

INSERT INTO `tbpesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(11, 7, 2, 'Kaos Polos Combad 30s Putih', 2, 35000, ''),
(12, 7, 7, 'Jaket Hoodie Zipper Navy', 1, 125000, '');

--
-- Triggers `tbpesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tbpesanan` FOR EACH ROW BEGIN
	UPDATE tbbarang SET stok = stok-NEW.jumlah
    WHERE id = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbuser`
--

CREATE TABLE `tbuser` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbuser`
--

INSERT INTO `tbuser` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', 'a', 1),
(2, 'user', 'user', 'a', 2),
(4, 'Musthofa', 'musthofa', 'a', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbbarang`
--
ALTER TABLE `tbbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbinvoice`
--
ALTER TABLE `tbinvoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbpesanan`
--
ALTER TABLE `tbpesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbbarang`
--
ALTER TABLE `tbbarang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbinvoice`
--
ALTER TABLE `tbinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbpesanan`
--
ALTER TABLE `tbpesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbuser`
--
ALTER TABLE `tbuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
