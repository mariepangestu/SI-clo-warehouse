-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 03:18 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pabrikpakaian`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan_bakus`
--

CREATE TABLE `bahan_bakus` (
  `id_bahanbaku` bigint(20) UNSIGNED NOT NULL,
  `nama_bahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_bahan` bigint(20) NOT NULL,
  `satuan_bahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_bahan` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_kategori_barang` bigint(20) UNSIGNED NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_barang` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `biaya_produksis`
--

CREATE TABLE `biaya_produksis` (
  `id_biaya_produksi` bigint(20) UNSIGNED NOT NULL,
  `id_bahanbaku` bigint(20) UNSIGNED NOT NULL,
  `id_tenaga_kerja` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gudangs`
--

CREATE TABLE `gudangs` (
  `id_gudang` bigint(20) UNSIGNED NOT NULL,
  `nama_gudang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barangs`
--

CREATE TABLE `kategori_barangs` (
  `id_kategori_barang` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_05_131420_create_kategori_barangs_table', 1),
(6, '2023_04_05_131421_create_barangs_table', 1),
(7, '2023_04_05_131422_create_tenaga_kerjas_table', 1),
(8, '2023_04_05_132742_create_pegawais_table', 1),
(9, '2023_04_05_132743_create_gudangs_table', 1),
(10, '2023_04_05_132744_create_outlets_table', 1),
(11, '2023_04_05_134603_create_bahan_bakus_table', 1),
(12, '2023_04_05_142105_create_biaya_produksis_table', 1),
(13, '2023_04_05_142115_create_produksis_table', 1),
(14, '2023_04_05_153106_create_stok_barangs_table', 1),
(15, '2023_04_05_155101_create_stok_produksis_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outlets`
--

CREATE TABLE `outlets` (
  `id_outlet` bigint(20) UNSIGNED NOT NULL,
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `nama_outlet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi_outlet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawais`
--

CREATE TABLE `pegawais` (
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama_pegawai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `umur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produksis`
--

CREATE TABLE `produksis` (
  `id_produksi` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_biaya_produksi` bigint(20) UNSIGNED NOT NULL,
  `jumlah_produksi` bigint(20) NOT NULL,
  `tgl_produksi` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok_barangs`
--

CREATE TABLE `stok_barangs` (
  `id_stok_barang` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `Jumlah_stok` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok_produksis`
--

CREATE TABLE `stok_produksis` (
  `id_stok_produksi` bigint(20) UNSIGNED NOT NULL,
  `id_produksi` bigint(20) UNSIGNED NOT NULL,
  `id_gudang` bigint(20) UNSIGNED NOT NULL,
  `jumlah_stok` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_kerjas`
--

CREATE TABLE `tenaga_kerjas` (
  `id_tenaga_kerja` bigint(20) UNSIGNED NOT NULL,
  `nama_tenaga_kerja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usia` bigint(20) NOT NULL,
  `gaji_tenaga_kerja` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan_bakus`
--
ALTER TABLE `bahan_bakus`
  ADD PRIMARY KEY (`id_bahanbaku`);

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `barangs_id_kategori_barang_foreign` (`id_kategori_barang`);

--
-- Indexes for table `biaya_produksis`
--
ALTER TABLE `biaya_produksis`
  ADD PRIMARY KEY (`id_biaya_produksi`),
  ADD KEY `biaya_produksis_id_bahanbaku_foreign` (`id_bahanbaku`),
  ADD KEY `biaya_produksis_id_tenaga_kerja_foreign` (`id_tenaga_kerja`);

--
-- Indexes for table `gudangs`
--
ALTER TABLE `gudangs`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indexes for table `kategori_barangs`
--
ALTER TABLE `kategori_barangs`
  ADD PRIMARY KEY (`id_kategori_barang`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outlets`
--
ALTER TABLE `outlets`
  ADD PRIMARY KEY (`id_outlet`),
  ADD KEY `outlets_id_pegawai_foreign` (`id_pegawai`),
  ADD KEY `outlets_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `pegawais_id_user_foreign` (`id_user`);

--
-- Indexes for table `produksis`
--
ALTER TABLE `produksis`
  ADD PRIMARY KEY (`id_produksi`),
  ADD KEY `produksis_id_barang_foreign` (`id_barang`),
  ADD KEY `produksis_id_biaya_produksi_foreign` (`id_biaya_produksi`);

--
-- Indexes for table `stok_barangs`
--
ALTER TABLE `stok_barangs`
  ADD PRIMARY KEY (`id_stok_barang`),
  ADD KEY `stok_barangs_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `stok_produksis`
--
ALTER TABLE `stok_produksis`
  ADD PRIMARY KEY (`id_stok_produksi`),
  ADD KEY `stok_produksis_id_produksi_foreign` (`id_produksi`),
  ADD KEY `stok_produksis_id_gudang_foreign` (`id_gudang`);

--
-- Indexes for table `tenaga_kerjas`
--
ALTER TABLE `tenaga_kerjas`
  ADD PRIMARY KEY (`id_tenaga_kerja`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahan_bakus`
--
ALTER TABLE `bahan_bakus`
  MODIFY `id_bahanbaku` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id_barang` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biaya_produksis`
--
ALTER TABLE `biaya_produksis`
  MODIFY `id_biaya_produksi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gudangs`
--
ALTER TABLE `gudangs`
  MODIFY `id_gudang` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_barangs`
--
ALTER TABLE `kategori_barangs`
  MODIFY `id_kategori_barang` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `outlets`
--
ALTER TABLE `outlets`
  MODIFY `id_outlet` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawais`
--
ALTER TABLE `pegawais`
  MODIFY `id_pegawai` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produksis`
--
ALTER TABLE `produksis`
  MODIFY `id_produksi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_barangs`
--
ALTER TABLE `stok_barangs`
  MODIFY `id_stok_barang` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_produksis`
--
ALTER TABLE `stok_produksis`
  MODIFY `id_stok_produksi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenaga_kerjas`
--
ALTER TABLE `tenaga_kerjas`
  MODIFY `id_tenaga_kerja` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barangs`
--
ALTER TABLE `barangs`
  ADD CONSTRAINT `barangs_id_kategori_barang_foreign` FOREIGN KEY (`id_kategori_barang`) REFERENCES `kategori_barangs` (`id_kategori_barang`) ON DELETE CASCADE;

--
-- Constraints for table `biaya_produksis`
--
ALTER TABLE `biaya_produksis`
  ADD CONSTRAINT `biaya_produksis_id_bahanbaku_foreign` FOREIGN KEY (`id_bahanbaku`) REFERENCES `bahan_bakus` (`id_bahanbaku`) ON DELETE CASCADE,
  ADD CONSTRAINT `biaya_produksis_id_tenaga_kerja_foreign` FOREIGN KEY (`id_tenaga_kerja`) REFERENCES `tenaga_kerjas` (`id_tenaga_kerja`) ON DELETE CASCADE;

--
-- Constraints for table `outlets`
--
ALTER TABLE `outlets`
  ADD CONSTRAINT `outlets_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barangs` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `outlets_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawais` (`id_pegawai`) ON DELETE CASCADE;

--
-- Constraints for table `pegawais`
--
ALTER TABLE `pegawais`
  ADD CONSTRAINT `pegawais_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `produksis`
--
ALTER TABLE `produksis`
  ADD CONSTRAINT `produksis_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barangs` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `produksis_id_biaya_produksi_foreign` FOREIGN KEY (`id_biaya_produksi`) REFERENCES `biaya_produksis` (`id_biaya_produksi`) ON DELETE CASCADE;

--
-- Constraints for table `stok_barangs`
--
ALTER TABLE `stok_barangs`
  ADD CONSTRAINT `stok_barangs_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barangs` (`id_barang`) ON DELETE CASCADE;

--
-- Constraints for table `stok_produksis`
--
ALTER TABLE `stok_produksis`
  ADD CONSTRAINT `stok_produksis_id_gudang_foreign` FOREIGN KEY (`id_gudang`) REFERENCES `gudangs` (`id_gudang`) ON DELETE CASCADE,
  ADD CONSTRAINT `stok_produksis_id_produksi_foreign` FOREIGN KEY (`id_produksi`) REFERENCES `produksis` (`id_produksi`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
