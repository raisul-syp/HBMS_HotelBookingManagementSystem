-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 01:46 PM
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
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Admin, 1=Staff, 2=Guest',
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
(1, 'Super', 'Admin', 'admin@gmail.com', NULL, '$2y$10$gnkYXf1/YYANYrtwJEFtjeevxkyADSdRH8ic4IKFquEDG9uxjki0m', NULL, 'Male', '1995-10-03', '01680078100', 'Uttarkhan', 'Dhaka', NULL, '1230', 'Bangladesh', NULL, 'Super-1674131293.jpg', 'Super-1674131293.jpg', 0, 1, 1, NULL, '0', '2022-12-25 10:39:31', '2023-01-19 06:28:13'),
(2, 'Muhammad Raisul', 'Islam', 'wailantirajoh@gmail.com', NULL, '$2y$10$VlIqr0X7Dc7atSoZxOJzuuCZC9jt9tI54EhAOFfSqihuuaUARFrFq', NULL, 'Male', NULL, '01797530063', NULL, NULL, NULL, NULL, 'Bangladesh', NULL, 'Muhammad Raisl-1672574931.png', NULL, 1, 1, 1, '1', '0', '2023-01-01 06:08:51', '2023-01-19 04:14:23'),
(3, 'sdfdsf dfdsf', 'sdfd sadfsdf', 'asdas@dfsd.com', NULL, '$2y$10$pa3QoWAI045cP5efJh1VwOvI8jTh8GtG1yB.LjcmXWEr8UhDxbhVO', NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 1, 1, 1, '1', NULL, '2023-01-01 06:10:43', '2023-01-01 06:10:43');

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
  `booking_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Pending, 1=Booked, 2=Cancel, 3=Payment Pending',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `payment_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_bookings`
--

INSERT INTO `hb_bookings` (`id`, `guest_id`, `room_id`, `staff_id`, `checkin_date`, `checkout_date`, `checkin_time`, `checkout_time`, `total_adults`, `total_childs`, `booking_status`, `is_delete`, `payment_mode`, `booking_comment`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-12-30', '2022-12-31', '14:00', '12:00', '2', '0', 1, 1, '', 'Admin', '1', NULL, '2022-12-27 00:17:07', '2022-12-27 00:17:07'),
(2, 1, 1, 1, '2023-01-08', '2023-01-09', '14:00', '12:00', '2', '2', 0, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-08 01:36:13', '2023-01-08 01:36:13'),
(3, 1, 1, 1, '2023-01-10', '2023-01-11', '14:00', '12:00', '1', '0', 0, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-08 02:13:22', '2023-01-08 02:13:22'),
(4, 1, 2, 1, '2023-01-08', '2023-01-09', '14:00', '12:00', '1', '0', 0, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-08 02:15:21', '2023-01-08 02:15:21'),
(5, 1, 1, 1, '2023-01-20', '2023-01-21', '14:00', '12:00', '2', '1', 3, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-08 14:03:38', '2023-01-08 14:03:38'),
(6, 1, 4, 1, '2023-01-08', '2023-01-09', '14:00', '12:00', '1', '1', 3, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-08 14:19:42', '2023-01-08 14:19:42'),
(7, 1, 3, 1, '2023-01-09', '2023-01-10', '14:00', '12:00', '1', '0', 3, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-09 02:52:46', '2023-01-09 02:52:46'),
(8, 1, 2, 1, '2023-01-19', '2023-01-20', '14:00', '12:00', '1', '0', 3, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-09 05:16:22', '2023-01-09 05:16:22'),
(9, 1, 2, 1, '2023-01-19', '2023-01-20', '14:00', '12:00', '1', '0', 3, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-09 05:19:07', '2023-01-09 05:19:07'),
(10, 1, 1, 1, '2023-01-26', '2023-01-27', '14:00', '12:00', '2', '1', 0, 1, '', 'Booking created by Guest', '2', NULL, '2023-01-09 05:21:05', '2023-01-09 05:21:05'),
(11, 1, 1, 1, '2023-01-22', '2023-01-23', '14:00', '12:00', '2', '1', 2, 1, '', 'Booking created by Guest', '2', '1', '2023-01-09 05:33:40', '2023-01-09 06:53:16'),
(12, 1, 3, 1, '2023-01-18', '2023-01-19', '14:00', '12:00', '1', '0', 0, 1, 'Pay on arrival', 'Booking created by Guest', '2', '0', '2023-01-18 03:37:08', '2023-01-19 02:23:20'),
(13, 1, 1, 1, '2023-01-19', '2023-01-20', '14:00', '12:00', '1', '0', 0, 1, 'Pay on arrival', 'Booking created by Guest', '2', NULL, '2023-01-19 02:29:03', '2023-01-19 02:29:03'),
(14, 1, 4, 2, '2023-01-19', '2023-01-20', '18:00', '10:00', '1', '0', 3, 1, 'Pay on arrival', 'Booking created by Guest', '2', '0', '2023-01-19 03:17:22', '2023-01-19 03:35:11');

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

--
-- Dumping data for table `hb_country`
--

INSERT INTO `hb_country` (`id`, `country_code`, `country_name`, `code`, `currency`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'AFG', 'Afghanistan', 'AF', '', 1, '0', '0', NULL, NULL),
(2, 'ALA', 'Åland', 'AX', '', 1, '0', '0', NULL, NULL),
(3, 'ALB', 'Albania', 'AL', '', 1, '0', '0', NULL, NULL),
(4, 'DZA', 'Algeria', 'DZ', '', 1, '0', '0', NULL, NULL),
(5, 'ASM', 'American Samoa', 'AS', '', 1, '0', '0', NULL, NULL),
(6, 'AND', 'Andorra', 'AD', '', 1, '0', '0', NULL, NULL),
(7, 'AGO', 'Angola', 'AO', '', 1, '0', '0', NULL, NULL),
(8, 'AIA', 'Anguilla', 'AI', '', 1, '0', '0', NULL, NULL),
(9, 'ATA', 'Antarctica', 'AQ', '', 1, '0', '0', NULL, NULL),
(10, 'ATG', 'Antigua and Barbuda', 'AG', '', 1, '0', '0', NULL, NULL),
(11, 'ARG', 'Argentina', 'AR', '', 1, '0', '0', NULL, NULL),
(12, 'ARM', 'Armenia', 'AM', '', 1, '0', '0', NULL, NULL),
(13, 'ABW', 'Aruba', 'AW', '', 1, '0', '0', NULL, NULL),
(14, 'AUS', 'Australia', 'AU', '', 1, '0', '0', NULL, NULL),
(15, 'AUT', 'Austria', 'AT', '', 1, '0', '0', NULL, NULL),
(16, 'AZE', 'Azerbaijan', 'AZ', '', 1, '0', '0', NULL, NULL),
(17, 'BHS', 'Bahamas', 'BS', '', 1, '0', '0', NULL, NULL),
(18, 'BHR', 'Bahrain', 'BH', '', 1, '0', '0', NULL, NULL),
(19, 'BGD', 'Bangladesh', 'BD', '', 1, '0', '0', NULL, NULL),
(20, 'BRB', 'Barbados', 'BB', '', 1, '0', '0', NULL, NULL),
(21, 'BLR', 'Belarus', 'BY', '', 1, '0', '0', NULL, NULL),
(22, 'BEL', 'Belgium', 'BE', '', 1, '0', '0', NULL, NULL),
(23, 'BLZ', 'Belize', 'BZ', '', 1, '0', '0', NULL, NULL),
(24, 'BEN', 'Benin', 'BJ', '', 1, '0', '0', NULL, NULL),
(25, 'BMU', 'Bermuda', 'BM', '', 1, '0', '0', NULL, NULL),
(26, 'BTN', 'Bhutan', 'BT', '', 1, '0', '0', NULL, NULL),
(27, 'BOL', 'Bolivia', 'BO', '', 1, '0', '0', NULL, NULL),
(28, 'BES', 'Bonaire', 'BQ', '', 1, '0', '0', NULL, NULL),
(29, 'BIH', 'Bosnia and Herzegovina', 'BA', '', 1, '0', '0', NULL, NULL),
(30, 'BWA', 'Botswana', 'BW', '', 1, '0', '0', NULL, NULL),
(31, 'BVT', 'Bouvet Island', 'BV', '', 1, '0', '0', NULL, NULL),
(32, 'BRA', 'Brazil', 'BR', '', 1, '0', '0', NULL, NULL),
(33, 'IOT', 'British Indian Ocean Territory', 'IO', '', 1, '0', '0', NULL, NULL),
(34, 'VGB', 'British Virgin Islands', 'VG', '', 1, '0', '0', NULL, NULL),
(35, 'BRN', 'Brunei', 'BN', '', 1, '0', '0', NULL, NULL),
(36, 'BGR', 'Bulgaria', 'BG', '', 1, '0', '0', NULL, NULL),
(37, 'BFA', 'Burkina Faso', 'BF', '', 1, '0', '0', NULL, NULL),
(38, 'BDI', 'Burundi', 'BI', '', 1, '0', '0', NULL, NULL),
(39, 'KHM', 'Cambodia', 'KH', '', 1, '0', '0', NULL, NULL),
(40, 'CMR', 'Cameroon', 'CM', '', 1, '0', '0', NULL, NULL),
(41, 'CAN', 'Canada', 'CA', '', 1, '0', '0', NULL, NULL),
(42, 'CPV', 'Cape Verde', 'CV', '', 1, '0', '0', NULL, NULL),
(43, 'CYM', 'Cayman Islands', 'KY', '', 1, '0', '0', NULL, NULL),
(44, 'CAF', 'Central African Republic', 'CF', '', 1, '0', '0', NULL, NULL),
(45, 'TCD', 'Chad', 'TD', '', 1, '0', '0', NULL, NULL),
(46, 'CHL', 'Chile', 'CL', '', 1, '0', '0', NULL, NULL),
(47, 'CHN', 'China', 'CN', '', 1, '0', '0', NULL, NULL),
(48, 'CXR', 'Christmas Island', 'CX', '', 1, '0', '0', NULL, NULL),
(49, 'CCK', 'Cocos [Keeling] Islands', 'CC', '', 1, '0', '0', NULL, NULL),
(50, 'COL', 'Colombia', 'CO', '', 1, '0', '0', NULL, NULL),
(51, 'COM', 'Comoros', 'KM', '', 1, '0', '0', NULL, NULL),
(52, 'COK', 'Cook Islands', 'CK', '', 1, '0', '0', NULL, NULL),
(53, 'CRI', 'Costa Rica', 'CR', '', 1, '0', '0', NULL, NULL),
(54, 'HRV', 'Croatia', 'HR', '', 1, '0', '0', NULL, NULL),
(55, 'CUB', 'Cuba', 'CU', '', 1, '0', '0', NULL, NULL),
(56, 'CUW', 'Curacao', 'CW', '', 1, '0', '0', NULL, NULL),
(57, 'CYP', 'Cyprus', 'CY', '', 1, '0', '0', NULL, NULL),
(58, 'CZE', 'Czech Republic', 'CZ', '', 1, '0', '0', NULL, NULL),
(59, 'COD', 'Democratic Republic of the Congo', 'CD', '', 1, '0', '0', NULL, NULL),
(60, 'DNK', 'Denmark', 'DK', '', 1, '0', '0', NULL, NULL),
(61, 'DJI', 'Djibouti', 'DJ', '', 1, '0', '0', NULL, NULL),
(62, 'DMA', 'Dominica', 'DM', '', 1, '0', '0', NULL, NULL),
(63, 'DOM', 'Dominican Republic', 'DO', '', 1, '0', '0', NULL, NULL),
(64, 'TLS', 'East Timor', 'TL', '', 1, '0', '0', NULL, NULL),
(65, 'ECU', 'Ecuador', 'EC', '', 1, '0', '0', NULL, NULL),
(66, 'EGY', 'Egypt', 'EG', '', 1, '0', '0', NULL, NULL),
(67, 'SLV', 'El Salvador', 'SV', '', 1, '0', '0', NULL, NULL),
(68, 'GNQ', 'Equatorial Guinea', 'GQ', '', 1, '0', '0', NULL, NULL),
(69, 'ERI', 'Eritrea', 'ER', '', 1, '0', '0', NULL, NULL),
(70, 'EST', 'Estonia', 'EE', '', 1, '0', '0', NULL, NULL),
(71, 'ETH', 'Ethiopia', 'ET', '', 1, '0', '0', NULL, NULL),
(72, 'FLK', 'Falkland Islands', 'FK', '', 1, '0', '0', NULL, NULL),
(73, 'FRO', 'Faroe Islands', 'FO', '', 1, '0', '0', NULL, NULL),
(74, 'FJI', 'Fiji', 'FJ', '', 1, '0', '0', NULL, NULL),
(75, 'FIN', 'Finland', 'FI', '', 1, '0', '0', NULL, NULL),
(76, 'FRA', 'France', 'FR', '', 1, '0', '0', NULL, NULL),
(77, 'GUF', 'French Guiana', 'GF', '', 1, '0', '0', NULL, NULL),
(78, 'PYF', 'French Polynesia', 'PF', '', 1, '0', '0', NULL, NULL),
(79, 'ATF', 'French Southern Territories', 'TF', '', 1, '0', '0', NULL, NULL),
(80, 'GAB', 'Gabon', 'GA', '', 1, '0', '0', NULL, NULL),
(81, 'GMB', 'Gambia', 'GM', '', 1, '0', '0', NULL, NULL),
(82, 'GEO', 'Georgia', 'GE', '', 1, '0', '0', NULL, NULL),
(83, 'DEU', 'Germany', 'DE', '', 1, '0', '0', NULL, NULL),
(84, 'GHA', 'Ghana', 'GH', '', 1, '0', '0', NULL, NULL),
(85, 'GIB', 'Gibraltar', 'GI', '', 1, '0', '0', NULL, NULL),
(86, 'GRC', 'Greece', 'GR', '', 1, '0', '0', NULL, NULL),
(87, 'GRL', 'Greenland', 'GL', '', 1, '0', '0', NULL, NULL),
(88, 'GRD', 'Grenada', 'GD', '', 1, '0', '0', NULL, NULL),
(89, 'GLP', 'Guadeloupe', 'GP', '', 1, '0', '0', NULL, NULL),
(90, 'GUM', 'Guam', 'GU', '', 1, '0', '0', NULL, NULL),
(91, 'GTM', 'Guatemala', 'GT', '', 1, '0', '0', NULL, NULL),
(92, 'GGY', 'Guernsey', 'GG', '', 1, '0', '0', NULL, NULL),
(93, 'GIN', 'Guinea', 'GN', '', 1, '0', '0', NULL, NULL),
(94, 'GNB', 'Guinea-Bissau', 'GW', '', 1, '0', '0', NULL, NULL),
(95, 'GUY', 'Guyana', 'GY', '', 1, '0', '0', NULL, NULL),
(96, 'HTI', 'Haiti', 'HT', '', 1, '0', '0', NULL, NULL),
(97, 'HMD', 'Heard Island and McDonald Islands', 'HM', '', 1, '0', '0', NULL, NULL),
(98, 'HND', 'Honduras', 'HN', '', 1, '0', '0', NULL, NULL),
(99, 'HKG', 'Hong Kong', 'HK', '', 1, '0', '0', NULL, NULL),
(100, 'HUN', 'Hungary', 'HU', '', 1, '0', '0', NULL, NULL),
(101, 'ISL', 'Iceland', 'IS', '', 1, '0', '0', NULL, NULL),
(102, 'IND', 'India', 'IN', '', 1, '0', '0', NULL, NULL),
(103, 'IDN', 'Indonesia', 'ID', '', 1, '0', '0', NULL, NULL),
(104, 'IRN', 'Iran', 'IR', '', 1, '0', '0', NULL, NULL),
(105, 'IRQ', 'Iraq', 'IQ', '', 1, '0', '0', NULL, NULL),
(106, 'IRL', 'Ireland', 'IE', '', 1, '0', '0', NULL, NULL),
(107, 'IMN', 'Isle of Man', 'IM', '', 1, '0', '0', NULL, NULL),
(108, 'ISR', 'Israel', 'IL', '', 1, '0', '0', NULL, NULL),
(109, 'ITA', 'Italy', 'IT', '', 1, '0', '0', NULL, NULL),
(110, 'CIV', 'Ivory Coast', 'CI', '', 1, '0', '0', NULL, NULL),
(111, 'JAM', 'Jamaica', 'JM', '', 1, '0', '0', NULL, NULL),
(112, 'JPN', 'Japan', 'JP', '', 1, '0', '0', NULL, NULL),
(113, 'JEY', 'Jersey', 'JE', '', 1, '0', '0', NULL, NULL),
(114, 'JOR', 'Jordan', 'JO', '', 1, '0', '0', NULL, NULL),
(115, 'KAZ', 'Kazakhstan', 'KZ', '', 1, '0', '0', NULL, NULL),
(116, 'KEN', 'Kenya', 'KE', '', 1, '0', '0', NULL, NULL),
(117, 'KIR', 'Kiribati', 'KI', '', 1, '0', '0', NULL, NULL),
(118, 'XKX', 'Kosovo', 'XK', '', 1, '0', '0', NULL, NULL),
(119, 'KWT', 'Kuwait', 'KW', '', 1, '0', '0', NULL, NULL),
(120, 'KGZ', 'Kyrgyzstan', 'KG', '', 1, '0', '0', NULL, NULL),
(121, 'LAO', 'Laos', 'LA', '', 1, '0', '0', NULL, NULL),
(122, 'LVA', 'Latvia', 'LV', '', 1, '0', '0', NULL, NULL),
(123, 'LBN', 'Lebanon', 'LB', '', 1, '0', '0', NULL, NULL),
(124, 'LSO', 'Lesotho', 'LS', '', 1, '0', '0', NULL, NULL),
(125, 'LBR', 'Liberia', 'LR', '', 1, '0', '0', NULL, NULL),
(126, 'LBY', 'Libya', 'LY', '', 1, '0', '0', NULL, NULL),
(127, 'LIE', 'Liechtenstein', 'LI', '', 1, '0', '0', NULL, NULL),
(128, 'LTU', 'Lithuania', 'LT', '', 1, '0', '0', NULL, NULL),
(129, 'LUX', 'Luxembourg', 'LU', '', 1, '0', '0', NULL, NULL),
(130, 'MAC', 'Macao', 'MO', '', 1, '0', '0', NULL, NULL),
(131, 'MKD', 'Macedonia', 'MK', '', 1, '0', '0', NULL, NULL),
(132, 'MDG', 'Madagascar', 'MG', '', 1, '0', '0', NULL, NULL),
(133, 'MWI', 'Malawi', 'MW', '', 1, '0', '0', NULL, NULL),
(134, 'MYS', 'Malaysia', 'MY', '', 1, '0', '0', NULL, NULL),
(135, 'MDV', 'Maldives', 'MV', '', 1, '0', '0', NULL, NULL),
(136, 'MLI', 'Mali', 'ML', '', 1, '0', '0', NULL, NULL),
(137, 'MLT', 'Malta', 'MT', '', 1, '0', '0', NULL, NULL),
(138, 'MHL', 'Marshall Islands', 'MH', '', 1, '0', '0', NULL, NULL),
(139, 'MTQ', 'Martinique', 'MQ', '', 1, '0', '0', NULL, NULL),
(140, 'MRT', 'Mauritania', 'MR', '', 1, '0', '0', NULL, NULL),
(141, 'MUS', 'Mauritius', 'MU', '', 1, '0', '0', NULL, NULL),
(142, 'MYT', 'Mayotte', 'YT', '', 1, '0', '0', NULL, NULL),
(143, 'MEX', 'Mexico', 'MX', '', 1, '0', '0', NULL, NULL),
(144, 'FSM', 'Micronesia', 'FM', '', 1, '0', '0', NULL, NULL),
(145, 'MDA', 'Moldova', 'MD', '', 1, '0', '0', NULL, NULL),
(146, 'MCO', 'Monaco', 'MC', '', 1, '0', '0', NULL, NULL),
(147, 'MNG', 'Mongolia', 'MN', '', 1, '0', '0', NULL, NULL),
(148, 'MNE', 'Montenegro', 'ME', '', 1, '0', '0', NULL, NULL),
(149, 'MSR', 'Montserrat', 'MS', '', 1, '0', '0', NULL, NULL),
(150, 'MAR', 'Morocco', 'MA', '', 1, '0', '0', NULL, NULL),
(151, 'MOZ', 'Mozambique', 'MZ', '', 1, '0', '0', NULL, NULL),
(152, 'MMR', 'Myanmar [Burma]', 'MM', '', 1, '0', '0', NULL, NULL),
(153, 'NAM', 'Namibia', 'NA', '', 1, '0', '0', NULL, NULL),
(154, 'NRU', 'Nauru', 'NR', '', 1, '0', '0', NULL, NULL),
(155, 'NPL', 'Nepal', 'NP', '', 1, '0', '0', NULL, NULL),
(156, 'NLD', 'Netherlands', 'NL', '', 1, '0', '0', NULL, NULL),
(157, 'NCL', 'New Caledonia', 'NC', '', 1, '0', '0', NULL, NULL),
(158, 'NZL', 'New Zealand', 'NZ', '', 1, '0', '0', NULL, NULL),
(159, 'NIC', 'Nicaragua', 'NI', '', 1, '0', '0', NULL, NULL),
(160, 'NER', 'Niger', 'NE', '', 1, '0', '0', NULL, NULL),
(161, 'NGA', 'Nigeria', 'NG', '', 1, '0', '0', NULL, NULL),
(162, 'NIU', 'Niue', 'NU', '', 1, '0', '0', NULL, NULL),
(163, 'NFK', 'Norfolk Island', 'NF', '', 1, '0', '0', NULL, NULL),
(164, 'PRK', 'North Korea', 'KP', '', 1, '0', '0', NULL, NULL),
(165, 'MNP', 'Northern Mariana Islands', 'MP', '', 1, '0', '0', NULL, NULL),
(166, 'NOR', 'Norway', 'NO', '', 1, '0', '0', NULL, NULL),
(167, 'OMN', 'Oman', 'OM', '', 1, '0', '0', NULL, NULL),
(168, 'PAK', 'Pakistan', 'PK', '', 1, '0', '0', NULL, NULL),
(169, 'PLW', 'Palau', 'PW', '', 1, '0', '0', NULL, NULL),
(170, 'PSE', 'Palestine', 'PS', '', 1, '0', '0', NULL, NULL),
(171, 'PAN', 'Panama', 'PA', '', 1, '0', '0', NULL, NULL),
(172, 'PNG', 'Papua New Guinea', 'PG', '', 1, '0', '0', NULL, NULL),
(173, 'PRY', 'Paraguay', 'PY', '', 1, '0', '0', NULL, NULL),
(174, 'PER', 'Peru', 'PE', '', 1, '0', '0', NULL, NULL),
(175, 'PHL', 'Philippines', 'PH', '', 1, '0', '0', NULL, NULL),
(176, 'PCN', 'Pitcairn Islands', 'PN', '', 1, '0', '0', NULL, NULL),
(177, 'POL', 'Poland', 'PL', '', 1, '0', '0', NULL, NULL),
(178, 'PRT', 'Portugal', 'PT', '', 1, '0', '0', NULL, NULL),
(179, 'PRI', 'Puerto Rico', 'PR', '', 1, '0', '0', NULL, NULL),
(180, 'QAT', 'Qatar', 'QA', '', 1, '0', '0', NULL, NULL),
(181, 'COG', 'Republic of the Congo', 'CG', '', 1, '0', '0', NULL, NULL),
(182, 'REU', 'Réunion', 'RE', '', 1, '0', '0', NULL, NULL),
(183, 'ROU', 'Romania', 'RO', '', 1, '0', '0', NULL, NULL),
(184, 'RUS', 'Russia', 'RU', '', 1, '0', '0', NULL, NULL),
(185, 'RWA', 'Rwanda', 'RW', '', 1, '0', '0', NULL, NULL),
(186, 'BLM', 'Saint Barthélemy', 'BL', '', 1, '0', '0', NULL, NULL),
(187, 'SHN', 'Saint Helena', 'SH', '', 1, '0', '0', NULL, NULL),
(188, 'KNA', 'Saint Kitts and Nevis', 'KN', '', 1, '0', '0', NULL, NULL),
(189, 'LCA', 'Saint Lucia', 'LC', '', 1, '0', '0', NULL, NULL),
(190, 'MAF', 'Saint Martin', 'MF', '', 1, '0', '0', NULL, NULL),
(191, 'SPM', 'Saint Pierre and Miquelon', 'PM', '', 1, '0', '0', NULL, NULL),
(192, 'VCT', 'Saint Vincent and the Grenadines', 'VC', '', 1, '0', '0', NULL, NULL),
(193, 'WSM', 'Samoa', 'WS', '', 1, '0', '0', NULL, NULL),
(194, 'SMR', 'San Marino', 'SM', '', 1, '0', '0', NULL, NULL),
(195, 'STP', 'São Tomé and Príncipe', 'ST', '', 1, '0', '0', NULL, NULL),
(196, 'SAU', 'Saudi Arabia', 'SA', '', 1, '0', '0', NULL, NULL),
(197, 'SEN', 'Senegal', 'SN', '', 1, '0', '0', NULL, NULL),
(198, 'SRB', 'Serbia', 'RS', '', 1, '0', '0', NULL, NULL),
(199, 'SYC', 'Seychelles', 'SC', '', 1, '0', '0', NULL, NULL),
(200, 'SLE', 'Sierra Leone', 'SL', '', 1, '0', '0', NULL, NULL),
(201, 'SGP', 'Singapore', 'SG', '', 1, '0', '0', NULL, NULL),
(202, 'SXM', 'Sint Maarten', 'SX', '', 1, '0', '0', NULL, NULL),
(203, 'SVK', 'Slovakia', 'SK', '', 1, '0', '0', NULL, NULL),
(204, 'SVN', 'Slovenia', 'SI', '', 1, '0', '0', NULL, NULL),
(205, 'SLB', 'Solomon Islands', 'SB', '', 1, '0', '0', NULL, NULL),
(206, 'SOM', 'Somalia', 'SO', '', 1, '0', '0', NULL, NULL),
(207, 'ZAF', 'South Africa', 'ZA', '', 1, '0', '0', NULL, NULL),
(208, 'SGS', 'South Georgia and the South Sandwich Islands', 'GS', '', 1, '0', '0', NULL, NULL),
(209, 'KOR', 'South Korea', 'KR', '', 1, '0', '0', NULL, NULL),
(210, 'SSD', 'South Sudan', 'SS', '', 1, '0', '0', NULL, NULL),
(211, 'ESP', 'Spain', 'ES', '', 1, '0', '0', NULL, NULL),
(212, 'LKA', 'Sri Lanka', 'LK', '', 1, '0', '0', NULL, NULL),
(213, 'SDN', 'Sudan', 'SD', '', 1, '0', '0', NULL, NULL),
(214, 'SUR', 'Suriname', 'SR', '', 1, '0', '0', NULL, NULL),
(215, 'SJM', 'Svalbard and Jan Mayen', 'SJ', '', 1, '0', '0', NULL, NULL),
(216, 'SWZ', 'Swaziland', 'SZ', '', 1, '0', '0', NULL, NULL),
(217, 'SWE', 'Sweden', 'SE', '', 1, '0', '0', NULL, NULL),
(218, 'CHE', 'Switzerland', 'CH', '', 1, '0', '0', NULL, NULL),
(219, 'SYR', 'Syria', 'SY', '', 1, '0', '0', NULL, NULL),
(220, 'TWN', 'Taiwan', 'TW', '', 1, '0', '0', NULL, NULL),
(221, 'TJK', 'Tajikistan', 'TJ', '', 1, '0', '0', NULL, NULL),
(222, 'TZA', 'Tanzania', 'TZ', '', 1, '0', '0', NULL, NULL),
(223, 'THA', 'Thailand', 'TH', '', 1, '0', '0', NULL, NULL),
(224, 'TGO', 'Togo', 'TG', '', 1, '0', '0', NULL, NULL),
(225, 'TKL', 'Tokelau', 'TK', '', 1, '0', '0', NULL, NULL),
(226, 'TON', 'Tonga', 'TO', '', 1, '0', '0', NULL, NULL),
(227, 'TTO', 'Trinidad and Tobago', 'TT', '', 1, '0', '0', NULL, NULL),
(228, 'TUN', 'Tunisia', 'TN', '', 1, '0', '0', NULL, NULL),
(229, 'TUR', 'Turkey', 'TR', '', 1, '0', '0', NULL, NULL),
(230, 'TKM', 'Turkmenistan', 'TM', '', 1, '0', '0', NULL, NULL),
(231, 'TCA', 'Turks and Caicos Islands', 'TC', '', 1, '0', '0', NULL, NULL),
(232, 'TUV', 'Tuvalu', 'TV', '', 1, '0', '0', NULL, NULL),
(233, 'UMI', 'U.S. Minor Outlying Islands', 'UM', '', 1, '0', '0', NULL, NULL),
(234, 'VIR', 'U.S. Virgin Islands', 'VI', '', 1, '0', '0', NULL, NULL),
(235, 'UGA', 'Uganda', 'UG', '', 1, '0', '0', NULL, NULL),
(236, 'UKR', 'Ukraine', 'UA', '', 1, '0', '0', NULL, NULL),
(237, 'ARE', 'United Arab Emirates', 'AE', '', 1, '0', '0', NULL, NULL),
(238, 'GBR', 'United Kingdom', 'GB', '', 1, '0', '0', NULL, NULL),
(239, 'USA', 'United States', 'US', '$', 1, '0', '0', NULL, NULL),
(240, 'URY', 'Uruguay', 'UY', '', 1, '0', '0', NULL, NULL),
(241, 'UZB', 'Uzbekistan', 'UZ', '', 1, '0', '0', NULL, NULL),
(242, 'VUT', 'Vanuatu', 'VU', '', 1, '0', '0', NULL, NULL),
(243, 'VAT', 'Vatican City', 'VA', '', 1, '0', '0', NULL, NULL),
(244, 'VEN', 'Venezuela', 'VE', '', 1, '0', '0', NULL, NULL),
(245, 'VNM', 'Vietnam', 'VN', '', 1, '0', '0', NULL, NULL),
(246, 'WLF', 'Wallis and Futuna', 'WF', '', 1, '0', '0', NULL, NULL),
(247, 'ESH', 'Western Sahara', 'EH', '', 1, '0', '0', NULL, NULL),
(248, 'YEM', 'Yemen', 'YE', '', 1, '0', '0', NULL, NULL),
(249, 'ZMB', 'Zambia', 'ZM', '', 1, '0', '0', NULL, NULL),
(250, 'ZWE', 'Zimbabwe', 'ZW', '', 1, '0', '0', NULL, NULL);

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
-- Table structure for table `hb_faqs`
--

CREATE TABLE `hb_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_faqs`
--

INSERT INTO `hb_faqs` (`id`, `question`, `answer`, `faq_type`, `slug`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'How do I request an early check-in or late check-out with the hotel?', 'Since hotel policies regarding early check-in (generally before 2:00 pm) or late checkout (generally after 12:00 pm) vary by location and by hotel, please call the hotel directly prior to your arrival to make any necessary arrangements. Direct hotel phone numbers can be found on your confirmation email or on the hotel information page.', 'General Information', 'how-do-i-request-an-early-check-in-or-late-check-out-with-the-hotel', 'How do I request an early check-in or late check-out with the hotel?', 'How do I request an early check-in or late check-out with the hotel?', 'How do I request an early check-in or late check-out with the hotel?', 1, 1, '1', '1', '2023-01-08 23:19:03', '2023-01-09 00:11:37'),
(2, 'What is your policy regarding cancellations?', 'If your travel plans change, you can cancel or modify your reservation in accordance with the hotel\'s cancellation policy as stated during the reservation process.', 'General Information', 'what-is-your-policy-regarding-cancellations', 'What is your policy regarding cancellations?', 'What is your policy regarding cancellations?', 'What is your policy regarding cancellations?', 1, 1, '1', '1', '2023-01-08 23:27:16', '2023-01-09 00:11:55'),
(3, 'Will I be charged for extra guests occupying my room?', 'Hotel room rates vary by date and by the number of adults occupying a single room. To accommodate more guests, you need to change your reservation. You will be notified of any additional charges prior to confirming your updated reservation.', 'General Information', 'will-i-be-charged-for-extra-guests-occupying-my-room', 'Will I be charged for extra guests occupying my room?', 'Will I be charged for extra guests occupying my room?', 'Will I be charged for extra guests occupying my room?', 1, 1, '1', '1', '2023-01-08 23:28:09', '2023-01-09 00:12:06'),
(4, 'I\'m having trouble making an online reservation. Is there a toll-free number I can call for help?', 'In case any issues arise during the reservation process, please call the regional help desk.', 'Reservations', 'im-having-trouble-making-an-online-reservation-is-there-a-toll-free-number-i-can-call-for-help', 'I\'m having trouble making an online reservation. Is there a toll-free number I can call for help?', 'I\'m having trouble making an online reservation. Is there a toll-free number I can call for help?', 'I\'m having trouble making an online reservation. Is there a toll-free number I can call for help?', 1, 1, '1', '1', '2023-01-08 23:32:42', '2023-01-09 00:12:17'),
(5, 'Can I reserve more than one room at a time when I book online?', 'Yes, you can book up to nine rooms at a time. Please see the list of toll-free numbers to contact in your country if you wish to order ten or more rooms.', 'Reservations', 'can-i-reserve-more-than-one-room-at-a-time-when-i-book-online', 'Can I reserve more than one room at a time when I book online?', 'Can I reserve more than one room at a time when I book online?', 'Can I reserve more than one room at a time when I book online?', 1, 1, '1', '1', '2023-01-08 23:33:38', '2023-01-09 00:12:29'),
(6, 'Am I required to enter my credit card number online to book a reservation? Is your reservation process secure?', 'Yes. A credit card number is required to book a reservation online for those hotels that accept credit cards. For your security, any personal information such as your credit card number or phone number will be encrypted before being transmitted over the internet.', 'Reservations', 'am-i-required-to-enter-my-credit-card-number-online-to-book-a-reservation-is-your-reservation-process-secure', 'Am I required to enter my credit card number online to book a reservation? Is your reservation process secure?', 'Am I required to enter my credit card number online to book a reservation? Is your reservation process secure?', 'Am I required to enter my credit card number online to book a reservation? Is your reservation process secure?', 1, 1, '1', '1', '2023-01-08 23:34:11', '2023-01-09 00:12:44'),
(7, 'How do I submit a claim if I see a lower rate on another website?', 'Within 24 hours of making your reservation on Radissonhotels.com, visit the Contact us section of Radissonhotels.com and select “Online” contact method and “BORG claim” for topic.', 'Best Rate Guarantee', 'how-do-i-submit-a-claim-if-i-see-a-lower-rate-on-another-website', 'How do I submit a claim if I see a lower rate on another website?', 'How do I submit a claim if I see a lower rate on another website?', 'How do I submit a claim if I see a lower rate on another website?', 1, 1, '1', '1', '2023-01-08 23:35:28', '2023-01-09 00:12:56'),
(8, 'What do I need to submit a claim?', 'You will need the information related to your thezabeerdhaka.com reservation as well as the specific information related to the lower rate you found (rate, website address, date found).', 'Best Rate Guarantee', 'what-do-i-need-to-submit-a-claim', 'What do I need to submit a claim?', 'What do I need to submit a claim?', 'What do I need to submit a claim?', 1, 1, '1', '1', '2023-01-08 23:36:37', '2023-01-09 00:13:07'),
(9, 'Is there a time window that I need to submit a claim for the Best Rates Guarantee?', 'Yes. You must submit a claim within 24 hours of the original booking, and at least 48 hours prior to midnight local time of your arrival date at the hotel.', 'Best Rate Guarantee', 'is-there-a-time-window-that-i-need-to-submit-a-claim-for-the-best-rates-guarantee', 'Is there a time window that I need to submit a claim for the Best Rates Guarantee?', 'Is there a time window that I need to submit a claim for the Best Rates Guarantee?', 'Is there a time window that I need to submit a claim for the Best Rates Guarantee?', 1, 1, '1', '1', '2023-01-08 23:37:24', '2023-01-09 00:13:18');

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
(1, 'Board Room', 'board-room', 'The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For Board Room 30 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p style=\"text-align: left;\">The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For Board Room 30 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Board Room', 'Board Room', 'Board Room', 0, 1, '0', '0', '2022-12-13 20:54:56', '2023-01-15 00:23:13'),
(2, 'Olive Hall', 'olive-hall', 'The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-VisuThe Hotel Has 3 Dedicated Conference And Event Venues Has The Olive Hall Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p>The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-VisuThe Hotel Has 3 Dedicated Conference And Event Venues Has The Olive Hall Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Olive Hall', 'Olive Hall', 'Olive Hall', 0, 1, '0', '1', '2022-12-13 22:58:33', '2022-12-29 10:07:39'),
(3, 'Tulip Hall', 'tulip-hall', 'The Hotel Has 3 The Hotel Has 3 Dedicated Conference And Event Venues Has The Tulip Hall Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p>The Hotel Has 3 The Hotel Has 3 Dedicated Conference And Event Venues Has The Tulip Hall Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Tulip Hall', 'Tulip Hall', 'Tulip Hall', 0, 1, '0', '1', '2022-12-13 22:59:14', '2022-12-29 10:07:53');

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
  `offer_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `hb_offers` (`id`, `name`, `slug`, `offer_category`, `short_description`, `long_description`, `start_date`, `end_date`, `thumb`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'New Year Celebration 2023', 'new-year-celebration-2023', 'Others', 'New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.', '<h4><span style=\"font-weight: bolder;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.</span></h4><h4><span style=\"font-weight: bolder;\"><br></span></h4><p>New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.&nbsp;<span style=\"font-size: 0.875rem;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">New Year Celebration 2023. New Year Celebration 2023. New Year Celebration 2023.</span></p>', '2022-12-31 00:00:02', '2023-01-10 00:00:02', 'new-year-celebration-2023.jpg', 'New Year Celebration 2023', 'New Year Celebration 2023', 'New Year Celebration 2023', 1, 1, '1', '0', '2022-12-26 04:54:14', '2023-01-16 01:46:47'),
(2, 'Valentine\'s Day Celebration 2023', 'valentines-day-celebration-2023', 'Others', 'Valentine\'s Day Celebration 2023. Valentine\'s Day Celebration 2023. Valentine\'s Day Celebration 2023.', '<h4>Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.</h4><p>Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;<span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span><span style=\"font-size: 0.875rem;\">Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;Valentine\'s Day Celebration 2023.&nbsp;</span></p>', '2023-02-13 11:59:17', '2023-02-14 23:59:17', 'valentines-day-celebration-2023.png', 'Valentine\'s Day Celebration 2023', 'Valentine\'s Day Celebration 2023', 'Valentine\'s Day Celebration 2023', 1, 1, '1', '0', '2022-12-26 05:02:19', '2023-01-16 01:47:02'),
(3, 'Grand Opening', 'grand-opening', 'Others', 'Grand Opening', '<p>Grand Opening<br></p>', '2023-01-02 00:00:30', '2023-01-02 23:59:30', 'grand-opening.jpg', 'Grand Opening', 'Grand Opening', 'Grand Opening', 1, 1, '1', '0', '2023-01-01 01:56:32', '2023-01-16 01:47:17'),
(4, 'Buffet Dinner', 'buffet-dinner', 'Restaurant', 'Buffet Dinner', '<p>Buffet Dinner<br></p>', '2023-01-09 09:00:42', '2023-01-31 09:00:42', 'buffet-dinner.jpeg', 'Buffet Dinner', 'Buffet Dinner', 'Buffet Dinner', 1, 1, '1', '0', '2023-01-09 03:01:49', '2023-01-16 01:44:20'),
(5, 'Coffee Time', 'coffee-time', 'Restaurant', 'Coffee Time', '<p>Coffee Time<br></p>', '2023-01-09 09:05:52', '2023-01-31 09:05:52', 'coffee-time.jpeg', 'Coffee Time', 'Coffee Time', 'Coffee Time', 1, 1, '1', '0', '2023-01-09 03:06:23', '2023-01-16 01:47:30'),
(6, 'Deluxe 50% Discount', 'deluxe-50-discount', 'Room', 'Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount.', '<p>Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount.&nbsp;Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount.&nbsp;Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount.&nbsp;Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount. Deluxe 50% Discount.&nbsp;<br></p>', '2023-01-16 09:37:10', '2023-02-14 09:37:10', 'deluxe-50-discount.png', 'Deluxe 50% Discount', 'Deluxe 50% Discount', 'Deluxe 50% Discount', 0, 1, '0', '0', '2023-01-16 03:39:12', '2023-01-17 03:10:38'),
(7, 'Premium Delux Twin 50% Discount', 'premium-delux-twin-50-discount', 'Room', 'Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount.', '<p>Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount.&nbsp;Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount.&nbsp;Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount.&nbsp;Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount. Premium Delux Twin 50% Discount.&nbsp;<br></p>', '2023-01-16 09:39:25', '2023-01-31 09:39:25', 'premium-delux-twin-50-discount.png', 'Premium Delux Twin 50% Discount', 'Premium Delux Twin 50% Discount', 'Premium Delux Twin 50% Discount', 0, 1, '0', '0', '2023-01-16 03:40:23', '2023-01-17 03:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `hb_offer_categories`
--

CREATE TABLE `hb_offer_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Dumping data for table `hb_offer_categories`
--

INSERT INTO `hb_offer_categories` (`id`, `name`, `slug`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Room', 'room', 'Room', 'Room', 'Room', 1, 1, '0', '0', '2023-01-16 01:27:01', '2023-01-16 01:27:37'),
(2, 'Restaurant', 'restaurant', 'Restaurant', 'Restaurant', 'Restaurant', 1, 1, '0', '0', '2023-01-16 01:40:25', '2023-01-16 01:40:49'),
(3, 'Hall', 'hall', 'Hall', 'Hall', 'Hall', 1, 1, '0', '0', '2023-01-16 01:41:19', '2023-01-16 01:42:31'),
(4, 'Wellness', 'wellness', 'Wellness', 'Wellness', 'Wellness', 1, 1, '0', NULL, '2023-01-16 01:42:58', '2023-01-16 01:42:58'),
(5, 'Others', 'others', 'Others', 'Others', 'Others', 1, 1, '0', NULL, '2023-01-16 01:43:15', '2023-01-16 01:43:15');

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
  `price` float(8,2) NOT NULL DEFAULT 0.00,
  `discount_rate` int(11) NOT NULL DEFAULT 0,
  `discount_price` float(8,2) NOT NULL DEFAULT 0.00,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_decription` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_discount` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
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

INSERT INTO `hb_rooms` (`id`, `name`, `slug`, `short_description`, `long_description`, `max_adults`, `max_childs`, `quantity`, `price`, `discount_rate`, `discount_price`, `meta_title`, `meta_keyword`, `meta_decription`, `has_discount`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Deluxe', 'deluxe', 'Deluxe', '<p>Deluxe<br></p>', 2, 1, 10, 220.00, 0, 0.00, 'Deluxe', 'Deluxe', 'Deluxe', 0, 1, 1, '1', '1', '2022-12-26 05:16:35', '2023-01-02 04:07:16'),
(2, 'Super Deluxe King', 'super-deluxe-king', 'Super Deluxe King', '<p>Super Deluxe King<br></p>', 3, 2, 10, 260.00, 0, 0.00, 'Super Deluxe King', 'Super Deluxe King', 'Super Deluxe King', 0, 1, 1, '0', '1', '2022-12-14 18:45:59', '2022-12-26 05:21:41'),
(3, 'Premium Delux', 'premium-delux', 'Premium Delux', '<p>Premium Delux<br></p>', 3, 3, 10, 280.00, 0, 0.00, 'Premium Delux', 'Premium Delux', 'Premium Delux', 0, 1, 1, '0', '1', '2022-12-14 18:47:55', '2022-12-26 05:23:04'),
(4, 'Premium Delux Twin', 'premium-delux-twin', 'Premium Delux Twin', '<p>Premium Delux Twin<br></p>', 4, 2, 10, 280.00, 10, 252.00, 'Premium Delux Twin', 'Premium Delux Twin', 'Premium Delux Twin', 0, 1, 1, '0', '0', '2022-12-14 18:49:23', '2023-01-17 03:09:46');

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
(4, 2, 'uploads/rooms/super-deluxe-king-1672053701-1.jpg', '2022-12-26 05:21:42', '2022-12-26 05:21:42'),
(5, 2, 'uploads/rooms/super-deluxe-king-1672053702-2.jfif', '2022-12-26 05:21:42', '2022-12-26 05:21:42'),
(6, 2, 'uploads/rooms/super-deluxe-king-1672053702-3.jpg', '2022-12-26 05:21:42', '2022-12-26 05:21:42'),
(7, 3, 'uploads/rooms/premium-delux-1672053784-1.jpg', '2022-12-26 05:23:04', '2022-12-26 05:23:04'),
(8, 3, 'uploads/rooms/premium-delux-1672053784-2.jpg', '2022-12-26 05:23:04', '2022-12-26 05:23:04'),
(9, 4, 'uploads/rooms/premium-delux-twin-1672053838-1.jpg', '2022-12-26 05:23:58', '2022-12-26 05:23:58'),
(10, 4, 'uploads/rooms/premium-delux-twin-1672053838-2.jpg', '2022-12-26 05:23:58', '2022-12-26 05:23:58'),
(11, 1, 'uploads/rooms/deluxe-1672654036-1.jpeg', '2023-01-02 04:07:16', '2023-01-02 04:07:16');

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
(1, 'The Zabeer Dhaka', '(+88) 02224470771-73', 'info@thezabeerdhaka.com', 'House-1, Road-2, Sector-1, Uttara Model Town, Dhaka-1230', 'logo-the-zabeer-dhaka.png', 'icon-the-zabeer-dhaka.png', 'https://www.facebook.com/thezabeerdhaka', 'https://twitter.com/', 'https://www.instagram.com/', 'https://www.youtube.com/', '1', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 1, 1, '1', '1', '2022-12-26 00:35:03', '2023-01-02 03:03:35');

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
(4, 'Halls', 'halls', '4', 'Halls', 'Halls', 'Halls', 0, 1, '0', '0', '2022-12-13 23:03:01', '2022-12-13 23:04:11'),
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
(2, 'Contact Us', 'Contact Us', 'Contact Us', 'Contact Us', '<p>Contact Us<br></p>', 'contact-us', '2', NULL, 'Contact Us', 'Contact Us', 'Contact Us', 1, 1, 1, '1', '0', '2022-12-26 00:49:07', '2023-01-15 23:52:02'),
(3, 'Offers', 'Offers', 'Offers', 'Offers', '<p>Offers<br></p>', 'offers', '3', NULL, 'Offers', 'Offers', 'Offers', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:39:55'),
(4, 'FAQ', 'FAQ', 'FAQ', 'FAQ', '<p>FAQ<br></p>', 'faq', '4', NULL, 'FAQ', 'FAQ', 'FAQ', 1, 1, 1, '0', '1', NULL, '2023-01-08 14:40:23'),
(5, 'Rooms', 'Rooms', 'Rooms', 'Rooms', '<p>Rooms<br></p>', 'rooms', '5', NULL, 'Rooms', 'Rooms', 'Rooms', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:41:12'),
(6, 'Restaurants', 'Restaurants', 'Restaurants', 'Restaurants', '<p>Restaurants<br></p>', 'restaurants', '6', NULL, 'Restaurants', 'Restaurants', 'Restaurants', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:41:27'),
(7, 'Halls', 'Halls', 'Halls', 'Meeting & Events', '<p>Meeting &amp; Events<br></p>', 'halls', '7', NULL, 'Halls', 'Halls', 'Halls', 0, 0, 1, '0', '0', NULL, '2023-01-15 00:35:00'),
(8, 'Wellness', 'Wellness', 'Wellness', 'Wellness', '<p>Wellness<br></p>', 'wellness', '8', NULL, 'Wellness', 'Wellness', 'Wellness', 1, 1, 1, '0', '0', NULL, '2022-12-21 01:50:27'),
(9, 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', '<p>Certificates &amp; Awards<br></p>', 'certificates-awards', '9', NULL, 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:42:54'),
(10, 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', '<p>Booking Cancelation Policy<br></p>', 'booking-cancelation-policy', '10', NULL, 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', 1, 1, 1, '0', '0', NULL, '2022-12-16 18:43:20'),
(11, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', '<p><br></p>', 'privacy-policy', '11', NULL, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', 1, 1, 1, '0', '0', NULL, '2023-01-10 14:13:12'),
(12, 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', '<p><span style=\"font-weight: bolder;\">PLEASE READ THESE BINDING LEGAL TERMS CAREFULLY BEFORE USING THIS SITE OR MAKING A RESERVATION.</span></p><p><span style=\"font-weight: bolder;\">BY ACCESSING, USING, VIEWING, TRANSMITTING, CACHING OR STORING THIS SITE OR ANY OF ITS SERVICES, FUNCTIONS, MATERIALS, OR CONTENTS, YOU SHALL BE DEEMED TO HAVE AGREED TO EACH AND ALL THE TERMS, CONDITIONS, AND NOTICES IN THIS SITE (\"AGREEMENT\") WITHOUT MODIFICATION. CERTAIN TERMS, INCLUDING BUT NOT LIMITED TO THE ARBITRATION CLAUSE AND CLASS ACTION WAIVER CLAUSE, MAY RESTRICT YOUR RIGHTS TO BRING A CLAIM IN A COURT OF LAW. If you are not an Authorised User, and if you do not agree to the terms of this Agreement, you may not use this Site, including without limitation to make a reservation, or download any Materials from it. If you do not agree with these terms and conditions, please leave the Site immediately.</span></p><p><span style=\"font-weight: bolder;\">AGREEMENT FOR USE</span>. You warrant that you are at least 18 years of age and possess the legal authority to enter into this agreement and to use this Site in accordance with all terms and conditions herein. You agree to be financially responsible for all of your use of this Site (as well as for use of your account by others, including without limitation minors living with you). You agree to supervise all usage by minors of this Site under your name or account. You also warrant that all information supplied by you or members of your household in using this Site is true and accurate and without limitation, or any false or fraudulent reservation. You agree that the reservations facilities of this Site shall be used only to make legitimate reservations or purchases for you or for another person for whom you are legally authorised to act. You understand that overuse or abuse of the reservation facilities of this Site may result in your being denied access to such facilities.</p><p>For any reservations or other services for which fees may be charged, you agree to abide by the terms or conditions of purchase imposed, including, but not limited to, payment of all amounts when due and compliance with all rules and restrictions regarding availability of rates, products, or services. You shall be completely responsible for all charges, fees, duties, taxes, and assessments arising out of the use of this Site. Note that in most cases branded hotels are independently owned and your transaction may not be a direct transaction with The Zabeer Dhaka, but with the franchisee/licensee of a hotel. By using this Site you agree to be bound to the owner of the hotel and to The Zabeer Dhaka, if applicable, and to abide by the booking terms and conditions.</p><p><span style=\"font-weight: bolder;\">WIRELESS RESERVATIONS</span>. Functionality is not guaranteed with all types of mobile devices in using this Site. You should contact your service provider directly for technical assistance or any questions. Please note that security features vary by carrier/service provider and mobile device. Additional minutes/charges may apply and may be charged by your mobile carrier/service provider.</p><p><span style=\"font-weight: bolder;\">CURRENCY CONVERSION</span>. Currency rates are based on publicly available sources and should be used as guidelines only. Room rates are guaranteed only in hotel\'s local currency. Currency quotes are not updated every day. The currency information supplied by this Site is believed to be accurate, but The Zabeer Dhaka and/or its parent, subsidiaries and affiliates do not warrant or guarantee such accuracy.</p><p><span style=\"font-weight: bolder;\">LIMITED LICENCE TO VIEW AND COPY</span>. The content and information displayed on this Site is the property of The Zabeer Dhaka. The downloading, reproduction, or retransmission of information, other than for non-commercial individual use, is strictly prohibited.</p><p>This Site is to be used by Authorised Users for personal use only. Commercial uses of this Site are strictly prohibited. If you are currently an Authorised User, you are granted a limited, non-transferable, revocable license to view and copy the Materials solely for your personal use, subject to the restrictions below.</p><p><span style=\"font-weight: bolder;\">PROHIBITED CONDUCT</span>. You agree not to: (a) copy, display, modify, reproduce, or otherwise transfer any of the Materials to any third party without the prior written permission of The Zabeer Dhaka; (b) interfere or disrupt networks connected to the Site; (c) use or attempt to use any device, software or routine which interferes with the proper functioning of the Site or any transactions being offered through the Site; (d) transmit files, data or other materials containing a computer virus, corrupted data, worms, “Trojan horses” or other instructions or design that would erase data or programming or cause the Site or any equipment or system to become inoperable or incapable of being used in the full manner for which it was designed; (e) deliver any communication to or through the Site which violates any local, state, federal or international law; (f) deliver any communication to or through the Site that contains defamatory, libellous, abusive or obscene material; or (g) deliver any communication to or through the Site that will infringe upon the rights of any third party.</p><p><span style=\"font-weight: bolder;\">INTELLECTUAL PROPERTY RIGHTS</span>. This Site and the Materials contain and reference trademarks, patents, trade secrets, technologies, products, processes or other proprietary rights of&nbsp; companies and/or other parties. No licence or right to or in any such trademarks, patents, trade secrets, technologies, products, processes and other proprietary rights of&nbsp; companies and/or other parties is granted to or conferred upon you. Reproduction or storage of materials obtained from this Site is subject to the U.S. Copyright Act of 1976, Title 17 U.S.C. No Materials may be reproduced, distributed, posted, displayed, uploaded, or transmitted except as expressly permitted herein. You may not remove any copyright, trademark notice or proprietary notices from the Materials; or use the Materials or this Site except as permitted in this Agreement. The use of any Materials from the Site on any other internet, intranet, web or other site or computer environment is prohibited. You may not utilise framing techniques to frame any&nbsp; trademarks, logos, or other proprietary information (including images and text). You may not use any meta tags or any other \"hidden text\" utilising our name, trademarks or other proprietary information.</p><p><span style=\"font-weight: bolder;\">COPYRIGHT AND TRADEMARK NOTICES</span>. All contents of this Site are the copyrighted property of one of the&nbsp; companies, or their subsidiaries, affiliates, or an&nbsp; licensor, as applicable. All contents of this Site are protected by United States and international copyright laws.</p><p>The Zabeer Dhaka Hotels Group and ® Hotels &amp; Resorts are trade names describing the subsidiary companies of The Zabeer Dhaka Hotels Group PLC involved in the hotel business around the world. In the U.S. and Canada, Holiday Hospitality Franchising, LLC is the franchisor/licensor of most&nbsp; brand names and marks. Trademarks owned by an&nbsp; company may not be used or displayed publicly without the prior written permission of the owner of the marks, except for downloaded logos and photographs as provided for elsewhere on this Site. Any rights not expressly granted herein are reserved.</p><p>The following are some of the service marks owned by The Zabeer Dhaka, its parents, subsidiaries, or affiliates (all The Zabeer Dhaka Hotels Group companies): ®, The Zabeer Dhaka®, Regent®, Kimpton®, voco®, Crowne Plaza®, HUALUXE®, EVEN®, Hotel Indigo®, Holiday Inn®, Holiday Inn Express®, avid®, Holiday Inn Resort®, Holiday Inn Club Vacations®, Staybridge Suites®, Candlewood Suites®, ® One Rewards, Six Senses®, Atwell Suites™, Vignette™.</p><p>The Zabeer Dhaka respects the copyright rights of others and has adopted and implemented a policy that provides for (a) the removal of content from this Site under appropriate circumstances, and (b) the suspension or termination of account holders or subscribers who repeatedly infringe the copyright rights of others. If you are a copyright owner and you believe your work has been copied in a way that constitutes copyright infringement, please contact ’s designated Copyright Agent, as hereafter defined, and provide the following information:</p><p>A physical or electronic signature of a person authorised to act on behalf of the owner of an exclusive right of copyright that is allegedly infringed;</p><p>Identification of the copyrighted work claimed to have been infringed or, if multiple copyrighted works at a single online site are covered by a single notification, a representative list of such works at that site;</p><p>Identification of the material that is claimed to be infringing or to be the subject of infringing activity, and information reasonably sufficient to permit us to locate the material;</p><p>Information reasonably sufficient to permit us to contact the complaining party (for example, the complaining party’s physical address, email address, and telephone number);</p><p>A statement that the complaining party has a good faith belief that use of the material is unauthorised; and,</p><p>A statement that the information in the notification is accurate and, under penalty of perjury, that the complaining party is authorised to act on behalf of the owner of an exclusive right that is allegedly infringed.</p><p>Parties submitting content to the Site should be aware that&nbsp; companies reserve the right to suspend or terminate their subscriptions or accounts in the event that&nbsp; companies determine, in their sole discretion, that they have engaged in repeated acts of copyright infringement.</p><p><span style=\"font-weight: bolder;\">OWNERSHIP OF MATERIALS</span>. The Materials are confidential and proprietary information of&nbsp; companies or its licensors, as applicable.</p><p><span style=\"font-weight: bolder;\">LINKED WEB SITES</span>. This Site includes links to other web sites. The Zabeer Dhaka provides such links solely as a convenience to you and for informational purposes only. The Zabeer Dhaka has not reviewed all of the information on these other web sites. The inclusion of these links in no way indicates The Zabeer Dhaka’s or other&nbsp; companies’ endorsement, support or approval of the content, advertising, products, services, policies or other materials on or available from such web sites. Neither The Zabeer Dhaka, nor any other providers of products or services related to this Site, shall be responsible for the content of any other web sites and make no representation or warranty regarding any other web sites or the contents or materials on such web sites. If you decide to access other web sites, you do so at your own risk. Other web sites may include links to the Site. The inclusion of such links does not indicate the other web site’s endorsement, support or approval of the content, advertising, products, services, policies or other materials on or available from the Site.</p><p><span style=\"font-weight: bolder;\">PRIVACY</span>. Your use of the Site is subject to the&nbsp; Privacy Policy. If you would like to view the privacy practices please review our Privacy Statement.</p><p><span style=\"font-weight: bolder;\">SECURITY</span>. If you have been provided with a login and password, then any such login and password are for your personal use only. You may not reveal your login or password to anyone else or permit anyone else to use your login and password to access the Site. You are responsible for maintaining the confidentiality and security of your login and password and accept responsibility for all activities that occur under your account or password. You must notify&nbsp; immediately in the event that the security of your login or password has been breached.</p><p><span style=\"font-weight: bolder;\">DISCLAIMER</span>. THE MATERIALS ARE PROVIDED \"AS IS\" WITHOUT ANY WARRANTY, REPRESENTATION, CONDITION, UNDERTAKING OR TERM OF ANY KIND, EXPRESS OR IMPLIED, STATUTORY OR OTHERWISE, INCLUDING WITHOUT LIMITATION, THE WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT OF INTELLECTUAL PROPERTY, OR FITNESS FOR A PARTICULAR PURPOSE. BECAUSE SOME JURISDICTIONS PROHIBIT THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU. Further The Zabeer Dhaka does not warrant the accuracy or completeness of the information, text, graphics, links or other items contained within the Materials. The Zabeer Dhaka may make changes to the Materials, or the programmes, policies or other information described in the Materials, at any time without notice. The Zabeer Dhaka makes no commitment to update the Materials.</p><p><span style=\"font-weight: bolder;\">LIMITATION OF LIABILITY. IN NO EVENT SHALL AN&nbsp; COMPANY BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER, INCLUDING LOSS OF PROFITS OR DATA, WHETHER IN AN ACTION IN CONTRACT OR TORT, ARISING OUT OF THE USE OR PERFORMANCE OF THE SITE, THESE TERMS OF USE, THE MATERIALS, THE AGREEMENT, OR THE PERFORMANCE OR NON-PERFORMANCE BY AN&nbsp; COMPANY OR ANY THIRD PARTY PROVIDERS OF PRODUCTS OR SERVICES RELATED TO THIS SITE. THIS LIMITATION OF LIABILITY SHALL APPLY REGARDLESS OF WHETHER THE CLAIM ASSERTED IS BASED ON CONTRACT, NEGLIGENCE, OR ANY OTHER THEORY OF RECOVERY, EVEN IF&nbsp; HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. BECAUSE SOME JURISDICTIONS PROHIBIT THE EXCLUSION OR LIMITATION OF LIABILITY FOR CONSEQUENTIAL OR INCIDENTAL DAMAGES, THE ABOVE LIMITATION MAY NOT APPLY TO YOU.</span></p><p><span style=\"font-weight: bolder;\">ELECTRONIC COMMUNICATIONS PRIVACY ACT NOTICE (18 U.S.C. 2701-2711): WE MAKE NO GUARANTY OF CONFIDENTIALITY OR PRIVACY OF ANY COMMUNICATION OR INFORMATION TRANSMITTED ON THE SITE OR ANY WEB SITE LINKED TO THE SITE. WE WILL NOT BE LIABLE FOR THE PRIVACY OF THE INFORMATION, E-MAIL ADDRESSES, REGISTRATION AND IDENTIFICATION INFORMATION, DISK SPACE, COMMUNICATIONS, CONFIDENTIAL OR TRADE-SECRET INFORMATION, OR ANY OTHER CONTENT TRANSMITTED OVER NETWORKS ACCESSED BY THE SITE, OR OTHERWISE CONNECTED WITH YOUR USE OF THE SITE.</span></p><p><span style=\"font-weight: bolder;\">TERMINATION/ACCESS RESTRICTION</span>. The Zabeer Dhaka reserves the right, in its sole discretion, to modify your access or terminate your access to the Site and the Materials or any portion thereof at any time, without notice.</p><p><span style=\"font-weight: bolder;\">NOTICES</span>. All notices and other communications permitted or required by the provisions of this Agreement may be given by electronic mail, conventional mail or, if by an&nbsp; company, by posting such notice on this Site. Notice is deemed given upon receipt by you if sent by electronic mail or conventional mail, or immediately upon posting to this Site.</p><p><span style=\"font-weight: bolder;\">GOVERNING LAW</span>. These Terms of Use shall be governed by, construed and enforced in accordance with the laws of the State of Georgia, United States, without regard to its conflicts of law rules. The exclusive jurisdiction for any dispute not covered by the terms of the Arbitration provision set forth in this Agreement or Materials may be filed only in the state or federal courts located in the State of Georgia, United States.</p><p><span style=\"font-weight: bolder;\">ARBITRATION</span>. Except with respect to any claim or dispute involving the ownership, validity or use of any&nbsp; trademarks or service marks, and to the extent permitted by applicable law, any dispute arising out of or related to the use or performance of this Site, these Terms of Use, the Materials, or the Agreement, seeking as relief money damages and/or attorneys’ fees or other damages (“Covered Claims”) will be submitted for arbitration to the American Arbitration Association (AAA). The Zabeer Dhaka shall have the right in a proper case to obtain temporary restraining orders, temporary or preliminary injunctive relief and/or declaratory relief (other than declarations with respect to the amount of money damages) from a court of competent jurisdiction.</p><p>The arbitration proceedings shall be heard by one independent arbitrator who shall be an attorney or retired judge. The arbitration shall be held in accordance with the then-existing Commercial Arbitration Rules of the AAA. All matters within the scope of the Federal Arbitration Act (9 U.S.C. 1, et seq.) will be governed by it and not by any state arbitration law. You and The Zabeer Dhaka waive any rights to maintain other available resolution processes for such disputes, such as a court action or administrative proceeding, to settle disputes. You and The Zabeer Dhaka waive any right to a jury trial for such disputes. The rules in arbitration are different from the rules that apply in court. There is no judge or jury, and review is limited, but an arbitrator can award the same damages and relief, and must honour the same limitations stated in the Agreement, as a court would.</p><p>In reaching his or her decision, the arbitrator shall follow this Agreement and Materials, shall be bound to apply the applicable law and shall not rule inconsistently with the applicable law. The arbitrator may not (1) without the consent of all parties, combine more than one individual’s claim or claims into a single case, (2) participate in or facilitate notification to others of potential claims, or (3) arbitrate or preside over any form of a class, mass, collective, or representative proceeding. The arbitrator shall include in his or her award any relief he or she deems proper in terms of money damages (with interest on unpaid amounts from the date due at the maximum rate allowed by law), and attorneys’ fees and costs. The award of the arbitrator shall be conclusive and binding upon all parties hereto and judgment upon the award may be entered in any court of competent jurisdiction.</p><p>If a party violates this arbitration agreement by commencing an action asserting a Covered Claim in a court of law, then the court (and not an arbitrator) shall have the authority to resolve any disputes about the interpretation, formation, existence, enforceability, validity, and scope of these Terms of Use, including the Agreement, this arbitration agreement, and the Waiver of Class, Mass, Collective, and Representative Claims. However, if a party complies with this arbitration agreement and files for arbitration without filing a complaint in a court of law, then the arbitrator shall have the authority to resolve any disputes about the interpretation of these Terms of Use for purposes of discovery or the merits of the underlying claim, but shall have no authority to resolve any disputes about the formation, existence, enforceability, or validity of the Terms of Use, including the Agreement, this arbitration agreement, and the Waiver of Class, Mass, Collective, and Representative Claims.</p><p>Confidential. Other than as may be required by law, the entire arbitration proceedings (including, but not limited to, any rulings, decisions or orders of the arbitrator), shall remain confidential and not be disclosed to anyone other than the parties to this Agreement.</p><p><span style=\"font-weight: bolder;\">LIMITATIONS PERIOD</span>. Any and all Covered Claims shall be commenced within one (1) year from the occurrence of the facts giving rise to such claim or action, or such claim or action shall be barred. This Limitations Period section does not apply to residents of New Jersey, and is not applicable where local law prohibits it.</p><p><span style=\"font-weight: bolder;\">WAIVER OF CLASS, MASS, COLLECTIVE, AND REPRESENTATIVE CLAIMS</span>. To the extent permitted by law, you agree that you will not file a class action against an&nbsp; company, participate in a class action against an&nbsp; company, file or seek a class, mass, collective, or representative arbitration against an&nbsp; company, or participate in such an arbitration against an&nbsp; company, for any Covered Claims. To the extent permitted by law, you agree that all such claims may only be brought in your individual capacity, and not on behalf of other individuals.</p><p><span style=\"font-weight: bolder;\">MISCELLANEOUS PROVISIONS</span>. This Agreement constitutes the entire agreement of the parties with respect to the subject matter hereof and supersedes all prior oral and written agreements. No failure or delay on the part of&nbsp; in exercising any right or remedy hereunder or enforcing the terms and conditions of this Agreement will operate as a waiver thereof. If any part or provision of this Agreement is found to be invalid, unenforceable or void, then the remaining portion shall remain in full force and effect. If the Waiver of Class, Mass, Collective, and Representative Claims is found to be unenforceable, then any claim brought on a class, mass, collective, or representative action basis must be filed in a court of competent jurisdiction, and such court shall be the exclusive forum for such claims. Headings are for convenience only and not for use in interpretation of this Agreement.</p><p>&nbsp;</p><p><span style=\"font-weight: bolder;\">© Copyright 2023 The Zabeer Dhaka, House-1, Road-2, Sector-1, Uttara Model Town, Dhaka-1230. All rights reserved.</span></p><p><span style=\"font-weight: bolder;\">Effective Date: 02 January 2023</span></p>', 'terms-conditions', '12', NULL, 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', 1, 1, 1, '0', '0', NULL, '2023-01-10 14:07:03');

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
(1, 'Spa', 'spa', 'Spa', '<p>Spa<br></p>', 'spa.png', 'Spa', 'Spa', 'Spa', 1, 1, '0', '0', '2022-12-13 23:35:12', '2023-01-10 13:44:44'),
(2, 'Gym', 'gym', 'Gym', '<p>Gym<br></p>', 'gym.png', 'Gym', 'Gym', 'Gym', 1, 1, '0', '0', '2022-12-13 23:35:51', '2023-01-10 13:44:59'),
(3, 'Saloon', 'saloon', 'Saloon', '<p>Saloon<br></p>', 'saloon.png', 'Saloon', 'Saloon', 'Saloon', 0, 1, '0', '0', '2022-12-13 23:36:38', '2023-01-15 01:15:31'),
(4, 'Swimming Pool', 'swimming-pool', 'Swimming Pool', '<p>Swimming Pool<br></p>', NULL, 'Swimming Pool', 'Swimming Pool', 'Swimming Pool', 0, 1, '0', '0', '2022-12-13 23:37:31', '2023-01-10 13:45:33');

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
(27, '2022_12_26_095654_create_hb_offers_table', 5),
(28, '2023_01_09_044559_create_hb_faqs_table', 6),
(29, '2023_01_16_053227_create_hb_offer_categories_table', 7);

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
(1, 'Raisul', 'Showmin', 'raisul.syp@gmail.com', NULL, '$2y$10$8SHpXdo.ipSuthNmUs7LnODtm8KT0yzJUd1zRv8Ec6nImOSwRS8B.', NULL, 'Male', '1995-10-03', '01680078100', 'H-2445/1, Uttarkhan Mazar Para', 'Dhaka', NULL, '1230', 'Bangladesh', NULL, 'Raisul-1674020067.jpg', 'Raisul-1674020067.jpg', 1, 1, NULL, '5', '2022-12-26 03:59:03', '2023-01-17 23:34:27'),
(2, 'Ashraf', 'Khan', 'ashraf.khan@gmail.com', NULL, '$2y$10$3/WZUREEcEE/YqfdmX85E.EPxmy5Lbj1w/FxVl2ZId.1jvNIo7Sh6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2023-01-01 09:26:32', '2023-01-01 09:26:32');

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
-- Indexes for table `hb_faqs`
--
ALTER TABLE `hb_faqs`
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
-- Indexes for table `hb_offer_categories`
--
ALTER TABLE `hb_offer_categories`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hb_bookings`
--
ALTER TABLE `hb_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hb_country`
--
ALTER TABLE `hb_country`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `hb_facilities`
--
ALTER TABLE `hb_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hb_faqs`
--
ALTER TABLE `hb_faqs`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hb_offer_categories`
--
ALTER TABLE `hb_offer_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hb_roomtype`
--
ALTER TABLE `hb_roomtype`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hb_roomtype_view`
--
ALTER TABLE `hb_roomtype_view`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hb_room_facilities`
--
ALTER TABLE `hb_room_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `hb_room_images`
--
ALTER TABLE `hb_room_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
