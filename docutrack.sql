-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2026 at 06:01 AM
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
-- Database: `docutrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `campus` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `details`, `campus`, `college`, `program`, `ip`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 1, 'login', 'User Super Admin logged in', 'Main Campus', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 19:33:19', '2026-02-15 19:33:19'),
(2, 4, 'login', 'User Program Head logged in', 'Main Campus', 'CAS', 'BSIT', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:03:12', '2026-02-15 20:03:12'),
(3, 4, 'login', 'User Program Head logged in', 'Main Campus', 'CAS', 'BSIT', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:05:28', '2026-02-15 20:05:28'),
(4, 4, 'login', 'User Program Head logged in', 'Main Campus', 'CAS', 'BSIT', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:09:31', '2026-02-15 20:09:31'),
(5, 1, 'login', 'User Super Admin logged in', 'Main Campus', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:37:09', '2026-02-15 20:37:09'),
(6, 1, 'login', 'User Super Admin logged in', 'Main Campus', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:38:18', '2026-02-15 20:38:18'),
(7, 1, 'login', 'User Super Admin logged in', 'Main Campus', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:21:02', '2026-02-17 16:21:02'),
(8, 4, 'login', 'User Program Head logged in', 'Main Campus', 'CAS', 'BSIT', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:27:48', '2026-02-17 16:27:48'),
(9, 1, 'login', 'User Super Admin logged in', 'Main Campus', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:30:25', '2026-02-17 16:30:25'),
(10, 1, 'login', 'User Super Admin logged in', 'Main Campus', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:49:24', '2026-02-17 16:49:24'),
(11, 1, 'login', 'User Super Admin logged in', 'Main Campus', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:54:43', '2026-02-17 16:54:43'),
(12, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 18:42:51', '2026-02-17 18:42:51'),
(13, 6, 'register', 'New user registration: delosreyesjimmar@ispsc.edu.ph', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 18:50:00', '2026-02-17 18:50:00'),
(14, 1, 'login', 'User Super Admin logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:11:56', '2026-02-17 19:11:56'),
(15, 1, 'login', 'User Super Admin logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:21:46', '2026-02-17 19:21:46'),
(16, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:37:36', '2026-02-17 19:37:36'),
(17, 1, 'login', 'User Super Admin logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:38:17', '2026-02-17 19:38:17'),
(18, 1, 'document_created', 'Document created: Sample', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:45:25', '2026-02-17 19:45:25'),
(19, 1, 'document_updated', 'Document updated: editors_updated - changes: {\"updated_by\":1,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.editor.assigned\",\"data\":{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 20:15:17', '2026-02-17 20:15:17'),
(20, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:32:02', '2026-02-18 00:32:02'),
(21, 1, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:33:06', '2026-02-18 00:33:06'),
(22, 1, 'document_updated', 'Document updated: editors_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:33:10', '2026-02-18 00:33:10'),
(23, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:33:25', '2026-02-18 00:33:25'),
(24, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:33:56', '2026-02-18 00:33:56'),
(25, 1, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}}]}', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:34:06', '2026-02-18 00:34:06'),
(26, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:34:22', '2026-02-18 00:34:22'),
(27, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:34:35', '2026-02-18 00:34:35'),
(28, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:34:45', '2026-02-18 00:34:45'),
(29, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:35:03', '2026-02-18 00:35:03'),
(30, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:35:33', '2026-02-18 00:35:33'),
(31, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:36:58', '2026-02-18 00:36:58'),
(32, 1, 'document_created', 'Document created: sample 2', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:41:52', '2026-02-18 00:41:52'),
(33, 1, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:46:53', '2026-02-18 00:46:53'),
(34, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:47:18', '2026-02-18 00:47:18'),
(35, 1, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:50:50', '2026-02-18 00:50:50'),
(36, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:51:09', '2026-02-18 00:51:09'),
(37, 5, 'document_created', 'Document created: s', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:52:05', '2026-02-18 00:52:05'),
(38, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:54:18', '2026-02-18 00:54:18'),
(39, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:54:54', '2026-02-18 00:54:54'),
(40, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:57:41', '2026-02-18 00:57:41'),
(41, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:29:34', '2026-02-18 18:29:34'),
(42, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:36:14', '2026-02-18 18:36:14'),
(43, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:39:41', '2026-02-18 18:39:41'),
(44, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:40:44', '2026-02-18 18:40:44'),
(45, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:40:53', '2026-02-18 18:40:53'),
(46, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:41:00', '2026-02-18 18:41:00'),
(47, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:41:16', '2026-02-18 18:41:16'),
(48, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:42:49', '2026-02-18 18:42:49'),
(49, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:42:57', '2026-02-18 18:42:57'),
(50, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:44:04', '2026-02-18 18:44:04'),
(51, 5, 'document_created', 'Document created: sss', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:47:35', '2026-02-18 18:47:35'),
(52, 5, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":5,\"notify\":[{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}},{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:47:51', '2026-02-18 18:47:51'),
(53, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:48:48', '2026-02-18 18:48:48'),
(54, 1, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":1}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":1}}]}', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:49:08', '2026-02-18 18:49:08'),
(55, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:49:20', '2026-02-18 18:49:20'),
(56, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":6}},{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":6}}]}', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:54:43', '2026-02-18 18:54:43'),
(57, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:55:07', '2026-02-18 18:55:07'),
(58, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:02:05', '2026-02-18 19:02:05'),
(59, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:03:00', '2026-02-18 19:03:00'),
(60, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:03:55', '2026-02-18 19:03:55'),
(61, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:13:34', '2026-02-18 19:13:34'),
(62, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:16:04', '2026-02-18 19:16:04'),
(63, 6, 'document_created', 'Document created: aa', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:24:32', '2026-02-18 19:24:32'),
(64, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:25:09', '2026-02-18 19:25:09'),
(65, 6, 'document_created', 'Document created: a', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:25:33', '2026-02-18 19:25:33'),
(66, 6, 'document_created', 'Document created: v', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:37:44', '2026-02-18 19:37:44'),
(67, 6, 'document_created', 'Document created: w', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:45:11', '2026-02-18 19:45:11'),
(68, 6, 'document_created', 'Document created: f', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:55:18', '2026-02-18 19:55:18'),
(69, 1, 'login', 'User Super Admin logged in', 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 20:53:00', '2026-02-18 20:53:00'),
(70, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 20:55:22', '2026-02-18 20:55:22'),
(71, 5, 'login', 'User Faculty User logged in', NULL, NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 20:56:54', '2026-02-18 20:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campuses`
--

CREATE TABLE `campuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campuses`
--

INSERT INTO `campuses` (`id`, `name`, `location`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Main Campus', NULL, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(2, 'Candon', NULL, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(3, 'Santa Maria', NULL, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(4, 'Tagudin', NULL, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(5, 'Cervantes', NULL, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(6, 'Narvacan', NULL, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(7, 'Santiago', NULL, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `campus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `name`, `code`, `campus_id`, `description`, `created_at`, `updated_at`) VALUES
(2, 'College of Arts & Sciences', 'CAS', 1, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(4, 'College of Education', 'COE', 1, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(5, 'College of Engineering', 'COEGR', 1, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `action` varchar(255) DEFAULT NULL COMMENT 'approve|reject|null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `document_id`, `user_id`, `content`, `action`, `created_at`, `updated_at`) VALUES
(1, 5, 6, 'saasasas', NULL, '2026-02-18 00:34:35', '2026-02-18 00:34:35'),
(2, 5, 6, 'asasas', NULL, '2026-02-18 00:34:45', '2026-02-18 00:34:45'),
(3, 5, 6, 'aa', NULL, '2026-02-18 18:36:14', '2026-02-18 18:36:14'),
(4, 5, 6, 'Revise requested', 'revise', '2026-02-18 18:39:41', '2026-02-18 18:39:41'),
(5, 5, 6, 'Approved', 'approve', '2026-02-18 18:40:44', '2026-02-18 18:40:44'),
(6, 5, 6, 'Rejected', 'reject', '2026-02-18 18:40:53', '2026-02-18 18:40:53'),
(7, 5, 6, 'Revise requested', 'revise', '2026-02-18 18:41:00', '2026-02-18 18:41:00'),
(8, 5, 6, 'asas', NULL, '2026-02-18 18:41:16', '2026-02-18 18:41:16'),
(9, 5, 6, 'Rejected', 'reject', '2026-02-18 18:42:49', '2026-02-18 18:42:49'),
(10, 5, 6, 'Revise requested', 'revise', '2026-02-18 18:42:57', '2026-02-18 18:42:57'),
(11, 8, 1, 'Rejected', 'reject', '2026-02-18 18:49:08', '2026-02-18 18:49:08'),
(12, 8, 6, 'Approved', 'approve', '2026-02-18 18:49:28', '2026-02-18 18:49:28'),
(13, 8, 6, 'Approved', 'approve', '2026-02-18 18:54:43', '2026-02-18 18:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `campus` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected','reviews_done') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `title`, `description`, `file_path`, `file_type`, `document_type_id`, `user_id`, `campus`, `college`, `program`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Sample', NULL, 'sample-document.pdf', NULL, NULL, 1, NULL, NULL, NULL, 'reviews_done', '2026-02-17 19:45:25', '2026-02-18 18:42:57'),
(6, 'sample 2', NULL, 'oL1Vz25zyTgW9MVi6V0OKADsNC9pBhX2F0xAX1tj.pdf', 'application/pdf', NULL, 1, 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', 'pending', '2026-02-18 00:41:52', '2026-02-18 00:41:52'),
(7, 's', NULL, 'atJ0e8saHRS0i8NPJH3HtF6Y8oX2PikIPg0eBAnw.pdf', 'application/pdf', NULL, 5, NULL, NULL, NULL, 'pending', '2026-02-18 00:52:05', '2026-02-18 00:52:05'),
(8, 'sss', NULL, 'lBOxkoZ9671i2HbclmCVYo2NoLgTRPukBz9YpNzZ.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 5, NULL, NULL, NULL, 'reviews_done', '2026-02-18 18:47:35', '2026-02-18 18:49:08'),
(9, 'BSIT Program Curriculum', 'Updated curriculum for Bachelor of Science in Information Technology', 'bsit-curriculum.pdf', 'application/pdf', NULL, 4, NULL, NULL, NULL, 'approved', '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(10, 'Capstone Project Guidelines', 'Guidelines and requirements for final capstone project', 'capstone-guidelines.pdf', 'application/pdf', NULL, 4, NULL, NULL, NULL, 'pending', '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(11, 'aa', NULL, 'PJqv6sFA4Esp3jD0jh7S5eYGL3AtNt1p9TLlblO2.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 6, NULL, NULL, NULL, 'pending', '2026-02-18 19:24:32', '2026-02-18 19:24:32'),
(12, 'a', NULL, 'FBlZPIP684jnvHiUWRHwmmM8ofQX17iesOFs8moD.pdf', 'application/pdf', NULL, 6, NULL, NULL, NULL, 'pending', '2026-02-18 19:25:33', '2026-02-18 19:25:33'),
(13, 'v', NULL, 'Wi1w3nThFkbBb0i4MuYUjLJwtdATaqn2yV6xS0dL.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 6, NULL, NULL, NULL, 'pending', '2026-02-18 19:37:44', '2026-02-18 19:37:44'),
(14, 'w', NULL, 'OXoZyjN4wsZsbhTd4KOABwUA3eFUNArNc9mmQXiD.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 6, NULL, NULL, NULL, 'pending', '2026-02-18 19:45:11', '2026-02-18 19:45:11'),
(15, 'f', NULL, 'F8fWJRg8OYipQi87zWFwrdH0PMTBqEws083xrexX.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 2, 6, NULL, NULL, NULL, 'pending', '2026-02-18 19:55:18', '2026-02-18 19:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `document_approvals`
--

CREATE TABLE `document_approvals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected','returned') NOT NULL DEFAULT 'pending',
  `comments` text DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_authors`
--

CREATE TABLE `document_authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_authors`
--

INSERT INTO `document_authors` (`id`, `user_id`, `first_name`, `last_name`, `email`, `affiliation`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Dr. Maria', 'Santos', 'maria.santos@university.edu', 'College of Engineering', '2026-02-15 20:24:19', '2026-02-15 20:24:19'),
(2, NULL, 'Prof. Juan', 'Reyes', 'juan.reyes@university.edu', 'College of Arts and Sciences', '2026-02-15 20:24:19', '2026-02-15 20:24:19'),
(3, NULL, 'Dr. Ana', 'Garcia', 'ana.garcia@university.edu', 'College of Engineering', '2026-02-15 20:24:19', '2026-02-15 20:24:19'),
(4, NULL, 'Prof. Carlos', 'Mendoza', 'carlos.mendoza@university.edu', 'College of Business', '2026-02-15 20:24:19', '2026-02-15 20:24:19'),
(5, NULL, 'Dr. Rosa', 'Fernandez', 'rosa.fernandez@university.edu', 'College of Education', '2026-02-15 20:24:19', '2026-02-15 20:24:19'),
(6, NULL, 'Prof. Miguel', 'Lopez', 'miguel.lopez@university.edu', 'College of Arts and Sciences', '2026-02-15 20:24:19', '2026-02-15 20:24:19'),
(7, NULL, 'Dr. Patricia', 'Navarro', 'patricia.navarro@university.edu', 'College of Engineering', '2026-02-15 20:24:19', '2026-02-15 20:24:19'),
(8, NULL, 'Prof. Alfonso', 'Ruiz', 'alfonso.ruiz@university.edu', 'College of Business', '2026-02-15 20:24:19', '2026-02-15 20:24:19'),
(9, NULL, 'Dr.', 'Rosa Fernandez', NULL, NULL, '2026-02-17 19:45:25', '2026-02-17 19:45:25'),
(10, 1, 'Super', 'Admin', NULL, NULL, '2026-02-18 00:41:52', '2026-02-18 00:41:52'),
(11, 6, 'Jim-mar', 'De los Reyes', NULL, NULL, '2026-02-18 00:52:05', '2026-02-18 00:52:05'),
(12, 5, 'Faculty', 'User', NULL, NULL, '2026-02-18 18:47:35', '2026-02-18 18:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `document_author_document`
--

CREATE TABLE `document_author_document` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `document_author_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_author_document`
--

INSERT INTO `document_author_document` (`id`, `document_id`, `document_author_id`, `role`, `created_at`, `updated_at`) VALUES
(13, 5, 9, 'Primary', '2026-02-17 19:45:25', '2026-02-17 19:45:25'),
(14, 6, 10, 'Primary', '2026-02-18 00:41:52', '2026-02-18 00:41:52'),
(15, 7, 11, 'Primary', '2026-02-18 00:52:05', '2026-02-18 00:52:05'),
(16, 8, 12, 'Primary', '2026-02-18 18:47:35', '2026-02-18 18:47:35'),
(17, 11, 11, 'Primary', '2026-02-18 19:24:32', '2026-02-18 19:24:32'),
(18, 12, 11, 'Primary', '2026-02-18 19:25:33', '2026-02-18 19:25:33'),
(19, 13, 11, 'Primary', '2026-02-18 19:37:44', '2026-02-18 19:37:44'),
(20, 14, 11, 'Primary', '2026-02-18 19:45:11', '2026-02-18 19:45:11'),
(21, 15, 11, 'Primary', '2026-02-18 19:55:18', '2026-02-18 19:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `document_commenters`
--

CREATE TABLE `document_commenters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_commenters`
--

INSERT INTO `document_commenters` (`id`, `document_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 6, '2026-02-18 00:34:06', '2026-02-18 00:34:06'),
(2, 8, 1, '2026-02-18 18:47:51', '2026-02-18 18:47:51'),
(3, 8, 6, '2026-02-18 18:47:51', '2026-02-18 18:47:51');

-- --------------------------------------------------------

--
-- Table structure for table `document_editors`
--

CREATE TABLE `document_editors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_editors`
--

INSERT INTO `document_editors` (`id`, `document_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 6, '2026-02-17 20:15:17', '2026-02-17 20:15:17');

-- --------------------------------------------------------

--
-- Table structure for table `document_pages`
--

CREATE TABLE `document_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `page_number` int(11) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_parts`
--

CREATE TABLE `document_parts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Policy', NULL, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(2, 'Form', NULL, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(3, 'Guideline', NULL, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(4, 'Report', NULL, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(5, 'Curriculum', NULL, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(6, 'Syllabus', NULL, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(7, 'Thesis', NULL, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `original_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL,
  `campus` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'uploaded',
  `metadata` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '0001_01_01_000000_create_users_table', 1),
(7, '0001_01_01_000001_create_cache_table', 1),
(8, '0001_01_01_000002_create_jobs_table', 1),
(9, '2026_02_16_000000_add_college_program_and_superadmin_to_users', 1),
(10, '2026_02_16_000002_create_activity_logs_table', 1),
(11, '2026_02_16_000003_create_documents_table', 1),
(12, '2026_02_16_000004_create_system_settings_table', 1),
(13, '2026_02_16_000005_add_status_to_users', 1),
(14, '2026_02_16_000006_create_campuses_colleges_programs', 2),
(15, '2026_02_16_000007_create_document_approvals_table', 2),
(16, '2026_02_16_000008_create_file_uploads_table', 2),
(17, '2026_02_16_000009_create_system_logs_table', 2),
(18, '2026_02_16_000010_create_document_types_table', 3),
(19, '2026_02_16_000011_create_document_authors_table', 3),
(20, '2026_02_16_000012_create_document_parts_table', 3),
(21, '2026_02_16_000013_create_part_contents_table', 3),
(22, '2026_02_16_000014_create_document_pages_table', 3),
(23, '2026_02_16_000015_add_typeid_to_documents_table', 3),
(24, '2026_02_18_000001_create_ranks_table', 4),
(25, '2026_02_18_000002_update_users_table_remove_campus_college_program', 5),
(26, '2026_02_18_000003_add_faculty_role_to_users', 6),
(27, '2026_02_18_000010_create_document_editors_table', 7),
(28, '2026_02_18_000011_create_comments_table', 7),
(29, '2026_02_18_000012_create_notifications_table', 8),
(30, '2026_02_18_000020_add_user_id_to_document_authors', 9),
(31, '2026_02_18_000021_create_document_commenters_table', 10),
(32, '2026_02_18_000022_add_campus_college_program_to_users', 11),
(33, '2026_02_18_000030_add_action_to_comments_table', 12),
(34, '2026_02_19_000001_backfill_document_statuses', 13);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0ce84ff7-e65f-46ff-9fbc-f11cb221a9d7', 'document.comment', 'App\\Models\\User', 5, '{\"document_id\":8,\"comment_by\":1}', NULL, '2026-02-18 18:49:08', '2026-02-18 18:49:08'),
('15fdbcae-9116-4d88-8816-81200c919d1f', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 00:34:35', '2026-02-18 00:34:35'),
('1e602677-1ba7-4ea8-892e-cb297875e268', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:39:42', '2026-02-18 18:39:42'),
('23928675-394b-4ae1-89af-26bf1830de5b', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:42:49', '2026-02-18 18:42:49'),
('25e649f6-37d8-407f-a6e1-48aa43c1c819', 'document.comment', 'App\\Models\\User', 6, '{\"document_id\":8,\"comment_by\":1}', NULL, '2026-02-18 18:49:08', '2026-02-18 18:49:08'),
('31d42bd9-6740-476f-ae3e-75ad2597c388', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}', NULL, '2026-02-18 00:34:06', '2026-02-18 00:34:06'),
('3aa72a0e-72a3-4e68-a9ca-d68503289bef', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}', NULL, '2026-02-18 18:47:51', '2026-02-18 18:47:51'),
('50d44d12-2172-420f-a56b-06419e8a5379', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:41:00', '2026-02-18 18:41:00'),
('77919e28-4588-4778-8b92-46b417d17ae1', 'document.commenter.assigned', 'App\\Models\\User', 1, '{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}', NULL, '2026-02-18 18:47:51', '2026-02-18 18:47:51'),
('8fa05a7a-35b7-4e6c-87de-cf9090f9f9ed', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 00:34:45', '2026-02-18 00:34:45'),
('a6b81426-4ef7-48d5-9238-ac2161b5dd06', 'document.comment', 'App\\Models\\User', 5, '{\"document_id\":8,\"comment_by\":6}', NULL, '2026-02-18 18:54:43', '2026-02-18 18:54:43'),
('b6012543-e76a-4be9-aed4-3d97c7e4a5d2', 'document.editor.assigned', 'App\\Models\\User', 6, '{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}', NULL, '2026-02-17 20:15:17', '2026-02-17 20:15:17'),
('c05228c9-4ce2-4c52-b85c-d66d44705b4c', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":8,\"comment_by\":6}', NULL, '2026-02-18 18:54:43', '2026-02-18 18:54:43'),
('c0b0af56-12f5-43a5-919a-f931dfe147eb', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:41:16', '2026-02-18 18:41:16'),
('cad7b640-191b-412c-a548-1150dba07601', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:40:53', '2026-02-18 18:40:53'),
('cf5e02b9-02db-4af8-81ba-47640d7ed232', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:36:15', '2026-02-18 18:36:15'),
('e9f45d44-8a89-4738-b601-4ebe51127edf', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:42:57', '2026-02-18 18:42:57'),
('fe72cd6a-24fa-464a-8c61-7491ec62a985', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:40:44', '2026-02-18 18:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `part_contents`
--

CREATE TABLE `part_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_part_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `page_number` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `college_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `code`, `college_id`, `description`, `created_at`, `updated_at`) VALUES
(3, 'Bachelor of Science in Mathematics', 'BSMATH', 2, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(4, 'Bachelor of Arts in English', 'BAENG', 2, NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(5, 'Bachelor of Elementary Education', 'BEED', 4, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(6, 'Bachelor of Secondary Education', 'BSED', 4, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21');

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE `ranks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Professor', NULL, NULL),
(2, 'Associate Professor', NULL, NULL),
(3, 'Assistant Professor', NULL, NULL),
(4, 'Lecturer', NULL, NULL),
(5, 'Instructor', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('MXLS23bQiX8rsShuFj0wBW9UMUkexn9J9cWvBKvo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSlNkd1RESzJVa2dqd3o0bExJR2wyMGlabnZJMlg1WURJSW5iTDREUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NToic3RhdGUiO3M6NDA6IkthaHJrU0VZeUdRQ3ZVUHNEY2Y2VEhkQW91eW9RZTZGbDBNUjFFWXkiO30=', 1771477132);

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `severity` enum('low','medium','high','critical') NOT NULL DEFAULT 'low',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`id`, `user_id`, `event_type`, `action`, `model_type`, `model_id`, `old_values`, `new_values`, `ip_address`, `user_agent`, `description`, `severity`, `created_at`, `updated_at`) VALUES
(1, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-15 19:33:19', '2026-02-15 19:33:19'),
(2, 4, 'auth', 'login', 'User', 4, NULL, '{\"email\":\"program_head_bsit@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from program_head_bsit@docutrack.local', 'low', '2026-02-15 20:03:12', '2026-02-15 20:03:12'),
(3, 4, 'auth', 'login', 'User', 4, NULL, '{\"email\":\"program_head_bsit@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from program_head_bsit@docutrack.local', 'low', '2026-02-15 20:05:28', '2026-02-15 20:05:28'),
(4, 4, 'auth', 'login', 'User', 4, NULL, '{\"email\":\"program_head_bsit@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from program_head_bsit@docutrack.local', 'low', '2026-02-15 20:09:31', '2026-02-15 20:09:31'),
(5, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-15 20:37:09', '2026-02-15 20:37:09'),
(6, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-15 20:38:18', '2026-02-15 20:38:18'),
(7, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-17 16:21:02', '2026-02-17 16:21:02'),
(8, 4, 'auth', 'login', 'User', 4, NULL, '{\"email\":\"program_head_bsit@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from program_head_bsit@docutrack.local', 'low', '2026-02-17 16:27:48', '2026-02-17 16:27:48'),
(9, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-17 16:30:25', '2026-02-17 16:30:25'),
(10, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-17 16:49:24', '2026-02-17 16:49:24'),
(11, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-17 16:54:43', '2026-02-17 16:54:43'),
(12, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-17 18:42:51', '2026-02-17 18:42:51'),
(13, 6, 'user', 'create', 'User', NULL, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\",\"name\":\"Jim-mar De los Reyes\",\"role\":\"program_head\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'New user registered: delosreyesjimmar@ispsc.edu.ph', 'medium', '2026-02-17 18:50:00', '2026-02-17 18:50:00'),
(14, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-17 19:11:56', '2026-02-17 19:11:56'),
(15, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-17 19:21:46', '2026-02-17 19:21:46'),
(16, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-17 19:37:36', '2026-02-17 19:37:36'),
(17, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-17 19:38:17', '2026-02-17 19:38:17'),
(18, 1, 'document', 'create', 'Document', 5, NULL, '{\"title\":\"Sample\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: Sample', 'low', '2026-02-17 19:45:25', '2026-02-17 19:45:25'),
(19, 1, 'document', 'update', 'Document', 5, NULL, '{\"updated_by\":1,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.editor.assigned\",\"data\":{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: editors_updated - changes: {\"updated_by\":1,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.editor.assigned\",\"data\":{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}}]}', 'low', '2026-02-17 20:15:17', '2026-02-17 20:15:17'),
(20, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 00:32:02', '2026-02-18 00:32:02'),
(21, 1, 'document', 'update', 'Document', 5, NULL, '{\"updated_by\":1,\"notify\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'low', '2026-02-18 00:33:06', '2026-02-18 00:33:06'),
(22, 1, 'document', 'update', 'Document', 5, NULL, '{\"updated_by\":1,\"notify\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: editors_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'low', '2026-02-18 00:33:10', '2026-02-18 00:33:10'),
(23, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 00:33:25', '2026-02-18 00:33:25'),
(24, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 00:33:56', '2026-02-18 00:33:56'),
(25, 1, 'document', 'update', 'Document', 5, NULL, '{\"updated_by\":1,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}}]}', 'low', '2026-02-18 00:34:06', '2026-02-18 00:34:06'),
(26, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 00:34:22', '2026-02-18 00:34:22'),
(27, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 00:34:35', '2026-02-18 00:34:35'),
(28, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 00:34:45', '2026-02-18 00:34:45'),
(29, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 00:35:03', '2026-02-18 00:35:03'),
(30, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-18 00:35:33', '2026-02-18 00:35:33'),
(31, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 00:36:58', '2026-02-18 00:36:58'),
(32, 1, 'document', 'create', 'Document', 6, NULL, '{\"title\":\"sample 2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: sample 2', 'low', '2026-02-18 00:41:52', '2026-02-18 00:41:52'),
(33, 1, 'document', 'update', 'Document', 6, NULL, '{\"updated_by\":1,\"notify\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'low', '2026-02-18 00:46:53', '2026-02-18 00:46:53'),
(34, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 00:47:18', '2026-02-18 00:47:18'),
(35, 1, 'document', 'update', 'Document', 6, NULL, '{\"updated_by\":1,\"notify\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'low', '2026-02-18 00:50:50', '2026-02-18 00:50:50'),
(36, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-18 00:51:09', '2026-02-18 00:51:09'),
(37, 5, 'document', 'create', 'Document', 7, NULL, '{\"title\":\"s\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: s', 'low', '2026-02-18 00:52:05', '2026-02-18 00:52:05'),
(38, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 00:54:18', '2026-02-18 00:54:18'),
(39, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 00:54:54', '2026-02-18 00:54:54'),
(40, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 00:57:41', '2026-02-18 00:57:41'),
(41, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 18:29:34', '2026-02-18 18:29:34'),
(42, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 18:36:14', '2026-02-18 18:36:14'),
(43, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 18:39:41', '2026-02-18 18:39:41'),
(44, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 18:40:44', '2026-02-18 18:40:44'),
(45, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 18:40:53', '2026-02-18 18:40:53'),
(46, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 18:41:00', '2026-02-18 18:41:00'),
(47, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 18:41:16', '2026-02-18 18:41:16'),
(48, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 18:42:49', '2026-02-18 18:42:49'),
(49, 6, 'document', 'update', 'Document', 5, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', 'low', '2026-02-18 18:42:57', '2026-02-18 18:42:57'),
(50, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-18 18:44:04', '2026-02-18 18:44:04'),
(51, 5, 'document', 'create', 'Document', 8, NULL, '{\"title\":\"sss\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: sss', 'low', '2026-02-18 18:47:35', '2026-02-18 18:47:35'),
(52, 5, 'document', 'update', 'Document', 8, NULL, '{\"updated_by\":5,\"notify\":[{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}},{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: commenters_updated - changes: {\"updated_by\":5,\"notify\":[{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}},{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}}]}', 'low', '2026-02-18 18:47:51', '2026-02-18 18:47:51'),
(53, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 18:48:48', '2026-02-18 18:48:48'),
(54, 1, 'document', 'update', 'Document', 8, NULL, '{\"user_id\":1,\"notify\":[{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":1}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":1}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":1}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":1}}]}', 'low', '2026-02-18 18:49:08', '2026-02-18 18:49:08'),
(55, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 18:49:20', '2026-02-18 18:49:20'),
(56, 6, 'document', 'update', 'Document', 8, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":6}},{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":6}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":6}},{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":6}}]}', 'low', '2026-02-18 18:54:43', '2026-02-18 18:54:43'),
(57, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-18 18:55:07', '2026-02-18 18:55:07'),
(58, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 19:02:05', '2026-02-18 19:02:05'),
(59, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-18 19:03:00', '2026-02-18 19:03:00'),
(60, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 19:03:55', '2026-02-18 19:03:55'),
(61, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-18 19:13:35', '2026-02-18 19:13:35'),
(62, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 19:16:04', '2026-02-18 19:16:04'),
(63, 6, 'document', 'create', 'Document', 11, NULL, '{\"title\":\"aa\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: aa', 'low', '2026-02-18 19:24:32', '2026-02-18 19:24:32'),
(64, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 19:25:09', '2026-02-18 19:25:09'),
(65, 6, 'document', 'create', 'Document', 12, NULL, '{\"title\":\"a\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: a', 'low', '2026-02-18 19:25:33', '2026-02-18 19:25:33'),
(66, 6, 'document', 'create', 'Document', 13, NULL, '{\"title\":\"v\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: v', 'low', '2026-02-18 19:37:44', '2026-02-18 19:37:44'),
(67, 6, 'document', 'create', 'Document', 14, NULL, '{\"title\":\"w\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: w', 'low', '2026-02-18 19:45:11', '2026-02-18 19:45:11'),
(68, 6, 'document', 'create', 'Document', 15, NULL, '{\"title\":\"f\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: f', 'low', '2026-02-18 19:55:18', '2026-02-18 19:55:18'),
(69, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-18 20:53:00', '2026-02-18 20:53:00'),
(70, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-18 20:55:22', '2026-02-18 20:55:22'),
(71, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-18 20:56:54', '2026-02-18 20:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'string',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('superadmin','campus_director','dean','program_head','faculty') NOT NULL,
  `contactNumber` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `campus` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `rank` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `middleName`, `email`, `email_verified_at`, `password`, `role`, `contactNumber`, `address`, `campus`, `college`, `program`, `status`, `rank`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super', 'Admin', NULL, 'superadmin@docutrack.local', NULL, '$2y$12$gnCo7lqyiWm7OnMCLF5Gte37pOqgwUs.fvLHY0TulJSfZMmBINIQa', 'superadmin', NULL, NULL, 'Candon', 'College of Arts & Sciences', 'Bachelor of Arts in English', 'active', NULL, 'CbvPYSt6oTTH9XvWmD5nvIkgh60evRcEmR27F0QaXW6jgoJ54yTEwqn6Cmwr', '2026-02-15 18:25:06', '2026-02-17 20:24:09'),
(2, 'Campus', 'Director', NULL, 'campus_director@docutrack.local', NULL, '$2y$12$jiTXCHJGCHKTlqe7YkHjj.K10VSdQWJnSOKgYpm3BUEI1Jgsx3cMC', 'campus_director', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, '2026-02-15 18:25:06', '2026-02-15 18:25:06'),
(3, 'CAS', 'Dean', NULL, 'dean_cas_tagudin@docutrack.local', NULL, '$2y$12$ZS8KDDWSHpuwFvTPLwlRO.VzdMDx45uYJS0tOR425fLho.Dwq3sb2', 'dean', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, '2026-02-15 18:25:07', '2026-02-15 18:25:07'),
(4, 'Program', 'Head', NULL, 'program_head_bsit@docutrack.local', NULL, '$2y$12$VFb5zkMlZOFpNv1202nLXOyCBJhxnI7RonEw9JgolhAPdrCYuimgi', 'program_head', NULL, NULL, NULL, NULL, NULL, 'active', NULL, 'pXOpiH46HSLMZzlKHbpq0fGoiz305S1NNDZmGcFDIIEFqmSahc9D2g9N3Ndk', '2026-02-15 18:25:07', '2026-02-15 18:25:07'),
(5, 'Faculty', 'User', NULL, 'faculty@example.com', NULL, '$2y$12$9R/KyIByqXfcMNFbcZJdpO.aygq6oumcBUCjG/4WzueEii/SB2nWK', 'faculty', NULL, NULL, NULL, NULL, NULL, 'active', 'Professor', NULL, '2026-02-17 18:41:39', '2026-02-17 18:41:39'),
(6, 'Jim-mar', 'De los Reyes', NULL, 'delosreyesjimmar@ispsc.edu.ph', NULL, '$2y$12$.pmZEg17lTZDYtwMHdw8Iu1dt1Ih7MDUkE2DKsBeF4V8vGGh..wOi', 'program_head', '+639111111111', 'Tagudin', NULL, NULL, NULL, 'active', 'Lecturer', NULL, '2026-02-17 18:50:00', '2026-02-17 18:50:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `campuses`
--
ALTER TABLE `campuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campuses_name_unique` (`name`);

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colleges_code_unique` (`code`),
  ADD KEY `colleges_campus_id_foreign` (`campus_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_document_id_foreign` (`document_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_user_id_foreign` (`user_id`),
  ADD KEY `documents_document_type_id_foreign` (`document_type_id`);

--
-- Indexes for table `document_approvals`
--
ALTER TABLE `document_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_approvals_document_id_foreign` (`document_id`),
  ADD KEY `document_approvals_user_id_foreign` (`user_id`);

--
-- Indexes for table `document_authors`
--
ALTER TABLE `document_authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_authors_user_id_foreign` (`user_id`);

--
-- Indexes for table `document_author_document`
--
ALTER TABLE `document_author_document`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_author_document_document_id_document_author_id_unique` (`document_id`,`document_author_id`),
  ADD KEY `document_author_document_document_author_id_foreign` (`document_author_id`);

--
-- Indexes for table `document_commenters`
--
ALTER TABLE `document_commenters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_commenters_document_id_user_id_unique` (`document_id`,`user_id`),
  ADD KEY `document_commenters_user_id_foreign` (`user_id`);

--
-- Indexes for table `document_editors`
--
ALTER TABLE `document_editors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_editors_document_id_user_id_unique` (`document_id`,`user_id`),
  ADD KEY `document_editors_user_id_foreign` (`user_id`);

--
-- Indexes for table `document_pages`
--
ALTER TABLE `document_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_pages_document_id_page_number_unique` (`document_id`,`page_number`);

--
-- Indexes for table `document_parts`
--
ALTER TABLE `document_parts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_parts_document_id_foreign` (`document_id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_types_name_unique` (`name`),
  ADD UNIQUE KEY `document_types_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_uploads_user_id_index` (`user_id`),
  ADD KEY `file_uploads_document_id_index` (`document_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `part_contents`
--
ALTER TABLE `part_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_contents_document_part_id_foreign` (`document_part_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `programs_code_unique` (`code`),
  ADD KEY `programs_college_id_foreign` (`college_id`);

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ranks_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_logs_user_id_created_at_index` (`user_id`,`created_at`),
  ADD KEY `system_logs_event_type_created_at_index` (`event_type`,`created_at`),
  ADD KEY `system_logs_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_settings_key_unique` (`key`);

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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `campuses`
--
ALTER TABLE `campuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `document_approvals`
--
ALTER TABLE `document_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_authors`
--
ALTER TABLE `document_authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `document_author_document`
--
ALTER TABLE `document_author_document`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `document_commenters`
--
ALTER TABLE `document_commenters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `document_editors`
--
ALTER TABLE `document_editors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `document_pages`
--
ALTER TABLE `document_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_parts`
--
ALTER TABLE `document_parts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `part_contents`
--
ALTER TABLE `part_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `colleges`
--
ALTER TABLE `colleges`
  ADD CONSTRAINT `colleges_campus_id_foreign` FOREIGN KEY (`campus_id`) REFERENCES `campuses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `document_approvals`
--
ALTER TABLE `document_approvals`
  ADD CONSTRAINT `document_approvals_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_approvals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_authors`
--
ALTER TABLE `document_authors`
  ADD CONSTRAINT `document_authors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `document_author_document`
--
ALTER TABLE `document_author_document`
  ADD CONSTRAINT `document_author_document_document_author_id_foreign` FOREIGN KEY (`document_author_id`) REFERENCES `document_authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_author_document_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_commenters`
--
ALTER TABLE `document_commenters`
  ADD CONSTRAINT `document_commenters_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_commenters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_editors`
--
ALTER TABLE `document_editors`
  ADD CONSTRAINT `document_editors_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_editors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_pages`
--
ALTER TABLE `document_pages`
  ADD CONSTRAINT `document_pages_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_parts`
--
ALTER TABLE `document_parts`
  ADD CONSTRAINT `document_parts_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD CONSTRAINT `file_uploads_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `file_uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `part_contents`
--
ALTER TABLE `part_contents`
  ADD CONSTRAINT `part_contents_document_part_id_foreign` FOREIGN KEY (`document_part_id`) REFERENCES `document_parts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `programs_college_id_foreign` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD CONSTRAINT `system_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
