-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 02, 2019 at 10:31 PM
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
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calendars`
--

INSERT INTO `calendars` (`id`, `event_name`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(4, 'keja d', '2019-07-04', '2019-07-27', '2019-07-27 04:50:48', '2019-07-27 05:11:23');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `camping`
--

INSERT INTO `camping` (`id`, `week`, `user_id`, `church_id`, `name`, `phone`, `created_at`, `updated_at`) VALUES
(2, 1, 24, 30, 'DERRICK OCHIENG', '0715810055', '2019-08-02 16:57:18', '2019-08-02 16:57:18'),
(3, 1, 10, 30, 'mac morgan', '0715511302', '2019-08-02 16:57:18', '2019-08-02 16:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `from_start` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_destination` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `claims`
--

INSERT INTO `claims` (`id`, `title`, `user_id`, `event`, `amount`, `from_start`, `to_destination`, `journey`, `created_at`, `updated_at`) VALUES
(1, 'Transport', 24, 'One', '5000.00', 'Nairobi', 'Kisumu', 'Departure', '2019-07-26 17:39:57', '2019-07-26 17:39:57'),
(2, 'Transport', 30, 'One', '5800.00', 'Nairobi', 'Kisumu', 'Arrival', '2019-08-01 11:16:52', '2019-08-01 11:16:52');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contribution`
--

INSERT INTO `contribution` (`id`, `church_id`, `amount`, `type`, `created_at`, `updated_at`) VALUES
(30, 30, 2000, 'Contribution', '2019-08-01 04:12:39', '2019-08-01 04:12:39'),
(29, 30, 1700, 'Contribution', '2019-08-01 03:44:35', '2019-08-01 03:44:35'),
(28, 30, 1700, 'Contribution', '2019-08-01 03:44:20', '2019-08-01 03:44:20'),
(27, 30, 23000, 'Target', '2019-08-01 03:44:06', '2019-08-01 03:44:06'),
(31, 30, 18000, 'Contribution', '2019-08-01 04:13:30', '2019-08-01 04:13:30'),
(32, 32, 23000, 'Target', '2019-08-01 04:14:13', '2019-08-01 04:14:13'),
(33, 32, 20000, 'Contribution', '2019-08-01 04:14:50', '2019-08-01 04:14:50'),
(34, 37, 50000, 'Target', '2019-08-01 06:48:24', '2019-08-01 06:48:24'),
(37, 37, 200, 'Contribution', '2019-08-01 09:55:49', '2019-08-01 09:55:49'),
(38, 37, 1700, 'Contribution', '2019-08-01 09:56:28', '2019-08-01 09:56:28'),
(39, 37, 2222, 'Contribution', '2019-08-01 09:58:35', '2019-08-01 09:58:35'),
(40, 37, 650, 'Contribution', '2019-08-01 13:12:35', '2019-08-01 13:12:35'),
(41, 37, 6000, 'Contribution', '2019-08-01 13:17:29', '2019-08-01 13:17:29'),
(42, 37, 6000, 'Contribution', '2019-08-01 13:17:47', '2019-08-01 13:17:47');

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
(19, '2019_08_02_193824_create_camping_table', 13);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ministries`
--

INSERT INTO `ministries` (`id`, `name`, `location`, `pastor`, `phone`, `week`, `created_at`, `updated_at`) VALUES
(30, 'jeremiah', 'kenya', 9, NULL, 1, '2019-07-28 10:52:05', '2019-08-02 16:57:18'),
(31, 'jeremih', 'kenya', 8, NULL, 0, '2019-07-28 10:57:14', '2019-07-28 10:57:14'),
(32, 'sda nakuru', 'nakuru', 8, NULL, 0, '2019-07-29 10:56:07', '2019-07-29 10:56:07'),
(33, 'nairobi pariish', 'eldoret', 20, NULL, 0, '2019-07-29 10:56:28', '2019-07-29 10:56:28'),
(34, 'nestle', 'eldoret', 9, NULL, 0, '2019-07-29 10:56:44', '2019-07-29 10:56:44'),
(35, 'kisimu miky', 'kisumu', 27, NULL, 0, '2019-07-29 15:51:46', '2019-07-29 15:51:46'),
(36, 'shem shem', 'eldoret', 28, NULL, 0, '2019-07-29 15:52:16', '2019-07-29 15:52:16'),
(37, 'Chelsea', 'eldoret', 30, NULL, 0, '2019-08-01 06:47:10', '2019-08-01 06:47:10');

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
(6, 'sweet', 'sweet@gmail.com', '0715511302', 'guest', 'Nairobi pastor', '', 0, NULL, '$2y$10$lDk/oXCDRcO28jRtM6lBTOig4dkuM8BPTy2id4q.nrjlQ47RCSSGG', NULL, '2019-07-17 15:14:59', '2019-07-17 15:14:59'),
(7, 'mesweet', 'mesweet@gmail.com', '0715511302', 'guest', 'sweet', '', 0, NULL, '$2y$10$8fWFb4OtNbkjSVL5wm0S4eAsPi.zbHvou6r09JGY/Bex9O6VVWmfy', NULL, '2019-07-17 15:17:42', '2019-07-17 15:17:42'),
(8, 'sweet22', 'sweet2@gmail.com', NULL, 'pastor', 'sweet', '', 0, NULL, '$2y$10$YzshW5G5MfYgtoLQIpma9OWgsLqTTm0TCS6uMA6VxK96P0RQh6hTu', NULL, '2019-07-17 15:19:35', '2019-07-20 05:32:30'),
(9, 'hope', 'hope@gmail.com', NULL, 'pastor', 'lecturer', '', 0, NULL, '$2y$10$vFa//XwITAYrv9iYE8gwcuIOby1LQLLZ8EOOt9EZerG1yhiOMDUDS', NULL, '2019-07-17 15:26:01', '2019-07-17 15:26:01'),
(10, 'mac morgan', 'macnduatishem@gmail.com', '0715511302', 'guest', 'lecturer barton', '', 1, NULL, '$2y$10$jRMi6MIzWCCiPjL52FXG7.MNG5.LxSC84Op9J40dWTtMLSmddClLC', NULL, '2019-07-17 15:36:51', '2019-08-02 16:57:18'),
(11, 'townhouse', 'town@gmail.com', '0715511302', 'guest', 'biology', '', 0, NULL, '$2y$10$WgC2Kxi6U4EFpNa7cYUIbO7oavEUpUWK7e2aDAGnZG96jxpTEK1zi', NULL, '2019-07-17 16:43:56', '2019-07-17 16:43:56'),
(12, 'matin mut', 'matin@gmail.com', '0720547364', 'pastor', 'mato', '', 0, NULL, '$2y$10$RcJZs0QdQVvcDz6VwwT5N.eO6bbcwbgfCf1WMHWiJD1h8VagiwwAW', NULL, '2019-07-17 16:48:49', '2019-07-23 05:35:21'),
(16, 'Muut', 'mut@gmail.com', '0722334454', 'pastor', 'Mac', '1563777789.png', 0, NULL, '$2y$10$DoEPNJ.rIQ6OO5YV4vtcJ.SMFAm83vVLwOe6ZDqr7agHUwNpL5GN.', NULL, '2019-07-18 10:32:59', '2019-07-22 03:43:09'),
(17, 'macmilan', 'macmilan@gmail.com', '0717021671', 'pastor', 'SDA pastor Central conference', '1563778383.png', 0, NULL, '$2y$10$up7p3//L.j84ofHU4eVCweDXW/B3l6tfb8.kLLamAtnOoSPjEZkXi', NULL, '2019-07-18 10:34:43', '2019-07-22 07:36:20'),
(18, 'wathera', 'waithera@gmail.com', '0712345678', 'guest', 'Uganda', '1563777532.jpeg', 0, NULL, '$2y$10$Mkg4EmdyH5UN2fh1a2dHee6IA/o833HxHUvqA1uILpgraDPK0gd1C', NULL, '2019-07-20 10:57:35', '2019-08-02 16:56:57'),
(19, 'PR. ONGAKI', 'ongaki@gmail.com', '0722592432', 'pastor', 'Green valley pastor', '1563960821.png', 0, NULL, '$2y$10$5hXjMk7v3R2q8bggTWYs3uy8tnk8UD0A7BcMu8VjU0PsulrunP89y', NULL, '2019-07-23 10:58:43', '2019-07-24 06:33:42'),
(20, 'PR. MUNUVE J', 'munuve@gmail.com', '0721439712', 'pastor', 'Baraka pastor', '', 0, NULL, '$2y$10$jgh4/zy3nxbHsE/FYJ.gue9A/6mVFJzTYOwkwDxu4Z75WiOaCiMzW', NULL, '2019-07-23 11:04:35', '2019-07-23 11:07:41'),
(21, 'PR. GITHINJI WILLSON', 'githinji@gmail.com', '0721483704', 'pastor', 'Mt.view pastor', '', 0, NULL, '$2y$10$oBlq/o3TZRyjjsvvyW8MPObprEXW.EjWakK/rF6Uf7rzSeDTb64Qq', NULL, '2019-07-23 11:10:00', '2019-07-23 11:10:00'),
(22, 'PR. KARIUKI MOSES', 'kariuki@gmail.com', '0705559564', 'pastor', 'Githunguri Main pastor', '', 0, NULL, '$2y$10$HDmG4WIeaVrmrwTvOj4.q.DXQ5DmcaumCka34HGprP/tF6ion.VjK', NULL, '2019-07-23 11:11:53', '2019-07-23 11:11:53'),
(23, 'PR. ORANGI', 'orangi@gmail.com', '0726999918', 'pastor', 'Langata pastor', 'profile.png', 0, NULL, '$2y$10$NLKNXkhovKmiGajx5HroWOwWVTaDuBCz7yOzlKwpvpz1lSvRgCcqW', NULL, '2019-07-23 11:17:05', '2019-07-23 11:17:05'),
(24, 'DERRICK OCHIENG', 'ochiengderrick424@gmail.com', '0715810055', 'guest', 'I am awesome', '1564126304.jpeg', 1, NULL, '$2y$10$IygOc2qsS.SUuUCj0KwTauOQCy7SLneNw3m06oHzhhAIMoWXxWdIO', NULL, '2019-07-26 04:28:01', '2019-08-02 16:57:18'),
(25, 'jeremih', 'mihjere68@gmail.com', NULL, 'admin', NULL, 'profile.png', 0, NULL, '$2y$10$5b0/GEs/JDB4kyFU9Q8fw.6gn.UJyriXAZenbcgpMDQoPRVvOJdj6', NULL, '2019-07-27 04:47:23', '2019-07-27 04:47:23'),
(26, 'mike odhiambo', 'mike@gmail.com', NULL, 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$21jgbhsc872T0z3bnz6upuBBBvOYyHkR9KXbLqHc3h4DY6NI41L3C', NULL, '2019-07-29 00:59:32', '2019-07-29 00:59:32'),
(27, 'miky', 'miky@gmail.com', NULL, 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$obEg5Mx3QO.XW2bJH6gc5eUU/MdbUom7hiq99nZ7TQfSrzt1U2r7y', NULL, '2019-07-29 15:44:59', '2019-07-29 15:44:59'),
(28, 'shem', 'shem2@gmail.com', NULL, 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$mw0V00w8vlmp9fpZ7emAaun4fM1gDfbDrNw3E/EkHtCQi5XmGGVXK', NULL, '2019-07-29 15:48:24', '2019-07-29 15:48:24'),
(29, 'shem', 'shem@gmail.com', NULL, 'pastor', NULL, 'profile.png', 0, NULL, '$2y$10$kafo69VMl1W7yjcrZtPsS.srHwjUrvqQ2loQ/Ij8q7E0LOULUwbJK', NULL, '2019-08-01 05:24:13', '2019-08-01 05:24:13'),
(30, 'DeKa', 'deka@gmail.com', '0715810055', 'pastor', 'I am awesome', 'profile.png', 0, NULL, '$2y$10$zrOhOumrSJLA7.JFp3S4Ae6ooYDqPblqsLbnuEO3Cte5WLYxRGLAi', NULL, '2019-08-01 06:46:32', '2019-08-01 06:46:32');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `camping`
--
ALTER TABLE `camping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `communication`
--
ALTER TABLE `communication`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contribution`
--
ALTER TABLE `contribution`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ministries`
--
ALTER TABLE `ministries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
