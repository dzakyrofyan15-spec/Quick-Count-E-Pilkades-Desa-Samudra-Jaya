-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2026 at 04:35 AM
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
-- Database: `pilkades`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `name`, `created_at`) VALUES
(1, 'admin', '$2y$10$PXnQWM3lAQ85Z3zQlqZjKO7n1K4m/EbgdbBm/.QqTI9LWHeR2rx8q', 'Panitia Pemilihan Desa (Admin)', '2026-08-18 08:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `candidate_number` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `photo` varchar(255) DEFAULT 'default_candidate.png',
  `vision` text DEFAULT NULL,
  `mission` text DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `vote_count` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `candidate_number`, `full_name`, `photo`, `vision`, `mission`, `slogan`, `vote_count`, `created_at`) VALUES
(1, 1, 'H. Ahmad Subarkah, S.IP.', 'calon_1.svg', 'Mewujudkan Desa Makmur Sejahtera yang Mandiri, Transparan, Berkelanjutan, dan Berbasis Ekonomi Kreatif.', '1. Meningkatkan kualitas pelayanan publik desa secara digital.\n2. Mengoptimalkan BUMDes untuk pemberdayaan ekonomi warga.\n3. Pembangunan infrastruktur jalan & irigasi desa yang adil.', 'Maju Bersama, Sejahtera Untuk Semua', 0, '2026-08-18 08:36:21'),
(2, 2, 'Drs. Bambang Wijaya, M.Si.', 'calon_2.svg', 'Membangun Desa Makmur yang Religius, Aman, Sejahtera, dan Berbudaya.', '1. Program beasiswa dan bantuan pendidikan bagi anak berprestasi.\n2. Peningkatan sarana kesehatan dan posyandu desa.\n3. Penguatan keamanan desa dan gotong royong warga.', 'Kerja Nyata untuk Kemajuan Desa', 0, '2026-08-18 08:36:21'),
(3, 3, 'Siti Rahmawati, S.Pd.', 'calon_3.svg', 'Pemberdayaan Perempuan, Pemuda, dan Usaha Mikro dalam Menciptakan Desa Inovatif.', '1. Pelatihan digitalisasi UMKM dan akses permodalan usaha desa.\n2. Pendirian pusat kegiatan pemuda dan olahraga desa.\n3. Trasparansi anggaran desa berbasis portal informasi publik.', 'Inovatif, Jujur, dan Mengayomi', 0, '2026-08-18 08:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_key`, `setting_value`) VALUES
('election_year', '2026'),
('tps_total', '12'),
('village_name', 'Desa Makmur Sejahtera');

-- --------------------------------------------------------

--
-- Table structure for table `tps_ballots`
--

CREATE TABLE `tps_ballots` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `tps_number` int(11) NOT NULL,
  `evidence_photo` varchar(255) NOT NULL,
  `inputted_by` int(11) NOT NULL,
  `vote_count` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tps_officers`
--

CREATE TABLE `tps_officers` (
  `id` int(11) NOT NULL,
  `tps_number` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(150) DEFAULT '',
  `is_active` tinyint(1) DEFAULT 1,
  `evidence_photo` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tps_officers`
--

INSERT INTO `tps_officers` (`id`, `tps_number`, `username`, `password`, `name`, `location`, `is_active`, `evidence_photo`, `created_at`) VALUES
(1, 1, 'tps1', '$2y$10$tzZvCRKHRvs4NJf1LqOUDu2i3/bKFrhWc9uqXx/fLsyqx6MnTMkLu', 'Panitia TPS 1', 'Balai Dusun 1 - RT 01 s/d RT 03', 1, NULL, '2026-08-18 08:36:21'),
(2, 2, 'tps2', '$2y$10$Eba1vW.UfLlL.qa.1ljg/e.h5QzIYgTO6u1HqgO9eNmGw2XVWT7fG', 'Panitia TPS 2', 'SDN 1 Desa - RT 04 s/d RT 06', 1, NULL, '2026-08-18 08:36:21'),
(3, 3, 'tps3', '$2y$10$3UtrR5X/zyvck2xfR5e.QO4EbbjHDXXp9Tq9PpQt.qgOh6J16eU5C', 'Panitia TPS 3', 'Kantor RW 01 - RT 07 s/d RT 09', 1, NULL, '2026-08-18 08:36:21'),
(4, 4, 'tps4', '$2y$10$5/U1EWk4No6SI0nftWZN9.gE8lXVj4qPqFDSgLOs9ynQzZZClv1I6', 'Panitia TPS 4', 'Masjid Al-Ikhlas - RT 10 s/d RT 12', 1, NULL, '2026-08-18 08:36:21'),
(5, 5, 'tps5', '$2y$10$QnJHqWJ63ZL15pKPfY2pDeEm3gURkClZkYdvfBBQDXvvxnF1SSbPu', 'Panitia TPS 5', 'Balai Dusun 2 - RT 13 s/d RT 15', 1, NULL, '2026-08-18 08:36:21'),
(6, 6, 'tps6', '$2y$10$IpsdgvJBMVcOV2hk5AZuneu1xxkCuT46zFuoisaJmreM239AAt2hK', 'Panitia TPS 6', 'Gedung Serbaguna - RT 16 s/d RT 18', 1, NULL, '2026-08-18 08:36:21'),
(7, 7, 'tps7', '$2y$10$iPOfLl.pJ3rWfwO9/NfhieIkwF5p0eLRF04.tbZtmXMh2JCcFubhK', 'Panitia TPS 7', 'PAUD Dahlia - RT 19 s/d RT 21', 1, NULL, '2026-08-18 08:36:21'),
(8, 8, 'tps8', '$2y$10$/b3T9hnTXlhW1bm/xQWK4ujKqM58aXgXwAqKEkOdFS4u0LRDMXFyS', 'Panitia TPS 8', 'Balai RW 03 - RT 22 s/d RT 24', 1, NULL, '2026-08-18 08:36:21'),
(9, 9, 'tps9', '$2y$10$HD252DHdftT3/plnIF/NiuniGj43lTzSeIDH8vnOxazbzxtOv2Vbm', 'Panitia TPS 9', 'Lapangan Bola - RT 25 s/d RT 27', 1, NULL, '2026-08-18 08:36:21'),
(10, 10, 'tps10', '$2y$10$1/qHBrtOGFPknJitB1eiLe97fUoCA8Wr/bFMlz6Fr.PGQvnmlIR9i', 'Panitia TPS 10', 'Posyandu Mawar - RT 28 s/d RT 30', 1, NULL, '2026-08-18 08:36:21'),
(11, 11, 'tps11', '$2y$10$HCXLhUdgnHt0zsptbF/hs.h3XJBh1rdd5D9otjKlH4jv07ukCnsQ.', 'Panitia TPS 11', 'Balai Dusun 3 - RT 31 s/d RT 33', 1, NULL, '2026-08-18 08:36:21'),
(12, 12, 'tps12', '$2y$10$3Rvd8J6ZZgQp6OJhv3.kCeyrWNwO1loIqBpuiD2ha8vB9OgJ2MdpC', 'Panitia TPS 12', 'Aula PKK - RT 34 s/d RT 36', 1, NULL, '2026-08-18 08:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rt_rw` varchar(20) DEFAULT 'RT 01 / RW 01',
  `tps_number` int(11) DEFAULT 1,
  `is_voted` tinyint(1) DEFAULT 0,
  `voted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `nik`, `name`, `rt_rw`, `tps_number`, `is_voted`, `voted_at`, `created_at`) VALUES
(1, '3171010101900001', 'Budi Santoso', 'RT 01 / RW 01', 1, 0, NULL, '2026-08-18 08:36:21'),
(2, '3171010101900002', 'Dewi Lestari', 'RT 01 / RW 01', 2, 0, NULL, '2026-08-18 08:36:21'),
(3, '3171010101900003', 'Eko Prasetyo', 'RT 02 / RW 01', 3, 0, NULL, '2026-08-18 08:36:21'),
(4, '3171010101900004', 'Fitri Handayani', 'RT 02 / RW 01', 4, 0, NULL, '2026-08-18 08:36:21'),
(5, '3171010101900005', 'Hendra Gunawan', 'RT 03 / RW 02', 5, 0, NULL, '2026-08-18 08:36:21'),
(6, '3171010101900006', 'Indah Permata', 'RT 03 / RW 02', 6, 0, NULL, '2026-08-18 08:36:21'),
(7, '3171010101900007', 'Joko Susilo', 'RT 04 / RW 02', 7, 0, NULL, '2026-08-18 08:36:21'),
(8, '3171010101900008', 'Karisma Putri', 'RT 04 / RW 02', 8, 0, NULL, '2026-08-18 08:36:21'),
(9, '3171010101900009', 'Lukman Hakim', 'RT 05 / RW 03', 9, 0, NULL, '2026-08-18 08:36:21'),
(10, '3171010101900010', 'Maya Sari', 'RT 05 / RW 03', 10, 0, NULL, '2026-08-18 08:36:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `candidate_number` (`candidate_number`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Indexes for table `tps_ballots`
--
ALTER TABLE `tps_ballots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tps_officers`
--
ALTER TABLE `tps_officers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tps_number` (`tps_number`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tps_ballots`
--
ALTER TABLE `tps_ballots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tps_officers`
--
ALTER TABLE `tps_officers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
