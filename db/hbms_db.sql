-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 05:10 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

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
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Admin, 1=Staff',
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

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `gender`, `date_of_birth`, `phone`, `address`, `city`, `state`, `postal_code`, `country`, `admin_comment`, `profile_photo`, `cover_photo`, `role_as`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Raisul', 'Islam', 'admin@gmail.com', NULL, '$2y$10$1usa4p6aEF36rUi1Eivh6.ItXPXh3sOWKYClwArQZ1uOM/UMulwB6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, '2022-12-25 10:39:31', '2022-12-25 10:39:31');

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
-- Table structure for table `hb_bookings`
--

CREATE TABLE `hb_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guest_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `checkin_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkin_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_adults` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_childs` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Pending, 1=Booked, 2=Cancel',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `booking_comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_bookings`
--

INSERT INTO `hb_bookings` (`id`, `guest_id`, `room_id`, `staff_id`, `checkin_date`, `checkout_date`, `checkin_time`, `checkout_time`, `total_adults`, `total_childs`, `booking_status`, `is_delete`, `booking_comment`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-12-30', '2022-12-31', '14:00', '12:00', '2', '0', 1, 1, 'Admin', '1', NULL, '2022-12-27 00:17:07', '2022-12-27 00:17:07');

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
(1, 'Room Service', 'room-service', 'Room Service', 'room-service.png', 'Room Service', 'Room Service', 'Room Service', 1, 1, '0', '1', '2022-11-20 21:18:46', '2022-12-26 05:37:55'),
(2, 'Breakfast', 'breakfast', 'Breakfast', 'breakfast.png', 'Breakfast', 'Breakfast', 'Breakfast', 1, 1, '0', '1', '2022-11-20 21:19:07', '2022-12-26 05:38:11'),
(3, 'Double Bed', 'double-bed', 'Double Bed', 'double-bed.png', 'Double Bed', 'Double Bed', 'Double Bed', 1, 1, '0', '1', '2022-11-20 21:19:31', '2022-12-26 05:38:25'),
(4, 'Single Bed', 'single-bed', 'Single Bed', 'single-bed.png', 'Single Bed', 'Single Bed', 'Single Bed', 1, 1, '0', '1', '2022-11-20 21:25:54', '2022-12-26 05:38:42'),
(5, 'TV', 'tv', 'TV', 'tv.png', 'TV', 'TV', 'TV', 1, 1, '0', '1', '2022-11-20 21:26:22', '2022-12-26 05:38:58'),
(6, 'Fridge', 'fridge', 'Fridge', 'fridge.png', 'Fridge', 'Fridge', 'Fridge', 1, 1, '0', '1', '2022-11-20 21:26:45', '2022-12-26 05:39:14'),
(7, 'Geyser', 'geyser', 'Geyser', 'geyser.png', 'Geyser', 'Geyser', 'Geyser', 1, 1, '0', '1', '2022-11-20 21:27:15', '2022-12-26 05:39:32'),
(8, 'WiFi', 'wifi', 'WiFi', 'wifi.png', 'WiFi', 'WiFi', 'WiFi', 1, 1, '0', '1', '2022-11-20 21:27:58', '2022-12-26 05:39:48'),
(9, 'Intercom', 'intercom', 'Intercom', 'intercom.png', 'Intercom', 'Intercom', 'Intercom', 1, 1, '0', '1', '2022-11-20 21:28:24', '2022-12-26 05:40:03');

-- --------------------------------------------------------

--
-- Table structure for table `hb_halls`
--

CREATE TABLE `hb_halls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_halls`
--

INSERT INTO `hb_halls` (`id`, `name`, `slug`, `short_description`, `long_description`, `logo_image`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Board Room', 'board-room', 'The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For Board Room 30 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p style=\"text-align: left;\">The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For Board Room 30 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Board Room', 'Board Room', 'Board Room', 1, 1, '0', '1', '2022-12-13 20:54:56', '2022-12-29 10:07:26'),
(2, 'Olive Hall', 'olive-hall', 'The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-VisuThe Hotel Has 3 Dedicated Conference And Event Venues Has The Olive Hall Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p>The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-VisuThe Hotel Has 3 Dedicated Conference And Event Venues Has The Olive Hall Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Olive Hall', 'Olive Hall', 'Olive Hall', 1, 1, '0', '1', '2022-12-13 22:58:33', '2022-12-29 10:07:39'),
(3, 'Tulip Hall', 'tulip-hall', 'The Hotel Has 3 The Hotel Has 3 Dedicated Conference And Event Venues Has The Tulip Hall Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p>The Hotel Has 3 The Hotel Has 3 Dedicated Conference And Event Venues Has The Tulip Hall Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Tulip Hall', 'Tulip Hall', 'Tulip Hall', 1, 1, '0', '1', '2022-12-13 22:59:14', '2022-12-29 10:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `hb_hall_images`
--

CREATE TABLE `hb_hall_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hall_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hb_offers`
--

CREATE TABLE `hb_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_offers`
--

INSERT INTO `hb_offers` (`id`, `name`, `slug`, `short_description`, `long_description`, `start_date`, `end_date`, `thumb`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'New Year Celebration 2023', 'new-year-celebration-2023', 'New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.', '<h4><span style=\"font-weight: bolder;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.</span></h4><h4><span style=\"font-weight: bolder;\"><br></span></h4><p>New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.&nbsp;<span style=\"font-size: 0.875rem;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.</span></p>', '2022-12-31 00:00:02', '2023-01-03 00:00:02', 'new-year-celebration-2023.png', 'New Year Celebration 2023', 'New Year Celebration 2023', 'New Year Celebration 2023', 1, 1, '1', NULL, '2022-12-26 04:54:14', '2022-12-26 04:54:14'),
(2, 'Valentine\'s Day Celebration 2023', 'valentines-day-celebration-2023', 'Valentine\'s Day Celebration 2023. Valentine\'s Day Celebration 2023. Valentine\'s Day Celebration 2023.', '<h4>Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.</h4><p>Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;<span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span></p>', '2023-02-13 11:59:17', '2023-02-14 23:59:17', 'valentines-day-celebration-2023.png', 'Valentine\'s Day Celebration 2023', 'Valentine\'s Day Celebration 2023', 'Valentine\'s Day Celebration 2023', 1, 1, '1', NULL, '2022-12-26 05:02:19', '2022-12-26 05:02:19');

-- --------------------------------------------------------

--
-- Table structure for table `hb_restaurents`
--

CREATE TABLE `hb_restaurents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_restaurents`
--

INSERT INTO `hb_restaurents` (`id`, `name`, `slug`, `short_description`, `long_description`, `logo_image`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Cafe 24', 'cafe-24', 'Located on the ground level, it is a modern delight. Enjoy lively chit chat in a Comfortable gathering place.', '<p>Located on the ground level, it is a modern delight .Enjoy lively chit chat in a Comfortable gathering place .A wide selection of premium coffees, teas and freshly squeezed juices is served throughout the day and our varieties of smoothie is a healthy way to Satisfy your sweet tooth.</p><h3 style=\"text-align: center; \"><b>Opening hours: 24 hrs open</b></h3>', 'cafe-24.png', 'Cafe 24', 'Cafe 24', 'Cafe 24', 1, 1, '0', '1', '2022-12-13 19:03:04', '2022-12-29 09:48:34'),
(2, 'Taste Of Heaven', 'taste-of-heaven', 'Taste of Heaven is a contemporary all day dining restaurant where modern design innovative cuisine. Round the clock dining destination showcases an array of international delights.', '<p>Taste of Heaven is a contemporary all day dining restaurant where modern design innovative cuisine. Round the clock dining destination showcases an array of international delights.</p><h3 style=\"text-align: center; \"><b>Opening hours: 06.30 hrs to 22.30 hrs</b></h3>', 'taste-of-heaven.png', 'Taste Of Heaven', 'Taste Of Heaven', 'Taste Of Heaven', 1, 1, '0', '1', '2022-12-13 19:04:00', '2022-12-29 09:49:10'),
(3, 'Sky Line', 'sky-line', 'A Casual dining 60 seater barbeque and gril specialty dining at the pool side overlooking amazing natural green view of Dhaka.', '<p>A Casual dining 60 seater barbeque and gril specialty dining at the pool side overlooking amazing natural green view of Dhaka.</p><h3 style=\"text-align: center; \"><b>OPENING HOURS: 17.00 hrs to 23.00 hrs</b></h3>', 'sky-line.png', 'Sky Line', 'Sky Line', 'Sky Line', 1, 1, '0', '1', '2022-12-13 19:05:01', '2022-12-29 09:49:43'),
(4, 'Noxx Bar', 'noxx-bar', 'Noxx Bar', '<p>Noxx Bar<br></p>', 'noxx-bar.png', 'Noxx Bar', 'Noxx Bar', 'Noxx Bar', 1, 1, '0', '1', '2022-12-13 19:05:28', '2022-12-29 09:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `hb_restaurent_images`
--

CREATE TABLE `hb_restaurent_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurent_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `max_adults` int(11) DEFAULT NULL,
  `max_childs` int(11) DEFAULT NULL,
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

INSERT INTO `hb_rooms` (`id`, `name`, `slug`, `short_description`, `long_description`, `max_adults`, `max_childs`, `quantity`, `price`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Deluxe', 'deluxe', 'Deluxe', '<p>Deluxe<br></p>', 2, 1, 10, 220, 'Deluxe', 'Deluxe', 'Deluxe', 1, 1, '1', NULL, '2022-12-26 05:16:35', '2022-12-26 05:16:35'),
(2, 'Super Deluxe King', 'super-deluxe-king', 'Super Deluxe King', '<p>Super Deluxe King<br></p>', 3, 2, 10, 260, 'Super Deluxe King', 'Super Deluxe King', 'Super Deluxe King', 1, 1, '0', '1', '2022-12-14 18:45:59', '2022-12-26 05:21:41'),
(3, 'Premium Delux', 'premium-delux', 'Premium Delux', '<p>Premium Delux<br></p>', 3, 3, 10, 280, 'Premium Delux', 'Premium Delux', 'Premium Delux', 1, 1, '0', '1', '2022-12-14 18:47:55', '2022-12-26 05:23:04'),
(4, 'Premium Delux Twin', 'premium-delux-twin', 'Premium Delux Twin', '<p>Premium Delux Twin<br></p>', 4, 2, 10, 280, 'Premium Delux Twin', 'Premium Delux Twin', 'Premium Delux Twin', 1, 1, '0', '1', '2022-12-14 18:49:23', '2022-12-26 05:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `hb_roomtype`
--

CREATE TABLE `hb_roomtype` (
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
-- Dumping data for table `hb_roomtype`
--

INSERT INTO `hb_roomtype` (`id`, `name`, `slug`, `description`, `image`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'City View', 'city-view', 'City View', 'city-view.png', 'City View', 'City View', NULL, 1, 1, '0', '1', '2022-11-20 21:16:45', '2022-12-26 05:40:26'),
(2, 'Balcony', 'balcony', 'Balcony', 'balcony.png', 'Balcony', 'Balcony', NULL, 1, 1, '0', '1', '2022-11-20 21:25:24', '2022-12-26 05:40:44'),
(3, 'Sea View', 'sea-view', 'Sea View', 'sea-view.png', 'Sea View', 'Sea View', NULL, 1, 1, '0', '1', '2022-12-19 17:58:02', '2022-12-26 05:40:59');

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
(1, 1, 2, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 3, 2, NULL, NULL),
(5, 3, 3, NULL, NULL),
(6, 4, 1, NULL, NULL),
(7, 4, 2, NULL, NULL),
(8, 4, 3, NULL, NULL);

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
(2, 1, 3, NULL, NULL),
(3, 1, 5, NULL, NULL),
(4, 1, 9, NULL, NULL),
(5, 2, 1, NULL, NULL),
(6, 2, 2, NULL, NULL),
(7, 2, 3, NULL, NULL),
(8, 2, 4, NULL, NULL),
(9, 2, 5, NULL, NULL),
(10, 2, 8, NULL, NULL),
(11, 3, 1, NULL, NULL),
(12, 3, 2, NULL, NULL),
(13, 3, 3, NULL, NULL),
(14, 3, 4, NULL, NULL),
(15, 3, 5, NULL, NULL),
(16, 3, 7, NULL, NULL),
(17, 3, 8, NULL, NULL),
(18, 4, 1, NULL, NULL),
(19, 4, 2, NULL, NULL),
(20, 4, 3, NULL, NULL),
(21, 4, 4, NULL, NULL),
(22, 4, 5, NULL, NULL),
(23, 4, 6, NULL, NULL),
(24, 4, 7, NULL, NULL),
(25, 4, 8, NULL, NULL);

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
(1, 1, 'uploads/rooms/deluxe-1672053395-1.jfif', '2022-12-26 05:16:35', '2022-12-26 05:16:35'),
(2, 1, 'uploads/rooms/deluxe-1672053395-2.jpg', '2022-12-26 05:16:35', '2022-12-26 05:16:35'),
(3, 1, 'uploads/rooms/deluxe-1672053395-3.jpg', '2022-12-26 05:16:35', '2022-12-26 05:16:35'),
(4, 2, 'uploads/rooms/super-deluxe-king-1672053701-1.jpg', '2022-12-26 05:21:42', '2022-12-26 05:21:42'),
(5, 2, 'uploads/rooms/super-deluxe-king-1672053702-2.jfif', '2022-12-26 05:21:42', '2022-12-26 05:21:42'),
(6, 2, 'uploads/rooms/super-deluxe-king-1672053702-3.jpg', '2022-12-26 05:21:42', '2022-12-26 05:21:42'),
(7, 3, 'uploads/rooms/premium-delux-1672053784-1.jpg', '2022-12-26 05:23:04', '2022-12-26 05:23:04'),
(8, 3, 'uploads/rooms/premium-delux-1672053784-2.jpg', '2022-12-26 05:23:04', '2022-12-26 05:23:04'),
(9, 4, 'uploads/rooms/premium-delux-twin-1672053838-1.jpg', '2022-12-26 05:23:58', '2022-12-26 05:23:58'),
(10, 4, 'uploads/rooms/premium-delux-twin-1672053838-2.jpg', '2022-12-26 05:23:58', '2022-12-26 05:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `hb_settings`
--

CREATE TABLE `hb_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_fb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_tw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_insta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_yt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_settings`
--

INSERT INTO `hb_settings` (`id`, `name`, `phone`, `email`, `address`, `logo`, `icon`, `social_fb`, `social_tw`, `social_insta`, `social_yt`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'The Zabeer Dhaka', '(+88) 02224470771-73', 'info@thezabeerdhaka.com', 'House-1, Road-2, Sector-1, Uttara Model Town, Dhaka-1230', 'logo-.png', 'icon-.png', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.instagram.com/', 'https://www.youtube.com/', '1', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 1, 1, '1', '1', '2022-12-26 00:35:03', '2022-12-26 02:36:36');

-- --------------------------------------------------------

--
-- Table structure for table `hb_webcontactinfos`
--

CREATE TABLE `hb_webcontactinfos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hotel_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_map` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_sales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_reservation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_reservation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_webcontactinfos`
--

INSERT INTO `hb_webcontactinfos` (`id`, `hotel_name`, `phone`, `email`, `address`, `google_map`, `phone_sales`, `phone_reservation`, `email_sales`, `email_reservation`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'The Zabber Dhaka', '(+88) 02224470771-73', 'info@thezabeerdhaka.com', 'House-1, Road-2, Sector-1, Uttara Model Town, Dhaka-1230', '!1m18!1m12!1m3!1d3648.956907774987!2d90.4037768!3d23.855663900000007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c72f9daef9c5%3A0xe3bc6c9dcb0ba750!2sThe%20Zabeer%20Dhaka!5e0!3m2!1sen!2sbd!4v1670046986535!5m2!1sen!2sbd', NULL, '(+88) 01711 408 969', NULL, 'reservation@thezabeerdhaka.com', '1', 'The Zabber Dhaka', 'The Zabber Dhaka', 'The Zabber Dhaka', 1, 1, '1', '1', '2022-12-26 02:27:19', '2022-12-26 02:32:03'),
(2, 'The Zabber Jashore', '(+88) 01885 000 555', 'sm@zabeerhotel.com', '1256, M M Ali Road, Jashore', '!1m14!1m8!1m3!1d14672.513200846855!2d89.2109886!3d23.165517!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x67b464b45fab99ac!2sThe%20Zabeer%20Jashore!5e0!3m2!1sen!2sbd!4v1670742032127!5m2!1sen!2sbd', NULL, NULL, NULL, NULL, '2', 'The Zabber Jashore', 'The Zabber Jashore', 'The Zabber Jashore', 1, 1, '1', NULL, '2022-12-26 03:51:35', '2022-12-26 03:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `hb_webfacilities`
--

CREATE TABLE `hb_webfacilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_webfacilities`
--

INSERT INTO `hb_webfacilities` (`id`, `name`, `slug`, `description`, `image`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', 'breakfast', 'Complementary Breakfast', 'breakfast.png', '1', 'Complementary Breakfast', 'Complementary Breakfast', 'Complementary Breakfast', 1, 1, '0', '1', '2022-12-12 19:41:42', '2022-12-26 01:30:03'),
(2, 'Bottle of Water', 'bottle-of-water', 'Complimentary Bottle of Water', 'bottle-of-water.png', '2', 'Complimentary Bottle of Water', 'Complimentary Bottle of Water', 'Complimentary Bottle of Water', 1, 1, '0', '1', NULL, '2022-12-26 01:30:29'),
(3, 'Free Wi-fi', 'free-wi-fi', 'Free Wi-fi Access', 'free-wi-fi.png', '3', 'Free Wi-fi Access', 'Free Wi-fi Access', 'Free Wi-fi Access', 1, 1, '0', '1', NULL, '2022-12-26 01:30:57'),
(4, 'Laundry Service', 'laundry-service', 'Express Laundry Service', 'laundry-service.png', '4', 'Express Laundry Service', 'Express Laundry Service', 'Express Laundry Service', 1, 1, '0', '1', NULL, '2022-12-26 01:32:10'),
(5, 'Access of Gym', 'access-of-gym', 'Complimentary Access of Gym', 'access-of-gym.png', '5', 'Complimentary Access of Gym', 'Complimentary Access of Gym', 'Complimentary Access of Gym', 1, 1, '0', '1', NULL, '2022-12-26 01:32:35'),
(6, 'Free Parking', 'free-parking', 'Free Parking', 'free-parking.png', '6', 'Free Parking', 'Free Parking', 'Free Parking', 1, 1, '0', '1', NULL, '2022-12-26 01:33:03'),
(7, 'Airport Pick-up & Drop', 'airport-pick-up-drop', 'Airport Pick-up & Drop', 'airport-pick-up-drop.png', '7', 'Airport Pick-up & Drop', 'Airport Pick-up & Drop', 'Airport Pick-up & Drop', 1, 1, '0', '1', NULL, '2022-12-26 01:34:06'),
(8, 'Daily News Papers', 'daily-news-papers', 'Daily News Papers', 'daily-news-papers.png', '8', 'Daily News Papers', 'Daily News Papers', 'Daily News Papers', 1, 1, '0', '1', NULL, '2022-12-26 01:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `hb_webnavs`
--

CREATE TABLE `hb_webnavs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_webnavs`
--

INSERT INTO `hb_webnavs` (`id`, `name`, `slug`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Home', '', '1', 'Home', 'Home', 'Home', 1, 1, '0', '0', '2022-12-12 17:24:20', '2022-12-16 18:25:51'),
(2, 'Rooms', 'rooms', '2', 'Rooms', 'Rooms', 'Rooms', 1, 1, '0', '0', '2022-12-12 21:43:09', '2022-12-13 23:02:28'),
(3, 'Restaurants', 'restaurants', '3', 'Restaurants', 'Restaurants', 'Restaurants', 1, 1, '0', '0', '2022-12-13 19:07:41', '2022-12-19 18:25:02'),
(4, 'Halls', 'halls', '4', 'Halls', 'Halls', 'Halls', 1, 1, '0', '0', '2022-12-13 23:03:01', '2022-12-13 23:04:11'),
(5, 'Wellness', 'wellnesses', '5', 'Wellness', 'Wellness', 'Wellness', 1, 1, '0', '0', '2022-12-13 23:42:36', '2022-12-19 19:41:32'),
(6, 'About Us', 'about-us', '6', 'About Us', 'About Us', 'About Us', 1, 1, '0', NULL, '2022-12-13 23:42:56', '2022-12-13 23:42:56'),
(7, 'Contact Us', 'contact-us', '7', 'Contact Us', 'Contact Us', 'Contact Us', 1, 1, '0', NULL, '2022-12-13 23:43:18', '2022-12-13 23:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `hb_webpages`
--

CREATE TABLE `hb_webpages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_decription` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_item` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Deactive, 1=Active',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_webpages`
--

INSERT INTO `hb_webpages` (`id`, `name`, `title`, `sub_title`, `short_description`, `long_description`, `slug`, `display_order`, `image`, `meta_title`, `meta_keyword`, `meta_decription`, `footer_item`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'A place that sparks creativity, fuels the imagination and welcomes reflection and relaxation.', 'The Zabeer Dhaka', 'We Offer 5-Star Banquet Spaces, Complete With Catering And Event Management Facilities. Discover The International Favorites Grilled To Perfection In The Live Kitchen. Experiment With Choicest Of Accompaniments And Sauces.The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 200 Delegates.', '<p><span style=\"color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 16px; text-align: justify;\">We Offer 5-Star Banquet Spaces, Complete With Catering And Event Management Facilities. Discover The International Favorites Grilled To Perfection In The Live Kitchen. Experiment With Choicest Of Accompaniments And Sauces.The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.The Ambience And Therapies At Our International Spa Offered By Experienced Professionals Ensure That You Are Rejuvenated.State Of The Art Gymnasium And With An Exercise Studio.Haircare And Beauty Treatments By Trained Stylists.The Elegant Att-Day Three Restaurant Provides A Stunning Atmosphere In Which To Sample Europian,Asian,Thai, Chinese Arabic And Our Own Local Cuisine.</span><br></p>', 'about-us', '1', 'about-us.jpg', 'About Us', 'About Us', 'About Us', 1, 1, 1, '1', NULL, '2022-12-26 00:47:16', '2022-12-26 00:47:16'),
(2, 'Contact Us', 'Contact Us', 'Contact Us', 'Contact Us', '<p>Contact Us<br></p>', 'contact-us', '2', NULL, 'Contact Us', 'Contact Us', 'Contact Us', 1, 1, 1, '1', NULL, '2022-12-26 00:49:07', '2022-12-26 00:49:07'),
(3, 'Offers', 'Offers', 'Offers', 'Offers', '<p>Offers<br></p>', 'offers', '3', NULL, 'Offers', 'Offers', 'Offers', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:39:55'),
(4, 'News', 'News', 'News', 'News', '<p>News<br></p>', 'news', '4', NULL, 'News', 'News', 'News', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:40:53'),
(5, 'Rooms', 'Rooms', 'Rooms', 'Rooms', '<p>Rooms<br></p>', 'rooms', '5', NULL, 'Rooms', 'Rooms', 'Rooms', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:41:12'),
(6, 'Restaurants', 'Restaurants', 'Restaurants', 'Restaurants', '<p>Restaurants<br></p>', 'restaurants', '6', NULL, 'Restaurants', 'Restaurants', 'Restaurants', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:41:27'),
(7, 'Halls', 'Halls', 'Halls', 'Meeting & Events', '<p>Meeting &amp; Events<br></p>', 'halls', '7', NULL, 'Halls', 'Halls', 'Halls', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:42:22'),
(8, 'Wellness', 'Wellness', 'Wellness', 'Wellness', '<p>Wellness<br></p>', 'wellness', '8', NULL, 'Wellness', 'Wellness', 'Wellness', 1, 1, 1, '0', '0', NULL, '2022-12-21 01:50:27'),
(9, 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', '<p>Certificates &amp; Awards<br></p>', 'certificates-awards', '9', NULL, 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:42:54'),
(10, 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', '<p>Booking Cancelation Policy<br></p>', 'booking-cancelation-policy', '10', NULL, 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:43:20'),
(11, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', '<p>Privacy Policy<br></p>', 'privacy-policy', '11', NULL, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', 1, 1, 1, '0', NULL, NULL, NULL),
(12, 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', '<p>Terms &amp; Conditions<br></p>', 'terms-conditions', '12', NULL, 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', 1, 1, 1, '0', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hb_websliders`
--

CREATE TABLE `hb_websliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desktop_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_websliders`
--

INSERT INTO `hb_websliders` (`id`, `name`, `slug`, `desktop_image`, `mobile_image`, `content_1`, `content_2`, `content_3`, `content_4`, `content_5`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Slider 1', 'slider-1', 'desk-slider-1.png', 'mobl-slider-1.png', 'Welcome to', 'The Zabeer Dhaka', 'A place that sparks creativity, fuels the imagination andwelcomes reflection and relaxation.', NULL, NULL, '1', 'Slider 1', 'Slider 1', 'Slider 1', 1, 1, '1', NULL, '2022-12-26 00:44:04', '2022-12-26 00:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `hb_webtestimonials`
--

CREATE TABLE `hb_webtestimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_webtestimonials`
--

INSERT INTO `hb_webtestimonials` (`id`, `name`, `designation`, `company`, `message`, `image`, `slug`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Matiur Rahman', 'Owner', 'Sarothi Enterprise', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text', 'mr-matiur-rahman.jpg', '', '1', 'Mr. Matiur Rahman', 'Mr. Matiur Rahman', 'Mr. Matiur Rahman', 1, 1, '1', NULL, '2022-12-26 01:23:24', '2022-12-26 01:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `hb_wellness`
--

CREATE TABLE `hb_wellness` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_wellness`
--

INSERT INTO `hb_wellness` (`id`, `name`, `slug`, `short_description`, `long_description`, `logo_image`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Spa', 'spa', 'Spa', '<p>Spa<br></p>', 'spa.png', 'Spa', 'Spa', 'Spa', 1, 1, '0', '1', '2022-12-13 23:35:12', '2022-12-29 10:06:32'),
(2, 'Gym', 'gym', 'Gym', '<p>Gym<br></p>', NULL, 'Gym', 'Gym', 'Gym', 1, 1, '0', '1', '2022-12-13 23:35:51', '2022-12-29 10:06:42'),
(3, 'Saloon', 'saloon', 'Saloon', '<p>Saloon<br></p>', NULL, 'Saloon', 'Saloon', 'Saloon', 1, 1, '0', '1', '2022-12-13 23:36:38', '2022-12-29 10:06:53'),
(4, 'Swimming Pool', 'swimming-pool', 'Swimming Pool', '<p>Swimming Pool<br></p>', NULL, 'Swimming Pool', 'Swimming Pool', 'Swimming Pool', 1, 1, '0', '1', '2022-12-13 23:37:31', '2022-12-29 10:07:05');

-- --------------------------------------------------------

--
-- Table structure for table `hb_wellness_images`
--

CREATE TABLE `hb_wellness_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wellness_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2022_11_21_063014_create_admins_table', 1),
(6, '2022_11_21_074902_create_hb_facilities_table', 1),
(7, '2022_11_21_074949_create_hb_roomtype_table', 1),
(8, '2022_11_21_075227_create_hb_country_table', 1),
(9, '2022_12_12_104328_create_hb_rooms_table', 2),
(10, '2022_12_12_105015_create_hb_room_facilities_table', 2),
(11, '2022_12_12_105124_create_hb_roomtype_view_table', 2),
(12, '2022_12_12_105230_create_hb_room_images_table', 2),
(13, '2022_12_13_051525_create_hb_webnavs_table', 2),
(14, '2022_12_13_054447_create_hb_websliders_table', 2),
(15, '2022_12_13_065343_create_hb_webtestimonials_table', 2),
(16, '2022_12_13_071449_create_hb_webfacilities_table', 2),
(17, '2022_12_13_075253_create_hb_webpages_table', 2),
(18, '2022_12_14_062937_create_hb_restaurents_table', 2),
(19, '2022_12_14_063009_create_hb_restaurent_images_table', 2),
(20, '2022_12_14_080240_create_hb_halls_table', 2),
(21, '2022_12_14_080410_create_hb_hall_images_table', 2),
(22, '2022_12_14_111120_create_hb_wellness_table', 2),
(23, '2022_12_14_113257_create_hb_wellness_images_table', 2),
(24, '2022_12_15_093650_create_hb_settings_table', 2),
(25, '2022_12_25_162738_create_hb_bookings_table', 3),
(26, '2022_12_26_074144_create_hb_webcontactinfos_table', 4),
(27, '2022_12_26_095654_create_hb_offers_table', 5);

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
(1, 'Raisul', 'Showmin', 'raisul.syp@gmail.com', NULL, '$2y$10$kwte0lrUblc4rguwE9vyyOUyraOLNT9F1qq3Ds71bbAChqZpTxUjy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2022-12-26 03:59:03', '2022-12-26 03:59:03');

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
-- Indexes for table `hb_bookings`
--
ALTER TABLE `hb_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_bookings_guest_id_foreign` (`guest_id`),
  ADD KEY `hb_bookings_room_id_foreign` (`room_id`),
  ADD KEY `hb_bookings_staff_id_foreign` (`staff_id`);

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
-- Indexes for table `hb_halls`
--
ALTER TABLE `hb_halls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_hall_images`
--
ALTER TABLE `hb_hall_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_hall_images_hall_id_foreign` (`hall_id`);

--
-- Indexes for table `hb_offers`
--
ALTER TABLE `hb_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_restaurents`
--
ALTER TABLE `hb_restaurents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_restaurent_images`
--
ALTER TABLE `hb_restaurent_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_restaurent_images_restaurent_id_foreign` (`restaurent_id`);

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
-- Indexes for table `hb_settings`
--
ALTER TABLE `hb_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_webcontactinfos`
--
ALTER TABLE `hb_webcontactinfos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_webfacilities`
--
ALTER TABLE `hb_webfacilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_webnavs`
--
ALTER TABLE `hb_webnavs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_webpages`
--
ALTER TABLE `hb_webpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_websliders`
--
ALTER TABLE `hb_websliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_webtestimonials`
--
ALTER TABLE `hb_webtestimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_wellness`
--
ALTER TABLE `hb_wellness`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_wellness_images`
--
ALTER TABLE `hb_wellness_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_wellness_images_wellness_id_foreign` (`wellness_id`);

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
-- AUTO_INCREMENT for table `hb_bookings`
--
ALTER TABLE `hb_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `hb_halls`
--
ALTER TABLE `hb_halls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hb_hall_images`
--
ALTER TABLE `hb_hall_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hb_offers`
--
ALTER TABLE `hb_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hb_restaurents`
--
ALTER TABLE `hb_restaurents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hb_restaurent_images`
--
ALTER TABLE `hb_restaurent_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hb_rooms`
--
ALTER TABLE `hb_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hb_roomtype`
--
ALTER TABLE `hb_roomtype`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hb_roomtype_view`
--
ALTER TABLE `hb_roomtype_view`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hb_room_facilities`
--
ALTER TABLE `hb_room_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `hb_room_images`
--
ALTER TABLE `hb_room_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hb_settings`
--
ALTER TABLE `hb_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hb_webcontactinfos`
--
ALTER TABLE `hb_webcontactinfos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hb_webfacilities`
--
ALTER TABLE `hb_webfacilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hb_webnavs`
--
ALTER TABLE `hb_webnavs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hb_webpages`
--
ALTER TABLE `hb_webpages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hb_websliders`
--
ALTER TABLE `hb_websliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hb_webtestimonials`
--
ALTER TABLE `hb_webtestimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hb_wellness`
--
ALTER TABLE `hb_wellness`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hb_wellness_images`
--
ALTER TABLE `hb_wellness_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
-- Constraints for table `hb_bookings`
--
ALTER TABLE `hb_bookings`
  ADD CONSTRAINT `hb_bookings_guest_id_foreign` FOREIGN KEY (`guest_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hb_bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `hb_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hb_bookings_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_hall_images`
--
ALTER TABLE `hb_hall_images`
  ADD CONSTRAINT `hb_hall_images_hall_id_foreign` FOREIGN KEY (`hall_id`) REFERENCES `hb_halls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_restaurent_images`
--
ALTER TABLE `hb_restaurent_images`
  ADD CONSTRAINT `hb_restaurent_images_restaurent_id_foreign` FOREIGN KEY (`restaurent_id`) REFERENCES `hb_restaurents` (`id`) ON DELETE CASCADE;

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

--
-- Constraints for table `hb_wellness_images`
--
ALTER TABLE `hb_wellness_images`
  ADD CONSTRAINT `hb_wellness_images_wellness_id_foreign` FOREIGN KEY (`wellness_id`) REFERENCES `hb_wellness` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
