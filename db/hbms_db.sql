-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2022 at 10:59 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hbms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Admin, 1=Staff',
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Deactive, 1=Active',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `gender`, `date_of_birth`, `phone`, `address`, `city`, `state`, `postal_code`, `country`, `admin_comment`, `role_as`, `profile_photo`, `cover_photo`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Raisul', 'Islam', 'admin@gmail.com', NULL, '$2y$10$YgNr5xt2kIz4rBtq1H6TzOpmMzi1T.YTMVxIDCdGwgzQvlGYofmxO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, NULL, '2022-11-21 00:52:22', '2022-11-21 00:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hb_country`
--

CREATE TABLE `hb_country` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Deactive, 1=Active',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hb_facilities`
--

CREATE TABLE `hb_facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_decription` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Deactive, 1=Active',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_facilities`
--

INSERT INTO `hb_facilities` (`id`, `name`, `slug`, `description`, `image`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Room Service', 'room-service', 'Room Service', 'room-service.png', 'Room Service', 'Room Service', 'Room Service', 1, 1, '0', NULL, '2022-11-21 03:18:46', '2022-11-21 03:18:46'),
(2, 'Breakfast', 'breakfast', 'Breakfast', 'breakfast.png', 'Breakfast', 'Breakfast', 'Breakfast', 1, 1, '0', NULL, '2022-11-21 03:19:07', '2022-11-21 03:19:07'),
(3, 'Double Bed', 'double-bed', 'Double Bed', 'double-bed.png', 'Double Bed', 'Double Bed', 'Double Bed', 1, 1, '0', NULL, '2022-11-21 03:19:31', '2022-11-21 03:19:31'),
(4, 'Single Bed', 'single-bed', 'Single Bed', 'single-bed.png', 'Single Bed', 'Single Bed', 'Single Bed', 1, 1, '0', NULL, '2022-11-21 03:25:54', '2022-11-21 03:25:54'),
(5, 'TV', 'tv', 'TV', 'tv.png', 'TV', 'TV', 'TV', 1, 1, '0', NULL, '2022-11-21 03:26:22', '2022-11-21 03:26:22'),
(6, 'Fridge', 'fridge', 'Fridge', 'fridge.png', 'Fridge', 'Fridge', 'Fridge', 1, 1, '0', NULL, '2022-11-21 03:26:45', '2022-11-21 03:26:45'),
(7, 'Geyser', 'geyser', 'Geyser', 'geyser.png', 'Geyser', 'Geyser', 'Geyser', 1, 1, '0', NULL, '2022-11-21 03:27:15', '2022-11-21 03:27:15'),
(8, 'WiFi', 'wifi', 'WiFi', 'wifi.png', 'WiFi', 'WiFi', 'WiFi', 1, 1, '0', NULL, '2022-11-21 03:27:58', '2022-11-21 03:27:58'),
(9, 'Intercom', 'intercom', 'Intercom', 'intercom.png', 'Intercom', 'Intercom', 'Intercom', 1, 1, '0', '0', '2022-11-21 03:28:24', '2022-11-21 03:28:38');

-- --------------------------------------------------------

--
-- Table structure for table `hb_rooms`
--

CREATE TABLE `hb_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_decription` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Deactive, 1=Active',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_rooms`
--

INSERT INTO `hb_rooms` (`id`, `name`, `slug`, `short_description`, `long_description`, `quantity`, `price`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Suite', 'Suite', 'Suite', '<p>Suite<br></p>', 10, 3000, 'Suite', 'Suite', 'Suite', 1, 1, '0', NULL, '2022-11-21 03:30:19', '2022-11-21 03:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `hb_roomtype`
--

CREATE TABLE `hb_roomtype` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_decription` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Deactive, 1=Active',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_roomtype`
--

INSERT INTO `hb_roomtype` (`id`, `name`, `slug`, `description`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'City View', 'city-view', 'City View', 'City View', 'City View', 'City View', 1, 1, '0', NULL, '2022-11-21 03:16:45', '2022-11-21 03:16:45'),
(2, 'Balcony', 'balcony', 'Balcony', 'Balcony', 'Balcony', 'Balcony', 1, 1, '0', NULL, '2022-11-21 03:25:24', '2022-11-21 03:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `hb_roomtype_view`
--

CREATE TABLE `hb_roomtype_view` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `roomtype_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_roomtype_view`
--

INSERT INTO `hb_roomtype_view` (`id`, `room_id`, `roomtype_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hb_room_facilities`
--

CREATE TABLE `hb_room_facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `facility_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_room_facilities`
--

INSERT INTO `hb_room_facilities` (`id`, `room_id`, `facility_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 4, NULL, NULL),
(4, 1, 5, NULL, NULL),
(5, 1, 7, NULL, NULL),
(6, 1, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hb_room_images`
--

CREATE TABLE `hb_room_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_room_images`
--

INSERT INTO `hb_room_images` (`id`, `room_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/rooms/Suite-1669023019-1.jpg', '2022-11-21 03:30:19', '2022-11-21 03:30:19'),
(2, 1, 'uploads/rooms/Suite-1669023019-2.jpg', '2022-11-21 03:30:19', '2022-11-21 03:30:19');

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
(5, '2022_11_21_063014_create_admins_table', 2),
(6, '2022_11_21_074902_create_hb_facilities_table', 3),
(7, '2022_11_21_074949_create_hb_roomtype_table', 3),
(8, '2022_11_21_075024_create_hb_rooms_table', 3),
(9, '2022_11_21_075227_create_hb_country_table', 3),
(10, '2022_11_21_080237_create_hb_room_images_table', 4),
(11, '2022_11_21_080329_create_hb_roomtype_view_table', 5),
(12, '2022_11_21_080358_create_hb_room_facilities_table', 6);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Deactive, 1=Active',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `gender`, `date_of_birth`, `phone`, `address`, `city`, `state`, `postal_code`, `country`, `admin_comment`, `profile_photo`, `cover_photo`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Raisul', 'Islam', 'raisul.syp@gmail.com', NULL, '$2y$10$CWvBdsZ5lEzrag0p/HhQze7nZSbyvE7zPuYzAHoqmQ.JVoJe/pKE.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2022-11-21 00:27:21', '2022-11-21 00:27:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hb_country`
--
ALTER TABLE `hb_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_facilities`
--
ALTER TABLE `hb_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_rooms`
--
ALTER TABLE `hb_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_roomtype`
--
ALTER TABLE `hb_roomtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_roomtype_view`
--
ALTER TABLE `hb_roomtype_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_roomtype_view_room_id_foreign` (`room_id`),
  ADD KEY `hb_roomtype_view_roomtype_id_foreign` (`roomtype_id`);

--
-- Indexes for table `hb_room_facilities`
--
ALTER TABLE `hb_room_facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_room_facilities_room_id_foreign` (`room_id`),
  ADD KEY `hb_room_facilities_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `hb_room_images`
--
ALTER TABLE `hb_room_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_room_images_room_id_foreign` (`room_id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hb_country`
--
ALTER TABLE `hb_country`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hb_facilities`
--
ALTER TABLE `hb_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hb_rooms`
--
ALTER TABLE `hb_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hb_roomtype`
--
ALTER TABLE `hb_roomtype`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hb_roomtype_view`
--
ALTER TABLE `hb_roomtype_view`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hb_room_facilities`
--
ALTER TABLE `hb_room_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hb_room_images`
--
ALTER TABLE `hb_room_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hb_roomtype_view`
--
ALTER TABLE `hb_roomtype_view`
  ADD CONSTRAINT `hb_roomtype_view_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `hb_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hb_roomtype_view_roomtype_id_foreign` FOREIGN KEY (`roomtype_id`) REFERENCES `hb_roomtype` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_room_facilities`
--
ALTER TABLE `hb_room_facilities`
  ADD CONSTRAINT `hb_room_facilities_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `hb_facilities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hb_room_facilities_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `hb_rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_room_images`
--
ALTER TABLE `hb_room_images`
  ADD CONSTRAINT `hb_room_images_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `hb_rooms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
