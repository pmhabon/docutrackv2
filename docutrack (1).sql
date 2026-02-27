-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2026 at 04:36 AM
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

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `details`, `college`, `program`, `ip`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 1, 'login', 'User Super Admin logged in', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 19:33:19', '2026-02-15 19:33:19'),
(2, 4, 'login', 'User Program Head logged in', 'CAS', 'BSIT', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:03:12', '2026-02-15 20:03:12'),
(3, 4, 'login', 'User Program Head logged in', 'CAS', 'BSIT', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:05:28', '2026-02-15 20:05:28'),
(4, 4, 'login', 'User Program Head logged in', 'CAS', 'BSIT', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:09:31', '2026-02-15 20:09:31'),
(5, 1, 'login', 'User Super Admin logged in', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:37:09', '2026-02-15 20:37:09'),
(6, 1, 'login', 'User Super Admin logged in', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-15 20:38:18', '2026-02-15 20:38:18'),
(7, 1, 'login', 'User Super Admin logged in', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:21:02', '2026-02-17 16:21:02'),
(8, 4, 'login', 'User Program Head logged in', 'CAS', 'BSIT', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:27:48', '2026-02-17 16:27:48'),
(9, 1, 'login', 'User Super Admin logged in', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:30:25', '2026-02-17 16:30:25'),
(10, 1, 'login', 'User Super Admin logged in', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:49:24', '2026-02-17 16:49:24'),
(11, 1, 'login', 'User Super Admin logged in', 'CAS', 'ETC', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 16:54:43', '2026-02-17 16:54:43'),
(12, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 18:42:51', '2026-02-17 18:42:51'),
(13, 6, 'register', 'New user registration: delosreyesjimmar@ispsc.edu.ph', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 18:50:00', '2026-02-17 18:50:00'),
(14, 1, 'login', 'User Super Admin logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:11:56', '2026-02-17 19:11:56'),
(15, 1, 'login', 'User Super Admin logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:21:46', '2026-02-17 19:21:46'),
(16, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:37:36', '2026-02-17 19:37:36'),
(17, 1, 'login', 'User Super Admin logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:38:17', '2026-02-17 19:38:17'),
(18, 1, 'document_created', 'Document created: Sample', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 19:45:25', '2026-02-17 19:45:25'),
(19, 1, 'document_updated', 'Document updated: editors_updated - changes: {\"updated_by\":1,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.editor.assigned\",\"data\":{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-17 20:15:17', '2026-02-17 20:15:17'),
(20, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:32:02', '2026-02-18 00:32:02'),
(21, 1, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:33:06', '2026-02-18 00:33:06'),
(22, 1, 'document_updated', 'Document updated: editors_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:33:10', '2026-02-18 00:33:10'),
(23, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:33:25', '2026-02-18 00:33:25'),
(24, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:33:56', '2026-02-18 00:33:56'),
(25, 1, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}}]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:34:06', '2026-02-18 00:34:06'),
(26, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:34:22', '2026-02-18 00:34:22'),
(27, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:34:35', '2026-02-18 00:34:35'),
(28, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:34:45', '2026-02-18 00:34:45'),
(29, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:35:03', '2026-02-18 00:35:03'),
(30, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:35:33', '2026-02-18 00:35:33'),
(31, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:36:58', '2026-02-18 00:36:58'),
(32, 1, 'document_created', 'Document created: sample 2', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:41:52', '2026-02-18 00:41:52'),
(33, 1, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:46:53', '2026-02-18 00:46:53'),
(34, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:47:18', '2026-02-18 00:47:18'),
(35, 1, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":1,\"notify\":[]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:50:50', '2026-02-18 00:50:50'),
(36, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:51:09', '2026-02-18 00:51:09'),
(37, 5, 'document_created', 'Document created: s', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:52:05', '2026-02-18 00:52:05'),
(38, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:54:18', '2026-02-18 00:54:18'),
(39, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:54:54', '2026-02-18 00:54:54'),
(40, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 00:57:41', '2026-02-18 00:57:41'),
(41, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:29:34', '2026-02-18 18:29:34'),
(42, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:36:14', '2026-02-18 18:36:14'),
(43, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:39:41', '2026-02-18 18:39:41'),
(44, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:40:44', '2026-02-18 18:40:44'),
(45, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:40:53', '2026-02-18 18:40:53'),
(46, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:41:00', '2026-02-18 18:41:00'),
(47, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:41:16', '2026-02-18 18:41:16'),
(48, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:42:49', '2026-02-18 18:42:49'),
(49, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":5,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:42:57', '2026-02-18 18:42:57'),
(50, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:44:04', '2026-02-18 18:44:04'),
(51, 5, 'document_created', 'Document created: sss', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:47:35', '2026-02-18 18:47:35'),
(52, 5, 'document_updated', 'Document updated: commenters_updated - changes: {\"updated_by\":5,\"notify\":[{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}},{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:47:51', '2026-02-18 18:47:51'),
(53, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:48:48', '2026-02-18 18:48:48'),
(54, 1, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":1}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":1}}]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:49:08', '2026-02-18 18:49:08'),
(55, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:49:20', '2026-02-18 18:49:20'),
(56, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":6}},{\"user_id\":1,\"type\":\"document.comment\",\"data\":{\"document_id\":8,\"comment_by\":6}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:54:43', '2026-02-18 18:54:43'),
(57, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 18:55:07', '2026-02-18 18:55:07'),
(58, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:02:05', '2026-02-18 19:02:05'),
(59, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:03:00', '2026-02-18 19:03:00'),
(60, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:03:55', '2026-02-18 19:03:55'),
(61, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:13:34', '2026-02-18 19:13:34'),
(62, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:16:04', '2026-02-18 19:16:04'),
(63, 6, 'document_created', 'Document created: aa', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:24:32', '2026-02-18 19:24:32'),
(64, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:25:09', '2026-02-18 19:25:09'),
(65, 6, 'document_created', 'Document created: a', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:25:33', '2026-02-18 19:25:33'),
(66, 6, 'document_created', 'Document created: v', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:37:44', '2026-02-18 19:37:44'),
(67, 6, 'document_created', 'Document created: w', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:45:11', '2026-02-18 19:45:11'),
(68, 6, 'document_created', 'Document created: f', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 19:55:18', '2026-02-18 19:55:18'),
(69, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 20:53:00', '2026-02-18 20:53:00'),
(70, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 20:55:22', '2026-02-18 20:55:22'),
(71, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-18 20:56:54', '2026-02-18 20:56:54'),
(72, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 06:03:41', '2026-02-22 06:03:41'),
(73, 7, 'login', 'User Sample Student logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 06:54:05', '2026-02-22 06:54:05'),
(74, 7, 'document_created', 'Document created: lll', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 06:55:13', '2026-02-22 06:55:13'),
(75, 7, 'document_updated', 'Document updated: lll - changes: {\"updated_by\":7,\"notify\":[{\"user_id\":\"5\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 06:57:46', '2026-02-22 06:57:46'),
(76, 7, 'document_updated', 'Document updated: lll - changes: {\"updated_by\":7,\"notify\":[]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 06:57:51', '2026-02-22 06:57:51'),
(77, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 06:58:32', '2026-02-22 06:58:32'),
(78, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:11:48', '2026-02-22 07:11:48'),
(79, 7, 'login', 'User Sample Student logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:12:01', '2026-02-22 07:12:01'),
(80, 7, 'document_updated', 'Document updated: lll - changes: {\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}},{\"user_id\":\"4\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:12:27', '2026-02-22 07:12:27'),
(81, 4, 'login', 'User Program Head logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:12:35', '2026-02-22 07:12:35'),
(82, 4, 'login', 'User Program Head logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:16:03', '2026-02-22 07:16:03'),
(83, 7, 'login', 'User Sample Student logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:26:19', '2026-02-22 07:26:19'),
(84, 7, 'document_created', 'Document created: d', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:26:48', '2026-02-22 07:26:48'),
(85, 7, 'login', 'User Sample Student logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:27:08', '2026-02-22 07:27:08'),
(86, 7, 'document_updated', 'Document updated: d - changes: {\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on d\",\"document_id\":17,\"title\":\"d\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\",\"assigned_by\":7}},{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on d\",\"document_id\":17,\"title\":\"d\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\",\"assigned_by\":7}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:27:35', '2026-02-22 07:27:35'),
(87, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:27:50', '2026-02-22 07:27:50'),
(88, 1, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:28:04', '2026-02-22 07:28:04'),
(89, 1, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin commented on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin commented on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:28:09', '2026-02-22 07:28:09'),
(90, 1, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:28:17', '2026-02-22 07:28:17'),
(91, 7, 'login', 'User Sample Student logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:28:37', '2026-02-22 07:28:37'),
(92, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:30:02', '2026-02-22 07:30:02'),
(93, 5, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":5,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}},{\"user_id\":4,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:33:26', '2026-02-22 07:33:26'),
(94, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:33:40', '2026-02-22 07:33:40'),
(95, 1, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed reject on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed reject on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:34:03', '2026-02-22 07:34:03'),
(96, 7, 'login', 'User Sample Student logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:34:17', '2026-02-22 07:34:17'),
(97, 7, 'document_created', 'Document created: fdfgfdg', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:34:37', '2026-02-22 07:34:37'),
(98, 7, 'document_updated', 'Document updated: fdfgfdg - changes: {\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on fdfgfdg\",\"document_id\":18,\"title\":\"fdfgfdg\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\",\"assigned_by\":7}},{\"user_id\":\"5\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on fdfgfdg\",\"document_id\":18,\"title\":\"fdfgfdg\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\",\"assigned_by\":7}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:35:40', '2026-02-22 07:35:40'),
(99, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:37:14', '2026-02-22 07:37:14'),
(100, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}},{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:37:24', '2026-02-22 07:37:24'),
(101, 7, 'login', 'User Sample Student logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:37:35', '2026-02-22 07:37:35'),
(102, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:39:10', '2026-02-22 07:39:10'),
(103, 5, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":5,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-22 07:39:17', '2026-02-22 07:39:17'),
(104, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 00:05:46', '2026-02-24 00:05:46'),
(105, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 00:14:19', '2026-02-24 00:14:19'),
(106, 6, 'login', 'User Jim-mar De los Reyes logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 17:35:17', '2026-02-24 17:35:17'),
(107, 8, 'register', 'New user registration: vsantos@gmail.com', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:02:18', '2026-02-24 18:02:18'),
(108, 9, 'register', 'New user registration: thorsantos@gmail.com', 'College of Arts & Sciences', 'Bachelor of Science in Public Administration', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:16:51', '2026-02-24 18:16:51'),
(109, 8, 'login', 'User VICTOR SANTOS logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:17:44', '2026-02-24 18:17:44'),
(110, 8, 'document_created', 'Document created: caps', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:23:30', '2026-02-24 18:23:30'),
(111, 8, 'document_updated', 'Document updated: caps - changes: {\"updated_by\":8,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on caps\",\"document_id\":19,\"title\":\"caps\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/19\",\"assigned_by\":8}}]}', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:26:10', '2026-02-24 18:26:10'),
(112, 8, 'document_created', 'Document created: capstone', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:28:59', '2026-02-24 18:28:59'),
(113, 9, 'login', 'User jj jj logged in', 'College of Arts & Sciences', 'Bachelor of Science in Public Administration', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:45:03', '2026-02-24 18:45:03'),
(114, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:45:20', '2026-02-24 18:45:20'),
(115, 1, 'user_updated', 'User VICTOR SANTOS was updated', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:45:41', '2026-02-24 18:45:41'),
(116, 8, 'login', 'User VICTOR SANTOS logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:45:55', '2026-02-24 18:45:55'),
(117, 8, 'document_created', 'Document created: it cap', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:46:49', '2026-02-24 18:46:49'),
(118, 8, 'document_created', 'Document created: xxx', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:48:23', '2026-02-24 18:48:23'),
(119, 8, 'document_created', 'Document created: ssdsd', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-24 18:59:20', '2026-02-24 18:59:20'),
(120, 8, 'document_created', 'Document created: fgdgdf', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2026-02-24 19:01:17', '2026-02-24 19:01:17'),
(121, 8, 'login', 'User VICTOR SANTOS logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-25 18:23:27', '2026-02-25 18:23:27'),
(122, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-25 19:18:39', '2026-02-25 19:18:39'),
(123, 1, 'user_updated', 'User Jim-mar De los Reyes was updated', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-25 19:20:19', '2026-02-25 19:20:19'),
(124, 1, 'user_updated', 'User Super Admin was updated', 'College of Arts & Sciences', 'Bachelor of Arts in English', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-25 19:20:54', '2026-02-25 19:20:54'),
(125, 5, 'login', 'User Faculty User logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 16:46:54', '2026-02-26 16:46:54'),
(126, 8, 'login', 'User VICTOR SANTOS logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 16:47:29', '2026-02-26 16:47:29'),
(127, 6, 'login', 'User Jim-mar De los Reyes logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 16:48:05', '2026-02-26 16:48:05'),
(128, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 16:57:35', '2026-02-26 16:57:35'),
(129, 6, 'login', 'User Jim-mar De los Reyes logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:11:52', '2026-02-26 17:11:52'),
(130, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:12:29', '2026-02-26 17:12:29'),
(131, 6, 'login', 'User Jim-mar De los Reyes logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:14:06', '2026-02-26 17:14:06'),
(132, 7, 'login', 'User Sample Student logged in', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:17:08', '2026-02-26 17:17:08'),
(133, 8, 'login', 'User VICTOR SANTOS logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:17:26', '2026-02-26 17:17:26'),
(134, 8, 'document_deleted', 'Document deleted: fgdgdf', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:17:39', '2026-02-26 17:17:39'),
(135, 8, 'document_deleted', 'Document deleted: ssdsd', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:17:42', '2026-02-26 17:17:42'),
(136, 8, 'document_deleted', 'Document deleted: it cap', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:17:45', '2026-02-26 17:17:45'),
(137, 8, 'document_deleted', 'Document deleted: xxx', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:17:47', '2026-02-26 17:17:47'),
(138, 8, 'document_deleted', 'Document deleted: capstone', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:17:50', '2026-02-26 17:17:50'),
(139, 8, 'document_deleted', 'Document deleted: caps', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:17:53', '2026-02-26 17:17:53'),
(140, 8, 'document_created', 'Document created: capstone 1', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:23:34', '2026-02-26 17:23:34'),
(141, 8, 'document_deleted', 'Document deleted: capstone 1', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:28:36', '2026-02-26 17:28:36'),
(142, 8, 'document_created', 'Document created: capstone', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:41:41', '2026-02-26 17:41:41'),
(143, 8, 'document_deleted', 'Document deleted: capstone', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:42:53', '2026-02-26 17:42:53'),
(144, 8, 'document_created', 'Document created: capstone', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:43:23', '2026-02-26 17:43:23'),
(145, 8, 'document_updated', 'Document updated: capstone - changes: {\"updated_by\":8,\"notify\":[{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on capstone\",\"document_id\":27,\"title\":\"capstone\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/27\",\"assigned_by\":8}},{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on capstone\",\"document_id\":27,\"title\":\"capstone\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/27\",\"assigned_by\":8}}]}', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:46:21', '2026-02-26 17:46:21'),
(146, 8, 'document_deleted', 'Document deleted: capstone', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:46:31', '2026-02-26 17:46:31'),
(147, 8, 'document_created', 'Document created: cap', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:47:39', '2026-02-26 17:47:39'),
(148, 8, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":8,\"notify\":[]}', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:48:25', '2026-02-26 17:48:25'),
(149, 8, 'document_created', 'Document created: cap', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:52:28', '2026-02-26 17:52:28'),
(150, 8, 'document_updated', 'Document updated: cap - changes: {\"updated_by\":8,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on cap\",\"document_id\":29,\"title\":\"cap\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/29\",\"assigned_by\":8}}]}', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:52:44', '2026-02-26 17:52:44'),
(151, 6, 'login', 'User Jim-mar De los Reyes logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:53:00', '2026-02-26 17:53:00'),
(152, 6, 'document_updated', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":8,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed reject on cap\",\"document_id\":29,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/29\"}}]}', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 17:53:12', '2026-02-26 17:53:12');
INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `details`, `college`, `program`, `ip`, `user_agent`, `created_at`, `updated_at`) VALUES
(153, 6, 'document_created', 'Document created: sample', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 18:10:01', '2026-02-26 18:10:01'),
(154, 6, 'document_deleted', 'Document deleted: sample', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 18:18:10', '2026-02-26 18:18:10'),
(155, 6, 'document_created', 'Document created: aa', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 18:18:37', '2026-02-26 18:18:37'),
(156, 6, 'document_deleted', 'Document deleted: aa', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 18:44:26', '2026-02-26 18:44:26'),
(157, 6, 'document_created', 'Document created: sample', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 18:44:56', '2026-02-26 18:44:56'),
(158, 6, 'document_deleted', 'Document deleted: sample', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 18:48:35', '2026-02-26 18:48:35'),
(159, 6, 'document_created', 'Document created: sample', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 18:48:56', '2026-02-26 18:48:56'),
(160, 6, 'document_deleted', 'Document deleted: sample', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:13:12', '2026-02-26 19:13:12'),
(161, 1, 'login', 'User Super Admin logged in', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:17:14', '2026-02-26 19:17:14'),
(162, 1, 'document_updated', 'Document updated: formatting_queued - changes: {\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":34,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/34\"}}]}', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:22:58', '2026-02-26 19:22:58'),
(163, 1, 'document_created', 'Document created: aaaa', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:22:58', '2026-02-26 19:22:58'),
(164, 1, 'document_deleted', 'Document deleted: aaaa', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:23:12', '2026-02-26 19:23:12'),
(165, 1, 'document_updated', 'Document updated: formatting_queued - changes: {\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":35,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/35\"}}]}', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:25:24', '2026-02-26 19:25:24'),
(166, 1, 'document_created', 'Document created: aaaaa', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:25:24', '2026-02-26 19:25:24'),
(167, 1, 'document_updated', 'Document updated: formatting_queued - changes: {\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":36,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/36\"}}]}', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:32:36', '2026-02-26 19:32:36'),
(168, 1, 'document_created', 'Document created: dddd', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-02-26 19:32:36', '2026-02-26 19:32:36');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-illuminate:queue:restart', 'i:1772163178;', 2087523178);

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
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(2, 'College of Arts & Sciences', 'CAS', NULL, '2026-02-15 19:47:26', '2026-02-15 19:47:26'),
(4, 'College of Education', 'COE', NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(5, 'College of Business Management and Entrepreneurship', 'CBME', NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21');

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
(27, 29, 6, '', 'reject', '2026-02-26 17:53:12', '2026-02-26 17:53:12');

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
  `format_font` varchar(255) DEFAULT NULL,
  `line_spacing` varchar(255) DEFAULT NULL,
  `margin_preset` varchar(255) DEFAULT NULL,
  `margin_top` decimal(5,2) DEFAULT NULL,
  `margin_bottom` decimal(5,2) DEFAULT NULL,
  `margin_left` decimal(5,2) DEFAULT NULL,
  `margin_right` decimal(5,2) DEFAULT NULL,
  `citation_style` varchar(255) DEFAULT NULL,
  `template_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `title`, `description`, `file_path`, `file_type`, `format_font`, `line_spacing`, `margin_preset`, `margin_top`, `margin_bottom`, `margin_left`, `margin_right`, `citation_style`, `template_id`, `document_type_id`, `user_id`, `college`, `program`, `status`, `created_at`, `updated_at`) VALUES
(29, 'cap', NULL, 'XNpia103ujHVrMTGoaPHvJpq5FST2bf97qkU8QHI.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 8, 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', 'reviews_done', '2026-02-26 17:52:28', '2026-02-26 17:53:12'),
(35, 'aaaaa', NULL, 'OpQNxS161BpTm9lWuCRcRHspNxxZ7TBSsKluBQTU.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, 1, 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', 'formatting_processing', '2026-02-26 19:25:24', '2026-02-26 19:31:54'),
(36, 'dddd', NULL, 'VL2tb4CLg3JuyZM6XvWHcPZi5d7mBAzeOzGhW6Ls.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 7, 1, 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', 'formatting_processing', '2026-02-26 19:32:36', '2026-02-26 19:32:37');

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
(12, 5, 'Faculty', 'User', NULL, NULL, '2026-02-18 18:47:35', '2026-02-18 18:47:35'),
(13, 8, 'VICTOR', 'SANTOS', NULL, NULL, '2026-02-24 18:23:30', '2026-02-24 18:23:30'),
(14, 4, 'Program', 'Head', NULL, NULL, '2026-02-26 18:10:01', '2026-02-26 18:10:01');

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
(32, 29, 13, 'Primary', '2026-02-26 17:52:28', '2026-02-26 17:52:28'),
(38, 35, 10, 'Primary', '2026-02-26 19:25:24', '2026-02-26 19:25:24'),
(39, 36, 10, 'Primary', '2026-02-26 19:32:36', '2026-02-26 19:32:36');

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
(14, 29, 6, '2026-02-26 17:52:44', '2026-02-26 17:52:44');

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
(34, '2026_02_19_000001_backfill_document_statuses', 13),
(35, '2026_02_22_000000_remove_campuses_and_campus_columns', 14),
(36, '2026_02_22_000001_add_student_role_to_users', 15),
(37, '2026_02_24_000000_create_templates_table', 16),
(38, '2026_02_25_000000_add_template_id_to_documents_table', 17),
(39, '2026_02_26_000000_add_formatting_fields_to_documents_table', 18),
(40, '2026_02_26_000000_add_format_rules_to_templates_table', 19),
(41, '2026_02_27_000000_modify_documents_status_column', 20),
(42, '2026_02_27_000001_normalize_document_statuses', 21),
(43, '2026_02_27_000002_backfill_no_reviewers', 22);

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
('0cae0bb9-7bde-461d-926a-a042053bd2f5', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}', NULL, '2026-02-22 07:12:27', '2026-02-22 07:12:27'),
('0ce84ff7-e65f-46ff-9fbc-f11cb221a9d7', 'document.comment', 'App\\Models\\User', 5, '{\"document_id\":8,\"comment_by\":1}', NULL, '2026-02-18 18:49:08', '2026-02-18 18:49:08'),
('15fdbcae-9116-4d88-8816-81200c919d1f', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 00:34:35', '2026-02-18 00:34:35'),
('18b59677-516c-4926-b25d-10c86ad934bc', 'document.comment', 'App\\Models\\User', 6, '{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}', NULL, '2026-02-22 07:28:04', '2026-02-22 07:28:04'),
('1b929568-c510-48fc-9b62-1a250fbf2c75', 'document.formatting_queued', 'App\\Models\\User', 1, '{\"message\":\"Formatting has been queued for your document\",\"document_id\":35,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/35\"}', '2026-02-26 19:27:18', '2026-02-26 19:25:24', '2026-02-26 19:27:18'),
('1e602677-1ba7-4ea8-892e-cb297875e268', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:39:42', '2026-02-18 18:39:42'),
('23928675-394b-4ae1-89af-26bf1830de5b', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', '2026-02-22 06:53:30', '2026-02-18 18:42:49', '2026-02-22 06:53:30'),
('25e649f6-37d8-407f-a6e1-48aa43c1c819', 'document.comment', 'App\\Models\\User', 6, '{\"document_id\":8,\"comment_by\":1}', NULL, '2026-02-18 18:49:08', '2026-02-18 18:49:08'),
('31d42bd9-6740-476f-ae3e-75ad2597c388', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}', NULL, '2026-02-18 00:34:06', '2026-02-18 00:34:06'),
('32c8b233-3cb9-49a0-84d8-3ec32ddefd03', 'document.commenter.assigned', 'App\\Models\\User', 4, '{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}', '2026-02-22 07:12:43', '2026-02-22 07:12:27', '2026-02-22 07:12:43'),
('3aa72a0e-72a3-4e68-a9ca-d68503289bef', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}', NULL, '2026-02-18 18:47:51', '2026-02-18 18:47:51'),
('4055d7ca-d559-4e19-a43a-94085cb28f47', 'document.comment', 'App\\Models\\User', 7, '{\"message\":\"Jim-mar De los Reyes performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}', NULL, '2026-02-22 07:37:24', '2026-02-22 07:37:24'),
('44d24040-f43f-46a0-857d-9f69dd35aff0', 'document.commenter.assigned', 'App\\Models\\User', 1, '{\"message\":\"Sample Student has added you as a commentor\\/reviewer on d\",\"document_id\":17,\"title\":\"d\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\",\"assigned_by\":7}', '2026-02-22 07:27:53', '2026-02-22 07:27:35', '2026-02-22 07:27:53'),
('4cbaafd2-330b-4104-9130-cbd6e9b26b53', 'document.comment', 'App\\Models\\User', 7, '{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}', NULL, '2026-02-22 07:33:26', '2026-02-22 07:33:26'),
('50924d35-b260-46f9-8c26-2e6ec9e3e2a7', 'document.formatting_queued', 'App\\Models\\User', 1, '{\"message\":\"Formatting has been queued for your document\",\"document_id\":34,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/34\"}', '2026-02-26 19:23:32', '2026-02-26 19:22:58', '2026-02-26 19:23:32'),
('50d44d12-2172-420f-a56b-06419e8a5379', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:41:00', '2026-02-18 18:41:00'),
('5ed629b1-e179-494a-b9fc-710414ef3ef5', 'document.comment', 'App\\Models\\User', 7, '{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}', NULL, '2026-02-22 07:28:04', '2026-02-22 07:28:04'),
('7427c4fa-fa76-4c0a-a8e2-d5fb743e82f7', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"message\":\"Sample Student has added you as a commentor\\/reviewer on d\",\"document_id\":17,\"title\":\"d\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\",\"assigned_by\":7}', NULL, '2026-02-22 07:27:35', '2026-02-22 07:27:35'),
('77919e28-4588-4778-8b92-46b417d17ae1', 'document.commenter.assigned', 'App\\Models\\User', 1, '{\"document_id\":8,\"title\":\"sss\",\"assigned_by\":5}', NULL, '2026-02-18 18:47:51', '2026-02-18 18:47:51'),
('7d3eecbf-9676-40e5-b64a-91eb782b3560', 'document.comment', 'App\\Models\\User', 7, '{\"message\":\"Super Admin commented on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}', NULL, '2026-02-22 07:28:09', '2026-02-22 07:28:09'),
('7e474f50-a68f-4265-8128-d387433a4cd8', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"message\":\"Sample Student has added you as a commentor\\/reviewer on fdfgfdg\",\"document_id\":18,\"title\":\"fdfgfdg\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\",\"assigned_by\":7}', '2026-02-24 00:22:45', '2026-02-22 07:35:40', '2026-02-24 00:22:45'),
('830b9cd2-036f-4e00-ba19-b1d958a3394f', 'document.commenter.assigned', 'App\\Models\\User', 5, '{\"message\":\"Sample Student has added you as a commentor\\/reviewer on fdfgfdg\",\"document_id\":18,\"title\":\"fdfgfdg\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\",\"assigned_by\":7}', NULL, '2026-02-22 07:35:40', '2026-02-22 07:35:40'),
('87efe84e-cc37-46cf-8d54-a610428431c0', 'document.comment', 'App\\Models\\User', 7, '{\"message\":\"Faculty User performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}', NULL, '2026-02-22 07:39:17', '2026-02-22 07:39:17'),
('8b51c4e2-8dad-40b9-b651-9782b0cfa4b7', 'document.comment', 'App\\Models\\User', 6, '{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}', NULL, '2026-02-22 07:33:26', '2026-02-22 07:33:26'),
('8dad4d51-1f37-43d9-9a1d-fc6c01dbee25', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on caps\",\"document_id\":19,\"title\":\"caps\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/19\",\"assigned_by\":8}', NULL, '2026-02-24 18:26:12', '2026-02-24 18:26:12'),
('8fa05a7a-35b7-4e6c-87de-cf9090f9f9ed', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 00:34:45', '2026-02-18 00:34:45'),
('952131a3-7094-472a-b54b-c67ba1068426', 'document.comment', 'App\\Models\\User', 6, '{\"message\":\"Super Admin commented on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}', NULL, '2026-02-22 07:28:09', '2026-02-22 07:28:09'),
('9bb34cd5-7e3f-4d58-9af5-836e8df285ad', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on capstone\",\"document_id\":27,\"title\":\"capstone\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/27\",\"assigned_by\":8}', NULL, '2026-02-26 17:46:22', '2026-02-26 17:46:22'),
('a0e00d2d-a44a-4297-95d3-d738b5a89a84', 'document.comment', 'App\\Models\\User', 8, '{\"message\":\"Jim-mar De los Reyes performed reject on cap\",\"document_id\":29,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/29\"}', NULL, '2026-02-26 17:53:12', '2026-02-26 17:53:12'),
('a1e8e4bc-b966-4d09-a312-7e01032810db', 'document.commenter.assigned', 'App\\Models\\User', 5, '{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}', '2026-02-22 06:58:37', '2026-02-22 06:57:46', '2026-02-22 06:58:37'),
('a6b81426-4ef7-48d5-9238-ac2161b5dd06', 'document.comment', 'App\\Models\\User', 5, '{\"document_id\":8,\"comment_by\":6}', NULL, '2026-02-18 18:54:43', '2026-02-18 18:54:43'),
('b6012543-e76a-4be9-aed4-3d97c7e4a5d2', 'document.editor.assigned', 'App\\Models\\User', 6, '{\"document_id\":5,\"title\":\"Sample\",\"assigned_by\":1}', NULL, '2026-02-17 20:15:17', '2026-02-17 20:15:17'),
('c05228c9-4ce2-4c52-b85c-d66d44705b4c', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":8,\"comment_by\":6}', '2026-02-22 06:48:33', '2026-02-18 18:54:43', '2026-02-22 06:48:33'),
('c0b0af56-12f5-43a5-919a-f931dfe147eb', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:41:16', '2026-02-18 18:41:16'),
('cad7b640-191b-412c-a548-1150dba07601', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:40:53', '2026-02-18 18:40:53'),
('cf5e02b9-02db-4af8-81ba-47640d7ed232', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', NULL, '2026-02-18 18:36:15', '2026-02-18 18:36:15'),
('d9d7d3a1-7ed3-4ebc-bfb6-259bc6fcad25', 'document.comment', 'App\\Models\\User', 7, '{\"message\":\"Super Admin performed reject on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}', NULL, '2026-02-22 07:34:03', '2026-02-22 07:34:03'),
('df95a407-2902-4226-a389-4d58061ea101', 'document.comment', 'App\\Models\\User', 7, '{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}', '2026-02-22 07:28:44', '2026-02-22 07:28:17', '2026-02-22 07:28:44'),
('e1aa89b1-bfd5-419c-ac0b-ae93e8ec3cfd', 'document.comment', 'App\\Models\\User', 4, '{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}', NULL, '2026-02-22 07:33:26', '2026-02-22 07:33:26'),
('e605d4ea-3fa9-4985-8159-3dec427d5ca2', 'document.comment', 'App\\Models\\User', 5, '{\"message\":\"Jim-mar De los Reyes performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}', NULL, '2026-02-22 07:37:24', '2026-02-22 07:37:24'),
('e9f45d44-8a89-4738-b601-4ebe51127edf', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', '2026-02-22 06:48:37', '2026-02-18 18:42:57', '2026-02-22 06:48:37'),
('ed824639-6a24-42c2-951a-7a7f6e000629', 'document.comment', 'App\\Models\\User', 6, '{\"message\":\"Super Admin performed reject on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}', NULL, '2026-02-22 07:34:03', '2026-02-22 07:34:03'),
('eddff2e7-1fe1-446e-9c27-cfe2871814de', 'document.commenter.assigned', 'App\\Models\\User', 6, '{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on cap\",\"document_id\":29,\"title\":\"cap\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/29\",\"assigned_by\":8}', NULL, '2026-02-26 17:52:44', '2026-02-26 17:52:44'),
('eeea34be-0a12-43b7-8cb0-a3a51113e8b4', 'document.commenter.assigned', 'App\\Models\\User', 1, '{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on capstone\",\"document_id\":27,\"title\":\"capstone\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/27\",\"assigned_by\":8}', NULL, '2026-02-26 17:46:22', '2026-02-26 17:46:22'),
('f11d7477-f255-4c43-9557-0fc68248b5b1', 'document.comment', 'App\\Models\\User', 6, '{\"message\":\"Faculty User performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}', NULL, '2026-02-22 07:39:17', '2026-02-22 07:39:17'),
('f88c806b-651f-4677-be97-4d5293ea8011', 'document.formatting_queued', 'App\\Models\\User', 1, '{\"message\":\"Formatting has been queued for your document\",\"document_id\":36,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/36\"}', NULL, '2026-02-26 19:32:36', '2026-02-26 19:32:36'),
('fa575503-1f69-4209-80ab-45a02a064ca9', 'document.comment', 'App\\Models\\User', 6, '{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}', NULL, '2026-02-22 07:28:17', '2026-02-22 07:28:17'),
('fe72cd6a-24fa-464a-8c61-7491ec62a985', 'document.comment', 'App\\Models\\User', 1, '{\"document_id\":5,\"comment_by\":6}', '2026-02-22 06:48:39', '2026-02-18 18:40:44', '2026-02-22 06:48:39');

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
(5, 'Bachelor of Elementary Education', 'BEED', 4, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(6, 'Bachelor of Secondary Education', 'BSED', 4, NULL, '2026-02-18 19:23:21', '2026-02-18 19:23:21'),
(7, 'Bachelor of Physical Education', 'BPED', 4, NULL, '2026-02-22 05:59:25', '2026-02-22 05:59:25'),
(8, 'Bachelor of Science in Business Administration', 'BSBA', 5, NULL, '2026-02-22 05:59:25', '2026-02-22 05:59:25'),
(9, 'Bachelor of Science in Entrepreneurship', 'BSENT', 5, NULL, '2026-02-22 05:59:25', '2026-02-22 05:59:25'),
(10, 'Bachelor of Arts in English Language', 'BAEL', 2, NULL, '2026-02-22 05:59:25', '2026-02-22 05:59:25'),
(11, 'Bachelor of Arts in Psychology', 'BAP', 2, NULL, '2026-02-22 05:59:25', '2026-02-22 05:59:25'),
(12, 'Bachelor of Arts in Social Science', 'BASS', 2, NULL, '2026-02-22 05:59:25', '2026-02-22 05:59:25'),
(13, 'Bachelor of Science in Information Technology', 'BSIT', 2, NULL, '2026-02-22 05:59:25', '2026-02-22 05:59:25'),
(14, 'Bachelor of Science in Public Administration', 'BPA', 2, NULL, '2026-02-22 05:59:25', '2026-02-22 05:59:25');

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
(5, 'Instructor', NULL, NULL),
(17, 'Student', NULL, NULL);

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
('Png2k0Pm2DVwhV5kDBvV7xDciYYeqDJWh4A7oaR4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMDExaXFvUXlvbkZxTFlVa2VZODhuTW9GbDBjMkxwaVJUWEFOVHEwbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6OToiZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1772163183);

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
(71, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-18 20:56:54', '2026-02-18 20:56:54'),
(72, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-22 06:03:41', '2026-02-22 06:03:41'),
(73, 7, 'auth', 'login', 'User', 7, NULL, '{\"email\":\"student@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from student@example.com', 'low', '2026-02-22 06:54:05', '2026-02-22 06:54:05'),
(74, 7, 'document', 'create', 'Document', 16, NULL, '{\"title\":\"lll\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: lll', 'low', '2026-02-22 06:55:13', '2026-02-22 06:55:13'),
(75, 7, 'document', 'update', 'Document', 16, NULL, '{\"updated_by\":7,\"notify\":[{\"user_id\":\"5\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: lll - changes: {\"updated_by\":7,\"notify\":[{\"user_id\":\"5\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}}]}', 'low', '2026-02-22 06:57:46', '2026-02-22 06:57:46'),
(76, 7, 'document', 'update', 'Document', 16, NULL, '{\"updated_by\":7,\"notify\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: lll - changes: {\"updated_by\":7,\"notify\":[]}', 'low', '2026-02-22 06:57:51', '2026-02-22 06:57:51'),
(77, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-22 06:58:32', '2026-02-22 06:58:32'),
(78, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-22 07:11:48', '2026-02-22 07:11:48'),
(79, 7, 'auth', 'login', 'User', 7, NULL, '{\"email\":\"student@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from student@example.com', 'low', '2026-02-22 07:12:01', '2026-02-22 07:12:01'),
(80, 7, 'document', 'update', 'Document', 16, NULL, '{\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}},{\"user_id\":\"4\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: lll - changes: {\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}},{\"user_id\":\"4\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on lll\",\"document_id\":16,\"title\":\"lll\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\",\"assigned_by\":7}}]}', 'low', '2026-02-22 07:12:27', '2026-02-22 07:12:27'),
(81, 4, 'auth', 'login', 'User', 4, NULL, '{\"email\":\"program_head_bsit@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from program_head_bsit@docutrack.local', 'low', '2026-02-22 07:12:35', '2026-02-22 07:12:35'),
(82, 4, 'auth', 'login', 'User', 4, NULL, '{\"email\":\"program_head_bsit@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from program_head_bsit@docutrack.local', 'low', '2026-02-22 07:16:03', '2026-02-22 07:16:03'),
(83, 7, 'auth', 'login', 'User', 7, NULL, '{\"email\":\"student@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from student@example.com', 'low', '2026-02-22 07:26:19', '2026-02-22 07:26:19'),
(84, 7, 'document', 'create', 'Document', 17, NULL, '{\"title\":\"d\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: d', 'low', '2026-02-22 07:26:48', '2026-02-22 07:26:48'),
(85, 7, 'auth', 'login', 'User', 7, NULL, '{\"email\":\"student@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from student@example.com', 'low', '2026-02-22 07:27:08', '2026-02-22 07:27:08'),
(86, 7, 'document', 'update', 'Document', 17, NULL, '{\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on d\",\"document_id\":17,\"title\":\"d\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\",\"assigned_by\":7}},{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on d\",\"document_id\":17,\"title\":\"d\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\",\"assigned_by\":7}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: d - changes: {\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on d\",\"document_id\":17,\"title\":\"d\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\",\"assigned_by\":7}},{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on d\",\"document_id\":17,\"title\":\"d\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\",\"assigned_by\":7}}]}', 'low', '2026-02-22 07:27:35', '2026-02-22 07:27:35'),
(87, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-22 07:27:50', '2026-02-22 07:27:50'),
(88, 1, 'document', 'update', 'Document', 17, NULL, '{\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', 'low', '2026-02-22 07:28:04', '2026-02-22 07:28:04'),
(89, 1, 'document', 'update', 'Document', 17, NULL, '{\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin commented on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin commented on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin commented on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin commented on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', 'low', '2026-02-22 07:28:09', '2026-02-22 07:28:09'),
(90, 1, 'document', 'update', 'Document', 17, NULL, '{\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed approve on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', 'low', '2026-02-22 07:28:17', '2026-02-22 07:28:17'),
(91, 7, 'auth', 'login', 'User', 7, NULL, '{\"email\":\"student@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from student@example.com', 'low', '2026-02-22 07:28:37', '2026-02-22 07:28:37'),
(92, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-22 07:30:02', '2026-02-22 07:30:02'),
(93, 5, 'document', 'update', 'Document', 16, NULL, '{\"user_id\":5,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}},{\"user_id\":4,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":5,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}},{\"user_id\":4,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on lll\",\"document_id\":16,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/16\"}}]}', 'low', '2026-02-22 07:33:26', '2026-02-22 07:33:26'),
(94, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-22 07:33:40', '2026-02-22 07:33:40'),
(95, 1, 'document', 'update', 'Document', 17, NULL, '{\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed reject on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed reject on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":1,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed reject on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Super Admin performed reject on d\",\"document_id\":17,\"comment_by\":1,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/17\"}}]}', 'low', '2026-02-22 07:34:03', '2026-02-22 07:34:03'),
(96, 7, 'auth', 'login', 'User', 7, NULL, '{\"email\":\"student@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from student@example.com', 'low', '2026-02-22 07:34:17', '2026-02-22 07:34:17'),
(97, 7, 'document', 'create', 'Document', 18, NULL, '{\"title\":\"fdfgfdg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: fdfgfdg', 'low', '2026-02-22 07:34:37', '2026-02-22 07:34:37'),
(98, 7, 'document', 'update', 'Document', 18, NULL, '{\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on fdfgfdg\",\"document_id\":18,\"title\":\"fdfgfdg\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\",\"assigned_by\":7}},{\"user_id\":\"5\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on fdfgfdg\",\"document_id\":18,\"title\":\"fdfgfdg\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\",\"assigned_by\":7}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: fdfgfdg - changes: {\"updated_by\":7,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on fdfgfdg\",\"document_id\":18,\"title\":\"fdfgfdg\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\",\"assigned_by\":7}},{\"user_id\":\"5\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"Sample Student has added you as a commentor\\/reviewer on fdfgfdg\",\"document_id\":18,\"title\":\"fdfgfdg\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\",\"assigned_by\":7}}]}', 'low', '2026-02-22 07:35:40', '2026-02-22 07:35:40'),
(99, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-22 07:37:14', '2026-02-22 07:37:14'),
(100, 6, 'document', 'update', 'Document', 18, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}},{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}},{\"user_id\":5,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}}]}', 'low', '2026-02-22 07:37:24', '2026-02-22 07:37:24'),
(101, 7, 'auth', 'login', 'User', 7, NULL, '{\"email\":\"student@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from student@example.com', 'low', '2026-02-22 07:37:35', '2026-02-22 07:37:35'),
(102, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-22 07:39:10', '2026-02-22 07:39:10'),
(103, 5, 'document', 'update', 'Document', 18, NULL, '{\"user_id\":5,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":5,\"notify\":[{\"user_id\":7,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}},{\"user_id\":6,\"type\":\"document.comment\",\"data\":{\"message\":\"Faculty User performed approve on fdfgfdg\",\"document_id\":18,\"comment_by\":5,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/18\"}}]}', 'low', '2026-02-22 07:39:17', '2026-02-22 07:39:17'),
(104, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-24 00:05:46', '2026-02-24 00:05:46'),
(105, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-24 00:14:19', '2026-02-24 00:14:19'),
(106, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-24 17:35:17', '2026-02-24 17:35:17'),
(107, 8, 'user', 'create', 'User', NULL, NULL, '{\"email\":\"vsantos@gmail.com\",\"name\":\"VICTOR SANTOS\",\"role\":\"student\",\"campus\":\"ISPSC Tagudin\",\"college\":\"College of Arts & Sciences\",\"program\":\"Bachelor of Science in Information Technology\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'New user registered: vsantos@gmail.com', 'medium', '2026-02-24 18:02:18', '2026-02-24 18:02:18'),
(108, 9, 'user', 'create', 'User', NULL, NULL, '{\"email\":\"thorsantos@gmail.com\",\"name\":\"jj jj\",\"role\":\"program_head\",\"campus\":\"ISPSC Tagudin\",\"college\":\"College of Arts & Sciences\",\"program\":\"Bachelor of Science in Public Administration\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'New user registered: thorsantos@gmail.com', 'medium', '2026-02-24 18:16:51', '2026-02-24 18:16:51'),
(109, 8, 'auth', 'login', 'User', 8, NULL, '{\"email\":\"vsantos@gmail.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from vsantos@gmail.com', 'low', '2026-02-24 18:17:44', '2026-02-24 18:17:44'),
(110, 8, 'document', 'create', 'Document', 19, NULL, '{\"title\":\"caps\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: caps', 'low', '2026-02-24 18:23:30', '2026-02-24 18:23:30'),
(111, 8, 'document', 'update', 'Document', 19, NULL, '{\"updated_by\":8,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on caps\",\"document_id\":19,\"title\":\"caps\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/19\",\"assigned_by\":8}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: caps - changes: {\"updated_by\":8,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on caps\",\"document_id\":19,\"title\":\"caps\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/19\",\"assigned_by\":8}}]}', 'low', '2026-02-24 18:26:10', '2026-02-24 18:26:10'),
(112, 8, 'document', 'create', 'Document', 20, NULL, '{\"title\":\"capstone\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: capstone', 'low', '2026-02-24 18:28:59', '2026-02-24 18:28:59');
INSERT INTO `system_logs` (`id`, `user_id`, `event_type`, `action`, `model_type`, `model_id`, `old_values`, `new_values`, `ip_address`, `user_agent`, `description`, `severity`, `created_at`, `updated_at`) VALUES
(113, 9, 'auth', 'login', 'User', 9, NULL, '{\"email\":\"thorsantos@gmail.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from thorsantos@gmail.com', 'low', '2026-02-24 18:45:03', '2026-02-24 18:45:03'),
(114, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-24 18:45:20', '2026-02-24 18:45:20'),
(115, 8, 'auth', 'login', 'User', 8, NULL, '{\"email\":\"vsantos@gmail.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from vsantos@gmail.com', 'low', '2026-02-24 18:45:55', '2026-02-24 18:45:55'),
(116, 8, 'document', 'create', 'Document', 21, NULL, '{\"title\":\"it cap\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: it cap', 'low', '2026-02-24 18:46:49', '2026-02-24 18:46:49'),
(117, 8, 'document', 'create', 'Document', 22, NULL, '{\"title\":\"xxx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: xxx', 'low', '2026-02-24 18:48:23', '2026-02-24 18:48:23'),
(118, 8, 'document', 'create', 'Document', 23, NULL, '{\"title\":\"ssdsd\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: ssdsd', 'low', '2026-02-24 18:59:20', '2026-02-24 18:59:20'),
(119, 8, 'document', 'create', 'Document', 24, NULL, '{\"title\":\"fgdgdf\"}', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', 'Document created: fgdgdf', 'low', '2026-02-24 19:01:17', '2026-02-24 19:01:17'),
(120, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:08:22', '2026-02-24 19:08:22'),
(121, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:13:50', '2026-02-24 19:13:50'),
(122, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:20:18', '2026-02-24 19:20:18'),
(123, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:31:12', '2026-02-24 19:31:12'),
(124, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:39:43', '2026-02-24 19:39:43'),
(125, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:43:12', '2026-02-24 19:43:12'),
(126, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:53:18', '2026-02-24 19:53:18'),
(127, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:56:23', '2026-02-24 19:56:23'),
(128, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:58:11', '2026-02-24 19:58:11'),
(129, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 19:58:28', '2026-02-24 19:58:28'),
(130, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\",\"Template does not define footer content; cannot validate footer.\"],\"details\":{\"header\":{\"template\":\"059690ILOCOS SUR POLYTECHNIC STATE COLLEGETagudin Campus, Tagudin, Ilocos SurILOCOS SUR POLYTECHNIC STATE COLLEGETagudin Campus, Tagudin, Ilocos Sur PAGE \\\\* MERGEFORMAT 2\",\"uploaded\":\"059690ILOCOS SUR POLYTECHNIC STATE COLLEGETagudin Campus, Tagudin, Ilocos SurILOCOS SUR POLYTECHNIC STATE COLLEGETagudin Campus, Tagudin, Ilocos Sur PAGE \\\\* MERGEFORMAT 2\",\"match\":true}}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 21:01:12', '2026-02-24 21:01:12'),
(131, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-24 21:51:06', '2026-02-24 21:51:06'),
(132, 8, 'auth', 'login', 'User', 8, NULL, '{\"email\":\"vsantos@gmail.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from vsantos@gmail.com', 'low', '2026-02-25 18:23:27', '2026-02-25 18:23:27'),
(133, 8, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":8,\"template_id\":1,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-25 18:49:06', '2026-02-25 18:49:06'),
(134, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-25 19:18:39', '2026-02-25 19:18:39'),
(135, 1, 'document', 'validation_fail', 'Template', NULL, NULL, '{\"user_id\":1,\"template_id\":3,\"errors\":[\"Template missing page margin information (sectPr\\/pgMar).\",\"Uploaded document missing page margin information (sectPr\\/pgMar).\",\"Template does not define a Normal style.\",\"Uploaded document does not define a Normal style.\",\"Template does not define a Heading1 style.\",\"Uploaded document does not define a Heading1 style.\"],\"details\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Template validation failed', 'medium', '2026-02-25 19:24:35', '2026-02-25 19:24:35'),
(136, 5, 'auth', 'login', 'User', 5, NULL, '{\"email\":\"faculty@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from faculty@example.com', 'low', '2026-02-26 16:46:54', '2026-02-26 16:46:54'),
(137, 8, 'auth', 'login', 'User', 8, NULL, '{\"email\":\"vsantos@gmail.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from vsantos@gmail.com', 'low', '2026-02-26 16:47:29', '2026-02-26 16:47:29'),
(138, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-26 16:48:05', '2026-02-26 16:48:05'),
(139, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-26 16:57:35', '2026-02-26 16:57:35'),
(140, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-26 17:11:52', '2026-02-26 17:11:52'),
(141, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-26 17:12:29', '2026-02-26 17:12:29'),
(142, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-26 17:14:06', '2026-02-26 17:14:06'),
(143, 7, 'auth', 'login', 'User', 7, NULL, '{\"email\":\"student@example.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from student@example.com', 'low', '2026-02-26 17:17:08', '2026-02-26 17:17:08'),
(144, 8, 'auth', 'login', 'User', 8, NULL, '{\"email\":\"vsantos@gmail.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from vsantos@gmail.com', 'low', '2026-02-26 17:17:26', '2026-02-26 17:17:26'),
(145, 8, 'document', 'delete', 'Document', 24, '{\"title\":\"fgdgdf\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: fgdgdf', 'high', '2026-02-26 17:17:39', '2026-02-26 17:17:39'),
(146, 8, 'document', 'delete', 'Document', 23, '{\"title\":\"ssdsd\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: ssdsd', 'high', '2026-02-26 17:17:42', '2026-02-26 17:17:42'),
(147, 8, 'document', 'delete', 'Document', 21, '{\"title\":\"it cap\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: it cap', 'high', '2026-02-26 17:17:45', '2026-02-26 17:17:45'),
(148, 8, 'document', 'delete', 'Document', 22, '{\"title\":\"xxx\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: xxx', 'high', '2026-02-26 17:17:47', '2026-02-26 17:17:47'),
(149, 8, 'document', 'delete', 'Document', 20, '{\"title\":\"capstone\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: capstone', 'high', '2026-02-26 17:17:50', '2026-02-26 17:17:50'),
(150, 8, 'document', 'delete', 'Document', 19, '{\"title\":\"caps\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: caps', 'high', '2026-02-26 17:17:53', '2026-02-26 17:17:53'),
(151, 8, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":8,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/7FIl2gdhR2Tnpeu9aQWs284in3lC7EoBCmAIAZK2.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 17:18:27', '2026-02-26 17:18:27'),
(152, 8, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":8,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/QgYYEom47GlLdCgB09zodSvv1nGh4WNUC3bjZgee.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 17:23:34', '2026-02-26 17:23:34'),
(153, 8, 'document', 'create', 'Document', 25, NULL, '{\"title\":\"capstone 1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: capstone 1', 'low', '2026-02-26 17:23:34', '2026-02-26 17:23:34'),
(154, 8, 'document', 'delete', 'Document', 25, '{\"title\":\"capstone 1\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: capstone 1', 'high', '2026-02-26 17:28:36', '2026-02-26 17:28:36'),
(155, 8, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":8,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/n4C8fqnJ82ir6YoT5fykPU2GzjdpnMaY4qv6iJdf.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 17:41:41', '2026-02-26 17:41:41'),
(156, 8, 'document', 'create', 'Document', 26, NULL, '{\"title\":\"capstone\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: capstone', 'low', '2026-02-26 17:41:41', '2026-02-26 17:41:41'),
(157, 8, 'document', 'delete', 'Document', 26, '{\"title\":\"capstone\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: capstone', 'high', '2026-02-26 17:42:53', '2026-02-26 17:42:53'),
(158, 8, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":8,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/hNmY3p0JU5UKhGnn4sgvPI7CPOlYpoX9UrioUjAS.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 17:43:23', '2026-02-26 17:43:23'),
(159, 8, 'document', 'create', 'Document', 27, NULL, '{\"title\":\"capstone\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: capstone', 'low', '2026-02-26 17:43:23', '2026-02-26 17:43:23'),
(160, 8, 'document', 'update', 'Document', 27, NULL, '{\"updated_by\":8,\"notify\":[{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on capstone\",\"document_id\":27,\"title\":\"capstone\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/27\",\"assigned_by\":8}},{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on capstone\",\"document_id\":27,\"title\":\"capstone\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/27\",\"assigned_by\":8}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: capstone - changes: {\"updated_by\":8,\"notify\":[{\"user_id\":\"1\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on capstone\",\"document_id\":27,\"title\":\"capstone\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/27\",\"assigned_by\":8}},{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on capstone\",\"document_id\":27,\"title\":\"capstone\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/27\",\"assigned_by\":8}}]}', 'low', '2026-02-26 17:46:21', '2026-02-26 17:46:21'),
(161, 8, 'document', 'delete', 'Document', 27, '{\"title\":\"capstone\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: capstone', 'high', '2026-02-26 17:46:31', '2026-02-26 17:46:31'),
(162, 8, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":8,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/Kqfq1QzhrCwdyC8G5tjVmiT35aJMLv5IXIkmZR4p.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 17:47:39', '2026-02-26 17:47:39'),
(163, 8, 'document', 'create', 'Document', 28, NULL, '{\"title\":\"cap\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: cap', 'low', '2026-02-26 17:47:39', '2026-02-26 17:47:39'),
(164, 8, 'document', 'update', 'Document', 28, NULL, '{\"user_id\":8,\"notify\":[]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":8,\"notify\":[]}', 'low', '2026-02-26 17:48:25', '2026-02-26 17:48:25'),
(165, 8, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":8,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/XNpia103ujHVrMTGoaPHvJpq5FST2bf97qkU8QHI.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 17:52:28', '2026-02-26 17:52:28'),
(166, 8, 'document', 'create', 'Document', 29, NULL, '{\"title\":\"cap\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: cap', 'low', '2026-02-26 17:52:28', '2026-02-26 17:52:28'),
(167, 8, 'document', 'update', 'Document', 29, NULL, '{\"updated_by\":8,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on cap\",\"document_id\":29,\"title\":\"cap\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/29\",\"assigned_by\":8}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: cap - changes: {\"updated_by\":8,\"notify\":[{\"user_id\":\"6\",\"type\":\"document.commenter.assigned\",\"data\":{\"message\":\"VICTOR SANTOS has added you as a commentor\\/reviewer on cap\",\"document_id\":29,\"title\":\"cap\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/29\",\"assigned_by\":8}}]}', 'low', '2026-02-26 17:52:44', '2026-02-26 17:52:44'),
(168, 6, 'auth', 'login', 'User', 6, NULL, '{\"email\":\"delosreyesjimmar@ispsc.edu.ph\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from delosreyesjimmar@ispsc.edu.ph', 'low', '2026-02-26 17:53:00', '2026-02-26 17:53:00'),
(169, 6, 'document', 'update', 'Document', 29, NULL, '{\"user_id\":6,\"notify\":[{\"user_id\":8,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed reject on cap\",\"document_id\":29,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/29\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: comment_posted - changes: {\"user_id\":6,\"notify\":[{\"user_id\":8,\"type\":\"document.comment\",\"data\":{\"message\":\"Jim-mar De los Reyes performed reject on cap\",\"document_id\":29,\"comment_by\":6,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/29\"}}]}', 'low', '2026-02-26 17:53:12', '2026-02-26 17:53:12'),
(170, 6, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":6,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/wqmT193CrChL50W6SCXZhyzqc8twYlwkvlond7Rv.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 18:10:01', '2026-02-26 18:10:01'),
(171, 6, 'document', 'create', 'Document', 30, NULL, '{\"title\":\"sample\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: sample', 'low', '2026-02-26 18:10:01', '2026-02-26 18:10:01'),
(172, 6, 'document', 'delete', 'Document', 30, '{\"title\":\"sample\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: sample', 'high', '2026-02-26 18:18:10', '2026-02-26 18:18:10'),
(173, 6, 'document', 'format_backup', 'FormattingEngine', NULL, NULL, '{\"user_id\":6,\"backup_path\":\"C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/backups\\/1772158717-gdztnBTKfaNncmDUqx38uHfuo4sjX10tzcGjLh9l.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Backup created before formatting', 'low', '2026-02-26 18:18:37', '2026-02-26 18:18:37'),
(174, 6, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":6,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/gdztnBTKfaNncmDUqx38uHfuo4sjX10tzcGjLh9l.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 18:18:37', '2026-02-26 18:18:37'),
(175, 6, 'document', 'create', 'Document', 31, NULL, '{\"title\":\"aa\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: aa', 'low', '2026-02-26 18:18:37', '2026-02-26 18:18:37'),
(176, 6, 'document', 'delete', 'Document', 31, '{\"title\":\"aa\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: aa', 'high', '2026-02-26 18:44:26', '2026-02-26 18:44:26'),
(177, 6, 'document', 'format_backup', 'FormattingEngine', NULL, NULL, '{\"user_id\":6,\"backup_path\":\"C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/backups\\/1772160296-6HiIv5cgssYKy4xIY2jAAvprILrqnUzQ9RufSjHs.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Backup created before formatting', 'low', '2026-02-26 18:44:56', '2026-02-26 18:44:56'),
(178, 6, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":6,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/6HiIv5cgssYKy4xIY2jAAvprILrqnUzQ9RufSjHs.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 18:44:56', '2026-02-26 18:44:56'),
(179, 6, 'document', 'create', 'Document', 32, NULL, '{\"title\":\"sample\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: sample', 'low', '2026-02-26 18:44:56', '2026-02-26 18:44:56'),
(180, 6, 'document', 'delete', 'Document', 32, '{\"title\":\"sample\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: sample', 'high', '2026-02-26 18:48:35', '2026-02-26 18:48:35'),
(181, 6, 'document', 'format_backup', 'FormattingEngine', NULL, NULL, '{\"user_id\":6,\"backup_path\":\"C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/backups\\/1772160536-0nshBqWYwLKY87r5hGQa2C1GHfWLzdDBI51Nlfwt.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Backup created before formatting', 'low', '2026-02-26 18:48:56', '2026-02-26 18:48:56'),
(182, 6, 'document', 'formatting_error', 'FormattingEngine', NULL, NULL, '{\"user_id\":6,\"exception\":\"File not found: C:\\\\Users\\\\Princess Mylene\\\\Desktop\\\\docutrack\\\\storage\\\\app\\/documents\\/0nshBqWYwLKY87r5hGQa2C1GHfWLzdDBI51Nlfwt.docx\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Formatting engine error', 'low', '2026-02-26 18:48:56', '2026-02-26 18:48:56'),
(183, 6, 'document', 'create', 'Document', 33, NULL, '{\"title\":\"sample\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: sample', 'low', '2026-02-26 18:48:56', '2026-02-26 18:48:56'),
(184, 6, 'document', 'delete', 'Document', 33, '{\"title\":\"sample\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: sample', 'high', '2026-02-26 19:13:12', '2026-02-26 19:13:12'),
(185, 1, 'auth', 'login', 'User', 1, NULL, '{\"email\":\"superadmin@docutrack.local\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'User login from superadmin@docutrack.local', 'low', '2026-02-26 19:17:14', '2026-02-26 19:17:14'),
(186, 1, 'document', 'update', 'Document', 34, NULL, '{\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":34,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/34\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: formatting_queued - changes: {\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":34,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/34\"}}]}', 'low', '2026-02-26 19:22:58', '2026-02-26 19:22:58'),
(187, 1, 'document', 'create', 'Document', 34, NULL, '{\"title\":\"aaaa\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: aaaa', 'low', '2026-02-26 19:22:58', '2026-02-26 19:22:58'),
(188, 1, 'document', 'delete', 'Document', 34, '{\"title\":\"aaaa\"}', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document deleted: aaaa', 'high', '2026-02-26 19:23:12', '2026-02-26 19:23:12'),
(189, 1, 'document', 'update', 'Document', 35, NULL, '{\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":35,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/35\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: formatting_queued - changes: {\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":35,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/35\"}}]}', 'low', '2026-02-26 19:25:24', '2026-02-26 19:25:24'),
(190, 1, 'document', 'create', 'Document', 35, NULL, '{\"title\":\"aaaaa\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: aaaaa', 'low', '2026-02-26 19:25:24', '2026-02-26 19:25:24'),
(191, NULL, 'document', 'formatting_missing_file', 'FormatDocument', NULL, NULL, '{\"document_id\":35,\"path\":\"documents\\/OpQNxS161BpTm9lWuCRcRHspNxxZ7TBSsKluBQTU.docx\"}', '127.0.0.1', 'Symfony', 'Formatting skipped: file missing', 'low', '2026-02-26 19:31:54', '2026-02-26 19:31:54'),
(192, 1, 'document', 'update', 'Document', 36, NULL, '{\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":36,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/36\"}}]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document updated: formatting_queued - changes: {\"user_id\":1,\"notify\":[{\"user_id\":1,\"type\":\"document.formatting_queued\",\"data\":{\"message\":\"Formatting has been queued for your document\",\"document_id\":36,\"url\":\"http:\\/\\/127.0.0.1:8000\\/documents\\/36\"}}]}', 'low', '2026-02-26 19:32:36', '2026-02-26 19:32:36'),
(193, 1, 'document', 'create', 'Document', 36, NULL, '{\"title\":\"dddd\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'Document created: dddd', 'low', '2026-02-26 19:32:36', '2026-02-26 19:32:36'),
(194, NULL, 'document', 'formatting_missing_file', 'FormatDocument', NULL, NULL, '{\"document_id\":36,\"path\":\"documents\\/VL2tb4CLg3JuyZM6XvWHcPZi5d7mBAzeOzGhW6Ls.docx\"}', '127.0.0.1', 'Symfony', 'Formatting skipped: file missing', 'low', '2026-02-26 19:32:37', '2026-02-26 19:32:37');

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
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `format_rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`format_rules`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `user_id`, `title`, `file_path`, `original_name`, `mime_type`, `file_size`, `college`, `program`, `format_rules`, `created_at`, `updated_at`) VALUES
(7, 6, 'IT Capstone', 'templates/vbOkSPYBEqARq2YBxmEkuudnqkPkUy3n71IB80hS.docx', 'sample doc.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 13308, 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', '{\"margins\":{\"top\":2160,\"bottom\":1440,\"left\":2160,\"right\":1440},\"normal\":{\"font\":\"Times New Roman\",\"fontSize\":24,\"line\":480,\"indent\":720},\"heading1\":{\"fontSize\":24},\"citation_style\":\"apa\"}', '2026-02-26 18:48:10', '2026-02-26 18:48:10');

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
  `role` enum('superadmin','campus_director','dean','program_head','faculty','student') DEFAULT NULL,
  `contactNumber` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
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

INSERT INTO `users` (`id`, `firstName`, `lastName`, `middleName`, `email`, `email_verified_at`, `password`, `role`, `contactNumber`, `address`, `college`, `program`, `status`, `rank`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super', 'Admin', NULL, 'superadmin@docutrack.local', NULL, '$2y$12$gnCo7lqyiWm7OnMCLF5Gte37pOqgwUs.fvLHY0TulJSfZMmBINIQa', 'superadmin', NULL, NULL, 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', 'active', NULL, 'EZSCn7u9M7apopwmXAQvftE4lzJH79clqkKLSdjc4a1Oghkpq2jG8H5G9SwQ', '2026-02-15 18:25:06', '2026-02-25 19:20:54'),
(2, 'Campus', 'Director', NULL, 'campus_director@docutrack.local', NULL, '$2y$12$jiTXCHJGCHKTlqe7YkHjj.K10VSdQWJnSOKgYpm3BUEI1Jgsx3cMC', 'campus_director', NULL, NULL, NULL, NULL, 'active', NULL, NULL, '2026-02-15 18:25:06', '2026-02-15 18:25:06'),
(3, 'CAS', 'Dean', NULL, 'dean_cas_tagudin@docutrack.local', NULL, '$2y$12$ZS8KDDWSHpuwFvTPLwlRO.VzdMDx45uYJS0tOR425fLho.Dwq3sb2', 'dean', NULL, NULL, NULL, NULL, 'active', NULL, NULL, '2026-02-15 18:25:07', '2026-02-15 18:25:07'),
(4, 'Program', 'Head', NULL, 'program_head_bsit@docutrack.local', NULL, '$2y$12$VFb5zkMlZOFpNv1202nLXOyCBJhxnI7RonEw9JgolhAPdrCYuimgi', 'program_head', NULL, NULL, NULL, NULL, 'active', NULL, '5H8JK3w3KxNsVKFuXLbYa8IZfjdXcoMZyx2p2BLXd2TIMNOJsM4fpI1JuNo8', '2026-02-15 18:25:07', '2026-02-15 18:25:07'),
(5, 'Faculty', 'User', NULL, 'faculty@example.com', NULL, '$2y$12$9R/KyIByqXfcMNFbcZJdpO.aygq6oumcBUCjG/4WzueEii/SB2nWK', 'faculty', NULL, NULL, NULL, NULL, 'active', 'Professor', 'nLTQyrGz6Q824NBDx94ZRgNLbLvQZLsIfV2txWJAtfzF8VozAhvUIx1l5NAj', '2026-02-17 18:41:39', '2026-02-17 18:41:39'),
(6, 'Jim-mar', 'De los Reyes', NULL, 'delosreyesjimmar@ispsc.edu.ph', NULL, '$2y$12$.pmZEg17lTZDYtwMHdw8Iu1dt1Ih7MDUkE2DKsBeF4V8vGGh..wOi', 'program_head', '+639111111111', 'Tagudin', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', 'active', 'Lecturer', NULL, '2026-02-17 18:50:00', '2026-02-25 19:20:19'),
(7, 'Sample', 'Student', NULL, 'student@example.com', NULL, '$2y$12$YvpaMseV4L2CBMXlwCwcr.BYP7QOTXe7lR.IOrQSW8Hwwa/AZcfgK', 'student', NULL, NULL, NULL, NULL, 'active', NULL, NULL, '2026-02-22 06:52:33', '2026-02-22 06:52:33'),
(8, 'VICTOR', 'SANTOS', NULL, 'vsantos@gmail.com', NULL, '$2y$12$FH5Ddp8jDURvlsikvDJvkemGMYDiy.FUo.0brPI.WCo99IwsT6Bni', 'student', '09123456786', 'tagudin', 'College of Arts & Sciences', 'Bachelor of Science in Information Technology', 'active', 'Student', NULL, '2026-02-24 18:02:18', '2026-02-24 18:45:41'),
(9, 'jj', 'jj', NULL, 'thorsantos@gmail.com', NULL, '$2y$12$yUwJR34Bfy7dO6dFueI11eNTYl43LHZ.0kqDTnwfK3DKC86FImJcK', 'program_head', '092753489880', 'uso', 'College of Arts & Sciences', 'Bachelor of Science in Public Administration', 'active', 'Instructor', NULL, '2026-02-24 18:16:51', '2026-02-24 18:16:51');

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
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colleges_code_unique` (`code`);

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
  ADD KEY `documents_document_type_id_foreign` (`document_type_id`),
  ADD KEY `documents_template_id_foreign` (`template_id`);

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
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templates_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `document_approvals`
--
ALTER TABLE `document_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_authors`
--
ALTER TABLE `document_authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `document_author_document`
--
ALTER TABLE `document_author_document`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `document_commenters`
--
ALTER TABLE `document_commenters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `part_contents`
--
ALTER TABLE `part_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

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
  ADD CONSTRAINT `documents_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL,
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

--
-- Constraints for table `templates`
--
ALTER TABLE `templates`
  ADD CONSTRAINT `templates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
