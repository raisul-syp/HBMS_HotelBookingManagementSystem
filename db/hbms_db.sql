-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2022 at 12:05 PM
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
(1, 'Muhammad Raisul', 'Islam', 'admin@gmail.com', NULL, '$2y$10$YgNr5xt2kIz4rBtq1H6TzOpmMzi1T.YTMVxIDCdGwgzQvlGYofmxO', NULL, 'Male', '1995-10-03', '01680078100', 'House # 2445/1, Uttarkhan Mazar Para, Uttarkhan', 'Dhaka', 'Dhaka', '1230', 'Bangladesh', 'I am Admin', 0, NULL, NULL, 1, 1, NULL, '0', '2022-11-21 00:52:22', '2022-11-24 00:26:50'),
(2, 'First', 'Staff', 'first.staff@gmail.com', NULL, '$2y$10$FrM.5ma/MpdRY37Xh8FGo.02Gxy9wjUB277zHf9t87LaN8jAiHWLy', NULL, 'Female', '2021-06-01', '01680078200', 'Uttara', 'Dhaka', 'Dhaka', '1230', 'Bangladesh', 'dffdgdfgfdg', 1, 'First-1669266861.png', 'First-1669266861.jpg', 1, 1, '0', '0', '2022-11-23 23:14:21', '2022-11-24 04:12:45');

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
  `booking_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Booked, 2=Cancel',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Delete, 1=Not Delete',
  `booking_comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_bookings`
--

INSERT INTO `hb_bookings` (`id`, `guest_id`, `room_id`, `staff_id`, `checkin_date`, `checkout_date`, `checkin_time`, `checkout_time`, `total_adults`, `total_childs`, `booking_status`, `is_delete`, `booking_comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2022-11-28', '2022-11-29', '12:00', '11:00', '2', '1', 0, 1, 'Test Booking', '2022-11-26 03:58:17', '2022-11-26 03:58:17'),
(2, 2, 2, 1, '2022-12-01', '2022-12-03', '12:00', '11:00', '3', '2', 1, 1, 'Test', '2022-11-27 00:58:06', '2022-11-27 00:58:06'),
(3, 2, 1, 2, '2022-11-30', '2022-12-01', '17:37', '10:37', '1', '0', 2, 1, NULL, '2022-11-27 05:37:49', '2022-11-27 05:37:49');

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
  `hotel_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `hb_rooms` (`id`, `name`, `hotel_location`, `slug`, `short_description`, `long_description`, `max_adults`, `max_childs`, `quantity`, `price`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Suite', 'Dhaka', 'suite-dhaka', 'Approximate room size: 42 m2 , Ideal for families, the hotel’s 16 beautifully appointed Suite offer separate sleeping and living areas to maximize your privacy and ensure a great night’s sleep.', '<p>Approximate room size: 42 m2 , Ideal for families, the hotel’s 16 beautifully appointed Suite offer separate sleeping and living areas to maximize your privacy and ensure a great night’s sleep. Refresh your mind and body in a bathroom equipped with standing shower and enjoy complimentary welcome drinks on arrival as our way of welcoming you to Jashore .Booking for these suite also include complimentary airport transportation.<br></p>', 2, 1, 10, 18000, 'Suite', 'Suite', 'Suite', 1, 1, '0', '0', '2022-11-21 03:30:19', '2022-11-30 23:31:01'),
(2, 'Deluxe', 'Dhaka', 'deluxe-dhaka', 'Approximate room size: 320 Sqft premium Rooms are larger than Deluxe Rooms and offer one king size or two twin size beds to suit your needs.', '<p>Approximate room size: 320 Sqft premium Rooms are larger than Deluxe Rooms and offer one king size or two twin size beds to suit your needs. Sink into one of two sofa chairs, and enjoy air conditioning plush bathrobes and free high speed wireless internet.<br></p>', 3, 2, 10, 11000, 'Deluxe', 'Deluxe', 'Deluxe', 1, 1, '0', '0', '2022-11-26 00:13:42', '2022-11-30 23:31:38'),
(3, 'Deluxe Twin', 'Dhaka', 'deluxe-twin-dhaka', 'Approximate room size: 320 Sqft premium Rooms are larger than Deluxe Rooms and offer one king size or two twin size beds to suit your needs.', '<p>Approximate room size: 320 Sqft premium Rooms are larger than Deluxe Rooms and offer one king size or two twin size beds to suit your needs. Sink into one of two sofa chairs, and enjoy air conditioning plush bathrobes and free high speed wireless internet.<br></p>', 4, 2, 10, 13000, 'Deluxe Twin', 'Deluxe Twin', 'Deluxe Twin', 1, 1, '0', '0', '2022-11-27 23:37:04', '2022-12-01 00:04:55'),
(4, 'Premium', 'Dhaka', 'premium-dhaka', 'Approximate room size: 320 Sqft premium Rooms are larger than Deluxe Rooms and offer one king size or two twin size beds to suit your needs.', '<p>Approximate room size: 320 Sqft premium Rooms are larger than Deluxe Rooms and offer one king size or two twin size beds to suit your needs. Sink into one of two sofa chairs, and enjoy air conditioning plush bathrobes and free high speed wireless internet.<br></p>', 3, 3, 10, 15000, 'Premium', 'Premium', 'Premium', 1, 1, '0', '0', '2022-11-30 00:56:00', '2022-11-30 23:32:02'),
(5, 'Premium Twin', 'Dhaka', 'premium-twin-dhaka', 'Approximate room size: 320 Sqft premium Rooms are larger than Deluxe Rooms and offer one king size or two twin size beds to suit your needs.', '<p>Approximate room size: 320 Sqft premium Rooms are larger than Deluxe Rooms and offer one king size or two twin size beds to suit your needs. Sink into one of two sofa chairs, and enjoy air conditioning plush bathrobes and free high speed wireless internet.<br></p>', 4, 3, 10, 16000, 'Premium Twin', 'Premium Twin', 'Premium Twin', 1, 1, '0', '0', '2022-11-30 00:57:39', '2022-11-30 23:32:15');

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
(2, 1, 2, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 3, 1, NULL, NULL),
(6, 3, 2, NULL, NULL),
(7, 4, 1, NULL, NULL),
(8, 4, 2, NULL, NULL),
(9, 5, 2, NULL, NULL);

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
(6, 1, 8, NULL, NULL),
(7, 2, 1, NULL, NULL),
(8, 2, 2, NULL, NULL),
(9, 2, 3, NULL, NULL),
(10, 2, 4, NULL, NULL),
(11, 2, 5, NULL, NULL),
(12, 2, 6, NULL, NULL),
(13, 2, 8, NULL, NULL),
(14, 2, 9, NULL, NULL),
(15, 3, 1, NULL, NULL),
(16, 3, 2, NULL, NULL),
(17, 3, 3, NULL, NULL),
(18, 3, 4, NULL, NULL),
(19, 3, 5, NULL, NULL),
(20, 3, 6, NULL, NULL),
(21, 3, 7, NULL, NULL),
(22, 3, 8, NULL, NULL),
(23, 3, 9, NULL, NULL),
(24, 4, 1, NULL, NULL),
(25, 4, 2, NULL, NULL),
(26, 4, 3, NULL, NULL),
(27, 4, 4, NULL, NULL),
(28, 4, 5, NULL, NULL),
(29, 4, 6, NULL, NULL),
(30, 4, 8, NULL, NULL),
(31, 5, 1, NULL, NULL),
(32, 5, 2, NULL, NULL),
(33, 5, 3, NULL, NULL),
(34, 5, 5, NULL, NULL),
(35, 5, 6, NULL, NULL),
(36, 5, 7, NULL, NULL),
(37, 5, 8, NULL, NULL),
(38, 5, 9, NULL, NULL);

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
(2, 1, 'uploads/rooms/Suite-1669023019-2.jpg', '2022-11-21 03:30:19', '2022-11-21 03:30:19'),
(3, 2, 'uploads/rooms/Deluxe-1669443222-1.jpg', '2022-11-26 00:13:42', '2022-11-26 00:13:42'),
(4, 3, 'uploads/rooms/Deluxe Twin 103-1669613824-1.jpg', '2022-11-27 23:37:04', '2022-11-27 23:37:04'),
(5, 4, 'uploads/rooms/premium-104-1669791360-1.jpg', '2022-11-30 00:56:00', '2022-11-30 00:56:00'),
(6, 5, 'uploads/rooms/premium-twin-105-1669791459-1.jpg', '2022-11-30 00:57:39', '2022-11-30 00:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `hb_webnav`
--

CREATE TABLE `hb_webnav` (
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
-- Dumping data for table `hb_webnav`
--

INSERT INTO `hb_webnav` (`id`, `name`, `slug`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'home', '1', 'Home', 'Home', 'Home', 1, 1, '0', NULL, '2022-11-30 02:39:22', '2022-11-30 02:39:22'),
(2, 'Rooms', 'rooms', '2', 'Rooms', 'Rooms', 'Rooms', 1, 1, '0', NULL, '2022-11-30 02:50:30', '2022-11-30 02:50:30'),
(3, 'Restaurents', 'restaurents', '3', 'Restaurents', 'Restaurents', 'Restaurents', 1, 1, '0', NULL, '2022-12-01 04:18:13', '2022-12-01 04:18:13'),
(4, 'Meeting & Events', 'meeting-events', '4', 'Meeting & Events', 'Meeting & Events', 'Meeting & Events', 1, 1, '0', NULL, '2022-12-01 04:20:41', '2022-12-01 04:20:41'),
(5, 'Wellness', 'wellness', '5', 'Wellness', 'Wellness', 'Wellness', 1, 1, '0', NULL, '2022-12-01 04:21:33', '2022-12-01 04:21:33'),
(6, 'About Us', 'about-us', '6', 'About Us', 'About Us', 'About Us', 1, 1, '0', NULL, '2022-12-01 04:22:12', '2022-12-01 04:22:12'),
(7, 'Contact Us', 'contact-us', '7', 'Contact Us', 'Contact Us', 'Contact Us', 1, 1, '0', NULL, '2022-12-01 04:22:31', '2022-12-01 04:22:31');

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
(12, '2022_11_21_080358_create_hb_room_facilities_table', 6),
(13, '2022_11_26_064509_create_hb_bookings_table', 7),
(14, '2022_11_30_080042_create_hb_webnav_table', 8);

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
(1, 'Muhammad Raisul', 'Islam', 'raisul.syp@gmail.com', NULL, '$2y$10$CWvBdsZ5lEzrag0p/HhQze7nZSbyvE7zPuYzAHoqmQ.JVoJe/pKE.', NULL, 'Male', '2021-12-02', '01680078101', 'Uttara', 'sdfsdf', 'sdfsdf', '1236', 'Bangladesh', 'fgfgfdgfdg', 'Muhammad Raisul-1669284670.png', 'Muhammad Raisul-1669284670.png', 1, 1, NULL, '0', '2022-11-21 00:27:21', '2022-11-24 04:11:10'),
(2, 'First', 'Guest', 'first.guest@gmail.com', NULL, '$2y$10$oKwoSHEXFKJVZW89yccz0Ojl8GDzbozuUI8BiyigeMRv7/59jXymK', NULL, 'Male', '2022-05-18', '01680078900', 'ghfghfghfgh', 'jkhljkl', 'sadsadsadfg', '1230', 'Bangladesh', 'Admin', 'First-1669280394.png', 'First-1669284718.jpg', 1, 1, '0', '0', '2022-11-24 02:59:54', '2022-11-24 04:11:58');

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
-- Indexes for table `hb_webnav`
--
ALTER TABLE `hb_webnav`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hb_bookings`
--
ALTER TABLE `hb_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `hb_rooms`
--
ALTER TABLE `hb_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hb_roomtype`
--
ALTER TABLE `hb_roomtype`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hb_roomtype_view`
--
ALTER TABLE `hb_roomtype_view`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hb_room_facilities`
--
ALTER TABLE `hb_room_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `hb_room_images`
--
ALTER TABLE `hb_room_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hb_webnav`
--
ALTER TABLE `hb_webnav`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
