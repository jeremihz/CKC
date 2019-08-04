-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 04, 2019 at 04:21 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ckc_fina`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `t_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_id` int(11) NOT NULL,
  `author_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `massage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `uuid`, `title`, `cover`, `created_at`, `updated_at`) VALUES
(1, '08afca90-acc6-11e9-88d6-dd4ce95576b5', 'church', 'database.docx', '2019-07-22 18:16:56', '2019-07-22 18:16:56'),
(2, 'a5352320-acc6-11e9-8687-8b730752305f', 'document', 'NETWORKING 2.docx', '2019-07-22 18:21:18', '2019-07-22 18:21:18'),
(3, 'afb11f80-ad09-11e9-b02a-2165bff1b88a', 'fff', 'ETHICS.docx', '2019-07-23 02:21:13', '2019-07-23 02:21:13'),
(4, 'c8ed7460-af18-11e9-89dc-4b7e851ee582', 'hh', 'assignment.docx', '2019-07-25 17:14:20', '2019-07-25 17:14:20'),
(5, 'b56581a0-b045-11e9-9b6a-87fa7692fc2b', 'transonline', 'computer design and organization.docx', '2019-07-27 05:08:25', '2019-07-27 05:08:25'),
(6, '81faeaa0-b2a8-11e9-b756-dff58ffb81f2', 'mike', 'fdd9b7a9ede5ed224e7eb4498dd4394a.jpg', '2019-07-30 06:00:42', '2019-07-30 06:00:42');

-- --------------------------------------------------------

--
-- Table structure for table `calendars`
--

CREATE TABLE `calendars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_song` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calendars`
--

INSERT INTO `calendars` (`id`, `event_name`, `theme`, `theme_song`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Tesla', 'Elon Musk', 'Muuuuuuuuuuuuuuuuuusk', '2019-08-04', '2019-08-08', 0, '2019-08-03 06:20:23', '2019-08-04 09:03:58'),
(7, 'CAMP 2019', 'CVGHJ', 'FGTDYUIO', '2019-08-14', '2019-08-23', 0, '2019-08-04 09:03:52', '2019-08-04 09:35:40'),
(8, 'CAMP 2020', 'rdtyuhio', 'drtyuio', '2019-08-14', '2019-08-24', 0, '2019-08-04 09:36:15', '2019-08-04 09:37:53'),
(9, 'CAMP 2021', 'edrtfgyhu', 'drftgyhu', '2019-08-15', '2019-08-20', 0, '2019-08-04 09:38:21', '2019-08-04 09:42:15'),
(10, 'CAMP 2022', 'ftyguhiok', 'rftgyhujiok', '2019-08-15', '2019-08-15', 1, '2019-08-04 09:42:39', '2019-08-04 09:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `camping`
--

CREATE TABLE `camping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `week` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `church_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `camping`
--

INSERT INTO `camping` (`id`, `week`, `user_id`, `church_id`, `name`, `phone`, `event_id`, `active`, `created_at`, `updated_at`) VALUES
(65, 4, 37, 30, 'Mathilda Rose', '3565338458', 7, 0, '2019-08-04 09:29:34', '2019-08-04 09:35:12'),
(66, 4, 44, 30, 'Douglas Robinson', '5287229425', 7, 0, '2019-08-04 09:29:34', '2019-08-04 09:35:12'),
(67, 6, 71, 35, 'Moris', '078037262', 8, 0, '2019-08-04 09:36:50', '2019-08-04 09:37:37'),
(68, 6, 36, 35, 'Leah Cole', '3713341470', 8, 0, '2019-08-04 09:36:50', '2019-08-04 09:37:37'),
(69, 7, 38, 39, 'Benjamin Scott', '3638113718', 9, 0, '2019-08-04 09:38:50', '2019-08-04 09:41:56'),
(70, 7, 7, 39, 'mesweet', '0715511302', 9, 0, '2019-08-04 09:38:50', '2019-08-04 09:41:56'),
(71, 8, 65, 41, 'Alice Hogan', '5635828622', 10, 0, '2019-08-04 09:43:25', '2019-08-04 09:47:23'),
(72, 8, 36, 41, 'Leah Cole', '3713341470', 10, 0, '2019-08-04 09:43:25', '2019-08-04 09:47:23'),
(73, 8, 10, 41, 'mac morgan', '0715511302', 10, 0, '2019-08-04 09:43:25', '2019-08-04 09:47:23'),
(74, 8, 50, 41, 'Brent Massey', '9293108771', 10, 0, '2019-08-04 09:43:25', '2019-08-04 09:47:24'),
(75, 8, 55, 41, 'Clifford Tucker', '4686855232', 10, 0, '2019-08-04 09:43:26', '2019-08-04 09:47:24'),
(76, 8, 58, 44, 'Nancy Griffin', '3496709563', 10, 0, '2019-08-04 09:47:40', '2019-08-04 09:50:34'),
(77, 8, 6, 44, 'sweet', '0715511302', 10, 0, '2019-08-04 09:47:41', '2019-08-04 09:50:34'),
(78, 1, 54, 44, 'Nathan Mills', '8275018760', 10, 1, '2019-08-04 09:50:55', '2019-08-04 09:50:55'),
(79, 1, 38, 44, 'Benjamin Scott', '3638113718', 10, 1, '2019-08-04 09:50:55', '2019-08-04 09:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `campweeks`
--

CREATE TABLE `campweeks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `week_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campweeks`
--

INSERT INTO `campweeks` (`id`, `event_id`, `week`, `week_name`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'Week 1', '2019-08-09', '2019-08-14', '2019-08-03 09:16:33', '2019-08-03 09:16:33'),
(2, 6, 2, 'Week 2', '2019-08-09', '2019-08-15', '2019-08-03 09:46:20', '2019-08-03 09:46:20'),
(3, 6, 3, 'Week 3', '2019-08-13', '2019-08-24', '2019-08-03 11:28:52', '2019-08-03 11:28:52'),
(4, 7, 1, 'Week 1', '2019-08-05', '2019-08-09', '2019-08-04 09:04:19', '2019-08-04 09:04:19'),
(5, 7, 2, 'Week 2', '2019-08-20', '2019-08-24', '2019-08-04 09:04:38', '2019-08-04 09:04:38'),
(6, 8, 1, 'Week 1', '2019-08-13', '2019-08-24', '2019-08-04 09:36:35', '2019-08-04 09:36:35'),
(7, 9, 1, 'Week 1', '2019-08-08', '2019-08-23', '2019-08-04 09:38:36', '2019-08-04 09:38:36'),
(8, 10, 1, 'Week 1', '2019-08-15', '2019-08-31', '2019-08-04 09:42:57', '2019-08-04 09:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `church_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `from_start` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_destination` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `journey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `claims`
--

INSERT INTO `claims` (`id`, `title`, `user_id`, `event_id`, `church_id`, `amount`, `from_start`, `to_destination`, `journey`, `active`, `created_at`, `updated_at`) VALUES
(4, 'Meal', 24, 6, 44, '300.00', NULL, NULL, NULL, 0, '2019-08-04 04:28:48', '2019-08-04 08:10:54'),
(5, 'Transport', 24, 6, 44, '5000.00', 'Nairobi', 'Kisumu', 'Arrival', 0, '2019-08-04 04:38:13', '2019-08-04 08:10:54'),
(6, 'Transport', 24, 6, 44, '5000.00', 'Nairobi', 'Nakuru', 'Arrival', 0, '2019-08-04 04:54:26', '2019-08-04 08:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `communication`
--

CREATE TABLE `communication` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communication`
--

INSERT INTO `communication` (`id`, `title`, `status`, `message`, `created_at`, `updated_at`) VALUES
(2, 'KEJA DIGITAL', 'Draft', 'Only the following column types can be \"changed\": bigInteger, binary, boolean, date, dateTime, dateTimeTz, decimal, integer, json, longText, mediumText, smallInteger, string, text, time, unsignedBigInteger, unsignedInteger and unsignedSmallInteger.', '2019-07-26 17:45:19', '2019-07-26 17:45:19'),
(3, 'Transport', 'Complete', 'sedrftgyhujikol', '2019-08-01 11:36:40', '2019-08-01 11:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `contribution`
--

CREATE TABLE `contribution` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `church_id` int(11) NOT NULL,
  `amount` int(20) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contribution`
--

INSERT INTO `contribution` (`id`, `church_id`, `amount`, `type`, `active`, `user_id`, `created_at`, `updated_at`) VALUES
(30, 30, 2000, 'Contribution', 0, NULL, '2019-08-01 04:12:39', '2019-08-04 08:01:26'),
(29, 30, 1700, 'Contribution', 0, NULL, '2019-08-01 03:44:35', '2019-08-04 08:01:26'),
(28, 30, 1700, 'Contribution', 0, NULL, '2019-08-01 03:44:20', '2019-08-04 08:01:26'),
(27, 30, 23000, 'Target', 0, NULL, '2019-08-01 03:44:06', '2019-08-04 08:01:26'),
(31, 30, 18000, 'Contribution', 0, NULL, '2019-08-01 04:13:30', '2019-08-04 08:01:26'),
(32, 32, 23000, 'Target', 0, NULL, '2019-08-01 04:14:13', '2019-08-04 08:01:26'),
(33, 32, 20000, 'Contribution', 0, NULL, '2019-08-01 04:14:50', '2019-08-04 08:01:26'),
(34, 37, 50000, 'Target', 0, NULL, '2019-08-01 06:48:24', '2019-08-04 08:01:26'),
(46, 53, 6000, 'Contribution', 0, NULL, '2019-08-03 15:47:18', '2019-08-03 15:47:18'),
(45, 52, 5000, 'Contribution', 0, NULL, '2019-08-03 15:33:12', '2019-08-04 08:01:26'),
(44, 53, 80000, 'Target', 0, NULL, '2019-08-03 15:01:43', '2019-08-03 15:01:43'),
(38, 37, 1700, 'Contribution', 0, NULL, '2019-08-01 09:56:28', '2019-08-04 08:01:26'),
(39, 37, 2222, 'Contribution', 0, NULL, '2019-08-01 09:58:35', '2019-08-04 08:01:26'),
(40, 37, 650, 'Contribution', 0, NULL, '2019-08-01 13:12:35', '2019-08-04 08:01:26'),
(43, 52, 60000, 'Target', 0, NULL, '2019-08-03 15:01:24', '2019-08-04 08:01:26'),
(42, 37, 6000, 'Contribution', 0, NULL, '2019-08-01 13:17:47', '2019-08-04 08:01:26'),
(47, 53, 650, 'Contribution', 0, 68, '2019-08-03 16:08:51', '2019-08-04 08:01:26'),
(48, 53, 3000, 'Contribution', 0, 68, '2019-08-03 16:30:54', '2019-08-04 08:01:26'),
(49, 52, 5600, 'Contribution', 0, 68, '2019-08-03 17:04:04', '2019-08-04 08:01:26'),
(50, 31, 6000, 'Target', 0, NULL, '2019-08-04 07:15:52', '2019-08-04 08:01:26'),
(51, 32, 80000, 'Target', 0, NULL, '2019-08-04 07:18:12', '2019-08-04 08:01:26'),
(52, 54, 100000, 'Target', 1, NULL, '2019-08-04 08:59:06', '2019-08-04 08:59:06'),
(53, 54, 8000, 'Contribution', 1, 70, '2019-08-04 08:59:31', '2019-08-04 08:59:31'),
(54, 37, 6000, 'Contribution', 1, 30, '2019-08-04 11:15:42', '2019-08-04 11:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_start_date` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_start_time` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_end_date` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_end_time` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_description` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `created_at`, `updated_at`, `event_title`, `event_start_date`, `event_start_time`, `event_end_date`, `event_end_time`, `event_description`) VALUES
(1, '2019-07-24 09:32:02', '2019-07-24 09:32:02', 'keja', '2019-07-24', '12:00 AM', '2019-07-25', '11:59 PM', 'gufuvhjbkh'),
(2, '2019-07-24 10:46:44', '2019-07-24 10:46:44', 'ggggggggg', '2019-07-02', '4:46 PM', '2019-07-04', '4:46 PM', 'jvvjhvhv'),
(3, '2019-07-26 06:39:30', '2019-07-26 06:39:30', 'note', '2019-07-03', '12:00 AM', '2019-07-04', '11:59 PM', 'kjnjnk');

-- --------------------------------------------------------

--
-- Table structure for table `file_entries`
--

CREATE TABLE `file_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_uploads`
--

INSERT INTO `file_uploads` (`id`, `image_name`, `created_at`, `updated_at`) VALUES
(16, '1564566502.jpeg', '2019-07-31 06:48:23', '2019-07-31 06:48:23'),
(15, '1564565687.jpeg', '2019-07-31 06:34:49', '2019-07-31 06:34:49'),
(14, '1564565051.jpeg', '2019-07-31 06:24:12', '2019-07-31 06:24:12'),
(13, '1564564100.jpeg', '2019-07-31 06:08:22', '2019-07-31 06:08:22');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `church_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_members` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_members` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dropped_members` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `church_id`, `total_members`, `new_members`, `dropped_members`, `created_at`, `updated_at`) VALUES
(1, '26', '1345', '23', '12', '2019-07-24 09:50:37', '2019-07-24 09:50:37'),
(2, '26', '12424', '2433', '234', '2019-07-24 11:10:42', '2019-07-24 11:10:42');

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
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(8, '2019_07_21_091950_create_ministries_table', 3),
(9, '2019_07_24_111159_create_members_table', 4),
(10, '2019_07_26_201948_create_claims_table', 5),
(11, '2019_07_26_204149_create_communication_table', 6),
(12, '2019_07_29_025732_create_tasks_table', 7),
(13, '2019_07_29_153126_create_file_uploads_table', 8),
(14, '2017_11_04_212439_create_attachments_table', 9),
(15, '2017_11_21_090012_create_attachment_categories_table', 9),
(16, '2018_05_27_233402_create_file_entries_table', 10),
(17, '2018_10_20_233544_create_file_uploads_table', 11),
(18, '2018_03_04_005624_create_images_table', 12),
(19, '2019_08_02_193824_create_camping_table', 13),
(20, '2019_08_03_114157_create_campweeks_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `ministries`
--

CREATE TABLE `ministries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pastor` int(191) DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `week` int(11) NOT NULL DEFAULT '0',
  `contribution` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ministries`
--

INSERT INTO `ministries` (`id`, `name`, `location`, `pastor`, `phone`, `week`, `contribution`, `created_at`, `updated_at`) VALUES
(30, 'jeremiah', 'kenya', 9, NULL, 0, 0, '2019-07-28 10:52:05', '2019-08-04 09:35:12'),
(31, 'jeremih', 'kenya', 8, NULL, 0, 0, '2019-07-28 10:57:14', '2019-08-04 09:23:31'),
(32, 'sda nakuru', 'nakuru', 8, NULL, 0, 0, '2019-07-29 10:56:07', '2019-08-04 08:06:49'),
(33, 'nairobi pariish', 'eldoret', 20, NULL, 0, 0, '2019-07-29 10:56:28', '2019-08-03 17:12:48'),
(34, 'nestle', 'eldoret', 9, NULL, 0, 0, '2019-07-29 10:56:44', '2019-08-03 17:12:48'),
(35, 'kisimu miky', 'kisumu', 27, NULL, 0, 0, '2019-07-29 15:51:46', '2019-08-04 09:37:37'),
(36, 'shem shem', 'eldoret', 28, NULL, 0, 0, '2019-07-29 15:52:16', '2019-08-04 08:10:54'),
(37, 'Chelsea', 'eldoret', 30, NULL, 0, 0, '2019-08-01 06:47:10', '2019-08-04 09:23:31'),
(38, 'Micheal Santos', 'Wiokuki', 9, NULL, 0, 0, '2019-08-03 12:53:49', '2019-08-04 08:10:55'),
(39, 'Rodney Marshall', 'Kutegne', 21, NULL, 0, 0, '2019-08-03 12:53:54', '2019-08-04 09:41:56'),
(40, 'Clifford Bowman', 'Vagsezkil', 12, NULL, 0, 0, '2019-08-03 12:54:01', '2019-08-04 09:29:18'),
(41, 'Alfred Weaver', 'Ditasu', 23, NULL, 0, 0, '2019-08-03 12:54:06', '2019-08-04 09:47:22'),
(42, 'Isabelle Mitchell', 'Zanbeivu', 28, NULL, 0, 0, '2019-08-03 12:54:36', '2019-08-03 17:12:49'),
(43, 'Ollie Matthews', 'Bighepdo', 22, NULL, 0, 0, '2019-08-03 12:54:47', '2019-08-04 08:10:55'),
(44, 'Hattie Bush', 'Nativcu', 17, NULL, 1, 0, '2019-08-03 12:54:57', '2019-08-04 09:50:54'),
(45, 'Benjamin Willis', 'Sekepub', 19, NULL, 0, 0, '2019-08-03 12:55:02', '2019-08-04 08:10:55'),
(46, 'Roxie Mann', 'Atpoeco', 9, NULL, 0, 0, '2019-08-03 12:55:51', '2019-08-03 17:12:49'),
(47, 'Lawrence Richards', 'Bujjufgi', 19, NULL, 0, 0, '2019-08-03 12:56:00', '2019-08-03 12:56:00'),
(48, 'Katherine Saunders', 'Negluses', 27, NULL, 0, 0, '2019-08-03 12:56:04', '2019-08-03 17:12:49'),
(49, 'Warren Black', 'Edawle', 22, NULL, 0, 0, '2019-08-03 12:56:14', '2019-08-03 12:56:14'),
(50, 'Roy Chandler', 'Kudedgob', 27, NULL, 0, 0, '2019-08-03 12:57:09', '2019-08-03 17:12:49'),
(51, 'Jeffrey Maxwell', 'Ivjiha', 26, NULL, 0, 0, '2019-08-03 12:57:21', '2019-08-03 17:12:49'),
(52, 'NELLY', 'Eldoret', 68, NULL, 0, 0, '2019-08-03 15:00:24', '2019-08-03 15:00:24'),
(53, 'CHELSY', 'Eldoret', 68, NULL, 0, 0, '2019-08-03 15:00:39', '2019-08-03 15:00:39'),
(54, 'Chinese', 'Eldoret', 70, NULL, 0, 1, '2019-08-04 08:55:52', '2019-08-04 08:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'tipgxaEPa7QxCqIhSX15kUtmgeBNHBLyUSuoIXKB', 'http://localhost', 1, 0, 0, '2019-07-19 05:49:30', '2019-07-19 05:49:30'),
(2, NULL, 'Laravel Password Grant Client', 'B2ZzvEdeoraJHqS57FPvrT5hcyOgqnZOE8DZwXkB', 'http://localhost', 0, 1, 0, '2019-07-19 05:49:31', '2019-07-19 05:49:31'),
(3, NULL, 'Laravel Personal Access Client', '9OeYACLwhsJcvM4mLs4QDcKVATeTeO3IXULnlNqW', 'http://localhost', 1, 0, 0, '2019-08-01 10:55:13', '2019-08-01 10:55:13'),
(4, NULL, 'Laravel Password Grant Client', '0BvmZ9R7BRtWuq90FGCr0Pf3Z6Nusd9Mc7KkrxOX', 'http://localhost', 0, 1, 0, '2019-08-01 10:55:13', '2019-08-01 10:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-19 05:49:30', '2019-07-19 05:49:30'),
(2, 3, '2019-08-01 10:55:13', '2019-08-01 10:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pastor',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'profile.png',
  `week` int(11) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `type`, `bio`, `photo`, `week`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'SHEM nduati', 'nduatishem@gmail.com', '0715511302', 'admin', 'IT consultant', '1563779713.png', 0, NULL, '$2y$10$Mpyy3fOCS1S4Eh0YmkwnZOmzFqkZGthj9.3Yz7dA6c9UKjRedUX42', 'EiU4i1qqvpf5zfcZ7Rei3DDa4GQHVLbKCF0VHqGz1YwgZKLaITBH4B3jWP1g', '2019-07-17 09:07:18', '2019-07-22 04:15:13'),
(5, 'admin', 'admin@admin.com', NULL, 'admin', 'Administrator', '1563686963.png', 0, NULL, '$2y$10$rGUxv1dYo8UQWMgfz0AKde6I2foQu4eAH5CCMHq2eG3hQiIWDC5Uq', NULL, '2019-07-17 13:43:04', '2019-07-21 02:29:26'),
(6, 'sweet', 'sweet@gmail.com', '0715511302', 'guest', 'Nairobi pastor', '', 0, NULL, '$2y$10$lDk/oXCDRcO28jRtM6lBTOig4dkuM8BPTy2id4q.nrjlQ47RCSSGG', NULL, '2019-07-17 15:14:59', '2019-08-04 09:50:34'),
(7, 'mesweet', 'mesweet@gmail.com', '0715511302', 'guest', 'sweet', '', 0, NULL, '$2y$10$8fWFb4OtNbkjSVL5wm0S4eAsPi.zbHvou6r09JGY/Bex9O6VVWmfy', NULL, '2019-07-17 15:17:42', '2019-08-04 09:41:56'),
(8, 'sweet22', 'sweet2@gmail.com', NULL, 'pastor', 'sweet', '', 0, NULL, '$2y$10$YzshW5G5MfYgtoLQIpma9OWgsLqTTm0TCS6uMA6VxK96P0RQh6hTu', NULL, '2019-07-17 15:19:35', '2019-07-20 05:32:30'),
(9, 'hope', 'hope@gmail.com', NULL, 'pastor', 'lecturer', '', 0, NULL, '$2y$10$vFa//XwITAYrv9iYE8gwcuIOby1LQLLZ8EOOt9EZerG1yhiOMDUDS', NULL, '2019-07-17 15:26:01', '2019-07-17 15:26:01'),
(10, 'mac morgan', 'macnduatishem@gmail.com', '0715511302', 'guest', 'lecturer barton', '', 0, NULL, '$2y$10$jRMi6MIzWCCiPjL52FXG7.MNG5.LxSC84Op9J40dWTtMLSmddClLC', NULL, '2019-07-17 15:36:51', '2019-08-04 09:47:23'),
(11, 'townhouse', 'town@gmail.com', '0715511302', 'guest', 'biology', '', 0, NULL, '$2y$10$WgC2Kxi6U4EFpNa7cYUIbO7oavEUpUWK7e2aDAGnZG96jxpTEK1zi', NULL, '2019-07-17 16:43:56', '2019-08-04 09:23:31'),
(12, 'matin mut', 'matin@gmail.com', '0720547364', 'pastor', 'mato', '', 0, NULL, '$2y$10$RcJZs0QdQVvcDz6VwwT5N.eO6bbcwbgfCf1WMHWiJD1h8VagiwwAW', NULL, '2019-07-17 16:48:49', '2019-07-23 05:35:21'),
(16, 'Muut', 'mut@gmail.com', '0722334454', 'pastor', 'Mac', '1563777789.png', 0, NULL, '$2y$10$DoEPNJ.rIQ6OO5YV4vtcJ.SMFAm83vVLwOe6ZDqr7agHUwNpL5GN.', NULL, '2019-07-18 10:32:59', '2019-07-22 03:43:09'),
(17, 'macmilan', 'macmilan@gmail.com', '0717021671', 'pastor', 'SDA pastor Central conference', '1563778383.png', 0, NULL, '$2y$10$up7p3//L.j84ofHU4eVCweDXW/B3l6tfb8.kLLamAtnOoSPjEZkXi', NULL, '2019-07-18 10:34:43', '2019-07-22 07:36:20'),
(18, 'wathera', 'waithera@gmail.com', '0712345678', 'guest', 'Uganda', '1563777532.jpeg', 0, NULL, '$2y$10$Mkg4EmdyH5UN2fh1a2dHee6IA/o833HxHUvqA1uILpgraDPK0gd1C', NULL, '2019-07-20 10:57:35', '2019-08-04 08:10:56'),
(19, 'PR. ONGAKI', 'ongaki@gmail.com', '0722592432', 'pastor', 'Green valley pastor', '1563960821.png', 0, NULL, '$2y$10$5hXjMk7v3R2q8bggTWYs3uy8tnk8UD0A7BcMu8VjU0PsulrunP89y', NULL, '2019-07-23 10:58:43', '2019-07-24 06:33:42'),
(20, 'PR. MUNUVE J', 'munuve@gmail.com', '0721439712', 'pastor', 'Baraka pastor', '', 0, NULL, '$2y$10$jgh4/zy3nxbHsE/FYJ.gue9A/6mVFJzTYOwkwDxu4Z75WiOaCiMzW', NULL, '2019-07-23 11:04:35', '2019-07-23 11:07:41'),
(21, 'PR. GITHINJI WILLSON', 'githinji@gmail.com', '0721483704', 'pastor', 'Mt.view pastor', '', 0, NULL, '$2y$10$oBlq/o3TZRyjjsvvyW8MPObprEXW.EjWakK/rF6Uf7rzSeDTb64Qq', NULL, '2019-07-23 11:10:00', '2019-07-23 11:10:00'),
(22, 'PR. KARIUKI MOSES', 'kariuki@gmail.com', '0705559564', 'pastor', 'Githunguri Main pastor', '', 0, NULL, '$2y$10$HDmG4WIeaVrmrwTvOj4.q.DXQ5DmcaumCka34HGprP/tF6ion.VjK', NULL, '2019-07-23 11:11:53', '2019-07-23 11:11:53'),
(23, 'PR. ORANGI', 'orangi@gmail.com', '0726999918', 'pastor', 'Langata pastor', 'profile.png', 0, NULL, '$2y$10$NLKNXkhovKmiGajx5HroWOwWVTaDuBCz7yOzlKwpvpz1lSvRgCcqW', NULL, '2019-07-23 11:17:05', '2019-07-23 11:17:05'),
(24, 'DERRICK OCHIENG', 'ochiengderrick424@gmail.com', '0715810055', 'pastor', 'I am awesome', '1564126304.jpeg', 1, NULL, '$2y$10$IygOc2qsS.SUuUCj0KwTauOQCy7SLneNw3m06oHzhhAIMoWXxWdIO', NULL, '2019-07-26 04:28:01', '2019-08-04 04:09:33'),
(25, 'jeremih', 'mihjere68@gmail.com', NULL, 'admin', NULL, 'profile.png', 0, NULL, '$2y$10$5b0/GEs/JDB4kyFU9Q8fw.6gn.UJyriXAZenbcgpMDQoPRVvOJdj6', NULL, '2019-07-27 04:47:23', '2019-07-27 04:47:23'),
(26, 'mike odhiambo', 'mike@gmail.com', NULL, 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$21jgbhsc872T0z3bnz6upuBBBvOYyHkR9KXbLqHc3h4DY6NI41L3C', NULL, '2019-07-29 00:59:32', '2019-07-29 00:59:32'),
(27, 'miky', 'miky@gmail.com', NULL, 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$obEg5Mx3QO.XW2bJH6gc5eUU/MdbUom7hiq99nZ7TQfSrzt1U2r7y', NULL, '2019-07-29 15:44:59', '2019-07-29 15:44:59'),
(28, 'shem', 'shem2@gmail.com', NULL, 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$mw0V00w8vlmp9fpZ7emAaun4fM1gDfbDrNw3E/EkHtCQi5XmGGVXK', NULL, '2019-07-29 15:48:24', '2019-07-29 15:48:24'),
(29, 'shem', 'shem@gmail.com', NULL, 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$kafo69VMl1W7yjcrZtPsS.srHwjUrvqQ2loQ/Ij8q7E0LOULUwbJK', NULL, '2019-08-01 05:24:13', '2019-08-01 05:24:13'),
(30, 'DeKa', 'deka@gmail.com', '0715810055', 'admin', 'I am awesome', 'profile.png', 0, NULL, '$2y$10$zrOhOumrSJLA7.JFp3S4Ae6ooYDqPblqsLbnuEO3Cte5WLYxRGLAi', NULL, '2019-08-01 06:46:32', '2019-08-01 06:46:32'),
(31, 'Lura Newton', 'nagpi@host.local', '8474008702', 'guest', 'wejalobaskej', NULL, 0, NULL, '$2y$10$lQHny/2ivZDPImWgyQtqEOs4BdVeo1q6NOpDyFM3madUJVksN1jCu', NULL, '2019-08-03 12:48:06', '2019-08-04 09:23:31'),
(32, 'Lilly Banks', 'mu@host.local', '3318791546', 'guest', 'nilfefnindub', NULL, 0, NULL, '$2y$10$nH.M4oysY0r1LU1ipsQkY.UQMj7xmi.lMOln6EVSBj0vNCuSYjHAm', NULL, '2019-08-03 12:48:15', '2019-08-04 08:10:56'),
(33, 'Alejandro Curry', 'ube@example.com', '5417528223', 'guest', 'ovegahivmeoh', NULL, 0, NULL, '$2y$10$bCY2fsfNU8DJ5MUDVIEF9uchz4xvx.r2AgXOomhwbJo.DNNcY8lVq', NULL, '2019-08-03 12:48:26', '2019-08-04 09:23:31'),
(34, 'Jeanette Barnett', 'da@host.test', '9675556963', 'guest', 'hijamipovuml', NULL, 0, NULL, '$2y$10$uro3d84PCTG1eCvdmgzHkug6gZM2iDWE0YCJLciBlY7VMuHsXfLT.', NULL, '2019-08-03 12:48:41', '2019-08-04 08:10:56'),
(35, 'Nelle Phelps', 'ubguc@host.local', '5699006082', 'guest', 'codildafawit', NULL, 0, NULL, '$2y$10$gfp7KYbcvWPHe9S8e8n5C.97Gg2wZkkFj2dvzUGImFgiJzy/Y7uES', NULL, '2019-08-03 12:48:56', '2019-08-04 08:10:56'),
(36, 'Leah Cole', 'isa@example.com', '3713341470', 'guest', 'vamawkuvawpi', NULL, 0, NULL, '$2y$10$5DaXKV/kB39JKv5KPmSW.OrdBJiJCTfr8XPvHrlyDLulyiP/kAfo6', NULL, '2019-08-03 12:49:03', '2019-08-04 09:47:23'),
(37, 'Mathilda Rose', 'iku@host.local', '3565338458', 'guest', 'zolpeciapecu', NULL, 0, NULL, '$2y$10$pc60.vRhLCOXudxcYNAAteCRdFP4PmCtEVb/IK3NliW/6Mkuijy2G', NULL, '2019-08-03 12:49:10', '2019-08-04 09:35:12'),
(38, 'Benjamin Scott', 'jefmu@host.local', '3638113718', 'guest', 'emodiijihila', NULL, 1, NULL, '$2y$10$pbBXI7ZW8Q44u3XTojdZM.V7hdwVjMaCS31ZXf.XLc0T1jUDsfGIm', NULL, '2019-08-03 12:49:19', '2019-08-04 09:50:55'),
(39, 'Christina Hopkins', 'jag@host.test', '3299268274', 'guest', 'tuwsogaomufa', NULL, 0, NULL, '$2y$10$tBjGocuFXNQnCrTg8x1GKeFkKZoggOBXc3HIVotl.XhK3h7XKNRxW', NULL, '2019-08-03 12:49:27', '2019-08-04 08:10:56'),
(40, 'Mathilda Romero', 'ju@host.invalid', '3845673062', 'guest', 'bisimnokupzo', NULL, 0, NULL, '$2y$10$75/6EZxGZ3uQZ3ovlShQkuTMILdwMuXcw1GyN4PPN/mSr90k2b2XW', NULL, '2019-08-03 12:49:35', '2019-08-04 08:10:56'),
(41, 'Mario Scott', 'dihemup@host.invalid', '5393276332', 'guest', 'dakvosnedose', NULL, 0, NULL, '$2y$10$noHo0R9XYQboP0C.DwqEXu.wV3IMFyljawEMpm46BuC/18yip.Roe', NULL, '2019-08-03 12:49:41', '2019-08-04 08:10:56'),
(42, 'Carlos Gomez', 'vuf@host.local', '7449571423', 'guest', 'licekdiakacu', NULL, 0, NULL, '$2y$10$OIK9RZ56t0ydEzKvRozSoOYbljOZNHUU5PK.c3WJqd9vr7TjkJsIS', NULL, '2019-08-03 12:58:00', '2019-08-04 08:10:56'),
(43, 'Ray Morgan', 'jugvob@host.invalid', '3162484594', 'guest', 'vaadinimcelc', NULL, 0, NULL, '$2y$10$1PCLn3khtCk9nNQrhAMA5OciKZwSOTD3sD70K9qlbGvqMXfhWVhQq', NULL, '2019-08-03 12:58:15', '2019-08-03 17:12:52'),
(44, 'Douglas Robinson', 'oda@host.test', '5287229425', 'guest', 'rasoztewkaub', NULL, 0, NULL, '$2y$10$50KuK.BIVZz4KkY8ieGnGO21JKhKZcZdjmL4f1UCUtXWOvxyQaLi.', NULL, '2019-08-03 12:58:28', '2019-08-04 09:35:12'),
(45, 'Myrtie Rodgers', 'zep@example.com', '9196227093', 'guest', 'femugahobobc', NULL, 0, NULL, '$2y$10$88sCzMS.IwCT7I4u0gmuMO93ESWUw4e9jTRoQKHuaEwERJPLdjrNe', NULL, '2019-08-03 12:58:35', '2019-08-04 08:10:57'),
(46, 'Douglas Holmes', 'fidzi@host.local', '4839973957', 'guest', 'zevkolcivgom', NULL, 0, NULL, '$2y$10$IVWQBzKAtuVlmZI4suzW7ePxNLRdCKzUKGz9uN//hM.DveICp76ea', NULL, '2019-08-03 13:00:43', '2019-08-04 09:23:31'),
(47, 'Duane Perez', 'iro@example.com', '5159402659', 'guest', 'wacuupemofdo', NULL, 0, NULL, '$2y$10$qtvNPNopApESdMP9RMxeze25SLcw.BI.iWFf.cD.prTHq/B6I.64K', NULL, '2019-08-03 13:00:53', '2019-08-04 09:05:23'),
(48, 'Don Jackson', 'latel@host.invalid', '7612108827', 'guest', 'edijomunuzgi', NULL, 0, NULL, '$2y$10$vDCoRuFmqbsA9Xx6rnlcYeVc3U0MK0biCcaT2n5LNNDwKgBGCNZmO', NULL, '2019-08-03 13:01:05', '2019-08-04 08:10:57'),
(49, 'Mark Page', 'niowa@host.test', '3304621938', 'guest', 'rilaktucfame', NULL, 0, NULL, '$2y$10$37PZ8WsGyTko.SGxbbHQ7OHP/bzM5rroQO4pl59LbxbghCf2Qkj7a', NULL, '2019-08-03 13:01:32', '2019-08-04 08:10:57'),
(50, 'Brent Massey', 'obru@host.test', '9293108771', 'guest', 'fihseevsaacm', NULL, 0, NULL, '$2y$10$F0gQvQZovuVq5wu3xuZF1eGGicZeg694SthywmmhlS2F7RFxQ3Sxe', NULL, '2019-08-03 13:01:38', '2019-08-04 09:47:23'),
(51, 'Evelyn Santos', 'zidnaked@host.test', '4129941462', 'guest', 'usozinbittas', NULL, 0, NULL, '$2y$10$c3nd7ex.aiH1ZBPnXxbgbOTCtKC1rtZN0SzXOGytIcFKNXYhsVclG', NULL, '2019-08-03 13:01:48', '2019-08-04 08:10:57'),
(52, 'Jeffery Hunter', 'jewgeha@host.local', '4779303656', 'guest', 'ezekapconrir', NULL, 0, NULL, '$2y$10$rJ6HzyzkaK/Cddlm0W9ASu5Nrw1FXS26kNCrJY2qT1QA.Ycwc7hzK', NULL, '2019-08-03 13:02:02', '2019-08-04 08:10:57'),
(53, 'Ora Elliott', 'korihji@host.local', '3737866393', 'guest', 'ticewruknale', NULL, 0, NULL, '$2y$10$xv3cesDuBjmKHAPt30NTH.if6zzVHfvEiK7Q4anUI5E0YoSlcGxL.', NULL, '2019-08-03 13:02:15', '2019-08-04 08:10:57'),
(54, 'Nathan Mills', 'lis@host.test', '8275018760', 'guest', 'podagfotkaji', NULL, 1, NULL, '$2y$10$gtjay4kndkXl4DKgr0FRVO2HL1E1nluubIu276yvWAacPlCAT7.YG', NULL, '2019-08-03 13:02:38', '2019-08-04 09:50:55'),
(55, 'Clifford Tucker', 'gorefja@host.invalid', '4686855232', 'guest', 'zizsezajugek', NULL, 0, NULL, '$2y$10$BwVXLyCLSWnk.eSOsuI3E.k6sh6GU0.ogcbi0AJRnw6anRnHfY0YW', NULL, '2019-08-03 13:02:45', '2019-08-04 09:47:23'),
(56, 'Nina Becker', 'gikob@host.test', '2207326077', 'guest', 'kuefotoodeni', NULL, 0, NULL, '$2y$10$orJifWsykcQtK95Ie/l.2ubNuLPmQ0J/F//0BrmANdQF/hpcNxKCC', NULL, '2019-08-03 13:05:32', '2019-08-04 09:23:31'),
(57, 'Marian Steele', 'dan@host.invalid', '3492305032', 'guest', 'jekufsoahuab', NULL, 0, NULL, '$2y$10$UBS1No63ue4KC6j7Ke8n6u6IWUE9m1KJF/DSGMN66soBDApr/cZM.', NULL, '2019-08-03 13:05:41', '2019-08-04 09:23:31'),
(58, 'Nancy Griffin', 'vanpij@host.invalid', '3496709563', 'guest', 'unewuvufbati', NULL, 0, NULL, '$2y$10$gX6Qdn9bWKtwIcLu0Hou/e908nq/dn2NDaSdgmhi8srg4Auann0pS', NULL, '2019-08-03 13:05:48', '2019-08-04 09:50:34'),
(59, 'Mable Valdez', 'ule@host.test', '4487166148', 'guest', 'warazvifmeel', NULL, 0, NULL, '$2y$10$ugOOpwaeEhkQKSmh8BqL3e./uEASBoX5ynlkwIvLb0y54Z8pMBFqa', NULL, '2019-08-03 13:09:07', '2019-08-04 08:10:57'),
(60, 'Lucille Briggs', 'jeinlol@host.test', '7596854930', 'guest', 'luucejahlaid', NULL, 0, NULL, '$2y$10$OWh0Zjr52Tqoivj0i2wyx.4jW9aM6nXX732vQainR0E5EG3imqy7a', NULL, '2019-08-03 13:09:15', '2019-08-04 08:10:57'),
(61, 'Delia Dawson', 'mod@host.invalid', '8504477696', 'guest', 'focatokcizuc', NULL, 0, NULL, '$2y$10$AzewrScMuUUlSBmrGrEei.wpNVeCGEZra26uMEpYqdt2W2lxS90te', NULL, '2019-08-03 13:09:21', '2019-08-04 09:05:23'),
(62, 'Robert Vega', 'kowuto@host.invalid', '2189908150', 'guest', 'ihnotizitezo', NULL, 0, NULL, '$2y$10$l1kq4QRZh8Qp0nPDpQZ6PexYFpYOBDNj4CWSyRCNDtoA41Byw7A8i', NULL, '2019-08-03 13:09:27', '2019-08-04 09:23:31'),
(63, 'Lulu Brooks', 'opugiworu@host.local', '4325797810', 'guest', 'neepvabtucpo', NULL, 0, NULL, '$2y$10$a7CEyykSZm16pJmnR9sxUOsZVVKohC..B9.gGybqrYnzbmFxhtvxq', NULL, '2019-08-03 13:09:35', '2019-08-04 09:29:18'),
(64, 'Etta Weaver', 'jetiw@host.test', '6588087493', 'guest', 'giplohubsopd', NULL, 0, NULL, '$2y$10$.sYpiFzHdx.pUxOUAT193.9rXI.32FJ.baitEyJzJB3EEM/jmhirW', NULL, '2019-08-03 13:09:42', '2019-08-04 09:06:30'),
(65, 'Alice Hogan', 'viod@host.test', '5635828622', 'guest', 'modvizeguhhi', NULL, 0, NULL, '$2y$10$tkuGZAvb35N59a7jK8M2xuUS/1BqUeGT9AfkBpSiORBTBpw6uOcbS', NULL, '2019-08-03 13:10:06', '2019-08-04 09:47:23'),
(66, 'Philip Davidson', 'wes@host.local', '4583435393', 'guest', 'obniletoracm', NULL, 0, NULL, '$2y$10$.9ov7h.XP9XXCEudszLU9.KJBVKmQ14ym.n2BgrthQqtNB3D1rhG6', NULL, '2019-08-03 13:10:13', '2019-08-04 08:10:58'),
(67, 'Jackson Warner', 'ivje@host.local', '3303501731', 'guest', 'izomeniojsiw', NULL, 0, NULL, '$2y$10$ydXGv1Sgy9EYFEJZvienouhn0Gf3bK3cNUz1Hx3iTokG2u9le1qVO', NULL, '2019-08-03 13:10:21', '2019-08-04 08:10:58'),
(68, 'nelly', 'nelly@gmail.com', '0715810055', 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$kAis4x8wiz17jFqXWgSVg.xZTw6pxRqTVLYuotgvc8p6.zLfnvVMy', NULL, '2019-08-03 15:00:00', '2019-08-03 15:00:00'),
(69, 'shem', 'she@gmail.com', '078037262', 'guest', NULL, '1564861520.jpeg', 0, NULL, '$2y$10$z6v7oibF8EtNycUWcKjHtum.l/D8OlCSBVV/70gFaCdQTWsWuUzGi', NULL, '2019-08-03 16:43:47', '2019-08-04 08:10:58'),
(70, 'Moris', 'moris@gmail.com', '078037262', 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$zK5HUrehclaDMR9qGQ1uOOnTimCxHCugcqgFK9c/qWkm4ILl2Z0i6', NULL, '2019-08-04 08:54:58', '2019-08-04 08:54:58'),
(71, 'Moris', 'mor@gmail.com', '078037262', 'guest', NULL, 'profile.png', 0, NULL, '$2y$10$Ry8rws7u7uaBbL.JGz.zBunN4njHztKnSz7tbA73tDDFCqqBrsexS', NULL, '2019-08-04 09:02:39', '2019-08-04 09:37:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `camping`
--
ALTER TABLE `camping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campweeks`
--
ALTER TABLE `campweeks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claims`
--
ALTER TABLE `claims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communication`
--
ALTER TABLE `communication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contribution`
--
ALTER TABLE `contribution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_entries`
--
ALTER TABLE `file_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ministries`
--
ALTER TABLE `ministries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `calendars`
--
ALTER TABLE `calendars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `camping`
--
ALTER TABLE `camping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `campweeks`
--
ALTER TABLE `campweeks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `communication`
--
ALTER TABLE `communication`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contribution`
--
ALTER TABLE `contribution`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `file_entries`
--
ALTER TABLE `file_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ministries`
--
ALTER TABLE `ministries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
