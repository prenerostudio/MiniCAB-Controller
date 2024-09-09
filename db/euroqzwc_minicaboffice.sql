-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 09, 2024 at 09:37 AM
-- Server version: 10.6.19-MariaDB-cll-lve
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `euroqzwc_minicaboffice`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `log_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `activity_type` varchar(535) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_type` enum('client','driver','user') NOT NULL,
  `user_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`log_id`, `activity_type`, `timestamp`, `user_type`, `user_id`, `details`) VALUES
(00000001, 'Vehicle Added', '2024-08-30 19:03:43', 'user', 00000001, 'A new vehicle added by driver 00000002.'),
(00000002, 'Account Logged In', '2024-08-30 19:04:23', 'driver', 00000002, 'You have logged in to your account.'),
(00000003, 'Status Updated', '2024-08-30 19:04:33', 'driver', 00000002, 'Your Status recently Updated'),
(00000004, 'New Customer Added', '2024-08-30 19:22:03', 'user', 00000001, 'New Customer Muhammad Atiq Has been Added by Controller.'),
(00000005, 'Customer Verified', '2024-08-30 19:32:35', 'user', 00000001, 'Customer 00000001 Has Been Verified by Controller.'),
(00000006, 'Go on ride', '2024-08-31 07:57:10', 'driver', 00000004, 'You go on ride'),
(00000007, 'Account Logged In', '2024-08-31 10:15:01', 'driver', 00000001, 'You have logged in to your account.'),
(00000008, 'Status Updated', '2024-08-31 10:15:20', 'driver', 00000001, 'Your Status recently Updated'),
(00000009, 'Account Logged In', '2024-08-31 10:15:52', 'driver', 00000001, 'You have logged in to your account.'),
(00000010, 'Bid Placed', '2024-08-31 10:16:44', 'driver', 00000001, 'Bid of Amount 55 has been placed against Booking # 00000044'),
(00000011, 'Account Logged In', '2024-08-31 10:17:09', 'driver', 00000001, 'You have logged in to your account.'),
(00000012, 'Status Updated', '2024-08-31 10:18:14', 'driver', 00000001, 'Your Status recently Updated'),
(00000013, 'Controller Logged-In', '2024-08-31 10:21:12', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000014, 'Job Dispatched', '2024-08-31 10:21:36', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000015, 'Job Accepted', '2024-08-31 10:21:56', 'driver', 00000001, 'Job 00000001 has been accepted by driver.'),
(00000016, 'Job Withdrawal', '2024-08-31 10:22:21', 'user', 00000001, 'Job 00000001 has been withdrawn by Controller.'),
(00000017, 'Bid Opened', '2024-08-31 10:22:27', 'user', 00000001, 'Bid Against Booking ID 00000062 Has Been Opened by Controller.'),
(00000018, 'Booking Updated', '2024-08-31 10:23:06', 'user', 00000001, 'Booking 00000062 Has Been Updated by Controller.'),
(00000019, 'Job Dispatched', '2024-08-31 10:23:15', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000020, 'Job Accepted', '2024-08-31 10:23:26', 'driver', 00000001, 'Job 00000002 has been accepted by driver.'),
(00000021, 'Status Updated to wtp', '2024-08-31 10:23:39', 'driver', 00000001, 'Your Status recently Updated'),
(00000022, 'Status Updated to POB', '2024-08-31 10:23:44', 'driver', 00000001, 'Your Status POB recently Updated'),
(00000023, 'Waiting Time for Passeger', '2024-08-31 10:23:50', 'driver', 00000001, 'Driver wait 00:00:01 for the passenger against Booking # 00000002'),
(00000024, 'Go on ride', '2024-08-31 10:23:52', 'driver', 00000001, 'You go on ride'),
(00000025, 'Job Completed', '2024-08-31 10:24:25', 'driver', 00000001, 'Job # 00000002 Has been Completed.'),
(00000026, 'Bid Opened', '2024-08-31 10:26:10', 'user', 00000001, 'Bid Against Booking ID 00000061 Has Been Opened by Controller.'),
(00000027, 'New Booking', '2024-08-31 10:27:41', 'user', 00000001, 'Controller Has added a new booking 63'),
(00000028, 'Job Dispatched', '2024-08-31 10:28:00', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000029, 'Job Accepted', '2024-08-31 10:28:16', 'driver', 00000001, 'Job 00000003 has been accepted by driver.'),
(00000030, 'Job Withdrawal', '2024-08-31 10:29:09', 'user', 00000001, 'Job 00000003 has been withdrawn by Controller.'),
(00000031, 'Bid Opened', '2024-08-31 10:29:19', 'user', 00000001, 'Bid Against Booking ID 00000063 Has Been Opened by Controller.'),
(00000032, 'New Booking', '2024-08-31 10:31:33', 'user', 00000001, 'Controller Has added a new booking 64'),
(00000033, 'Job Dispatched', '2024-08-31 10:31:41', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000034, 'Job Accepted', '2024-08-31 10:31:51', 'driver', 00000001, 'Job 00000004 has been accepted by driver.'),
(00000035, 'Status Updated', '2024-08-31 10:32:24', 'driver', 00000001, 'Your Status recently Updated'),
(00000036, 'Status Updated to wtp', '2024-08-31 10:32:29', 'driver', 00000001, 'Your Status recently Updated'),
(00000037, 'Waiting Time for Passeger', '2024-08-31 10:34:13', 'driver', 00000001, 'Driver wait 00:00:55 for the passenger against Booking # 00000004'),
(00000038, 'Go on ride', '2024-08-31 10:34:14', 'driver', 00000001, 'You go on ride'),
(00000039, 'Journey Fare Added', '2024-08-31 10:35:00', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000040, 'Job Completed', '2024-08-31 10:35:52', 'driver', 00000001, 'Job # 00000004 Has been Completed.'),
(00000041, 'Account Logged In', '2024-08-31 10:36:32', 'driver', 00000001, 'You have logged in to your account.'),
(00000042, 'Account Logged In', '2024-08-31 10:36:54', 'driver', 00000001, 'You have logged in to your account.'),
(00000043, 'Journey Fare Added', '2024-08-31 10:36:54', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000044, 'Journey Fare Added', '2024-08-31 10:36:57', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000045, 'Journey Fare Added', '2024-08-31 10:37:11', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000046, 'Bid Placed', '2024-08-31 10:37:14', 'driver', 00000001, 'Bid of Amount 2000 has been placed against Booking # 00000061'),
(00000047, 'Journey Fare Added', '2024-08-31 10:37:14', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000048, 'Journey Fare Added', '2024-08-31 10:37:16', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000049, 'Bid Placed', '2024-08-31 10:37:19', 'driver', 00000001, 'Bid of Amount 58888 has been placed against Booking # 00000061'),
(00000050, 'Journey Fare Added', '2024-08-31 10:37:20', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000051, 'Journey Fare Added', '2024-08-31 10:37:21', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000052, 'Bid Placed', '2024-08-31 10:37:23', 'driver', 00000001, 'Bid of Amount 6666 has been placed against Booking # 00000061'),
(00000053, 'Journey Fare Added', '2024-08-31 10:37:24', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000054, 'Journey Fare Added', '2024-08-31 10:37:26', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000055, 'Bid Placed', '2024-08-31 10:37:33', 'driver', 00000001, 'Bid of Amount 55555 has been placed against Booking # 00000061'),
(00000056, 'Journey Fare Added', '2024-08-31 10:37:34', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000057, 'Journey Fare Added', '2024-08-31 10:38:16', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000058, 'Bid Placed', '2024-08-31 10:38:22', 'driver', 00000001, 'Bid of Amount 5526355 has been placed against Booking # 00000062'),
(00000059, 'Journey Fare Added', '2024-08-31 10:38:23', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000060, 'Journey Fare Added', '2024-08-31 10:43:03', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000061, 'Journey Fare Added', '2024-08-31 10:43:07', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000062, 'Journey Fare Added', '2024-08-31 10:43:10', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000063, 'Journey Fare Added', '2024-08-31 10:43:17', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000064, 'Status Updated', '2024-08-31 10:45:11', 'driver', 00000001, 'Your Status recently Updated'),
(00000065, 'Status Updated', '2024-08-31 10:46:21', 'driver', 00000001, 'Your Status recently Updated'),
(00000066, 'Status Updated', '2024-08-31 10:46:22', 'driver', 00000001, 'Your Status recently Updated'),
(00000067, 'Journey Fare Added', '2024-08-31 10:46:33', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000068, 'Journey Fare Added', '2024-08-31 10:46:53', 'driver', 00000001, 'Journey Fare added for correction against job #: 00000004.'),
(00000069, 'Status Updated', '2024-08-31 10:54:03', 'driver', 00000001, 'Your Status recently Updated'),
(00000070, 'Status Updated', '2024-08-31 10:54:05', 'driver', 00000001, 'Your Status recently Updated'),
(00000071, 'Account Logged In', '2024-08-31 10:58:52', 'driver', 00000001, 'You have logged in to your account.'),
(00000072, 'Account Logged In', '2024-08-31 10:58:58', 'driver', 00000001, 'You have logged in to your account.'),
(00000073, 'Controller Logged-In', '2024-08-31 16:44:10', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000074, 'Controller Logged-In', '2024-09-01 08:34:37', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000075, 'New Booker', '2024-09-01 08:35:26', 'user', 00000001, 'New Booker Wajeeh   Added by Controller.'),
(00000076, 'Booker Signed-In', '2024-09-01 08:35:58', 'client', 00000002, 'Booker recently logged-In.'),
(00000077, 'Booker Verified', '2024-09-01 08:36:58', 'user', 00000001, 'Booker 00000002 Has Been Verified by Controller.'),
(00000078, 'Booker Signed-In', '2024-09-01 08:37:03', 'client', 00000002, 'Booker recently logged-In.'),
(00000079, 'Booker Signed-In', '2024-09-01 08:40:17', 'client', 00000002, 'Booker recently logged-In.'),
(00000080, 'Booker Signed-In', '2024-09-01 08:41:45', 'client', 00000002, 'Booker recently logged-In.'),
(00000081, 'Booker Signed-In', '2024-09-01 08:52:13', 'client', 00000002, 'Booker recently logged-In.'),
(00000082, 'Booker Signed-In', '2024-09-01 08:53:41', 'client', 00000002, 'Booker recently logged-In.'),
(00000083, 'Booker Signed-In', '2024-09-01 09:23:06', 'client', 00000002, 'Booker recently logged-In.'),
(00000084, 'Booker Signed-In', '2024-09-01 09:30:15', 'client', 00000002, 'Booker recently logged-In.'),
(00000085, 'Booker Signed-In', '2024-09-01 09:37:14', 'client', 00000002, 'Booker recently logged-In.'),
(00000086, 'Booker Signed-In', '2024-09-01 09:39:37', 'client', 00000002, 'Booker recently logged-In.'),
(00000087, 'Booker Signed-In', '2024-09-01 09:43:52', 'client', 00000002, 'Booker recently logged-In.'),
(00000088, 'Booker Signed-In', '2024-09-01 09:54:14', 'client', 00000002, 'Booker recently logged-In.'),
(00000089, 'Booker Signed-In', '2024-09-01 10:05:09', 'client', 00000002, 'Booker recently logged-In.'),
(00000090, 'Booker Signed-In', '2024-09-01 10:25:00', 'client', 00000002, 'Booker recently logged-In.'),
(00000091, 'Booker Signed-In', '2024-09-02 05:41:11', 'client', 00000002, 'Booker recently logged-In.'),
(00000092, 'Booker Signed-In', '2024-09-02 05:46:06', 'client', 00000002, 'Booker recently logged-In.'),
(00000093, 'Booker Signed-In', '2024-09-02 05:49:12', 'client', 00000002, 'Booker recently logged-In.'),
(00000094, 'Account Logged In', '2024-09-02 09:54:22', 'driver', 00000002, 'You have logged in to your account.'),
(00000095, 'Break Time Started', '2024-09-02 09:54:24', 'driver', 00000002, 'You go to break time.'),
(00000096, 'Break Time Ends', '2024-09-02 09:54:37', 'driver', 00000002, 'Break Time Ends and back to online'),
(00000097, 'Status Updated', '2024-09-02 10:32:48', 'driver', 00000002, 'Your Status recently Updated'),
(00000098, 'Controller Logged-In', '2024-09-02 10:32:58', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000099, 'Status Updated', '2024-09-02 10:32:59', 'driver', 00000002, 'Your Status recently Updated'),
(00000100, 'Status Updated', '2024-09-02 10:33:41', 'driver', 00000001, 'Your Status recently Updated'),
(00000101, 'New Booking', '2024-09-02 10:35:47', 'user', 00000001, 'Controller Has added a new booking 65'),
(00000102, 'Job Dispatched', '2024-09-02 10:35:56', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000103, 'Booking Cancelled', '2024-09-02 10:36:10', 'driver', 00000000, 'Booking # 00000065 has been cacelled.'),
(00000104, 'Job Withdrawal', '2024-09-02 10:36:19', 'user', 00000001, 'Job 00000005 has been withdrawn by Controller.'),
(00000105, 'Status Updated', '2024-09-02 10:42:17', 'driver', 00000001, 'Your Status recently Updated'),
(00000106, 'Account Logged In', '2024-09-02 10:42:21', 'driver', 00000001, 'You have logged in to your account.'),
(00000107, 'Status Updated', '2024-09-02 10:42:26', 'driver', 00000001, 'Your Status recently Updated'),
(00000108, 'New Admin Added', '2024-09-02 10:59:02', 'user', 00000001, 'New Admin Atiq Has Been Added by Controller.'),
(00000109, 'Booker Signed-In', '2024-09-02 14:42:34', 'client', 00000002, 'Booker recently logged-In.'),
(00000110, 'Booker Signed-In', '2024-09-02 14:45:36', 'client', 00000002, 'Booker recently logged-In.'),
(00000111, 'Booker Signed-In', '2024-09-02 14:48:23', 'client', 00000002, 'Booker recently logged-In.'),
(00000112, 'Booker Signed-In', '2024-09-02 14:52:06', 'client', 00000002, 'Booker recently logged-In.'),
(00000113, 'Booker Signed-In', '2024-09-02 14:58:24', 'client', 00000002, 'Booker recently logged-In.'),
(00000114, 'Booker Signed-In', '2024-09-02 15:02:53', 'client', 00000002, 'Booker recently logged-In.'),
(00000115, 'Booker Signed-In', '2024-09-02 15:06:38', 'client', 00000002, 'Booker recently logged-In.'),
(00000116, 'Booker Signed-In', '2024-09-02 15:08:08', 'client', 00000002, 'Booker recently logged-In.'),
(00000117, 'Booker Signed-In', '2024-09-02 15:12:22', 'client', 00000002, 'Booker recently logged-In.'),
(00000118, 'Booker Signed-In', '2024-09-02 15:21:07', 'client', 00000002, 'Booker recently logged-In.'),
(00000119, 'Booker Signed-In', '2024-09-02 15:36:09', 'client', 00000002, 'Booker recently logged-In.'),
(00000120, 'Booker Signed-In', '2024-09-02 15:52:00', 'client', 00000002, 'Booker recently logged-In.'),
(00000121, 'Booker Signed-In', '2024-09-02 16:02:58', 'client', 00000002, 'Booker recently logged-In.'),
(00000122, 'Booker Signed-In', '2024-09-02 16:16:20', 'client', 00000002, 'Booker recently logged-In.'),
(00000123, 'Status Updated', '2024-09-02 17:25:18', 'driver', 00000002, 'Your Status recently Updated'),
(00000124, 'Account Logged In', '2024-09-02 17:26:52', 'driver', 00000002, 'You have logged in to your account.'),
(00000125, 'Controller Logged-In', '2024-09-02 17:28:39', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000126, 'Job Dispatched', '2024-09-02 17:31:44', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000127, 'Status Updated', '2024-09-02 17:31:56', 'driver', 00000002, 'Your Status recently Updated'),
(00000128, 'Status Updated', '2024-09-02 17:31:57', 'driver', 00000002, 'Your Status recently Updated'),
(00000129, 'Job Accepted', '2024-09-02 17:32:01', 'driver', 00000002, 'Job 00000006 has been accepted by driver.'),
(00000130, 'Job Withdrawal', '2024-09-02 17:37:35', 'user', 00000001, 'Job 00000006 has been withdrawn by Controller.'),
(00000131, 'Job Dispatched', '2024-09-02 17:37:50', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000132, 'Job Accepted', '2024-09-02 17:44:49', 'driver', 00000002, 'Job 00000007 has been accepted by driver.'),
(00000133, 'Booker Signed-In', '2024-09-03 05:25:44', 'client', 00000002, 'Booker recently logged-In.'),
(00000134, 'Booker Signed-In', '2024-09-03 06:56:55', 'client', 00000002, 'Booker recently logged-In.'),
(00000135, 'Booker Signed-In', '2024-09-03 09:56:05', 'client', 00000002, 'Booker recently logged-In.'),
(00000136, 'Booker Signed-In', '2024-09-03 10:13:47', 'client', 00000002, 'Booker recently logged-In.'),
(00000137, 'Booker Signed-In', '2024-09-03 10:23:21', 'client', 00000002, 'Booker recently logged-In.'),
(00000138, 'Booker Signed-In', '2024-09-03 12:46:10', 'client', 00000002, 'Booker recently logged-In.'),
(00000139, 'Booker Signed-In', '2024-09-03 15:05:16', 'client', 00000002, 'Booker recently logged-In.'),
(00000140, 'Booker Signed-In', '2024-09-03 15:06:55', 'client', 00000002, 'Booker recently logged-In.'),
(00000141, 'Controller Logged-In', '2024-09-03 15:27:40', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000142, 'Booker Signed-In', '2024-09-03 15:27:52', 'client', 00000002, 'Booker recently logged-In.'),
(00000143, 'New Vehicle Added', '2024-09-03 15:28:13', 'user', 00000001, 'New Vehicle Saloon Has Been updated by Controller.'),
(00000144, 'New Vehicle Added', '2024-09-03 15:29:14', 'user', 00000001, 'New Vehicle Saloon Has Been updated by Controller.'),
(00000145, 'New Vehicle Added', '2024-09-03 15:29:39', 'user', 00000001, 'New Vehicle Estate Has Been updated by Controller.'),
(00000146, 'New Vehicle Added', '2024-09-03 15:29:59', 'user', 00000001, 'New Vehicle MPV Has Been updated by Controller.'),
(00000147, 'New Vehicle Added', '2024-09-03 15:30:16', 'user', 00000001, 'New Vehicle Large MPV Has Been updated by Controller.'),
(00000148, 'New Vehicle Added', '2024-09-03 15:30:52', 'user', 00000001, 'New Vehicle Executive Minibus Has Been updated by Controller.'),
(00000149, 'New Vehicle Added', '2024-09-03 15:33:42', 'user', 00000001, 'New Vehicle 10 - 14 Passenger Has Been updated by Controller.'),
(00000150, 'New Vehicle Added', '2024-09-03 15:34:23', 'user', 00000001, 'New Vehicle 15 - 16 Passenger Has Been updated by Controller.'),
(00000151, 'Booker Signed-In', '2024-09-03 16:04:05', 'client', 00000002, 'Booker recently logged-In.'),
(00000152, 'New Booking Added', '2024-09-03 16:38:38', 'client', 00000000, 'Booker Has added new Booking # 66.'),
(00000153, 'Booker Signed-In', '2024-09-03 16:41:06', 'client', 00000002, 'Booker recently logged-In.'),
(00000154, 'New Booking Added', '2024-09-03 17:04:14', 'client', 00000000, 'Booker Has added new Booking # 67.'),
(00000155, 'Controller Logged-In', '2024-09-03 17:05:01', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000156, 'New Booking Added', '2024-09-03 17:15:27', 'client', 00000000, 'Booker Has added new Booking # 68.'),
(00000157, 'Account Logged In', '2024-09-03 17:29:58', 'driver', 00000002, 'You have logged in to your account.'),
(00000158, 'Controller Logged-In', '2024-09-03 18:01:59', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000159, 'Job Dispatched', '2024-09-03 18:04:33', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000160, 'Job Withdrawal', '2024-09-03 18:04:41', 'user', 00000001, 'Job 00000007 has been withdrawn by Controller.'),
(00000161, 'Job Accepted', '2024-09-03 18:04:49', 'driver', 00000002, 'Job 00000008 has been accepted by driver.'),
(00000162, 'Status Updated', '2024-09-03 18:05:02', 'driver', 00000002, 'Your Status recently Updated'),
(00000163, 'Status Updated to wtp', '2024-09-03 18:18:19', 'driver', 00000002, 'Your Status recently Updated'),
(00000164, 'Job Withdrawal', '2024-09-03 18:21:46', 'user', 00000001, 'Job 00000008 has been withdrawn by Controller.'),
(00000165, 'Job Dispatched', '2024-09-03 18:26:56', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000166, 'Job Accepted', '2024-09-03 18:29:21', 'driver', 00000002, 'Job 00000009 has been accepted by driver.'),
(00000167, 'Job Accepted', '2024-09-03 19:00:10', 'driver', 00000002, 'Job 2 has been accepted by driver.'),
(00000168, 'Job Withdrawal', '2024-09-03 19:05:21', 'user', 00000001, 'Job 00000009 has been withdrawn by Controller.'),
(00000169, 'Job Accepted', '2024-09-03 19:06:44', 'driver', 00000001, 'Job 2 has been accepted by driver.'),
(00000170, 'Job Dispatched', '2024-09-03 19:19:42', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000171, 'Job Accepted', '2024-09-03 19:19:57', 'driver', 00000002, 'Job 00000010 has been accepted by driver.'),
(00000172, 'Job Withdrawal', '2024-09-03 19:22:32', 'user', 00000001, 'Job 00000010 has been withdrawn by Controller.'),
(00000173, 'Job Dispatched', '2024-09-03 19:22:46', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000174, 'Job Accepted', '2024-09-03 19:23:32', 'driver', 00000002, 'Job 00000011 has been accepted by driver.'),
(00000175, 'Job Withdrawal', '2024-09-03 19:46:14', 'user', 00000001, 'Job 00000011 has been withdrawn by Controller.'),
(00000176, 'Job Dispatched', '2024-09-03 19:47:41', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000177, 'Job Accepted', '2024-09-03 19:47:57', 'driver', 00000002, 'Job 00000012 has been accepted by driver.'),
(00000178, 'Job Withdrawal', '2024-09-03 20:02:08', 'user', 00000001, 'Job 00000012 has been withdrawn by Controller.'),
(00000179, 'Booker Signed-In', '2024-09-04 18:27:22', 'client', 00000002, 'Booker recently logged-In.'),
(00000180, 'Controller Logged-In', '2024-09-04 18:40:14', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000181, 'Job Dispatched', '2024-09-04 18:41:36', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000182, 'Job Accepted', '2024-09-04 18:47:15', 'driver', 00000002, 'Job 00000013 has been accepted by driver.'),
(00000183, 'Status Updated to wtp', '2024-09-04 19:28:10', 'driver', 00000002, 'Your Status recently Updated'),
(00000184, 'Status Updated to wtp', '2024-09-04 19:41:27', 'driver', 00000002, 'Your Status recently Updated'),
(00000185, 'Status Updated to wtp', '2024-09-04 19:47:52', 'driver', 00000002, 'Your Status recently Updated'),
(00000186, 'Status Updated to wtp', '2024-09-04 19:54:00', 'driver', 00000002, 'Your Status recently Updated'),
(00000187, 'Status Updated to wtp', '2024-09-04 19:56:19', 'driver', 00000002, 'Your Status recently Updated'),
(00000188, 'Status Updated to wtp', '2024-09-04 20:18:45', 'driver', 00000002, 'Your Status recently Updated'),
(00000189, 'Status Updated to wtp', '2024-09-04 20:20:08', 'driver', 00000002, 'Your Status recently Updated'),
(00000190, 'Status Updated to wtp', '2024-09-04 20:22:39', 'driver', 00000002, 'Your Status recently Updated'),
(00000191, 'Status Updated to wtp', '2024-09-04 20:26:03', 'driver', 00000002, 'Your Status recently Updated'),
(00000192, 'Status Updated to wtp', '2024-09-04 20:30:28', 'driver', 00000002, 'Your Status recently Updated'),
(00000193, 'Status Updated to wtp', '2024-09-04 20:32:17', 'driver', 00000002, 'Your Status recently Updated'),
(00000194, 'Status Updated to wtp', '2024-09-04 20:37:28', 'driver', 00000002, 'Your Status recently Updated'),
(00000195, 'Status Updated to wtp', '2024-09-04 20:40:29', 'driver', 00000002, 'Your Status recently Updated'),
(00000196, 'Status Updated to wtp', '2024-09-04 20:41:52', 'driver', 00000002, 'Your Status recently Updated'),
(00000197, 'Status Updated to wtp', '2024-09-04 20:43:29', 'driver', 00000002, 'Your Status recently Updated'),
(00000198, 'Status Updated to wtp', '2024-09-04 20:45:08', 'driver', 00000002, 'Your Status recently Updated'),
(00000199, 'Status Updated to wtp', '2024-09-04 20:46:00', 'driver', 00000002, 'Your Status recently Updated'),
(00000200, 'Status Updated to POB', '2024-09-04 20:48:23', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000201, 'Status Updated to wtp', '2024-09-04 20:49:41', 'driver', 00000002, 'Your Status recently Updated'),
(00000202, 'Waiting Time for Passeger', '2024-09-04 20:50:08', 'driver', 00000002, 'Driver wait 00:00:10 for the passenger against Booking # 00000013'),
(00000203, 'Go on ride', '2024-09-04 20:50:09', 'driver', 00000002, 'You go on ride'),
(00000204, 'Status Updated', '2024-09-05 00:29:22', 'driver', 00000001, 'Your Status recently Updated'),
(00000205, 'Account Logged In', '2024-09-05 00:29:30', 'driver', 00000001, 'You have logged in to your account.'),
(00000206, 'Controller Logged-In', '2024-09-05 00:29:45', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000207, 'Controller Logged-In', '2024-09-05 00:29:46', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000208, 'New Booking', '2024-09-05 00:30:33', 'user', 00000001, 'Controller Has added a new booking 69'),
(00000209, 'Job Dispatched', '2024-09-05 00:30:50', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000210, 'Job Accepted', '2024-09-05 00:31:04', 'driver', 00000001, 'Job 00000014 has been accepted by driver.'),
(00000211, 'Status Updated to wtp', '2024-09-05 00:31:09', 'driver', 00000001, 'Your Status recently Updated'),
(00000212, 'Waiting Time for Passeger', '2024-09-05 00:31:15', 'driver', 00000001, 'Driver wait 00:00:04 for the passenger against Booking # 00000014'),
(00000213, 'Go on ride', '2024-09-05 00:31:16', 'driver', 00000001, 'You go on ride'),
(00000214, 'Go on ride', '2024-09-05 07:53:09', 'driver', 00000002, 'You go on ride'),
(00000215, 'Booker Signed-In', '2024-09-05 12:04:28', 'client', 00000002, 'Booker recently logged-In.'),
(00000216, 'Controller Logged-In', '2024-09-05 12:08:54', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000217, 'Booker Signed-In', '2024-09-05 15:05:56', 'client', 00000002, 'Booker recently logged-In.'),
(00000218, 'Booker Signed-In', '2024-09-05 15:12:17', 'client', 00000002, 'Booker recently logged-In.'),
(00000219, 'Booker Signed-In', '2024-09-05 15:16:34', 'client', 00000002, 'Booker recently logged-In.'),
(00000220, 'Booker Signed-In', '2024-09-05 15:26:23', 'client', 00000002, 'Booker recently logged-In.'),
(00000221, 'Booker Signed-In', '2024-09-05 15:26:36', 'client', 00000002, 'Booker recently logged-In.'),
(00000222, 'Booker Signed-In', '2024-09-05 15:27:07', 'client', 00000002, 'Booker recently logged-In.'),
(00000223, 'Booker Signed-In', '2024-09-05 15:29:37', 'client', 00000002, 'Booker recently logged-In.'),
(00000224, 'Booker Signed-In', '2024-09-05 15:30:07', 'client', 00000002, 'Booker recently logged-In.'),
(00000225, 'Booker Signed-In', '2024-09-05 15:30:15', 'client', 00000002, 'Booker recently logged-In.'),
(00000226, 'Booker Signed-In', '2024-09-05 15:35:12', 'client', 00000002, 'Booker recently logged-In.'),
(00000227, 'Booker Signed-In', '2024-09-05 15:38:41', 'client', 00000002, 'Booker recently logged-In.'),
(00000228, 'Booker Signed-In', '2024-09-05 15:48:06', 'client', 00000002, 'Booker recently logged-In.'),
(00000229, 'Booker Signed-In', '2024-09-05 15:56:24', 'client', 00000002, 'Booker recently logged-In.'),
(00000230, 'New Booking Added', '2024-09-05 15:59:44', 'client', 00000002, 'Booker Has added new Booking # 70.'),
(00000231, 'Controller Logged-In', '2024-09-05 16:00:30', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000232, 'Booking Cancelled', '2024-09-05 16:05:23', 'client', 00000000, 'Booker Has cancelled booking Booking ID: 70.'),
(00000233, 'Booking Cancelled', '2024-09-05 16:07:49', 'client', 00000000, 'Booker Has cancelled booking Booking ID: 70.'),
(00000234, 'Booking Cancelled', '2024-09-05 16:09:33', 'client', 00000000, 'Booker Has cancelled booking Booking ID: 70.'),
(00000235, 'Booker Signed-In', '2024-09-05 16:36:24', 'client', 00000002, 'Booker recently logged-In.'),
(00000236, 'Booker Signed-In', '2024-09-05 16:55:32', 'client', 00000002, 'Booker recently logged-In.'),
(00000237, 'Account Logged In', '2024-09-05 17:25:56', 'driver', 00000002, 'You have logged in to your account.'),
(00000238, 'Controller Logged-In', '2024-09-05 17:34:03', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000239, 'Job Dispatched', '2024-09-05 17:35:42', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000240, 'Job Accepted', '2024-09-05 17:36:01', 'driver', 00000002, 'Job 00000015 has been accepted by driver.'),
(00000241, 'Status Updated to wtp', '2024-09-05 17:43:36', 'driver', 00000002, 'Your Status recently Updated'),
(00000242, 'Status Updated to wtp', '2024-09-05 17:45:29', 'driver', 00000002, 'Your Status recently Updated'),
(00000243, 'Status Updated to wtp', '2024-09-05 17:48:19', 'driver', 00000002, 'Your Status recently Updated'),
(00000244, 'Status Updated to POB', '2024-09-05 17:48:58', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000245, 'Waiting Time for Passeger', '2024-09-05 17:49:15', 'driver', 00000002, 'Driver wait 00:00:08 for the passenger against Booking # 00000015'),
(00000246, 'Go on ride', '2024-09-05 17:49:16', 'driver', 00000002, 'You go on ride'),
(00000247, 'Go on ride', '2024-09-05 18:00:31', 'driver', 00000002, 'You go on ride'),
(00000248, 'Go on ride', '2024-09-05 18:02:25', 'driver', 00000002, 'You go on ride'),
(00000249, 'Go on ride', '2024-09-05 18:03:16', 'driver', 00000002, 'You go on ride'),
(00000250, 'Journey Fare Added', '2024-09-05 18:06:04', 'driver', 00000002, 'Journey Fare added for correction against job #: 00000015.'),
(00000251, 'Journey Fare Added', '2024-09-05 18:10:52', 'driver', 00000002, 'Journey Fare added for correction against job #: 00000015.'),
(00000252, 'Job Completed', '2024-09-05 18:12:05', 'driver', 00000002, 'Job # 00000015 Has been Completed.'),
(00000253, 'Job Completed', '2024-09-05 19:19:05', 'driver', 00000002, 'Job # 00000013 Has been Completed.'),
(00000254, 'Account Logged In', '2024-09-05 19:19:35', 'driver', 00000002, 'You have logged in to your account.'),
(00000255, 'Account Logged In', '2024-09-05 19:19:51', 'driver', 00000002, 'You have logged in to your account.'),
(00000256, 'Account Logged In', '2024-09-05 19:24:19', 'driver', 00000002, 'You have logged in to your account.'),
(00000257, 'Account Logged In', '2024-09-05 19:25:16', 'driver', 00000002, 'You have logged in to your account.'),
(00000258, 'Account Logged In', '2024-09-05 19:25:52', 'driver', 00000002, 'You have logged in to your account.'),
(00000259, 'Account Logged In', '2024-09-05 19:27:05', 'driver', 00000002, 'You have logged in to your account.'),
(00000260, 'Bid Placed', '2024-09-05 19:27:39', 'driver', 00000002, 'Bid of Amount 25 has been placed against Booking # 00000061'),
(00000261, 'Bid Placed', '2024-09-05 19:28:10', 'driver', 00000002, 'Bid of Amount 30 has been placed against Booking # 00000063'),
(00000262, 'Account Logged In', '2024-09-05 19:30:34', 'driver', 00000002, 'You have logged in to your account.'),
(00000263, 'Account Logged In', '2024-09-05 19:31:01', 'driver', 00000002, 'You have logged in to your account.'),
(00000264, 'Account Logged In', '2024-09-05 19:32:22', 'driver', 00000002, 'You have logged in to your account.'),
(00000265, 'Account Logged In', '2024-09-05 19:32:27', 'driver', 00000002, 'You have logged in to your account.'),
(00000266, 'Booker Signed-In', '2024-09-06 05:55:50', 'client', 00000002, 'Booker recently logged-In.'),
(00000267, 'Booker Signed-In', '2024-09-06 06:38:39', 'client', 00000002, 'Booker recently logged-In.'),
(00000268, 'Controller Logged-In', '2024-09-06 06:39:42', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000269, 'Booker Signed-In', '2024-09-06 07:13:40', 'client', 00000002, 'Booker recently logged-In.'),
(00000270, 'Booker Signed-In', '2024-09-06 07:23:51', 'client', 00000002, 'Booker recently logged-In.'),
(00000271, 'Controller Logged-In', '2024-09-06 14:24:32', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000272, 'New Driver Profile Registered', '2024-09-06 14:30:46', 'driver', 00000003, 'New Driver Acount Created by Rehman'),
(00000273, 'Account Logged In', '2024-09-06 14:31:55', 'driver', 00000003, 'You have logged in to your account.'),
(00000274, 'Account Logged In', '2024-09-06 14:36:10', 'driver', 00000003, 'You have logged in to your account.'),
(00000275, 'Booker Signed-In', '2024-09-06 15:21:15', 'client', 00000002, 'Booker recently logged-In.'),
(00000276, 'Booker Signed-In', '2024-09-06 16:03:56', 'client', 00000002, 'Booker recently logged-In.'),
(00000277, 'Account Logged In', '2024-09-06 18:36:30', 'driver', 00000002, 'You have logged in to your account.'),
(00000278, 'Status Updated', '2024-09-06 18:36:49', 'driver', 00000002, 'Your Status recently Updated'),
(00000279, 'Account Logged In', '2024-09-06 18:38:24', 'driver', 00000002, 'You have logged in to your account.'),
(00000280, 'Controller Logged-In', '2024-09-06 18:39:03', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000281, 'New Booking', '2024-09-06 18:40:27', 'user', 00000001, 'Controller Has added a new booking 71'),
(00000282, 'Job Dispatched', '2024-09-06 18:40:45', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000283, 'Job Accepted', '2024-09-06 18:40:57', 'driver', 00000002, 'Job 00000016 has been accepted by driver.'),
(00000284, 'Status Updated to wtp', '2024-09-06 18:41:19', 'driver', 00000002, 'Your Status recently Updated'),
(00000285, 'Status Updated to POB', '2024-09-06 18:41:50', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000286, 'Waiting Time for Passeger', '2024-09-06 18:41:57', 'driver', 00000002, 'Driver wait 00:00:02 for the passenger against Booking # 00000016'),
(00000287, 'Go on ride', '2024-09-06 18:41:58', 'driver', 00000002, 'You go on ride'),
(00000288, 'Job Completed', '2024-09-06 18:42:16', 'driver', 00000002, 'Job # 00000016 Has been Completed.'),
(00000289, 'Account Logged In', '2024-09-06 18:42:37', 'driver', 00000002, 'You have logged in to your account.'),
(00000290, 'Status Updated', '2024-09-06 18:42:52', 'driver', 00000002, 'Your Status recently Updated'),
(00000291, 'Status Updated', '2024-09-06 18:42:53', 'driver', 00000002, 'Your Status recently Updated'),
(00000292, 'Account Logged In', '2024-09-06 18:42:54', 'driver', 00000002, 'You have logged in to your account.'),
(00000293, 'Account Logged In', '2024-09-07 09:36:08', 'driver', 00000002, 'You have logged in to your account.'),
(00000294, 'Controller Logged-In', '2024-09-07 10:11:51', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000295, 'New Booking', '2024-09-07 10:13:16', 'user', 00000001, 'Controller Has added a new booking 72'),
(00000296, 'Job Dispatched', '2024-09-07 10:13:37', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000297, 'Job Accepted', '2024-09-07 10:14:38', 'driver', 00000002, 'Job 00000017 has been accepted by driver.'),
(00000298, 'Status Updated', '2024-09-07 10:15:05', 'driver', 00000002, 'Your Status recently Updated'),
(00000299, 'Status Updated to wtp', '2024-09-07 10:35:04', 'driver', 00000002, 'Your Status recently Updated'),
(00000300, 'Status Updated to POB', '2024-09-07 10:35:09', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000301, 'Waiting Time for Passeger', '2024-09-07 10:35:18', 'driver', 00000002, 'Driver wait 00:00:03 for the passenger against Booking # 00000017'),
(00000302, 'Go on ride', '2024-09-07 10:35:20', 'driver', 00000002, 'You go on ride'),
(00000303, 'Job Completed', '2024-09-07 10:35:40', 'driver', 00000002, 'Job # 00000017 Has been Completed.'),
(00000304, 'Account Logged In', '2024-09-07 10:44:49', 'driver', 00000002, 'You have logged in to your account.'),
(00000305, 'New Booking', '2024-09-07 10:46:30', 'user', 00000001, 'Controller Has added a new booking 73'),
(00000306, 'Job Dispatched', '2024-09-07 10:46:43', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000307, 'Job Accepted', '2024-09-07 10:46:51', 'driver', 00000002, 'Job 00000018 has been accepted by driver.'),
(00000308, 'Status Updated to wtp', '2024-09-07 10:49:32', 'driver', 00000002, 'Your Status recently Updated'),
(00000309, 'Waiting Time for Passeger', '2024-09-07 10:49:49', 'driver', 00000002, 'Driver wait 00:00:09 for the passenger against Booking # 00000018'),
(00000310, 'Go on ride', '2024-09-07 10:49:51', 'driver', 00000002, 'You go on ride'),
(00000311, 'Job Completed', '2024-09-07 10:50:05', 'driver', 00000002, 'Job # 00000018 Has been Completed.'),
(00000312, 'New Booking', '2024-09-07 11:05:51', 'user', 00000001, 'Controller Has added a new booking 74'),
(00000313, 'Controller Logged-In', '2024-09-07 11:08:10', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000314, 'Controller Logged-In', '2024-09-07 11:09:01', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000315, 'Job Dispatched', '2024-09-07 11:09:23', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000316, 'Job Accepted', '2024-09-07 11:09:35', 'driver', 00000002, 'Job 00000019 has been accepted by driver.'),
(00000317, 'Status Updated to wtp', '2024-09-07 11:10:39', 'driver', 00000002, 'Your Status recently Updated'),
(00000318, 'Waiting Time for Passeger', '2024-09-07 11:10:49', 'driver', 00000002, 'Driver wait 00:00:03 for the passenger against Booking # 00000019'),
(00000319, 'Go on ride', '2024-09-07 11:10:51', 'driver', 00000002, 'You go on ride'),
(00000320, 'Job Completed', '2024-09-07 11:10:59', 'driver', 00000002, 'Job # 00000019 Has been Completed.'),
(00000321, 'New Booking', '2024-09-07 11:52:46', 'user', 00000001, 'Controller Has added a new booking 75'),
(00000322, 'Booking Updated', '2024-09-07 11:53:28', 'user', 00000001, 'Booking 00000074 Has Been Updated by Controller.'),
(00000323, 'Booking Updated', '2024-09-07 11:53:33', 'user', 00000001, 'Booking 00000074 Has Been Updated by Controller.'),
(00000324, 'Job Dispatched', '2024-09-07 11:54:07', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000325, 'Job Accepted', '2024-09-07 11:54:16', 'driver', 00000002, 'Job 00000020 has been accepted by driver.'),
(00000326, 'Status Updated to wtp', '2024-09-07 11:55:40', 'driver', 00000002, 'Your Status recently Updated'),
(00000327, 'Waiting Time for Passeger', '2024-09-07 11:55:50', 'driver', 00000002, 'Driver wait 00:00:06 for the passenger against Booking # 00000020'),
(00000328, 'Go on ride', '2024-09-07 11:55:52', 'driver', 00000002, 'You go on ride'),
(00000329, 'Job Completed', '2024-09-07 11:56:03', 'driver', 00000002, 'Job # 00000020 Has been Completed.'),
(00000330, 'New Booking', '2024-09-07 12:00:29', 'user', 00000001, 'Controller Has added a new booking 76'),
(00000331, 'Job Dispatched', '2024-09-07 12:00:39', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000332, 'Job Accepted', '2024-09-07 12:00:56', 'driver', 00000002, 'Job 00000021 has been accepted by driver.'),
(00000333, 'Status Updated to wtp', '2024-09-07 12:01:44', 'driver', 00000002, 'Your Status recently Updated'),
(00000334, 'Waiting Time for Passeger', '2024-09-07 12:01:53', 'driver', 00000002, 'Driver wait 00:00:05 for the passenger against Booking # 00000021'),
(00000335, 'Go on ride', '2024-09-07 12:01:54', 'driver', 00000002, 'You go on ride'),
(00000336, 'Job Completed', '2024-09-07 12:02:16', 'driver', 00000002, 'Job # 00000021 Has been Completed.'),
(00000337, 'New Booking', '2024-09-07 12:11:53', 'user', 00000001, 'Controller Has added a new booking 77'),
(00000338, 'Job Dispatched', '2024-09-07 12:12:02', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000339, 'Job Accepted', '2024-09-07 12:12:10', 'driver', 00000002, 'Job 00000022 has been accepted by driver.'),
(00000340, 'Job Withdrawal', '2024-09-07 12:12:23', 'user', 00000001, 'Job 00000022 has been withdrawn by Controller.'),
(00000341, 'Booking Updated', '2024-09-07 12:13:05', 'user', 00000001, 'Booking 00000077 Has Been Updated by Controller.'),
(00000342, 'Job Dispatched', '2024-09-07 12:13:13', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000343, 'Job Accepted', '2024-09-07 12:13:19', 'driver', 00000002, 'Job 00000023 has been accepted by driver.'),
(00000344, 'Status Updated to wtp', '2024-09-07 12:16:51', 'driver', 00000002, 'Your Status recently Updated'),
(00000345, 'Waiting Time for Passeger', '2024-09-07 12:17:02', 'driver', 00000002, 'Driver wait 00:00:06 for the passenger against Booking # 00000023'),
(00000346, 'Go on ride', '2024-09-07 12:17:03', 'driver', 00000002, 'You go on ride'),
(00000347, 'Job Completed', '2024-09-07 12:17:15', 'driver', 00000002, 'Job # 00000023 Has been Completed.'),
(00000348, 'New Booking', '2024-09-07 12:19:19', 'user', 00000001, 'Controller Has added a new booking 78'),
(00000349, 'Job Dispatched', '2024-09-07 12:19:30', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000350, 'Job Accepted', '2024-09-07 12:19:38', 'driver', 00000002, 'Job 00000024 has been accepted by driver.'),
(00000351, 'Status Updated to wtp', '2024-09-07 12:20:44', 'driver', 00000002, 'Your Status recently Updated'),
(00000352, 'Waiting Time for Passeger', '2024-09-07 12:20:51', 'driver', 00000002, 'Driver wait 00:00:04 for the passenger against Booking # 00000024'),
(00000353, 'Go on ride', '2024-09-07 12:20:53', 'driver', 00000002, 'You go on ride'),
(00000354, 'Job Completed', '2024-09-07 12:21:05', 'driver', 00000002, 'Job # 00000024 Has been Completed.'),
(00000355, 'New Booking', '2024-09-07 12:24:00', 'user', 00000001, 'Controller Has added a new booking 79'),
(00000356, 'Job Dispatched', '2024-09-07 12:24:09', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000357, 'Job Accepted', '2024-09-07 12:24:15', 'driver', 00000002, 'Job 00000025 has been accepted by driver.'),
(00000358, 'Status Updated to wtp', '2024-09-07 12:24:57', 'driver', 00000002, 'Your Status recently Updated'),
(00000359, 'Waiting Time for Passeger', '2024-09-07 12:25:02', 'driver', 00000002, 'Driver wait 00:00:02 for the passenger against Booking # 00000025'),
(00000360, 'Go on ride', '2024-09-07 12:25:03', 'driver', 00000002, 'You go on ride'),
(00000361, 'Status Updated to POB', '2024-09-07 12:25:03', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000362, 'Job Completed', '2024-09-07 12:25:14', 'driver', 00000002, 'Job # 00000025 Has been Completed.'),
(00000363, 'New Booking', '2024-09-07 12:39:54', 'user', 00000001, 'Controller Has added a new booking 80'),
(00000364, 'Job Dispatched', '2024-09-07 12:40:03', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000365, 'Job Accepted', '2024-09-07 12:40:10', 'driver', 00000002, 'Job 00000026 has been accepted by driver.'),
(00000366, 'Status Updated to wtp', '2024-09-07 12:40:25', 'driver', 00000002, 'Your Status recently Updated'),
(00000367, 'Waiting Time for Passeger', '2024-09-07 12:40:32', 'driver', 00000002, 'Driver wait 00:00:04 for the passenger against Booking # 00000026'),
(00000368, 'Go on ride', '2024-09-07 12:40:34', 'driver', 00000002, 'You go on ride'),
(00000369, 'Job Completed', '2024-09-07 12:40:44', 'driver', 00000002, 'Job # 00000026 Has been Completed.'),
(00000370, 'New Booking', '2024-09-07 12:43:24', 'user', 00000001, 'Controller Has added a new booking 81'),
(00000371, 'Job Dispatched', '2024-09-07 12:43:45', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000372, 'Job Accepted', '2024-09-07 12:43:52', 'driver', 00000002, 'Job 00000027 has been accepted by driver.'),
(00000373, 'Status Updated to wtp', '2024-09-07 12:44:07', 'driver', 00000002, 'Your Status recently Updated'),
(00000374, 'Waiting Time for Passeger', '2024-09-07 12:44:21', 'driver', 00000002, 'Driver wait 00:00:06 for the passenger against Booking # 00000027'),
(00000375, 'Go on ride', '2024-09-07 12:44:23', 'driver', 00000002, 'You go on ride'),
(00000376, 'Job Completed', '2024-09-07 12:44:39', 'driver', 00000002, 'Job # 00000027 Has been Completed.'),
(00000377, 'New Booking', '2024-09-07 12:48:43', 'user', 00000001, 'Controller Has added a new booking 82'),
(00000378, 'Job Dispatched', '2024-09-07 12:50:14', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000379, 'Job Accepted', '2024-09-07 12:50:21', 'driver', 00000002, 'Job 00000028 has been accepted by driver.'),
(00000380, 'Status Updated to wtp', '2024-09-07 12:50:36', 'driver', 00000002, 'Your Status recently Updated'),
(00000381, 'Waiting Time for Passeger', '2024-09-07 12:50:49', 'driver', 00000002, 'Driver wait 00:00:08 for the passenger against Booking # 00000028'),
(00000382, 'Go on ride', '2024-09-07 12:50:50', 'driver', 00000002, 'You go on ride'),
(00000383, 'Job Completed', '2024-09-07 12:51:06', 'driver', 00000002, 'Job # 00000028 Has been Completed.'),
(00000384, 'Status Updated', '2024-09-07 14:42:44', 'driver', 00000002, 'Your Status recently Updated'),
(00000385, 'Account Logged In', '2024-09-07 14:43:33', 'driver', 00000002, 'You have logged in to your account.'),
(00000386, 'Booker Signed-In', '2024-09-08 09:20:54', 'client', 00000002, 'Booker recently logged-In.'),
(00000387, 'Booker Signed-In', '2024-09-08 09:28:46', 'client', 00000002, 'Booker recently logged-In.'),
(00000388, 'Booker Signed-In', '2024-09-08 09:30:10', 'client', 00000002, 'Booker recently logged-In.'),
(00000389, 'Booker Signed-In', '2024-09-08 09:39:38', 'client', 00000002, 'Booker recently logged-In.'),
(00000390, 'Name Changed', '2024-09-08 09:40:56', 'client', 00000002, 'Booker changed his name'),
(00000391, 'Name Changed', '2024-09-08 09:42:57', 'client', 00000002, 'Booker changed his name'),
(00000392, 'Controller Logged-In', '2024-09-08 09:45:49', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000393, 'New Booking Added', '2024-09-08 09:50:16', 'client', 00000002, 'Booker Has added new Booking # 83.'),
(00000394, 'Profile Image Updated', '2024-09-08 09:51:15', 'client', 00000002, 'Booker Updated Profile Image.'),
(00000395, 'Phone Number Changed', '2024-09-08 09:52:28', 'client', 00000002, 'Booker changed his Phone Number'),
(00000396, 'Phone Number Changed', '2024-09-08 09:53:53', 'client', 00000002, 'Booker changed his Phone Number'),
(00000397, 'Profile Image Updated', '2024-09-08 09:54:55', 'client', 00000002, 'Booker Updated Profile Image.'),
(00000398, 'Profile Image Updated', '2024-09-08 09:57:28', 'client', 00000002, 'Booker Updated Profile Image.'),
(00000399, 'Booker Signed-In', '2024-09-08 10:18:51', 'client', 00000002, 'Booker recently logged-In.'),
(00000400, 'Controller Logged-In', '2024-09-08 10:41:08', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000401, 'Booker Signed-In', '2024-09-08 10:48:03', 'client', 00000001, 'Booker recently logged-In.'),
(00000402, 'New Booking Added', '2024-09-08 10:50:36', 'client', 00000001, 'Booker Has added new Booking # 84.'),
(00000403, 'Booker Signed-In', '2024-09-08 11:00:50', 'client', 00000001, 'Booker recently logged-In.'),
(00000404, 'Booker Signed-In', '2024-09-08 11:16:33', 'client', 00000001, 'Booker recently logged-In.'),
(00000405, 'Booker Signed-In', '2024-09-08 11:32:51', 'client', 00000001, 'Booker recently logged-In.'),
(00000406, 'Booker Signed-In', '2024-09-08 11:34:12', 'client', 00000001, 'Booker recently logged-In.'),
(00000407, 'Booker Signed-In', '2024-09-08 11:39:36', 'client', 00000001, 'Booker recently logged-In.'),
(00000408, 'Booker Signed-In', '2024-09-08 11:43:08', 'client', 00000001, 'Booker recently logged-In.'),
(00000409, 'Booker Signed-In', '2024-09-08 11:47:13', 'client', 00000001, 'Booker recently logged-In.'),
(00000410, 'Booker Signed-In', '2024-09-08 11:48:20', 'client', 00000001, 'Booker recently logged-In.'),
(00000411, 'Booker Signed-In', '2024-09-08 11:55:23', 'client', 00000001, 'Booker recently logged-In.'),
(00000412, 'Booker Signed-In', '2024-09-08 12:00:46', 'client', 00000001, 'Booker recently logged-In.'),
(00000413, 'Booker Signed-In', '2024-09-08 12:03:25', 'client', 00000001, 'Booker recently logged-In.'),
(00000414, 'Booker Signed-In', '2024-09-08 12:07:10', 'client', 00000001, 'Booker recently logged-In.'),
(00000415, 'Booker Signed-In', '2024-09-08 13:29:36', 'client', 00000001, 'Booker recently logged-In.'),
(00000416, 'Account Logged In', '2024-09-09 06:07:16', 'driver', 00000002, 'You have logged in to your account.'),
(00000417, 'Controller Logged-In', '2024-09-09 13:08:49', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000418, 'Status Updated', '2024-09-09 13:25:03', 'driver', 00000002, 'Your Status recently Updated');

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `ap_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `ap_name` varchar(255) NOT NULL,
  `ap_address` varchar(255) NOT NULL,
  `ap_city` varchar(255) NOT NULL,
  `ap_code` varchar(55) NOT NULL,
  `ap_date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`ap_id`, `ap_name`, `ap_address`, `ap_city`, `ap_code`, `ap_date_added`) VALUES
(00000001, 'Gatwick Airport', 'Horley, Gatwick RH6 0NP', 'United Kingdom', 'LGW', '2023-10-27 19:00:00'),
(00000002, 'Heathrow Airport', 'Longford TW6, UK', 'United Kingdom', 'LHR', '2023-10-27 19:00:00'),
(00000003, 'Manchester Airport', 'Manchester M90 1QX', 'United Kingdom', 'MAN', '2023-10-27 19:00:00'),
(00000004, 'Birmingham Airport', 'Birmingham B26 3QJ', 'United Kingdom', 'BHX', '2023-10-27 19:00:00'),
(00000005, 'Stansted Airport', 'Bassingbourn Rd, Stansted CM24 1QW', 'United Kingdom', 'STN', '2023-10-27 19:00:00'),
(00000006, 'Leeds Bradford Airport', 'Whitehouse Ln, Yeadon, Leeds LS19 7TU', 'United Kingdom', 'LBA', '2023-10-27 19:00:00'),
(00000007, 'Luton Airport', 'Airport Way, Luton LU2 9LY', 'United Kingdom', 'LTN', '2023-10-27 19:00:00'),
(00000008, 'Southend Airport', 'Eastwoodbury Cres, Southend-on-Sea SS2 6YF', 'United Kingdom', 'SEN', '2023-10-27 19:00:00'),
(00000009, 'London City Airport', 'Hartmann Rd, London E16 2PX', 'United Kingdom', 'LCY', '2023-10-27 19:00:00'),
(00000010, 'Newcastle International Airport', 'Woolsington, Newcastle upon Tyne NE13 8BZ', 'United Kingdom', 'NCL', '2023-10-27 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `availability_times`
--

CREATE TABLE `availability_times` (
  `at_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `at_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `at_status` int(11) NOT NULL DEFAULT 0,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `availability_times`
--

INSERT INTO `availability_times` (`at_id`, `d_id`, `at_date`, `start_time`, `end_time`, `at_status`, `added_time`) VALUES
(00000001, 00000002, '2024-08-22', '10:00:00', '13:00:00', 1, '2024-08-21 20:10:23'),
(00000002, 00000002, '2024-08-22', '14:00:00', '16:00:00', 1, '2024-08-21 20:44:52'),
(00000003, 00000002, '2024-08-22', '17:00:00', '19:00:00', 1, '2024-08-21 21:12:34'),
(00000004, 00000002, '2024-08-23', '09:00:00', '11:00:00', 1, '2024-08-21 21:05:21'),
(00000005, 00000002, '2024-08-23', '09:00:00', '11:00:00', 1, '2024-08-21 21:04:18'),
(00000006, 00000002, '2024-08-23', '09:00:00', '11:00:00', 1, '2024-08-21 21:05:38');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `bid_amount` varchar(255) NOT NULL,
  `bidding_status` int(11) NOT NULL DEFAULT 0,
  `bid_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid_id`, `book_id`, `d_id`, `bid_amount`, `bidding_status`, `bid_date`) VALUES
(00000000001, 00000000044, 00000000001, '55', 0, '2024-08-31 10:16:44'),
(00000000002, 00000000061, 00000000001, '2000', 0, '2024-08-31 10:37:14'),
(00000000003, 00000000061, 00000000001, '58888', 0, '2024-08-31 10:37:19'),
(00000000004, 00000000061, 00000000001, '6666', 0, '2024-08-31 10:37:23'),
(00000000005, 00000000061, 00000000001, '55555', 0, '2024-08-31 10:37:33'),
(00000000006, 00000000062, 00000000001, '5526355', 0, '2024-08-31 10:38:22'),
(00000000007, 00000000061, 00000000002, '25', 0, '2024-09-05 19:27:39'),
(00000000008, 00000000063, 00000000002, '30', 0, '2024-09-05 19:28:10');

-- --------------------------------------------------------

--
-- Table structure for table `booker_account`
--

CREATE TABLE `booker_account` (
  `acc_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `comission_amount` decimal(10,0) NOT NULL,
  `comission_status` varchar(255) NOT NULL,
  `commission_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booker_account`
--

INSERT INTO `booker_account` (`acc_id`, `c_id`, `book_id`, `comission_amount`, `comission_status`, `commission_date`) VALUES
(00000001, 00000000000, 00000000066, 400, '', '2024-09-03 21:38:38'),
(00000002, 00000000000, 00000000067, 19, '', '2024-09-03 22:04:14'),
(00000003, 00000000000, 00000000068, 19, '', '2024-09-03 22:15:27'),
(00000004, 00000000002, 00000000070, 8, '', '2024-09-05 20:59:44'),
(00000005, 00000000002, 00000000083, 50, '', '2024-09-08 14:50:16'),
(00000006, 00000000001, 00000000084, 7, '', '2024-09-08 15:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `b_type_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pickup` varchar(255) NOT NULL,
  `stops` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `passenger` tinyint(3) UNSIGNED NOT NULL,
  `pick_date` date NOT NULL,
  `pick_time` time NOT NULL,
  `journey_type` varchar(55) NOT NULL,
  `v_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `luggage` varchar(255) NOT NULL,
  `child_seat` varchar(255) NOT NULL,
  `flight_number` varchar(255) NOT NULL,
  `delay_time` time NOT NULL,
  `note` text NOT NULL,
  `journey_fare` int(11) NOT NULL,
  `journey_distance` int(11) NOT NULL,
  `booking_fee` int(11) NOT NULL,
  `car_parking` int(11) NOT NULL,
  `waiting` int(11) NOT NULL,
  `tolls` int(11) NOT NULL,
  `extra` int(11) NOT NULL,
  `booker_commission` int(10) NOT NULL,
  `booking_status` varchar(55) NOT NULL,
  `bid_status` tinyint(1) NOT NULL DEFAULT 0,
  `bid_time` datetime NOT NULL,
  `bid_note` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `book_add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `b_type_id`, `c_id`, `pickup`, `stops`, `destination`, `address`, `postal_code`, `passenger`, `pick_date`, `pick_time`, `journey_type`, `v_id`, `luggage`, `child_seat`, `flight_number`, `delay_time`, `note`, `journey_fare`, `journey_distance`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `booker_commission`, `booking_status`, `bid_status`, `bid_time`, `bid_note`, `payment_type`, `customer_name`, `customer_email`, `customer_phone`, `book_add_date`) VALUES
(00000003, 00000001, 00000001, 'Manchester, UK', '', 'London, UK', '698-702 High Road', 'N12 9PY', 2, '2024-08-31', '21:00:00', 'One Way', 00000001, '2', 'Yes', '', '00:00:00', '', 5040, 336, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000005, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'London, UK', '', 'W16', 2, '2024-08-31', '18:00:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 414, 28, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000006, 00000001, 00000001, 'Leeds, UK', '', 'Leicester, UK', '', 'N12', 2, '2024-08-31', '10:15:00', 'One Way', 00000001, '1', 'Yes', '', '00:00:00', '', 2370, 158, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000007, 00000001, 00000001, 'Leeds, UK', '', 'Luton, UK', '', 'N12 9PY', 2, '2024-08-31', '16:37:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 3975, 265, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000008, 00000001, 00000001, 'Liverpool, UK', '', 'Leeds, UK', '', 'N12 9PY', 2, '2024-08-31', '17:31:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 1755, 117, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000010, 00000001, 00000001, 'Dartford, UK', '', 'Deeside, UK', '', 'N12 9PY', 2, '2024-08-31', '23:45:00', 'One Way', 00000003, '2', 'No', '', '00:00:00', '', 5715, 381, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000012, 00000001, 00000001, 'London W2, UK', '', 'London W3, UK', '', 'N12 9PY', 3, '2024-08-31', '21:30:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 134, 9, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000013, 00000001, 00000001, 'Leeds, UK', '', 'Leicester, UK', 'ik', 'W12', 2, '2024-08-31', '16:12:00', 'One Way', 00000003, '2', 'No', '', '00:00:00', '', 2370, 158, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000014, 00000001, 00000001, 'Norwich, UK', '', 'Hastings, UK', 'uk', 'W12', 4, '2024-08-31', '17:22:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 4050, 270, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000015, 00000001, 00000001, 'Manchester, UK', '', 'Milton Keynes, UK', 'uk', 'W12', 3, '2024-08-31', '17:22:00', 'One Way', 00000006, '2', 'No', '', '00:00:00', '', 3690, 246, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000016, 00000001, 00000001, 'Farringdon, London, UK', '', 'Wales, UK', 'uk', 'W12', 3, '2024-08-31', '17:50:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 5130, 342, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000017, 00000001, 00000001, 'Edinburgh, UK', '', 'Richmond, UK', 'uk', 'W12', 9, '2024-08-31', '17:25:00', 'One Way', 00000003, '2', 'No', '', '00:00:00', '', 9930, 662, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000019, 00000001, 00000001, 'Wales, UK', '', 'Winchester, UK', 'ik', 'N12 9PY', 5, '2024-08-31', '02:46:00', 'One Way', 00000001, '2', 'Yes', '', '00:00:00', '', 4568, 290, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000020, 00000001, 00000001, 'Fort William, UK', '', 'Devon, UK', 'ik', 'W12', 8, '2024-08-31', '05:48:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 14553, 924, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000021, 00000001, 00000001, 'Ullapool, UK', '', 'Uxbridge, UK', '', 'N12 9PY', 2, '2024-08-31', '21:27:00', 'Return', 00000001, '2', 'No', '', '00:00:00', '', 15404, 978, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000022, 00000001, 00000001, 'Henley-on-Thames, UK', '', 'Hertfordshire, UK', '', 'N12 9PY', 6, '2024-08-31', '22:11:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 1232, 78, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000023, 00000001, 00000001, 'London W2, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'N12 9PY', 2, '2024-08-31', '18:30:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 387, 26, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000024, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', ',,', 'London, UK', 'uk', 'N12 9PY', 2, '2024-08-31', '00:38:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 450, 30, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000025, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'N12 9PY', 3, '2024-08-31', '23:30:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 360, 40, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000026, 00000001, 00000001, 'West London Studios, Fulham Road, London, UK', '', 'Central London, London, UK', 'W12', 'N12= North Finchley, Woodside Park', 2, '2024-08-31', '16:00:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 89, 6, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000027, 00000003, 00000001, 'Leadgate, Consett, UK', '', 'Airport Tavern, Bridgwater Road, Lulsgate, Felton, Bristol, UK', '', 'N17= Tottenham', 2, '2024-08-31', '22:20:00', 'One Way', 00000003, '2', 'No', '', '00:00:00', '', 7335, 489, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000028, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'Central London, London, UK', '', 'N4= Finsbury Park, Manor House', 2, '2024-08-31', '17:29:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 413, 28, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000029, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'Central London, London, UK', '', 'N7= Holloway', 2, '2024-08-31', '23:30:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 433, 28, 30, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000030, 00000003, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'East Ham, London, UK', '', 'N12= North Finchley, Woodside Park', 2, '2024-08-31', '19:30:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 1520, 97, 30, 0, 0, 0, 0, 20, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000031, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'High Road, London N12 9PY, UK', '', ' ', 1, '2024-08-31', '22:30:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 513, 33, 0, 0, 0, 0, 0, 0, 'Pending', 1, '2024-08-26 19:14:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000032, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'East Ham, London, UK', '698-702 High Road', 'N4= Finsbury Park, Manor House', 2, '2024-08-31', '17:35:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 840, 56, 30, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'azibahmed@hotmail.co.uk', '07552834179', '2024-08-31 16:06:34'),
(00000033, 00000001, 00000001, 'Stansted Airport, Stansted, UK', '', 'London E3 3JG, UK', '', ' ', 2, '2024-08-31', '21:30:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 795, 53, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000034, 00000003, 00000001, 'Jail Lane, Biggin Hill, Westerham, UK', '', 'Eastbourne, UK', '', 'N7= Holloway', 2, '2024-08-31', '23:34:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 1202, 76, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000035, 00000001, 00000001, 'London Luton Airport Roundabout, Luton, UK', '', 'Luton, UK', '', 'W12', 2, '2024-08-31', '18:15:00', 'One Way', 00000003, '2', 'Yes', '', '00:00:00', '', 48, 3, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000036, 00000003, 00000001, 'Jail Road, Batley, UK', '', 'Weston-super-Mare, UK', '', 'N12', 2, '2024-08-31', '23:50:00', 'One Way', 00000001, '1', 'Yes', '', '00:00:00', '', 5686, 361, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000037, 00000001, 00000001, 'Airport Way, Luton, UK', '', 'Valley Avenue, London N12 9PG, UK', '', ' ', 2, '2024-08-31', '23:07:00', 'One Way', 00000004, '', '', '', '00:00:00', '', 710, 47, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000038, 00000003, 00000001, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', 'Weston-super-Mare, UK', '', 'N19= Archway, Tufnell Park', 2, '2024-08-31', '20:52:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 3060, 204, 30, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000039, 00000003, 00000001, 'Weston-super-Mare, UK', '', 'Eastbourne, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-08-31', '20:30:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 5085, 339, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000040, 00000001, 00000001, 'Faisal Food Store, Derby Street, Bolton, UK', '', 'Zamor Crescent, Thurcroft, Rotherham, UK', '', ' ', 2, '2024-08-31', '19:45:00', 'One Way', 00000004, '', '', '', '00:00:00', '', 1965, 131, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000041, 00000002, 00000001, 'Farnborough, UK', ',', 'London, UK', '', 'N2= East Finchley', 2, '2024-08-31', '19:09:00', '', 00000004, '', '', '', '00:00:00', '', 930, 62, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000042, 00000001, 00000001, 'Hertfordshire, UK', '', 'Eastbourne, UK', '', 'N12= North Finchley, Woodside Park', 2, '2024-08-31', '23:10:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 2945, 187, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000043, 00000001, 00000001, 'Jail Lane, Biggin Hill, Westerham, UK', '', 'East Ham, London, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-08-31', '21:44:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 773, 49, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000044, 00000001, 00000001, 'Jail Lane, Biggin Hill, Westerham, UK', '', 'East Ham, London, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-08-31', '21:36:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 773, 49, 0, 0, 0, 0, 0, 0, 'Pending', 1, '2024-08-23 21:06:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000046, 00000001, 00000001, 'London W2 2UH, UK', '', 'Westminster, London, UK', '', ' ', 2, '2024-08-31', '20:55:00', 'One Way', 00000004, '', '', '', '00:00:00', '', 68, 4, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000047, 00000001, 00000001, '736 Bath Road, Cranford, Hounslow, UK', '', 'Heathfield, UK', '', ' ', 1, '2024-08-31', '22:15:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 1875, 125, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000048, 00000001, 00000001, '736 Bath Road, Cranford, Hounslow, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '164-166 High Road', ' ', 1, '2024-08-31', '23:25:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 71, 5, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000049, 00000001, 00000001, 'Stansted Airport, Stansted, UK', '', 'Harlow, UK', '', ' ', 1, '2024-08-31', '23:50:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 342, 23, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000050, 00000001, 00000001, 'London, UK', '', 'Luton, UK', '', 'N3= Finchley Central', 1, '2024-08-31', '21:30:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 851, 54, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000051, 00000001, 00000001, 'Nottingham, UK', '', 'Loughborough, UK', '', ' ', 1, '2024-08-31', '21:30:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 398, 25, 0, 68, 25, 35, 5, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000052, 00000001, 00000001, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', 'East Ham, London, UK', '698-702 High Road', 'SE19= Crystal Palace, Upper Norwood', 2, '2024-08-31', '23:15:00', 'One Way', 00000002, '6', 'No', '', '00:00:00', '', 880, 56, 30, 25, 96, 32, 64, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'azibahmed@hotmail.co.uk', '07552834179', '2024-08-31 16:06:34'),
(00000053, 00000001, 00000001, 'Heath and Reach, Leighton Buzzard, UK', ',', 'Eastbourne, UK', 'Muzaffar Kaloni gali Nomber 12', 'E10= Leyton', 3, '2024-08-31', '13:19:00', 'One Way', 00000002, '3', 'No', '', '00:00:00', '', 3105, 207, 20, 20, 0, 50, 50, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000054, 00000001, 00000001, 'Terminal 5, Wallis Road, Longford, Hounslow, UK', '', 'London NW3 2QG, UK', '', ' ', 1, '2024-08-31', '18:30:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 717, 48, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000055, 00000001, 00000001, 'Heathrow Terminal 1, Hounslow, UK', '', 'Nw3', '', ' ', 1, '2024-08-31', '23:25:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 0, 0, 0, 3, 4, 5, 2, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000056, 00000001, 00000001, 'High Road, London N12 9PY, UK', '', 'Lewes Road, London N12 9NH, UK', '', ' ', 1, '2024-08-31', '21:50:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 17, 1, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000057, 00000001, 00000001, 'Londonderry, UK', '', 'London, UK', 'Street 3 near kareem Town FSD', 'N7= Holloway', 5, '2024-08-31', '23:00:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 12915, 861, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', 'Fuy', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000058, 00000001, 00000001, 'High Road, London N12 9PY, UK', '', 'Torrington Park, London N12 9TS, UK', '', 'W12', 1, '2024-08-31', '12:55:00', 'One Way', 00000002, '1', 'Yes', '', '00:00:00', '', 17, 1, 0, 28, 0, 30, 40, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000059, 00000001, 00000001, 'Stansted Airport, Stansted, UK', '', 'Harlow CM20, UK', '', ' ', 1, '2024-08-31', '11:45:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 363, 24, 0, 5, 5, 22, 0, 0, 'Pending', 1, '2024-08-31 00:33:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000060, 00000001, 00000001, 'Londonderry, UK', '', 'Airport Tavern, Bridgwater Road, Lulsgate, Felton, Bristol, UK', '', ' ', 3, '2024-08-31', '10:30:00', 'One Way', 00000003, '', 'No', '', '00:00:00', '', 12210, 814, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000061, 00000001, 00000001, 'Weston-super-Mare, UK', '', 'Eastbourne, UK', '', 'N4= Finsbury Park, Manor House', 2, '2024-08-31', '15:00:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 5085, 339, 0, 58, 50, 18, 88, 0, 'Pending', 1, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000062, 00000001, 00000001, 'West Cromwell Road, London, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'N12= North Finchley, Woodside Park', 1, '2024-08-31', '12:20:00', 'One Way', 00000003, '2', '', '', '00:00:00', '', 350, 23, 0, 555, 5555, 66666, 55, 0, 'Booked', 1, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000063, 00000001, 00000001, 'London NW6 5DE, UK', '', 'London NW6 5DE, UK', '', ' ', 1, '2024-08-31', '11:27:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 15, 1, 0, 0, 0, 0, 0, 0, 'Pending', 1, '0000-00-00 00:00:00', '', '', '', 'hello@prenero.com', '+443157524000', '0000-00-00 00:00:00'),
(00000064, 00000002, 00000001, 'London NW9, UK', '', 'Crouch Hill, London N4 4AP, UK', '', ' ', 5, '2024-09-02', '11:50:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 189, 13, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '0000-00-00 00:00:00'),
(00000065, 00000001, 00000001, 'Gatwick, UK', '', 'Gateshead, UK', '', ' ', 1, '2024-09-02', '22:55:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 7755, 517, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'hello@prenero.com', '+443157524000', '0000-00-00 00:00:00'),
(00000066, 00000003, 00000001, ' - C3VP+2J9, Mustaffabad Faisalabad, Punjab, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-04', '21:04:00', '', 00000002, '1', '', '', '00:00:00', ' ', 10, 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Personal', 'atiq bhai', 'prenero@gmail.com', '+447365363737', '2024-09-03 17:38:38'),
(00000067, 00000003, 00000001, ' - C3VP+2J9, Mustaffabad Faisalabad, Punjab, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-04', '20:42:00', '', 00000002, '1', '', '', '00:00:00', ' ', 10, 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Personal', 'atiq bhai ', 'prenero@gmail.com', '+445757898544', '2024-09-03 18:04:14'),
(00000068, 00000003, 00000001, ' - C3VP+2J9, Mustaffabad Faisalabad, Punjab, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-05', '23:42:00', '', 00000002, '1', '', '', '00:00:00', ' ', 10, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', 'Personal', 'atiq bhai ', 'prenero@gmail.com', '+445757898544', '2024-09-03 18:15:27'),
(00000069, 00000001, 00000001, 'Torrington Park, London N12 9TS, UK', '', 'High Road, London N12 9PY, UK', '', ' ', 2, '2024-09-05', '21:50:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 13, 1, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'hello@prenero.com', '+443157524000', '0000-00-00 00:00:00'),
(00000070, 00000003, 00000002, ' - C3RQ+FMX, Mustafa Rd, Mustaffabad Islam Nagar, Faisalabad, Punjab, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-05', '22:57:00', '', 00000001, '1', '', '', '00:00:00', ' ', 13, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', 'Personal', 'aqib', 'prenero@gmail.com', '+443475263637', '2024-09-05 16:59:44'),
(00000071, 00000003, 00000002, 'Jail Lane, Biggin Hill, Westerham, UK', '', 'West Wittering, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-09-07', '01:40:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 1843, 117, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000072, 00000003, 00000002, 'Westminster, London, UK', '', 'Northampton, UK', '', 'N10= Muswell Hill', 2, '2024-09-07', '19:12:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 1635, 109, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000073, 00000003, 00000002, 'Next Arndale Centre, Corporation Street, Manchester, UK', '', 'Westminster, London, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-09-07', '19:45:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 5235, 349, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000074, 00000003, 00000002, 'Weston-super-Mare, UK', '', 'Northampton, UK', 'Muzaffar Kaloni gali Nomber 12', 'N4= Finsbury Park, Manor House', 2, '2024-09-07', '19:05:00', 'One Way', 00000001, '1', '', '', '00:00:00', '', 3270, 218, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000075, 00000001, 00000001, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', ',', 'East Ham, London, UK', 'Muzaffar Kaloni gali Nomber 12', 'SW19= Merton, Wimbledon', 2, '2024-09-07', '16:57:00', 'One Way', 00000003, '3', 'No', '', '00:00:00', '', 3105, 97, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000076, 00000001, 00000001, 'Health Centre, Coker Close, Bicester, UK', '', 'Health Centre Road, Coventry, UK', 'Muzaffar Kaloni gali Nomber 12', 'N19= Archway, Tufnell Park', 2, '2024-09-07', '17:05:00', 'One Way', 00000001, '3', 'No', '', '00:00:00', '', 3105, 73, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000077, 00000001, 00000001, 'Health House, Grange Park Lane, Willerby, Hull, UK', ',,', 'Headingley, Leeds, UK', 'Muzaffar Kaloni gali Nomber 12', 'N12= North Finchley, Woodside Park', 2, '2024-09-07', '17:18:00', 'One Way', 00000005, '6', 'No', '', '00:00:00', '', 3105, 98, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000078, 00000001, 00000001, 'Health Centre, Coker Close, Bicester, UK', '', 'Harrogate, UK', 'Muzaffar Kaloni gali Nomber 12', 'N19= Archway, Tufnell Park', 2, '2024-09-07', '17:24:00', 'One Way', 00000007, '3', 'No', '', '00:00:00', '', 3105, 279, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000079, 00000001, 00000001, 'Healaugh, Richmond, UK', '', 'Hull, UK', 'Muzaffar Kaloni gali Nomber 12', 'N10= Muswell Hill', 2, '2024-09-07', '17:28:00', 'One Way', 00000007, '3', 'No', '', '00:00:00', '', 3105, 171, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000080, 00000001, 00000001, 'Health Centre Road, Coventry, UK', '', 'Heathfield, UK', 'Muzaffar Kaloni gali Nomber 12', 'N11= Friern Barnet, New Southgate', 3, '2024-09-07', '17:44:00', '', 00000005, '3', '', '', '00:00:00', '', 3105, 253, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000081, 00000001, 00000001, 'Health House, Grange Park Lane, Willerby, Hull, UK', '', 'Headingley, Leeds, UK', 'Muzaffar Kaloni gali Nomber 12', 'N14= Southgate', 3, '2024-09-07', '17:49:00', 'One Way', 00000005, '3', 'No', '', '00:00:00', '', 3105, 98, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000082, 00000001, 00000001, 'Health House, Grange Park Lane, Willerby, Hull, UK', '', 'Healing, UK', 'Muzaffar Kaloni gali Nomber 12', 'N13= Palmers Green', 3, '2024-09-07', '17:54:00', 'One Way', 00000003, '3', 'No', '', '00:00:00', '', 3105, 43, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000083, 00000003, 00000002, ' - C3HH+WF6, Jail Rd, Civil Lines, Faisalabad, Punjab, Pakistan', '[]', 'Sheikh Ahmad kryana store Akbar Chowk, Gulistan Colony, Faisalabad, Pakistan', '', '', 4, '2024-09-08', '02:44:00', '', 00000002, '1', '', '', '00:00:00', ' ', 26, 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Personal', 'Wajeeh ', 'prenero@gmail.co.', '03346452312', '2024-09-08 10:50:16'),
(00000084, 00000003, 00000001, ' - C3VP+2J9, Mustaffabad Faisalabad, Punjab, Pakistan', '[]', 'Horley, Gatwick RH6 0NP', '', '', 4, '2024-09-08', '03:49:00', '', 00000002, '1', '', '', '00:00:00', ' ', 40, 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Personal', 'Muhammad Atiq', 'prenero@gmail.com', '+443157524000', '2024-09-08 11:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `booking_type`
--

CREATE TABLE `booking_type` (
  `b_type_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `b_type_name` varchar(255) NOT NULL,
  `b_added_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_type`
--

INSERT INTO `booking_type` (`b_type_id`, `b_type_name`, `b_added_date`) VALUES
(00000000001, 'Cash/Card', '2023-12-20 14:35:58'),
(00000000002, 'Account', '2023-12-20 14:35:58'),
(00000000003, 'Booker', '2023-12-20 14:35:58'),
(00000000004, 'Parcel Delivery', '2023-12-20 14:35:58'),
(00000000005, 'Online App/Website', '2023-12-20 14:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `break_time`
--

CREATE TABLE `break_time` (
  `bt_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `total_time` time NOT NULL,
  `break_status` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `break_time`
--

INSERT INTO `break_time` (`bt_id`, `d_id`, `start_time`, `end_time`, `total_time`, `break_status`) VALUES
(00000001, 00000002, '2024-09-02 10:54:24', '2024-09-02 10:54:37', '00:10:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cancelled_bookings`
--

CREATE TABLE `cancelled_bookings` (
  `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `cancel_reason` text NOT NULL,
  `date_cancelled` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cancelled_bookings`
--

INSERT INTO `cancelled_bookings` (`cb_id`, `book_id`, `cancel_reason`, `date_cancelled`) VALUES
(00000001, 00000070, 'Meri merzi\n', '0000-00-00 00:00:00'),
(00000002, 00000070, 'assss', '0000-00-00 00:00:00'),
(00000003, 00000070, 'assss', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `c_email` varchar(255) NOT NULL,
  `c_phone` varchar(255) NOT NULL,
  `c_password` varchar(255) NOT NULL,
  `c_address` varchar(255) NOT NULL,
  `c_gender` varchar(55) NOT NULL,
  `c_language` varchar(55) NOT NULL,
  `c_pic` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `others` text NOT NULL,
  `c_ni` varchar(255) NOT NULL,
  `status` int(5) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `commission_type` varchar(55) NOT NULL,
  `percentage` int(10) NOT NULL,
  `fixed` int(10) NOT NULL,
  `acount_status` tinyint(2) NOT NULL,
  `account_type` tinyint(2) NOT NULL,
  `login_token` varchar(255) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `status`, `company_name`, `commission_type`, `percentage`, `fixed`, `acount_status`, `account_type`, `login_token`, `reg_date`) VALUES
(00000001, 'Muhammad Atiq', 'hello@prenero.com', '+443157524000', '12345678', '', 'Male', 'English', '', 'N12= North Finchley, Woodside Park', '', '', 0, '', '', 0, 0, 1, 1, '07080bc0ecbca27fb579862f0e86b984c889652a3b85fdf69497477535796eae', '2024-09-08 13:29:36'),
(00000002, 'saad', 'sales@prenero.com', '+443225896555', 'asdf1234', '', 'Male', 'English', '66dd7508ec875.jpg', 'N4= Finsbury Park, Manor House', '', '', 0, '', '1', 5, 0, 1, 2, '68ed8f83b93951399e108244e1abdf5fce4e7056900056c897227ad0bc80c2d2', '2024-09-08 10:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `com_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `com_name` varchar(255) NOT NULL,
  `com_email` varchar(255) NOT NULL,
  `com_phone` varchar(255) NOT NULL,
  `com_password` varchar(255) NOT NULL,
  `com_address` varchar(255) NOT NULL,
  `com_person` varchar(55) NOT NULL,
  `com_pic` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `com_pin` varchar(255) NOT NULL,
  `acount_status` tinyint(2) NOT NULL,
  `reg_com_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`com_id`, `com_name`, `com_email`, `com_phone`, `com_password`, `com_address`, `com_person`, `com_pic`, `postal_code`, `com_pin`, `acount_status`, `reg_com_date`) VALUES
(00000001, 'Prenero Solutions', 'prenero12@gmail.com', '+923127346634', '6266a', 'P-24, Hamza Market', 'Atiq Ramzan', '', '38000', '1102', 1, '2024-08-16 07:54:56'),
(00000002, 'Prenero Studio', 'hello@prenero.com', '+923157524000', '123456', '', 'Atiq Ramzan', '6697b820bb13a_1721219104.png', 'W12', '1234', 1, '2024-07-17 13:14:21');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `user_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `com_name` varchar(255) NOT NULL,
  `com_logo` varchar(255) NOT NULL,
  `com_phone` varchar(255) NOT NULL,
  `com_c_email` varchar(255) NOT NULL,
  `com_a_email` varchar(255) NOT NULL,
  `com_a_phone` varchar(255) NOT NULL,
  `com_web` varchar(255) NOT NULL,
  `com_licence` varchar(255) NOT NULL,
  `com_vat` varchar(255) NOT NULL,
  `com_r_num` varchar(255) NOT NULL,
  `com_tax` int(55) NOT NULL,
  `com_address` varchar(255) NOT NULL,
  `com_zip` varchar(55) NOT NULL,
  `com_city` varchar(255) NOT NULL,
  `com_country` varchar(255) NOT NULL,
  `com_language` varchar(55) NOT NULL,
  `com_currency` varchar(15) NOT NULL,
  `com_time_zone` varchar(55) NOT NULL,
  `com_date_reg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `user_id`, `com_name`, `com_logo`, `com_phone`, `com_c_email`, `com_a_email`, `com_a_phone`, `com_web`, `com_licence`, `com_vat`, `com_r_num`, `com_tax`, `com_address`, `com_zip`, `com_city`, `com_country`, `com_language`, `com_currency`, `com_time_zone`, `com_date_reg`) VALUES
(00000001, 00000001, 'MiniCAB Taxi Booking ', '6692126d737a2_Prenero Softwares Icon.png', '+44 7552 834179', 'contact@minicaboffice.com', 'admin@minicaboffice.com', '+44 7552 834179', 'minicaboffice.com', '', '', '', 0, '', '', '', 'United Kingdom', 'English', 'GBP', 'Asia', '2024-07-13 05:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(8) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `date_country_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `date_country_add`) VALUES
(1, 'Afghanistan', '2024-02-09 17:12:23'),
(2, 'Albania', '2024-02-09 17:12:23'),
(3, 'Algeria', '2024-02-09 17:12:23'),
(4, 'Andorra', '2024-02-09 17:12:23'),
(5, 'Angola', '2024-02-09 17:12:23'),
(6, 'Antigua and Barbuda', '2024-02-09 17:12:23'),
(7, 'Argentina', '2024-02-09 17:12:23'),
(8, 'Armenia', '2024-02-09 17:12:23'),
(9, 'Australia', '2024-02-09 17:12:23'),
(10, 'Austria', '2024-02-09 17:12:23'),
(11, 'Azerbaijan', '2024-02-09 17:12:23'),
(12, 'The Bahamas', '2024-02-09 17:12:23'),
(13, 'Bahrain', '2024-02-09 17:12:23'),
(14, 'Bangladesh', '2024-02-09 17:12:23'),
(15, 'Barbados', '2024-02-09 17:12:23'),
(16, 'Belarus', '2024-02-09 17:12:23'),
(17, 'Belgium', '2024-02-09 17:12:23'),
(18, 'Belize', '2024-02-09 17:12:23'),
(19, 'Benin', '2024-02-09 17:12:23'),
(20, 'Bhutan', '2024-02-09 17:12:23'),
(21, 'Bolivia', '2024-02-09 17:12:23'),
(22, 'Bosnia and Herzegovina', '2024-02-09 17:12:23'),
(23, 'Botswana', '2024-02-09 17:12:23'),
(24, 'Brazil', '2024-02-09 17:12:23'),
(25, 'Brunei', '2024-02-09 17:12:23'),
(26, 'Bulgaria', '2024-02-09 17:12:23'),
(27, 'Burkina Faso', '2024-02-09 17:12:23'),
(28, 'Burundi', '2024-02-09 17:12:23'),
(29, 'Cabo Verde', '2024-02-09 17:12:23'),
(30, 'Cambodia', '2024-02-09 17:12:23'),
(31, 'Cameroon', '2024-02-09 17:12:23'),
(32, 'Canada', '2024-02-09 17:12:23'),
(33, 'Central African Republic', '2024-02-09 17:12:23'),
(34, 'Chad', '2024-02-09 17:12:23'),
(35, 'Chile', '2024-02-09 17:12:23'),
(36, 'China', '2024-02-09 17:12:23'),
(37, 'Colombia', '2024-02-09 17:12:23'),
(38, 'Comoros', '2024-02-09 17:12:23'),
(39, 'Congo, Democratic Republic of the', '2024-02-09 17:12:23'),
(40, 'Congo, Republic of the', '2024-02-09 17:12:23'),
(41, 'Costa Rica', '2024-02-09 17:12:23'),
(42, 'Côte d’Ivoire', '2024-02-09 17:12:23'),
(43, 'Croatia', '2024-02-09 17:12:23'),
(44, 'Cuba', '2024-02-09 17:12:23'),
(45, 'Cyprus', '2024-02-09 17:12:23'),
(46, 'Czech Republic', '2024-02-09 17:12:23'),
(47, 'Denmark', '2024-02-09 17:12:23'),
(48, 'Djibouti', '2024-02-09 17:12:23'),
(49, 'Dominica', '2024-02-09 17:12:23'),
(50, 'Dominican Republic', '2024-02-09 17:12:23'),
(51, 'East Timor (Timor-Leste)', '2024-02-09 17:12:23'),
(52, 'Ecuador', '2024-02-09 17:12:23'),
(53, 'Egypt', '2024-02-09 17:12:23'),
(54, 'El Salvador', '2024-02-09 17:12:23'),
(55, 'Equatorial Guinea', '2024-02-09 17:12:23'),
(56, 'Eritrea', '2024-02-09 17:12:23'),
(57, 'Estonia', '2024-02-09 17:12:23'),
(58, 'Eswatini', '2024-02-09 17:12:23'),
(59, 'Ethiopia', '2024-02-09 17:12:23'),
(60, 'Fiji', '2024-02-09 17:12:23'),
(61, 'Finland', '2024-02-09 17:12:23'),
(62, 'France', '2024-02-09 17:12:23'),
(63, 'Gabon', '2024-02-09 17:12:23'),
(64, 'The Gambia', '2024-02-09 17:12:23'),
(65, 'Georgia', '2024-02-09 17:12:23'),
(66, 'Germany', '2024-02-09 17:12:23'),
(67, 'Ghana', '2024-02-09 17:12:23'),
(68, 'Greece', '2024-02-09 17:12:23'),
(69, 'Grenada', '2024-02-09 17:12:23'),
(70, 'Guatemala', '2024-02-09 17:12:23'),
(71, 'Guinea', '2024-02-09 17:12:23'),
(72, 'Guinea-Bissau', '2024-02-09 17:12:23'),
(73, 'Guyana', '2024-02-09 17:12:23'),
(74, 'Haiti', '2024-02-09 17:12:23'),
(75, 'Honduras', '2024-02-09 17:12:23'),
(76, 'Hungary', '2024-02-09 17:12:23'),
(77, 'Iceland', '2024-02-09 17:12:23'),
(78, 'India', '2024-02-09 17:12:23'),
(79, 'Indonesia', '2024-02-09 17:12:23'),
(80, 'Iran', '2024-02-09 17:12:23'),
(81, 'Iraq', '2024-02-09 17:12:23'),
(82, 'Ireland', '2024-02-09 17:12:23'),
(83, 'Israel', '2024-02-09 17:12:23'),
(84, 'Italy', '2024-02-09 17:12:23'),
(85, 'Jamaica', '2024-02-09 17:12:23'),
(86, 'Japan', '2024-02-09 17:12:23'),
(87, 'Jordan', '2024-02-09 17:12:23'),
(88, 'Kazakhstan', '2024-02-09 17:12:23'),
(89, 'Kenya', '2024-02-09 17:12:23'),
(90, 'Kiribati', '2024-02-09 17:12:23'),
(91, 'Korea, North', '2024-02-09 17:12:23'),
(92, 'Korea, South', '2024-02-09 17:12:23'),
(93, 'Kosovo', '2024-02-09 17:12:23'),
(94, 'Kuwait', '2024-02-09 17:12:23'),
(95, 'Kyrgyzstan', '2024-02-09 17:12:23'),
(96, 'Laos', '2024-02-09 17:12:23'),
(97, 'Latvia', '2024-02-09 17:12:23'),
(98, 'Lebanon', '2024-02-09 17:12:23'),
(99, 'Lesotho', '2024-02-09 17:12:23'),
(100, 'Liberia', '2024-02-09 17:12:23'),
(101, 'Libya', '2024-02-09 17:12:23'),
(102, 'Liechtenstein', '2024-02-09 17:12:23'),
(103, 'Lithuania', '2024-02-09 17:12:23'),
(104, 'Luxembourg', '2024-02-09 17:12:23'),
(105, 'Madagascar', '2024-02-09 17:12:23'),
(106, 'Malawi', '2024-02-09 17:12:23'),
(107, 'Malaysia', '2024-02-09 17:12:23'),
(108, 'Maldives', '2024-02-09 17:12:23'),
(109, 'Mali', '2024-02-09 17:12:23'),
(110, 'Malta', '2024-02-09 17:12:23'),
(111, 'Marshall Islands', '2024-02-09 17:12:23'),
(112, 'Mauritania', '2024-02-09 17:12:23'),
(113, 'Mauritius', '2024-02-09 17:12:23'),
(114, 'Mexico', '2024-02-09 17:12:23'),
(115, 'Micronesia, Federated States of', '2024-02-09 17:12:23'),
(116, 'Moldova', '2024-02-09 17:12:23'),
(117, 'Monaco', '2024-02-09 17:12:23'),
(118, 'Mongolia', '2024-02-09 17:12:23'),
(119, 'Montenegro', '2024-02-09 17:12:23'),
(120, 'Morocco', '2024-02-09 17:12:23'),
(121, 'Mozambique', '2024-02-09 17:12:23'),
(122, 'Myanmar (Burma)', '2024-02-09 17:12:23'),
(123, 'Namibia', '2024-02-09 17:12:23'),
(124, 'Nauru', '2024-02-09 17:12:23'),
(125, 'Nepal', '2024-02-09 17:12:23'),
(126, 'Netherlands', '2024-02-09 17:12:23'),
(127, 'New Zealand', '2024-02-09 17:12:23'),
(128, 'Nicaragua', '2024-02-09 17:12:23'),
(129, 'Niger', '2024-02-09 17:12:23'),
(130, 'Nigeria', '2024-02-09 17:12:23'),
(131, 'North Macedonia', '2024-02-09 17:12:23'),
(132, 'Norway', '2024-02-09 17:12:23'),
(133, 'Oman', '2024-02-09 17:12:23'),
(134, 'Pakistan', '2024-02-09 17:12:23'),
(135, 'Palau', '2024-02-09 17:12:23'),
(136, 'Panama', '2024-02-09 17:12:23'),
(137, 'Papua New Guinea', '2024-02-09 17:12:23'),
(138, 'Paraguay', '2024-02-09 17:12:23'),
(139, 'Peru', '2024-02-09 17:12:23'),
(140, 'Philippines', '2024-02-09 17:12:23'),
(141, 'Poland', '2024-02-09 17:12:23'),
(142, 'Portugal', '2024-02-09 17:12:23'),
(143, 'Qatar', '2024-02-09 17:12:23'),
(144, 'Romania', '2024-02-09 17:12:23'),
(145, 'Russia', '2024-02-09 17:12:23'),
(146, 'Rwanda', '2024-02-09 17:12:23'),
(147, 'Saint Kitts and Nevis', '2024-02-09 17:12:23'),
(148, 'Saint Lucia', '2024-02-09 17:12:23'),
(149, 'Saint Vincent and the Grenadines', '2024-02-09 17:12:23'),
(150, 'Samoa', '2024-02-09 17:12:23'),
(151, 'San Marino', '2024-02-09 17:12:23'),
(152, 'Sao Tome and Principe', '2024-02-09 17:12:23'),
(153, 'Saudi Arabia', '2024-02-09 17:12:23'),
(154, 'Senegal', '2024-02-09 17:12:23'),
(155, 'Serbia', '2024-02-09 17:12:23'),
(156, 'Seychelles', '2024-02-09 17:12:23'),
(157, 'Sierra Leone', '2024-02-09 17:12:23'),
(158, 'Singapore', '2024-02-09 17:12:23'),
(159, 'Slovakia', '2024-02-09 17:12:23'),
(160, 'Slovenia', '2024-02-09 17:12:23'),
(161, 'Solomon Islands', '2024-02-09 17:12:23'),
(162, 'Somalia', '2024-02-09 17:12:23'),
(163, 'South Africa', '2024-02-09 17:12:23'),
(164, 'Spain', '2024-02-09 17:12:23'),
(165, 'Sri Lanka', '2024-02-09 17:12:23'),
(166, 'Sudan', '2024-02-09 17:12:23'),
(167, 'Sudan, South', '2024-02-09 17:12:23'),
(168, 'Suriname', '2024-02-09 17:12:23'),
(169, 'Sweden', '2024-02-09 17:12:23'),
(170, 'Switzerland', '2024-02-09 17:12:23'),
(171, 'Syria', '2024-02-09 17:12:23'),
(172, 'Taiwan', '2024-02-09 17:12:23'),
(173, 'Tajikistan', '2024-02-09 17:12:23'),
(174, 'Tanzania', '2024-02-09 17:12:23'),
(175, 'Thailand', '2024-02-09 17:12:23'),
(176, 'Togo', '2024-02-09 17:12:23'),
(177, 'Tonga', '2024-02-09 17:12:23'),
(178, 'Trinidad and Tobago', '2024-02-09 17:12:23'),
(179, 'Tunisia', '2024-02-09 17:12:23'),
(180, 'Turkey', '2024-02-09 17:12:23'),
(181, 'Turkmenistan', '2024-02-09 17:12:23'),
(182, 'Tuvalu', '2024-02-09 17:12:23'),
(183, 'Uganda', '2024-02-09 17:12:23'),
(184, 'Ukraine', '2024-02-09 17:12:23'),
(185, 'United Arab Emirates', '2024-02-09 17:12:23'),
(186, 'United Kingdom', '2024-02-09 17:12:23'),
(187, 'United States', '2024-02-09 17:12:23'),
(188, 'Uruguay', '2024-02-09 17:12:23'),
(189, 'Uzbekistan', '2024-02-09 17:12:23'),
(190, 'Vanuatu', '2024-02-09 17:12:23'),
(191, 'Vatican City', '2024-02-09 17:12:23'),
(192, 'Venezuela', '2024-02-09 17:12:23'),
(193, 'Vietnam', '2024-02-09 17:12:23'),
(194, 'Yemen', '2024-02-09 17:12:23'),
(195, 'Zambia', '2024-02-09 17:12:23'),
(196, 'Zimbabwe', '2024-02-09 17:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `customers_address`
--

CREATE TABLE `customers_address` (
  `ca_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `address` text NOT NULL,
  `date_add_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_bank_account`
--

CREATE TABLE `customer_bank_account` (
  `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `cb_account_title` varchar(255) NOT NULL,
  `cb_account_number` varchar(535) NOT NULL,
  `cb_bank_name` varchar(255) NOT NULL,
  `cb_date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_cards`
--

CREATE TABLE `customer_cards` (
  `cc_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `card_expiry` varchar(55) NOT NULL,
  `card_cvv` int(10) NOT NULL,
  `card_date_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delete_companies`
--

CREATE TABLE `delete_companies` (
  `del_com_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `com_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `request_msg` text NOT NULL,
  `req_status` int(5) NOT NULL,
  `del_com_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delete_customers`
--

CREATE TABLE `delete_customers` (
  `del_c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `request_msg` text NOT NULL,
  `req_status` int(5) NOT NULL,
  `delete_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delete_drivers`
--

CREATE TABLE `delete_drivers` (
  `del_d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `request_msg` text NOT NULL,
  `req_status` int(5) NOT NULL,
  `del_d_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `des_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `des_name` varchar(255) NOT NULL,
  `des_address` varchar(255) NOT NULL,
  `des_city` varchar(255) NOT NULL,
  `des_code` varchar(55) NOT NULL,
  `des_date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`des_id`, `des_name`, `des_address`, `des_city`, `des_code`, `des_date_added`) VALUES
(00000001, 'Gatwick Airport', 'Horley, Gatwick RH6 0NP', 'United Kingdom', 'LGW', '2023-10-27 19:00:00'),
(00000002, 'Heathrow Airport', 'Longford TW6, UK', 'United Kingdom', 'LHR', '2023-10-27 19:00:00'),
(00000003, 'Manchester Airport', 'Manchester M90 1QX', 'United Kingdom', 'MAN', '2023-10-27 19:00:00'),
(00000004, 'Birmingham Airport', 'Birmingham B26 3QJ', 'United Kingdom', 'BHX', '2023-10-27 19:00:00'),
(00000005, 'Stansted Airport', 'Bassingbourn Rd, Stansted CM24 1QW', 'United Kingdom', 'STN', '2023-10-27 19:00:00'),
(00000006, 'Leeds Bradford Airport', 'Whitehouse Ln, Yeadon, Leeds LS19 7TU', 'United Kingdom', 'LBA', '2023-10-27 19:00:00'),
(00000007, 'Luton Airport', 'Airport Way, Luton LU2 9LY', 'United Kingdom', 'LTN', '2023-10-27 19:00:00'),
(00000008, 'Southend Airport', 'Eastwoodbury Cres, Southend-on-Sea SS2 6YF', 'United Kingdom', 'SEN', '2023-10-27 19:00:00'),
(00000009, 'London City Airport', 'Hartmann Rd, London E16 2PX', 'United Kingdom', 'LCY', '2023-10-27 19:00:00'),
(00000010, 'Newcastle International Airport', 'Woolsington, Newcastle upon Tyne NE13 8BZ', 'United Kingdom', 'NCL', '2023-10-27 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_name` varchar(255) NOT NULL,
  `d_email` varchar(255) NOT NULL,
  `d_phone` varchar(255) NOT NULL,
  `d_password` varchar(255) NOT NULL,
  `d_address` varchar(255) NOT NULL,
  `d_post_code` varchar(55) NOT NULL,
  `d_pic` varchar(255) NOT NULL,
  `d_gender` varchar(55) NOT NULL,
  `d_language` varchar(55) NOT NULL,
  `licence_authority` varchar(255) NOT NULL,
  `pco_num` varchar(255) NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL,
  `acount_status` int(10) NOT NULL,
  `signup_type` tinyint(5) NOT NULL,
  `login_token` varchar(255) DEFAULT NULL,
  `driver_reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `pco_num`, `latitude`, `longitude`, `status`, `acount_status`, `signup_type`, `login_token`, `driver_reg_date`) VALUES
(00000001, 'Azib Ali', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', '698-702 High Road', 'N12 9PY', '66d216456e779_66cb31d84a668_3d-animation-character-cartoon_113255-10862.jpg', 'Male', 'English', 'London', '', '51.617291', '-0.1648971', 'online', 1, 0, 'fc4e7729fada3ac0ff8c2d05f5bcc047ec74945392a4c4d59a5b7567f0e9bcdb', '2024-09-06 14:52:17'),
(00000002, 'Atiq Ramzan', 'admin@prenero.com', '+443157524000', '12345678', '698-702 High Road', 'N12 9PY', '66d2161552cee_66cb30a89fb4e_IMG_web.jpg', 'Male', 'English', 'Ireland', '', '31.3781909', '73.0563324', 'Offline', 1, 0, '0b9c6d6790d4382812eb2e287eba877032fb301dbe88851e05de822b3d686546', '2024-09-09 13:25:03'),
(00000003, 'Rehman', 'admin@gmail.com', '+441234567890', 'Rehman@1122', '', '', '', '', '', 'Rehman@1122', '', '', '', '', 0, 0, 'fcd8583c3e876ab73b7f64c46d3fcd2014803c89e548a161bd4b457b362ebdbf', '2024-09-06 14:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `driver_accounts`
--

CREATE TABLE `driver_accounts` (
  `ac_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_com` varchar(255) NOT NULL,
  `com_status` varchar(55) NOT NULL,
  `pay_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_bank_details`
--

CREATE TABLE `driver_bank_details` (
  `d_bank_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `sort_code` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_documents`
--

CREATE TABLE `driver_documents` (
  `dd_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_license_front` varchar(255) NOT NULL,
  `d_license_back` varchar(255) NOT NULL,
  `pco_license` varchar(255) NOT NULL,
  `address_proof_1` varchar(255) NOT NULL,
  `address_proof_2` varchar(255) NOT NULL,
  `dvla_check_code` varchar(255) NOT NULL,
  `national_insurance` varchar(255) NOT NULL,
  `extra` varchar(255) NOT NULL,
  `date_upload_document` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_documents`
--

INSERT INTO `driver_documents` (`dd_id`, `d_id`, `d_license_front`, `d_license_back`, `pco_license`, `address_proof_1`, `address_proof_2`, `dvla_check_code`, `national_insurance`, `extra`, `date_upload_document`) VALUES
(00000001, 00000001, '66d216647f184.jpg', '', '', '', '', '', '', '', '2024-08-30 18:58:44'),
(00000002, 00000002, '66d216c5685d6.jpg', '66d216d1693d7.jpg', '', '', '', '', '', '', '2024-08-30 19:00:33'),
(00000003, 00000003, '', '', '', '', '', '', '', '', '2024-09-06 14:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `driver_history`
--

CREATE TABLE `driver_history` (
  `history_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `date_assigned` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_history`
--

INSERT INTO `driver_history` (`history_id`, `d_id`, `book_id`, `date_assigned`) VALUES
(00000001, 00000001, 00000062, '2024-08-31 10:21:36'),
(00000002, 00000001, 00000062, '2024-08-31 10:23:15'),
(00000003, 00000001, 00000063, '2024-08-31 10:28:00'),
(00000004, 00000001, 00000064, '2024-08-31 10:31:41'),
(00000005, 00000001, 00000065, '2024-09-02 10:35:56'),
(00000006, 00000002, 00000065, '2024-09-02 17:31:44'),
(00000007, 00000002, 00000065, '2024-09-02 17:37:50'),
(00000008, 00000002, 00000068, '2024-09-03 18:04:33'),
(00000009, 00000002, 00000068, '2024-09-03 18:26:56'),
(00000010, 00000002, 00000068, '2024-09-03 19:19:42'),
(00000011, 00000002, 00000068, '2024-09-03 19:22:46'),
(00000012, 00000002, 00000068, '2024-09-03 19:47:41'),
(00000013, 00000002, 00000068, '2024-09-04 18:41:36'),
(00000014, 00000001, 00000069, '2024-09-05 00:30:50'),
(00000015, 00000002, 00000070, '2024-09-05 17:35:42'),
(00000016, 00000002, 00000071, '2024-09-06 18:40:45'),
(00000017, 00000002, 00000072, '2024-09-07 10:13:37'),
(00000018, 00000002, 00000073, '2024-09-07 10:46:43'),
(00000019, 00000002, 00000074, '2024-09-07 11:09:23'),
(00000020, 00000002, 00000075, '2024-09-07 11:54:07'),
(00000021, 00000002, 00000076, '2024-09-07 12:00:39'),
(00000022, 00000002, 00000077, '2024-09-07 12:12:02'),
(00000023, 00000002, 00000077, '2024-09-07 12:13:13'),
(00000024, 00000002, 00000078, '2024-09-07 12:19:30'),
(00000025, 00000002, 00000079, '2024-09-07 12:24:09'),
(00000026, 00000002, 00000080, '2024-09-07 12:40:03'),
(00000027, 00000002, 00000081, '2024-09-07 12:43:45'),
(00000028, 00000002, 00000082, '2024-09-07 12:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `driver_location`
--

CREATE TABLE `driver_location` (
  `loc_id` int(55) NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_location`
--

INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(1, 00000002, '31.4392063', '73.0854578', '2024-08-30 12:04:43'),
(2, 00000002, '31.4392064', '73.0854587', '2024-08-30 12:04:53'),
(3, 00000002, '31.4392062', '73.0854583', '2024-08-30 12:05:03'),
(4, 00000002, '31.4392083', '73.0854536', '2024-08-30 12:05:13'),
(5, 00000002, '31.4391934', '73.0853477', '2024-08-30 12:05:23'),
(6, 00000002, '31.4392016', '73.0853612', '2024-08-30 12:05:33'),
(7, 00000002, '31.4391778', '73.0853305', '2024-08-30 12:05:43'),
(8, 00000002, '31.4392078', '73.0854554', '2024-08-30 12:05:53'),
(9, 00000002, '31.4391899', '73.0853407', '2024-08-30 12:06:03'),
(10, 00000002, '31.4391898', '73.0853389', '2024-08-30 12:06:13'),
(11, 00000002, '31.4392061', '73.085463', '2024-08-30 12:06:23'),
(12, 00000002, '31.4392059', '73.0854642', '2024-08-30 12:06:33'),
(13, 00000002, '31.4392058', '73.0854604', '2024-08-30 12:06:43'),
(14, 00000002, '31.4392058', '73.0854623', '2024-08-30 12:06:53'),
(15, 00000002, '31.4392054', '73.0854625', '2024-08-30 12:07:03'),
(16, 00000002, '31.4392075', '73.0854608', '2024-08-30 12:07:13'),
(17, 00000002, '31.4392051', '73.0854589', '2024-08-30 12:07:23'),
(18, 00000002, '31.4392062', '73.0854616', '2024-08-30 12:07:33'),
(19, 00000002, '31.4392062', '73.0854629', '2024-08-30 12:07:43'),
(20, 00000002, '31.4392063', '73.0854633', '2024-08-30 12:07:53'),
(21, 00000002, '31.4392063', '73.0854642', '2024-08-30 12:08:03'),
(22, 00000002, '31.4392065', '73.0854641', '2024-08-30 12:08:13'),
(23, 00000002, '31.4392068', '73.0854636', '2024-08-30 12:08:23'),
(24, 00000002, '31.439194', '73.0853527', '2024-08-30 12:08:33'),
(25, 00000002, '31.4392075', '73.0854638', '2024-08-30 12:08:43'),
(26, 00000002, '31.4392062', '73.0854625', '2024-08-30 12:08:53'),
(27, 00000002, '31.4392061', '73.0854652', '2024-08-30 12:09:03'),
(28, 00000002, '31.4392089', '73.0854646', '2024-08-30 12:09:13'),
(29, 00000002, '31.4392047', '73.0854691', '2024-08-30 12:09:23'),
(30, 00000002, '31.4392054', '73.0854634', '2024-08-30 12:09:33'),
(31, 00000002, '31.4392073', '73.0854616', '2024-08-30 12:09:45'),
(32, 00000002, '31.4392041', '73.085458', '2024-08-30 12:09:53'),
(33, 00000002, '31.4392047', '73.0854632', '2024-08-30 12:10:03'),
(34, 00000002, '31.4392065', '73.0854615', '2024-08-30 12:10:13'),
(35, 00000002, '31.4392039', '73.0854634', '2024-08-30 12:10:23'),
(36, 00000002, '31.4392069', '73.0854636', '2024-08-30 12:10:33'),
(37, 00000002, '31.4392044', '73.0854647', '2024-08-30 12:10:43'),
(224, 00000002, '31.4392062', '73.085466', '2024-09-02 10:25:28'),
(225, 00000002, '31.4392151', '73.0854631', '2024-09-02 10:25:38'),
(226, 00000002, '31.4392021', '73.0854497', '2024-09-02 10:25:48'),
(227, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(228, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(229, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(230, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(231, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(232, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(233, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(234, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(235, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(236, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(237, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(238, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(239, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(240, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:52'),
(241, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:53'),
(242, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:53'),
(243, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:53'),
(244, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:53'),
(245, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:53'),
(246, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:54'),
(247, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:54'),
(248, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:54'),
(249, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:54'),
(250, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:55'),
(251, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:55'),
(252, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:55'),
(253, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:56'),
(254, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:56'),
(255, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:56'),
(256, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:56'),
(257, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:56'),
(258, 00000002, '31.4392143', '73.0854622', '2024-09-02 10:31:56'),
(259, 00000002, '31.3782143', '73.0562159', '2024-09-03 11:05:12'),
(260, 00000002, '31.3782144', '73.056215', '2024-09-03 11:05:22'),
(261, 00000002, '31.378216', '73.0562135', '2024-09-03 11:05:32'),
(262, 00000002, '31.3781923', '73.0562219', '2024-09-03 11:05:46'),
(263, 00000002, '31.3781838', '73.056226', '2024-09-03 11:05:52'),
(264, 00000002, '31.3781831', '73.0562268', '2024-09-03 11:06:02'),
(265, 00000002, '31.378191', '73.0562228', '2024-09-03 11:06:12'),
(266, 00000002, '31.3782546', '73.0561847', '2024-09-03 11:06:31'),
(267, 00000002, '31.3782546', '73.0561847', '2024-09-03 11:06:32'),
(268, 00000002, '31.3782147', '73.0562116', '2024-09-03 11:06:42'),
(269, 00000002, '31.3782046', '73.0562181', '2024-09-03 11:06:52'),
(270, 00000002, '31.3782074', '73.0562161', '2024-09-03 11:07:02'),
(271, 00000002, '31.3781843', '73.0562259', '2024-09-03 11:07:17'),
(272, 00000002, '31.3781932', '73.0562215', '2024-09-03 11:07:22'),
(273, 00000002, '31.3781682', '73.0562398', '2024-09-03 11:07:33'),
(274, 00000002, '31.3781809', '73.0562289', '2024-09-03 11:07:42'),
(275, 00000002, '31.3781994', '73.0562274', '2024-09-03 11:07:52'),
(276, 00000002, '31.3781734', '73.0562352', '2024-09-03 11:08:07'),
(277, 00000002, '31.3781691', '73.056239', '2024-09-03 11:08:13'),
(278, 00000002, '31.3781953', '73.0562204', '2024-09-03 11:08:22'),
(279, 00000002, '31.3781694', '73.0562407', '2024-09-03 11:08:33'),
(280, 00000002, '31.3781661', '73.0562435', '2024-09-03 11:08:42'),
(281, 00000002, '31.3781697', '73.056239', '2024-09-03 11:08:53'),
(282, 00000002, '31.3781733', '73.0562349', '2024-09-03 11:09:03'),
(283, 00000002, '31.3782097', '73.0562194', '2024-09-03 11:09:13'),
(284, 00000002, '31.3781949', '73.0562235', '2024-09-03 11:09:22'),
(285, 00000002, '31.3781852', '73.0562249', '2024-09-03 11:09:33'),
(286, 00000002, '31.378193', '73.0562239', '2024-09-03 11:09:42'),
(287, 00000002, '31.3781942', '73.0562237', '2024-09-03 11:09:52'),
(288, 00000002, '31.3782025', '73.0562176', '2024-09-03 11:10:03'),
(289, 00000002, '31.3782185', '73.0562056', '2024-09-03 11:10:13'),
(290, 00000002, '31.3781943', '73.0562236', '2024-09-03 11:10:23'),
(291, 00000002, '31.3781937', '73.056224', '2024-09-03 11:10:32'),
(292, 00000002, '31.3781948', '73.0562231', '2024-09-03 11:10:44'),
(293, 00000002, '31.3781958', '73.0562226', '2024-09-03 11:10:54'),
(294, 00000002, '31.3781962', '73.0562223', '2024-09-03 11:11:02'),
(295, 00000002, '31.3781964', '73.0562221', '2024-09-03 11:11:12'),
(296, 00000002, '31.3781975', '73.0562215', '2024-09-03 11:11:22'),
(297, 00000002, '31.378197', '73.0562217', '2024-09-03 11:11:37'),
(298, 00000002, '31.378197', '73.0562217', '2024-09-03 11:11:42'),
(299, 00000002, '31.3781957', '73.0562224', '2024-09-03 11:11:52'),
(300, 00000002, '31.3781947', '73.056223', '2024-09-03 11:12:02'),
(301, 00000002, '31.3781942', '73.0562234', '2024-09-03 11:12:12'),
(302, 00000002, '31.3781936', '73.0562237', '2024-09-03 11:12:22'),
(303, 00000002, '31.3781925', '73.0562244', '2024-09-03 11:12:32'),
(304, 00000002, '31.3781908', '73.0562255', '2024-09-03 11:12:42'),
(305, 00000002, '31.3781896', '73.0562263', '2024-09-03 11:12:52'),
(306, 00000002, '31.3781886', '73.056227', '2024-09-03 11:13:02'),
(307, 00000002, '31.3781875', '73.0562277', '2024-09-03 11:13:12'),
(308, 00000002, '31.3781866', '73.0562284', '2024-09-03 11:13:22'),
(309, 00000002, '31.3781857', '73.056229', '2024-09-03 11:13:32'),
(310, 00000002, '31.3781848', '73.0562296', '2024-09-03 11:13:42'),
(311, 00000002, '31.3781842', '73.05623', '2024-09-03 11:13:52'),
(312, 00000002, '31.3781839', '73.0562301', '2024-09-03 11:14:02'),
(313, 00000002, '31.3781831', '73.0562306', '2024-09-03 11:14:12'),
(314, 00000002, '31.378183', '73.0562307', '2024-09-03 11:14:22'),
(315, 00000002, '31.3781823', '73.0562312', '2024-09-03 11:14:32'),
(316, 00000002, '31.3781816', '73.0562317', '2024-09-03 11:14:42'),
(317, 00000002, '31.3781805', '73.0562323', '2024-09-03 11:14:52'),
(318, 00000002, '31.3781799', '73.0562327', '2024-09-03 11:15:02'),
(319, 00000002, '31.3781795', '73.0562331', '2024-09-03 11:15:12'),
(320, 00000002, '31.3781796', '73.056233', '2024-09-03 11:15:22'),
(321, 00000002, '31.3781794', '73.0562331', '2024-09-03 11:15:32'),
(322, 00000002, '31.378179', '73.0562334', '2024-09-03 11:15:42'),
(323, 00000002, '31.3781791', '73.0562333', '2024-09-03 11:15:52'),
(324, 00000002, '31.3781795', '73.0562331', '2024-09-03 11:16:02'),
(325, 00000002, '31.3781793', '73.0562331', '2024-09-03 11:16:12'),
(326, 00000002, '31.3781793', '73.0562331', '2024-09-03 11:16:22'),
(327, 00000002, '31.3781791', '73.0562333', '2024-09-03 11:16:32'),
(328, 00000002, '31.3781788', '73.0562335', '2024-09-03 11:16:42'),
(329, 00000002, '31.3781788', '73.0562335', '2024-09-03 11:16:52'),
(330, 00000002, '31.3781784', '73.0562337', '2024-09-03 11:17:02'),
(331, 00000002, '31.378178', '73.056234', '2024-09-03 11:17:12'),
(332, 00000002, '31.3781776', '73.0562343', '2024-09-03 11:17:22'),
(333, 00000002, '31.3781775', '73.0562344', '2024-09-03 11:17:32'),
(334, 00000002, '31.378177', '73.0562347', '2024-09-03 11:17:43'),
(335, 00000002, '31.3781765', '73.056235', '2024-09-03 11:17:52'),
(336, 00000002, '31.3781762', '73.0562353', '2024-09-03 11:18:02'),
(371, 00000002, '31.3646586', '73.1361984', '2024-09-06 11:36:56'),
(372, 00000002, '31.3645419', '73.1363789', '2024-09-06 11:37:06'),
(373, 00000002, '31.3644677', '73.1364653', '2024-09-06 11:37:16'),
(374, 00000002, '31.3644466', '73.1364596', '2024-09-06 11:37:26'),
(375, 00000002, '31.3644406', '73.1364685', '2024-09-06 11:37:36'),
(376, 00000002, '31.36448', '73.1364417', '2024-09-06 11:38:06'),
(377, 00000002, '31.36448', '73.1364417', '2024-09-06 11:38:06'),
(378, 00000002, '31.36448', '73.1364417', '2024-09-06 11:38:06'),
(379, 00000002, '31.3644561', '73.1364413', '2024-09-06 11:38:16'),
(380, 00000002, '31.3644509', '73.1364017', '2024-09-06 11:38:27'),
(381, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:52'),
(382, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(383, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(384, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(385, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(386, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(387, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(388, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(389, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(390, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(391, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(392, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(393, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(394, 00000002, '31.3644733', '73.1364483', '2024-09-06 11:40:53'),
(395, 00000002, '31.3644767', '73.1364709', '2024-09-06 11:40:56'),
(396, 00000002, '31.3644817', '73.1364885', '2024-09-06 11:41:06'),
(397, 00000002, '31.3644768', '73.1364603', '2024-09-06 11:41:16'),
(398, 00000002, '31.3644767', '73.136455', '2024-09-06 11:41:27'),
(399, 00000002, '31.36448', '73.1364779', '2024-09-06 11:41:36'),
(400, 00000002, '31.3644714', '73.1364616', '2024-09-06 11:41:46'),
(401, 00000002, '31.3644892', '73.1364122', '2024-09-06 11:41:56'),
(402, 00000002, '31.3644867', '73.1363801', '2024-09-06 11:42:06'),
(403, 00000002, '31.3644635', '73.1364076', '2024-09-06 11:42:22'),
(404, 00000002, '31.3644516', '73.1363917', '2024-09-06 11:42:34'),
(405, 00000002, '31.3644483', '73.136385', '2024-09-06 11:42:42'),
(406, 00000002, '31.3644355', '73.1363713', '2024-09-06 11:42:46'),
(407, 00000002, '31.3644563', '73.1363868', '2024-09-06 11:42:56'),
(408, 00000002, '31.3644615', '73.1363915', '2024-09-06 11:43:03'),
(409, 00000002, '31.3644617', '73.1363917', '2024-09-06 11:43:06'),
(410, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:54'),
(411, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:54'),
(412, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:54'),
(413, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:54'),
(414, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:54'),
(415, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:55'),
(416, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:55'),
(417, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:55'),
(418, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:55'),
(419, 00000002, '31.3645067', '73.1363383', '2024-09-06 11:43:56'),
(420, 00000002, '31.3644082', '73.1361691', '2024-09-06 11:44:03'),
(421, 00000002, '31.3643959', '73.1361761', '2024-09-06 11:44:06'),
(422, 00000002, '31.3643952', '73.1362191', '2024-09-06 11:44:13'),
(423, 00000002, '31.3643996', '73.1362552', '2024-09-06 11:44:16'),
(424, 00000002, '31.3644136', '73.136301', '2024-09-06 11:44:23'),
(425, 00000002, '31.3644156', '73.1363377', '2024-09-06 11:44:26'),
(426, 00000002, '31.3644079', '73.1363647', '2024-09-06 11:44:33'),
(427, 00000002, '31.3644041', '73.1363943', '2024-09-06 11:44:36'),
(428, 00000002, '32.0941419', '36.0883795', '2024-09-07 15:15:24'),
(429, 00000002, '32.0941412', '36.0883747', '2024-09-07 15:15:32'),
(430, 00000002, '32.0941414', '36.0883739', '2024-09-07 15:15:42'),
(431, 00000002, '31.3782002', '73.0560419', '2024-09-07 15:16:08'),
(432, 00000002, '31.3782002', '73.0560419', '2024-09-07 15:16:17'),
(433, 00000002, '31.3782977', '73.0565022', '2024-09-07 15:16:27'),
(434, 00000002, '31.3782006', '73.0563541', '2024-09-07 15:16:37'),
(435, 00000002, '31.3782006', '73.0563541', '2024-09-07 15:16:37'),
(436, 00000002, '31.3781909', '73.0563324', '2024-09-07 15:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `driver_vehicle`
--

CREATE TABLE `driver_vehicle` (
  `dv_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `v_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `v_make` varchar(255) NOT NULL,
  `v_model` varchar(255) NOT NULL,
  `v_color` varchar(255) NOT NULL,
  `v_reg_num` varchar(11) NOT NULL,
  `v_phv` varchar(255) NOT NULL,
  `v_phv_expiry` varchar(255) NOT NULL,
  `v_ti` varchar(255) NOT NULL,
  `v_ti_expiry` varchar(255) NOT NULL,
  `v_mot` varchar(255) NOT NULL,
  `v_mot_expiry` varchar(255) NOT NULL,
  `date_v_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_vehicle`
--

INSERT INTO `driver_vehicle` (`dv_id`, `v_id`, `d_id`, `v_make`, `v_model`, `v_color`, `v_reg_num`, `v_phv`, `v_phv_expiry`, `v_ti`, `v_ti_expiry`, `v_mot`, `v_mot_expiry`, `date_v_add`) VALUES
(00000001, 00000001, 00000002, 'Honda', 'Civic', 'Black', 'LHE635', '', '', '', '', '', '', '2024-08-30 19:03:43');

-- --------------------------------------------------------

--
-- Table structure for table `fares`
--

CREATE TABLE `fares` (
  `fare_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `job_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `journey_fare` int(55) NOT NULL,
  `car_parking` int(55) NOT NULL,
  `waiting` int(55) NOT NULL,
  `tolls` int(55) NOT NULL,
  `extras` int(55) NOT NULL,
  `fare_status` varchar(255) NOT NULL,
  `apply_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fares`
--

INSERT INTO `fares` (`fare_id`, `job_id`, `d_id`, `journey_fare`, `car_parking`, `waiting`, `tolls`, `extras`, `fare_status`, `apply_date`) VALUES
(00000001, 00000004, 00000001, 189, 0, 0, 0, 0, 'Pending', '2024-08-31 10:36:54'),
(00000002, 00000015, 00000002, 13, 0, 0, 0, 0, 'Pending', '2024-09-05 18:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `job_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `journey_fare` int(11) NOT NULL,
  `car_parking` int(11) NOT NULL,
  `waiting` int(11) NOT NULL,
  `tolls` int(11) NOT NULL,
  `extra` int(11) NOT NULL,
  `total_pay` varchar(55) NOT NULL,
  `driver_commission` int(55) NOT NULL,
  `invoice_status` varchar(55) NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `job_id`, `c_id`, `d_id`, `journey_fare`, `car_parking`, `waiting`, `tolls`, `extra`, `total_pay`, `driver_commission`, `invoice_status`, `invoice_date`) VALUES
(00000001, 00000002, 00000001, 00000001, 350, 555, 5555, 66666, 55, '73181', 14636, 'unpaid', '2024-08-31 15:24:25'),
(00000002, 00000004, 00000001, 00000001, 189, 0, 0, 0, 0, '189', 38, 'unpaid', '2024-08-31 15:35:52'),
(00000003, 00000015, 00000002, 00000002, 13, 0, 0, 0, 0, '13', 3, 'unpaid', '2024-09-05 11:12:05'),
(00000004, 00000013, 00000001, 00000002, 10, 0, 0, 0, 0, '10', 2, 'unpaid', '2024-09-05 12:19:05'),
(00000005, 00000016, 00000002, 00000002, 1843, 0, 0, 0, 0, '1843', 369, 'unpaid', '2024-09-06 11:42:16'),
(00000006, 00000017, 00000002, 00000002, 1635, 0, 0, 0, 0, '1635', 327, 'unpaid', '2024-09-07 15:35:40'),
(00000007, 00000018, 00000002, 00000002, 5235, 0, 0, 0, 0, '5235', 1047, 'unpaid', '2024-09-07 15:50:05'),
(00000008, 00000019, 00000002, 00000002, 3270, 0, 0, 0, 0, '3270', 654, 'unpaid', '2024-09-07 16:10:59'),
(00000009, 00000020, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 16:56:03'),
(00000010, 00000021, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 05:02:16'),
(00000011, 00000023, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 05:17:15'),
(00000012, 00000024, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 05:21:05'),
(00000013, 00000025, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 05:25:14'),
(00000014, 00000026, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 05:40:44'),
(00000015, 00000027, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 05:44:39'),
(00000016, 00000028, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 05:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `job_note` text NOT NULL,
  `journey_fare` int(55) NOT NULL,
  `booking_fee` int(55) NOT NULL,
  `car_parking` int(55) NOT NULL,
  `waiting` int(55) NOT NULL,
  `tolls` int(55) NOT NULL,
  `extra` int(55) NOT NULL,
  `job_status` varchar(255) NOT NULL,
  `ride_status` int(11) NOT NULL DEFAULT 0,
  `date_job_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `book_id`, `c_id`, `d_id`, `job_note`, `journey_fare`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `job_status`, `ride_status`, `date_job_add`) VALUES
(00000002, 00000000062, 00000000001, 00000000001, '', 350, 0, 0, 0, 0, 0, 'accepted', 0, '2024-09-03 19:00:10'),
(00000004, 00000000064, 00000000001, 00000000001, '', 189, 0, 0, 0, 0, 0, 'Completed', 0, '2024-08-31 10:36:54'),
(00000013, 00000000068, 00000000001, 00000000002, '', 10, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-05 12:19:05'),
(00000014, 00000000069, 00000000001, 00000000001, '', 13, 0, 0, 0, 0, 0, 'accepted', 0, '2024-09-05 00:31:04'),
(00000015, 00000000070, 00000000002, 00000000002, '', 13, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-05 11:12:05'),
(00000016, 00000000071, 00000000002, 00000000002, '', 1843, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-06 11:42:16'),
(00000017, 00000000072, 00000000002, 00000000002, '', 1635, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 15:35:40'),
(00000018, 00000000073, 00000000002, 00000000002, '', 5235, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 15:50:05'),
(00000019, 00000000074, 00000000002, 00000000002, '', 3270, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 16:10:59'),
(00000020, 00000000075, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 16:56:03'),
(00000021, 00000000076, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 05:02:16'),
(00000023, 00000000077, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 05:17:15'),
(00000024, 00000000078, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 05:21:05'),
(00000025, 00000000079, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 05:25:14'),
(00000026, 00000000080, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 05:40:44'),
(00000027, 00000000081, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 05:44:39'),
(00000028, 00000000082, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 05:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `lang_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `language` varchar(255) NOT NULL,
  `date_lang_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`lang_id`, `language`, `date_lang_add`) VALUES
(00000001, 'English', '2023-10-24 19:00:00'),
(00000002, 'French', '2023-10-24 19:00:00'),
(00000003, 'Spanish', '2023-10-24 19:00:00'),
(00000004, 'German', '2023-10-24 19:00:00'),
(00000005, 'Portuguese', '2023-10-24 19:00:00'),
(00000006, 'Arabic', '2023-10-24 19:00:00'),
(00000007, 'Russian', '2023-10-24 19:00:00'),
(00000008, 'Japanese', '2023-10-24 19:00:00'),
(00000009, 'Italian', '2023-10-24 19:00:00'),
(00000010, 'Bengali', '2023-10-24 19:00:00'),
(00000011, 'Hindi', '2023-10-24 19:00:00'),
(00000012, 'Korean', '2023-10-24 19:00:00'),
(00000013, 'Greek', '2023-10-24 19:00:00'),
(00000014, 'Turkish', '2023-10-24 19:00:00'),
(00000015, 'Indonesian', '2023-10-24 19:00:00'),
(00000016, 'Danish', '2023-10-24 19:00:00'),
(00000017, 'Gujarati', '2023-10-24 19:00:00'),
(00000018, 'Finnish', '2023-10-24 19:00:00'),
(00000019, 'Dutch', '2023-10-24 19:00:00'),
(00000020, 'Tamil', '2023-10-24 19:00:00'),
(00000021, 'Hungarian', '2023-10-24 19:00:00'),
(00000022, 'Romanian', '2023-10-24 19:00:00'),
(00000023, 'Czech', '2023-10-24 19:00:00'),
(00000024, 'Urdu', '2023-10-24 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `marketing_preference`
--

CREATE TABLE `marketing_preference` (
  `mp_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `phone` int(5) NOT NULL,
  `email` int(5) NOT NULL,
  `message` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marketing_preference`
--

INSERT INTO `marketing_preference` (`mp_id`, `c_id`, `phone`, `email`, `message`, `date_added`) VALUES
(00000001, 00000001, 1, 0, 1, '2024-02-26 11:21:07'),
(00000002, 00000003, 1, 1, 1, '2024-02-27 08:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mg_charges`
--

CREATE TABLE `mg_charges` (
  `mg_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `pickup_charges` int(11) NOT NULL,
  `date_add_mg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `pay_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `invoice_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `amount` varchar(55) NOT NULL,
  `pay_month` date NOT NULL,
  `pay_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peak_hours`
--

CREATE TABLE `peak_hours` (
  `ph_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `peak_hours_days` varchar(535) NOT NULL,
  `price_increment` int(8) NOT NULL,
  `ph_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_codes`
--

CREATE TABLE `post_codes` (
  `pc_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `pc_name` varchar(255) NOT NULL,
  `pc_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_codes`
--

INSERT INTO `post_codes` (`pc_id`, `pc_name`, `pc_date`) VALUES
(00000000001, 'N1= Barnsbury, Canonbury, Islington', '2024-07-13 12:04:27'),
(00000000002, 'N2= East Finchley', '2024-07-13 12:04:27'),
(00000000003, 'N3= Finchley Central', '2024-07-13 12:04:27'),
(00000000004, 'N4= Finsbury Park, Manor House', '2024-07-13 12:04:27'),
(00000000005, 'N5= Highbury', '2024-07-13 12:04:27'),
(00000000006, 'N6= Highgate', '2024-07-13 12:04:27'),
(00000000007, 'N7= Holloway', '2024-07-13 12:04:27'),
(00000000008, 'N8= Crouch End, Hornsey', '2024-07-13 12:04:27'),
(00000000009, 'N9= Lower Edmonton', '2024-07-13 12:04:27'),
(00000000010, 'N10= Muswell Hill', '2024-07-13 12:04:27'),
(00000000011, 'N11= Friern Barnet, New Southgate', '2024-07-13 12:04:27'),
(00000000012, 'N12= North Finchley, Woodside Park', '2024-07-13 12:04:27'),
(00000000013, 'N13= Palmers Green', '2024-07-13 12:04:27'),
(00000000014, 'N14= Southgate', '2024-07-13 12:04:27'),
(00000000015, 'N15= Seven Sisters', '2024-07-13 12:04:27'),
(00000000016, 'N16= Stamford Hill, Stoke Newington', '2024-07-13 12:04:27'),
(00000000017, 'N17= Tottenham', '2024-07-13 12:04:27'),
(00000000018, 'N18= Upper Edmonton', '2024-07-13 12:04:27'),
(00000000019, 'N19= Archway, Tufnell Park', '2024-07-13 12:04:27'),
(00000000020, 'N20= Totteridge, Whetstone', '2024-07-13 12:04:27'),
(00000000021, 'N21= Winchmore Hill', '2024-07-13 12:04:27'),
(00000000022, 'N22= Alexandra Palace, Wood Green', '2024-07-13 12:04:27'),
(00000000023, 'NW1= Camden Town, Regent\'s Park', '2024-07-13 12:04:27'),
(00000000024, 'NW2= Cricklewood, Neasden', '2024-07-13 12:04:27'),
(00000000025, 'NW3= Hampstead, Swiss Cottage', '2024-07-13 12:04:27'),
(00000000026, 'NW4= Brent Cross, Hendon', '2024-07-13 12:04:27'),
(00000000027, 'NW5= Kentish Town', '2024-07-13 12:04:27'),
(00000000028, 'NW6= Kilburn, Queens Park, West Hampstead', '2024-07-13 12:04:27'),
(00000000029, 'NW7= Mill Hill', '2024-07-13 12:04:27'),
(00000000030, 'NW8= St John\'s Wood', '2024-07-13 12:04:27'),
(00000000031, 'NW9= Colindale, Kingsbury', '2024-07-13 12:04:27'),
(00000000032, 'NW10= Harlesden, Kensal Green, Willesden', '2024-07-13 12:04:27'),
(00000000033, 'NW11= Golders Green, Hampstead Garden Suburb', '2024-07-13 12:04:27'),
(00000000034, 'SE1= Bermondsey, Borough, Southwark, Waterloo', '2024-07-13 12:04:27'),
(00000000035, 'SE2= Abbey Wood', '2024-07-13 12:04:27'),
(00000000036, 'SE3= Blackheath, Westcombe Park', '2024-07-13 12:04:27'),
(00000000037, 'SE4= Brockley, Crofton Park, Honor Oak Park', '2024-07-13 12:04:27'),
(00000000038, 'SE5= Camberwell', '2024-07-13 12:04:27'),
(00000000039, 'SE6= Bellingham, Catford, Hither Green', '2024-07-13 12:04:27'),
(00000000040, 'SE7= Charlton', '2024-07-13 12:04:27'),
(00000000041, 'SE8= Deptford', '2024-07-13 12:04:27'),
(00000000042, 'SE9= Eltham, Mottingham', '2024-07-13 12:04:27'),
(00000000043, 'SE10= Greenwich', '2024-07-13 12:04:27'),
(00000000044, 'SE11= Lambeth', '2024-07-13 12:04:27'),
(00000000045, 'SE12= Grove Park, Lee', '2024-07-13 12:04:27'),
(00000000046, 'SE13= Hither Green, Lewisham', '2024-07-13 12:04:27'),
(00000000047, 'SE14= New Cross, New Cross Gate', '2024-07-13 12:04:27'),
(00000000048, 'SE15= Nunhead, Peckham', '2024-07-13 12:04:27'),
(00000000049, 'SE16= Rotherhithe, South Bermondsey, Surrey Docks', '2024-07-13 12:04:27'),
(00000000050, 'SE17= Elephant & Castle, Walworth', '2024-07-13 12:04:27'),
(00000000051, 'SE18= Plumstead, Woolwich', '2024-07-13 12:04:27'),
(00000000052, 'SE19= Crystal Palace, Upper Norwood', '2024-07-13 12:04:27'),
(00000000053, 'SE20= Anerley, Penge', '2024-07-13 12:04:28'),
(00000000054, 'SE21= Dulwich', '2024-07-13 12:04:28'),
(00000000055, 'SE22= East Dulwich', '2024-07-13 12:04:28'),
(00000000056, 'SE23= Forest Hill', '2024-07-13 12:04:28'),
(00000000057, 'SE24= Herne Hill', '2024-07-13 12:04:28'),
(00000000058, 'SE25= South Norwood', '2024-07-13 12:04:28'),
(00000000059, 'SE26= Sydenham', '2024-07-13 12:04:28'),
(00000000060, 'SE27= Tulse Hill, West Norwood', '2024-07-13 12:04:28'),
(00000000061, 'SE28= Thamesmead', '2024-07-13 12:04:28'),
(00000000062, 'SW1= Belgravia, Pimlico, Westminster', '2024-07-13 12:04:28'),
(00000000063, 'SW2= Brixton, Streatham Hill', '2024-07-13 12:04:28'),
(00000000064, 'SW3= Brompton, Chelsea', '2024-07-13 12:04:28'),
(00000000065, 'SW4= Clapham', '2024-07-13 12:04:28'),
(00000000066, 'SW5= Earl\'s Court', '2024-07-13 12:04:28'),
(00000000067, 'SW6= Fulham, Parson\'s Green', '2024-07-13 12:04:28'),
(00000000068, 'SW7= South Kensington', '2024-07-13 12:04:28'),
(00000000069, 'SW8= Nine Elms, South Lambeth', '2024-07-13 12:04:28'),
(00000000070, 'SW9= Brixton, Stockwell', '2024-07-13 12:04:28'),
(00000000071, 'SW10= West Brompton, World\'s End', '2024-07-13 12:04:28'),
(00000000072, 'SW11= Battersea, Clapham Junction', '2024-07-13 12:04:28'),
(00000000073, 'SW12= Balham', '2024-07-13 12:04:28'),
(00000000074, 'SW13= Barnes, Castelnau', '2024-07-13 12:04:28'),
(00000000075, 'SW14= East Sheen, Mortlake', '2024-07-13 12:04:28'),
(00000000076, 'SW15= Putney, Roehampton', '2024-07-13 12:04:28'),
(00000000077, 'SW16= Norbury, Streatham', '2024-07-13 12:04:28'),
(00000000078, 'SW17= Tooting', '2024-07-13 12:04:28'),
(00000000079, 'SW18= Earlsfield, Wandsworth', '2024-07-13 12:04:28'),
(00000000080, 'SW19= Merton, Wimbledon', '2024-07-13 12:04:28'),
(00000000081, 'SW20= Raynes Park, South Wimbledon', '2024-07-13 12:04:28'),
(00000000082, 'W1= Marylebone, Mayfair, Soho', '2024-07-13 12:04:28'),
(00000000083, 'W2= Bayswater, Paddington', '2024-07-13 12:04:28'),
(00000000084, 'W3= Acton', '2024-07-13 12:04:28'),
(00000000085, 'W4= Chiswick', '2024-07-13 12:04:28'),
(00000000086, 'W5= Ealing', '2024-07-13 12:04:28'),
(00000000087, 'W6= Hammersmith', '2024-07-13 12:04:28'),
(00000000088, 'W7= Hanwell', '2024-07-13 12:04:28'),
(00000000089, 'W8= Kensington', '2024-07-13 12:04:28'),
(00000000090, 'W9= Maida Vale, Warwick Avenue', '2024-07-13 12:04:28'),
(00000000091, 'W10= Ladbroke Grove, North Kensington', '2024-07-13 12:04:28'),
(00000000092, 'W11= Holland Park, Notting Hill', '2024-07-13 12:04:28'),
(00000000093, 'W12= Shepherd\'s Bush', '2024-07-13 12:04:28'),
(00000000094, 'W13= West Ealing', '2024-07-13 12:04:28'),
(00000000095, 'W14= West Kensington', '2024-07-13 12:04:28'),
(00000000096, 'E1= Mile End, Stepney, Whitechapel', '2024-07-13 12:04:28'),
(00000000097, 'E2= Bethnal Green, Shoreditch', '2024-07-13 12:04:28'),
(00000000098, 'E3= Bow, Bromley-by-Bow', '2024-07-13 12:04:28'),
(00000000099, 'E4= Chingford, Highams Park', '2024-07-13 12:04:28'),
(00000000100, 'E5= Clapton', '2024-07-13 12:04:28'),
(00000000101, 'E6= East Ham, Beckton', '2024-07-13 12:04:28'),
(00000000102, 'E7= Forest Gate, Upton Park', '2024-07-13 12:04:28'),
(00000000103, 'E8= Hackney, Dalston', '2024-07-13 12:04:28'),
(00000000104, 'E9= Hackney, Homerton', '2024-07-13 12:04:28'),
(00000000105, 'E10= Leyton', '2024-07-13 12:04:28'),
(00000000106, 'E11= Leytonstone', '2024-07-13 12:04:28'),
(00000000107, 'E12= Manor Park', '2024-07-13 12:04:28'),
(00000000108, 'E13= Plaistow', '2024-07-13 12:04:28'),
(00000000109, 'E14= Isle of Dogs, Millwall, Poplar', '2024-07-13 12:04:28'),
(00000000110, 'E15= Stratford, West Ham', '2024-07-13 12:04:28'),
(00000000111, 'E16= Canning Town, North Woolwich', '2024-07-13 12:04:28'),
(00000000112, 'E17= Walthamstow', '2024-07-13 12:04:28'),
(00000000113, 'E18= South Woodford', '2024-07-13 12:04:28'),
(00000000114, 'E20= Olympic Park, Stratford', '2024-07-13 12:04:28'),
(00000000115, 'EC1A = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000116, 'EC1M = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000117, 'EC1N = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000118, 'EC1P = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000119, 'EC1R = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000120, 'EC1V = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000121, 'EC1Y = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000122, 'EC2A = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000123, 'EC2M = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000124, 'EC2N = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000125, 'EC2P = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000126, 'EC2R = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000127, 'EC2V = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000128, 'EC2Y = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000129, 'EC3A = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000130, 'EC3M = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000131, 'EC3N = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000132, 'EC3P = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000133, 'EC3R = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000134, 'EC3V = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000135, 'EC4A = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000136, 'EC4M = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000137, 'EC4N = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000138, 'EC4P = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000139, 'EC4R = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000140, 'EC4V = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000141, 'EC4Y = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000142, 'WC1A = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000143, 'WC1B = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000144, 'WC1E = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000145, 'WC1H = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000146, 'WC1N = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000147, 'WC1R = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000148, 'WC1V = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000149, 'WC1X = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000150, 'WC2A = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000151, 'WC2B = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000152, 'WC2E = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000153, 'WC2H = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000154, 'WC2N = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000155, 'WC2R= Covent Garden, Holborn, Strand', '2024-07-13 12:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `price_by_location`
--

CREATE TABLE `price_by_location` (
  `pbl_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `vehicle_type` varchar(255) NOT NULL,
  `st_post` varchar(255) NOT NULL,
  `st_mile` varchar(255) NOT NULL,
  `fn_post` varchar(255) NOT NULL,
  `fn_mile` varchar(255) NOT NULL,
  `single_price` int(255) NOT NULL,
  `date_add_pbl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_mile`
--

CREATE TABLE `price_mile` (
  `pm_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `start_from` int(10) NOT NULL,
  `end_to` int(10) NOT NULL,
  `saloon` int(10) NOT NULL,
  `estate` int(10) NOT NULL,
  `mpv` int(10) NOT NULL,
  `esaloon` int(10) NOT NULL,
  `lmpv` int(10) NOT NULL,
  `empv` int(10) NOT NULL,
  `minibus` int(10) NOT NULL,
  `delivery` int(10) NOT NULL,
  `date_add_pm` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_mile`
--

INSERT INTO `price_mile` (`pm_id`, `start_from`, `end_to`, `saloon`, `estate`, `mpv`, `esaloon`, `lmpv`, `empv`, `minibus`, `delivery`, `date_add_pm`) VALUES
(00000000001, 0, 5, 12, 15, 18, 20, 22, 25, 28, 30, '2024-07-13 07:35:53'),
(00000000003, 5, 10, 120, 150, 180, 200, 220, 250, 280, 63, '2024-07-13 11:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `price_postcode`
--

CREATE TABLE `price_postcode` (
  `pp_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `pickup` varchar(55) NOT NULL,
  `dropoff` varchar(55) NOT NULL,
  `saloon` int(10) NOT NULL,
  `estate` int(10) NOT NULL,
  `mpv` int(10) NOT NULL,
  `esaloon` int(10) NOT NULL,
  `lmpv` int(10) NOT NULL,
  `empv` int(10) NOT NULL,
  `minibus` int(10) NOT NULL,
  `delivery` int(10) NOT NULL,
  `date_add_pp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_postcode`
--

INSERT INTO `price_postcode` (`pp_id`, `pickup`, `dropoff`, `saloon`, `estate`, `mpv`, `esaloon`, `lmpv`, `empv`, `minibus`, `delivery`, `date_add_pp`) VALUES
(00000000002, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road,', 'London, UK', 120, 150, 180, 200, 220, 250, 28010, 300, '2024-07-13 11:20:02');

-- --------------------------------------------------------

--
-- Table structure for table `railway_stations`
--

CREATE TABLE `railway_stations` (
  `rail_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `rail_name` varchar(255) NOT NULL,
  `rail_address` varchar(255) NOT NULL,
  `rail_city` varchar(255) NOT NULL,
  `rail_code` varchar(55) NOT NULL,
  `rail_date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `railway_stations`
--

INSERT INTO `railway_stations` (`rail_id`, `rail_name`, `rail_address`, `rail_city`, `rail_code`, `rail_date_added`) VALUES
(00000001, 'Gatwick Airport', 'Horley, Gatwick RH6 0NP', 'United Kingdom', 'LGW', '2023-10-27 19:00:00'),
(00000002, 'Heathrow Airport', 'Longford TW6, UK', 'United Kingdom', 'LHR', '2023-10-27 19:00:00'),
(00000003, 'Manchester Airport', 'Manchester M90 1QX', 'United Kingdom', 'MAN', '2023-10-27 19:00:00'),
(00000004, 'Birmingham Airport', 'Birmingham B26 3QJ', 'United Kingdom', 'BHX', '2023-10-27 19:00:00'),
(00000005, 'Stansted Airport', 'Bassingbourn Rd, Stansted CM24 1QW', 'United Kingdom', 'STN', '2023-10-27 19:00:00'),
(00000006, 'Leeds Bradford Airport', 'Whitehouse Ln, Yeadon, Leeds LS19 7TU', 'United Kingdom', 'LBA', '2023-10-27 19:00:00'),
(00000007, 'Luton Airport', 'Airport Way, Luton LU2 9LY', 'United Kingdom', 'LTN', '2023-10-27 19:00:00'),
(00000008, 'Southend Airport', 'Eastwoodbury Cres, Southend-on-Sea SS2 6YF', 'United Kingdom', 'SEN', '2023-10-27 19:00:00'),
(00000009, 'London City Airport', 'Hartmann Rd, London E16 2PX', 'United Kingdom', 'LCY', '2023-10-27 19:00:00'),
(00000010, 'Newcastle International Airport', 'Woolsington, Newcastle upon Tyne NE13 8BZ', 'United Kingdom', 'NCL', '2023-10-27 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `rev_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `job_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `rev_msg` text NOT NULL,
  `rev_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_dates`
--

CREATE TABLE `special_dates` (
  `dt_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `special_date` date NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `percent_increment` varchar(55) NOT NULL,
  `date_dt_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_dates`
--

INSERT INTO `special_dates` (`dt_id`, `special_date`, `event_name`, `percent_increment`, `date_dt_added`) VALUES
(00000000002, '2024-08-14', 'Azadi Daya', '15', '2024-07-13 12:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_gender` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `pc` int(11) NOT NULL,
  `nid` varchar(255) NOT NULL,
  `user_pic` varchar(255) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `user_email`, `user_password`, `user_phone`, `user_gender`, `designation`, `address`, `city`, `state`, `country_id`, `pc`, `nid`, `user_pic`, `reg_date`) VALUES
(00000001, 'Atiq', 'Ramzan', 'admin@prenero.com', '2c29030971430433fc33d0ab2f9658a2', '+923157524000', 'Male', 'Owner', 'Shop # 24, Hamza Market, Sargodha Road', 'Faisalabad', 'Punjab', 134, 38000, '33102-1457353-9', '6692115e98268_1720848734.jpg', '2024-07-19 11:29:25'),
(00000002, 'Azib ', 'Ali Butt', 'eurodatatechnology@gmail.com', '25d55ad283aa400af464c76d713c07ad', '+447552834179', 'Male', 'Administrator', 'London, United Kingdom.', 'London', '', 186, 0, '', '669210dd613b8_1720848605.jpg', '2024-07-13 05:30:05'),
(00000004, 'Atiq', 'Rehman', 'atiq@minicaboffice.com', 'ati123', '0316627252826w', 'Male', 'Acount Manager', '', '', '', 134, 54000, '62526e6e57262', '66d59a762df84_1725274742.jpg', '2024-09-02 10:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `v_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `v_name` varchar(255) NOT NULL,
  `v_seat` int(55) NOT NULL,
  `luggage` int(5) NOT NULL,
  `v_airbags` int(55) DEFAULT 0,
  `v_wchair` int(55) DEFAULT 0,
  `v_babyseat` int(55) DEFAULT 0,
  `v_pricing` int(55) NOT NULL,
  `v_img` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`v_id`, `v_name`, `v_seat`, `luggage`, `v_airbags`, `v_wchair`, `v_babyseat`, `v_pricing`, `v_img`, `date_added`) VALUES
(00000000001, 'Saloon', 4, 1, 0, 0, 0, 10, 'toyota-prius.png', '2024-09-03 15:29:14'),
(00000000002, 'Estate', 4, 1, 1, 0, 0, 20, 'Ford-Galaxy.png', '2024-09-03 15:29:39'),
(00000000003, 'MPV', 4, 2, 0, 0, 0, 25, 'Ford-Galaxy.png', '2024-09-03 15:29:59'),
(00000000004, 'Large MPV', 5, 4, 0, 0, 0, 30, 'Skoda_Octavia.png', '2024-09-03 15:30:16'),
(00000000005, 'Minibus', 6, 6, 0, 0, 0, 50, 'Ford-Crown-Victoria.png', '2023-10-17 14:39:57'),
(00000000006, 'Executive', 7, 6, 0, 0, 0, 50, 'Ford-Mondeo.png', '2023-10-17 14:39:57'),
(00000000007, 'Executive Minibus', 8, 6, 0, 0, 0, 80, 'Ford-Mondeo.png', '2024-09-03 15:30:52'),
(00000000008, '10 - 14 Passenger', 10, 10, 0, 0, 0, 140, 'Toyota-Camry.png', '2024-09-03 15:33:42'),
(00000000009, '15 - 16 Passenger', 15, 14, 0, 0, 0, 150, 'Citroen-Berlingo.png', '2024-09-03 15:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_documents`
--

CREATE TABLE `vehicle_documents` (
  `vd_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `log_book` varchar(255) NOT NULL,
  `mot_certificate` varchar(255) NOT NULL,
  `pco` varchar(255) NOT NULL,
  `insurance` varchar(255) NOT NULL,
  `road_tax` varchar(255) NOT NULL,
  `vehicle_picture_front` varchar(255) NOT NULL,
  `vehicle_picture_back` varchar(255) NOT NULL,
  `rental_agreement` varchar(255) NOT NULL,
  `insurance_schedule` varchar(255) NOT NULL,
  `extra` varchar(255) NOT NULL,
  `date_upload` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_documents`
--

INSERT INTO `vehicle_documents` (`vd_id`, `d_id`, `log_book`, `mot_certificate`, `pco`, `insurance`, `road_tax`, `vehicle_picture_front`, `vehicle_picture_back`, `rental_agreement`, `insurance_schedule`, `extra`, `date_upload`) VALUES
(00000001, 00000001, '66d2167aefdde.jpg', '', '', '', '', '', '', '', '', '', '2024-08-30 18:59:06'),
(00000002, 00000002, '66d216def3666.jpg', '66d216e81f203.jpg', '', '', '', '', '', '', '', '', '2024-08-30 19:00:56'),
(00000003, 00000003, '', '', '', '', '', '', '', '', '', '', '2024-09-06 14:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `waiting_time`
--

CREATE TABLE `waiting_time` (
  `wt_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `job_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `waiting_time` varchar(25) NOT NULL,
  `time_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waiting_time`
--

INSERT INTO `waiting_time` (`wt_id`, `c_id`, `d_id`, `job_id`, `waiting_time`, `time_added`) VALUES
(00000001, 00000000, 00000001, 00000002, '00:00:01', '2024-08-31 10:23:50'),
(00000002, 00000000, 00000001, 00000004, '00:00:55', '2024-08-31 10:34:13'),
(00000003, 00000000, 00000002, 00000013, '00:00:10', '2024-09-04 20:50:08'),
(00000004, 00000000, 00000001, 00000014, '00:00:04', '2024-09-05 00:31:15'),
(00000005, 00000000, 00000002, 00000015, '00:00:08', '2024-09-05 17:49:15'),
(00000006, 00000000, 00000002, 00000016, '00:00:02', '2024-09-06 18:41:57'),
(00000007, 00000000, 00000002, 00000017, '00:00:03', '2024-09-07 10:35:18'),
(00000008, 00000000, 00000002, 00000018, '00:00:09', '2024-09-07 10:49:49'),
(00000009, 00000000, 00000002, 00000019, '00:00:03', '2024-09-07 11:10:49'),
(00000010, 00000000, 00000002, 00000020, '00:00:06', '2024-09-07 11:55:50'),
(00000011, 00000000, 00000002, 00000021, '00:00:05', '2024-09-07 12:01:53'),
(00000012, 00000000, 00000002, 00000023, '00:00:06', '2024-09-07 12:17:02'),
(00000013, 00000000, 00000002, 00000024, '00:00:04', '2024-09-07 12:20:51'),
(00000014, 00000000, 00000002, 00000025, '00:00:02', '2024-09-07 12:25:02'),
(00000015, 00000000, 00000002, 00000026, '00:00:04', '2024-09-07 12:40:32'),
(00000016, 00000000, 00000002, 00000027, '00:00:06', '2024-09-07 12:44:21'),
(00000017, 00000000, 00000002, 00000028, '00:00:08', '2024-09-07 12:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `zone_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `zone_name` varchar(255) NOT NULL,
  `zone_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_name`, `zone_date`) VALUES
(00000000001, 'N1= Barnsbury, Canonbury, Islington', '2024-07-13 12:04:27'),
(00000000002, 'N2= East Finchley', '2024-07-13 12:04:27'),
(00000000003, 'N3= Finchley Central', '2024-07-13 12:04:27'),
(00000000004, 'N4= Finsbury Park, Manor House', '2024-07-13 12:04:27'),
(00000000005, 'N5= Highbury', '2024-07-13 12:04:27'),
(00000000006, 'N6= Highgate', '2024-07-13 12:04:27'),
(00000000007, 'N7= Holloway', '2024-07-13 12:04:27'),
(00000000008, 'N8= Crouch End, Hornsey', '2024-07-13 12:04:27'),
(00000000009, 'N9= Lower Edmonton', '2024-07-13 12:04:27'),
(00000000010, 'N10= Muswell Hill', '2024-07-13 12:04:27'),
(00000000011, 'N11= Friern Barnet, New Southgate', '2024-07-13 12:04:27'),
(00000000012, 'N12= North Finchley, Woodside Park', '2024-07-13 12:04:27'),
(00000000013, 'N13= Palmers Green', '2024-07-13 12:04:27'),
(00000000014, 'N14= Southgate', '2024-07-13 12:04:27'),
(00000000015, 'N15= Seven Sisters', '2024-07-13 12:04:27'),
(00000000016, 'N16= Stamford Hill, Stoke Newington', '2024-07-13 12:04:27'),
(00000000017, 'N17= Tottenham', '2024-07-13 12:04:27'),
(00000000018, 'N18= Upper Edmonton', '2024-07-13 12:04:27'),
(00000000019, 'N19= Archway, Tufnell Park', '2024-07-13 12:04:27'),
(00000000020, 'N20= Totteridge, Whetstone', '2024-07-13 12:04:27'),
(00000000021, 'N21= Winchmore Hill', '2024-07-13 12:04:27'),
(00000000022, 'N22= Alexandra Palace, Wood Green', '2024-07-13 12:04:27'),
(00000000023, 'NW1= Camden Town, Regent\'s Park', '2024-07-13 12:04:27'),
(00000000024, 'NW2= Cricklewood, Neasden', '2024-07-13 12:04:27'),
(00000000025, 'NW3= Hampstead, Swiss Cottage', '2024-07-13 12:04:27'),
(00000000026, 'NW4= Brent Cross, Hendon', '2024-07-13 12:04:27'),
(00000000027, 'NW5= Kentish Town', '2024-07-13 12:04:27'),
(00000000028, 'NW6= Kilburn, Queens Park, West Hampstead', '2024-07-13 12:04:27'),
(00000000029, 'NW7= Mill Hill', '2024-07-13 12:04:27'),
(00000000030, 'NW8= St John\'s Wood', '2024-07-13 12:04:27'),
(00000000031, 'NW9= Colindale, Kingsbury', '2024-07-13 12:04:27'),
(00000000032, 'NW10= Harlesden, Kensal Green, Willesden', '2024-07-13 12:04:27'),
(00000000033, 'NW11= Golders Green, Hampstead Garden Suburb', '2024-07-13 12:04:27'),
(00000000034, 'SE1= Bermondsey, Borough, Southwark, Waterloo', '2024-07-13 12:04:27'),
(00000000035, 'SE2= Abbey Wood', '2024-07-13 12:04:27'),
(00000000036, 'SE3= Blackheath, Westcombe Park', '2024-07-13 12:04:27'),
(00000000037, 'SE4= Brockley, Crofton Park, Honor Oak Park', '2024-07-13 12:04:27'),
(00000000038, 'SE5= Camberwell', '2024-07-13 12:04:27'),
(00000000039, 'SE6= Bellingham, Catford, Hither Green', '2024-07-13 12:04:27'),
(00000000040, 'SE7= Charlton', '2024-07-13 12:04:27'),
(00000000041, 'SE8= Deptford', '2024-07-13 12:04:27'),
(00000000042, 'SE9= Eltham, Mottingham', '2024-07-13 12:04:27'),
(00000000043, 'SE10= Greenwich', '2024-07-13 12:04:27'),
(00000000044, 'SE11= Lambeth', '2024-07-13 12:04:27'),
(00000000045, 'SE12= Grove Park, Lee', '2024-07-13 12:04:27'),
(00000000046, 'SE13= Hither Green, Lewisham', '2024-07-13 12:04:27'),
(00000000047, 'SE14= New Cross, New Cross Gate', '2024-07-13 12:04:27'),
(00000000048, 'SE15= Nunhead, Peckham', '2024-07-13 12:04:27'),
(00000000049, 'SE16= Rotherhithe, South Bermondsey, Surrey Docks', '2024-07-13 12:04:27'),
(00000000050, 'SE17= Elephant & Castle, Walworth', '2024-07-13 12:04:27'),
(00000000051, 'SE18= Plumstead, Woolwich', '2024-07-13 12:04:27'),
(00000000052, 'SE19= Crystal Palace, Upper Norwood', '2024-07-13 12:04:27'),
(00000000053, 'SE20= Anerley, Penge', '2024-07-13 12:04:28'),
(00000000054, 'SE21= Dulwich', '2024-07-13 12:04:28'),
(00000000055, 'SE22= East Dulwich', '2024-07-13 12:04:28'),
(00000000056, 'SE23= Forest Hill', '2024-07-13 12:04:28'),
(00000000057, 'SE24= Herne Hill', '2024-07-13 12:04:28'),
(00000000058, 'SE25= South Norwood', '2024-07-13 12:04:28'),
(00000000059, 'SE26= Sydenham', '2024-07-13 12:04:28'),
(00000000060, 'SE27= Tulse Hill, West Norwood', '2024-07-13 12:04:28'),
(00000000061, 'SE28= Thamesmead', '2024-07-13 12:04:28'),
(00000000062, 'SW1= Belgravia, Pimlico, Westminster', '2024-07-13 12:04:28'),
(00000000063, 'SW2= Brixton, Streatham Hill', '2024-07-13 12:04:28'),
(00000000064, 'SW3= Brompton, Chelsea', '2024-07-13 12:04:28'),
(00000000065, 'SW4= Clapham', '2024-07-13 12:04:28'),
(00000000066, 'SW5= Earl\'s Court', '2024-07-13 12:04:28'),
(00000000067, 'SW6= Fulham, Parson\'s Green', '2024-07-13 12:04:28'),
(00000000068, 'SW7= South Kensington', '2024-07-13 12:04:28'),
(00000000069, 'SW8= Nine Elms, South Lambeth', '2024-07-13 12:04:28'),
(00000000070, 'SW9= Brixton, Stockwell', '2024-07-13 12:04:28'),
(00000000071, 'SW10= West Brompton, World\'s End', '2024-07-13 12:04:28'),
(00000000072, 'SW11= Battersea, Clapham Junction', '2024-07-13 12:04:28'),
(00000000073, 'SW12= Balham', '2024-07-13 12:04:28'),
(00000000074, 'SW13= Barnes, Castelnau', '2024-07-13 12:04:28'),
(00000000075, 'SW14= East Sheen, Mortlake', '2024-07-13 12:04:28'),
(00000000076, 'SW15= Putney, Roehampton', '2024-07-13 12:04:28'),
(00000000077, 'SW16= Norbury, Streatham', '2024-07-13 12:04:28'),
(00000000078, 'SW17= Tooting', '2024-07-13 12:04:28'),
(00000000079, 'SW18= Earlsfield, Wandsworth', '2024-07-13 12:04:28'),
(00000000080, 'SW19= Merton, Wimbledon', '2024-07-13 12:04:28'),
(00000000081, 'SW20= Raynes Park, South Wimbledon', '2024-07-13 12:04:28'),
(00000000082, 'W1= Marylebone, Mayfair, Soho', '2024-07-13 12:04:28'),
(00000000083, 'W2= Bayswater, Paddington', '2024-07-13 12:04:28'),
(00000000084, 'W3= Acton', '2024-07-13 12:04:28'),
(00000000085, 'W4= Chiswick', '2024-07-13 12:04:28'),
(00000000086, 'W5= Ealing', '2024-07-13 12:04:28'),
(00000000087, 'W6= Hammersmith', '2024-07-13 12:04:28'),
(00000000088, 'W7= Hanwell', '2024-07-13 12:04:28'),
(00000000089, 'W8= Kensington', '2024-07-13 12:04:28'),
(00000000090, 'W9= Maida Vale, Warwick Avenue', '2024-07-13 12:04:28'),
(00000000091, 'W10= Ladbroke Grove, North Kensington', '2024-07-13 12:04:28'),
(00000000092, 'W11= Holland Park, Notting Hill', '2024-07-13 12:04:28'),
(00000000093, 'W12= Shepherd\'s Bush', '2024-07-13 12:04:28'),
(00000000094, 'W13= West Ealing', '2024-07-13 12:04:28'),
(00000000095, 'W14= West Kensington', '2024-07-13 12:04:28'),
(00000000096, 'E1= Mile End, Stepney, Whitechapel', '2024-07-13 12:04:28'),
(00000000097, 'E2= Bethnal Green, Shoreditch', '2024-07-13 12:04:28'),
(00000000098, 'E3= Bow, Bromley-by-Bow', '2024-07-13 12:04:28'),
(00000000099, 'E4= Chingford, Highams Park', '2024-07-13 12:04:28'),
(00000000100, 'E5= Clapton', '2024-07-13 12:04:28'),
(00000000101, 'E6= East Ham, Beckton', '2024-07-13 12:04:28'),
(00000000102, 'E7= Forest Gate, Upton Park', '2024-07-13 12:04:28'),
(00000000103, 'E8= Hackney, Dalston', '2024-07-13 12:04:28'),
(00000000104, 'E9= Hackney, Homerton', '2024-07-13 12:04:28'),
(00000000105, 'E10= Leyton', '2024-07-13 12:04:28'),
(00000000106, 'E11= Leytonstone', '2024-07-13 12:04:28'),
(00000000107, 'E12= Manor Park', '2024-07-13 12:04:28'),
(00000000108, 'E13= Plaistow', '2024-07-13 12:04:28'),
(00000000109, 'E14= Isle of Dogs, Millwall, Poplar', '2024-07-13 12:04:28'),
(00000000110, 'E15= Stratford, West Ham', '2024-07-13 12:04:28'),
(00000000111, 'E16= Canning Town, North Woolwich', '2024-07-13 12:04:28'),
(00000000112, 'E17= Walthamstow', '2024-07-13 12:04:28'),
(00000000113, 'E18= South Woodford', '2024-07-13 12:04:28'),
(00000000114, 'E20= Olympic Park, Stratford', '2024-07-13 12:04:28'),
(00000000115, 'EC1A = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000116, 'EC1M = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000117, 'EC1N = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000118, 'EC1P = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000119, 'EC1R = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000120, 'EC1V = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000121, 'EC1Y = Barbican, Clerkenwell, Finsbury', '2024-07-13 12:04:28'),
(00000000122, 'EC2A = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000123, 'EC2M = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000124, 'EC2N = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000125, 'EC2P = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000126, 'EC2R = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000127, 'EC2V = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000128, 'EC2Y = Moorgate, Liverpool Street', '2024-07-13 12:04:28'),
(00000000129, 'EC3A = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000130, 'EC3M = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000131, 'EC3N = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000132, 'EC3P = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000133, 'EC3R = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000134, 'EC3V = Aldgate, Monument, Tower Hill', '2024-07-13 12:04:28'),
(00000000135, 'EC4A = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000136, 'EC4M = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000137, 'EC4N = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000138, 'EC4P = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000139, 'EC4R = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000140, 'EC4V = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000141, 'EC4Y = Fleet Street, St Paul\'s', '2024-07-13 12:04:28'),
(00000000142, 'WC1A = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000143, 'WC1B = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000144, 'WC1E = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000145, 'WC1H = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000146, 'WC1N = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000147, 'WC1R = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000148, 'WC1V = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000149, 'WC1X = Bloomsbury, Gray\'s Inn', '2024-07-13 12:04:28'),
(00000000150, 'WC2A = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000151, 'WC2B = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000152, 'WC2E = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000153, 'WC2H = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000154, 'WC2N = Covent Garden, Holborn, Strand', '2024-07-13 12:04:28'),
(00000000155, 'WC2R= Covent Garden, Holborn, Strand', '2024-07-13 12:04:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_index` (`user_type`,`user_id`);

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`ap_id`);

--
-- Indexes for table `availability_times`
--
ALTER TABLE `availability_times`
  ADD PRIMARY KEY (`at_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`);

--
-- Indexes for table `booker_account`
--
ALTER TABLE `booker_account`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `idx_vehicle_id` (`v_id`),
  ADD KEY `clients` (`c_id`);

--
-- Indexes for table `booking_type`
--
ALTER TABLE `booking_type`
  ADD PRIMARY KEY (`b_type_id`);

--
-- Indexes for table `break_time`
--
ALTER TABLE `break_time`
  ADD PRIMARY KEY (`bt_id`);

--
-- Indexes for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  ADD PRIMARY KEY (`cb_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`com_id`) USING BTREE;

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `customers_address`
--
ALTER TABLE `customers_address`
  ADD PRIMARY KEY (`ca_id`);

--
-- Indexes for table `customer_bank_account`
--
ALTER TABLE `customer_bank_account`
  ADD PRIMARY KEY (`cb_id`);

--
-- Indexes for table `customer_cards`
--
ALTER TABLE `customer_cards`
  ADD PRIMARY KEY (`cc_id`);

--
-- Indexes for table `delete_companies`
--
ALTER TABLE `delete_companies`
  ADD PRIMARY KEY (`del_com_id`);

--
-- Indexes for table `delete_customers`
--
ALTER TABLE `delete_customers`
  ADD PRIMARY KEY (`del_c_id`);

--
-- Indexes for table `delete_drivers`
--
ALTER TABLE `delete_drivers`
  ADD PRIMARY KEY (`del_d_id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`des_id`) USING BTREE;

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `driver_accounts`
--
ALTER TABLE `driver_accounts`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indexes for table `driver_bank_details`
--
ALTER TABLE `driver_bank_details`
  ADD PRIMARY KEY (`d_bank_id`);

--
-- Indexes for table `driver_documents`
--
ALTER TABLE `driver_documents`
  ADD PRIMARY KEY (`dd_id`);

--
-- Indexes for table `driver_history`
--
ALTER TABLE `driver_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `driver_location`
--
ALTER TABLE `driver_location`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  ADD PRIMARY KEY (`dv_id`);

--
-- Indexes for table `fares`
--
ALTER TABLE `fares`
  ADD PRIMARY KEY (`fare_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`) USING BTREE;

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `marketing_preference`
--
ALTER TABLE `marketing_preference`
  ADD PRIMARY KEY (`mp_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `mg_charges`
--
ALTER TABLE `mg_charges`
  ADD PRIMARY KEY (`mg_id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `peak_hours`
--
ALTER TABLE `peak_hours`
  ADD PRIMARY KEY (`ph_id`);

--
-- Indexes for table `post_codes`
--
ALTER TABLE `post_codes`
  ADD PRIMARY KEY (`pc_id`);

--
-- Indexes for table `price_by_location`
--
ALTER TABLE `price_by_location`
  ADD PRIMARY KEY (`pbl_id`);

--
-- Indexes for table `price_mile`
--
ALTER TABLE `price_mile`
  ADD PRIMARY KEY (`pm_id`);

--
-- Indexes for table `price_postcode`
--
ALTER TABLE `price_postcode`
  ADD PRIMARY KEY (`pp_id`);

--
-- Indexes for table `railway_stations`
--
ALTER TABLE `railway_stations`
  ADD PRIMARY KEY (`rail_id`) USING BTREE;

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`rev_id`);

--
-- Indexes for table `special_dates`
--
ALTER TABLE `special_dates`
  ADD PRIMARY KEY (`dt_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`v_id`);

--
-- Indexes for table `vehicle_documents`
--
ALTER TABLE `vehicle_documents`
  ADD PRIMARY KEY (`vd_id`);

--
-- Indexes for table `waiting_time`
--
ALTER TABLE `waiting_time`
  ADD PRIMARY KEY (`wt_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `log_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `ap_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `availability_times`
--
ALTER TABLE `availability_times`
  MODIFY `at_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `booking_type`
--
ALTER TABLE `booking_type`
  MODIFY `b_type_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `break_time`
--
ALTER TABLE `break_time`
  MODIFY `bt_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  MODIFY `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `com_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `customers_address`
--
ALTER TABLE `customers_address`
  MODIFY `ca_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_bank_account`
--
ALTER TABLE `customer_bank_account`
  MODIFY `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_cards`
--
ALTER TABLE `customer_cards`
  MODIFY `cc_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delete_companies`
--
ALTER TABLE `delete_companies`
  MODIFY `del_com_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delete_customers`
--
ALTER TABLE `delete_customers`
  MODIFY `del_c_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delete_drivers`
--
ALTER TABLE `delete_drivers`
  MODIFY `del_d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `des_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_accounts`
--
ALTER TABLE `driver_accounts`
  MODIFY `ac_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_bank_details`
--
ALTER TABLE `driver_bank_details`
  MODIFY `d_bank_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_documents`
--
ALTER TABLE `driver_documents`
  MODIFY `dd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_history`
--
ALTER TABLE `driver_history`
  MODIFY `history_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `dv_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fares`
--
ALTER TABLE `fares`
  MODIFY `fare_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `lang_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `marketing_preference`
--
ALTER TABLE `marketing_preference`
  MODIFY `mp_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mg_charges`
--
ALTER TABLE `mg_charges`
  MODIFY `mg_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `pay_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peak_hours`
--
ALTER TABLE `peak_hours`
  MODIFY `ph_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_codes`
--
ALTER TABLE `post_codes`
  MODIFY `pc_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `price_by_location`
--
ALTER TABLE `price_by_location`
  MODIFY `pbl_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_mile`
--
ALTER TABLE `price_mile`
  MODIFY `pm_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `price_postcode`
--
ALTER TABLE `price_postcode`
  MODIFY `pp_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `railway_stations`
--
ALTER TABLE `railway_stations`
  MODIFY `rail_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `rev_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `special_dates`
--
ALTER TABLE `special_dates`
  MODIFY `dt_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vehicle_documents`
--
ALTER TABLE `vehicle_documents`
  MODIFY `vd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `waiting_time`
--
ALTER TABLE `waiting_time`
  MODIFY `wt_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
