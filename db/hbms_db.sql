-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2022 at 01:42 PM
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
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hb_bookings`
--

INSERT INTO `hb_bookings` (`id`, `guest_id`, `room_id`, `staff_id`, `checkin_date`, `checkout_date`, `checkin_time`, `checkout_time`, `total_adults`, `total_childs`, `booking_status`, `is_delete`, `booking_comment`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 1, 2, 2, '2022-12-19', '2022-12-20', '14:00', '12:00', '2', '1', 1, 1, 'Admin Booking', NULL, NULL, '2022-12-17 02:32:07', '2022-12-17 02:32:07'),
(6, 1, 2, 2, '2022-12-20', '2022-12-21', '14:00', '12:00', '1', '0', 1, 1, 'Admin', NULL, NULL, '2022-12-17 02:36:07', '2022-12-17 02:36:07'),
(7, 1, 1, 2, '2022-12-18', '2022-12-19', '14:00', '12:00', '2', '1', 1, 1, 'asdasd', NULL, NULL, '2022-12-17 02:37:24', '2022-12-17 02:37:24'),
(8, 1, 2, 2, '2022-12-22', '2022-12-23', '14:00', '12:00', '1', '0', 1, 1, 'Admin', NULL, NULL, '2022-12-17 02:49:15', '2022-12-17 02:49:15'),
(9, 1, 3, 2, '2022-12-18', '2022-12-19', '14:00', '12:00', '1', '0', 0, 1, 'Admin', '0', NULL, '2022-12-19 01:31:11', '2022-12-19 01:31:11'),
(10, 1, 4, 1, '2022-12-20', '2022-12-21', '14:00', '12:00', '2', '3', 0, 1, 'Booking created by Guest', '5', NULL, '2022-12-20 06:16:42', '2022-12-20 06:16:42'),
(11, 1, 4, 1, '2022-12-29', '2022-12-30', '14:00', '12:00', '4', '3', 0, 1, 'Booking created by Guest', '5', NULL, '2022-12-20 06:17:55', '2022-12-20 06:17:55');

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
(9, 'Intercom', 'intercom', 'Intercom', 'intercom.png', 'Intercom', 'Intercom', 'Intercom', 0, 1, '0', '0', '2022-11-21 03:28:24', '2022-12-03 00:08:36');

-- --------------------------------------------------------

--
-- Table structure for table `hb_halls`
--

CREATE TABLE `hb_halls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_halls` (`id`, `name`, `hotel_id`, `slug`, `short_description`, `long_description`, `logo_image`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Board Room', 1, 'board-room-dhaka-dhaka-dhaka-dhaka', 'The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For Board Room 30 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p style=\"text-align: left;\">The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For Board Room 30 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Board Room', 'Board Room', 'Board Room', 1, 1, '0', '0', '2022-12-14 02:54:56', '2022-12-20 01:23:32'),
(2, 'Olive Hall', 1, 'olive-hall-dhaka-dhaka', 'The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-VisuThe Hotel Has 3 Dedicated Conference And Event Venues Has The Olive Hall Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p>The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-VisuThe Hotel Has 3 Dedicated Conference And Event Venues Has The Olive Hall Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Olive Hall', 'Olive Hall', 'Olive Hall', 1, 1, '0', '0', '2022-12-14 04:58:33', '2022-12-20 01:24:08'),
(3, 'Tulip Hall', 1, 'tulip-hall-dhaka-dhaka', 'The Hotel Has 3 The Hotel Has 3 Dedicated Conference And Event Venues Has The Tulip Hall Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.', '<p>The Hotel Has 3 The Hotel Has 3 Dedicated Conference And Event Venues Has The Tulip Hall Capacity For 80 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.<br></p>', NULL, 'Tulip Hall', 'Tulip Hall', 'Tulip Hall', 1, 1, '0', '0', '2022-12-14 04:59:14', '2022-12-20 01:24:43');

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

--
-- Dumping data for table `hb_hall_images`
--

INSERT INTO `hb_hall_images` (`id`, `hall_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/halls/board-room-dhaka-dhaka-dhaka-dhaka-1671521012-1.jpg', '2022-12-20 01:23:32', '2022-12-20 01:23:32'),
(2, 2, 'uploads/halls/olive-hall-dhaka-dhaka-1671521048-1.jpg', '2022-12-20 01:24:08', '2022-12-20 01:24:08'),
(3, 3, 'uploads/halls/tulip-hall-dhaka-dhaka-1671521083-1.jpg', '2022-12-20 01:24:43', '2022-12-20 01:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `hb_hotels`
--

CREATE TABLE `hb_hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_hotels`
--

INSERT INTO `hb_hotels` (`id`, `name`, `slug`, `hotel_location`, `display_order`, `description`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'The Zabeer Dhaka', 'the-zabeer-dhaka', 'Dhaka', '1', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 1, 1, '0', NULL, '2022-12-11 23:49:25', '2022-12-11 23:49:25'),
(2, 'The Zabeer Jashore', 'the-zabeer-jashore', 'Jashore', '2', 'The Zabeer Jashore', 'The Zabeer Jashore', 'The Zabeer Jashore', 'The Zabeer Jashore', 1, 1, '0', '0', '2022-12-11 23:50:17', '2022-12-12 00:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `hb_restaurents`
--

CREATE TABLE `hb_restaurents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_restaurents` (`id`, `name`, `hotel_id`, `slug`, `short_description`, `long_description`, `logo_image`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Cafe 24', 1, 'cafe-24-dhaka-dhaka-dhaka-dhaka', 'Located on the ground level, it is a modern delight. Enjoy lively chit chat in a Comfortable gathering place.', '<p>Located on the ground level, it is a modern delight .Enjoy lively chit chat in a Comfortable gathering place .A wide selection of premium coffees, teas and freshly squeezed juices is served throughout the day and our varieties of smoothie is a healthy way to Satisfy your sweet tooth.</p><h3 style=\"text-align: center; \"><b>Opening hours: 24 hrs open</b></h3>', 'cafe-24-dhaka.png', 'Cafe 24', 'Cafe 24', 'Cafe 24', 1, 1, '0', '0', '2022-12-14 01:03:04', '2022-12-20 01:05:15'),
(2, 'Taste Of Heaven', 1, 'taste-of-heaven-dhaka-dhaka-dhaka', 'Taste of Heaven is a contemporary all day dining restaurant where modern design innovative cuisine. Round the clock dining destination showcases an array of international delights.', '<p>Taste of Heaven is a contemporary all day dining restaurant where modern design innovative cuisine. Round the clock dining destination showcases an array of international delights.</p><h3 style=\"text-align: center; \"><b>Opening hours: 06.30 hrs to 22.30 hrs</b></h3>', 'taste-of-heaven-dhaka.png', 'Taste Of Heaven', 'Taste Of Heaven', 'Taste Of Heaven', 1, 1, '0', '0', '2022-12-14 01:04:00', '2022-12-20 01:09:43'),
(3, 'Sky Line', 1, 'sky-line-dhaka-dhaka-dhaka', 'A Casual dining 60 seater barbeque and gril specialty dining at the pool side overlooking amazing natural green view of Dhaka.', '<p>A Casual dining 60 seater barbeque and gril specialty dining at the pool side overlooking amazing natural green view of Dhaka.</p><h3 style=\"text-align: center; \"><b>OPENING HOURS: 17.00 hrs to 23.00 hrs</b></h3>', 'sky-line-dhaka.png', 'Sky Line', 'Sky Line', 'Sky Line', 1, 1, '0', '0', '2022-12-14 01:05:01', '2022-12-20 01:11:39'),
(4, 'Noxx Bar', 1, 'noxx-bar-dhaka-dhaka-dhaka', 'Noxx Bar', '<p>Noxx Bar<br></p>', 'noxx-bar-dhaka.png', 'Noxx Bar', 'Noxx Bar', 'Noxx Bar', 1, 1, '0', '0', '2022-12-14 01:05:28', '2022-12-20 01:52:47');

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

--
-- Dumping data for table `hb_restaurent_images`
--

INSERT INTO `hb_restaurent_images` (`id`, `restaurent_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/restaurents/cafe-24-dhaka-dhaka-dhaka-1671519868-1.jpg', '2022-12-20 01:04:28', '2022-12-20 01:04:28'),
(2, 1, 'uploads/restaurents/cafe-24-dhaka-dhaka-dhaka-dhaka-1671519915-1.jpg', '2022-12-20 01:05:15', '2022-12-20 01:05:15'),
(3, 1, 'uploads/restaurents/cafe-24-dhaka-dhaka-dhaka-dhaka-1671519915-2.jpg', '2022-12-20 01:05:15', '2022-12-20 01:05:15'),
(4, 1, 'uploads/restaurents/cafe-24-dhaka-dhaka-dhaka-dhaka-1671519915-3.JPG', '2022-12-20 01:05:15', '2022-12-20 01:05:15'),
(5, 2, 'uploads/restaurents/taste-of-heaven-dhaka-dhaka-1671520059-1.JPG', '2022-12-20 01:07:39', '2022-12-20 01:07:39'),
(6, 2, 'uploads/restaurents/taste-of-heaven-dhaka-dhaka-dhaka-1671520183-1.jpg', '2022-12-20 01:09:43', '2022-12-20 01:09:43'),
(7, 2, 'uploads/restaurents/taste-of-heaven-dhaka-dhaka-dhaka-1671520183-2.jpg', '2022-12-20 01:09:43', '2022-12-20 01:09:43'),
(8, 3, 'uploads/restaurents/sky-line-dhaka-dhaka-1671520273-1.jpg', '2022-12-20 01:11:13', '2022-12-20 01:11:13'),
(9, 3, 'uploads/restaurents/sky-line-dhaka-dhaka-dhaka-1671520299-1.jpg', '2022-12-20 01:11:39', '2022-12-20 01:11:39'),
(10, 4, 'uploads/restaurents/noxx-bar-dhaka-dhaka-1671520371-1.jpg', '2022-12-20 01:12:51', '2022-12-20 01:12:51'),
(11, 4, 'uploads/restaurents/noxx-bar-dhaka-dhaka-dhaka-1671522767-1.JPG', '2022-12-20 01:52:47', '2022-12-20 01:52:47'),
(12, 4, 'uploads/restaurents/noxx-bar-dhaka-dhaka-dhaka-1671522767-2.JPG', '2022-12-20 01:52:47', '2022-12-20 01:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `hb_rooms`
--

CREATE TABLE `hb_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_rooms` (`id`, `name`, `hotel_id`, `slug`, `short_description`, `long_description`, `max_adults`, `max_childs`, `quantity`, `price`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Deluxe', 1, 'deluxe-dhaka', 'Deluxe', '<p>Deluxe<br></p>', 2, 1, 10, 220, 'Deluxe', 'Deluxe', 'Deluxe', 1, 1, '0', NULL, '2022-12-15 00:44:42', '2022-12-15 00:44:42'),
(2, 'Super Deluxe King', 1, 'super-deluxe-king-dhaka-dhaka', 'Super Deluxe King', '<p>Super Deluxe King<br></p>', 3, 2, 8, 260, 'Super Deluxe King', 'Super Deluxe King', 'Super Deluxe King', 1, 1, '0', '0', '2022-12-15 00:45:59', '2022-12-18 04:12:04'),
(3, 'Premium Delux', 1, 'premium-delux-dhaka', 'Premium Delux', '<p>Premium Delux<br></p>', 3, 3, 10, 280, 'Premium Delux', 'Premium Delux', 'Premium Delux', 1, 1, '0', NULL, '2022-12-15 00:47:55', '2022-12-15 00:47:55'),
(4, 'Premium Delux Twin', 1, 'premium-delux-twin-dhaka', 'Premium Delux Twin', '<p>Premium Delux Twin<br></p>', 4, 2, 10, 280, 'Premium Delux Twin', 'Premium Delux Twin', 'Premium Delux Twin', 1, 1, '0', NULL, '2022-12-15 00:49:23', '2022-12-15 00:49:23');

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
(1, 'City View', 'city-view', 'City View', 'city-view.png', 'City View', 'City View', NULL, 1, 1, '0', '0', '2022-11-21 03:16:45', '2022-12-19 23:56:07'),
(2, 'Balcony', 'balcony', 'Balcony', 'balcony.png', 'Balcony', 'Balcony', NULL, 1, 1, '0', '0', '2022-11-21 03:25:24', '2022-12-19 23:56:26'),
(3, 'Sea View', 'sea-view', 'Sea View', 'sea-view.png', 'Sea View', 'Sea View', 'Sea View', 1, 1, '0', NULL, '2022-12-19 23:58:02', '2022-12-19 23:58:02');

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
(2, 2, 1, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 3, 1, NULL, NULL),
(5, 3, 2, NULL, NULL),
(6, 4, 1, NULL, NULL),
(7, 4, 2, NULL, NULL);

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
(4, 1, 8, NULL, NULL),
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
(1, 1, 'uploads/rooms/deluxe-dhaka-1671086682-1.jpg', '2022-12-15 00:44:42', '2022-12-15 00:44:42'),
(2, 1, 'uploads/rooms/deluxe-dhaka-1671086682-2.jpg', '2022-12-15 00:44:42', '2022-12-15 00:44:42'),
(3, 1, 'uploads/rooms/deluxe-dhaka-1671086682-3.JPG', '2022-12-15 00:44:42', '2022-12-15 00:44:42'),
(4, 2, 'uploads/rooms/super-deluxe-king-dhaka-1671086759-1.jpg', '2022-12-15 00:45:59', '2022-12-15 00:45:59'),
(5, 2, 'uploads/rooms/super-deluxe-king-dhaka-1671086759-2.JPG', '2022-12-15 00:45:59', '2022-12-15 00:45:59'),
(6, 2, 'uploads/rooms/super-deluxe-king-dhaka-1671086759-3.jpg', '2022-12-15 00:45:59', '2022-12-15 00:45:59'),
(7, 3, 'uploads/rooms/premium-delux-dhaka-1671086876-1.jpg', '2022-12-15 00:47:56', '2022-12-15 00:47:56'),
(8, 3, 'uploads/rooms/premium-delux-dhaka-1671086876-2.jpg', '2022-12-15 00:47:56', '2022-12-15 00:47:56'),
(9, 4, 'uploads/rooms/premium-delux-twin-dhaka-1671086963-1.jpg', '2022-12-15 00:49:23', '2022-12-15 00:49:23'),
(10, 4, 'uploads/rooms/premium-delux-twin-dhaka-1671086963-2.jpg', '2022-12-15 00:49:23', '2022-12-15 00:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `hb_settings`
--

CREATE TABLE `hb_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_map` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_sales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_reservation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_reservation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `hb_settings` (`id`, `name`, `hotel_id`, `phone`, `email`, `address`, `google_map`, `phone_sales`, `phone_reservation`, `email_sales`, `email_reservation`, `logo`, `icon`, `social_fb`, `social_tw`, `social_insta`, `social_yt`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'The Zabeer Dhaka', 1, '(+88) 02224470771-73', 'info@thezabeerdhaka.com', 'House-1, Road-2, Sector-1, Uttara Model Town, Dhaka-1230', '!1m18!1m12!1m3!1d3648.956907774987!2d90.4037768!3d23.855663900000007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c72f9daef9c5%3A0xe3bc6c9dcb0ba750!2sThe%20Zabeer%20Dhaka!5e0!3m2!1sen!2sbd!4v1670046986535!5m2!1sen!2sbd', NULL, '(+88) 01711 408 969', NULL, 'reservation@thezabeerdhaka.com', 'logo-dhaka.png', 'icon-dhaka.png', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.instagram.com/', 'https://www.youtube.com/', '1', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 1, 1, '0', NULL, '2022-12-15 05:01:25', '2022-12-15 05:01:25'),
(2, 'The Zabeer Jashore', 2, '(+88) 01885 000 555', 'sm@zabeerhotel.com', '1256, M M Ali Road, Jashore', '!1m14!1m8!1m3!1d14672.513200846855!2d89.2109886!3d23.165517!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x67b464b45fab99ac!2sThe%20Zabeer%20Jashore!5e0!3m2!1sen!2sbd!4v1670742032127!5m2!1sen!2sbd', NULL, NULL, NULL, NULL, 'logo-jashore.png', 'icon-jashore.png', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.instagram.com/', 'https://www.youtube.com/', '2', 'The Zabeer Jashore', 'The Zabeer Jashore', 'The Zabeer Jashore', 1, 1, '0', '0', '2022-12-15 05:04:06', '2022-12-15 05:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `hb_webaddresses`
--

CREATE TABLE `hb_webaddresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_sales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_reservation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_sales` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_reservation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_map` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `hb_webaddresses`
--

INSERT INTO `hb_webaddresses` (`id`, `hotel_id`, `slug`, `display_order`, `phone`, `phone_sales`, `phone_reservation`, `email`, `email_sales`, `email_reservation`, `address`, `google_map`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'the-zabeer-dhaka', '1', '(+88) 02224470771-73', NULL, '(+88) 01711 408 969', 'info@thezabeerdhaka.com', NULL, 'reservation@thezabeerdhaka.com', 'House-1, Road-2, Sector-1, Uttara Model Town, Dhaka-1230', '!1m18!1m12!1m3!1d3648.956907774987!2d90.4037768!3d23.855663900000007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c72f9daef9c5%3A0xe3bc6c9dcb0ba750!2sThe%20Zabeer%20Dhaka!5e0!3m2!1sen!2sbd!4v1670046986535!5m2!1sen!2sbd', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 'The Zabeer Dhaka', 1, 1, '0', NULL, '2022-12-13 02:35:03', '2022-12-13 02:35:03'),
(2, 2, 'the-zabeer-jashore', '2', '(+88) 01885 000 555', NULL, NULL, 'sm@zabeerhotel.com', NULL, NULL, '1256, M M Ali Road, Jashore', '!1m14!1m8!1m3!1d14672.513200846855!2d89.2109886!3d23.165517!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x67b464b45fab99ac!2sThe%20Zabeer%20Jashore!5e0!3m2!1sen!2sbd!4v1670742032127!5m2!1sen!2sbd', 'The Zabeer Jashore', 'The Zabeer Jashore', 'The Zabeer Jashore', 1, 1, '0', NULL, '2022-12-13 02:36:41', '2022-12-13 02:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `hb_webfacilities`
--

CREATE TABLE `hb_webfacilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_webfacilities` (`id`, `name`, `slug`, `hotel_id`, `description`, `image`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', 'breakfast', 1, 'Complementary Breakfast', 'breakfast-dhaka.png', '1', 'Complementary Breakfast', 'Complementary Breakfast', 'Complementary Breakfast', 1, 1, '0', '0', '2022-12-13 01:41:42', '2022-12-13 01:43:50'),
(2, 'Bottle of Water', 'bottle-of-water', 1, 'Complimentary Bottle of Water', 'bottle-of-water-dhaka.png', '2', 'Complimentary Bottle of Water', 'Complimentary Bottle of Water', 'Complimentary Bottle of Water', 1, 1, '0', '0', NULL, NULL),
(3, 'Free Wi-fi', 'free-wi-fi', 1, 'Free Wi-fi Access', 'free-wi-fi-dhaka.png', '3', 'Free Wi-fi Access', 'Free Wi-fi Access', 'Free Wi-fi Access', 1, 1, '0', '0', NULL, NULL),
(4, 'Laundry Service', 'laundry-service', 1, 'Express Laundry Service', 'laundry-service-dhaka.png', '4', 'Express Laundry Service', 'Express Laundry Service', 'Express Laundry Service', 1, 1, '0', '0', NULL, NULL),
(5, 'Access of Gym', 'access-of-gym', 1, 'Complimentary Access of Gym', 'access-of-gym-dhaka.png', '5', 'Complimentary Access of Gym', 'Complimentary Access of Gym', 'Complimentary Access of Gym', 1, 1, '0', '0', NULL, NULL),
(6, 'Free Parking', 'free-parking', 1, 'Free Parking', 'free-parking-dhaka.png', '6', 'Free Parking', 'Free Parking', 'Free Parking', 1, 1, '0', NULL, NULL, NULL),
(7, 'Airport Pick-up & Drop', 'airport-pick-up-drop', 1, 'Airport Pick-up & Drop', 'airport-pick-up-drop-dhaka.png', '7', 'Airport Pick-up & Drop', 'Airport Pick-up & Drop', 'Airport Pick-up & Drop', 1, 1, '0', NULL, NULL, NULL),
(8, 'Daily News Papers', 'daily-news-papers', 1, 'Daily News Papers', 'daily-news-papers-dhaka.png', '8', 'Daily News Papers', 'Daily News Papers', 'Daily News Papers', 1, 1, '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hb_webnavs`
--

CREATE TABLE `hb_webnavs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_webnavs` (`id`, `name`, `slug`, `hotel_id`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Home', '', 1, '1', 'Home', 'Home', 'Home', 1, 1, '0', '0', '2022-12-12 23:24:20', '2022-12-17 00:25:51'),
(2, 'Rooms', 'rooms', 1, '2', 'Rooms', 'Rooms', 'Rooms', 1, 1, '0', '0', '2022-12-13 03:43:09', '2022-12-14 05:02:28'),
(3, 'Restaurants', 'restaurants', 1, '3', 'Restaurants', 'Restaurants', 'Restaurants', 1, 1, '0', '0', '2022-12-14 01:07:41', '2022-12-20 00:25:02'),
(4, 'Halls', 'halls', 1, '4', 'Halls', 'Halls', 'Halls', 1, 1, '0', '0', '2022-12-14 05:03:01', '2022-12-14 05:04:11'),
(5, 'Wellness', 'wellnesses', 1, '5', 'Wellness', 'Wellness', 'Wellness', 1, 1, '0', '0', '2022-12-14 05:42:36', '2022-12-20 01:41:32'),
(6, 'About Us', 'about-us', 1, '6', 'About Us', 'About Us', 'About Us', 1, 1, '0', NULL, '2022-12-14 05:42:56', '2022-12-14 05:42:56'),
(7, 'Contact Us', 'contact-us', 1, '7', 'Contact Us', 'Contact Us', 'Contact Us', 1, 1, '0', NULL, '2022-12-14 05:43:18', '2022-12-14 05:43:18');

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
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_webpages` (`id`, `name`, `title`, `sub_title`, `short_description`, `long_description`, `slug`, `hotel_id`, `display_order`, `image`, `meta_title`, `meta_keyword`, `meta_decription`, `footer_item`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'A place that sparks creativity, fuels the imagination and welcomes reflection and relaxation.', 'The Zabeer Dhaka', 'We Offer 5-Star Banquet Spaces, Complete With Catering And Event Management Facilities. Discover The International Favorites Grilled To Perfection In The Live Kitchen. Experiment With Choicest Of Accompaniments And Sauces.The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 200 Delegates.', '<p style=\"text-align: justify; \"><font color=\"#212529\" face=\"Nunito Sans, sans-serif\"><span style=\"font-size: 16px;\">We Offer 5-Star Banquet Spaces, Complete With Catering And Event Management Facilities. Discover The International Favorites Grilled To Perfection In The Live Kitchen. Experiment With Choicest Of Accompaniments And Sauces.The Hotel Has 3 Dedicated Conference And Event Venues Has The Capacity For 200 Delegates. Each Equipped With The Very Latest Audio-Visual And Lighting Technology.The Ambience And Therapies At Our International Spa Offered By Experienced Professionals Ensure That You Are Rejuvenated.State Of The Art Gymnasium And With An Exercise Studio.Haircare And Beauty Treatments By Trained Stylists.The Elegant Att-Day Three Restaurant Provides A Stunning Atmosphere In Which To Sample Europian,Asian,Thai, Chinese Arabic And Our Own Local Cuisine.</span></font><br></p>', 'about-us', 1, '1', 'about-us-dhaka.jpg', 'About Us', 'About Us', 'About Us', 1, 1, 1, '0', '0', '2022-12-13 02:02:59', '2022-12-13 02:12:45'),
(2, 'Contact Us', 'Contact Us', 'Contact Us', 'Contact Us', '<p>Contact Us<br></p>', 'contact-us', 1, '2', NULL, 'Contact Us', 'Contact Us', 'Contact Us', 1, 1, 1, '0', '0', NULL, '2022-12-17 00:39:02'),
(3, 'Offers', 'Offers', 'Offers', 'Offers', '<p>Offers<br></p>', 'offers', 1, '3', NULL, 'Offers', 'Offers', 'Offers', 1, 1, 1, '0', '0', NULL, '2022-12-17 00:39:55'),
(4, 'News', 'News', 'News', 'News', '<p>News<br></p>', 'news', 1, '4', NULL, 'News', 'News', 'News', 1, 1, 1, '0', '0', NULL, '2022-12-17 00:40:53'),
(5, 'Rooms', 'Rooms', 'Rooms', 'Rooms', '<p>Rooms<br></p>', 'rooms', 1, '5', NULL, 'Rooms', 'Rooms', 'Rooms', 1, 1, 1, '0', '0', NULL, '2022-12-17 00:41:12'),
(6, 'Restaurants', 'Restaurants', 'Restaurants', 'Restaurants', '<p>Restaurants<br></p>', 'restaurants', 1, '6', NULL, 'Restaurants', 'Restaurants', 'Restaurants', 1, 1, 1, '0', '0', NULL, '2022-12-17 00:41:27'),
(7, 'Halls', 'Halls', 'Halls', 'Meeting & Events', '<p>Meeting &amp; Events<br></p>', 'halls', 1, '7', NULL, 'Halls', 'Halls', 'Halls', 1, 1, 1, '0', '0', NULL, '2022-12-17 00:42:22'),
(8, 'Wellness', 'Wellness', 'Wellness', 'Wellness', '<p>Wellness<br></p>', 'wellnesses', 1, '8', NULL, 'Wellness', 'Wellness', 'Wellness', 1, 1, 1, '0', '0', NULL, '2022-12-20 01:42:33'),
(9, 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', '<p>Certificates &amp; Awards<br></p>', 'certificates-awards', 1, '9', NULL, 'Certificates & Awards', 'Certificates & Awards', 'Certificates & Awards', 1, 1, 1, '0', '0', NULL, '2022-12-17 00:42:54'),
(10, 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', '<p>Booking Cancelation Policy<br></p>', 'booking-cancelation-policy', 1, '10', NULL, 'Booking Cancelation Policy', 'Booking Cancelation Policy', 'Booking Cancelation Policy', 1, 1, 1, '0', '0', NULL, '2022-12-17 00:43:20'),
(11, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', '<p>Privacy Policy<br></p>', 'privacy-policy', 1, '11', NULL, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', 1, 1, 1, '0', NULL, NULL, NULL),
(12, 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', '<p>Terms &amp; Conditions<br></p>', 'terms-conditions', 1, '12', NULL, 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions', 1, 1, 1, '0', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hb_websliders`
--

CREATE TABLE `hb_websliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_websliders` (`id`, `name`, `slug`, `hotel_id`, `desktop_image`, `mobile_image`, `content_1`, `content_2`, `content_3`, `content_4`, `content_5`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Slider 1', 'slider-1-dhaka', 1, 'desk-slider-1-dhaka.png', 'mobl-slider-1-dhaka.png', 'Welcome to', 'The Zabeer Dhaka', 'A place that sparks creativity, fuels the imagination andwelcomes reflection and relaxation.', NULL, NULL, '1', 'Slider 1', 'Slider 1', 'Slider 1', 1, 1, '0', NULL, '2022-12-13 00:43:28', '2022-12-13 00:43:28'),
(2, 'Slider 1', 'slider-1-jashore', 2, 'desk-slider-1-jashore.png', 'mobl-slider-1-jashore.png', 'Welcome to', 'The Zabeer Jashore', 'A place that sparks creativity, fuels the imagination andwelcomes reflection and relaxation.', NULL, NULL, '1', 'Slider 1', 'Slider 1', 'Slider 1', 1, 1, '0', NULL, '2022-12-13 00:44:44', '2022-12-13 00:44:44');

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
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_webtestimonials` (`id`, `name`, `designation`, `company`, `message`, `image`, `slug`, `hotel_id`, `display_order`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Matiur Rahman', 'Owner', 'Sarothi Enterprise', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text', 'mr-matiur-rahman-dhaka.jpg', '', 1, '1', 'Mr. Matiur Rahman', 'Mr. Matiur Rahman', 'Mr. Matiur Rahman', 1, 1, '0', NULL, '2022-12-13 01:07:27', '2022-12-13 01:07:27'),
(2, 'Mr. Matiur Rahman', 'Owner', 'Sarothi Enterprise', 'sdsadsd sadsadsad sadsad asdsad asdsad asdsad asdsa asdsad sadsad asdsadsad asdsad asdsad.', 'mr-matiur-rahman-jashore.jpg', '', 2, '1', 'Mr. Matiur Rahman', 'Mr. Matiur Rahman', 'Mr. Matiur Rahman', 1, 1, '0', NULL, '2022-12-13 01:08:34', '2022-12-13 01:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `hb_wellness`
--

CREATE TABLE `hb_wellness` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `hb_wellness` (`id`, `name`, `hotel_id`, `slug`, `short_description`, `long_description`, `logo_image`, `meta_title`, `meta_keyword`, `meta_decription`, `is_active`, `is_delete`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Spa', 1, 'spa-dhaka', 'Spa', '<p>Spa<br></p>', 'spa-dhaka.png', 'Spa', 'Spa', 'Spa', 1, 1, '0', NULL, '2022-12-14 05:35:12', '2022-12-14 05:35:12'),
(2, 'Gym', 1, 'gym-dhaka-dhaka', 'Gym', '<p>Gym<br></p>', NULL, 'Gym', 'Gym', 'Gym', 1, 1, '0', '0', '2022-12-14 05:35:51', '2022-12-20 02:05:19'),
(3, 'Saloon', 1, 'saloon-dhaka-dhaka', 'Saloon', '<p>Saloon<br></p>', NULL, 'Saloon', 'Saloon', 'Saloon', 1, 1, '0', '0', '2022-12-14 05:36:38', '2022-12-20 02:07:59'),
(4, 'Swimming Pool', 1, 'swimming-pool-dhaka-dhaka', 'Swimming Pool', '<p>Swimming Pool<br></p>', NULL, 'Swimming Pool', 'Swimming Pool', 'Swimming Pool', 1, 1, '0', '0', '2022-12-14 05:37:31', '2022-12-20 02:06:53');

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

--
-- Dumping data for table `hb_wellness_images`
--

INSERT INTO `hb_wellness_images` (`id`, `wellness_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 2, 'uploads/wellness/gym-dhaka-dhaka-1671523519-1.jpg', '2022-12-20 02:05:19', '2022-12-20 02:05:19'),
(2, 2, 'uploads/wellness/gym-dhaka-dhaka-1671523519-2.JPG', '2022-12-20 02:05:19', '2022-12-20 02:05:19'),
(3, 4, 'uploads/wellness/swimming-pool-dhaka-dhaka-1671523613-1.JPG', '2022-12-20 02:06:53', '2022-12-20 02:06:53'),
(4, 3, 'uploads/wellness/saloon-dhaka-dhaka-1671523679-1.jpg', '2022-12-20 02:07:59', '2022-12-20 02:07:59');

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
(14, '2022_11_30_080042_create_hb_webnav_table', 8),
(15, '2022_12_01_104059_create_hb_websubnav_table', 9),
(16, '2022_12_06_093656_create_hb_webslider_table', 10),
(17, '2022_12_06_094648_create_hb_webslider_table', 11),
(18, '2022_12_06_163855_create_hb_websliders_table', 12),
(19, '2022_12_06_171820_create_hb_websliders_table', 13),
(20, '2022_12_06_172630_create_hb_websliders_table', 14),
(21, '2022_12_07_073142_create_hb_webtestimonials_table', 15),
(22, '2022_12_07_115657_create_hb_webfacilities_table', 16),
(23, '2022_12_08_060320_create_hb_webpages_table', 17),
(24, '2022_12_11_072321_create_hb_webaddresses_table', 18),
(25, '2022_12_12_051525_create_hb_hotels_table', 19),
(26, '2022_12_12_104328_create_hb_rooms_table', 20),
(27, '2022_12_12_105015_create_hb_room_facilities_table', 20),
(28, '2022_12_12_105124_create_hb_roomtype_view_table', 20),
(29, '2022_12_12_105230_create_hb_room_images_table', 20),
(30, '2022_12_13_051525_create_hb_webnavs_table', 21),
(31, '2022_12_13_054447_create_hb_websliders_table', 22),
(32, '2022_12_13_065343_create_hb_webtestimonials_table', 23),
(33, '2022_12_13_071449_create_hb_webfacilities_table', 24),
(34, '2022_12_13_075253_create_hb_webpages_table', 25),
(35, '2022_12_13_082128_create_hb_webaddresses_table', 26),
(36, '2022_12_13_095218_create_hb_restaurents_table', 27),
(37, '2022_12_13_095623_create_hb_restaurent_images_table', 27),
(38, '2022_12_14_061116_create_hb_restaurents_table', 28),
(39, '2022_12_14_061317_create_hb_restaurent_images_table', 28),
(40, '2022_12_14_062937_create_hb_restaurents_table', 29),
(41, '2022_12_14_063009_create_hb_restaurent_images_table', 29),
(42, '2022_12_14_080240_create_hb_halls_table', 30),
(43, '2022_12_14_080410_create_hb_hall_images_table', 30),
(44, '2022_12_14_111120_create_hb_wellness_table', 31),
(45, '2022_12_14_111227_create_hb_wellness_images_table', 31),
(46, '2022_12_14_113257_create_hb_wellness_images_table', 32),
(47, '2022_12_15_072840_create_hb_settings_table', 33),
(48, '2022_12_15_093650_create_hb_settings_table', 34);

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
-- Indexes for table `hb_halls`
--
ALTER TABLE `hb_halls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_halls_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `hb_hall_images`
--
ALTER TABLE `hb_hall_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_hall_images_hall_id_foreign` (`hall_id`);

--
-- Indexes for table `hb_hotels`
--
ALTER TABLE `hb_hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_restaurents`
--
ALTER TABLE `hb_restaurents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_restaurents_hotel_id_foreign` (`hotel_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_rooms_hotel_id_foreign` (`hotel_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_settings_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `hb_webaddresses`
--
ALTER TABLE `hb_webaddresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_webaddresses_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `hb_webfacilities`
--
ALTER TABLE `hb_webfacilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_webfacilities_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `hb_webnavs`
--
ALTER TABLE `hb_webnavs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_webnavs_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `hb_webpages`
--
ALTER TABLE `hb_webpages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_webpages_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `hb_websliders`
--
ALTER TABLE `hb_websliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_websliders_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `hb_webtestimonials`
--
ALTER TABLE `hb_webtestimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_webtestimonials_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `hb_wellness`
--
ALTER TABLE `hb_wellness`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hb_wellness_hotel_id_foreign` (`hotel_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- AUTO_INCREMENT for table `hb_halls`
--
ALTER TABLE `hb_halls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hb_hall_images`
--
ALTER TABLE `hb_hall_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hb_hotels`
--
ALTER TABLE `hb_hotels`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hb_webaddresses`
--
ALTER TABLE `hb_webaddresses`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hb_webtestimonials`
--
ALTER TABLE `hb_webtestimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hb_wellness`
--
ALTER TABLE `hb_wellness`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hb_wellness_images`
--
ALTER TABLE `hb_wellness_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
-- Constraints for table `hb_halls`
--
ALTER TABLE `hb_halls`
  ADD CONSTRAINT `hb_halls_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_hall_images`
--
ALTER TABLE `hb_hall_images`
  ADD CONSTRAINT `hb_hall_images_hall_id_foreign` FOREIGN KEY (`hall_id`) REFERENCES `hb_halls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_restaurents`
--
ALTER TABLE `hb_restaurents`
  ADD CONSTRAINT `hb_restaurents_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_restaurent_images`
--
ALTER TABLE `hb_restaurent_images`
  ADD CONSTRAINT `hb_restaurent_images_restaurent_id_foreign` FOREIGN KEY (`restaurent_id`) REFERENCES `hb_restaurents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_rooms`
--
ALTER TABLE `hb_rooms`
  ADD CONSTRAINT `hb_rooms_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `hb_settings`
--
ALTER TABLE `hb_settings`
  ADD CONSTRAINT `hb_settings_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_webaddresses`
--
ALTER TABLE `hb_webaddresses`
  ADD CONSTRAINT `hb_webaddresses_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_webfacilities`
--
ALTER TABLE `hb_webfacilities`
  ADD CONSTRAINT `hb_webfacilities_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_webnavs`
--
ALTER TABLE `hb_webnavs`
  ADD CONSTRAINT `hb_webnavs_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_webpages`
--
ALTER TABLE `hb_webpages`
  ADD CONSTRAINT `hb_webpages_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_websliders`
--
ALTER TABLE `hb_websliders`
  ADD CONSTRAINT `hb_websliders_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_webtestimonials`
--
ALTER TABLE `hb_webtestimonials`
  ADD CONSTRAINT `hb_webtestimonials_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_wellness`
--
ALTER TABLE `hb_wellness`
  ADD CONSTRAINT `hb_wellness_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hb_hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hb_wellness_images`
--
ALTER TABLE `hb_wellness_images`
  ADD CONSTRAINT `hb_wellness_images_wellness_id_foreign` FOREIGN KEY (`wellness_id`) REFERENCES `hb_wellness` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
