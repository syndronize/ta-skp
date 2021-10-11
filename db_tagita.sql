-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2021 at 06:11 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tagita`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto_numbers`
--

CREATE TABLE `auto_numbers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_03_055212_create_auto_numbers', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_09_19_165240_create_roles_table', 1),
(6, '2021_04_23_090810_create_outputs_table', 1),
(7, '2021_04_23_090856_create_periodes_table', 1),
(8, '2021_04_23_090926_create_units_table', 1),
(9, '2021_04_23_091243_create_rank_groups_table', 1),
(10, '2021_04_23_091314_create_positions_table', 1),
(11, '2021_04_23_091354_create_skps_table', 1),
(12, '2021_04_23_091419_create_targets_table', 1),
(13, '2021_04_23_091520_create_realiations_table', 1),
(14, '2021_09_19_165613_add_relation_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outputs`
--

CREATE TABLE `outputs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `outputs`
--

INSERT INTO `outputs` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'jiyuio', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periodes`
--

CREATE TABLE `periodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periodes`
--

INSERT INTO `periodes` (`id`, `start_date`, `finish_date`, `created_at`, `updated_at`) VALUES
(1, '2021-09-14', '2021-09-22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Rektor', NULL, NULL),
(2, 1, 'WR 1', NULL, NULL),
(3, 1, 'WR 2', NULL, NULL),
(4, 1, 'WR 3', NULL, NULL),
(5, 2, 'Dekan', NULL, NULL),
(6, 5, 'Ketua Jurusan', NULL, NULL),
(7, 6, 'Dosen ', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rank_groups`
--

CREATE TABLE `rank_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rank_groups`
--

INSERT INTO `rank_groups` (`id`, `name`, `group`, `created_at`, `updated_at`) VALUES
(1, 'Penata Muda', 'Gol. III/a', NULL, NULL),
(2, 'Penata Muda Tk. I', 'Gol. III/b', NULL, NULL),
(3, 'Penata', 'Gol. III/c', NULL, NULL),
(4, 'Penata Tk. I', 'Gol. III/d', NULL, NULL),
(5, 'Penata Tk. I', 'Gol. IV/a', NULL, NULL),
(6, 'Pembina', 'Gol. IV/b', NULL, NULL),
(7, 'Pembina Tk. I', 'Gol. IV/a', NULL, NULL),
(8, 'Pembina Utama Muda', 'Gol. IV/b', NULL, NULL),
(9, 'Pembina Utama Madya', 'Gol. IV/c', NULL, NULL),
(10, 'Pembina Utama', 'Gol. IV/d', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `realiations`
--

CREATE TABLE `realiations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mutu` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Pegawai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skps`
--

CREATE TABLE `skps` (
  `nip_rated` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode_id` bigint(20) UNSIGNED NOT NULL,
  `rated_unit_id` bigint(20) UNSIGNED NOT NULL,
  `rated_position_id` bigint(20) UNSIGNED NOT NULL,
  `rated_rankgroup_id` bigint(20) UNSIGNED NOT NULL,
  `commitment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discipline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cooperation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leadership` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_oriented` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objection_rated` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_evaluator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `superior_decision` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recommendation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `date_given_to_superiors` date NOT NULL,
  `evaluator_rankgroup_id` bigint(20) UNSIGNED NOT NULL,
  `nip_evaluator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evaluator_unit_id` bigint(20) UNSIGNED NOT NULL,
  `evaluator_position_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skps`
--

INSERT INTO `skps` (`nip_rated`, `periode_id`, `rated_unit_id`, `rated_position_id`, `rated_rankgroup_id`, `commitment`, `discipline`, `cooperation`, `leadership`, `integrity`, `service_oriented`, `objection_rated`, `response_evaluator`, `superior_decision`, `recommendation`, `start_date`, `date_given_to_superiors`, `evaluator_rankgroup_id`, `nip_evaluator`, `evaluator_unit_id`, `evaluator_position_id`, `created_at`, `updated_at`) VALUES
('2222333344', 1, 4, 2, 3, 'In reprehenderit non', 'Impedit voluptates', 'Fuga Dolore laborum', 'Et fuga Id commodi', 'At tenetur facilis o', 'Cupiditate voluptate', 'Eiusmod sint in id', 'Praesentium laudanti', 'Sint amet deserunt', 'Ratione eum nobis fu', '2005-10-06', '1978-07-18', 6, '1112111211', 5, 3, '2021-09-23 07:22:35', '2021-09-23 07:22:44');

-- --------------------------------------------------------

--
-- Table structure for table `targets`
--

CREATE TABLE `targets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activities` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `output_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mutu` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_rated` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periode_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `targets`
--

INSERT INTO `targets` (`id`, `activities`, `credit_number`, `ak`, `quantity`, `output_id`, `mutu`, `time`, `cost`, `nip_rated`, `periode_id`, `type`, `Parent_id`, `created_at`, `updated_at`) VALUES
(2, 'Iure deleniti delect', '621', 'Illo illo minus adip', '59', 1, 'Eligendi et mollitia', 'Cillum in ad laboris', 'Nesciunt anim et ma', '4444555533', 1, 'Est quia id magni mi', 2, '2021-09-27 01:27:13', '2021-09-28 01:51:34'),
(3, 'Ullamco cum eum repe', '628', 'Praesentium ex ab do', '345', 1, 'Cillum ut eligendi d', 'Elit molestiae labo', 'Officia explicabo E', '1112111211', 1, 'Tempora ea consequun', 3, '2021-09-28 02:07:34', '2021-09-28 02:15:41'),
(6, 'Inventore in et ad q', '822', 'Consequuntur enim po', '454', 1, 'Voluptates qui lauda', 'Dolores voluptatem s', 'At quis error alias', '2222333344', 1, 'Ut cupidatat non eos', 6, '2021-09-28 02:14:09', '2021-09-28 02:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Unand', NULL, NULL),
(2, 1, 'FTI', NULL, NULL),
(3, 1, 'Hukum', NULL, NULL),
(4, 1, 'Teknik', NULL, NULL),
(5, 2, 'SI', NULL, NULL),
(6, 2, 'SK', NULL, NULL),
(7, 3, 'Hukum Perdata', NULL, NULL),
(8, 3, 'Hukum Perdana', NULL, NULL),
(9, 4, 'Teknik Lingkungan', NULL, NULL),
(10, 4, 'Teknik Industri', NULL, NULL),
(11, 4, 'Teknik Sipil', NULL, NULL),
(12, 4, 'Teknik Mesin', NULL, NULL),
(13, 4, 'Teknik Elektro', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `nip` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `rank_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`nip`, `name`, `unit_id`, `position_id`, `rank_id`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
('11111222233', 'Dekan FTI', 2, 5, 7, 'dekanfti@gmail.com', NULL, '$2y$10$17I.1Cf4x.4vRehKIWD2Se2CyK1sp6h8O.ZsNkpb40QFMoHHUY0Ni', 2, '74eT10UDtJfTuN2UYOTh1omjGhc5RC', NULL, NULL),
('1112111211', 'Dekan Hukum', 3, 5, 7, 'dekanhkm@gmail.com', NULL, '$2y$10$WOE0XlrD5XHwdu3S9QmpSeOl.F5FGG9/Ybxng5MESJJaTLmsFvQ4y', 2, 'VuN5h5BAqe6b4a7zHwg2UWBUEBoMDi', NULL, NULL),
('123', 'Jillian Ayala', 3, 2, 9, 'wefi@mailinator.com', NULL, '$2y$10$HoiLzRGo0iGhebWmHzqjfuuYFkITHOFBBltAlQ1WoQhqlHWNtPMgG', 2, NULL, '2021-09-23 07:19:29', '2021-09-23 07:19:29'),
('1234512345', 'Admin Test', 1, 1, 1, 'admin@gmail.com', NULL, '$2y$10$5V/LeqH5yT.KNGM4WxyrcuoB8n6ItQHvB1ATWVT.xKp.asleB2QWa', 1, 'DO8I52YK9ArzJMNrSHYNlHJVtyvmSbhNjN5WCKZocmI5PEh4jvg7u3DPSiyK', NULL, NULL),
('2222333344', 'Kajur Hukum Perdata', 7, 6, 7, 'kajurhkp@gmail.com', NULL, '$2y$10$pHdtFB8NGfQFmYcY165P.e7VBYkF3RW3o8cpbNEojiZDjUurGNPVC', 2, 'bZnBTU1ABBR7OuYaUPNzPmfHWMX0m3', NULL, NULL),
('2222333345', 'Kajur SI', 5, 6, 7, 'kajursi@gmail.com', NULL, '$2y$10$mSUrqUD.X8BAVJVMkHGnuexm62Dq.eehta4j9U/7Tneti.VCTgRYK', 2, 'b9X3BW3Xl46fPcsUbR30BXeCjII54e', NULL, NULL),
('3332222444', 'Kajur Hukum Perdana', 8, 6, 7, 'kajurhkmn@gmail.com', NULL, '$2y$10$FwwxBd3IaMmnvtdSM0RkzOJNAtJWQ2KS.UZyvB9FCQYkTbYeDjOj6', 2, 'stjg9LN8Va7g2o4LEgK5Bdh8PETo2k', NULL, NULL),
('4444555533', 'Kajur SK', 6, 6, 7, 'kajursk@gmail.com', NULL, '$2y$10$NwPMIWfA7klFldY17PIaDuLTo5r5lnehpWXKkBs7BhsLeBvq7jm1S', 2, 'Ase9wX5Gti6XGsdmPuIXXJgtYsVcEx', NULL, NULL),
('8888899999', 'Dosen SI', 5, 7, 1, 'dosensi@gmail.com', NULL, '$2y$10$0FlLwCBdUTVM/w53Y287JO86JaBKlMt2YP8P18UD729tdERW9lthO', 2, '75y6ThaKQ85yd1wNz34h7xI1i7dId0', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto_numbers`
--
ALTER TABLE `auto_numbers`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `outputs`
--
ALTER TABLE `outputs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `periodes`
--
ALTER TABLE `periodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `positions_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `rank_groups`
--
ALTER TABLE `rank_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realiations`
--
ALTER TABLE `realiations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skps`
--
ALTER TABLE `skps`
  ADD PRIMARY KEY (`nip_rated`),
  ADD KEY `skps_periode_id_foreign` (`periode_id`),
  ADD KEY `skps_rated_unit_id_foreign` (`rated_unit_id`),
  ADD KEY `skps_rated_position_id_foreign` (`rated_position_id`),
  ADD KEY `skps_rated_rankgroup_id_foreign` (`rated_rankgroup_id`),
  ADD KEY `skps_nip_evaluator_foreign` (`nip_evaluator`),
  ADD KEY `skps_evaluator_unit_id_foreign` (`evaluator_unit_id`),
  ADD KEY `skps_evaluator_position_id_foreign` (`evaluator_position_id`),
  ADD KEY `skps_evaluator_rankgroup_id_foreign` (`evaluator_rankgroup_id`);

--
-- Indexes for table `targets`
--
ALTER TABLE `targets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `targets_nip_rated_foreign` (`nip_rated`),
  ADD KEY `targets_periode_id_foreign` (`periode_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`nip`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_unit_id_foreign` (`unit_id`),
  ADD KEY `users_position_id_foreign` (`position_id`),
  ADD KEY `users_rank_id_foreign` (`rank_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto_numbers`
--
ALTER TABLE `auto_numbers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `outputs`
--
ALTER TABLE `outputs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `periodes`
--
ALTER TABLE `periodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rank_groups`
--
ALTER TABLE `rank_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `realiations`
--
ALTER TABLE `realiations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `targets`
--
ALTER TABLE `targets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `realiations`
--
ALTER TABLE `realiations`
  ADD CONSTRAINT `realiations_id_foreign` FOREIGN KEY (`id`) REFERENCES `targets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skps`
--
ALTER TABLE `skps`
  ADD CONSTRAINT `skps_evaluator_position_id_foreign` FOREIGN KEY (`evaluator_position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skps_evaluator_rankgroup_id_foreign` FOREIGN KEY (`evaluator_rankgroup_id`) REFERENCES `rank_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skps_evaluator_unit_id_foreign` FOREIGN KEY (`evaluator_unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skps_nip_evaluator_foreign` FOREIGN KEY (`nip_evaluator`) REFERENCES `users` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skps_nip_rated_foreign` FOREIGN KEY (`nip_rated`) REFERENCES `users` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skps_periode_id_foreign` FOREIGN KEY (`periode_id`) REFERENCES `periodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skps_rated_position_id_foreign` FOREIGN KEY (`rated_position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skps_rated_rankgroup_id_foreign` FOREIGN KEY (`rated_rankgroup_id`) REFERENCES `rank_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skps_rated_unit_id_foreign` FOREIGN KEY (`rated_unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `targets`
--
ALTER TABLE `targets`
  ADD CONSTRAINT `targets_nip_rated_foreign` FOREIGN KEY (`nip_rated`) REFERENCES `users` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `targets_periode_id_foreign` FOREIGN KEY (`periode_id`) REFERENCES `periodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_rank_id_foreign` FOREIGN KEY (`rank_id`) REFERENCES `rank_groups` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
