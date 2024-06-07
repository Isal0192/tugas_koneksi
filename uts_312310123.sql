-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2024 at 04:44 AM
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
-- Database: `uts_312310123`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `totalBiayaPesanan` (`id_pesanan` INT) RETURNS INT(11) DETERMINISTIC BEGIN
DECLARE total_biaya int;
    
    SELECT SUM(l.harga * dp.jumlah)
    INTO total_biaya
    FROM detail_pesanan dp
    JOIN layanan l on dp.id_layanan =l.id_layanan
    WHERE dp.id_pesanan = id_pesanan;
    
    RETURN total_biaya;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_layanan` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id_pesanan`, `id_layanan`, `jumlah`) VALUES
(5, 3, 1),
(6, 3, 2),
(7, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Keanggotaan`
--

CREATE TABLE `Keanggotaan` (
  `id_keanggotaan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `nama_keanggotaan` varchar(50) NOT NULL,
  `tanggal_bergabung` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Keanggotaan`
--

INSERT INTO `Keanggotaan` (`id_keanggotaan`, `id_pelanggan`, `nama_keanggotaan`, `tanggal_bergabung`) VALUES
(1, 4, 'epic', '2023-01-01'),
(2, 3, 'leggen', '2023-09-02'),
(3, 1, 'mitical gelory', '2023-09-03');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(11) NOT NULL,
  `nama_layanan` varchar(30) NOT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `nama_layanan`, `harga`) VALUES
(1, 'cetak buku', 700000),
(2, 'cetak poster', 72000),
(3, 'cetak foto', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `nomer_telpon` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `jabatan`, `nomer_telpon`) VALUES
(3, 'citra laras', 'staff', 127362799),
(4, 'agus bangbang', 'manager', 12310123),
(5, 'bangbang', 'kasir', 39223422);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nomer_telpon` varchar(20) DEFAULT NULL,
  `setatus_keanggotaan` varchar(30) DEFAULT NULL,
  `tanggal_bergabung` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `tanggal_lahir`, `nomer_telpon`, `setatus_keanggotaan`, `tanggal_bergabung`) VALUES
(1, 'saya faisal', 'jalan rawa bengkok', '2004-05-13', '83879865505', NULL, NULL),
(2, 'carlie chaplin', 'jalan bapak saya', '2004-12-20', '1312310123', NULL, NULL),
(3, 'erling haaland', 'jalan yang lurus', '2004-08-12', '1312310202', NULL, NULL),
(4, 'maria zhang', 'jalan negara bumi', '2003-09-29', '8232124543', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Pesanan`
--

CREATE TABLE `Pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tanggal_pesanan` date NOT NULL,
  `total_biaya` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Pesanan`
--

INSERT INTO `Pesanan` (`id_pesanan`, `id_pelanggan`, `id_pegawai`, `tanggal_pesanan`, `total_biaya`, `status`) VALUES
(5, 1, 3, '2024-05-01', 5000, 'berhasil'),
(6, 2, 5, '2024-05-09', 10000, 'berhasil'),
(7, 4, 5, '2024-05-09', 10000, 'berhasil'),
(8, 3, 4, '2024-05-09', 82000, 'berhasil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_pesanan`,`id_layanan`),
  ADD KEY `id_layanan` (`id_layanan`);

--
-- Indexes for table `Keanggotaan`
--
ALTER TABLE `Keanggotaan`
  ADD PRIMARY KEY (`id_keanggotaan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `nomer_telpon` (`nomer_telpon`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `nomer_telpon` (`nomer_telpon`);

--
-- Indexes for table `Pesanan`
--
ALTER TABLE `Pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Keanggotaan`
--
ALTER TABLE `Keanggotaan`
  MODIFY `id_keanggotaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Pesanan`
--
ALTER TABLE `Pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `Pesanan` (`id_pesanan`),
  ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id_layanan`);

--
-- Constraints for table `Keanggotaan`
--
ALTER TABLE `Keanggotaan`
  ADD CONSTRAINT `Keanggotaan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `Pesanan`
--
ALTER TABLE `Pesanan`
  ADD CONSTRAINT `Pesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `Pesanan_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
