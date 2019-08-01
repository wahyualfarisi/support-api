-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 01, 2019 at 10:21 AM
-- Server version: 10.2.23-MariaDB
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u439625161_spprt`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `email_admin` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `akses` varchar(10) NOT NULL,
  `log_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`email_admin`, `name`, `password`, `akses`, `log_login`) VALUES
('catur@support.com', 'Catur Hadi Gunawan', '21232f297a57a5a743894a0e4a801fc3', '1', '0000-00-00 00:00:00'),
('eko@support.com', 'Eko prasetyo', '21232f297a57a5a743894a0e4a801fc3', '', '0000-00-00 00:00:00'),
('fahmi@support.com', 'Fahmi', '21232f297a57a5a743894a0e4a801fc3', '', '0000-00-00 00:00:00'),
('sesar@support.com', 'Sesar', '21232f297a57a5a743894a0e4a801fc3', '', '0000-00-00 00:00:00'),
('subagyo@support.com', 'subagio', '21232f297a57a5a743894a0e4a801fc3', '', '0000-00-00 00:00:00'),
('wahyu@support.com', 'Wahyu Alfarisi', 'e83af884a75b86a6ae42dc0a8d218f06', '1', '2019-02-14 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bagian`
--

CREATE TABLE `tbl_bagian` (
  `id_bagian` int(11) NOT NULL,
  `kode_lokasi` varchar(30) NOT NULL,
  `bagian` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bagian`
--

INSERT INTO `tbl_bagian` (`id_bagian`, `kode_lokasi`, `bagian`) VALUES
(1, 'mersel', 'Perpustakaan'),
(2, 'mersel', 'Kendaraan'),
(3, 'mersel', 'Staff Khusus'),
(4, 'mersel', 'Perlengkapan'),
(5, 'mersel', 'Bangunan'),
(6, 'mersel', 'Ruang Deputi Administrasi'),
(7, 'mersel', 'Protokol'),
(8, 'mersel', 'Perjalanan'),
(9, 'mersel', 'KIP'),
(11, 'mersel', 'Kepegawaian'),
(12, 'mersel', 'Notulen'),
(13, 'mersel', 'Keuangan'),
(14, 'mersel', 'BMN'),
(15, 'merut', 'Kesra'),
(16, 'mersel', 'Kesra'),
(17, 'merut', 'Staff Khusus'),
(18, 'merut', 'Tim Ahli'),
(19, 'merut', 'Sespri'),
(20, 'merut', 'Protokol'),
(21, 'merut', 'Seswapres'),
(22, 'merut', 'Wapres RI'),
(23, 'merut', 'Staff Tim Ahli'),
(24, 'merut', 'Ekonomi'),
(25, 'merut', 'Deputi'),
(26, 'merut', 'Staff SES'),
(27, 'merut', 'DOKPRI'),
(28, 'merut', 'Asdep'),
(29, 'mersel', 'Ekonomi'),
(30, 'mersel', 'Kendaraan'),
(31, 'mersel', 'DOKPRI'),
(32, 'mersel', 'RUMGA'),
(33, 'mersel', 'Perencanaan'),
(34, 'mersel', 'DKP'),
(35, 'mersel', 'Asdep Hublu'),
(36, 'mersel', 'Politik'),
(37, 'mersel', 'Persuratan'),
(38, 'mersel', 'Sespri'),
(39, 'mersel', 'Ajudan'),
(40, 'mersel', 'Poliklinik');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kegiatan`
--

CREATE TABLE `tbl_kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `tanggal_permintaan` date NOT NULL,
  `user` varchar(100) NOT NULL,
  `id_bagian` int(30) NOT NULL,
  `keterangan` text NOT NULL,
  `email_admin` varchar(30) NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kegiatan`
--

INSERT INTO `tbl_kegiatan` (`id_kegiatan`, `tanggal_permintaan`, `user`, `id_bagian`, `keterangan`, `email_admin`, `tanggal_selesai`, `createdAt`) VALUES
(24, '2019-03-12', 'Anisa ', 16, ' Install Aplikasi SISKA', 'wahyu@support.com', '2019-03-12', '2019-03-12 17:13:14'),
(25, '2019-03-12', 'Pipit', 7, 'Backup data , Pindah Komputer Baru', 'wahyu@support.com', '2019-03-12', '2019-03-12 17:14:00'),
(26, '2019-03-13', 'Susi', 11, ' Troubleshoot Printer', 'wahyu@support.com', '2019-03-13', '2019-03-13 02:17:30'),
(27, '2019-03-13', 'Deputi Administrasi', 6, 'Set Ruang rapat gedung 1 Lantai 2  ', 'wahyu@support.com', '2019-03-13', '2019-03-13 04:37:34'),
(28, '2019-03-13', 'Temmy', 11, ' Sharing Printer', 'subagyo@support.com', '2019-03-13', '2019-03-13 04:56:09'),
(29, '2019-03-12', 'Nuryani', 29, ' Install Software PC', 'eko@support.com', '2019-03-12', '2019-03-13 05:01:35'),
(30, '2019-03-13', 'Farid', 4, ' Troubleshoot PC', 'wahyu@support.com', '2019-03-13', '2019-03-13 07:24:28'),
(31, '2019-03-14', 'Titin', 29, ' Konek Printer Fotocopy', 'wahyu@support.com', '2019-03-14', '2019-03-14 03:09:08'),
(32, '2019-03-14', 'Evi', 12, 'Install Aplikasi Siska', 'wahyu@support.com', '2019-03-14', '2019-03-14 03:09:45'),
(33, '2019-03-14', 'Robby (Kabag Notulen)', 12, ' Pasang Printer', 'wahyu@support.com', '2019-03-14', '2019-03-14 07:54:08'),
(34, '2019-03-15', 'Catherine', 11, ' Sharing Printer', 'eko@support.com', '2019-03-15', '2019-03-15 07:59:48'),
(35, '2019-03-15', 'Koko', 16, 'Aktifasi OFFICE 2013', 'wahyu@support.com', '2019-03-15', '2019-03-15 08:01:24'),
(36, '2019-03-13', 'Otang Sudjana', 14, 'Instalasi Laptop INASGOC', 'eko@support.com', '2019-03-13', '2019-03-15 08:02:03'),
(37, '2019-03-15', 'Putri', 7, ' Backup komputer hotseat  && pindah komputer baru ', 'wahyu@support.com', '2019-03-15', '2019-03-15 08:05:11'),
(38, '2019-03-14', 'Eka Saputro', 29, ' Sharing Printer Warna', 'eko@support.com', '2019-03-14', '2019-03-15 15:24:38'),
(39, '2019-03-18', 'Puspita', 8, ' Set Rapat Gedung 2 Lantai 1', 'wahyu@support.com', '2019-03-18', '2019-03-18 07:18:48'),
(40, '2019-03-18', 'Romansen', 9, 'Troubleshoot PC', 'wahyu@support.com', '2019-03-18', '2019-03-18 07:19:19'),
(41, '2019-03-18', 'Dedi', 14, 'Reset Driver Printer', 'eko@support.com', '2019-03-18', '2019-03-18 08:09:17'),
(42, '2019-03-18', 'Adila palupi', 16, ' Pindah komputer , backup data ', 'wahyu@support.com', '2019-03-18', '2019-03-18 13:38:07'),
(43, '2019-03-18', 'Pak Diar', 16, 'Pindah komputer dan backup data', 'wahyu@support.com', '2019-03-18', '2019-03-18 13:38:52'),
(44, '2019-03-04', 'Yohanes', 9, ' Pengantian Power suplay baru\r\n', 'subagyo@support.com', '2019-03-04', '2019-03-19 05:35:35'),
(45, '2019-03-05', 'Purwono', 13, ' Pengantian Tinta Printer', 'subagyo@support.com', '2019-03-05', '2019-03-19 05:48:57'),
(46, '2019-03-19', 'Trisita Ridhawati (kasubid )', 16, ' Pindah Komputer dan backup data', 'wahyu@support.com', '2019-03-19', '2019-03-19 06:23:32'),
(47, '2019-03-19', 'Sutikno (Kabid)', 16, 'Pindah komputer dan backup data', 'wahyu@support.com', '2019-03-19', '2019-03-19 06:24:15'),
(48, '2019-03-06', 'Diar', 16, ' Cek Komputer Hang', 'subagyo@support.com', '2019-03-06', '2019-03-19 09:00:58'),
(49, '2019-03-11', 'Rio Jayusman', 29, ' Backup data Komputer\r\n', 'subagyo@support.com', '2019-03-11', '2019-03-19 09:53:49'),
(50, '2019-03-12', 'Titin  LS', 29, ' Cek Komputer Adapter Mati\r\n', 'subagyo@support.com', '2019-03-12', '2019-03-19 10:15:22'),
(51, '2019-03-12', 'Laptop', 29, 'Instal Driverpack & Office\r\n', 'subagyo@support.com', '2019-03-12', '2019-03-19 10:18:00'),
(52, '2019-03-19', 'Bangunan', 1, ' Seting TV gedung 3 lt 2, 17:00', 'subagyo@support.com', '2019-03-19', '2019-03-19 11:37:25'),
(53, '2019-03-21', 'Pak Rohim', 33, ' Pindah jalur Printer', 'wahyu@support.com', '2019-03-21', '2019-03-21 03:16:55'),
(54, '2019-03-21', 'Pak odie', 33, 'Sharing 7 PC ke printer perencanaan', 'wahyu@support.com', '2019-03-21', '2019-03-21 03:17:44'),
(55, '2019-03-21', 'Hasyim', 11, ' Rapat Di Gedung 2 Lantai 1 (Bimtek)', 'wahyu@support.com', '2019-03-21', '2019-03-21 07:29:49'),
(56, '2019-03-22', 'Wapres', 22, ' Rapat utama 1', 'sesar@support.com', '2019-03-22', '2019-03-22 06:14:17'),
(57, '2019-03-04', 'Novi', 19, ' Printer error', 'sesar@support.com', '2019-03-04', '2019-03-22 06:23:50'),
(58, '2019-03-05', 'Wapres', 22, 'Rapat utama 1', 'sesar@support.com', '2019-03-05', '2019-03-22 06:24:35'),
(59, '2019-03-05', 'Iskandar Mandji', 18, 'Printer error', 'sesar@support.com', '2019-03-05', '2019-03-22 06:25:19'),
(60, '2019-03-06', 'Wapres', 22, 'Rapat utama 1', 'sesar@support.com', '2019-03-06', '2019-03-22 06:26:09'),
(61, '2019-03-06', 'Satya', 17, 'Printer trouble', 'sesar@support.com', '2019-03-06', '2019-03-22 06:26:49'),
(62, '2019-03-08', 'Wijayanto', 17, 'Rapat lantai 2', 'sesar@support.com', '2019-03-08', '2019-03-22 06:27:30'),
(63, '2019-03-11', 'Wijayanto', 17, 'Rapat lantai 2', 'sesar@support.com', '2019-03-11', '2019-03-22 06:28:14'),
(64, '2019-03-13', 'Wijayanto', 17, 'Rapat lantai 2', 'sesar@support.com', '2019-03-13', '2019-03-22 06:28:43'),
(65, '2019-03-14', 'Sofyan Wanandi', 18, 'Rapat lantai 2', 'sesar@support.com', '2019-03-14', '2019-03-22 06:29:37'),
(66, '2019-03-18', 'Wijayanto', 17, 'Rapat lantai 2', 'sesar@support.com', '2019-03-18', '2019-03-22 06:30:23'),
(67, '2019-03-18', 'Wapres', 22, 'Rapat utama 1', 'sesar@support.com', '2019-03-18', '2019-03-22 06:30:52'),
(68, '2019-03-19', 'Sabryna ', 19, 'Cek printer', 'sesar@support.com', '2019-03-19', '2019-03-22 06:32:00'),
(69, '2019-03-21', 'Wijayanto', 17, 'Rapat lantai 2', 'sesar@support.com', '2019-03-21', '2019-03-22 06:32:38'),
(70, '2019-03-05', 'Reza', 20, ' Monitor komputer error', 'fahmi@support.com', '2019-03-05', '2019-03-22 06:35:07'),
(71, '2019-03-11', 'Wapres', 22, 'Rapat utama 1', 'fahmi@support.com', '2019-03-11', '2019-03-22 06:35:38'),
(72, '2019-03-14', 'Wijayanto', 22, 'Rapat lantai 2', 'fahmi@support.com', '2019-03-14', '2019-03-22 06:36:42'),
(73, '2019-03-18', 'Riri', 23, 'Printer trouble', 'fahmi@support.com', '2019-03-18', '2019-03-22 06:37:44'),
(74, '2019-03-18', 'Wapres ', 22, 'Rapat utama 1', 'fahmi@support.com', '2019-03-18', '2019-03-22 06:38:53'),
(75, '2019-03-19', 'Tedjo', 20, 'Cek printer ', 'fahmi@support.com', '2019-03-19', '2019-03-22 06:39:49'),
(76, '2019-03-25', 'Rizki', 14, ' RAM Error', 'eko@support.com', '2019-03-25', '2019-03-25 02:05:59'),
(77, '2019-03-22', 'Widodo', 2, 'Install Driver Printer', 'eko@support.com', '2019-03-22', '2019-03-25 02:07:12'),
(78, '2019-03-21', 'Faniagi', 33, 'Format FlashDrive', 'eko@support.com', '2019-03-21', '2019-03-25 02:08:21'),
(79, '2019-03-01', 'Angel', 33, 'Pasang Scanner Baru', 'eko@support.com', '2019-03-01', '2019-03-25 02:09:35'),
(80, '2019-03-04', 'Faniagi', 33, 'Pasang VGA Baru', 'eko@support.com', '2019-03-04', '2019-03-25 02:10:05'),
(81, '2019-03-22', 'Protokol', 7, ' Rakor di Gedung 3 Lantai 2', 'eko@support.com', '2019-03-22', '2019-03-25 02:11:50'),
(82, '2019-03-25', 'Budi', 8, ' Troubleshoot Printer', 'wahyu@support.com', '2019-03-25', '2019-03-25 14:58:57'),
(83, '2019-03-25', 'Pamuji', 4, 'Troubleshoot PC & Printer', 'wahyu@support.com', '2019-03-25', '2019-03-25 14:59:43'),
(84, '2019-03-14', 'Susi Handayani', 34, ' ', 'subagyo@support.com', '2019-03-14', '2019-03-26 02:54:42'),
(85, '2019-03-14', 'Susi Handayani', 34, ' Komputer Booting', 'subagyo@support.com', '2019-03-14', '2019-03-26 02:59:32'),
(86, '2019-03-15', 'Ety', 3, ' Cek Printer tidak bisa ngeprin\r\n', 'subagyo@support.com', '2019-03-15', '2019-03-26 03:02:04'),
(87, '2019-03-26', 'Rohim', 33, ' Sharing Printer', 'wahyu@support.com', '2019-03-26', '2019-03-26 10:40:49'),
(88, '2019-03-27', 'Retno', 7, ' Rapat kordinasi di gedung 2 lantai 1 .', 'wahyu@support.com', '2019-03-27', '2019-03-27 01:16:43'),
(89, '2019-03-27', 'Ani', 29, ' Scan Hardisk Komputer', 'wahyu@support.com', '2019-03-27', '2019-03-27 08:08:46'),
(90, '2019-03-27', 'Edi', 9, 'Troubleshoot PC', 'wahyu@support.com', '2019-03-27', '2019-03-27 08:09:11'),
(91, '2019-03-27', 'Sita', 16, 'Install Aplikasi Laptop inasgok', 'wahyu@support.com', '2019-03-27', '2019-03-27 08:09:44'),
(92, '2019-03-27', 'Erick Griwantara', 7, ' Stanby rapat Gedung 2 Lt 1', 'subagyo@support.com', '2019-03-27', '2019-03-27 08:13:10'),
(93, '2019-03-28', 'Wijayanto', 17, ' Rapat lantai 2', 'sesar@support.com', '2019-03-28', '2019-03-28 01:18:37'),
(94, '2019-03-27', 'Rohim', 13, ' Instalasi Laptop INASGOC', 'eko@support.com', '2019-03-27', '2019-03-28 01:27:57'),
(95, '2019-03-26', 'Adi Pramono', 4, 'Setting Browser', 'eko@support.com', '2019-03-26', '2019-03-28 01:30:14'),
(96, '2019-03-29', 'Wapres', 22, ' Rapat utama 1', 'sesar@support.com', '2019-03-29', '2019-03-29 01:14:22'),
(97, '2019-04-01', 'JK', 22, ' Rapat utama 1', 'sesar@support.com', '2019-04-01', '2019-04-01 01:24:37'),
(98, '2019-04-01', 'Sinto Weni', 36, ' PC Mati (Trouble shoot PC)', 'wahyu@support.com', '2019-04-01', '2019-04-01 04:04:33'),
(99, '2019-04-01', 'Eko Sunarwanto', 5, ' Sharing Printer FujiXerox', 'eko@support.com', '2019-04-01', '2019-04-01 08:36:41'),
(100, '2019-04-01', 'Adi Pramono', 4, 'Sharing Printer Warna', 'eko@support.com', '2019-04-01', '2019-04-01 08:37:15'),
(101, '2019-04-01', 'Endang', 9, 'Saluran Tinta Printer Bermasalah', 'eko@support.com', '2019-04-01', '2019-04-01 08:38:11'),
(102, '2019-04-01', 'Deputi Administrasi', 6, ' Printer jamming', 'eko@support.com', '2019-04-01', '2019-04-01 09:49:44'),
(103, '2019-04-02', 'TATI', 36, 'Aktivasi Office', 'wahyu@support.com', '2019-04-02', '2019-04-02 13:16:56'),
(104, '2019-04-02', 'TATI', 36, 'Aktivasi Office', 'wahyu@support.com', '2019-04-02', '2019-04-02 13:17:07'),
(105, '2019-04-02', 'TATI', 36, 'Aktivasi Office', 'wahyu@support.com', '2019-04-02', '2019-04-02 13:17:37'),
(106, '2019-04-02', 'Faniagi', 33, ' Install Driver VGA', 'eko@support.com', '2019-04-02', '2019-04-02 10:00:06'),
(107, '2019-04-02', 'Imam Sudrajat', 33, 'Deaktivasi Windows Search', 'eko@support.com', '2019-04-02', '2019-04-02 10:01:31'),
(108, '2019-04-08', 'JK', 22, ' Rapat utama 1', 'sesar@support.com', '2019-04-08', '2019-04-08 01:57:56'),
(109, '2019-04-08', 'Ayu pudianingtias', 34, ' Hardware problem', 'subagyo@support.com', '2019-04-08', '2019-04-08 03:25:10'),
(110, '2019-04-08', 'Faniagi', 33, ' Instalasi Software Editing Video', 'eko@support.com', '2019-04-08', '2019-04-09 01:54:01'),
(111, '2019-04-09', 'Syahroni', 5, 'RAM Problem', 'eko@support.com', '2019-04-09', '2019-04-09 01:54:38'),
(112, '2019-04-09', 'Erni', 5, 'Instalasi Driver Laptop', 'eko@support.com', '2019-04-09', '2019-04-09 01:55:06'),
(113, '2019-03-05', 'M.Iqbal', 35, ' Reinstall Office', 'catur@support.com', '2019-03-05', '2019-04-09 07:14:57'),
(114, '2019-03-05', 'M.Iqbal', 35, ' Reinstall Office', 'catur@support.com', '2019-03-05', '2019-04-09 07:14:57'),
(115, '2019-03-05', 'Protokol', 7, 'Seting rapat', 'catur@support.com', '2019-03-05', '2019-04-09 07:18:55'),
(116, '2019-03-14', 'Protokol', 7, 'Connect print to notebook', 'catur@support.com', '2019-03-14', '2019-04-09 07:20:56'),
(117, '2019-03-04', 'Ajudan', 39, ' Tidak  Bisa Print', 'catur@support.com', '2019-03-04', '2019-04-09 07:34:31'),
(118, '2019-03-05', 'Endang', 37, 'Tidak Bisa Scan', 'catur@support.com', '2019-03-05', '2019-04-09 07:35:50'),
(119, '2019-03-18', 'Dedy', 14, 'Seting Printer', 'catur@support.com', '2019-03-18', '2019-04-09 07:37:05'),
(120, '2019-03-19', 'Evita', 16, 'Seting PC baru', 'catur@support.com', '2019-03-19', '2019-04-09 07:38:11'),
(121, '2019-03-20', 'Ratna', 16, 'Seting Notebook Baru', 'catur@support.com', '2019-03-20', '2019-04-09 07:40:55'),
(122, '2019-03-21', 'Teguh', 8, 'Seting Printer Dotmatrix', 'catur@support.com', '2019-03-21', '2019-04-09 07:42:27'),
(123, '2019-03-22', 'Amat', 29, 'seting Internet No Connection', 'catur@support.com', '2019-03-22', '2019-04-09 07:43:39'),
(124, '2019-03-23', 'Pipit', 7, 'HDD eror ( Backup )', 'catur@support.com', '2019-03-23', '2019-04-09 07:44:53'),
(125, '2019-03-27', 'Bagus', 36, 'Cek komputer Keyboard eror ', 'catur@support.com', '2019-03-27', '2019-04-09 07:47:41'),
(126, '2019-03-28', 'Dokter Mela', 31, 'Backup Data', 'catur@support.com', '2019-03-28', '2019-04-09 07:49:52'),
(127, '2019-03-29', 'Ratna', 16, 'Seting Printer', 'catur@support.com', '2019-03-29', '2019-04-09 07:50:49'),
(128, '2019-04-09', 'M. Oemar', 21, ' Rapat kaset', 'sesar@support.com', '2019-04-09', '2019-04-09 08:27:56'),
(129, '2019-04-10', 'M. Oemar', 21, ' Rapat kasetwapres', 'sesar@support.com', '2019-04-10', '2019-04-10 01:17:16'),
(130, '2019-04-09', 'Edi suyono', 9, ' Rapat kegiatan bulan Ramadhan', 'subagyo@support.com', '2019-04-09', '2019-04-10 01:26:47'),
(131, '2019-04-09', 'Edi suyono', 9, 'Seting acara rapat Gd 2 lt 1', 'subagyo@support.com', '2019-04-09', '2019-04-10 01:28:09'),
(132, '2019-04-09', 'Bu Upi', 16, ' Seting PC / Komputer baru', 'catur@support.com', '2019-04-09', '2019-04-10 03:12:34'),
(133, '2019-04-10', 'Ayu', 7, ' Shared Printer', 'wahyu@support.com', '2019-04-10', '2019-04-10 11:37:50'),
(134, '2019-04-10', 'Suharyono', 34, 'Troubleshooting PC', 'wahyu@support.com', '2019-04-10', '2019-04-10 11:38:37'),
(135, '2019-04-11', 'Wijayanto', 17, ' Rapat lantai 2', 'sesar@support.com', '2019-04-11', '2019-04-11 01:09:55'),
(136, '2019-04-11', 'JK', 22, ' Rapat utama 1', 'sesar@support.com', '2019-04-11', '2019-04-11 03:07:48'),
(137, '2019-04-11', 'Umum', 1, ' Sharing printer ', 'subagyo@support.com', '2019-04-11', '2019-04-12 01:14:54'),
(138, '2019-04-11', 'Lely ', 4, 'Tidak bisa buka email', 'catur@support.com', '2019-04-11', '2019-04-12 01:17:33'),
(139, '2019-04-12', 'Sofyan Wanandi', 18, ' Rapat lantai 1', 'sesar@support.com', '2019-04-12', '2019-04-12 01:42:13'),
(140, '2019-04-11', 'Farid', 4, ' Ganti Power Supply CPU', 'eko@support.com', '2019-04-11', '2019-04-12 04:17:45'),
(141, '2019-04-15', 'Wijayanto', 17, ' Rapat lantai 2', 'sesar@support.com', '2019-04-15', '2019-04-15 02:14:17'),
(142, '2019-04-15', 'Sofyan Wanandi', 18, ' Rapat lantai 1', 'sesar@support.com', '2019-04-15', '2019-04-15 03:26:48'),
(143, '2019-04-15', 'Ibu Ratna', 9, ' Hardware problem', 'subagyo@support.com', '2019-04-15', '2019-04-15 04:30:04'),
(144, '2019-04-15', 'Ibu Ratna', 9, ' Hardware problem', 'subagyo@support.com', '2019-04-15', '2019-04-15 04:30:04'),
(145, '2019-04-15', 'Bangunan', 5, 'seting laptop ke tv untuk acara rapat, Gd 1 Lt 2', 'subagyo@support.com', '2019-04-15', '2019-04-15 06:07:50'),
(146, '2019-04-16', 'Ruli', 34, ' Set Rapat Gedung 2 Lantai 1', 'wahyu@support.com', '2019-04-16', '2019-04-16 07:07:07'),
(147, '2019-04-16', 'Ferry', 34, ' Set Printer', 'wahyu@support.com', '2019-04-16', '2019-04-16 07:07:50'),
(148, '2019-04-22', 'Iskandar Mandji', 18, ' Aktivasi office', 'sesar@support.com', '2019-04-22', '2019-04-22 04:42:56'),
(149, '2019-04-22', 'JK', 22, 'Rapat utama 1 jam 2', 'sesar@support.com', '2019-04-22', '2019-04-22 04:43:24'),
(150, '2019-04-22', 'Suherman', 4, ' Sharing Printer', 'eko@support.com', '2019-04-22', '2019-04-22 05:17:14'),
(151, '2019-04-22', 'Farid', 4, ' Re Connect IP Printer Sharing', 'eko@support.com', '2019-04-22', '2019-04-23 07:57:38'),
(152, '2019-04-22', 'Melati', 33, 'Adaptor PC AIO Tidak Berfungsi', 'eko@support.com', '2019-04-22', '2019-04-23 07:58:24'),
(153, '2019-04-23', 'Oktaviano', 11, 'Set Rapat GD 2 LT 1', 'eko@support.com', '2019-04-23', '2019-04-23 07:59:02'),
(154, '2019-04-24', 'Nuryani', 29, ' Instalasi Software', 'eko@support.com', '2019-04-24', '2019-04-24 03:52:20'),
(155, '2019-04-24', 'James Ricky', 4, 'Keyboard Error', 'eko@support.com', '2019-04-24', '2019-04-24 03:52:50'),
(156, '2019-04-24', 'Yayat', 2, 'Instalasi Komputer', 'wahyu@support.com', '2019-04-24', '2019-04-24 23:08:27'),
(157, '2019-04-24', 'Sumardi', 34, 'Instalasi Printer\n', 'wahyu@support.com', '2019-04-24', '2019-04-24 23:09:03'),
(158, '2019-04-26', 'Dave', 9, ' Instalasi office KIP', 'wahyu@support.com', '2019-04-26', '2019-04-26 02:43:05'),
(159, '2019-04-26', 'Rohim', 7, ' Set rapat protokol gedung 3 lantai 2', 'wahyu@support.com', '2019-04-26', '2019-04-26 02:43:44'),
(160, '2019-04-26', 'trisita', 34, 'Pindah komputer ', 'wahyu@support.com', '2019-04-26', '2019-04-26 02:44:15'),
(161, '2019-04-26', 'Halim', 8, 'Recovery pc Lenovo All In One', 'wahyu@support.com', '2019-04-26', '2019-04-26 03:24:48'),
(162, '2019-04-29', 'Selly', 29, ' PC Mati, Ram Kotor', 'eko@support.com', '2019-04-29', '2019-04-29 01:06:26'),
(163, '2019-04-26', 'Brawijaya, Ajudan Wapres', 39, ' Instal Office komputer baru', 'subagyo@support.com', '2019-04-26', '2019-04-29 01:13:44'),
(164, '2019-04-25', 'Alqausar', 2, 'Instal Driver pack laptop ', 'subagyo@support.com', '2019-04-25', '2019-04-29 01:15:40'),
(165, '2019-04-11', 'Protokol', 7, 'seting tv , ruang rapat gd 2 lt 1', 'subagyo@support.com', '2019-04-11', '2019-04-29 01:22:27'),
(166, '2019-04-16', 'Slamet', 8, 'cek komputer hang', 'subagyo@support.com', '2019-04-16', '2019-04-29 01:24:01'),
(167, '2019-04-29', 'Andri', 16, ' Instal Draiver pack & Office 2019 Laptop', 'subagyo@support.com', '2019-04-29', '2019-04-29 05:18:49'),
(168, '2019-04-29', 'Masrochim', 33, 'instal office 2019 laptop', 'subagyo@support.com', '2019-04-29', '2019-04-29 05:20:44'),
(169, '2019-04-29', 'Iwan', 29, ' TIdak bisa Connect Wifi', 'catur@support.com', '2019-04-29', '2019-04-29 11:34:06'),
(170, '2019-04-04', 'Ratna', 16, 'Ganti Toner', 'catur@support.com', '2019-04-04', '2019-04-29 11:34:56'),
(171, '2019-04-04', 'Angga', 13, 'Setting notebook install driver dan software', 'catur@support.com', '2019-04-04', '2019-04-29 11:35:44'),
(172, '2019-04-04', 'Poppy', 34, 'Install Pdf Nitro', 'catur@support.com', '2019-04-04', '2019-04-29 11:36:41'),
(173, '2019-04-04', 'Keuangan', 13, 'Setting Rapat RDK', 'catur@support.com', '2019-04-04', '2019-04-29 11:37:24'),
(174, '2019-04-05', 'Azhari Biro Umum', 6, 'Calibration Printer Canon', 'catur@support.com', '2019-04-05', '2019-04-29 11:38:47'),
(175, '2019-04-05', 'Risti', 4, 'Setting Printer to Notebook ', 'catur@support.com', '2019-04-05', '2019-04-29 11:39:24'),
(176, '2019-04-08', 'Rika ', 13, 'Paperjam', 'catur@support.com', '2019-04-08', '2019-04-29 11:40:58'),
(177, '2019-04-09', 'Vera ', 16, 'Pc Lambat', 'catur@support.com', '2019-04-09', '2019-04-29 11:41:29'),
(178, '2019-04-26', 'Bagus ', 36, 'Setting Notebook install driver dan software', 'catur@support.com', '2019-04-26', '2019-04-29 11:42:31'),
(179, '2019-04-26', 'Brawijaya Kediaman Wapres', 38, 'Setting Pc Baru dan Printer ', 'catur@support.com', '2019-04-26', '2019-04-29 11:43:45'),
(180, '2019-04-10', 'Dedi Triharjanto', 14, 'Tidak BIsa Browsing', 'catur@support.com', '2019-04-10', '2019-04-29 11:44:33'),
(181, '2019-04-29', 'Kediaman Diponegoro', 39, 'Pasang PC to Printer via LAn', 'catur@support.com', '2019-04-29', '2019-04-29 11:46:05'),
(182, '2019-04-11', 'Sri Klinik', 37, 'Tidak BIsa PRint', 'catur@support.com', '2019-04-11', '2019-04-29 11:47:13'),
(183, '2019-04-12', 'Endang ', 37, 'tidak bisa scan', 'catur@support.com', '2019-04-12', '2019-04-29 11:47:37'),
(184, '2019-04-15', 'nina ', 9, 'Install Office ', 'catur@support.com', '2019-04-15', '2019-04-29 11:48:20'),
(185, '2019-04-16', 'Endang', 9, 'Tidak BIsa Print', 'catur@support.com', '2019-04-16', '2019-04-29 11:48:50'),
(186, '2019-04-18', 'Muis', 8, 'tidak bisa print fotocopy', 'catur@support.com', '2019-04-18', '2019-04-29 11:53:54'),
(187, '2019-04-18', 'Repi', 8, 'tidak bisa print mesin fotocopy', 'catur@support.com', '2019-04-18', '2019-04-29 11:54:22'),
(188, '2019-04-22', 'rasmat', 2, 'tidak bisa download', 'catur@support.com', '2019-04-22', '2019-04-29 11:55:05'),
(189, '2019-04-23', 'Putri', 2, 'Pc Lambat', 'catur@support.com', '2019-04-23', '2019-04-29 11:55:39'),
(190, '2019-04-24', 'irma ', 29, 'cek Virus', 'catur@support.com', '2019-04-24', '2019-04-29 11:56:21'),
(191, '2019-04-30', 'Suleh', 30, 'Set Rapat ruang kendaraan ', 'wahyu@support.com', '2019-04-30', '2019-04-30 03:29:19'),
(192, '2019-04-30', 'Rina', 31, 'Troubleshooting printer', 'wahyu@support.com', '2019-04-30', '2019-04-30 03:29:52'),
(193, '2019-04-30', 'JK', 22, ' Rapat utama 1 jam 14.00', 'sesar@support.com', '2019-04-30', '2019-04-30 05:43:06'),
(194, '2019-04-30', 'Edy', 16, ' Aktivasi Office', 'wahyu@support.com', '2019-04-30', '2019-04-30 06:07:15'),
(195, '2019-04-30', 'laptop, operasi kendaraan', 2, ' instal driver pack & office', 'subagyo@support.com', '2019-04-30', '2019-04-30 07:54:38'),
(196, '2019-05-02', 'Agustin', 37, ' Scaner Tidak Bisa Scan', 'subagyo@support.com', '2019-05-02', '2019-05-02 06:26:51'),
(197, '2019-05-02', 'Pk Oni', 32, 'Cek Printer Tidak Bisa ngeprin', 'subagyo@support.com', '2019-05-02', '2019-05-02 06:29:36'),
(198, '2019-05-03', 'Sofyan Wanandi', 18, ' Rapat lantai 1 jam 9', 'sesar@support.com', '2019-05-03', '2019-05-03 02:44:31'),
(199, '2019-05-01', 'Dharma Wanita Prsatuan', 9, ' Setup Video Mixer Untuk Acara Bazaar DWP', 'eko@support.com', '2019-05-01', '2019-05-06 01:27:47'),
(200, '2019-05-02', 'Dharma Wanita Persatuan', 9, 'Mengoperasikan Video Mixer', 'eko@support.com', '2019-05-02', '2019-05-06 01:28:47'),
(201, '2019-05-03', 'Setwapres', 11, ' Setup Videotron Acara Munggahan', 'eko@support.com', '2019-05-03', '2019-05-06 01:31:53'),
(202, '2019-05-06', 'Ratna', 16, ' Cek Printer', 'wahyu@support.com', '2019-05-06', '2019-05-06 03:53:14'),
(203, '2019-05-06', 'Bu Agustin', 37, 'Scanner bermasalah', 'wahyu@support.com', '2019-05-06', '2019-05-06 03:53:46'),
(204, '2019-05-06', 'Cristine', 7, ' Set Rapat gedung 2 Lantai 1', 'wahyu@support.com', '2019-05-06', '2019-05-06 03:54:26'),
(205, '2019-05-06', 'Angel', 33, ' Chrome tidak dapat menampilkan konten gambar', 'eko@support.com', '2019-05-06', '2019-05-06 08:10:51'),
(206, '2019-05-06', 'Fatia', 4, 'Bantuan Memecah File PDF', 'eko@support.com', '2019-05-06', '2019-05-06 08:11:47'),
(207, '2019-05-08', 'Ratna', 35, ' Printer Area Problem', 'eko@support.com', '2019-05-08', '2019-05-09 00:31:10'),
(208, '2019-05-10', 'JK', 22, ' Rapat utama 1 jam 10', 'sesar@support.com', '2019-05-10', '2019-05-09 23:44:03'),
(209, '2019-05-13', 'JK', 22, ' Rapat utama 1 jam 10', 'sesar@support.com', '2019-05-13', '2019-05-13 01:48:25'),
(210, '2019-05-13', 'Sofyan Wanandi', 23, ' Rapat lantai 1 jam 14.00', 'sesar@support.com', '2019-05-13', '2019-05-13 07:39:16'),
(211, '2019-05-14', 'Suherman', 4, ' Browser Problem', 'eko@support.com', '2019-05-14', '2019-05-14 00:56:24'),
(212, '2019-05-14', 'Krisna', 32, ' Printer Problem', 'eko@support.com', '2019-05-14', '2019-05-14 01:24:27'),
(213, '2019-05-14', 'Slamet', 32, ' Shared printer ke pak oni', 'wahyu@support.com', '2019-05-14', '2019-05-14 03:25:31'),
(214, '2019-05-14', 'Hasibuan', 40, ' Install new office , laptop baru inasgok', 'wahyu@support.com', '2019-05-14', '2019-05-14 03:33:29'),
(215, '2019-05-14', 'Risna', 40, 'Install new Office, Laptop baru inasgok', 'wahyu@support.com', '2019-05-14', '2019-05-14 03:34:40'),
(216, '2019-05-15', 'Sofyan Wanandi', 18, ' Rapat lantai 1 jam 10', 'sesar@support.com', '2019-05-15', '2019-05-15 02:51:34'),
(217, '2019-05-16', 'Puji', 16, ' Set Rapat Set 2 Lantai 3', 'wahyu@support.com', '2019-05-16', '2019-05-16 02:30:02'),
(218, '2019-05-16', 'Primady', 34, 'Troubleshoot keyboard driver', 'wahyu@support.com', '2019-05-16', '2019-05-16 02:30:38'),
(219, '2019-05-16', 'Yakob', 35, 'Troubleshoot CPU , cleaner memory', 'wahyu@support.com', '2019-05-16', '2019-05-16 02:31:14'),
(220, '2019-05-16', 'Ferry', 34, 'Setting Laptop Inasgok ', 'wahyu@support.com', '2019-05-16', '2019-05-16 03:39:53'),
(221, '2019-05-20', 'Troubleshoot printer ', 2, ' Cek Printer Spooling jaringan', 'wahyu@support.com', '2019-05-20', '2019-05-20 03:13:39'),
(222, '2019-05-21', 'Sumardi', 34, ' Troubleshoot scanner', 'wahyu@support.com', '2019-05-21', '2019-05-21 04:04:54'),
(223, '2019-05-21', 'Temmy', 11, 'Sharing printer', 'wahyu@support.com', '2019-05-21', '2019-05-21 04:05:33'),
(224, '2019-05-21', 'Temmy', 11, 'Sharing printer', 'wahyu@support.com', '2019-05-21', '2019-05-21 04:05:33'),
(225, '2019-05-21', 'Selly', 11, 'Sharing fujixerox new', 'wahyu@support.com', '2019-05-21', '2019-05-21 04:06:11'),
(226, '2019-05-21', 'ayu', 7, 'Set rapat kordinasi protokol gedung 3 lantai 2', 'wahyu@support.com', '2019-05-21', '2019-05-21 04:07:05'),
(227, '2019-05-22', 'Endah', 11, 'Sharing Printer', 'eko@support.com', '2019-05-22', '2019-05-22 01:17:54'),
(228, '2019-05-22', 'Pipit', 13, 'Sharing Printer Reconnecting', 'eko@support.com', '2019-05-22', '2019-05-22 01:18:38'),
(229, '2019-05-23', 'Anne', 23, ' Komputer hang & aktivasi office', 'sesar@support.com', '2019-05-23', '2019-05-23 04:48:21'),
(230, '2019-05-24', 'Agustin', 37, ' Rapat set 3 lantai 2', 'wahyu@support.com', '2019-05-24', '2019-05-24 01:09:58'),
(231, '2019-05-28', 'Wijayanto', 17, ' Rapat lantai 2 jam 11.00', 'sesar@support.com', '2019-05-28', '2019-05-29 05:47:45'),
(232, '2019-05-28', 'Satya', 17, 'Pasang printer baru ', 'sesar@support.com', '2019-05-28', '2019-05-29 05:48:22'),
(233, '2019-06-10', 'Farid', 4, ' Setting Accounting Excel Format', 'eko@support.com', '2019-06-10', '2019-06-11 01:57:09'),
(234, '2019-06-11', 'Amelia', 29, 'Reset Password Win 10', 'eko@support.com', '2019-06-11', '2019-06-11 01:57:34'),
(235, '2019-06-11', 'Ruli', 34, ' Ganti Toner Printer Hp Laserjet', 'wahyu@support.com', '2019-06-11', '2019-06-11 07:57:02'),
(236, '2019-06-11', 'Fery', 34, ' Pasang komputer lama untuk anak magang', 'wahyu@support.com', '2019-06-11', '2019-06-11 07:58:09'),
(237, '2019-06-12', 'Purwo Widodo', 2, ' Setting Printer\r\n', 'wahyu@support.com', '2019-06-12', '2019-06-12 03:27:19'),
(238, '2019-06-12', 'Poppy', 34, 'Install Driver Laptop', 'wahyu@support.com', '2019-06-12', '2019-06-12 03:27:58'),
(239, '2019-06-17', 'Satya', 17, ' Install driver printer', 'sesar@support.com', '2019-06-17', '2019-06-17 00:52:56'),
(240, '2019-06-17', 'Sofyan Wanandi', 18, 'Rapat lantai 2 jam 09.00', 'sesar@support.com', '2019-06-17', '2019-06-17 00:53:40'),
(241, '2019-06-19', 'Sumadi', 26, ' Install laptop 1 unit', 'sesar@support.com', '2019-06-19', '2019-06-19 07:42:54'),
(242, '2019-06-20', 'Titin', 29, ' Troubleshoot Printer FUJI XEROX ', 'wahyu@support.com', '2019-06-20', '2019-06-20 03:35:18'),
(243, '2019-06-24', 'anne', 23, ' instal aplikasi edit pdf', 'sesar@support.com', '2019-06-24', '2019-06-25 03:08:17'),
(244, '2019-06-25', 'protokol', 20, ' komputer lemot', 'sesar@support.com', '2019-06-25', '2019-06-25 03:22:00'),
(245, '2019-06-27', 'Uti', 32, ' Install siska', 'wahyu@support.com', '2019-06-27', '2019-06-28 01:00:17'),
(246, '2019-06-27', 'Hasibuan', 40, 'Troubleshoting PC lenovo', 'wahyu@support.com', '2019-06-27', '2019-06-28 01:01:44'),
(247, '2019-06-25', 'Prima Analisa', 29, ' Keyboard laptop error', 'eko@support.com', '2019-06-25', '2019-06-28 09:13:26'),
(248, '2019-06-25', 'Andri', 16, 'Recovery Windows', 'eko@support.com', '2019-06-25', '2019-06-28 09:14:26'),
(249, '2019-06-18', 'Sri Wahyuningsih', 40, ' Sharing Printer ', 'subagyo@support.com', '2019-06-18', '2019-06-28 09:15:24'),
(250, '2019-06-19', 'Iren', 11, 'Sharing photocopy & Printer', 'subagyo@support.com', '2019-06-19', '2019-06-28 09:17:45'),
(251, '2019-06-24', 'Lina', 36, 'Excel Missing Values ', 'subagyo@support.com', '2019-06-24', '2019-06-28 09:22:05'),
(252, '2019-06-25', 'Hendra', 9, 'Cek Printer tidak bisa ngeprin', 'subagyo@support.com', '2019-06-25', '2019-06-28 09:23:29'),
(253, '2019-06-26', 'Ferry', 16, 'Cek Komputer Windows eror', 'subagyo@support.com', '2019-06-26', '2019-06-28 09:25:42'),
(254, '2019-06-20', 'Protokol', 7, 'Seting infokus & TV Ruang rapat gd 2 Lt 1', 'subagyo@support.com', '2019-06-20', '2019-06-28 09:29:59'),
(255, '2019-07-01', 'Dini', 35, ' Ekstensi file error', 'eko@support.com', '2019-07-01', '2019-07-01 04:12:22'),
(256, '2019-07-01', 'Reza', 7, 'Kabel USB Type C Rusak', 'eko@support.com', '2019-07-01', '2019-07-01 04:13:00'),
(257, '2019-07-01', 'Bambang W', 25, ' Rapat lantai 1 jam 13.00', 'fahmi@support.com', '2019-07-01', '2019-07-01 05:59:48'),
(258, '2019-07-01', 'Dr.Fanny', 40, ' Sharing Printer', 'eko@support.com', '2019-07-01', '2019-07-01 07:55:11'),
(259, '2019-07-01', 'Wenny', 32, ' Troubleshooting Laptop', 'wahyu@support.com', '2019-07-01', '2019-07-01 07:58:51'),
(260, '2019-07-01', 'Leli', 4, ' Install Office 2019 Laptop Inasgok\r\n', 'wahyu@support.com', '2019-07-01', '2019-07-01 08:01:14'),
(261, '2019-07-02', 'Uum', 35, ' Windows Update', 'eko@support.com', '2019-07-02', '2019-07-02 01:08:59'),
(262, '2019-07-02', 'Gita', 34, ' Troubleshoot internet', 'wahyu@support.com', '2019-07-02', '2019-07-02 05:59:27'),
(263, '2019-07-02', 'Dedi', 30, ' Pindah Komputer', 'wahyu@support.com', '2019-07-02', '2019-07-02 05:59:53'),
(264, '2019-07-02', 'Danang', 14, ' Pindah Komputer', 'wahyu@support.com', '2019-07-02', '2019-07-02 06:00:27'),
(265, '2019-07-02', 'Danang', 14, ' Pindah Komputer', 'wahyu@support.com', '2019-07-02', '2019-07-02 06:00:30'),
(266, '2019-07-03', 'Protokol', 7, ' Standby Video Mixer Acara Wapres', 'eko@support.com', '2019-07-03', '2019-07-03 01:04:20'),
(267, '2019-07-03', 'Tati', 35, ' Switch User Log on Windows', 'eko@support.com', '2019-07-03', '2019-07-03 01:09:08'),
(268, '2019-07-03', 'Adi Pramono', 4, ' Sharing Printer', 'eko@support.com', '2019-07-03', '2019-07-03 07:15:49'),
(269, '2019-07-03', 'Rohim', 33, 'Set Rapat gedung 2 lantai 1', 'eko@support.com', '2019-07-03', '2019-07-03 07:16:43'),
(270, '2019-07-04', 'Anne', 23, ' Instal ulang windows', 'sesar@support.com', '2019-07-04', '2019-07-04 03:38:28'),
(271, '2019-07-05', 'Fajar', 5, ' Partisi Hardisk Internal PC AIO', 'eko@support.com', '2019-07-05', '2019-07-05 04:03:53'),
(272, '2019-07-05', 'Suleh', 30, 'Sharing Printer', 'eko@support.com', '2019-07-05', '2019-07-05 04:15:52'),
(273, '2019-07-04', 'Protokol', 7, ' Seting tv ruang rapat perpustakaan gd 3 lt 2 ', 'subagyo@support.com', '2019-07-04', '2019-07-05 04:30:26'),
(274, '2019-07-03', 'Ibu Rulli', 16, 'Pindah komputer dari ruang kesra gd 2 lt 3 -  ke ruang ekonomi gd 1 lt 4', 'subagyo@support.com', '2019-07-03', '2019-07-05 04:33:31'),
(275, '2019-07-08', 'Ati (Keuangan)', 13, ' Adaptor Lenovo All In One Bermasalah, ', 'wahyu@support.com', '2019-07-08', '2019-07-08 03:05:20'),
(276, '2019-07-08', 'Rizky', 13, ' Ganti Toner Printer', 'wahyu@support.com', '2019-07-08', '2019-07-08 03:06:21'),
(277, '2019-07-08', 'Bagus', 35, ' Troubleshooting Komputer', 'wahyu@support.com', '2019-07-08', '2019-07-08 03:17:26'),
(278, '2019-07-08', 'koko', 16, ' Scan Anti Virus', 'wahyu@support.com', '2019-07-08', '2019-07-08 07:58:13'),
(279, '2019-07-05', 'Fahmi', 17, ' Setting Rapat Staff Khusus Lantai 2 Pukul 09.00', 'fahmi@support.com', '2019-07-05', '2019-07-08 09:47:13'),
(280, '2019-07-05', 'Fahmi', 17, ' Standby Rapat Staff Khusus Lantai 2, Pukul 14.00', 'fahmi@support.com', '2019-07-05', '2019-07-08 09:48:54'),
(281, '2019-07-08', 'Eko Sunarwanto', 5, ' Reinstall Autocad 2017', 'eko@support.com', '2019-07-08', '2019-07-09 00:23:57'),
(282, '2019-07-08', 'Yudha', 35, 'Install Ulang Windows 10', 'eko@support.com', '2019-07-08', '2019-07-09 00:24:38'),
(283, '2019-07-10', 'Rina', 16, 'Email Yahoo Tidak Bisa Download Attachment', 'eko@support.com', '2019-07-10', '2019-07-10 01:54:50'),
(284, '2019-07-10', 'Weni', 32, ' Pindah Komputer\r\n', 'wahyu@support.com', '2019-07-10', '2019-07-10 05:21:06'),
(285, '2019-07-10', 'Slamet', 32, ' Sharing Printer', 'wahyu@support.com', '2019-07-10', '2019-07-10 05:22:03'),
(286, '2019-07-10', 'Wati', 11, ' Troubleshooting komputer', 'wahyu@support.com', '2019-07-10', '2019-07-10 05:22:32'),
(287, '2019-07-10', 'Mardi', 34, ' Troubleshooting Printer', 'wahyu@support.com', '2019-07-10', '2019-07-10 07:37:45'),
(288, '2019-07-10', 'JK', 22, ' Rapat utama 1 jam 16.00', 'sesar@support.com', '2019-07-10', '2019-07-10 08:03:31'),
(289, '2019-07-15', 'Caty', 11, ' Sharing Printer', 'eko@support.com', '2019-07-15', '2019-07-15 02:52:33'),
(290, '2019-07-15', 'Roby', 4, 'Pasang Printer', 'eko@support.com', '2019-07-15', '2019-07-15 02:53:27'),
(291, '2019-07-15', 'Bambang W', 25, ' Rapat lantai 1 jam 13.00', 'sesar@support.com', '2019-07-15', '2019-07-15 06:08:29'),
(292, '2019-07-15', 'Awal', 18, 'Print trouble', 'sesar@support.com', '2019-07-15', '2019-07-15 06:09:23'),
(293, '2019-07-15', 'Rizky', 13, ' Repair Strartup Win 8', 'eko@support.com', '2019-07-15', '2019-07-15 07:38:49'),
(294, '2019-07-16', 'Uti', 32, ' Shared printer', 'wahyu@support.com', '2019-07-16', '2019-07-16 03:05:23'),
(295, '2019-07-17', 'Lely', 29, ' Troubleshooting pc', 'wahyu@support.com', '2019-07-17', '2019-07-17 02:04:16'),
(296, '2019-07-17', 'Agustin', 29, ' Shared printer officejet', 'wahyu@support.com', '2019-07-17', '2019-07-17 02:19:58'),
(297, '2019-07-17', 'Klinik', 40, ' Shared Printer', 'wahyu@support.com', '2019-07-17', '2019-07-17 04:52:27'),
(298, '2019-07-17', 'Wijayanto', 17, ' Rapat lantai 2 jam 14.00', 'sesar@support.com', '2019-07-17', '2019-07-17 07:04:27'),
(299, '2019-07-17', 'Repi', 30, ' Aktivasi Office dan windows', 'wahyu@support.com', '2019-07-17', '2019-07-17 07:54:42'),
(300, '2019-07-18', 'Wijayanto', 17, ' Rapat lantai 2 jam 09.00', 'sesar@support.com', '2019-07-18', '2019-07-18 00:43:22'),
(301, '2019-07-19', 'Wijayanto', 17, ' Rapat lantai 2 jam 14.00', 'sesar@support.com', '2019-07-19', '2019-07-19 06:03:51'),
(302, '2019-07-19', 'Bambang W', 25, 'Rapat lantai 1 jam 14.00', 'sesar@support.com', '2019-07-19', '2019-07-19 06:04:23'),
(303, '2019-07-22', 'Anne', 23, ' Ganti tinta printer', 'sesar@support.com', '2019-07-22', '2019-07-22 04:36:52'),
(304, '2019-07-22', 'Wijayanto', 17, ' Rapat lantai 2 jam 13.00', 'sesar@support.com', '2019-07-22', '2019-07-22 06:51:32'),
(305, '2019-07-23', 'M. Oemar', 21, ' Rapat lantai 1 jam 8.30', 'sesar@support.com', '2019-07-23', '2019-07-23 00:34:07'),
(306, '2019-07-23', 'Pegawaian', 11, ' Printer jamming', 'eko@support.com', '2019-07-23', '2019-07-23 01:18:09'),
(307, '2019-07-23', 'Pegawaian', 11, ' Printer jamming', 'eko@support.com', '2019-07-23', '2019-07-23 01:18:09'),
(308, '2019-07-22', 'Fanny', 40, 'Sharing Printer', 'eko@support.com', '2019-07-22', '2019-07-23 01:19:01'),
(309, '2019-07-23', 'anne', 23, 'tidak bisa print', 'sesar@support.com', '2019-07-23', '2019-07-23 05:11:44'),
(310, '2019-07-23', 'wijayanto', 17, 'rapat lantai 2 jam 14.00', 'sesar@support.com', '2019-07-23', '2019-07-23 05:12:31'),
(311, '2019-07-23', 'JK', 22, 'Rapat utama 1 jam 14.00', 'sesar@support.com', '2019-07-23', '2019-07-23 05:13:00'),
(312, '2019-07-23', 'Santi', 16, ' Sharing printer', 'wahyu@support.com', '2019-07-23', '2019-07-23 07:36:04'),
(313, '2019-07-23', 'Rahmadi', 16, ' Instalk ulang', 'wahyu@support.com', '2019-07-23', '2019-07-23 07:38:01'),
(314, '2019-07-23', 'Yakub', 35, ' Komputer blank', 'wahyu@support.com', '2019-07-23', '2019-07-23 07:43:47'),
(315, '2019-07-23', 'Kendaraan', 2, ' Set rapat untuk RDK di set 2 lantai 1', 'wahyu@support.com', '2019-07-23', '2019-07-23 08:54:27'),
(316, '2019-07-24', 'Wijayanto', 17, ' rapat lantai 2 jam 14.00', 'sesar@support.com', '2019-07-24', '2019-07-24 05:41:03'),
(317, '2019-07-24', 'Slamet Widodo', 11, ' Tinta Printer Macet', 'eko@support.com', '2019-07-24', '2019-07-25 01:21:52'),
(318, '2019-07-24', 'Protokol', 7, 'Setting Rakor Gedung 2 Lantai 1', 'eko@support.com', '2019-07-24', '2019-07-25 01:22:39'),
(319, '2019-07-24', 'Wati', 6, 'Browser Problem', 'eko@support.com', '2019-07-24', '2019-07-25 01:23:16'),
(320, '2019-07-26', 'fahmi', 17, ' Printer error', 'fahmi@support.com', '2019-07-26', '2019-07-26 09:03:55'),
(321, '2019-07-25', 'Moko', 13, 'PC Mati, Ram kotor', 'eko@support.com', '2019-07-25', '2019-07-29 00:26:34'),
(322, '2019-07-25', 'Protokol', 7, 'Rakor gedung set 2 lt 1', 'eko@support.com', '2019-07-25', '2019-07-29 00:27:16'),
(323, '2019-07-25', 'Protokol', 7, 'Rakor gedung set 3 lt 2', 'eko@support.com', '2019-07-25', '2019-07-29 00:27:57'),
(324, '2019-07-25', 'Suherman', 4, 'Printer Sharing', 'eko@support.com', '2019-07-25', '2019-07-29 00:28:34'),
(325, '2019-07-26', 'Wiwit', 7, 'Install ulang Windows', 'eko@support.com', '2019-07-26', '2019-07-29 00:29:32'),
(326, '2019-07-29', 'Wijayanto', 17, ' rapat lantai 2 jam 11.00', 'sesar@support.com', '2019-07-29', '2019-07-29 03:19:48'),
(327, '2019-07-29', 'Weni', 32, ' Troubleshooting internet\r\n', 'wahyu@support.com', '2019-07-29', '2019-07-29 07:09:53'),
(328, '2019-07-01', 'sambas', 35, 'shaering printer', 'subagyo@support.com', '2019-07-01', '2019-07-29 12:39:37'),
(329, '2019-07-02', 'Bu Endang', 9, 'Komputer Lemot / loading lama', 'subagyo@support.com', '2019-07-02', '2019-07-29 12:43:55'),
(330, '2019-07-04', 'Suriyati Prihantini', 36, 'Instal Office', 'subagyo@support.com', '2019-07-04', '2019-07-29 12:47:45'),
(331, '2019-07-08', 'Ibu Umbar', 38, 'Komputer Mati Sepri', 'subagyo@support.com', '2019-07-08', '2019-07-29 13:30:24'),
(332, '2019-07-30', 'Yakub', 35, ' Instal ulang windows 7 dari windows 10 dell optiplex', 'wahyu@support.com', '2019-07-30', '2019-07-30 06:35:32'),
(333, '2019-07-30', 'Sofyan Wanandi', 18, ' Rapat auditorium jam 14.00', 'sesar@support.com', '2019-07-30', '2019-07-30 09:02:09'),
(334, '2019-07-30', 'Anne', 23, ' Print problem', 'sesar@support.com', '2019-07-30', '2019-07-30 09:03:05'),
(335, '2019-07-30', 'Sri', 40, ' Sharing Printer', 'wahyu@support.com', '2019-07-30', '2019-07-30 09:20:16'),
(336, '2019-07-31', 'Yakub', 35, ' Shared Printer', 'wahyu@support.com', '2019-07-31', '2019-07-31 04:43:10'),
(337, '2019-07-31', 'Kresna', 32, 'install driver', 'wahyu@support.com', '2019-07-31', '2019-07-31 04:43:36'),
(338, '2019-07-31', 'Tiwi', 29, 'Shared Printer', 'wahyu@support.com', '2019-07-31', '2019-07-31 04:43:56'),
(339, '2019-07-31', 'Puspita', 7, ' Driver wireless', 'wahyu@support.com', '2019-07-31', '2019-07-31 06:24:21'),
(340, '2019-07-31', 'JK', 22, ' Rapat auditorium jam 14.00', 'sesar@support.com', '2019-07-31', '2019-07-31 07:48:01'),
(341, '2019-07-09', 'Yuyun', 7, 'Sharing Printer', 'subagyo@support.com', '2019-07-09', '2019-07-31 10:07:14'),
(342, '2019-07-11', 'Halim', 8, 'Komputer tidak bisa masuk windows', 'subagyo@support.com', '2019-07-11', '2019-07-31 10:08:25'),
(343, '2019-07-12', 'Ety', 3, ' sharing pinter', 'subagyo@support.com', '2019-07-12', '2019-07-31 11:18:51'),
(344, '2019-07-15', 'Bu Rully', 29, 'Komputer mati', 'subagyo@support.com', '2019-07-15', '2019-07-31 11:20:20'),
(345, '2019-07-17', 'Doni', 29, 'Install Driver pack', 'subagyo@support.com', '2019-07-17', '2019-07-31 11:21:14'),
(346, '2019-07-19', 'Protokol', 7, 'Pindah komputer ', 'subagyo@support.com', '2019-07-19', '2019-07-31 11:22:44'),
(347, '2019-07-22', 'Abu bakar sidik', 13, 'install driver Pack', 'subagyo@support.com', '2019-07-22', '2019-07-31 11:23:44'),
(348, '2019-07-23', 'Doni P', 36, 'Install Office 2010', 'subagyo@support.com', '2019-07-23', '2019-07-31 11:24:44'),
(349, '2019-07-26', 'User', 16, 'Tidak bisa ngeprint', 'subagyo@support.com', '2019-07-26', '2019-07-31 11:26:56'),
(350, '2019-08-01', 'Mardi', 34, ' Shared printer', 'wahyu@support.com', '2019-08-01', '2019-08-01 04:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lokasi`
--

CREATE TABLE `tbl_lokasi` (
  `kode_lokasi` varchar(10) NOT NULL,
  `lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lokasi`
--

INSERT INTO `tbl_lokasi` (`kode_lokasi`, `lokasi`) VALUES
('kediaman', 'Kediaman'),
('mersel', 'Merdeka Selatan'),
('merut', 'Merdeka Utara');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`email_admin`);

--
-- Indexes for table `tbl_bagian`
--
ALTER TABLE `tbl_bagian`
  ADD PRIMARY KEY (`id_bagian`),
  ADD KEY `kode_lokasi` (`kode_lokasi`);

--
-- Indexes for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`),
  ADD KEY `email_user` (`email_admin`),
  ADD KEY `id_bagian` (`id_bagian`);

--
-- Indexes for table `tbl_lokasi`
--
ALTER TABLE `tbl_lokasi`
  ADD PRIMARY KEY (`kode_lokasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bagian`
--
ALTER TABLE `tbl_bagian`
  MODIFY `id_bagian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bagian`
--
ALTER TABLE `tbl_bagian`
  ADD CONSTRAINT `tbl_bagian_ibfk_1` FOREIGN KEY (`kode_lokasi`) REFERENCES `tbl_lokasi` (`kode_lokasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD CONSTRAINT `tbl_kegiatan_ibfk_1` FOREIGN KEY (`email_admin`) REFERENCES `tbl_admin` (`email_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_kegiatan_ibfk_2` FOREIGN KEY (`id_bagian`) REFERENCES `tbl_bagian` (`id_bagian`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
