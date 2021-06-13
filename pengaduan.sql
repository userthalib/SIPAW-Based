-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2021 at 03:02 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2021_04_08_164151_create_transaksis_table', 1),
(14, '2021_04_11_170021_create_payments_table', 1),
(15, '2021_06_09_232032_create_relasi_transaksis_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `noPayment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglPayment` date NOT NULL,
  `passwordGanda` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaksi_id` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`noPayment`, `tglPayment`, `passwordGanda`, `transaksi_id`, `bayar`, `kembalian`, `created_at`, `updated_at`, `deleted_at`) VALUES
('PYM1', '2021-06-10', NULL, 1, 100000, 10000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `relasi_transaksis`
--

CREATE TABLE `relasi_transaksis` (
  `payments_noPayment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `nik` varchar(20) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`nik`, `nama`, `username`, `password`, `telp`) VALUES
('1234567', 'Faris Irfan', 'farisirfan@yahoo.co.id', '$2y$10$kLLcAx2cS0Z0/27NGRozdO5HLWczTEug1tLQVn9paPe/Yw4oSQ/Hu', '082257744131'),
('1246345', 'Shidqi', 'shidqi@yahoo.co.id', '$2y$10$KSdHeipxYPjT4cYJdrbs0.3s0y50jC2IFxHez7f7tyROE5EVaGeNG', '082257744131'),
('192934', 'irfan', 'irfanthalib@gmail.com', '$2y$10$qmfwJ7r3Bf2sFgXbzXI7S.TfTTXRk.cK7Q7Qlvpi9QDpyz.DtPvRu', '082257744131'),
('1941720062', 'Faris Ikhlasul Haq', 'Xalvetra', '$2y$10$SFvxVIUIeE7lgOGwL5tLoeR/t88JYNdlK/p0jwy5qtoZJt/JT1A8i', '082257744131');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengaduan`
--

CREATE TABLE `tbl_pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tanggal_pengaduan` date NOT NULL,
  `nik_id` varchar(20) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(50) NOT NULL,
  `status` enum('terkirim','proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pengaduan`
--

INSERT INTO `tbl_pengaduan` (`id_pengaduan`, `tanggal_pengaduan`, `nik_id`, `isi_laporan`, `foto`, `status`) VALUES
(1, '2021-03-20', '123', 'lorem', 'produk_1616207752.PNG', 'selesai'),
(2, '2021-05-18', '1941720062', 'adasdasdadad', 'produk_1621347205.jpg', 'selesai'),
(3, '2021-05-18', '1941720062', 'Faris adalah anak baik', 'produk_1621348266.png', 'terkirim'),
(4, '2021-06-02', '192934', 'Ada Banjir Di sini', 'produk_1622626586.png', 'selesai'),
(5, '2021-06-03', '1234567', 'Banjir', 'produk_1622681555.jpg', 'proses');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(13) DEFAULT NULL,
  `status` enum('admin','petugas') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Faris2', 'admin', '$2y$10$MmwsN.RmXTT5lpR9m5dfS.NH6CF8/4dxmvLuRiyUirLEj.Yh9Z6.e', '089', 'admin', '2021-03-02 01:24:25', '2021-03-02 01:24:25'),
(3, 'Faris', 'Faris', '$2y$10$58T8G/v3l6Mr/eUkMbEoL.TMTC3uuovRHspFPdTwvRzSkTy1h/EVy', '082257744131', 'petugas', '2021-05-18 14:43:57', '2021-05-18 14:43:57'),
(4, 'irfan', 'irfan@yahoo.co.id', '$2y$10$QN7yv2aq.WpMj58fKszqreIuzMPXP23eY3sgL2g0Aiy8/PoPax/R2', '082257744141', 'admin', '2021-06-03 00:43:24', '2021-06-03 00:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tanggapan`
--

CREATE TABLE `tbl_tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `pengaduan_id` int(11) NOT NULL,
  `tanggapan` text NOT NULL,
  `petugas_id` int(11) NOT NULL,
  `tgl_tanggapan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_tanggapan`
--

INSERT INTO `tbl_tanggapan` (`id_tanggapan`, `pengaduan_id`, `tanggapan`, `petugas_id`, `tgl_tanggapan`) VALUES
(1, 1, 'ya', 1, '2021-03-20'),
(2, 1, 'Terima Kasih', 1, '2021-05-18'),
(3, 4, 'Ok siap', 1, '2021-06-02'),
(4, 5, 'Iya', 1, '2021-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id_transaksi` bigint(20) UNSIGNED NOT NULL,
  `password_ganda` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_tagihan` date NOT NULL,
  `atas_nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_pembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_pembayaran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id_transaksi`, `password_ganda`, `tgl_tagihan`, `atas_nama`, `no_pembayaran`, `jenis_pembayaran`, `nominal`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, '2021-06-10', 'Faris Ikhlasul Haq', '1', 'OVO Cash', 90000, 'sudah', NULL, NULL, NULL),
(2, NULL, '2021-06-10', 'Irfan Thalib Alfarid', '2', 'Link Aja', 80000, 'belum', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`noPayment`);

--
-- Indexes for table `relasi_transaksis`
--
ALTER TABLE `relasi_transaksis`
  ADD KEY `relasi_transaksis_payments_nopayment_foreign` (`payments_noPayment`);

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `tbl_pengaduan`
--
ALTER TABLE `tbl_pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indexes for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tbl_tanggapan`
--
ALTER TABLE `tbl_tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_pengaduan`
--
ALTER TABLE `tbl_pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_tanggapan`
--
ALTER TABLE `tbl_tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id_transaksi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi_transaksis`
--
ALTER TABLE `relasi_transaksis`
  ADD CONSTRAINT `relasi_transaksis_payments_nopayment_foreign` FOREIGN KEY (`payments_noPayment`) REFERENCES `payments` (`noPayment`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
