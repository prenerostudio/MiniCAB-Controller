-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2024 at 04:41 AM
-- Server version: 10.6.19-MariaDB-cll-lve
-- PHP Version: 8.3.12

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
(00000418, 'Status Updated', '2024-09-09 13:25:03', 'driver', 00000002, 'Your Status recently Updated'),
(00000419, 'Go on ride', '2024-09-09 15:56:17', 'driver', 00000001, 'You go on ride'),
(00000420, 'Job Completed', '2024-09-09 15:56:46', 'driver', 00000001, 'Job # 00000014 Has been Completed.'),
(00000421, 'Account Logged In', '2024-09-09 17:16:46', 'driver', 00000002, 'You have logged in to your account.'),
(00000422, 'Status Updated', '2024-09-09 17:17:24', 'driver', 00000002, 'Your Status recently Updated'),
(00000423, 'Controller Logged-In', '2024-09-09 17:23:55', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000424, 'Job Dispatched', '2024-09-09 17:24:10', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000425, 'Job Accepted', '2024-09-09 17:24:20', 'driver', 00000002, 'Job 00000029 has been accepted by driver.'),
(00000426, 'Status Updated', '2024-09-09 21:48:39', 'driver', 00000001, 'Your Status recently Updated'),
(00000427, 'Status Updated', '2024-09-09 21:48:39', 'driver', 00000001, 'Your Status recently Updated'),
(00000428, 'Status Updated', '2024-09-09 21:48:59', 'driver', 00000001, 'Your Status recently Updated'),
(00000429, 'Controller Logged-In', '2024-09-09 21:49:55', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000430, 'New Booking', '2024-09-09 21:50:45', 'user', 00000001, 'Controller Has added a new booking 85'),
(00000431, 'Job Dispatched', '2024-09-09 21:50:55', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000432, 'Job Accepted', '2024-09-09 21:51:08', 'driver', 00000001, 'Job 00000030 has been accepted by driver.'),
(00000433, 'Status Updated to wtp', '2024-09-09 21:51:18', 'driver', 00000001, 'Your Status recently Updated'),
(00000434, 'Waiting Time for Passeger', '2024-09-09 21:51:28', 'driver', 00000001, 'Driver wait 00:00:03 for the passenger against Booking # 00000030'),
(00000435, 'Go on ride', '2024-09-09 21:51:29', 'driver', 00000001, 'You go on ride'),
(00000436, 'Job Completed', '2024-09-09 21:51:57', 'driver', 00000001, 'Job # 00000030 Has been Completed.'),
(00000437, 'Status Updated', '2024-09-09 21:52:09', 'driver', 00000001, 'Your Status recently Updated'),
(00000438, 'Account Logged In', '2024-09-09 21:55:31', 'driver', 00000001, 'You have logged in to your account.'),
(00000439, 'Status Updated', '2024-09-09 22:07:13', 'driver', 00000001, 'Your Status recently Updated'),
(00000440, 'Job Withdrawal', '2024-09-09 22:07:20', 'user', 00000001, 'Job 00000030 has been withdrawn by Controller.'),
(00000441, 'Job Dispatched', '2024-09-09 22:07:35', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000442, 'Job Accepted', '2024-09-09 22:07:45', 'driver', 00000001, 'Job 00000031 has been accepted by driver.');
INSERT INTO `activity_log` (`log_id`, `activity_type`, `timestamp`, `user_type`, `user_id`, `details`) VALUES
(00000443, 'Status Updated to wtp', '2024-09-09 22:07:59', 'driver', 00000001, 'Your Status recently Updated'),
(00000444, 'Waiting Time for Passeger', '2024-09-09 22:08:13', 'driver', 00000001, 'Driver wait 00:00:03 for the passenger against Booking # 00000031'),
(00000445, 'Go on ride', '2024-09-09 22:08:14', 'driver', 00000001, 'You go on ride'),
(00000446, 'Job Completed', '2024-09-09 22:08:28', 'driver', 00000001, 'Job # 00000031 Has been Completed.'),
(00000447, 'Status Updated', '2024-09-09 22:09:06', 'driver', 00000001, 'Your Status recently Updated'),
(00000448, 'Account Logged In', '2024-09-09 22:11:09', 'driver', 00000001, 'You have logged in to your account.'),
(00000449, 'Controller Logged-In', '2024-09-10 11:01:07', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000450, 'Status Updated', '2024-09-10 11:46:27', 'driver', 00000001, 'Your Status recently Updated'),
(00000451, 'Booker Signed-In', '2024-09-10 11:53:50', 'client', 00000002, 'Booker recently logged-In.'),
(00000452, 'Status Updated', '2024-09-10 12:10:01', 'driver', 00000001, 'Your Status recently Updated'),
(00000453, 'Status Updated', '2024-09-10 12:10:02', 'driver', 00000001, 'Your Status recently Updated'),
(00000454, 'Account Logged In', '2024-09-10 12:10:12', 'driver', 00000001, 'You have logged in to your account.'),
(00000455, 'Account Logged In', '2024-09-10 12:10:26', 'driver', 00000001, 'You have logged in to your account.'),
(00000456, 'Account Logged In', '2024-09-10 12:10:43', 'driver', 00000001, 'You have logged in to your account.'),
(00000457, 'Account Logged In', '2024-09-10 12:10:50', 'driver', 00000001, 'You have logged in to your account.'),
(00000458, 'Account Logged In', '2024-09-10 12:11:31', 'driver', 00000001, 'You have logged in to your account.'),
(00000459, 'Account Logged In', '2024-09-10 13:14:29', 'driver', 00000001, 'You have logged in to your account.'),
(00000460, 'Controller Logged-In', '2024-09-10 15:50:59', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000461, 'Controller Logged-In', '2024-09-10 16:35:13', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000462, 'Account Logged In', '2024-09-10 16:36:46', 'driver', 00000003, 'You have logged in to your account.'),
(00000463, 'Controller Logged-In', '2024-09-10 17:14:32', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000464, 'Controller Logged-In', '2024-09-10 18:00:47', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000465, 'Controller Logged-In', '2024-09-10 19:13:35', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000466, 'Status Updated', '2024-09-10 22:36:18', 'driver', 00000001, 'Your Status recently Updated'),
(00000467, 'Controller Logged-In', '2024-09-10 22:37:29', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000468, 'Account Logged In', '2024-09-10 22:39:51', 'driver', 00000001, 'You have logged in to your account.'),
(00000469, 'Status Updated', '2024-09-10 22:39:59', 'driver', 00000001, 'Your Status recently Updated'),
(00000470, 'Account Logged In', '2024-09-10 22:40:15', 'driver', 00000001, 'You have logged in to your account.'),
(00000471, 'New Booking', '2024-09-10 22:41:09', 'user', 00000001, 'Controller Has added a new booking 86'),
(00000472, 'Job Dispatched', '2024-09-10 22:41:19', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000473, 'Job Accepted', '2024-09-10 22:41:44', 'driver', 00000001, 'Job 00000032 has been accepted by driver.'),
(00000474, 'Status Updated to wtp', '2024-09-10 22:42:27', 'driver', 00000001, 'Your Status recently Updated'),
(00000475, 'Status Updated to POB', '2024-09-10 22:42:40', 'driver', 00000001, 'Your Status POB recently Updated'),
(00000476, 'Waiting Time for Passeger', '2024-09-10 22:42:48', 'driver', 00000001, 'Driver wait 00:00:02 for the passenger against Booking # 00000032'),
(00000477, 'Go on ride', '2024-09-10 22:42:48', 'driver', 00000001, 'You go on ride'),
(00000478, 'Job Completed', '2024-09-10 22:42:58', 'driver', 00000001, 'Job # 00000032 Has been Completed.'),
(00000479, 'Bid Opened', '2024-09-10 22:43:39', 'user', 00000001, 'Bid Against Booking ID 00000086 Has Been Opened by Controller.'),
(00000480, 'Booking Updated', '2024-09-10 22:44:04', 'user', 00000001, 'Booking 00000086 Has Been Updated by Controller.'),
(00000481, 'Job Dispatched', '2024-09-10 22:45:20', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000482, 'Booking Cancelled', '2024-09-10 22:45:45', 'driver', 00000000, 'Booking # 00000084 has been cacelled.'),
(00000483, 'Job Dispatched', '2024-09-10 22:50:33', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000484, 'Job Accepted', '2024-09-10 22:50:49', 'driver', 00000001, 'Job 00000034 has been accepted by driver.'),
(00000485, 'Job Withdrawal', '2024-09-10 22:50:59', 'user', 00000001, 'Job 00000034 has been withdrawn by Controller.'),
(00000486, 'Job Dispatched', '2024-09-10 22:51:14', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000487, 'Job Accepted', '2024-09-10 22:51:19', 'driver', 00000001, 'Job 00000035 has been accepted by driver.'),
(00000488, 'Status Updated', '2024-09-10 22:52:49', 'driver', 00000001, 'Your Status recently Updated'),
(00000489, 'Status Updated to wtp', '2024-09-10 22:54:45', 'driver', 00000001, 'Your Status recently Updated'),
(00000490, 'Waiting Time for Passeger', '2024-09-10 22:57:54', 'driver', 00000001, 'Driver wait 00:00:09 for the passenger against Booking # 00000035'),
(00000491, 'Go on ride', '2024-09-10 22:57:54', 'driver', 00000001, 'You go on ride'),
(00000492, 'Go on ride', '2024-09-10 23:01:56', 'driver', 00000001, 'You go on ride'),
(00000493, 'Job Completed', '2024-09-10 23:02:46', 'driver', 00000001, 'Job # 00000035 Has been Completed.'),
(00000494, 'Account Logged In', '2024-09-10 23:08:04', 'driver', 00000001, 'You have logged in to your account.'),
(00000495, 'Account Logged In', '2024-09-10 23:08:10', 'driver', 00000001, 'You have logged in to your account.'),
(00000496, 'Account Logged In', '2024-09-10 23:08:27', 'driver', 00000001, 'You have logged in to your account.'),
(00000497, 'Status Updated', '2024-09-10 23:17:00', 'driver', 00000001, 'Your Status recently Updated'),
(00000498, 'Status Updated', '2024-09-10 23:17:08', 'driver', 00000001, 'Your Status recently Updated'),
(00000499, 'Account Logged In', '2024-09-10 23:19:34', 'driver', 00000001, 'You have logged in to your account.'),
(00000500, 'Status Updated', '2024-09-10 23:29:31', 'driver', 00000001, 'Your Status recently Updated'),
(00000501, 'Account Logged In', '2024-09-10 23:29:44', 'driver', 00000001, 'You have logged in to your account.'),
(00000502, 'Status Updated', '2024-09-11 01:17:12', 'driver', 00000001, 'Your Status recently Updated'),
(00000503, 'Status Updated', '2024-09-11 01:17:12', 'driver', 00000001, 'Your Status recently Updated'),
(00000504, 'Controller Logged-In', '2024-09-11 01:17:16', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000505, 'New Booking', '2024-09-11 01:18:41', 'user', 00000001, 'Controller Has added a new booking 87'),
(00000506, 'Job Dispatched', '2024-09-11 01:19:17', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000507, 'Job Accepted', '2024-09-11 01:19:29', 'driver', 00000001, 'Job 00000036 has been accepted by driver.'),
(00000508, 'Status Updated to wtp', '2024-09-11 01:26:25', 'driver', 00000001, 'Your Status recently Updated'),
(00000509, 'Controller Logged-In', '2024-09-11 02:13:07', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000510, 'Booker Signed-In', '2024-09-11 06:05:29', 'client', 00000001, 'Booker recently logged-In.'),
(00000511, 'Account Logged In', '2024-09-11 11:21:56', 'driver', 00000001, 'You have logged in to your account.'),
(00000512, 'Controller Logged-In', '2024-09-11 17:17:32', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000513, 'Account Logged In', '2024-09-11 17:19:53', 'driver', 00000002, 'You have logged in to your account.'),
(00000514, 'Status Updated', '2024-09-11 17:20:48', 'driver', 00000002, 'Your Status recently Updated'),
(00000515, 'Status Updated', '2024-09-11 17:20:53', 'driver', 00000002, 'Your Status recently Updated'),
(00000516, 'Status Updated', '2024-09-11 17:20:58', 'driver', 00000002, 'Your Status recently Updated'),
(00000517, 'Status Updated', '2024-09-11 17:20:59', 'driver', 00000002, 'Your Status recently Updated'),
(00000518, 'Status Updated', '2024-09-11 17:23:27', 'driver', 00000002, 'Your Status recently Updated'),
(00000519, 'Status Updated', '2024-09-11 17:23:28', 'driver', 00000002, 'Your Status recently Updated'),
(00000520, 'New Booking', '2024-09-11 17:25:58', 'user', 00000001, 'Controller Has added a new booking 88'),
(00000521, 'Job Dispatched', '2024-09-11 17:26:08', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000522, 'Controller Logged-In', '2024-09-11 18:09:25', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000523, 'Booking Cancelled', '2024-09-11 18:09:35', 'user', 00000001, 'Booking ID: 00000088 Has been Cancelled by Controller.'),
(00000524, 'Job Dispatched', '2024-09-11 18:10:38', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000525, 'Job Withdrawal', '2024-09-11 18:10:47', 'user', 00000001, 'Job 00000038 has been withdrawn by Controller.'),
(00000526, 'Job Accepted', '2024-09-11 18:10:58', 'driver', 00000002, 'Job 00000037 has been accepted by driver.'),
(00000527, 'Status Updated', '2024-09-11 18:20:35', 'driver', 00000002, 'Your Status recently Updated'),
(00000528, 'Status Updated to wtp', '2024-09-11 18:20:39', 'driver', 00000002, 'Your Status recently Updated'),
(00000529, 'Status Updated to POB', '2024-09-11 18:20:49', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000530, 'Waiting Time for Passeger', '2024-09-11 18:20:57', 'driver', 00000002, 'Driver wait 00:00:04 for the passenger against Booking # 00000037'),
(00000531, 'Go on ride', '2024-09-11 18:20:59', 'driver', 00000002, 'You go on ride'),
(00000532, 'Job Completed', '2024-09-11 18:21:13', 'driver', 00000002, 'Job # 00000037 Has been Completed.'),
(00000533, 'Status Updated', '2024-09-11 18:22:57', 'driver', 00000002, 'Your Status recently Updated'),
(00000534, 'Booking Updated', '2024-09-11 18:54:24', 'user', 00000001, 'Booking 00000088 Has Been Updated by Controller.'),
(00000535, 'Controller Logged-In', '2024-09-11 18:56:33', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000536, 'Controller Logged-In', '2024-09-11 18:56:34', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000537, 'New Booking', '2024-09-11 18:57:35', 'user', 00000001, 'Controller Has added a new booking 89'),
(00000538, 'Job Dispatched', '2024-09-11 18:58:56', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000539, 'Job Accepted', '2024-09-11 19:01:25', 'driver', 00000002, 'Job 00000039 has been accepted by driver.'),
(00000540, 'Status Updated', '2024-09-11 19:02:03', 'driver', 00000002, 'Your Status recently Updated'),
(00000541, 'Controller Logged-In', '2024-09-11 19:46:55', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000542, 'Status Updated to wtp', '2024-09-11 19:47:48', 'driver', 00000002, 'Your Status recently Updated'),
(00000543, 'Waiting Time for Passeger', '2024-09-11 19:47:57', 'driver', 00000002, 'Driver wait 00:00:03 for the passenger against Booking # 00000039'),
(00000544, 'Go on ride', '2024-09-11 19:47:58', 'driver', 00000002, 'You go on ride'),
(00000545, 'Job Completed', '2024-09-11 19:48:09', 'driver', 00000002, 'Job # 00000039 Has been Completed.'),
(00000546, 'Account Logged In', '2024-09-11 19:48:52', 'driver', 00000002, 'You have logged in to your account.'),
(00000547, 'Controller Logged-In', '2024-09-11 19:50:32', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000548, 'Controller Logged-In', '2024-09-11 20:02:42', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000549, 'Controller Logged-In', '2024-09-11 20:02:43', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000550, 'Controller Logged-In', '2024-09-12 14:33:33', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000551, 'Controller Logged-In', '2024-09-12 14:33:34', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000552, 'Booker Signed-In', '2024-09-12 14:49:32', 'client', 00000001, 'Booker recently logged-In.'),
(00000553, 'Booker Signed-In', '2024-09-12 15:06:21', 'client', 00000001, 'Booker recently logged-In.'),
(00000554, 'Booker Signed-In', '2024-09-12 15:08:04', 'client', 00000001, 'Booker recently logged-In.'),
(00000555, 'Booker Signed-In', '2024-09-12 15:10:03', 'client', 00000001, 'Booker recently logged-In.'),
(00000556, 'Booker Signed-In', '2024-09-12 15:37:55', 'client', 00000001, 'Booker recently logged-In.'),
(00000557, 'Booker Signed-In', '2024-09-12 15:46:45', 'client', 00000001, 'Booker recently logged-In.'),
(00000558, 'Controller Logged-In', '2024-09-12 17:32:48', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000559, 'Account Logged In', '2024-09-12 17:33:01', 'driver', 00000002, 'You have logged in to your account.'),
(00000560, 'Booker Signed-In', '2024-09-12 17:36:14', 'client', 00000002, 'Booker recently logged-In.'),
(00000561, 'New Booking Added', '2024-09-12 17:40:18', 'client', 00000002, 'Booker Has added new Booking # 90.'),
(00000562, 'Controller Logged-In', '2024-09-12 17:49:22', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000563, 'Job Dispatched', '2024-09-12 17:49:52', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000564, 'Job Accepted', '2024-09-12 17:50:05', 'driver', 00000002, 'Job 00000040 has been accepted by driver.'),
(00000565, 'Status Updated to wtp', '2024-09-12 18:18:48', 'driver', 00000002, 'Your Status recently Updated'),
(00000566, 'Status Updated to wtp', '2024-09-12 18:33:10', 'driver', 00000002, 'Your Status recently Updated'),
(00000567, 'Status Updated to wtp', '2024-09-12 18:36:08', 'driver', 00000002, 'Your Status recently Updated'),
(00000568, 'Status Updated to wtp', '2024-09-12 18:36:57', 'driver', 00000002, 'Your Status recently Updated'),
(00000569, 'Status Updated to wtp', '2024-09-12 18:40:59', 'driver', 00000002, 'Your Status recently Updated'),
(00000570, 'Status Updated to wtp', '2024-09-12 18:45:28', 'driver', 00000002, 'Your Status recently Updated'),
(00000571, 'Controller Logged-In', '2024-09-12 18:47:14', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000572, 'Status Updated to wtp', '2024-09-12 18:48:10', 'driver', 00000002, 'Your Status recently Updated'),
(00000573, 'Status Updated to wtp', '2024-09-12 18:49:31', 'driver', 00000002, 'Your Status recently Updated'),
(00000574, 'Status Updated to wtp', '2024-09-12 18:58:02', 'driver', 00000002, 'Your Status recently Updated'),
(00000575, 'Status Updated to POB', '2024-09-12 18:58:17', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000576, 'Status Updated to wtp', '2024-09-12 19:02:24', 'driver', 00000002, 'Your Status recently Updated'),
(00000577, 'Waiting Time for Passeger', '2024-09-12 19:03:06', 'driver', 00000002, 'Driver wait 00:00:30 for the passenger against Booking # 00000040'),
(00000578, 'Go on ride', '2024-09-12 19:03:08', 'driver', 00000002, 'You go on ride'),
(00000579, 'Go on ride', '2024-09-12 19:12:58', 'driver', 00000002, 'You go on ride'),
(00000580, 'Go on ride', '2024-09-12 19:18:42', 'driver', 00000002, 'You go on ride'),
(00000581, 'Job Completed', '2024-09-12 19:19:01', 'driver', 00000002, 'Job # 00000040 Has been Completed.'),
(00000582, 'Status Updated to wtp', '2024-09-12 19:28:11', 'driver', 00000002, 'Your Status recently Updated'),
(00000583, 'Waiting Time for Passeger', '2024-09-12 19:28:17', 'driver', 00000002, 'Driver wait 00:00:02 for the passenger against Booking # 00000029'),
(00000584, 'Go on ride', '2024-09-12 19:28:19', 'driver', 00000002, 'You go on ride'),
(00000585, 'Job Completed', '2024-09-12 19:30:44', 'driver', 00000002, 'Job # 00000029 Has been Completed.'),
(00000586, 'Controller Logged-In', '2024-09-12 19:33:16', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000587, 'Job Dispatched', '2024-09-12 19:33:38', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000588, 'Job Accepted', '2024-09-12 19:33:49', 'driver', 00000002, 'Job 00000041 has been accepted by driver.'),
(00000589, 'Status Updated to wtp', '2024-09-12 19:34:04', 'driver', 00000002, 'Your Status recently Updated'),
(00000590, 'Waiting Time for Passeger', '2024-09-12 19:35:21', 'driver', 00000002, 'Driver wait 00:00:20 for the passenger against Booking # 00000041'),
(00000591, 'Go on ride', '2024-09-12 19:35:23', 'driver', 00000002, 'You go on ride'),
(00000592, 'Job Completed', '2024-09-12 19:38:32', 'driver', 00000002, 'Job # 00000041 Has been Completed.'),
(00000593, 'Job Dispatched', '2024-09-12 19:45:32', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000594, 'Job Accepted', '2024-09-12 19:45:46', 'driver', 00000002, 'Job 00000042 has been accepted by driver.'),
(00000595, 'Status Updated to wtp', '2024-09-12 19:48:37', 'driver', 00000002, 'Your Status recently Updated'),
(00000596, 'Waiting Time for Passeger', '2024-09-12 19:48:48', 'driver', 00000002, 'Driver wait 00:00:02 for the passenger against Booking # 00000042'),
(00000597, 'Go on ride', '2024-09-12 19:48:50', 'driver', 00000002, 'You go on ride'),
(00000598, 'Go on ride', '2024-09-12 19:49:28', 'driver', 00000002, 'You go on ride'),
(00000599, 'Account Logged In', '2024-09-12 19:52:53', 'driver', 00000002, 'You have logged in to your account.'),
(00000600, 'Job Withdrawal', '2024-09-12 19:53:10', 'user', 00000001, 'Job 00000042 has been withdrawn by Controller.'),
(00000601, 'Job Dispatched', '2024-09-12 19:54:26', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000602, 'Job Accepted', '2024-09-12 19:54:34', 'driver', 00000002, 'Job 00000043 has been accepted by driver.'),
(00000603, 'Status Updated', '2024-09-12 19:54:41', 'driver', 00000002, 'Your Status recently Updated'),
(00000604, 'Status Updated to wtp', '2024-09-12 19:54:50', 'driver', 00000002, 'Your Status recently Updated'),
(00000605, 'Status Updated to POB', '2024-09-12 19:54:58', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000606, 'Waiting Time for Passeger', '2024-09-12 19:55:24', 'driver', 00000002, 'Driver wait 00:00:10 for the passenger against Booking # 00000043'),
(00000607, 'Go on ride', '2024-09-12 19:55:25', 'driver', 00000002, 'You go on ride'),
(00000608, 'Job Completed', '2024-09-12 19:55:46', 'driver', 00000002, 'Job # 00000043 Has been Completed.'),
(00000609, 'Account Logged In', '2024-09-12 19:56:54', 'driver', 00000002, 'You have logged in to your account.'),
(00000610, 'Account Logged In', '2024-09-12 19:57:11', 'driver', 00000002, 'You have logged in to your account.'),
(00000611, 'Account Logged In', '2024-09-12 19:57:39', 'driver', 00000002, 'You have logged in to your account.'),
(00000612, 'Account Logged In', '2024-09-12 20:12:51', 'driver', 00000002, 'You have logged in to your account.'),
(00000613, 'Job Dispatched', '2024-09-12 20:15:05', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000614, 'Job Accepted', '2024-09-12 20:15:14', 'driver', 00000002, 'Job 00000044 has been accepted by driver.'),
(00000615, 'Status Updated to wtp', '2024-09-12 20:15:30', 'driver', 00000002, 'Your Status recently Updated'),
(00000616, 'Waiting Time for Passeger', '2024-09-12 20:15:51', 'driver', 00000002, 'Driver wait 00:00:11 for the passenger against Booking # 00000044'),
(00000617, 'Go on ride', '2024-09-12 20:15:53', 'driver', 00000002, 'You go on ride'),
(00000618, 'Job Completed', '2024-09-12 20:16:14', 'driver', 00000002, 'Job # 00000044 Has been Completed.'),
(00000619, 'Account Logged In', '2024-09-12 20:16:31', 'driver', 00000002, 'You have logged in to your account.'),
(00000620, 'Controller Logged-In', '2024-09-13 09:02:00', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000621, 'Controller Logged-In', '2024-09-13 11:41:53', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000622, 'Status Updated to wtp', '2024-09-13 11:45:07', 'driver', 00000001, 'Your Status recently Updated'),
(00000623, 'Waiting Time for Passeger', '2024-09-13 11:45:14', 'driver', 00000001, 'Driver wait 00:00:04 for the passenger against Booking # 00000036'),
(00000624, 'Go on ride', '2024-09-13 11:45:15', 'driver', 00000001, 'You go on ride'),
(00000625, 'Job Completed', '2024-09-13 11:45:26', 'driver', 00000001, 'Job # 00000036 Has been Completed.'),
(00000626, 'Account Logged In', '2024-09-13 11:50:02', 'driver', 00000001, 'You have logged in to your account.'),
(00000627, 'Status Updated', '2024-09-13 11:50:10', 'driver', 00000001, 'Your Status recently Updated'),
(00000628, 'Account Logged In', '2024-09-13 11:51:26', 'driver', 00000001, 'You have logged in to your account.'),
(00000629, 'Status Updated', '2024-09-13 11:51:32', 'driver', 00000001, 'Your Status recently Updated'),
(00000630, 'Status Updated', '2024-09-13 11:51:33', 'driver', 00000001, 'Your Status recently Updated'),
(00000631, 'Bid Placed', '2024-09-13 11:51:41', 'driver', 00000001, 'Bid of Amount 525 has been placed against Booking # 00000061'),
(00000632, 'Bid Placed', '2024-09-13 11:52:03', 'driver', 00000001, 'Bid of Amount 626 has been placed against Booking # 00000061'),
(00000633, 'Status Updated', '2024-09-13 11:52:33', 'driver', 00000001, 'Your Status recently Updated'),
(00000634, 'Status Updated', '2024-09-13 11:52:34', 'driver', 00000001, 'Your Status recently Updated'),
(00000635, 'Status Updated', '2024-09-13 11:52:35', 'driver', 00000001, 'Your Status recently Updated'),
(00000636, 'Status Updated', '2024-09-13 11:54:09', 'driver', 00000001, 'Your Status recently Updated'),
(00000637, 'Status Updated', '2024-09-13 11:56:23', 'driver', 00000001, 'Your Status recently Updated'),
(00000638, 'Status Updated', '2024-09-13 11:56:24', 'driver', 00000001, 'Your Status recently Updated'),
(00000639, 'Status Updated', '2024-09-13 11:56:33', 'driver', 00000001, 'Your Status recently Updated'),
(00000640, 'Booker Signed-In', '2024-09-13 16:05:55', 'client', 00000001, 'Booker recently logged-In.'),
(00000641, 'Booker Signed-In', '2024-09-13 16:07:52', 'client', 00000001, 'Booker recently logged-In.'),
(00000642, 'Booker Signed-In', '2024-09-13 16:10:02', 'client', 00000001, 'Booker recently logged-In.'),
(00000643, 'Controller Logged-In', '2024-09-13 16:16:31', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000644, 'Controller Logged-In', '2024-09-13 16:16:55', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000645, 'Booker Signed-In', '2024-09-13 16:31:21', 'client', 00000001, 'Booker recently logged-In.'),
(00000646, 'Controller Logged-In', '2024-09-13 16:35:14', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000647, 'Booker Signed-In', '2024-09-13 16:38:29', 'client', 00000001, 'Booker recently logged-In.'),
(00000648, 'Status Updated', '2024-09-13 18:08:34', 'driver', 00000001, 'Your Status recently Updated'),
(00000649, 'Controller Logged-In', '2024-09-13 18:08:41', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000650, 'New Booking', '2024-09-13 18:09:24', 'user', 00000001, 'Controller Has added a new booking 91'),
(00000651, 'Job Dispatched', '2024-09-13 18:09:31', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000652, 'Job Accepted', '2024-09-13 18:09:38', 'driver', 00000001, 'Job 00000045 has been accepted by driver.'),
(00000653, 'Status Updated to wtp', '2024-09-13 18:09:44', 'driver', 00000001, 'Your Status recently Updated'),
(00000654, 'Waiting Time for Passeger', '2024-09-13 18:09:46', 'driver', 00000001, 'Driver wait 00:00:01 for the passenger against Booking # 00000045'),
(00000655, 'Go on ride', '2024-09-13 18:09:47', 'driver', 00000001, 'You go on ride'),
(00000656, 'Job Completed', '2024-09-13 18:09:53', 'driver', 00000001, 'Job # 00000045 Has been Completed.'),
(00000657, 'Status Updated', '2024-09-13 18:10:00', 'driver', 00000001, 'Your Status recently Updated'),
(00000658, 'Status Updated', '2024-09-14 02:12:01', 'driver', 00000001, 'Your Status recently Updated'),
(00000659, 'Status Updated', '2024-09-14 02:12:05', 'driver', 00000001, 'Your Status recently Updated'),
(00000660, 'Status Updated', '2024-09-14 02:13:02', 'driver', 00000001, 'Your Status recently Updated'),
(00000661, 'Status Updated', '2024-09-14 02:13:09', 'driver', 00000001, 'Your Status recently Updated'),
(00000662, 'Status Updated', '2024-09-14 02:13:17', 'driver', 00000001, 'Your Status recently Updated'),
(00000663, 'Account Logged In', '2024-09-14 02:13:19', 'driver', 00000001, 'You have logged in to your account.'),
(00000664, 'Status Updated', '2024-09-14 02:13:22', 'driver', 00000001, 'Your Status recently Updated'),
(00000665, 'Status Updated', '2024-09-14 02:13:24', 'driver', 00000001, 'Your Status recently Updated'),
(00000666, 'Status Updated', '2024-09-14 02:13:24', 'driver', 00000001, 'Your Status recently Updated'),
(00000667, 'Status Updated', '2024-09-14 02:13:29', 'driver', 00000001, 'Your Status recently Updated'),
(00000668, 'Booker Signed-In', '2024-09-14 06:35:07', 'client', 00000001, 'Booker recently logged-In.'),
(00000669, 'Booker Signed-In', '2024-09-14 06:37:16', 'client', 00000001, 'Booker recently logged-In.'),
(00000670, 'Controller Logged-In', '2024-09-14 06:43:18', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000671, 'Booker Signed-In', '2024-09-14 06:46:18', 'client', 00000001, 'Booker recently logged-In.'),
(00000672, 'Booker Signed-In', '2024-09-14 07:22:36', 'client', 00000001, 'Booker recently logged-In.'),
(00000673, 'Booker Signed-In', '2024-09-14 07:42:49', 'client', 00000001, 'Booker recently logged-In.'),
(00000674, 'Controller Logged-In', '2024-09-14 07:46:30', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000675, 'Booker Signed-In', '2024-09-14 08:14:36', 'client', 00000001, 'Booker recently logged-In.'),
(00000676, 'Controller Logged-In', '2024-09-14 08:14:49', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000677, 'Account Logged In', '2024-09-14 08:15:20', 'driver', 00000002, 'You have logged in to your account.'),
(00000678, 'Status Updated', '2024-09-14 08:16:58', 'driver', 00000002, 'Your Status recently Updated'),
(00000679, 'Booker Signed-In', '2024-09-14 08:18:18', 'client', 00000001, 'Booker recently logged-In.'),
(00000680, 'Booker Signed-In', '2024-09-14 08:21:54', 'client', 00000001, 'Booker recently logged-In.'),
(00000681, 'Job Dispatched', '2024-09-14 08:26:41', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000682, 'Job Accepted', '2024-09-14 08:26:54', 'driver', 00000002, 'Job 00000046 has been accepted by driver.'),
(00000683, 'Status Updated to wtp', '2024-09-14 08:27:54', 'driver', 00000002, 'Your Status recently Updated'),
(00000684, 'Status Updated to POB', '2024-09-14 08:30:29', 'driver', 00000002, 'Your Status POB recently Updated'),
(00000685, 'Waiting Time for Passeger', '2024-09-14 08:30:34', 'driver', 00000002, 'Driver wait 00:00:02 for the passenger against Booking # 00000046'),
(00000686, 'Go on ride', '2024-09-14 08:30:36', 'driver', 00000002, 'You go on ride'),
(00000687, 'Job Completed', '2024-09-14 08:30:52', 'driver', 00000002, 'Job # 00000046 Has been Completed.'),
(00000688, 'Account Logged In', '2024-09-14 08:31:52', 'driver', 00000002, 'You have logged in to your account.'),
(00000689, 'Break Time Started', '2024-09-14 08:31:54', 'driver', 00000002, 'You go to break time.'),
(00000690, 'Break Time Ends', '2024-09-14 08:32:32', 'driver', 00000002, 'Break Time Ends and back to online'),
(00000691, 'Booker Signed-In', '2024-09-14 08:38:26', 'client', 00000001, 'Booker recently logged-In.'),
(00000692, 'Booker Signed-In', '2024-09-14 09:06:30', 'client', 00000001, 'Booker recently logged-In.'),
(00000693, 'Booker Signed-In', '2024-09-14 09:14:06', 'client', 00000001, 'Booker recently logged-In.'),
(00000694, 'Controller Logged-In', '2024-09-14 09:22:16', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000695, 'Controller Logged-In', '2024-09-14 16:23:04', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000696, 'Controller Logged-In', '2024-09-14 18:13:34', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000697, 'Account Logged In', '2024-09-14 18:24:53', 'driver', 00000001, 'You have logged in to your account.'),
(00000698, 'Account Logged In', '2024-09-14 18:25:30', 'driver', 00000001, 'You have logged in to your account.'),
(00000699, 'Account Logged In', '2024-09-14 18:25:33', 'driver', 00000001, 'You have logged in to your account.'),
(00000700, 'Account Logged In', '2024-09-14 18:27:35', 'driver', 00000001, 'You have logged in to your account.'),
(00000701, 'Account Logged In', '2024-09-14 18:28:07', 'driver', 00000001, 'You have logged in to your account.'),
(00000702, 'Status Updated', '2024-09-14 18:28:12', 'driver', 00000001, 'Your Status recently Updated'),
(00000703, 'Account Logged In', '2024-09-14 18:34:48', 'driver', 00000001, 'You have logged in to your account.'),
(00000704, 'Account Logged In', '2024-09-14 18:38:56', 'driver', 00000001, 'You have logged in to your account.'),
(00000705, 'Account Logged In', '2024-09-14 18:56:05', 'driver', 00000001, 'You have logged in to your account.'),
(00000706, 'Account Logged In', '2024-09-14 18:56:23', 'driver', 00000001, 'You have logged in to your account.'),
(00000707, 'Account Logged In', '2024-09-14 18:56:31', 'driver', 00000001, 'You have logged in to your account.'),
(00000708, 'Controller Logged-In', '2024-09-14 18:57:32', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000709, 'Job Withdrawal', '2024-09-14 18:57:52', 'user', 00000001, 'Job 00000002 has been withdrawn by Controller.'),
(00000710, 'Job Dispatched', '2024-09-14 19:00:01', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000711, 'Job Dispatched', '2024-09-14 19:00:03', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000712, 'Job Withdrawal', '2024-09-14 19:00:26', 'user', 00000001, 'Job 00000047 has been withdrawn by Controller.'),
(00000713, 'Job Withdrawal', '2024-09-14 19:01:27', 'user', 00000001, 'Job 00000048 has been withdrawn by Controller.'),
(00000714, 'Status Updated', '2024-09-14 19:17:01', 'driver', 00000001, 'Your Status recently Updated'),
(00000715, 'Status Updated', '2024-09-14 19:17:03', 'driver', 00000001, 'Your Status recently Updated'),
(00000716, 'Account Logged In', '2024-09-14 19:17:12', 'driver', 00000001, 'You have logged in to your account.'),
(00000717, 'Time Slot Added', '2024-09-14 19:22:03', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000718, 'Time slot Accepted', '2024-09-14 19:22:39', 'driver', 00000001, 'Accept Time slot.'),
(00000719, 'Controller Logged-In', '2024-09-14 19:38:10', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000720, 'Account Logged In', '2024-09-14 19:53:33', 'driver', 00000001, 'You have logged in to your account.'),
(00000721, 'Bid Placed', '2024-09-14 19:54:20', 'driver', 00000001, 'Bid of Amount 55 has been placed against Booking # 00000061'),
(00000722, 'Status Updated', '2024-09-15 14:42:51', 'driver', 00000001, 'Your Status recently Updated'),
(00000723, 'Status Updated', '2024-09-15 14:42:56', 'driver', 00000001, 'Your Status recently Updated'),
(00000724, 'Status Updated', '2024-09-15 14:43:07', 'driver', 00000001, 'Your Status recently Updated'),
(00000725, 'Status Updated', '2024-09-15 14:43:13', 'driver', 00000001, 'Your Status recently Updated'),
(00000726, 'Status Updated', '2024-09-15 14:43:51', 'driver', 00000001, 'Your Status recently Updated'),
(00000727, 'Status Updated', '2024-09-15 14:43:57', 'driver', 00000001, 'Your Status recently Updated'),
(00000728, 'Status Updated', '2024-09-15 14:43:59', 'driver', 00000001, 'Your Status recently Updated'),
(00000729, 'Status Updated', '2024-09-15 14:43:59', 'driver', 00000001, 'Your Status recently Updated'),
(00000730, 'Status Updated', '2024-09-15 14:44:00', 'driver', 00000001, 'Your Status recently Updated'),
(00000731, 'Status Updated', '2024-09-15 14:44:01', 'driver', 00000001, 'Your Status recently Updated'),
(00000732, 'Status Updated', '2024-09-15 14:44:04', 'driver', 00000001, 'Your Status recently Updated'),
(00000733, 'Status Updated', '2024-09-15 14:44:05', 'driver', 00000001, 'Your Status recently Updated'),
(00000734, 'Controller Logged-In', '2024-09-17 21:32:44', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000735, 'New Booking', '2024-09-17 21:34:52', 'user', 00000001, 'Controller Has added a new booking 92'),
(00000736, 'Account Logged In', '2024-09-17 21:35:21', 'driver', 00000001, 'You have logged in to your account.'),
(00000737, 'Status Updated', '2024-09-17 21:35:31', 'driver', 00000001, 'Your Status recently Updated'),
(00000738, 'Job Dispatched', '2024-09-17 21:35:38', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000739, 'Job Accepted', '2024-09-17 21:35:46', 'driver', 00000001, 'Job 00000049 has been accepted by driver.'),
(00000740, 'Status Updated to wtp', '2024-09-17 21:35:56', 'driver', 00000001, 'Your Status recently Updated'),
(00000741, 'Status Updated to POB', '2024-09-17 21:36:07', 'driver', 00000001, 'Your Status POB recently Updated'),
(00000742, 'Waiting Time for Passeger', '2024-09-17 21:36:33', 'driver', 00000001, 'Driver wait 00:00:03 for the passenger against Booking # 00000049'),
(00000743, 'Go on ride', '2024-09-17 21:36:34', 'driver', 00000001, 'You go on ride'),
(00000744, 'Job Completed', '2024-09-17 21:36:46', 'driver', 00000001, 'Job # 00000049 Has been Completed.'),
(00000745, 'Account Logged In', '2024-09-17 21:37:06', 'driver', 00000001, 'You have logged in to your account.'),
(00000746, 'Account Logged In', '2024-09-17 21:37:18', 'driver', 00000001, 'You have logged in to your account.'),
(00000747, 'Account Logged In', '2024-09-19 15:26:16', 'driver', 00000002, 'You have logged in to your account.'),
(00000748, 'Controller Logged-In', '2024-09-19 15:33:46', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000749, 'Bid Accepted', '2024-09-19 15:34:26', 'user', 00000001, 'Bid From Driver Atiq Ramzan Has Been Accepted by Controller.'),
(00000750, 'Controller Logged-In', '2024-09-20 14:44:26', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000751, 'Account Logged In', '2024-09-20 14:51:27', 'driver', 00000002, 'You have logged in to your account.'),
(00000752, 'Controller Logged-In', '2024-09-20 14:52:30', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000753, 'Job Dispatched', '2024-09-20 14:55:44', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000754, 'Job Accepted', '2024-09-20 14:55:57', 'driver', 00000002, 'Job 00000050 has been accepted by driver.'),
(00000755, 'Account Logged In', '2024-09-20 15:05:51', 'driver', 00000002, 'You have logged in to your account.'),
(00000756, 'Account Logged In', '2024-09-20 15:07:12', 'driver', 00000002, 'You have logged in to your account.'),
(00000757, 'Account Logged In', '2024-09-20 16:00:14', 'driver', 00000002, 'You have logged in to your account.'),
(00000758, 'Account Logged In', '2024-09-21 07:52:43', 'driver', 00000002, 'You have logged in to your account.'),
(00000759, 'Account Logged In', '2024-09-21 07:52:43', 'driver', 00000002, 'You have logged in to your account.'),
(00000760, 'Account Logged In', '2024-09-22 12:13:17', 'driver', 00000002, 'You have logged in to your account.'),
(00000761, 'Controller Logged-In', '2024-09-22 12:33:54', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000762, 'Account Logged In', '2024-09-22 12:40:30', 'driver', 00000002, 'You have logged in to your account.'),
(00000763, 'Account Logged In', '2024-09-22 12:43:46', 'driver', 00000002, 'You have logged in to your account.'),
(00000764, 'Booking Opens for Bid', '2024-09-22 12:56:23', 'user', 00000001, 'Controller has opened a bid for booking 00000052'),
(00000765, 'Controller Logged-In', '2024-09-22 13:40:51', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000766, 'Account Logged In', '2024-09-23 15:07:08', 'driver', 00000002, 'You have logged in to your account.'),
(00000767, 'Controller Logged-In', '2024-09-23 15:18:01', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000768, 'Job Dispatched', '2024-09-23 15:19:45', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000769, 'Job Accepted', '2024-09-23 15:30:54', 'driver', 00000002, 'Job 00000051 has been accepted by driver.'),
(00000770, 'Controller Logged-In', '2024-09-24 18:29:22', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000771, 'Job Dispatched', '2024-09-24 18:29:41', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000772, 'Controller Logged-In', '2024-09-26 09:20:36', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000773, 'Booking Cancelled', '2024-09-26 09:34:12', 'user', 00000001, 'Booking ID: 00000092 Has been Cancelled by Controller.'),
(00000774, 'Booking Cancelled', '2024-09-26 09:36:17', 'user', 00000001, 'Booking ID: 92 Has been Cancelled by Controller.'),
(00000775, 'Booking Updated', '2024-09-26 09:37:37', 'user', 00000001, 'Booking 00000092 Has Been Updated by Controller.'),
(00000776, 'Account Logged In', '2024-09-26 18:33:09', 'driver', 00000002, 'You have logged in to your account.'),
(00000777, 'Status Updated', '2024-09-26 18:45:20', 'driver', 00000002, 'Your Status recently Updated'),
(00000778, 'Status Updated', '2024-09-26 18:45:20', 'driver', 00000002, 'Your Status recently Updated'),
(00000779, 'Controller Logged-In', '2024-09-26 19:22:06', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000780, 'Controller Logged-In', '2024-09-26 19:22:06', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000781, 'Job Accepted', '2024-09-26 19:53:11', 'driver', 00000002, 'Job 00000052 has been accepted by driver.'),
(00000782, 'New Booking', '2024-09-26 19:56:39', 'user', 00000001, 'Controller Has added a new booking 93'),
(00000783, 'Job Dispatched', '2024-09-26 19:56:56', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000784, 'Controller Logged-In', '2024-09-26 20:24:48', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000785, 'Controller Logged-In', '2024-09-28 07:00:44', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000786, 'Account Logged In', '2024-09-29 15:07:29', 'driver', 00000002, 'You have logged in to your account.'),
(00000787, 'Job Accepted', '2024-09-29 15:08:28', 'driver', 00000002, 'Job 00000053 has been accepted by driver.'),
(00000788, 'Controller Logged-In', '2024-09-29 15:09:06', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000789, 'Controller Logged-In', '2024-09-29 15:09:56', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000790, 'Job Dispatched', '2024-09-29 15:29:23', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000791, 'Time slot Accepted', '2024-09-29 15:54:00', 'driver', 00000002, 'Accept Time slot.'),
(00000792, 'Time slot Rejected', '2024-09-29 15:55:13', 'driver', 00000001, 'Reject Time slot.'),
(00000793, 'Time slot Rejected', '2024-09-29 15:56:56', 'driver', 00000002, 'Reject Time slot.'),
(00000794, 'Job Accepted', '2024-09-29 16:39:30', 'driver', 00000002, 'Job 00000054 has been accepted by driver.'),
(00000795, 'Controller Logged-In', '2024-09-29 16:47:04', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000796, 'Controller Logged-In', '2024-09-29 16:56:07', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000797, 'Time Slot Added', '2024-09-29 17:01:16', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000798, 'Time slot Rejected', '2024-09-29 17:50:30', 'driver', 00000002, 'Reject Time slot.'),
(00000799, 'Time slot Rejected', '2024-09-29 17:50:33', 'driver', 00000002, 'Reject Time slot.'),
(00000800, 'Time slot Rejected', '2024-09-29 17:50:47', 'driver', 00000002, 'Reject Time slot.'),
(00000801, 'Time slot Rejected', '2024-09-29 17:50:55', 'driver', 00000002, 'Reject Time slot.'),
(00000802, 'Controller Logged-In', '2024-09-29 17:57:21', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000803, 'Time Slot Added', '2024-09-29 18:05:44', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000804, 'Time Slot Added', '2024-09-29 18:06:17', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000805, 'Controller Logged-In', '2024-09-29 18:08:51', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000806, 'Time slot Accepted', '2024-09-29 18:09:49', 'driver', 00000002, 'Accept Time slot.'),
(00000807, 'Time Slot Added', '2024-09-29 18:41:49', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000808, 'Time slot Accepted', '2024-09-29 18:43:18', 'driver', 00000002, 'Accept Time slot.'),
(00000809, 'Time Slot Added', '2024-09-29 18:47:49', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000810, 'Time slot Accepted', '2024-09-29 18:48:18', 'driver', 00000002, 'Accept Time slot.'),
(00000811, 'Time Slot Added', '2024-09-29 18:51:45', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000812, 'Time slot Accepted', '2024-09-29 18:52:11', 'driver', 00000002, 'Accept Time slot.'),
(00000813, 'Time slot Completed', '2024-09-29 19:05:48', 'driver', 00000002, 'Complete Time slot.'),
(00000814, 'Time slot Completed', '2024-09-29 19:05:54', 'driver', 00000002, 'Complete Time slot.'),
(00000815, 'Controller Logged-In', '2024-09-29 19:16:38', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000816, 'Controller Logged-In', '2024-09-29 20:01:12', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000817, 'Time Slot Added', '2024-09-29 20:01:59', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000818, 'Time slot Accepted', '2024-09-29 20:02:17', 'driver', 00000002, 'Accept Time slot.'),
(00000819, 'Controller Logged-In', '2024-09-29 20:03:19', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000820, 'Time slot Completed', '2024-09-29 20:04:01', 'driver', 00000002, 'Complete Time slot.'),
(00000821, 'Time Slot Added', '2024-09-29 20:04:35', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000822, 'Time slot Accepted', '2024-09-29 20:05:05', 'driver', 00000002, 'Accept Time slot.'),
(00000823, 'Time Slot Withdrawn', '2024-09-29 20:05:14', 'user', 00000001, 'Time Slot Has Been Withdrawn by Controller.'),
(00000824, 'Time Slot Withdrawn', '2024-09-29 20:05:25', 'user', 00000001, 'Time Slot Has Been Withdrawn by Controller.'),
(00000825, 'Time Slot Withdrawn', '2024-09-29 20:06:17', 'user', 00000001, 'Time Slot Has Been Withdrawn by Controller.'),
(00000826, 'Time slot Completed', '2024-09-29 20:07:02', 'driver', 00000002, 'Complete Time slot.'),
(00000827, 'Time Slot Withdrawn', '2024-09-29 20:08:05', 'user', 00000001, 'Time Slot Has Been Withdrawn by Controller.'),
(00000828, 'Time Slot Added', '2024-09-29 20:08:46', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000829, 'Time slot Accepted', '2024-09-29 20:08:59', 'driver', 00000002, 'Accept Time slot.'),
(00000830, 'Time Slot Withdrawn', '2024-09-29 20:09:16', 'user', 00000001, 'Time Slot Has Been Withdrawn by Controller.'),
(00000831, 'Time slot Completed', '2024-09-29 20:11:02', 'driver', 00000002, 'Complete Time slot.'),
(00000832, 'Time Slot Added', '2024-09-29 20:12:28', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000833, 'Time slot Accepted', '2024-09-29 20:13:00', 'driver', 00000002, 'Accept Time slot.'),
(00000834, 'Time Slot Withdrawn', '2024-09-29 20:13:20', 'user', 00000001, 'Time Slot Has Been Withdrawn by Controller.'),
(00000835, 'Time slot Completed', '2024-09-29 20:15:02', 'driver', 00000002, 'Complete Time slot.'),
(00000836, 'Controller Logged-In', '2024-09-29 20:16:46', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000837, 'Time Slot Added', '2024-09-29 20:18:23', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000838, 'Time slot Accepted', '2024-09-29 20:18:34', 'driver', 00000002, 'Accept Time slot.'),
(00000839, 'Time Slot Withdrawn', '2024-09-29 20:18:42', 'user', 00000001, 'Time Slot Has Been Withdrawn by Controller.'),
(00000840, 'Account Logged In', '2024-09-30 09:32:28', 'driver', 00000002, 'You have logged in to your account.'),
(00000841, 'Controller Logged-In', '2024-09-30 12:32:43', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000842, 'Time slot Accepted', '2024-09-30 12:33:35', 'driver', 00000002, 'Accept Time slot.'),
(00000843, 'Time slot Accepted', '2024-09-30 12:33:41', 'driver', 00000002, 'Accept Time slot.'),
(00000844, 'Status Updated', '2024-09-30 12:34:03', 'driver', 00000002, 'Your Status recently Updated'),
(00000845, 'Controller Logged-In', '2024-09-30 13:09:33', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000846, 'Controller Logged-In', '2024-09-30 14:12:40', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000847, 'Controller Logged-In', '2024-09-30 17:01:06', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000848, 'Account Logged In', '2024-09-30 17:08:34', 'driver', 00000002, 'You have logged in to your account.'),
(00000849, 'Time Slot Added', '2024-09-30 17:09:39', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000850, 'Time slot Rejected', '2024-09-30 17:10:40', 'driver', 00000002, 'Reject Time slot.'),
(00000851, 'Time Slot Added', '2024-09-30 17:11:06', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000852, 'Time Slot Added', '2024-09-30 17:28:44', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000853, 'Time slot Accepted', '2024-09-30 17:28:57', 'driver', 00000002, 'Accept Time slot.'),
(00000854, 'Time slot Accepted', '2024-09-30 17:29:33', 'driver', 00000002, 'Accept Time slot.'),
(00000855, 'Time slot Completed', '2024-09-30 17:31:01', 'driver', 00000002, 'Complete Time slot.'),
(00000856, 'Time slot Completed', '2024-09-30 17:31:02', 'driver', 00000002, 'Complete Time slot.'),
(00000857, 'Time Slot Added', '2024-09-30 17:39:40', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000858, 'Time Slot Added', '2024-09-30 17:44:42', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000859, 'Time slot Accepted', '2024-09-30 17:44:54', 'driver', 00000002, 'Accept Time slot.'),
(00000860, 'Time slot Completed', '2024-09-30 17:47:02', 'driver', 00000002, 'Complete Time slot.'),
(00000861, 'Time Slot Added', '2024-09-30 17:47:32', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000862, 'Time slot Accepted', '2024-09-30 17:51:16', 'driver', 00000002, 'Accept Time slot.'),
(00000863, 'Time slot Rejected', '2024-09-30 17:51:29', 'driver', 00000002, 'Reject Time slot.'),
(00000864, 'Time Slot Added', '2024-09-30 17:51:50', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000865, 'Time slot Accepted', '2024-09-30 17:52:04', 'driver', 00000002, 'Accept Time slot.'),
(00000866, 'Time slot Completed', '2024-09-30 17:54:02', 'driver', 00000002, 'Complete Time slot.'),
(00000867, 'Time Slot Added', '2024-09-30 17:55:24', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000868, 'Time slot Accepted', '2024-09-30 17:55:39', 'driver', 00000002, 'Accept Time slot.'),
(00000869, 'Time slot Completed', '2024-09-30 17:58:02', 'driver', 00000002, 'Complete Time slot.'),
(00000870, 'Account Logged In', '2024-10-01 18:13:46', 'driver', 00000002, 'You have logged in to your account.'),
(00000871, 'Account Logged In', '2024-10-01 18:14:02', 'driver', 00000002, 'You have logged in to your account.'),
(00000872, 'Controller Logged-In', '2024-10-02 15:56:36', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000873, 'New Driver Added', '2024-10-02 15:59:04', 'user', 00000004, 'New Driver Wajeeh uddin Has been Added by Controller.'),
(00000874, 'Controller Logged-In', '2024-10-02 17:27:21', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000875, 'Booking Opens for Bid', '2024-10-02 17:33:22', 'user', 00000001, 'Controller has opened a bid for booking 00000093'),
(00000876, 'Controller Logged-In', '2024-10-07 10:22:10', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000877, 'Controller Logged-In', '2024-10-08 18:16:20', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000878, 'Account Logged In', '2024-10-09 08:45:32', 'driver', 00000002, 'You have logged in to your account.'),
(00000879, 'Controller Logged-In', '2024-10-09 08:46:07', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000880, 'Time Slot Added', '2024-10-09 08:46:44', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000881, 'Time slot Rejected', '2024-10-09 08:47:01', 'driver', 00000002, 'Reject Time slot.'),
(00000882, 'Time slot Accepted', '2024-10-09 08:47:21', 'driver', 00000002, 'Accept Time slot.'),
(00000883, 'Job Dispatched', '2024-10-09 08:49:55', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000884, 'Job Accepted', '2024-10-09 08:50:04', 'driver', 00000002, 'Job 00000055 has been accepted by driver.'),
(00000885, 'Controller Logged-In', '2024-10-09 12:16:37', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000886, 'Special Date Deleted', '2024-10-09 12:16:58', 'user', 00000001, 'Special Date Has Been Deleted by Controller.'),
(00000887, 'Special Date Deleted', '2024-10-09 12:16:58', 'user', 00000001, 'Special Date Has Been Deleted by Controller.'),
(00000888, 'Account Logged In', '2024-10-09 13:20:06', 'driver', 00000002, 'You have logged in to your account.'),
(00000889, 'Status Updated', '2024-10-09 13:20:33', 'driver', 00000002, 'Your Status recently Updated');
INSERT INTO `activity_log` (`log_id`, `activity_type`, `timestamp`, `user_type`, `user_id`, `details`) VALUES
(00000890, 'Controller Logged-In', '2024-10-09 16:54:53', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000891, 'Account Logged In', '2024-10-09 17:04:04', 'driver', 00000002, 'You have logged in to your account.'),
(00000892, 'Time Slot Added', '2024-10-09 17:27:07', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000893, 'Controller Logged-In', '2024-10-09 17:58:35', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000894, 'Time Slot Added', '2024-10-09 17:59:08', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000895, 'Time slot Accepted', '2024-10-09 17:59:21', 'driver', 00000002, 'Accept Time slot.'),
(00000896, 'Time Slot Added', '2024-10-09 18:06:48', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000897, 'Time slot Accepted', '2024-10-09 18:07:04', 'driver', 00000002, 'Accept Time slot.'),
(00000898, 'Time slot Completed', '2024-10-09 18:17:40', 'driver', 00000002, 'Complete Time slot.'),
(00000899, 'Time slot Completed', '2024-10-09 18:19:26', 'driver', 00000002, 'Complete Time slot.'),
(00000900, 'Time slot Completed', '2024-10-09 18:19:27', 'driver', 00000002, 'Complete Time slot.'),
(00000901, 'Time slot Completed', '2024-10-09 18:21:51', 'driver', 00000002, 'Complete Time slot.'),
(00000902, 'Time slot Completed', '2024-10-09 18:21:53', 'driver', 00000002, 'Complete Time slot.'),
(00000903, 'Time slot Completed', '2024-10-09 18:28:29', 'driver', 00000002, 'Complete Time slot.'),
(00000904, 'Time slot Completed', '2024-10-09 18:28:32', 'driver', 00000002, 'Complete Time slot.'),
(00000905, 'Time Slot Added', '2024-10-09 18:32:26', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000906, 'Time slot Completed', '2024-10-09 18:32:43', 'driver', 00000002, 'Complete Time slot.'),
(00000907, 'Time slot Completed', '2024-10-09 18:32:45', 'driver', 00000002, 'Complete Time slot.'),
(00000908, 'Time slot Accepted', '2024-10-09 18:32:55', 'driver', 00000002, 'Accept Time slot.'),
(00000909, 'Time slot Completed', '2024-10-09 18:38:40', 'driver', 00000002, 'Complete Time slot.'),
(00000910, 'Time slot Completed', '2024-10-09 18:38:45', 'driver', 00000002, 'Complete Time slot.'),
(00000911, 'Time slot Completed', '2024-10-09 18:46:39', 'driver', 00000002, 'Complete Time slot.'),
(00000912, 'Time Slot Added', '2024-10-09 18:47:13', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000913, 'Time slot Accepted', '2024-10-09 18:47:23', 'driver', 00000002, 'Accept Time slot.'),
(00000914, 'Time slot Completed', '2024-10-09 18:54:19', 'driver', 00000002, 'Complete Time slot.'),
(00000915, 'Time slot Completed', '2024-10-09 18:55:03', 'driver', 00000002, 'Complete Time slot.'),
(00000916, 'Time Slot Added', '2024-10-09 18:55:25', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000917, 'Time slot Accepted', '2024-10-09 18:55:43', 'driver', 00000002, 'Accept Time slot.'),
(00000918, 'Time slot Completed', '2024-10-09 18:58:01', 'driver', 00000002, 'Complete Time slot.'),
(00000919, 'Time Slot Added', '2024-10-09 19:05:38', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000920, 'Time slot Accepted', '2024-10-09 19:05:46', 'driver', 00000002, 'Accept Time slot.'),
(00000921, 'Time slot Completed', '2024-10-09 19:07:01', 'driver', 00000002, 'Complete Time slot.'),
(00000922, 'Time slot Completed', '2024-10-09 19:11:02', 'driver', 00000002, 'Complete Time slot.'),
(00000923, 'Time slot Completed', '2024-10-09 19:16:20', 'driver', 00000002, 'Complete Time slot.'),
(00000924, 'Time slot Completed', '2024-10-09 19:19:08', 'driver', 00000002, 'Complete Time slot.'),
(00000925, 'Time Slot Added', '2024-10-09 19:19:47', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000926, 'Time slot Accepted', '2024-10-09 19:19:57', 'driver', 00000002, 'Accept Time slot.'),
(00000927, 'Time slot Completed', '2024-10-09 19:22:01', 'driver', 00000002, 'Complete Time slot.'),
(00000928, 'Time slot Completed', '2024-10-09 19:24:47', 'driver', 00000002, 'Complete Time slot.'),
(00000929, 'Time Slot Added', '2024-10-09 19:24:49', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000930, 'Time slot Completed', '2024-10-09 19:26:09', 'driver', 00000002, 'Complete Time slot.'),
(00000931, 'Time slot Completed', '2024-10-09 19:28:34', 'driver', 00000002, 'Complete Time slot.'),
(00000932, 'Time Slot Added', '2024-10-09 19:29:06', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000933, 'Time Slot Added', '2024-10-09 19:29:18', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000934, 'Time slot Accepted', '2024-10-09 19:29:29', 'driver', 00000002, 'Accept Time slot.'),
(00000935, 'Time slot Completed', '2024-10-09 19:32:01', 'driver', 00000002, 'Complete Time slot.'),
(00000936, 'Time slot Completed', '2024-10-09 19:48:10', 'driver', 00000002, 'Complete Time slot.'),
(00000937, 'Time Slot Added', '2024-10-09 19:48:33', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000938, 'Time slot Accepted', '2024-10-09 19:48:44', 'driver', 00000002, 'Accept Time slot.'),
(00000939, 'Time slot Completed', '2024-10-09 19:53:00', 'driver', 00000002, 'Complete Time slot.'),
(00000940, 'Time Slot Added', '2024-10-09 19:53:24', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000941, 'Time slot Accepted', '2024-10-09 19:53:37', 'driver', 00000002, 'Accept Time slot.'),
(00000942, 'Time Slot Added', '2024-10-09 19:54:35', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000943, 'Time slot Accepted', '2024-10-09 19:55:12', 'driver', 00000002, 'Accept Time slot.'),
(00000944, 'Time slot Completed', '2024-10-09 19:56:01', 'driver', 00000002, 'Complete Time slot.'),
(00000945, 'Time slot Completed', '2024-10-09 19:57:01', 'driver', 00000002, 'Complete Time slot.'),
(00000946, 'Time slot Completed', '2024-10-09 19:57:36', 'driver', 00000002, 'Complete Time slot.'),
(00000947, 'Time slot Completed', '2024-10-09 19:58:30', 'driver', 00000002, 'Complete Time slot.'),
(00000948, 'Time Slot Added', '2024-10-09 19:59:16', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000949, 'Time slot Accepted', '2024-10-09 19:59:28', 'driver', 00000002, 'Accept Time slot.'),
(00000950, 'Time slot Completed', '2024-10-09 20:02:01', 'driver', 00000002, 'Complete Time slot.'),
(00000951, 'Time slot Completed', '2024-10-09 20:02:01', 'driver', 00000002, 'Complete Time slot.'),
(00000952, 'Time slot Completed', '2024-10-09 20:05:14', 'driver', 00000002, 'Complete Time slot.'),
(00000953, 'Time Slot Added', '2024-10-09 20:16:19', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000954, 'Time slot Accepted', '2024-10-09 20:16:32', 'driver', 00000002, 'Accept Time slot.'),
(00000955, 'Time slot Completed', '2024-10-09 20:19:02', 'driver', 00000002, 'Complete Time slot.'),
(00000956, 'Time Slot Added', '2024-10-09 20:28:56', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000957, 'Time slot Accepted', '2024-10-09 20:29:11', 'driver', 00000002, 'Accept Time slot.'),
(00000958, 'Time slot Completed', '2024-10-09 20:31:01', 'driver', 00000002, 'Complete Time slot.'),
(00000959, 'Time slot Completed', '2024-10-09 20:31:01', 'driver', 00000002, 'Complete Time slot.'),
(00000960, 'Time Slot Added', '2024-10-09 20:32:39', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000961, 'Time slot Accepted', '2024-10-09 20:33:27', 'driver', 00000002, 'Accept Time slot.'),
(00000962, 'Time slot Completed', '2024-10-09 20:35:01', 'driver', 00000002, 'Complete Time slot.'),
(00000963, 'Time slot Completed', '2024-10-09 20:35:02', 'driver', 00000002, 'Complete Time slot.'),
(00000964, 'Time Slot Added', '2024-10-09 20:38:31', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000965, 'Time slot Accepted', '2024-10-09 20:38:43', 'driver', 00000002, 'Accept Time slot.'),
(00000966, 'Time slot Completed', '2024-10-09 20:41:01', 'driver', 00000002, 'Complete Time slot.'),
(00000967, 'Time slot Accepted', '2024-10-09 20:44:42', 'driver', 00000002, 'Accept Time slot.'),
(00000968, 'Controller Logged-In', '2024-10-10 15:34:19', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00000969, 'Time slot Accepted', '2024-10-10 15:36:31', 'driver', 00000002, 'Accept Time slot.'),
(00000970, 'Time slot Completed', '2024-10-10 15:38:57', 'driver', 00000002, 'Complete Time slot.'),
(00000971, 'Time slot Completed', '2024-10-10 15:41:40', 'driver', 00000002, 'Complete Time slot.'),
(00000972, 'Time Slot Added', '2024-10-10 15:45:32', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000973, 'Time slot Accepted', '2024-10-10 15:45:52', 'driver', 00000002, 'Accept Time slot.'),
(00000974, 'Time slot Completed', '2024-10-10 15:48:02', 'driver', 00000002, 'Complete Time slot.'),
(00000975, 'Time Slot Added', '2024-10-10 16:13:34', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000976, 'Time slot Accepted', '2024-10-10 16:13:47', 'driver', 00000002, 'Accept Time slot.'),
(00000977, 'Time slot Completed', '2024-10-10 16:16:01', 'driver', 00000002, 'Complete Time slot.'),
(00000978, 'Time Slot Added', '2024-10-10 16:29:11', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000979, 'Time slot Accepted', '2024-10-10 16:29:21', 'driver', 00000002, 'Accept Time slot.'),
(00000980, 'Time slot Completed', '2024-10-10 16:31:01', 'driver', 00000002, 'Complete Time slot.'),
(00000981, 'Time slot Accepted', '2024-10-10 16:34:34', 'driver', 00000002, 'Accept Time slot.'),
(00000982, 'Time slot Accepted', '2024-10-10 16:34:37', 'driver', 00000002, 'Accept Time slot.'),
(00000983, 'Time Slot Added', '2024-10-10 16:39:34', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000984, 'Time slot Accepted', '2024-10-10 16:40:00', 'driver', 00000002, 'Accept Time slot.'),
(00000985, 'Time slot Completed', '2024-10-10 16:42:01', 'driver', 00000002, 'Complete Time slot.'),
(00000986, 'Time Slot Added', '2024-10-10 16:49:31', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000987, 'Time slot Accepted', '2024-10-10 16:49:42', 'driver', 00000002, 'Accept Time slot.'),
(00000988, 'Time slot Completed', '2024-10-10 16:52:01', 'driver', 00000002, 'Complete Time slot.'),
(00000989, 'Time Slot Added', '2024-10-10 16:59:37', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000990, 'Time slot Accepted', '2024-10-10 16:59:47', 'driver', 00000002, 'Accept Time slot.'),
(00000991, 'Time slot Completed', '2024-10-10 17:02:01', 'driver', 00000002, 'Complete Time slot.'),
(00000992, 'Time slot Completed', '2024-10-10 17:02:02', 'driver', 00000002, 'Complete Time slot.'),
(00000993, 'Time Slot Added', '2024-10-10 17:09:09', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000994, 'Time slot Accepted', '2024-10-10 17:09:26', 'driver', 00000002, 'Accept Time slot.'),
(00000995, 'Time slot Completed', '2024-10-10 17:12:01', 'driver', 00000002, 'Complete Time slot.'),
(00000996, 'Time Slot Added', '2024-10-10 17:28:12', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000997, 'Time Slot Added', '2024-10-10 17:34:57', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00000998, 'Time slot Accepted', '2024-10-10 17:35:23', 'driver', 00000002, 'Accept Time slot.'),
(00000999, 'Time slot Completed', '2024-10-10 17:37:02', 'driver', 00000002, 'Complete Time slot.'),
(00001000, 'Time Slot Added', '2024-10-10 17:43:32', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001001, 'Time slot Accepted', '2024-10-10 17:43:54', 'driver', 00000002, 'Accept Time slot.'),
(00001002, 'Time slot Completed', '2024-10-10 17:46:01', 'driver', 00000002, 'Complete Time slot.'),
(00001003, 'Time Slot Added', '2024-10-10 18:07:45', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001004, 'Time Slot Added', '2024-10-10 18:19:21', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001005, 'Time Slot Added', '2024-10-10 18:22:11', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001006, 'Time Slot Added', '2024-10-10 18:29:07', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001007, 'Time Slot Added', '2024-10-10 18:35:26', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001008, 'Time slot Completed', '2024-10-10 18:38:10', 'driver', 00000002, 'Complete Time slot.'),
(00001009, 'Time slot Completed', '2024-10-10 18:38:23', 'driver', 00000002, 'Complete Time slot.'),
(00001010, 'Time Slot Added', '2024-10-10 18:50:03', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001011, 'Controller Logged-In', '2024-10-10 18:51:11', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001012, 'Time Slot Added', '2024-10-10 18:54:55', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001013, 'Time slot Accepted', '2024-10-10 18:55:08', 'driver', 00000002, 'Accept Time slot.'),
(00001014, 'Time Slot Added', '2024-10-10 19:03:47', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001015, 'Time Slot Added', '2024-10-10 19:09:16', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001016, 'Time Slot Added', '2024-10-10 19:10:40', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001017, 'Time Slot Added', '2024-10-10 19:12:41', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001018, 'Time slot Accepted', '2024-10-10 19:13:23', 'driver', 00000002, 'Accept Time slot.'),
(00001019, 'Time Slot Added', '2024-10-10 19:17:28', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001020, 'Time Slot Added', '2024-10-10 19:27:21', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001021, 'Time Slot Added', '2024-10-10 19:33:06', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001022, 'Time Slot Added', '2024-10-10 19:34:18', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001023, 'Time Slot Added', '2024-10-10 19:39:38', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001024, 'Time Slot Added', '2024-10-10 20:03:02', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001025, 'Time Slot Added', '2024-10-10 20:08:45', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001026, 'Time Slot Added', '2024-10-10 20:15:30', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001027, 'Time slot Completed', '2024-10-10 20:18:02', 'driver', 00000002, 'Complete Time slot.'),
(00001028, 'Time Slot Added', '2024-10-10 20:22:38', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001029, 'Time slot Accepted', '2024-10-10 20:22:50', 'driver', 00000002, 'Accept Time slot.'),
(00001030, 'Time slot Completed', '2024-10-10 20:24:01', 'driver', 00000002, 'Complete Time slot.'),
(00001031, 'Time slot Completed', '2024-10-10 20:24:01', 'driver', 00000002, 'Complete Time slot.'),
(00001032, 'Time Slot Added', '2024-10-10 20:37:56', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001033, 'Time slot Accepted', '2024-10-10 20:38:06', 'driver', 00000002, 'Accept Time slot.'),
(00001034, 'Time slot Completed', '2024-10-10 20:39:01', 'driver', 00000002, 'Complete Time slot.'),
(00001035, 'Time slot Completed', '2024-10-10 20:39:02', 'driver', 00000002, 'Complete Time slot.'),
(00001036, 'Time Slot Added', '2024-10-10 20:42:43', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001037, 'Time slot Accepted', '2024-10-10 20:42:53', 'driver', 00000002, 'Accept Time slot.'),
(00001038, 'Time slot Completed', '2024-10-10 20:45:01', 'driver', 00000002, 'Complete Time slot.'),
(00001039, 'Time slot Completed', '2024-10-10 20:45:02', 'driver', 00000002, 'Complete Time slot.'),
(00001040, 'Account Logged In', '2024-10-11 05:35:52', 'driver', 00000002, 'You have logged in to your account.'),
(00001041, 'Controller Logged-In', '2024-10-11 15:14:59', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001042, 'Time Slot Added', '2024-10-11 15:15:29', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001043, 'Time slot Accepted', '2024-10-11 15:17:00', 'driver', 00000002, 'Accept Time slot.'),
(00001044, 'Account Logged In', '2024-10-11 16:09:24', 'driver', 00000002, 'You have logged in to your account.'),
(00001045, 'Controller Logged-In', '2024-10-11 16:17:16', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001046, 'Time Slot Added', '2024-10-11 16:18:21', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001047, 'Time slot Accepted', '2024-10-11 16:18:44', 'driver', 00000000, 'Accept Time slot.'),
(00001048, 'Time slot Completed', '2024-10-11 16:21:02', 'driver', 00000000, 'Complete Time slot.'),
(00001049, 'Account Logged In', '2024-10-11 16:27:06', 'driver', 00000002, 'You have logged in to your account.'),
(00001050, 'Account Logged In', '2024-10-11 16:51:38', 'driver', 00000002, 'You have logged in to your account.'),
(00001051, 'Controller Logged-In', '2024-10-11 17:09:11', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001052, 'Time Slot Added', '2024-10-11 17:09:31', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001053, 'Time slot Accepted', '2024-10-11 17:09:42', 'driver', 00000002, 'Accept Time slot.'),
(00001054, 'Time slot Completed', '2024-10-11 17:18:30', 'driver', 00000002, 'Complete Time slot.'),
(00001055, 'Time Slot Added', '2024-10-11 17:21:18', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001056, 'Time slot Accepted', '2024-10-11 17:21:28', 'driver', 00000002, 'Accept Time slot.'),
(00001057, 'Time slot Completed', '2024-10-11 17:24:07', 'driver', 00000002, 'Complete Time slot.'),
(00001058, 'Time Slot Added', '2024-10-11 17:29:37', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001059, 'Time slot Accepted', '2024-10-11 17:29:50', 'driver', 00000002, 'Accept Time slot.'),
(00001060, 'Time slot Completed', '2024-10-11 17:33:28', 'driver', 00000002, 'Complete Time slot.'),
(00001061, 'Time Slot Added', '2024-10-11 17:34:40', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001062, 'Time slot Accepted', '2024-10-11 17:34:52', 'driver', 00000002, 'Accept Time slot.'),
(00001063, 'Time slot Completed', '2024-10-11 17:43:37', 'driver', 00000002, 'Complete Time slot.'),
(00001064, 'Time Slot Added', '2024-10-11 17:44:34', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001065, 'Time slot Accepted', '2024-10-11 17:44:51', 'driver', 00000002, 'Accept Time slot.'),
(00001066, 'Time slot Completed', '2024-10-11 17:48:03', 'driver', 00000002, 'Complete Time slot.'),
(00001067, 'Time slot Completed', '2024-10-11 17:48:04', 'driver', 00000002, 'Complete Time slot.'),
(00001068, 'Time Slot Added', '2024-10-11 17:51:00', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001069, 'Time slot Accepted', '2024-10-11 17:51:18', 'driver', 00000002, 'Accept Time slot.'),
(00001070, 'Time slot Completed', '2024-10-11 17:57:08', 'driver', 00000002, 'Complete Time slot.'),
(00001071, 'Time slot Completed', '2024-10-11 17:57:37', 'driver', 00000002, 'Complete Time slot.'),
(00001072, 'Time Slot Added', '2024-10-11 17:58:52', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001073, 'Time slot Accepted', '2024-10-11 17:59:11', 'driver', 00000002, 'Accept Time slot.'),
(00001074, 'Time slot Completed', '2024-10-11 18:02:02', 'driver', 00000002, 'Complete Time slot.'),
(00001075, 'Account Logged In', '2024-10-11 19:13:47', 'driver', 00000002, 'You have logged in to your account.'),
(00001076, 'Booker Signed-In', '2024-10-11 19:18:48', 'client', 00000001, 'Booker recently logged-In.'),
(00001077, 'Controller Logged-In', '2024-10-11 19:26:17', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001078, 'Account Logged In', '2024-10-11 19:27:47', 'driver', 00000002, 'You have logged in to your account.'),
(00001079, 'Time Slot Added', '2024-10-11 19:28:18', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001080, 'Time slot Accepted', '2024-10-11 19:28:34', 'driver', 00000002, 'Accept Time slot.'),
(00001081, 'Time slot Completed', '2024-10-11 19:33:45', 'driver', 00000002, 'Complete Time slot.'),
(00001082, 'Time Slot Added', '2024-10-11 19:34:32', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001083, 'Time slot Accepted', '2024-10-11 19:34:44', 'driver', 00000002, 'Accept Time slot.'),
(00001084, 'Time slot Completed', '2024-10-11 19:38:07', 'driver', 00000002, 'Complete Time slot.'),
(00001085, 'Time Slot Added', '2024-10-11 19:38:42', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001086, 'Time slot Accepted', '2024-10-11 19:38:53', 'driver', 00000002, 'Accept Time slot.'),
(00001087, 'Time slot Completed', '2024-10-11 19:41:01', 'driver', 00000002, 'Complete Time slot.'),
(00001088, 'Account Logged In', '2024-10-11 19:42:35', 'driver', 00000002, 'You have logged in to your account.'),
(00001089, 'Time Slot Added', '2024-10-11 19:43:15', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001090, 'Time slot Accepted', '2024-10-11 19:43:28', 'driver', 00000002, 'Accept Time slot.'),
(00001091, 'Time slot Completed', '2024-10-11 19:46:33', 'driver', 00000002, 'Complete Time slot.'),
(00001092, 'Time slot Completed', '2024-10-11 19:46:37', 'driver', 00000002, 'Complete Time slot.'),
(00001093, 'Time Slot Added', '2024-10-11 19:49:31', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001094, 'Time slot Accepted', '2024-10-11 19:49:39', 'driver', 00000002, 'Accept Time slot.'),
(00001095, 'Account Logged In', '2024-10-11 19:57:51', 'driver', 00000002, 'You have logged in to your account.'),
(00001096, 'Time Slot Added', '2024-10-11 20:07:52', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001097, 'Time slot Accepted', '2024-10-11 20:08:03', 'driver', 00000002, 'Accept Time slot.'),
(00001098, 'Time slot Completed', '2024-10-11 20:10:01', 'driver', 00000002, 'Complete Time slot.'),
(00001099, 'Time Slot Added', '2024-10-11 20:15:37', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001100, 'Time slot Accepted', '2024-10-11 20:15:46', 'driver', 00000002, 'Accept Time slot.'),
(00001101, 'Time slot Completed', '2024-10-11 20:18:01', 'driver', 00000002, 'Complete Time slot.'),
(00001102, 'Time slot Completed', '2024-10-11 20:18:02', 'driver', 00000002, 'Complete Time slot.'),
(00001103, 'Controller Logged-In', '2024-10-11 20:19:39', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001104, 'Account Logged In', '2024-10-11 20:24:07', 'driver', 00000002, 'You have logged in to your account.'),
(00001105, 'Time Slot Added', '2024-10-11 20:24:31', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001106, 'Time slot Accepted', '2024-10-11 20:24:40', 'driver', 00000002, 'Accept Time slot.'),
(00001107, 'Time slot Completed', '2024-10-11 20:27:01', 'driver', 00000000, 'Complete Time slot.'),
(00001108, 'Controller Logged-In', '2024-10-11 20:33:04', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001109, 'Account Logged In', '2024-10-12 07:47:55', 'driver', 00000002, 'You have logged in to your account.'),
(00001110, 'Account Logged In', '2024-10-12 07:48:35', 'driver', 00000002, 'You have logged in to your account.'),
(00001111, 'Account Logged In', '2024-10-12 07:49:29', 'driver', 00000002, 'You have logged in to your account.'),
(00001112, 'Account Logged In', '2024-10-12 07:49:35', 'driver', 00000002, 'You have logged in to your account.'),
(00001113, 'Controller Logged-In', '2024-10-15 11:19:41', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001114, 'Controller Logged-In', '2024-10-17 22:12:33', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001115, 'Booker Signed-In', '2024-10-18 16:41:39', 'client', 00000001, 'Booker recently logged-In.'),
(00001116, 'Booker Signed-In', '2024-10-18 17:02:17', 'client', 00000001, 'Booker recently logged-In.'),
(00001117, 'Booker Signed-In', '2024-10-18 17:04:47', 'client', 00000001, 'Booker recently logged-In.'),
(00001118, 'Booker Signed-In', '2024-10-18 17:19:44', 'client', 00000001, 'Booker recently logged-In.'),
(00001119, 'Booker Signed-In', '2024-10-19 11:32:58', 'client', 00000001, 'Booker recently logged-In.'),
(00001120, 'Booker Signed-In', '2024-10-19 16:36:23', 'client', 00000001, 'Booker recently logged-In.'),
(00001121, 'Controller Logged-In', '2024-10-23 18:07:15', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001122, 'Account Logged In', '2024-10-23 18:11:42', 'driver', 00000002, 'You have logged in to your account.'),
(00001123, 'Status Updated', '2024-10-23 18:13:00', 'driver', 00000002, 'Your Status recently Updated'),
(00001124, 'Account Logged In', '2024-10-23 18:19:13', 'driver', 00000001, 'You have logged in to your account.'),
(00001125, 'Status Updated', '2024-10-23 18:19:38', 'driver', 00000001, 'Your Status recently Updated'),
(00001126, 'Status Updated', '2024-10-23 18:19:52', 'driver', 00000002, 'Your Status recently Updated'),
(00001127, 'Status Updated', '2024-10-23 18:19:56', 'driver', 00000002, 'Your Status recently Updated'),
(00001128, 'Controller Logged-In', '2024-10-23 18:26:44', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001129, 'New Booking', '2024-10-23 18:28:51', 'user', 00000001, 'Controller Has added a new booking 94'),
(00001130, 'Job Dispatched', '2024-10-23 18:29:08', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00001131, 'Status Updated', '2024-10-23 18:31:13', 'driver', 00000002, 'Your Status recently Updated'),
(00001132, 'Time Slot Added', '2024-10-23 18:31:48', 'user', 00000001, 'New Time Slot Has Been Added by Controller.'),
(00001133, 'Driver Inactive', '2024-10-23 18:35:12', 'user', 00000001, 'Driver 00000002 Has Been made by Controller.'),
(00001134, 'Job Withdrawal', '2024-10-23 18:35:52', 'user', 00000001, 'Job 00000056 has been withdrawn by Controller.'),
(00001135, 'Controller Logged-In', '2024-10-23 18:36:10', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001136, 'Job Dispatched', '2024-10-23 18:36:36', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00001137, 'Status Updated', '2024-10-23 18:39:01', 'driver', 00000002, 'Your Status recently Updated'),
(00001138, 'Job Accepted', '2024-10-23 18:40:07', 'driver', 00000001, 'Job 00000057 has been accepted by driver.'),
(00001139, 'Job Withdrawal', '2024-10-23 18:40:58', 'user', 00000001, 'Job 00000057 has been withdrawn by Controller.'),
(00001140, 'Controller Logged-In', '2024-10-23 18:41:07', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001141, 'Job Dispatched', '2024-10-23 18:42:05', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00001142, 'Job Withdrawal', '2024-10-23 18:42:14', 'user', 00000001, 'Job 00000058 has been withdrawn by Controller.'),
(00001143, 'Controller Logged-In', '2024-10-23 18:42:24', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001144, 'Status Updated', '2024-10-23 18:43:51', 'driver', 00000002, 'Your Status recently Updated'),
(00001145, 'Status Updated', '2024-10-23 18:44:32', 'driver', 00000001, 'Your Status recently Updated'),
(00001146, 'Status Updated', '2024-10-23 18:53:16', 'driver', 00000002, 'Your Status recently Updated'),
(00001147, 'Controller Logged-In', '2024-10-23 18:54:39', 'user', 00000001, 'Controller Atiq Logged in successfully.'),
(00001148, 'New Driver Profile Registered', '2024-10-23 19:17:20', 'driver', 00000005, 'New Driver Acount Created by shary Butt'),
(00001149, 'Account Logged In', '2024-10-23 19:18:39', 'driver', 00000005, 'You have logged in to your account.'),
(00001150, 'Account Logged In', '2024-10-23 19:20:54', 'driver', 00000005, 'You have logged in to your account.'),
(00001151, 'Controller Logged-In', '2024-10-24 08:27:45', 'user', 00000001, 'Controller Atiq Logged in successfully.');

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
(00000000008, 00000000063, 00000000002, '30', 1, '2024-09-19 15:34:26'),
(00000000009, 00000000061, 00000000001, '525', 0, '2024-09-13 11:51:41'),
(00000000010, 00000000061, 00000000001, '626', 0, '2024-09-13 11:52:03'),
(00000000011, 00000000061, 00000000001, '55', 0, '2024-09-14 19:54:20');

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
(00000006, 00000000001, 00000000084, 7, '', '2024-09-08 15:50:36'),
(00000007, 00000000002, 00000000090, 30, '', '2024-09-12 22:40:18');

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
  `bid_date` date NOT NULL,
  `bid_time` time NOT NULL,
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

INSERT INTO `bookings` (`book_id`, `b_type_id`, `c_id`, `pickup`, `stops`, `destination`, `address`, `postal_code`, `passenger`, `pick_date`, `pick_time`, `journey_type`, `v_id`, `luggage`, `child_seat`, `flight_number`, `delay_time`, `note`, `journey_fare`, `journey_distance`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `booker_commission`, `booking_status`, `bid_status`, `bid_date`, `bid_time`, `bid_note`, `payment_type`, `customer_name`, `customer_email`, `customer_phone`, `book_add_date`) VALUES
(00000003, 00000001, 00000001, 'Manchester, UK', '', 'London, UK', '698-702 High Road', 'N12 9PY', 2, '2024-10-12', '21:00:00', 'One Way', 00000001, '2', 'Yes', '', '00:00:00', '', 5040, 336, 0, 0, 0, 0, 0, 0, 'Pending', 1, '2024-09-24', '08:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000005, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'London, UK', '', 'W16', 2, '2024-10-12', '18:00:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 414, 28, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000006, 00000001, 00000001, 'Leeds, UK', '', 'Leicester, UK', '', 'N12', 2, '2024-10-13', '10:15:00', 'One Way', 00000001, '1', 'Yes', '', '00:00:00', '', 2370, 158, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000007, 00000001, 00000001, 'Leeds, UK', '', 'Luton, UK', '', 'N12 9PY', 2, '2024-10-13', '16:37:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 3975, 265, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000008, 00000001, 00000001, 'Liverpool, UK', '', 'Leeds, UK', '', 'N12 9PY', 2, '2024-10-14', '17:31:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 1755, 117, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000010, 00000001, 00000001, 'Dartford, UK', '', 'Deeside, UK', '', 'N12 9PY', 2, '2024-10-14', '23:45:00', 'One Way', 00000003, '2', 'No', '', '00:00:00', '', 5715, 381, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000012, 00000001, 00000001, 'London W2, UK', '', 'London W3, UK', '', 'N12 9PY', 3, '2024-10-14', '21:30:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 134, 9, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000013, 00000001, 00000001, 'Leeds, UK', '', 'Leicester, UK', 'ik', 'W12', 2, '2024-10-15', '16:12:00', 'One Way', 00000003, '2', 'No', '', '00:00:00', '', 2370, 158, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000014, 00000001, 00000001, 'Norwich, UK', '', 'Hastings, UK', 'uk', 'W12', 4, '2024-10-15', '17:22:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 4050, 270, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000015, 00000001, 00000001, 'Manchester, UK', '', 'Milton Keynes, UK', 'uk', 'W12', 3, '2024-08-31', '17:22:00', 'One Way', 00000006, '2', 'No', '', '00:00:00', '', 3690, 246, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000016, 00000001, 00000001, 'Farringdon, London, UK', '', 'Wales, UK', 'uk', 'W12', 3, '2024-08-31', '17:50:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 5130, 342, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000017, 00000001, 00000001, 'Edinburgh, UK', '', 'Richmond, UK', 'uk', 'W12', 9, '2024-08-31', '17:25:00', 'One Way', 00000003, '2', 'No', '', '00:00:00', '', 9930, 662, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000019, 00000001, 00000001, 'Wales, UK', '', 'Winchester, UK', 'ik', 'N12 9PY', 5, '2024-08-31', '02:46:00', 'One Way', 00000001, '2', 'Yes', '', '00:00:00', '', 4568, 290, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000020, 00000001, 00000001, 'Fort William, UK', '', 'Devon, UK', 'ik', 'W12', 8, '2024-08-31', '05:48:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 14553, 924, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000021, 00000001, 00000001, 'Ullapool, UK', '', 'Uxbridge, UK', '', 'N12 9PY', 2, '2024-08-31', '21:27:00', 'Return', 00000001, '2', 'No', '', '00:00:00', '', 15404, 978, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000022, 00000001, 00000001, 'Henley-on-Thames, UK', '', 'Hertfordshire, UK', '', 'N12 9PY', 6, '2024-08-31', '22:11:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 1232, 78, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000023, 00000001, 00000001, 'London W2, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'N12 9PY', 2, '2024-08-31', '18:30:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 387, 26, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000024, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', ',,', 'London, UK', 'uk', 'N12 9PY', 2, '2024-08-31', '00:38:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 450, 30, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000025, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'N12 9PY', 3, '2024-08-31', '23:30:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 360, 40, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', 'Cash', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-08-31 16:06:34'),
(00000026, 00000001, 00000001, 'West London Studios, Fulham Road, London, UK', '', 'Central London, London, UK', 'W12', 'N12= North Finchley, Woodside Park', 2, '2024-08-31', '16:00:00', 'One Way', 00000004, '2', 'No', '', '00:00:00', '', 89, 6, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000027, 00000003, 00000001, 'Leadgate, Consett, UK', '', 'Airport Tavern, Bridgwater Road, Lulsgate, Felton, Bristol, UK', '', 'N17= Tottenham', 2, '2024-08-31', '22:20:00', 'One Way', 00000003, '2', 'No', '', '00:00:00', '', 7335, 489, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000028, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'Central London, London, UK', '', 'N4= Finsbury Park, Manor House', 2, '2024-08-31', '17:29:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 413, 28, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000029, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'Central London, London, UK', '', 'N7= Holloway', 2, '2024-08-31', '23:30:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 433, 28, 30, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000030, 00000003, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'East Ham, London, UK', '', 'N12= North Finchley, Woodside Park', 2, '2024-08-31', '19:30:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 1520, 97, 30, 0, 0, 0, 0, 20, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000031, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'High Road, London N12 9PY, UK', '', ' ', 1, '2024-08-31', '22:30:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 513, 33, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '19:14:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000032, 00000001, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'East Ham, London, UK', '698-702 High Road', 'N4= Finsbury Park, Manor House', 2, '2024-08-31', '17:35:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 840, 56, 30, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'azibahmed@hotmail.co.uk', '07552834179', '2024-08-31 16:06:34'),
(00000033, 00000001, 00000001, 'Stansted Airport, Stansted, UK', '', 'London E3 3JG, UK', '', ' ', 2, '2024-08-31', '21:30:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 795, 53, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000034, 00000003, 00000001, 'Jail Lane, Biggin Hill, Westerham, UK', '', 'Eastbourne, UK', '', 'N7= Holloway', 2, '2024-08-31', '23:34:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 1202, 76, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000035, 00000001, 00000001, 'London Luton Airport Roundabout, Luton, UK', '', 'Luton, UK', '', 'W12', 2, '2024-08-31', '18:15:00', 'One Way', 00000003, '2', 'Yes', '', '00:00:00', '', 48, 3, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000036, 00000003, 00000001, 'Jail Road, Batley, UK', '', 'Weston-super-Mare, UK', '', 'N12', 2, '2024-08-31', '23:50:00', 'One Way', 00000001, '1', 'Yes', '', '00:00:00', '', 5686, 361, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000037, 00000001, 00000001, 'Airport Way, Luton, UK', '', 'Valley Avenue, London N12 9PG, UK', '', ' ', 2, '2024-08-31', '23:07:00', 'One Way', 00000004, '', '', '', '00:00:00', '', 710, 47, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000038, 00000003, 00000001, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', 'Weston-super-Mare, UK', '', 'N19= Archway, Tufnell Park', 2, '2024-08-31', '20:52:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 3060, 204, 30, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000039, 00000003, 00000001, 'Weston-super-Mare, UK', '', 'Eastbourne, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-10-15', '20:30:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 5085, 339, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000040, 00000001, 00000001, 'Faisal Food Store, Derby Street, Bolton, UK', '', 'Zamor Crescent, Thurcroft, Rotherham, UK', '', ' ', 2, '2024-10-15', '19:45:00', 'One Way', 00000004, '', '', '', '00:00:00', '', 1965, 131, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000041, 00000002, 00000001, 'Farnborough, UK', ',', 'London, UK', '', 'N2= East Finchley', 2, '2024-10-16', '19:09:00', '', 00000004, '', '', '', '00:00:00', '', 930, 62, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '2024-08-31 16:06:34'),
(00000042, 00000001, 00000001, 'Hertfordshire, UK', '', 'Eastbourne, UK', '', 'N12= North Finchley, Woodside Park', 2, '2024-10-16', '23:10:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 2945, 187, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000043, 00000001, 00000001, 'Jail Lane, Biggin Hill, Westerham, UK', '', 'East Ham, London, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-10-16', '21:44:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 773, 49, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000044, 00000001, 00000001, 'Jail Lane, Biggin Hill, Westerham, UK', '', 'East Ham, London, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-10-16', '21:36:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 773, 49, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '21:06:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000046, 00000001, 00000001, 'London W2 2UH, UK', '', 'Westminster, London, UK', '', ' ', 2, '2024-10-17', '20:55:00', 'One Way', 00000004, '', '', '', '00:00:00', '', 68, 4, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000047, 00000001, 00000001, '736 Bath Road, Cranford, Hounslow, UK', '', 'Heathfield, UK', '', ' ', 1, '2024-10-17', '22:15:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 1875, 125, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000048, 00000001, 00000001, '736 Bath Road, Cranford, Hounslow, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '164-166 High Road', ' ', 1, '2024-10-17', '23:25:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 71, 5, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000049, 00000001, 00000001, 'Stansted Airport, Stansted, UK', '', 'Harlow, UK', '', ' ', 1, '2024-10-17', '23:50:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 342, 23, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000050, 00000001, 00000001, 'London, UK', '', 'Luton, UK', '', 'N3= Finchley Central', 1, '2024-10-18', '21:30:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 851, 54, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000051, 00000001, 00000001, 'Nottingham, UK', '', 'Loughborough, UK', '', ' ', 1, '2024-10-18', '21:30:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 398, 25, 0, 68, 25, 35, 5, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000052, 00000001, 00000001, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', 'East Ham, London, UK', '698-702 High Road', 'SE19= Crystal Palace, Upper Norwood', 2, '2024-10-18', '23:15:00', 'One Way', 00000002, '6', 'No', '', '00:00:00', '', 880, 56, 30, 25, 96, 32, 64, 0, 'Pending', 0, '2024-09-26', '17:56:00', '', '', '', 'azibahmed@hotmail.co.uk', '07552834179', '2024-08-31 16:06:34'),
(00000053, 00000001, 00000001, 'Heath and Reach, Leighton Buzzard, UK', ',', 'Eastbourne, UK', 'Muzaffar Kaloni gali Nomber 12', 'E10= Leyton', 3, '2024-09-30', '13:19:00', 'One Way', 00000002, '3', 'No', '', '00:00:00', '', 3105, 207, 20, 20, 0, 50, 50, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000054, 00000001, 00000001, 'Terminal 5, Wallis Road, Longford, Hounslow, UK', '', 'London NW3 2QG, UK', '', ' ', 1, '2024-10-18', '18:30:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 717, 48, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000055, 00000001, 00000001, 'Heathrow Terminal 1, Hounslow, UK', '', 'Nw3', '', ' ', 1, '2024-10-18', '23:25:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 0, 0, 0, 3, 4, 5, 2, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000056, 00000001, 00000001, 'High Road, London N12 9PY, UK', '', 'Lewes Road, London N12 9NH, UK', '', ' ', 1, '2024-10-19', '21:50:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 17, 1, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000057, 00000001, 00000001, 'Londonderry, UK', '', 'London, UK', 'Street 3 near kareem Town FSD', 'N7= Holloway', 5, '2024-10-19', '23:00:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 12915, 861, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', 'Fuy', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000058, 00000001, 00000001, 'High Road, London N12 9PY, UK', '', 'Torrington Park, London N12 9TS, UK', '', 'W12', 1, '2024-10-19', '12:55:00', 'One Way', 00000002, '1', 'Yes', '', '00:00:00', '', 17, 1, 0, 28, 0, 30, 40, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000059, 00000001, 00000001, 'Stansted Airport, Stansted, UK', '', 'Harlow CM20, UK', '', ' ', 1, '2024-10-19', '11:45:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 363, 24, 0, 5, 5, 22, 0, 0, 'Pending', 0, '2024-09-25', '00:33:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000060, 00000001, 00000001, 'Londonderry, UK', '', 'Airport Tavern, Bridgwater Road, Lulsgate, Felton, Bristol, UK', '', ' ', 3, '2024-10-19', '16:30:00', 'One Way', 00000003, '', 'No', '', '00:00:00', '', 12210, 814, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000061, 00000001, 00000001, 'Weston-super-Mare, UK', '', 'Eastbourne, UK', '', 'N4= Finsbury Park, Manor House', 2, '2024-09-25', '15:00:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 5085, 339, 0, 58, 50, 18, 88, 0, 'Booked', 0, '2024-09-24', '07:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000062, 00000001, 00000001, 'West Cromwell Road, London, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'N12= North Finchley, Woodside Park', 1, '2024-09-24', '19:20:00', 'One Way', 00000003, '2', '', '', '00:00:00', '', 350, 23, 0, 555, 5555, 66666, 55, 0, 'Booked', 0, '2024-09-24', '05:15:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000063, 00000001, 00000001, 'London NW6 5DE, UK', '', 'London NW6 5DE, UK', '', ' ', 1, '2024-09-20', '22:27:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 15, 1, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'hello@prenero.com', '+443157524000', '0000-00-00 00:00:00'),
(00000064, 00000002, 00000001, 'London NW9, UK', '', 'Crouch Hill, London N4 4AP, UK', '', ' ', 5, '2024-09-13', '11:50:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 189, 13, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '0000-00-00 00:00:00'),
(00000065, 00000001, 00000001, 'Gatwick, UK', '', 'Gateshead, UK', '', ' ', 1, '2024-09-16', '22:55:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 7755, 517, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'hello@prenero.com', '+443157524000', '0000-00-00 00:00:00'),
(00000066, 00000003, 00000001, ' - C3VP+2J9, Mustaffabad Faisalabad, Punjab, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-13', '21:04:00', '', 00000002, '1', '', '', '00:00:00', ' ', 10, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', 'Personal', 'atiq bhai', 'prenero@gmail.com', '+447365363737', '2024-09-03 17:38:38'),
(00000067, 00000003, 00000001, ' - C3VP+2J9, Mustaffabad Faisalabad, Punjab, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-13', '20:42:00', '', 00000002, '1', '', '', '00:00:00', ' ', 10, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', 'Personal', 'atiq bhai ', 'prenero@gmail.com', '+445757898544', '2024-09-03 18:04:14'),
(00000068, 00000003, 00000001, ' - C3VP+2J9, Mustaffabad Faisalabad, Punjab, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-05', '23:42:00', '', 00000002, '1', '', '', '00:00:00', ' ', 10, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', 'Personal', 'atiq bhai ', 'prenero@gmail.com', '+445757898544', '2024-09-03 18:15:27'),
(00000069, 00000001, 00000001, 'Torrington Park, London N12 9TS, UK', '', 'High Road, London N12 9PY, UK', '', ' ', 2, '2024-09-05', '21:50:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 13, 1, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'hello@prenero.com', '+443157524000', '0000-00-00 00:00:00'),
(00000070, 00000003, 00000002, ' - C3RQ+FMX, Mustafa Rd, Mustaffabad Islam Nagar, Faisalabad, Punjab, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-05', '22:57:00', '', 00000001, '1', '', '', '00:00:00', ' ', 13, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', 'Personal', 'aqib', 'prenero@gmail.com', '+443475263637', '2024-09-05 16:59:44'),
(00000071, 00000003, 00000002, 'Jail Lane, Biggin Hill, Westerham, UK', '', 'West Wittering, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-09-07', '01:40:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 1843, 117, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000072, 00000003, 00000002, 'Westminster, London, UK', '', 'Northampton, UK', '', 'N10= Muswell Hill', 2, '2024-09-07', '19:12:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 1635, 109, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000073, 00000003, 00000002, 'Next Arndale Centre, Corporation Street, Manchester, UK', '', 'Westminster, London, UK', '', 'N8= Crouch End, Hornsey', 2, '2024-09-07', '19:45:00', 'One Way', 00000002, '2', 'No', '', '00:00:00', '', 5235, 349, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000074, 00000003, 00000002, 'Weston-super-Mare, UK', '', 'Northampton, UK', 'Muzaffar Kaloni gali Nomber 12', 'N4= Finsbury Park, Manor House', 2, '2024-09-07', '19:05:00', 'One Way', 00000001, '1', '', '', '00:00:00', '', 3270, 218, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000075, 00000001, 00000001, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', ',', 'East Ham, London, UK', 'Muzaffar Kaloni gali Nomber 12', 'SW19= Merton, Wimbledon', 2, '2024-09-07', '16:57:00', 'One Way', 00000003, '3', 'No', '', '00:00:00', '', 3105, 97, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000076, 00000001, 00000001, 'Health Centre, Coker Close, Bicester, UK', '', 'Health Centre Road, Coventry, UK', 'Muzaffar Kaloni gali Nomber 12', 'N19= Archway, Tufnell Park', 2, '2024-09-07', '17:05:00', 'One Way', 00000001, '3', 'No', '', '00:00:00', '', 3105, 73, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000077, 00000001, 00000001, 'Health House, Grange Park Lane, Willerby, Hull, UK', ',,', 'Headingley, Leeds, UK', 'Muzaffar Kaloni gali Nomber 12', 'N12= North Finchley, Woodside Park', 2, '2024-09-07', '17:18:00', 'One Way', 00000005, '6', 'No', '', '00:00:00', '', 3105, 98, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000078, 00000001, 00000001, 'Health Centre, Coker Close, Bicester, UK', '', 'Harrogate, UK', 'Muzaffar Kaloni gali Nomber 12', 'N19= Archway, Tufnell Park', 2, '2024-09-07', '17:24:00', 'One Way', 00000007, '3', 'No', '', '00:00:00', '', 3105, 279, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000079, 00000001, 00000001, 'Healaugh, Richmond, UK', '', 'Hull, UK', 'Muzaffar Kaloni gali Nomber 12', 'N10= Muswell Hill', 2, '2024-09-07', '17:28:00', 'One Way', 00000007, '3', 'No', '', '00:00:00', '', 3105, 171, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000080, 00000001, 00000001, 'Health Centre Road, Coventry, UK', '', 'Heathfield, UK', 'Muzaffar Kaloni gali Nomber 12', 'N11= Friern Barnet, New Southgate', 3, '2024-09-07', '17:44:00', '', 00000005, '3', '', '', '00:00:00', '', 3105, 253, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000081, 00000001, 00000001, 'Health House, Grange Park Lane, Willerby, Hull, UK', '', 'Headingley, Leeds, UK', 'Muzaffar Kaloni gali Nomber 12', 'N14= Southgate', 3, '2024-09-13', '17:49:00', 'One Way', 00000005, '3', 'No', '', '00:00:00', '', 3105, 98, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000082, 00000001, 00000001, 'Health House, Grange Park Lane, Willerby, Hull, UK', '', 'Healing, UK', 'Muzaffar Kaloni gali Nomber 12', 'N13= Palmers Green', 3, '2024-09-13', '22:54:00', 'One Way', 00000003, '3', 'No', '', '00:00:00', '', 3105, 43, 20, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000083, 00000003, 00000002, ' - C3HH+WF6, Jail Rd, Civil Lines, Faisalabad, Punjab, Pakistan', '[]', 'Sheikh Ahmad kryana store Akbar Chowk, Gulistan Colony, Faisalabad, Pakistan', '', '', 4, '2024-09-13', '23:44:00', '', 00000002, '1', '', '', '00:00:00', ' ', 26, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', 'Personal', 'Wajeeh ', 'prenero@gmail.co.', '03346452312', '2024-09-08 10:50:16'),
(00000084, 00000003, 00000001, ' - C3VP+2J9, Mustaffabad Faisalabad, Punjab, Pakistan', '[]', 'Horley, Gatwick RH6 0NP', '', '', 4, '2024-09-13', '21:49:00', '', 00000002, '1', '', '', '00:00:00', ' ', 40, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', 'Personal', 'Muhammad Atiq', 'prenero@gmail.com', '+443157524000', '2024-09-08 11:50:36'),
(00000085, 00000002, 00000002, 'High Road, London N12 9PY, UK', '', 'Finchley Road Station, London, UK', '', ' ', 1, '2024-09-13', '23:30:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 167, 11, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'hello@prenero.com', '+923157524000', '0000-00-00 00:00:00'),
(00000086, 00000001, 00000001, 'Nw1', '', 'N2', '', 'N12= North Finchley, Woodside Park', 1, '2024-09-13', '23:55:00', 'One Way', 00000003, '2', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'hello@prenero.com', '+443157524000', '0000-00-00 00:00:00'),
(00000087, 00000002, 00000001, 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', 'High Road, London N12 9PY, UK', '', 'N5= Highbury', 1, '2024-09-13', '02:55:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 523, 33, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '0000-00-00 00:00:00'),
(00000089, 00000003, 00000002, 'Weston-super-Mare, UK', '', 'Norwich, UK', '', 'N13= Palmers Green', 2, '2024-09-13', '02:00:00', 'One Way', 00000001, '', '', '', '00:00:00', '', 6631, 421, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'sales@prenero.com', '+443346452312', '0000-00-00 00:00:00'),
(00000090, 00000003, 00000002, ' - 92XC+QPG, Street No. 9, Rasheedabad Faisalabad, Punjab, Pakistan', '[]', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-09-13', '22:39:17', '', 00000002, '1', '', '', '00:00:00', ' ', 38, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', 'Personal', 'Atiq Ramzan', 'prenero@outlook.com', '+923157524000', '2024-09-12 18:40:18'),
(00000091, 00000002, 00000001, 'Hayes UB3 5AY, UK', '', 'West Drayton UB7 9FN, UK', '', 'N6= Highgate', 1, '2024-09-13', '20:30:00', 'One Way', 00000004, '', '', '', '00:00:00', '', 72, 5, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'prenero12@gmail.com', '+923127346634', '0000-00-00 00:00:00'),
(00000092, 00000001, 00000001, '', '', '', '', 'N12= North Finchley, Woodside Park', 1, '2024-09-20', '23:16:00', 'One Way', 00000002, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00', '00:00:00', '', '', '', 'hello@prenero.com', '+44315752', '0000-00-00 00:00:00'),
(00000093, 00000001, 00000001, 'Hethel, Norwich, UK', '', 'Heathfield, UK', 'Muzaffar Kaloni gali Nomber 12', 'SW19= Merton, Wimbledon', 3, '2024-10-09', '16:05:00', 'One Way', 00000002, '3', 'No', '', '00:00:00', '', 3105, 240, 4, 0, 0, 55, 0, 0, 'Booked', 1, '2024-10-05', '12:30:00', 'testing', '', '', 'sharyjagga18@gmail.com', '+443157524000', '0000-00-00 00:00:00'),
(00000094, 00000001, 00000001, 'London W3 0SE, UK', '', 'Concord Road, London, UK', '', 'N9= Lower Edmonton', 2, '2024-10-23', '23:36:00', 'One Way', 00000001, '2', 'No', '', '00:00:00', '', 1433, 91, 30, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00', '00:00:00', '', '', '', 'hello@prenero.com', '+443157524000', '0000-00-00 00:00:00');

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
(00000001, 00000002, '2024-09-02 10:54:24', '2024-09-02 10:54:37', '00:10:00', 1),
(00000002, 00000002, '2024-09-14 09:31:54', '2024-09-14 09:32:32', '00:37:00', 1);

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
(00000003, 00000070, 'assss', '0000-00-00 00:00:00'),
(00000004, 00000092, 'Testing', '2024-09-26 09:36:17');

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
(00000001, 'Muhammad Atiq', 'hello@prenero.com', '+443157524000', '12345678', '', 'Male', 'English', '', 'N12= North Finchley, Woodside Park', '', '', 0, '', '', 0, 0, 1, 1, '9e15eb2f66315f64b7fb83b525bf5b5b92bed80686be7ab1edb8f8d0d7517e54', '2024-10-19 16:36:23'),
(00000002, 'saad', 'sales@prenero.com', '+443346452312', 'asdf1234', '', 'Male', 'English', '66dd7508ec875.jpg', 'N4= Finsbury Park, Manor House', '', '', 0, '', '1', 5, 0, 1, 2, 'e74fb33185d141ee0cfe0950cd0aea12f6d752aae853f877b63f3c02dff48245', '2024-09-12 17:36:14');

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
(00000001, 'Azib Ali', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', '698-702 High Road', 'N12 9PY', '66d216456e779_66cb31d84a668_3d-animation-character-cartoon_113255-10862.jpg', 'Male', 'English', 'London', '', '51.5236548', '-0.2768765', 'Offline', 1, 0, '90c42220076acb311656d2bbfb87675bd0c4b5f51247776e977858a911aeb779', '2024-10-23 18:44:32'),
(00000005, 'shary Butt', 'sharyjagga18@gmail.com', '+923166413042', '12345678', '', '', '', '', '', 'London', '', '', '', '', 0, 0, 'c48d69f64ba813e7031a88ff201c246b36ffbfb9fb58aa3e19d68c6f0ea70e7c', '2024-10-23 19:20:54');

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
(00000003, 00000003, '', '', '', '', '', '', '', '', '2024-09-06 14:30:46'),
(00000004, 00000004, '', '', '', '', '', '', '', '', '2024-10-02 15:59:04'),
(00000005, 00000005, '', '', '', '', '', '', '', '', '2024-10-23 19:17:20');

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
(00000028, 00000002, 00000082, '2024-09-07 12:50:14'),
(00000029, 00000002, 00000083, '2024-09-09 17:24:10'),
(00000030, 00000001, 00000085, '2024-09-09 21:50:55'),
(00000031, 00000001, 00000085, '2024-09-09 22:07:35'),
(00000032, 00000001, 00000086, '2024-09-10 22:41:19'),
(00000033, 00000001, 00000084, '2024-09-10 22:45:20'),
(00000034, 00000001, 00000084, '2024-09-10 22:50:33'),
(00000035, 00000001, 00000086, '2024-09-10 22:51:14'),
(00000036, 00000001, 00000087, '2024-09-11 01:19:17'),
(00000037, 00000002, 00000088, '2024-09-11 17:26:08'),
(00000038, 00000002, 00000088, '2024-09-11 18:10:38'),
(00000039, 00000002, 00000089, '2024-09-11 18:58:56'),
(00000040, 00000002, 00000090, '2024-09-12 17:49:52'),
(00000041, 00000002, 00000084, '2024-09-12 19:33:38'),
(00000042, 00000002, 00000088, '2024-09-12 19:45:32'),
(00000043, 00000002, 00000067, '2024-09-12 19:54:26'),
(00000044, 00000002, 00000066, '2024-09-12 20:15:05'),
(00000045, 00000001, 00000091, '2024-09-13 18:09:31'),
(00000046, 00000002, 00000065, '2024-09-14 08:26:41'),
(00000047, 00000001, 00000062, '2024-09-14 19:00:01'),
(00000048, 00000001, 00000062, '2024-09-14 19:00:03'),
(00000049, 00000001, 00000092, '2024-09-17 21:35:38'),
(00000050, 00000002, 00000063, '2024-09-20 14:55:44'),
(00000051, 00000002, 00000062, '2024-09-23 15:19:45'),
(00000052, 00000002, 00000061, '2024-09-24 18:29:41'),
(00000053, 00000002, 00000092, '2024-09-26 19:56:56'),
(00000054, 00000002, 00000053, '2024-09-29 15:29:23'),
(00000055, 00000002, 00000093, '2024-10-09 08:49:55'),
(00000056, 00000001, 00000094, '2024-10-23 18:29:08'),
(00000057, 00000001, 00000094, '2024-10-23 18:36:36'),
(00000058, 00000001, 00000094, '2024-10-23 18:42:05');

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
(436, 00000002, '31.3781909', '73.0563324', '2024-09-07 15:16:41'),
(437, 00000002, '31.3782552', '73.0562338', '2024-09-09 10:17:34'),
(438, 00000002, '31.3782573', '73.0562291', '2024-09-09 10:17:44'),
(439, 00000002, '31.378245', '73.0562296', '2024-09-09 10:17:54'),
(440, 00000002, '31.378231', '73.0562297', '2024-09-09 10:18:04'),
(441, 00000002, '31.3782309', '73.0562276', '2024-09-09 10:18:14'),
(442, 00000002, '31.3782522', '73.0561856', '2024-09-09 10:18:24'),
(443, 00000002, '31.378217', '73.0562066', '2024-09-09 10:18:35'),
(444, 00000002, '31.3782602', '73.0561833', '2024-09-09 10:18:45'),
(445, 00000002, '31.3782611', '73.0561825', '2024-09-09 10:18:54'),
(446, 00000002, '31.378162', '73.0562484', '2024-09-09 10:19:04'),
(447, 00000002, '31.3782445', '73.0561956', '2024-09-09 10:19:14'),
(448, 00000002, '31.3781804', '73.0562366', '2024-09-09 10:19:24'),
(449, 00000002, '31.3782286', '73.0562023', '2024-09-09 10:19:35'),
(450, 00000002, '31.3781869', '73.0562286', '2024-09-09 10:19:44'),
(451, 00000002, '31.3782341', '73.0562129', '2024-09-09 10:19:54'),
(452, 00000002, '31.3782195', '73.0562037', '2024-09-09 10:20:04'),
(453, 00000002, '31.3782265', '73.0561998', '2024-09-09 10:20:15'),
(454, 00000002, '31.3782496', '73.0561926', '2024-09-09 10:20:24'),
(455, 00000002, '31.3782029', '73.0562184', '2024-09-09 10:20:34'),
(456, 00000002, '31.3782492', '73.0561879', '2024-09-09 10:20:44'),
(457, 00000002, '31.378168', '73.0562268', '2024-09-09 10:20:55'),
(458, 00000002, '31.378236', '73.0561962', '2024-09-09 10:21:05'),
(459, 00000002, '31.3782267', '73.0561988', '2024-09-09 10:21:14'),
(460, 00000002, '31.3782575', '73.0561677', '2024-09-09 10:21:31'),
(461, 00000002, '31.3782607', '73.0561786', '2024-09-09 10:21:36'),
(462, 00000002, '31.3782153', '73.0562102', '2024-09-09 10:21:46'),
(463, 00000002, '31.3782185', '73.0562054', '2024-09-09 10:21:56'),
(464, 00000002, '31.3782232', '73.0562026', '2024-09-09 10:22:06'),
(465, 00000002, '31.3782234', '73.0562024', '2024-09-09 10:22:15'),
(466, 00000002, '31.3782293', '73.0561952', '2024-09-09 10:22:26'),
(467, 00000002, '31.3782419', '73.0561957', '2024-09-09 10:22:34'),
(468, 00000002, '31.3782381', '73.056212', '2024-09-09 10:22:44'),
(469, 00000002, '31.3782529', '73.0561907', '2024-09-09 10:22:54'),
(470, 00000002, '31.3782317', '73.0562081', '2024-09-09 10:23:04'),
(471, 00000002, '31.3781887', '73.0562245', '2024-09-09 10:23:14'),
(472, 00000002, '31.3782549', '73.0561846', '2024-09-09 10:23:24'),
(473, 00000002, '31.3781921', '73.056223', '2024-09-09 10:23:34'),
(474, 00000002, '31.3782011', '73.0562188', '2024-09-09 10:23:44'),
(475, 00000002, '31.3782489', '73.0561878', '2024-09-09 10:23:54'),
(476, 00000002, '31.3782203', '73.0562137', '2024-09-09 10:24:04'),
(477, 00000002, '31.3782209', '73.0562122', '2024-09-09 10:24:14'),
(478, 00000002, '31.3782602', '73.0561818', '2024-09-09 10:24:24'),
(479, 00000002, '31.3781786', '73.0562306', '2024-09-09 10:24:34'),
(480, 00000002, '31.3782084', '73.0562144', '2024-09-09 10:24:44'),
(481, 00000002, '31.3782147', '73.0562087', '2024-09-09 10:24:54'),
(482, 00000002, '31.3782212', '73.0562034', '2024-09-09 10:25:04'),
(483, 00000002, '31.3782578', '73.0561817', '2024-09-09 10:25:17'),
(484, 00000002, '31.3781678', '73.0562397', '2024-09-09 10:25:27'),
(485, 00000002, '31.3781892', '73.0562224', '2024-09-09 10:25:37'),
(486, 00000002, '31.3782345', '73.0561961', '2024-09-09 10:25:44'),
(487, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(488, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(489, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(490, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(491, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(492, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(493, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(494, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(495, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(496, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(497, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(498, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:51'),
(499, 00000002, '31.3782603', '73.0561782', '2024-09-09 10:27:54'),
(500, 00000002, '31.3782608', '73.056179', '2024-09-09 10:28:07'),
(501, 00000002, '31.3782607', '73.056179', '2024-09-09 10:28:16'),
(502, 00000002, '31.378261', '73.0561795', '2024-09-09 10:28:26'),
(503, 00000002, '31.3782608', '73.0561795', '2024-09-09 10:28:36'),
(504, 00000002, '31.3782617', '73.0561801', '2024-09-09 10:28:46'),
(505, 00000002, '31.3782617', '73.0561801', '2024-09-09 10:28:56'),
(506, 00000002, '31.3782237', '73.0562061', '2024-09-09 10:29:07'),
(507, 00000002, '31.3782586', '73.0561804', '2024-09-09 10:29:16'),
(508, 00000002, '31.3781797', '73.0562306', '2024-09-09 10:29:27'),
(509, 00000002, '31.3782585', '73.0561741', '2024-09-09 10:29:37'),
(510, 00000001, '51.6132858', '-0.175658', '2024-09-09 14:49:09'),
(511, 00000001, '51.6132857', '-0.1756582', '2024-09-09 14:49:19'),
(512, 00000001, '51.6132857', '-0.1756582', '2024-09-09 14:49:29'),
(513, 00000001, '51.6132857', '-0.1756582', '2024-09-09 14:49:39'),
(514, 00000001, '51.6132857', '-0.1756582', '2024-09-09 14:49:49'),
(515, 00000001, '51.6132478', '-0.1757502', '2024-09-09 14:50:58'),
(516, 00000001, '51.6132478', '-0.1757502', '2024-09-09 14:50:58'),
(517, 00000001, '51.6132478', '-0.1757502', '2024-09-09 14:50:58'),
(518, 00000001, '51.6132478', '-0.1757502', '2024-09-09 14:50:58'),
(519, 00000001, '51.6132478', '-0.1757502', '2024-09-09 14:50:58'),
(520, 00000001, '51.6132478', '-0.1757502', '2024-09-09 14:50:58'),
(521, 00000001, '51.6132478', '-0.1757502', '2024-09-09 14:50:59'),
(522, 00000001, '51.6131791', '-0.1757245', '2024-09-09 14:51:09'),
(523, 00000001, '51.6132557', '-0.1756086', '2024-09-09 14:51:19'),
(524, 00000001, '51.6132671', '-0.1755938', '2024-09-09 14:51:29'),
(525, 00000001, '51.6132686', '-0.175594', '2024-09-09 14:51:39'),
(526, 00000001, '51.6132743', '-0.1756711', '2024-09-09 14:51:49'),
(527, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:51:59'),
(528, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:52:09'),
(529, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:52:19'),
(530, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:55:30'),
(531, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:55:30'),
(532, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:55:30'),
(533, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:55:30'),
(534, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:55:30'),
(535, 00000001, '51.6132756', '-0.1756888', '2024-09-09 14:55:30'),
(536, 00000001, '51.6132597', '-0.1757544', '2024-09-09 14:55:31'),
(537, 00000001, '51.6132566', '-0.175763', '2024-09-09 15:07:04'),
(538, 00000001, '51.6132566', '-0.175763', '2024-09-09 15:07:04'),
(539, 00000001, '51.6132566', '-0.175763', '2024-09-09 15:07:04'),
(540, 00000001, '51.6132337', '-0.1758461', '2024-09-09 15:07:05'),
(541, 00000001, '51.6132337', '-0.1758461', '2024-09-09 15:07:06'),
(542, 00000001, '51.6132437', '-0.1757655', '2024-09-09 15:07:14'),
(543, 00000001, '51.6132519', '-0.1757227', '2024-09-09 15:07:38'),
(544, 00000001, '51.6132519', '-0.1757227', '2024-09-09 15:07:38'),
(545, 00000001, '51.6132519', '-0.1757227', '2024-09-09 15:07:38'),
(546, 00000001, '51.6132519', '-0.1757227', '2024-09-09 15:07:38'),
(547, 00000001, '51.6131976', '-0.1757371', '2024-09-09 15:07:43'),
(548, 00000001, '51.6131827', '-0.1757579', '2024-09-09 15:07:44'),
(549, 00000001, '51.613285', '-0.1756379', '2024-09-09 15:07:53'),
(550, 00000001, '51.6132711', '-0.1756313', '2024-09-09 15:07:54'),
(551, 00000001, '51.6132637', '-0.17563', '2024-09-09 15:08:03'),
(552, 00000001, '51.6132665', '-0.1756337', '2024-09-09 15:08:04'),
(553, 00000001, '51.6132702', '-0.1756098', '2024-09-09 15:08:13'),
(554, 00000001, '51.6132702', '-0.17561', '2024-09-09 15:08:14'),
(555, 00000001, '51.6132702', '-0.1756101', '2024-09-09 15:08:23'),
(556, 00000001, '51.6132702', '-0.1756101', '2024-09-09 15:08:24'),
(557, 00000001, '51.6132702', '-0.1756101', '2024-09-09 15:08:33'),
(558, 00000001, '51.6132702', '-0.1756101', '2024-09-09 15:08:34'),
(559, 00000001, '51.6132702', '-0.1756101', '2024-09-09 15:09:05'),
(560, 00000001, '51.6132424', '-0.1757729', '2024-09-09 15:09:06'),
(561, 00000001, '51.6132424', '-0.1757729', '2024-09-09 15:09:06'),
(562, 00000001, '51.6132424', '-0.1757729', '2024-09-09 15:09:06'),
(563, 00000001, '51.6132424', '-0.1757729', '2024-09-09 15:09:06'),
(564, 00000001, '51.6132424', '-0.1757729', '2024-09-09 15:09:06'),
(565, 00000001, '51.6132435', '-0.1756168', '2024-09-09 15:09:13'),
(566, 00000001, '51.6132435', '-0.1756168', '2024-09-09 15:09:15'),
(567, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(568, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(569, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(570, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(571, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(572, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(573, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(574, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(575, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(576, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(577, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(578, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:10'),
(579, 00000001, '51.6132438', '-0.1757401', '2024-09-09 15:11:14'),
(580, 00000001, '51.6133773', '-0.1757273', '2024-09-10 16:46:37'),
(581, 00000001, '51.6133296', '-0.1757399', '2024-09-10 16:46:47'),
(582, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(583, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(584, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(585, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(586, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(587, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(588, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(589, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(590, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(591, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(592, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(593, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(594, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:09:58'),
(595, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:07'),
(596, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:13'),
(597, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:17'),
(598, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:22'),
(599, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:27'),
(600, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:33'),
(601, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:37'),
(602, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:42'),
(603, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:46'),
(604, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:52'),
(605, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:10:57'),
(606, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:11:02'),
(607, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:11:07'),
(608, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:11:12'),
(609, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:11:17'),
(610, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:11:22'),
(611, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:11:27'),
(612, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:11:38'),
(613, 00000001, '51.6133333', '-0.1757036', '2024-09-10 05:11:38'),
(614, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:03'),
(615, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:04'),
(616, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(617, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(618, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(619, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(620, 00000001, '51.6132629', '-0.1760076', '2024-09-10 05:57:05'),
(621, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(622, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(623, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(624, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(625, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(626, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(627, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(628, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(629, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(630, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(631, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(632, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(633, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:05'),
(634, 00000001, '51.6132629', '-0.1760076', '2024-09-10 05:57:05'),
(635, 00000001, '51.6132629', '-0.1760076', '2024-09-10 05:57:06'),
(636, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:06'),
(637, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:06'),
(638, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:06'),
(639, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:06'),
(640, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:06'),
(641, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:06'),
(642, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:06'),
(643, 00000001, '51.6132629', '-0.1760076', '2024-09-10 05:57:08'),
(644, 00000001, '51.6132407', '-0.1761576', '2024-09-10 05:57:19'),
(645, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(646, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(647, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(648, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(649, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(650, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(651, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(652, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(653, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(654, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(655, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(656, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(657, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(658, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(659, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(660, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(661, 00000001, '51.6133714', '-0.1759702', '2024-09-10 06:09:53'),
(662, 00000001, '51.6133714', '-0.1759702', '2024-09-10 06:09:53'),
(663, 00000001, '51.6133714', '-0.1759702', '2024-09-10 06:09:53'),
(664, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(665, 00000001, '51.6132722', '-0.1756581', '2024-09-10 06:09:53'),
(666, 00000001, '51.6133714', '-0.1759702', '2024-09-10 06:09:56'),
(667, 00000001, '51.6133891', '-0.1762677', '2024-09-10 06:10:15'),
(668, 00000001, '51.6133891', '-0.1762677', '2024-09-10 06:10:15'),
(669, 00000001, '51.6133891', '-0.1762677', '2024-09-10 06:10:17'),
(670, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:54'),
(671, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(672, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(673, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(674, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(675, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(676, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(677, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(678, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(679, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(680, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(681, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(682, 00000001, '51.6133226', '-0.1758215', '2024-09-10 06:12:55'),
(683, 00000001, '51.613326', '-0.1757284', '2024-09-10 06:12:58'),
(684, 00000001, '51.613375', '-0.1756444', '2024-09-10 06:13:02'),
(685, 00000001, '51.6132733', '-0.1756704', '2024-09-10 06:14:08'),
(686, 00000001, '51.6132733', '-0.1756704', '2024-09-10 06:14:08'),
(687, 00000001, '51.6132733', '-0.1756704', '2024-09-10 06:14:09'),
(688, 00000001, '51.6131809', '-0.1760721', '2024-09-10 06:14:09'),
(689, 00000001, '51.6131809', '-0.1760721', '2024-09-10 06:14:09'),
(690, 00000001, '51.6131809', '-0.1760721', '2024-09-10 06:14:09'),
(691, 00000001, '51.6133728', '-0.1756371', '2024-09-10 06:14:12'),
(692, 00000001, '51.6133714', '-0.1755688', '2024-09-10 06:14:18'),
(693, 00000001, '51.6133671', '-0.1755737', '2024-09-10 06:14:22'),
(694, 00000001, '51.6133587', '-0.1755877', '2024-09-10 06:14:28'),
(695, 00000001, '51.6133529', '-0.1756215', '2024-09-10 06:14:33'),
(696, 00000001, '51.5331088', '-0.325533', '2024-09-10 15:40:09'),
(697, 00000001, '51.5327654', '-0.3256738', '2024-09-10 15:41:24'),
(698, 00000001, '51.5331256', '-0.3254699', '2024-09-10 15:41:26'),
(699, 00000001, '51.5331256', '-0.3254699', '2024-09-10 15:41:26'),
(700, 00000001, '51.5331256', '-0.3254699', '2024-09-10 15:41:26'),
(701, 00000001, '51.5331256', '-0.3254699', '2024-09-10 15:41:26'),
(702, 00000001, '51.5331256', '-0.3254699', '2024-09-10 15:41:26'),
(703, 00000001, '51.5331256', '-0.3254699', '2024-09-10 15:41:26'),
(704, 00000001, '51.5331256', '-0.3254699', '2024-09-10 15:41:29'),
(705, 00000001, '51.5329764', '-0.3255141', '2024-09-10 15:41:39'),
(706, 00000001, '51.5329836', '-0.3255268', '2024-09-10 15:41:49'),
(707, 00000001, '51.5329911', '-0.3255545', '2024-09-10 15:41:59'),
(708, 00000001, '51.5330074', '-0.3255863', '2024-09-10 15:42:09'),
(709, 00000001, '51.533039', '-0.3256398', '2024-09-10 15:42:19'),
(710, 00000001, '51.5330523', '-0.3256581', '2024-09-10 15:42:29'),
(711, 00000001, '51.533047', '-0.325651', '2024-09-10 15:42:39'),
(712, 00000001, '51.5330301', '-0.3256533', '2024-09-10 15:42:49'),
(713, 00000001, '51.5330309', '-0.3256381', '2024-09-10 15:42:59'),
(714, 00000001, '51.5330131', '-0.3256508', '2024-09-10 15:43:09'),
(715, 00000001, '51.5330094', '-0.3256498', '2024-09-10 15:43:19'),
(716, 00000001, '51.5330044', '-0.3256445', '2024-09-10 15:43:29'),
(717, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(718, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(719, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(720, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(721, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(722, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(723, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(724, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(725, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(726, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(727, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:27'),
(728, 00000001, '51.5331378', '-0.3254711', '2024-09-10 15:45:29'),
(729, 00000001, '51.5328958', '-0.3256011', '2024-09-10 15:45:39'),
(730, 00000001, '51.5329994', '-0.3256423', '2024-09-10 15:45:49'),
(731, 00000001, '51.5329829', '-0.3255856', '2024-09-11 16:17:18'),
(732, 00000001, '51.5330066', '-0.3255804', '2024-09-11 16:17:28'),
(733, 00000001, '51.5330045', '-0.3255899', '2024-09-11 16:17:38'),
(734, 00000001, '51.5330042', '-0.3255898', '2024-09-11 16:17:48'),
(735, 00000001, '51.5330047', '-0.3255889', '2024-09-11 16:17:58'),
(736, 00000001, '51.5330034', '-0.3255885', '2024-09-11 16:18:08'),
(737, 00000001, '51.5330028', '-0.3255897', '2024-09-11 16:18:18'),
(738, 00000001, '51.5329892', '-0.3255953', '2024-09-11 16:18:28'),
(739, 00000001, '51.5329747', '-0.3255774', '2024-09-11 16:18:38'),
(740, 00000001, '51.532978', '-0.3255796', '2024-09-11 16:19:28'),
(741, 00000001, '51.5330948', '-0.3255177', '2024-09-11 16:19:29'),
(742, 00000001, '51.5330948', '-0.3255177', '2024-09-11 16:19:29'),
(743, 00000001, '51.5330948', '-0.3255177', '2024-09-11 16:19:29'),
(744, 00000001, '51.5330948', '-0.3255177', '2024-09-11 16:19:29'),
(745, 00000001, '51.5330746', '-0.3255375', '2024-09-11 16:19:48'),
(746, 00000001, '51.533049', '-0.3255779', '2024-09-11 16:19:58'),
(747, 00000001, '51.5330442', '-0.3255874', '2024-09-11 16:20:08'),
(748, 00000001, '51.5330442', '-0.3255874', '2024-09-11 16:20:18'),
(749, 00000001, '51.5330442', '-0.3255874', '2024-09-11 16:20:29'),
(750, 00000001, '51.5330442', '-0.3255874', '2024-09-11 16:20:38'),
(751, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(752, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(753, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(754, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(755, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(756, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(757, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(758, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(759, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(760, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(761, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(762, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(763, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(764, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(765, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(766, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(767, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:45'),
(768, 00000001, '51.5326215', '-0.3142492', '2024-09-11 16:24:48'),
(769, 00000001, '51.5323697', '-0.3126641', '2024-09-11 16:24:58'),
(770, 00000001, '51.5322663', '-0.3115097', '2024-09-11 16:25:08'),
(771, 00000001, '51.5321619', '-0.3107261', '2024-09-11 16:25:18'),
(772, 00000001, '51.5312064', '-0.3044672', '2024-09-11 16:26:29'),
(773, 00000001, '51.5312064', '-0.3044672', '2024-09-11 16:26:30'),
(774, 00000001, '51.5312064', '-0.3044672', '2024-09-11 16:26:30'),
(775, 00000001, '51.5312064', '-0.3044672', '2024-09-11 16:26:30'),
(776, 00000001, '51.5312064', '-0.3044672', '2024-09-11 16:26:30'),
(777, 00000001, '51.5311791', '-0.3032618', '2024-09-11 16:26:32'),
(778, 00000001, '51.5311791', '-0.3032618', '2024-09-11 16:26:32'),
(779, 00000001, '51.531069', '-0.301596', '2024-09-11 16:26:38'),
(780, 00000001, '51.5309536', '-0.3004118', '2024-09-11 16:26:48'),
(781, 00000001, '51.5307595', '-0.2992177', '2024-09-11 16:26:58'),
(782, 00000001, '51.530561', '-0.2979718', '2024-09-11 16:27:08'),
(783, 00000001, '51.53038', '-0.2966265', '2024-09-11 16:27:18'),
(784, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(785, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(786, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(787, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(788, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(789, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(790, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(791, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(792, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(793, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(794, 00000001, '51.5254616', '-0.2749646', '2024-09-11 16:29:30'),
(795, 00000001, '51.5254148', '-0.2749291', '2024-09-11 16:29:34'),
(796, 00000001, '51.5262675', '-0.2744966', '2024-09-11 16:29:35'),
(797, 00000001, '51.5261914', '-0.2739496', '2024-09-11 16:29:38'),
(798, 00000001, '51.5257993', '-0.2722982', '2024-09-11 16:29:48'),
(799, 00000001, '51.5252761', '-0.2705053', '2024-09-11 16:29:58'),
(800, 00000001, '51.5246683', '-0.2685267', '2024-09-11 16:30:08'),
(801, 00000001, '51.5240557', '-0.2665864', '2024-09-11 16:30:18'),
(802, 00000001, '51.5232025', '-0.2650816', '2024-09-11 16:30:28'),
(803, 00000001, '51.5223511', '-0.2641378', '2024-09-11 16:30:38'),
(804, 00000001, '51.5217191', '-0.2636738', '2024-09-11 16:30:48'),
(805, 00000001, '51.5209338', '-0.2632145', '2024-09-11 16:30:58'),
(806, 00000001, '51.5200899', '-0.2627445', '2024-09-11 16:31:08'),
(807, 00000001, '51.5191665', '-0.2621712', '2024-09-11 16:31:18'),
(808, 00000001, '51.5182607', '-0.2615674', '2024-09-11 16:31:28'),
(809, 00000001, '51.5173516', '-0.2609085', '2024-09-11 16:31:38'),
(810, 00000001, '51.5164732', '-0.259823', '2024-09-11 16:31:49'),
(811, 00000001, '51.515771', '-0.2583815', '2024-09-11 16:31:58'),
(812, 00000001, '51.5150025', '-0.2566175', '2024-09-11 16:32:08'),
(813, 00000001, '51.5144537', '-0.2547849', '2024-09-11 16:32:18'),
(814, 00000001, '51.5141574', '-0.2531892', '2024-09-11 16:32:28'),
(815, 00000001, '51.5139368', '-0.251169', '2024-09-11 16:32:39'),
(816, 00000001, '51.5139669', '-0.2489709', '2024-09-11 16:32:48'),
(817, 00000001, '51.5140946', '-0.2470542', '2024-09-11 16:32:58'),
(818, 00000001, '51.5141884', '-0.2452451', '2024-09-11 16:33:08'),
(819, 00000001, '51.5142835', '-0.2434371', '2024-09-11 16:33:18'),
(820, 00000001, '51.5143863', '-0.2416578', '2024-09-11 16:33:28'),
(821, 00000001, '51.5144123', '-0.2397455', '2024-09-11 16:33:38'),
(822, 00000001, '51.5143067', '-0.2378608', '2024-09-11 16:33:48'),
(823, 00000001, '51.5144044', '-0.2360913', '2024-09-11 16:33:58'),
(824, 00000001, '51.5145497', '-0.2342798', '2024-09-11 16:34:08'),
(825, 00000001, '51.5146899', '-0.2324864', '2024-09-11 16:34:18'),
(826, 00000001, '51.5148306', '-0.2307001', '2024-09-11 16:34:30'),
(827, 00000001, '51.5149819', '-0.2289049', '2024-09-11 16:34:38'),
(828, 00000001, '51.515132', '-0.2270981', '2024-09-11 16:34:48'),
(829, 00000001, '51.5152811', '-0.2252338', '2024-09-11 16:34:58'),
(830, 00000001, '51.5154686', '-0.2235056', '2024-09-11 16:35:08'),
(831, 00000001, '51.5155642', '-0.2220062', '2024-09-11 16:35:19'),
(832, 00000001, '51.5156584', '-0.2205034', '2024-09-11 16:35:28'),
(833, 00000001, '51.5157559', '-0.2189807', '2024-09-11 16:35:38'),
(834, 00000001, '51.5158258', '-0.2175211', '2024-09-11 16:35:48'),
(835, 00000001, '51.5160617', '-0.2160048', '2024-09-11 16:35:58'),
(836, 00000001, '51.5164803', '-0.2146067', '2024-09-11 16:36:08'),
(837, 00000001, '51.5169085', '-0.2134236', '2024-09-11 16:36:18'),
(838, 00000001, '51.517317', '-0.21219', '2024-09-11 16:36:28'),
(839, 00000001, '51.5176218', '-0.2109257', '2024-09-11 16:36:38'),
(840, 00000001, '51.5178217', '-0.2100292', '2024-09-11 16:36:48'),
(841, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(842, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(843, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(844, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(845, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(846, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(847, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(848, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(849, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(850, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(851, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(852, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(853, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(854, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(855, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(856, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(857, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(858, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(859, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(860, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(861, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(862, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(863, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(864, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(865, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(866, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(867, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(868, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(869, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(870, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(871, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(872, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(873, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(874, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(875, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(876, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(877, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(878, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(879, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(880, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(881, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(882, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(883, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(884, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(885, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(886, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(887, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(888, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(889, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(890, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(891, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(892, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(893, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(894, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(895, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(896, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(897, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(898, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(899, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(900, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(901, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(902, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(903, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(904, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(905, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(906, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(907, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(908, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(909, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(910, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(911, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(912, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(913, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(914, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(915, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(916, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(917, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(918, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(919, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(920, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(921, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(922, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(923, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(924, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(925, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(926, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(927, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(928, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(929, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(930, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(931, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(932, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(933, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(934, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(935, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(936, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(937, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(938, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(939, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(940, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(941, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(942, 00000001, '51.6674363', '-0.0178778', '2024-09-11 06:17:11'),
(943, 00000001, '51.6705612', '-0.0189099', '2024-09-11 06:19:20'),
(944, 00000001, '51.6705612', '-0.0189099', '2024-09-11 06:19:20'),
(945, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(946, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(947, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(948, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(949, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(950, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(951, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(952, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(953, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(954, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(955, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(956, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(957, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(958, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(959, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(960, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(961, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(962, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(963, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(964, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(965, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(966, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(967, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(968, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(969, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(970, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(971, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(972, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(973, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(974, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(975, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(976, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(977, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(978, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(979, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(980, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(981, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:22'),
(982, 00000001, '51.6616194', '-0.0294618', '2024-09-11 06:19:23'),
(983, 00000001, '51.6605386', '-0.0294473', '2024-09-11 06:19:31'),
(984, 00000001, '51.6605386', '-0.0294473', '2024-09-11 06:19:31'),
(985, 00000001, '51.660301', '-0.0294478', '2024-09-11 06:19:34'),
(986, 00000001, '51.6595383', '-0.0294958', '2024-09-11 06:19:41'),
(987, 00000001, '51.659431', '-0.0295116', '2024-09-11 06:19:41'),
(988, 00000001, '51.659227', '-0.0295393', '2024-09-11 06:19:44'),
(989, 00000001, '51.658448', '-0.0296377', '2024-09-11 06:19:51'),
(990, 00000001, '51.658448', '-0.0296377', '2024-09-11 06:19:51'),
(991, 00000001, '51.6582728', '-0.0296522', '2024-09-11 06:19:53'),
(992, 00000001, '51.6577036', '-0.0296409', '2024-09-11 06:20:01'),
(993, 00000001, '51.6576692', '-0.029641', '2024-09-11 06:20:01'),
(994, 00000001, '51.6576666', '-0.0296453', '2024-09-11 06:20:04'),
(995, 00000001, '51.6577087', '-0.0296484', '2024-09-11 06:20:11'),
(996, 00000001, '51.65771', '-0.0296486', '2024-09-11 06:20:11'),
(997, 00000001, '51.6577112', '-0.0296487', '2024-09-11 06:20:13'),
(998, 00000001, '51.6577084', '-0.0296515', '2024-09-11 06:20:21'),
(999, 00000001, '51.6577084', '-0.0296515', '2024-09-11 06:20:21'),
(1000, 00000001, '51.657637', '-0.0296362', '2024-09-11 06:20:24'),
(1001, 00000001, '51.6571327', '-0.0296057', '2024-09-11 06:20:31'),
(1002, 00000001, '51.6570391', '-0.0295976', '2024-09-11 06:20:32'),
(1003, 00000001, '51.6568676', '-0.0295816', '2024-09-11 06:20:33'),
(1004, 00000001, '51.6560714', '-0.0293163', '2024-09-11 06:20:41'),
(1005, 00000001, '51.6560714', '-0.0293163', '2024-09-11 06:20:41'),
(1006, 00000001, '51.6558715', '-0.029235', '2024-09-11 06:20:43'),
(1007, 00000001, '51.6551521', '-0.0289319', '2024-09-11 06:20:51'),
(1008, 00000001, '51.6550446', '-0.0288908', '2024-09-11 06:20:51'),
(1009, 00000001, '51.6548326', '-0.0288118', '2024-09-11 06:20:54'),
(1010, 00000001, '51.6541262', '-0.0284966', '2024-09-11 06:21:01'),
(1011, 00000001, '51.6541262', '-0.0284966', '2024-09-11 06:21:01'),
(1012, 00000001, '51.6539795', '-0.0285214', '2024-09-11 06:21:04'),
(1013, 00000001, '51.6532194', '-0.028639', '2024-09-11 06:21:11'),
(1014, 00000001, '51.6532194', '-0.028639', '2024-09-11 06:21:12'),
(1015, 00000001, '51.6530005', '-0.0286826', '2024-09-11 06:21:13'),
(1016, 00000001, '51.6521419', '-0.0289553', '2024-09-11 06:21:22'),
(1017, 00000001, '51.6521419', '-0.0289553', '2024-09-11 06:21:22'),
(1018, 00000001, '51.6519376', '-0.0290294', '2024-09-11 06:21:23'),
(1019, 00000001, '51.6513077', '-0.029223', '2024-09-11 06:21:31'),
(1020, 00000001, '51.6512283', '-0.0292518', '2024-09-11 06:21:32'),
(1021, 00000001, '51.6510629', '-0.029314', '2024-09-11 06:21:34'),
(1022, 00000001, '51.6504168', '-0.0295256', '2024-09-11 06:21:41'),
(1023, 00000001, '51.6503203', '-0.0295559', '2024-09-11 06:21:42'),
(1024, 00000001, '51.6501298', '-0.0296109', '2024-09-11 06:21:44'),
(1025, 00000001, '51.6493325', '-0.0298499', '2024-09-11 06:21:52'),
(1026, 00000001, '51.6493325', '-0.0298499', '2024-09-11 06:21:52'),
(1027, 00000001, '51.6491384', '-0.0298955', '2024-09-11 06:21:53'),
(1028, 00000001, '51.6484237', '-0.0299731', '2024-09-11 06:22:01'),
(1029, 00000001, '51.6484237', '-0.0299731', '2024-09-11 06:22:01'),
(1030, 00000001, '51.6482714', '-0.0300604', '2024-09-11 06:22:03'),
(1031, 00000001, '51.647532', '-0.0303842', '2024-09-11 06:22:11'),
(1032, 00000001, '51.647532', '-0.0303842', '2024-09-11 06:22:11'),
(1033, 00000001, '51.6473426', '-0.0304833', '2024-09-11 06:22:13'),
(1034, 00000001, '51.6465948', '-0.0309161', '2024-09-11 06:22:21'),
(1035, 00000001, '51.6465948', '-0.0309161', '2024-09-11 06:22:22'),
(1036, 00000001, '51.6464061', '-0.0310288', '2024-09-11 06:22:23'),
(1037, 00000001, '51.6456696', '-0.0314779', '2024-09-11 06:22:31'),
(1038, 00000001, '51.6456696', '-0.0314779', '2024-09-11 06:22:32'),
(1039, 00000001, '51.6455079', '-0.0316133', '2024-09-11 06:22:33'),
(1040, 00000001, '51.644809', '-0.0322066', '2024-09-11 06:22:41'),
(1041, 00000001, '51.644809', '-0.0322066', '2024-09-11 06:22:42'),
(1042, 00000001, '51.6446415', '-0.0322615', '2024-09-11 06:22:44'),
(1043, 00000001, '51.644273', '-0.033101', '2024-09-11 06:22:51'),
(1044, 00000001, '51.644273', '-0.033101', '2024-09-11 06:22:52'),
(1045, 00000001, '51.6441333', '-0.033293', '2024-09-11 06:22:54'),
(1046, 00000001, '51.6435203', '-0.0339063', '2024-09-11 06:23:01'),
(1047, 00000001, '51.6434167', '-0.0339768', '2024-09-11 06:23:02'),
(1048, 00000001, '51.643208', '-0.0341151', '2024-09-11 06:23:04'),
(1049, 00000001, '51.6424395', '-0.0345509', '2024-09-11 06:23:11'),
(1050, 00000001, '51.6424395', '-0.0345509', '2024-09-11 06:23:12'),
(1051, 00000001, '51.642233', '-0.0346687', '2024-09-11 06:23:13'),
(1052, 00000001, '51.6413702', '-0.0351108', '2024-09-11 06:23:21'),
(1053, 00000001, '51.6413702', '-0.0351108', '2024-09-11 06:23:21'),
(1054, 00000001, '51.6411779', '-0.035208', '2024-09-11 06:23:23'),
(1055, 00000001, '51.640464', '-0.0355443', '2024-09-11 06:23:31'),
(1056, 00000001, '51.640464', '-0.0355443', '2024-09-11 06:23:31'),
(1057, 00000001, '51.640289', '-0.0356378', '2024-09-11 06:23:33'),
(1058, 00000001, '51.6394966', '-0.0360296', '2024-09-11 06:23:41'),
(1059, 00000001, '51.6394966', '-0.0360296', '2024-09-11 06:23:41'),
(1060, 00000001, '51.6392935', '-0.03612', '2024-09-11 06:23:43'),
(1061, 00000001, '51.6384426', '-0.0365039', '2024-09-11 06:23:51'),
(1062, 00000001, '51.6384426', '-0.0365039', '2024-09-11 06:23:51'),
(1063, 00000001, '51.6382353', '-0.0365777', '2024-09-11 06:23:53'),
(1064, 00000001, '51.6374602', '-0.0368273', '2024-09-11 06:24:01'),
(1065, 00000001, '51.6373485', '-0.0368689', '2024-09-11 06:24:01'),
(1066, 00000001, '51.637239', '-0.0369125', '2024-09-11 06:24:03'),
(1067, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1068, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1069, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1070, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1071, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1072, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1073, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1074, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1075, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1076, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1077, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1078, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1079, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1080, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1081, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1082, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1083, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1084, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1085, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1086, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1087, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1088, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1089, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1090, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1091, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1092, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1093, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1094, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1095, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1096, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1097, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1098, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1099, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1100, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1101, 00000001, '51.6219442', '-0.0445563', '2024-09-11 06:26:19'),
(1102, 00000001, '51.6221361', '-0.0449867', '2024-09-11 06:26:22'),
(1103, 00000001, '51.6220646', '-0.0441921', '2024-09-11 06:26:28'),
(1104, 00000001, '51.6220646', '-0.0441921', '2024-09-11 06:26:28'),
(1105, 00000001, '51.6220646', '-0.0441921', '2024-09-11 06:26:28'),
(1106, 00000001, '51.6220646', '-0.0441921', '2024-09-11 06:26:28'),
(1107, 00000001, '51.6220646', '-0.0441921', '2024-09-11 06:26:28'),
(1108, 00000001, '51.6220646', '-0.0441921', '2024-09-11 06:26:28'),
(1109, 00000001, '51.6218539', '-0.0443423', '2024-09-11 06:26:31'),
(1110, 00000001, '51.6218539', '-0.0443423', '2024-09-11 06:26:31'),
(1111, 00000001, '51.6216357', '-0.0444419', '2024-09-11 06:26:33'),
(1112, 00000001, '51.6208441', '-0.0448361', '2024-09-11 06:26:41'),
(1113, 00000001, '51.6208441', '-0.0448361', '2024-09-11 06:26:42'),
(1114, 00000001, '51.6206379', '-0.0449361', '2024-09-11 06:26:44'),
(1115, 00000001, '51.6197873', '-0.0453333', '2024-09-11 06:26:51'),
(1116, 00000001, '51.6197873', '-0.0453333', '2024-09-11 06:26:52'),
(1117, 00000001, '51.619574', '-0.0454395', '2024-09-11 06:26:54'),
(1118, 00000001, '51.6187311', '-0.0458547', '2024-09-11 06:27:03'),
(1119, 00000001, '51.6188331', '-0.0458024', '2024-09-11 06:27:03'),
(1120, 00000001, '51.6185259', '-0.0459547', '2024-09-11 06:27:03'),
(1121, 00000001, '51.617682', '-0.0462979', '2024-09-11 06:27:11'),
(1122, 00000001, '51.617682', '-0.0462979', '2024-09-11 06:27:11'),
(1123, 00000001, '51.6174729', '-0.04641', '2024-09-11 06:27:14'),
(1124, 00000001, '51.6166566', '-0.0468191', '2024-09-11 06:27:22'),
(1125, 00000001, '51.6166566', '-0.0468191', '2024-09-11 06:27:22'),
(1126, 00000001, '51.6166566', '-0.0468191', '2024-09-11 06:27:23'),
(1127, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1128, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1129, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1130, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1131, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1132, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1133, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1134, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1135, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1136, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1137, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1138, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:41'),
(1139, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1140, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1141, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1142, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1143, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1144, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1145, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1146, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1147, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1148, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1149, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1150, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1151, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1152, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1153, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1154, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1155, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1156, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1157, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1158, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1159, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1160, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1161, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1162, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1163, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1164, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1165, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1166, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1167, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1168, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1169, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1170, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1171, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1172, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1173, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1174, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1175, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1176, 00000001, '51.6151028', '-0.0635013', '2024-09-11 06:30:42'),
(1177, 00000001, '51.6148008', '-0.0635392', '2024-09-11 06:30:47'),
(1178, 00000001, '51.6148008', '-0.0635392', '2024-09-11 06:30:47'),
(1179, 00000001, '51.6148008', '-0.0635392', '2024-09-11 06:30:47'),
(1180, 00000001, '51.6148008', '-0.0635392', '2024-09-11 06:30:47'),
(1181, 00000001, '51.6148008', '-0.0635392', '2024-09-11 06:30:47'),
(1182, 00000001, '51.6148008', '-0.0635392', '2024-09-11 06:30:47'),
(1183, 00000001, '51.6151844', '-0.0662271', '2024-09-11 06:34:12'),
(1184, 00000001, '51.6151844', '-0.0662271', '2024-09-11 06:34:12'),
(1185, 00000001, '51.6151844', '-0.0662271', '2024-09-11 06:34:12'),
(1186, 00000001, '51.6151844', '-0.0662271', '2024-09-11 06:34:12'),
(1187, 00000001, '51.6151844', '-0.0662271', '2024-09-11 06:34:12'),
(1188, 00000001, '51.6151844', '-0.0662271', '2024-09-11 06:34:12'),
(1189, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1190, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1191, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1192, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1193, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1194, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1195, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1196, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1197, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1198, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1199, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1200, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1201, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1202, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1203, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1204, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1205, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1206, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1207, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1208, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1209, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1210, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1211, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1212, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1213, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1214, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1215, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1216, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1217, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1218, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1219, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1220, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1221, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1222, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1223, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1224, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1225, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1226, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1227, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1228, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1229, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1230, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1231, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1232, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1233, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1234, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1235, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1236, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1237, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1238, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1239, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1240, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:13'),
(1241, 00000001, '51.6127981', '-0.1068252', '2024-09-11 06:34:14'),
(1242, 00000001, '51.6120887', '-0.1080248', '2024-09-11 06:34:21'),
(1243, 00000001, '51.6120822', '-0.1081931', '2024-09-11 06:34:21'),
(1244, 00000001, '51.6121013', '-0.1085141', '2024-09-11 06:34:24'),
(1245, 00000001, '51.6122747', '-0.1099215', '2024-09-11 06:34:31'),
(1246, 00000001, '51.6122747', '-0.1099215', '2024-09-11 06:34:31'),
(1247, 00000001, '51.6123059', '-0.1102459', '2024-09-11 06:34:33'),
(1248, 00000001, '51.6124583', '-0.1116521', '2024-09-11 06:34:41'),
(1249, 00000001, '51.6124583', '-0.1116521', '2024-09-11 06:34:41'),
(1250, 00000001, '51.6124806', '-0.1118472', '2024-09-11 06:34:43'),
(1251, 00000002, '31.3780907', '73.0564083', '2024-09-11 11:20:45'),
(1252, 00000002, '31.3781061', '73.0563708', '2024-09-11 11:20:55'),
(1253, 00000002, '31.3781595', '73.0562983', '2024-09-11 11:21:05'),
(1254, 00000002, '31.378158', '73.0563095', '2024-09-11 11:21:15'),
(1255, 00000002, '31.3781566', '73.0563074', '2024-09-11 11:21:25'),
(1256, 00000002, '31.3781068', '73.0563692', '2024-09-11 11:22:57'),
(1257, 00000002, '31.3781371', '73.0562973', '2024-09-11 12:02:13'),
(1258, 00000002, '31.378141', '73.0562929', '2024-09-11 12:02:22'),
(1259, 00000002, '31.3781397', '73.0562945', '2024-09-11 12:02:32'),
(1260, 00000002, '31.3781385', '73.0562937', '2024-09-11 12:02:42'),
(1261, 00000002, '31.3781343', '73.0562972', '2024-09-11 12:02:52'),
(1262, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1263, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1264, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1265, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1266, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1267, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1268, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1269, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1270, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1271, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1272, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1273, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1274, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1275, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1276, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1277, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1278, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1279, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1280, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1281, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1282, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1283, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1284, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1285, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1286, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1287, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1288, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:07'),
(1289, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1290, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1291, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1292, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1293, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1294, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1295, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1296, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1297, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1298, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1299, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1300, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1301, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1302, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1303, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1304, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1305, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1306, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1307, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1308, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1309, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1310, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1311, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1312, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1313, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1314, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1315, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1316, 00000002, '31.3780652', '73.0564125', '2024-09-11 12:12:08'),
(1317, 00000002, '31.3781141', '73.0563402', '2024-09-11 12:12:47'),
(1318, 00000002, '31.3781455', '73.0563025', '2024-09-11 12:12:50'),
(1319, 00000002, '31.3781455', '73.0563025', '2024-09-11 12:12:50'),
(1320, 00000002, '31.3781455', '73.0563025', '2024-09-11 12:12:50'),
(1321, 00000002, '31.3781421', '73.0563', '2024-09-11 12:12:55'),
(1322, 00000002, '31.3781379', '73.0563054', '2024-09-11 12:13:02'),
(1323, 00000002, '31.3781381', '73.0563063', '2024-09-11 12:13:12'),
(1324, 00000002, '31.3781312', '73.0563223', '2024-09-11 12:13:22'),
(1325, 00000002, '31.3781154', '73.0563262', '2024-09-11 12:13:32'),
(1326, 00000002, '31.3781191', '73.0563205', '2024-09-11 12:13:42'),
(1327, 00000002, '31.3781143', '73.0563276', '2024-09-11 12:13:52'),
(1328, 00000002, '31.3780484', '73.0564159', '2024-09-11 12:14:02'),
(1329, 00000002, '31.3780793', '73.0563807', '2024-09-11 12:14:12'),
(1330, 00000002, '31.3781143', '73.0563336', '2024-09-11 12:14:22'),
(1331, 00000002, '31.3781796', '73.056262', '2024-09-11 12:14:32'),
(1332, 00000002, '31.3781295', '73.0563149', '2024-09-11 12:14:42'),
(1333, 00000002, '31.3781241', '73.0563238', '2024-09-11 12:14:52'),
(1334, 00000002, '31.3781269', '73.0563128', '2024-09-11 12:15:02'),
(1335, 00000002, '31.3781215', '73.0563278', '2024-09-11 12:15:12'),
(1336, 00000002, '31.3781177', '73.0563323', '2024-09-11 12:15:22'),
(1337, 00000002, '31.3781172', '73.0563326', '2024-09-11 12:15:32'),
(1338, 00000002, '31.3781161', '73.0563337', '2024-09-11 12:15:42'),
(1339, 00000002, '31.378067', '73.0564002', '2024-09-11 12:15:52'),
(1340, 00000002, '31.3780963', '73.0563354', '2024-09-11 12:16:02'),
(1341, 00000002, '31.3781142', '73.0563306', '2024-09-11 12:16:12'),
(1342, 00000002, '31.3781185', '73.0563292', '2024-09-11 12:16:22'),
(1343, 00000002, '31.378118', '73.0563291', '2024-09-11 12:16:32'),
(1344, 00000002, '31.3781182', '73.0563288', '2024-09-11 12:16:42'),
(1345, 00000002, '31.3781166', '73.0563312', '2024-09-11 12:16:52'),
(1346, 00000002, '31.3781155', '73.0563326', '2024-09-11 12:17:02'),
(1347, 00000002, '31.3781173', '73.0563295', '2024-09-11 12:17:12'),
(1348, 00000002, '31.3781273', '73.0563108', '2024-09-11 12:17:23'),
(1349, 00000002, '31.3781195', '73.056332', '2024-09-11 12:18:31'),
(1350, 00000002, '31.3781195', '73.056332', '2024-09-11 12:18:31'),
(1351, 00000002, '31.3781195', '73.056332', '2024-09-11 12:18:31'),
(1352, 00000002, '31.3781195', '73.056332', '2024-09-11 12:18:31'),
(1353, 00000002, '31.3781195', '73.056332', '2024-09-11 12:18:31'),
(1354, 00000002, '31.3781195', '73.056332', '2024-09-11 12:18:31'),
(1355, 00000002, '31.3781172', '73.0563151', '2024-09-11 12:18:32'),
(1356, 00000002, '31.3781352', '73.056296', '2024-09-11 12:18:42'),
(1357, 00000002, '31.3781452', '73.0562882', '2024-09-11 12:18:52'),
(1358, 00000002, '31.3781435', '73.0562887', '2024-09-11 12:19:02'),
(1359, 00000002, '31.3781493', '73.0562832', '2024-09-11 12:19:12'),
(1360, 00000002, '31.3781514', '73.0562785', '2024-09-11 12:19:22'),
(1361, 00000002, '31.378147', '73.0562821', '2024-09-11 12:19:32'),
(1362, 00000002, '31.3781391', '73.0562892', '2024-09-11 12:19:42'),
(1363, 00000002, '31.3781754', '73.0562542', '2024-09-11 12:19:52'),
(1364, 00000002, '31.3781429', '73.0562843', '2024-09-11 12:20:02'),
(1365, 00000002, '31.3781464', '73.0562801', '2024-09-11 12:20:12'),
(1366, 00000002, '31.3781473', '73.0562776', '2024-09-11 12:20:22'),
(1367, 00000002, '31.3781484', '73.0562755', '2024-09-11 12:20:34'),
(1368, 00000002, '31.3781497', '73.0562723', '2024-09-11 12:20:42'),
(1369, 00000002, '31.3781489', '73.0562719', '2024-09-11 12:20:52'),
(1370, 00000002, '31.3781504', '73.0562686', '2024-09-11 12:21:02'),
(1371, 00000002, '31.3781508', '73.0562672', '2024-09-11 12:21:12'),
(1372, 00000002, '31.37815', '73.0562677', '2024-09-11 12:21:22'),
(1373, 00000002, '31.3781508', '73.0562656', '2024-09-11 12:21:32'),
(1374, 00000002, '31.3781521', '73.0562633', '2024-09-11 12:21:43'),
(1375, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1376, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1377, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1378, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1379, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1380, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1381, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1382, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1383, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1384, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1385, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1386, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1387, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1388, 00000002, '31.3781452', '73.0562863', '2024-09-12 10:36:27'),
(1389, 00000002, '31.3781332', '73.0563106', '2024-09-12 10:36:31'),
(1390, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:42'),
(1391, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:42'),
(1392, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1393, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1394, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1395, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1396, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1397, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1398, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1399, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1400, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1401, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1402, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1403, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1404, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1405, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1406, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1407, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1408, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1409, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1410, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1411, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1412, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1413, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1414, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1415, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1416, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:43'),
(1417, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:44'),
(1418, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:44'),
(1419, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:44'),
(1420, 00000002, '31.3780896', '73.0563856', '2024-09-12 10:41:44'),
(1421, 00000002, '31.3780438', '73.0564486', '2024-09-12 12:54:53'),
(1422, 00000002, '31.3780258', '73.0564348', '2024-09-12 12:55:02'),
(1423, 00000002, '31.3780233', '73.0564383', '2024-09-12 12:55:12'),
(1424, 00000002, '31.378058', '73.0564151', '2024-09-12 12:55:23'),
(1425, 00000002, '31.3780394', '73.0564491', '2024-09-12 12:55:33'),
(1426, 00000002, '31.3780435', '73.0564422', '2024-09-12 12:55:43'),
(1427, 00000002, '31.3780486', '73.0564315', '2024-09-12 12:55:53'),
(1428, 00000002, '31.3780346', '73.0564497', '2024-09-12 12:56:03'),
(1429, 00000002, '31.3780364', '73.0564437', '2024-09-12 12:56:13'),
(1430, 00000002, '31.3780312', '73.0564471', '2024-09-12 12:56:23'),
(1431, 00000002, '31.378031', '73.0564421', '2024-09-12 12:56:31'),
(1432, 00000002, '31.378036', '73.056448', '2024-09-12 12:56:41'),
(1433, 00000002, '31.378031', '73.056444', '2024-09-12 12:56:51'),
(1434, 00000002, '31.3780316', '73.0564392', '2024-09-12 12:57:03'),
(1435, 00000002, '31.3780304', '73.0564446', '2024-09-12 12:57:11'),
(1436, 00000002, '31.3780296', '73.0564457', '2024-09-12 12:57:21'),
(1437, 00000002, '31.378036', '73.0564501', '2024-09-12 12:57:31'),
(1438, 00000002, '31.3780328', '73.0564494', '2024-09-12 12:58:08'),
(1439, 00000001, '51.6133584', '-0.1754485', '2024-09-13 16:52:45'),
(1440, 00000001, '51.6132717', '-0.1754907', '2024-09-13 16:53:46'),
(1441, 00000001, '51.6132717', '-0.1754907', '2024-09-13 16:53:46'),
(1442, 00000001, '51.6132717', '-0.1754907', '2024-09-13 16:53:46'),
(1443, 00000001, '51.6132717', '-0.1754907', '2024-09-13 16:53:46'),
(1444, 00000001, '51.6132717', '-0.1754907', '2024-09-13 16:53:46'),
(1445, 00000001, '51.6132717', '-0.1754907', '2024-09-13 16:53:46'),
(1446, 00000001, '51.6133397', '-0.1754355', '2024-09-13 16:53:55'),
(1447, 00000001, '51.6133608', '-0.1754868', '2024-09-13 16:54:05'),
(1448, 00000001, '51.5180544', '-0.4075907', '2024-09-13 11:09:36'),
(1449, 00000001, '51.5180544', '-0.4075907', '2024-09-13 11:09:36'),
(1450, 00000001, '51.5180544', '-0.4075907', '2024-09-13 11:09:36'),
(1451, 00000001, '51.5180544', '-0.4075907', '2024-09-13 11:09:36'),
(1452, 00000001, '51.5180544', '-0.4075907', '2024-09-13 11:09:36'),
(1453, 00000001, '51.5180544', '-0.4075907', '2024-09-13 11:09:36'),
(1454, 00000001, '51.5178781', '-0.4071327', '2024-09-13 11:09:43'),
(1455, 00000001, '51.5179665', '-0.4075951', '2024-09-13 11:09:54'),
(1456, 00000001, '51.5179651', '-0.4076118', '2024-09-13 11:10:04'),
(1457, 00000002, '31.4412815', '73.0882559', '2024-09-14 13:17:44'),
(1458, 00000002, '31.4414616', '73.0883022', '2024-09-14 13:17:44'),
(1459, 00000002, '31.4414616', '73.0883022', '2024-09-14 13:17:44'),
(1460, 00000002, '31.4414616', '73.0883022', '2024-09-14 13:17:54'),
(1461, 00000002, '31.4423771', '73.0885373', '2024-09-14 13:18:04'),
(1462, 00000002, '31.4428764', '73.0886656', '2024-09-14 13:18:14'),
(1463, 00000002, '31.4425082', '73.088571', '2024-09-14 13:18:24'),
(1464, 00000002, '31.4426527', '73.0886081', '2024-09-14 13:18:34'),
(1465, 00000002, '31.4421593', '73.0884814', '2024-09-14 13:18:44'),
(1466, 00000002, '31.4425503', '73.0885818', '2024-09-14 13:18:54'),
(1467, 00000002, '31.4426933', '73.0886185', '2024-09-14 13:19:04'),
(1468, 00000002, '31.442258', '73.0885067', '2024-09-14 13:19:14'),
(1469, 00000002, '31.4417167', '73.0883677', '2024-09-14 13:19:24'),
(1470, 00000002, '31.4413981', '73.0882859', '2024-09-14 13:19:34'),
(1471, 00000002, '31.4412818', '73.088256', '2024-09-14 13:19:44'),
(1472, 00000002, '31.441278', '73.0882551', '2024-09-14 13:19:54'),
(1473, 00000002, '31.4413223', '73.0882664', '2024-09-14 13:20:05'),
(1474, 00000002, '31.4413755', '73.0882801', '2024-09-14 13:20:14'),
(1475, 00000002, '31.4414192', '73.0882913', '2024-09-14 13:20:24'),
(1476, 00000002, '31.4414479', '73.0882987', '2024-09-14 13:20:34'),
(1477, 00000002, '31.4414631', '73.0883026', '2024-09-14 13:20:44'),
(1478, 00000002, '31.4424777', '73.0885631', '2024-09-14 13:20:54'),
(1479, 00000002, '31.4421218', '73.0884717', '2024-09-14 13:21:04'),
(1480, 00000002, '31.4417173', '73.0883679', '2024-09-14 13:21:14'),
(1481, 00000002, '31.4425082', '73.088571', '2024-09-14 13:21:24'),
(1482, 00000002, '31.4426901', '73.0886177', '2024-09-14 13:21:35'),
(1483, 00000002, '31.4421618', '73.088482', '2024-09-14 13:21:45'),
(1484, 00000002, '31.4416443', '73.0883491', '2024-09-14 13:21:55'),
(1485, 00000002, '31.4413731', '73.0882795', '2024-09-14 13:22:05'),
(1486, 00000002, '31.441283', '73.0882563', '2024-09-14 13:22:15'),
(1487, 00000002, '31.4412899', '73.0882581', '2024-09-14 13:22:25'),
(1488, 00000002, '31.4413359', '73.0882699', '2024-09-14 13:22:35'),
(1489, 00000002, '31.4413865', '73.0882829', '2024-09-14 13:22:45'),
(1490, 00000002, '31.4414263', '73.0882931', '2024-09-14 13:22:55'),
(1491, 00000002, '31.4414515', '73.0882996', '2024-09-14 13:23:05'),
(1492, 00000002, '31.4414644', '73.0883029', '2024-09-14 13:23:15'),
(1493, 00000002, '31.441469', '73.0883041', '2024-09-14 13:23:25'),
(1494, 00000002, '31.441469', '73.0883041', '2024-09-14 13:23:35'),
(1495, 00000002, '31.4414672', '73.0883036', '2024-09-14 13:23:45'),
(1496, 00000002, '31.441465', '73.0883031', '2024-09-14 13:23:55'),
(1497, 00000002, '31.4414633', '73.0883026', '2024-09-14 13:24:05'),
(1498, 00000002, '31.4414621', '73.0883023', '2024-09-14 13:24:15'),
(1499, 00000002, '31.4414615', '73.0883022', '2024-09-14 13:24:25'),
(1500, 00000002, '31.4414613', '73.0883021', '2024-09-14 13:24:36'),
(1501, 00000002, '31.4414613', '73.0883021', '2024-09-14 13:24:46'),
(1502, 00000002, '31.4414614', '73.0883021', '2024-09-14 13:24:56'),
(1503, 00000002, '31.4414614', '73.0883022', '2024-09-14 13:25:06'),
(1504, 00000002, '31.4414615', '73.0883022', '2024-09-14 13:25:16'),
(1505, 00000002, '31.4424713', '73.0885615', '2024-09-14 13:25:26'),
(1506, 00000002, '31.4421132', '73.0884695', '2024-09-14 13:25:36'),
(1507, 00000002, '31.441711', '73.0883662', '2024-09-14 13:25:46'),
(1508, 00000002, '31.4414707', '73.0883045', '2024-09-14 13:25:57'),
(1509, 00000002, '31.4413694', '73.0882785', '2024-09-14 13:26:06'),
(1510, 00000002, '31.4413506', '73.0882737', '2024-09-14 13:26:16'),
(1511, 00000002, '31.4413706', '73.0882788', '2024-09-14 13:26:26'),
(1512, 00000002, '31.4414018', '73.0882868', '2024-09-14 13:26:36'),
(1513, 00000002, '31.4414297', '73.088294', '2024-09-14 13:26:46'),
(1514, 00000002, '31.4414492', '73.088299', '2024-09-14 13:26:56'),
(1515, 00000002, '31.4414603', '73.0883019', '2024-09-14 13:27:07'),
(1516, 00000002, '31.4414653', '73.0883031', '2024-09-14 13:27:17'),
(1517, 00000002, '31.4414666', '73.0883035', '2024-09-14 13:27:26'),
(1518, 00000002, '31.4424927', '73.088567', '2024-09-14 13:27:37'),
(1519, 00000002, '31.4423517', '73.0885308', '2024-09-14 13:27:48'),
(1520, 00000002, '31.4419647', '73.0884314', '2024-09-14 13:27:57'),
(1521, 00000002, '31.4416287', '73.0883451', '2024-09-14 13:28:07'),
(1522, 00000002, '31.4414405', '73.0882968', '2024-09-14 13:28:17'),
(1523, 00000002, '31.4424393', '73.0885533', '2024-09-14 13:28:27'),
(1524, 00000002, '31.4427271', '73.0886272', '2024-09-14 13:28:37'),
(1525, 00000002, '31.4425179', '73.0885735', '2024-09-14 13:28:47'),
(1526, 00000002, '31.4421598', '73.0884815', '2024-09-14 13:28:57'),
(1527, 00000002, '31.4418473', '73.0884013', '2024-09-14 13:29:07'),
(1528, 00000002, '31.4397567', '73.089955', '2024-09-14 13:29:09'),
(1529, 00000002, '31.4397567', '73.089955', '2024-09-14 13:29:09'),
(1530, 00000002, '31.441632', '73.088879', '2024-09-14 13:29:18'),
(1531, 00000002, '31.4416765', '73.088776', '2024-09-14 13:29:28'),
(1532, 00000002, '31.4416796', '73.088741', '2024-09-14 13:29:38'),
(1533, 00000002, '31.4416853', '73.0886957', '2024-09-14 13:29:48'),
(1534, 00000002, '31.441829', '73.0885053', '2024-09-14 13:29:58'),
(1535, 00000002, '31.4417395', '73.0885546', '2024-09-14 13:30:08'),
(1536, 00000002, '31.4417317', '73.0885682', '2024-09-14 13:30:17'),
(1537, 00000002, '31.4417229', '73.0885659', '2024-09-14 13:30:27'),
(1538, 00000002, '31.4417027', '73.0887395', '2024-09-14 13:30:37'),
(1539, 00000002, '31.4415203', '73.0885623', '2024-09-14 13:30:47'),
(1540, 00000002, '31.4415233', '73.0885668', '2024-09-14 13:30:57'),
(1541, 00000002, '31.4414347', '73.088677', '2024-09-14 13:31:07'),
(1542, 00000002, '31.4413722', '73.0886603', '2024-09-14 13:31:17'),
(1543, 00000002, '31.4413717', '73.0886565', '2024-09-14 13:31:27'),
(1544, 00000002, '31.4414027', '73.0886798', '2024-09-14 13:31:37'),
(1545, 00000002, '31.4415323', '73.08875', '2024-09-14 13:31:47'),
(1546, 00000002, '31.441624', '73.08886', '2024-09-14 13:31:57'),
(1547, 00000002, '31.4416671', '73.088997', '2024-09-14 13:32:07'),
(1548, 00000002, '31.4416993', '73.0890753', '2024-09-14 13:32:17'),
(1549, 00000002, '31.4416983', '73.089077', '2024-09-14 13:32:27'),
(1550, 00000002, '31.4416983', '73.0890767', '2024-09-14 13:32:37'),
(1551, 00000002, '31.4416983', '73.0890767', '2024-09-14 13:32:47'),
(1552, 00000001, '51.5628562', '-0.2038639', '2024-09-17 14:35:41'),
(1553, 00000001, '51.5628561', '-0.2038639', '2024-09-17 14:35:51'),
(1554, 00000001, '51.5628729', '-0.2038714', '2024-09-17 14:36:01'),
(1555, 00000001, '51.5628789', '-0.2038744', '2024-09-17 14:36:11'),
(1556, 00000001, '51.5628708', '-0.2038767', '2024-09-17 14:36:26'),
(1557, 00000001, '51.5628693', '-0.2038733', '2024-09-17 14:36:31'),
(1558, 00000001, '51.5628907', '-0.2038601', '2024-09-17 14:36:42'),
(1559, 00000001, '51.5628906', '-0.2038604', '2024-09-17 14:36:52'),
(1560, 00000001, '51.5628906', '-0.2038605', '2024-09-17 14:37:02'),
(1561, 00000001, '51.5628945', '-0.2038625', '2024-09-17 14:37:11'),
(1562, 00000001, '51.5628933', '-0.2038676', '2024-09-17 14:37:22'),
(1563, 00000001, '51.5628928', '-0.2038716', '2024-09-17 14:37:31'),
(1564, 00000002, '31.3781527', '73.0562911', '2024-09-26 11:45:30'),
(1565, 00000002, '31.3781527', '73.0562911', '2024-09-26 11:45:30'),
(1566, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1567, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1568, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1569, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1570, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1571, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1572, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1573, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1574, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1575, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1576, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1577, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1578, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1579, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1580, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1581, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1582, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1583, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1584, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1585, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1586, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1587, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1588, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1589, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1590, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1591, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1592, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1593, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1594, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1595, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1596, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1597, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1598, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1599, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1600, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1601, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1602, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1603, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1604, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1605, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1606, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1607, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1608, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1609, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1610, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1611, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1612, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1613, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1614, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1615, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1616, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1617, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1618, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1619, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1620, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1621, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1622, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1623, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:09'),
(1624, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1625, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1626, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1627, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1628, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1629, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1630, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1631, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1632, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1633, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1634, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1635, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1636, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1637, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1638, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1639, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1640, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1641, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1642, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1643, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1644, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1645, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1646, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1647, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1648, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1649, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1650, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1651, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1652, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1653, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1654, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1655, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1656, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1657, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1658, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1659, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1660, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1661, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1662, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1663, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1664, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1665, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1666, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1667, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1668, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1669, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1670, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1671, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1672, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1673, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1674, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1675, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1676, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1677, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:10'),
(1678, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:11'),
(1679, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:11'),
(1680, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:11'),
(1681, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:11'),
(1682, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:12'),
(1683, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:12'),
(1684, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:12'),
(1685, 00000002, '31.3781524', '73.0562917', '2024-09-26 12:05:12'),
(1686, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:12'),
(1687, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:12'),
(1688, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:12'),
(1689, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:12'),
(1690, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1691, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1692, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1693, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1694, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1695, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1696, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1697, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1698, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1699, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1700, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1701, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1702, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1703, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1704, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1705, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1706, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1707, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1708, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1709, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1710, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1711, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1712, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1713, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1714, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1715, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1716, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1717, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1718, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1719, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1720, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1721, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1722, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1723, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1724, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(1725, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1726, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1727, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1728, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1729, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1730, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1731, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1732, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1733, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1734, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1735, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1736, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1737, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1738, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1739, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1740, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1741, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1742, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1743, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1744, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1745, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1746, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1747, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1748, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1749, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1750, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1751, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1752, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1753, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1754, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1755, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1756, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1757, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1758, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1759, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1760, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1761, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1762, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1763, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1764, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1765, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1766, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1767, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1768, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1769, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1770, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1771, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1772, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1773, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1774, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1775, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1776, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1777, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1778, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1779, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1780, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1781, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1782, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1783, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1784, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1785, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1786, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1787, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1788, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1789, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1790, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1791, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1792, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1793, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1794, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1795, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1796, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1797, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1798, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1799, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1800, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1801, 00000002, '31.3781404', '73.0563961', '2024-09-26 12:05:13'),
(1802, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:19:48'),
(1803, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:19:58'),
(1804, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:20:08'),
(1805, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:20:18'),
(1806, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:20:28'),
(1807, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:20:38'),
(1808, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:20:48'),
(1809, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:20:58'),
(1810, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:21:08'),
(1811, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:21:18'),
(1812, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:21:28'),
(1813, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:21:38'),
(1814, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:21:48'),
(1815, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:21:58'),
(1816, 00000001, '51.5236548', '-0.2768765', '2024-10-23 11:22:08');

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
(00000016, 00000028, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-07 05:51:06'),
(00000017, 00000014, 00000001, 00000001, 13, 0, 0, 0, 0, '13', 3, 'unpaid', '2024-09-09 08:56:46'),
(00000018, 00000030, 00000002, 00000001, 167, 0, 0, 0, 0, '167', 33, 'unpaid', '2024-09-09 14:51:57'),
(00000019, 00000031, 00000002, 00000001, 167, 0, 0, 0, 0, '167', 33, 'unpaid', '2024-09-09 15:08:28'),
(00000020, 00000032, 00000001, 00000001, 0, 0, 0, 0, 0, '0', 0, 'unpaid', '2024-09-10 15:42:58'),
(00000021, 00000035, 00000001, 00000001, 0, 0, 0, 0, 0, '0', 0, 'unpaid', '2024-09-11 16:02:46'),
(00000022, 00000037, 00000001, 00000002, 3105, 0, 0, 0, 0, '3105', 621, 'unpaid', '2024-09-11 11:21:13'),
(00000023, 00000039, 00000002, 00000002, 6631, 0, 0, 0, 0, '6631', 1326, 'unpaid', '2024-09-11 12:48:09'),
(00000024, 00000040, 00000002, 00000002, 38, 0, 0, 0, 0, '38', 8, 'unpaid', '2024-09-12 12:19:01'),
(00000025, 00000029, 00000002, 00000002, 26, 0, 0, 0, 0, '26', 5, 'unpaid', '2024-09-12 12:30:44'),
(00000026, 00000041, 00000001, 00000002, 40, 0, 0, 0, 0, '40', 8, 'unpaid', '2024-09-12 12:38:32'),
(00000027, 00000043, 00000001, 00000002, 10, 0, 0, 0, 0, '10', 2, 'unpaid', '2024-09-12 12:55:46'),
(00000028, 00000044, 00000001, 00000002, 10, 0, 0, 0, 0, '10', 2, 'unpaid', '2024-09-12 13:16:14'),
(00000029, 00000036, 00000001, 00000001, 523, 0, 0, 0, 0, '523', 105, 'unpaid', '2024-09-13 16:45:26'),
(00000030, 00000045, 00000001, 00000001, 72, 0, 0, 0, 0, '72', 14, 'unpaid', '2024-09-13 11:09:53'),
(00000031, 00000046, 00000001, 00000002, 7755, 0, 0, 0, 0, '7755', 1551, 'unpaid', '2024-09-14 13:30:52'),
(00000032, 00000049, 00000001, 00000001, 0, 0, 0, 0, 0, '0', 0, 'unpaid', '2024-09-17 14:36:46');

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
(00000004, 00000000064, 00000000001, 00000000001, '', 189, 0, 0, 0, 0, 0, 'Completed', 0, '2024-08-31 10:36:54'),
(00000013, 00000000068, 00000000001, 00000000002, '', 10, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-05 12:19:05'),
(00000014, 00000000069, 00000000001, 00000000001, '', 13, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-09 08:56:46'),
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
(00000028, 00000000082, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-07 05:51:06'),
(00000029, 00000000083, 00000000002, 00000000002, '', 26, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-12 12:30:44'),
(00000031, 00000000085, 00000000002, 00000000001, '', 167, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-09 15:08:28'),
(00000032, 00000000086, 00000000001, 00000000001, '', 0, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-10 15:42:58'),
(00000035, 00000000086, 00000000001, 00000000001, '', 0, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-11 16:02:46'),
(00000036, 00000000087, 00000000001, 00000000001, '', 523, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-13 16:45:26'),
(00000037, 00000000088, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'Completed', 0, '2024-09-11 11:21:13'),
(00000039, 00000000089, 00000000002, 00000000002, '', 6631, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-11 12:48:09'),
(00000040, 00000000090, 00000000002, 00000000002, '', 38, 0, 0, 0, 0, 0, 'Completed', 1, '2024-09-14 08:35:13'),
(00000041, 00000000084, 00000000001, 00000000002, '', 40, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-12 12:38:32'),
(00000043, 00000000067, 00000000001, 00000000002, '', 10, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-12 12:55:46'),
(00000044, 00000000066, 00000000001, 00000000002, '', 10, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-12 13:16:14'),
(00000045, 00000000091, 00000000001, 00000000001, '', 72, 0, 0, 0, 0, 0, 'Completed', 1, '2024-09-14 08:35:24'),
(00000046, 00000000065, 00000000001, 00000000002, '', 7755, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-14 13:30:52'),
(00000049, 00000000092, 00000000001, 00000000001, '', 0, 0, 0, 0, 0, 0, 'Completed', 0, '2024-09-17 14:36:46'),
(00000050, 00000000063, 00000000001, 00000000002, '', 15, 0, 0, 0, 0, 0, 'accepted', 0, '2024-09-20 14:55:57'),
(00000051, 00000000062, 00000000001, 00000000002, '', 350, 0, 0, 0, 0, 0, 'accepted', 0, '2024-09-23 15:30:54'),
(00000052, 00000000061, 00000000001, 00000000002, '', 5085, 0, 0, 0, 0, 0, 'accepted', 0, '2024-09-26 19:53:11'),
(00000053, 00000000092, 00000000001, 00000000002, '', 0, 0, 0, 0, 0, 0, 'accepted', 0, '2024-09-29 15:08:28'),
(00000054, 00000000053, 00000000001, 00000000002, '', 3105, 20, 0, 0, 0, 0, 'accepted', 0, '2024-09-29 16:39:30'),
(00000055, 00000000093, 00000000001, 00000000002, '', 3105, 4, 0, 0, 0, 0, 'accepted', 0, '2024-10-09 08:50:04');

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
(00000000003, '2024-11-09', 'Iqbal Day', '40', '2024-10-09 12:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `ts_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `ts_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `price_hour` decimal(8,2) NOT NULL,
  `total_pay` decimal(8,2) NOT NULL,
  `ts_status` tinyint(4) NOT NULL DEFAULT 0,
  `ts_added_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`ts_id`, `d_id`, `ts_date`, `start_time`, `end_time`, `price_hour`, `total_pay`, `ts_status`, `ts_added_time`) VALUES
(00000001, 00000000, '2024-09-30', '10:00:00', '13:00:00', 25.00, 75.00, 0, '2024-09-29 18:04:53'),
(00000002, 00000000, '2024-09-30', '14:00:00', '16:00:00', 40.00, 80.00, 0, '2024-09-29 18:04:42'),
(00000003, 00000000, '2024-09-30', '17:00:00', '19:00:00', 60.00, 120.00, 4, '2024-09-29 19:05:54'),
(00000004, 00000000, '2024-09-30', '09:00:00', '11:00:00', 60.00, 120.00, 0, '2024-09-29 15:29:59'),
(00000005, 00000000, '2024-09-30', '09:00:00', '11:00:00', 35.00, 70.00, 0, '2024-09-29 15:30:04'),
(00000006, 00000000, '2024-09-30', '09:00:00', '11:00:00', 30.00, 60.00, 0, '2024-09-29 15:30:12'),
(00000008, 00000000, '2024-09-30', '12:30:00', '15:30:00', 20.00, 60.00, 0, '2024-09-29 15:30:16'),
(00000009, 00000002, '2024-09-30', '13:45:00', '14:15:00', 30.00, 15.00, 5, '2024-09-29 15:30:21'),
(00000010, 00000000, '2024-09-29', '18:15:00', '19:15:00', 250.00, 250.00, 0, '2024-09-29 17:01:16'),
(00000011, 00000002, '2024-09-29', '23:10:00', '23:15:00', 250.00, 20.83, 1, '2024-09-30 12:33:35'),
(00000012, 00000002, '2024-09-29', '23:20:00', '23:30:00', 650.00, 108.33, 1, '2024-09-29 18:09:49'),
(00000013, 00000002, '2024-09-29', '23:43:00', '23:45:00', 23.00, 0.77, 1, '2024-09-29 18:43:18'),
(00000014, 00000000, '2024-09-29', '23:49:00', '23:51:00', 400.00, 13.33, 3, '2024-09-29 20:06:17'),
(00000015, 00000002, '2024-09-29', '23:53:00', '23:55:00', 333.00, 11.10, 4, '2024-09-29 19:05:48'),
(00000016, 00000002, '2024-09-30', '01:03:00', '01:04:00', 12.00, 0.20, 4, '2024-09-29 20:04:01'),
(00000017, 00000002, '2024-09-30', '01:06:00', '01:07:00', 343.00, 5.72, 4, '2024-09-29 20:07:02'),
(00000018, 00000002, '2024-09-30', '01:10:00', '01:11:00', 87.00, 1.45, 4, '2024-09-29 20:11:02'),
(00000019, 00000002, '2024-09-30', '01:14:00', '01:15:00', 65.00, 1.08, 4, '2024-09-29 20:15:02'),
(00000020, 00000000, '2024-09-30', '01:19:00', '01:20:00', 234.00, 3.90, 3, '2024-09-29 20:18:42'),
(00000021, 00000000, '2024-09-30', '22:25:00', '22:36:00', 34.00, 6.23, 0, '2024-09-30 17:10:40'),
(00000022, 00000002, '2024-09-30', '22:15:00', '22:26:00', 234.00, 42.90, 4, '2024-10-10 15:38:57'),
(00000023, 00000002, '2024-09-30', '22:30:00', '22:31:00', 234.00, 3.90, 4, '2024-09-30 17:31:01'),
(00000024, 00000002, '2024-09-30', '22:41:00', '22:42:00', 234.00, 3.90, 5, '2024-09-30 17:39:44'),
(00000025, 00000002, '2024-09-30', '22:46:00', '22:47:00', 546.00, 9.10, 4, '2024-09-30 17:47:02'),
(00000026, 00000000, '2024-09-30', '22:49:00', '22:51:00', 234.00, 7.80, 0, '2024-09-30 17:51:29'),
(00000027, 00000002, '2024-09-30', '22:53:00', '22:54:00', 23.00, 0.38, 4, '2024-09-30 17:54:02'),
(00000028, 00000002, '2024-09-30', '22:57:00', '22:58:00', 675.00, 11.25, 4, '2024-09-30 17:58:02'),
(00000029, 00000002, '2024-10-10', '07:00:00', '09:01:00', 50.00, 100.83, 1, '2024-10-09 08:47:21'),
(00000030, 00000002, '2024-10-09', '22:28:00', '22:29:00', 34.00, 0.57, 5, '2024-10-09 17:27:14'),
(00000031, 00000002, '2024-10-09', '23:00:00', '23:04:00', 76.00, 5.07, 1, '2024-10-09 17:59:21'),
(00000032, 00000002, '2024-10-09', '23:08:00', '23:09:00', 23.00, 0.38, 4, '2024-10-09 18:17:40'),
(00000033, 00000002, '2024-10-09', '23:34:00', '23:35:00', 23.00, 0.38, 4, '2024-10-09 18:38:40'),
(00000034, 00000002, '2024-10-09', '23:49:00', '23:50:00', 23.00, 0.38, 4, '2024-10-09 18:54:19'),
(00000035, 00000002, '2024-10-09', '23:57:00', '23:58:00', 23.00, 0.38, 4, '2024-10-09 18:58:01'),
(00000036, 00000002, '2024-10-10', '00:06:00', '00:07:00', 2.00, 0.03, 4, '2024-10-09 19:07:01'),
(00000037, 00000002, '2024-10-10', '00:21:00', '00:22:00', 23.00, 0.38, 4, '2024-10-09 19:22:01'),
(00000038, 00000002, '2024-10-10', '00:26:00', '00:27:00', 23.00, 0.38, 4, '2024-10-09 19:26:09'),
(00000039, 00000000, '2024-10-10', '00:30:00', '00:30:00', 23.00, 0.00, 0, '2024-10-09 19:29:06'),
(00000040, 00000002, '2024-10-10', '00:31:00', '00:32:00', 3.00, 0.05, 4, '2024-10-09 19:32:01'),
(00000041, 00000002, '2024-10-10', '00:50:00', '00:51:00', 23.00, 0.38, 4, '2024-10-09 19:53:00'),
(00000042, 00000002, '2024-10-10', '00:55:00', '00:56:00', 76.00, 1.27, 4, '2024-10-09 19:56:01'),
(00000043, 00000002, '2024-10-10', '00:56:00', '00:57:00', 6.00, 0.10, 4, '2024-10-09 19:57:01'),
(00000044, 00000002, '2024-10-10', '01:01:00', '01:02:00', 8.00, 0.13, 4, '2024-10-09 20:02:01'),
(00000045, 00000002, '2024-10-10', '01:18:00', '01:19:00', 3.00, 0.05, 4, '2024-10-09 20:19:02'),
(00000046, 00000002, '2024-10-10', '01:30:00', '01:31:00', 1.00, 0.02, 4, '2024-10-09 20:31:01'),
(00000047, 00000002, '2024-10-10', '01:34:00', '01:35:00', 8.00, 0.13, 4, '2024-10-09 20:35:01'),
(00000048, 00000002, '2024-10-10', '01:40:00', '01:41:00', 1.00, 0.02, 4, '2024-10-10 15:41:40'),
(00000049, 00000002, '2024-10-10', '20:47:00', '20:48:00', 3.00, 0.05, 1, '2024-10-10 15:45:52'),
(00000050, 00000002, '2024-10-10', '21:15:00', '21:16:00', 1.00, 0.02, 1, '2024-10-10 16:13:47'),
(00000051, 00000002, '2024-10-10', '21:30:00', '21:31:00', 2.00, 0.03, 1, '2024-10-10 16:29:21'),
(00000052, 00000002, '2024-10-10', '21:41:00', '21:42:00', 2.00, 0.03, 1, '2024-10-10 16:40:00'),
(00000053, 00000002, '2024-10-10', '21:51:00', '21:52:00', 3.00, 0.05, 1, '2024-10-10 16:49:42'),
(00000054, 00000002, '2024-10-10', '22:01:00', '22:02:00', 2.00, 0.03, 4, '2024-10-10 17:02:02'),
(00000055, 00000002, '2024-10-10', '22:11:00', '22:12:00', 1.00, 0.02, 4, '2024-10-10 17:12:01'),
(00000056, 00000002, '2024-10-10', '22:29:00', '22:30:00', 3.00, 0.05, 5, '2024-10-10 17:28:15'),
(00000057, 00000002, '2024-10-10', '22:36:00', '22:37:00', 2.00, 0.03, 1, '2024-10-10 17:35:23'),
(00000058, 00000002, '2024-10-10', '22:45:00', '22:46:00', 3.00, 0.05, 4, '2024-10-10 17:46:01'),
(00000059, 00000002, '2024-10-10', '23:09:00', '23:11:00', 3.00, 0.10, 5, '2024-10-10 18:07:50'),
(00000060, 00000002, '2024-10-10', '23:21:00', '23:23:00', 23.00, 0.77, 5, '2024-10-10 18:19:28'),
(00000061, 00000002, '2024-10-10', '23:23:00', '23:24:00', 23.00, 0.38, 4, '2024-10-10 18:38:10'),
(00000062, 00000002, '2024-10-10', '23:29:00', '23:30:00', 2.00, 0.03, 4, '2024-10-10 18:38:23'),
(00000063, 00000002, '2024-10-10', '23:37:00', '23:38:00', 2.00, 0.03, 5, '2024-10-10 18:35:31'),
(00000064, 00000002, '2024-10-10', '23:51:00', '23:52:00', 2.00, 0.03, 5, '2024-10-10 18:50:08'),
(00000065, 00000002, '2024-10-10', '23:56:00', '23:57:00', 3.00, 0.05, 1, '2024-10-10 18:55:08'),
(00000066, 00000002, '2024-10-11', '00:05:00', '00:07:00', 3.00, 0.10, 5, '2024-10-10 19:03:52'),
(00000067, 00000002, '2024-10-11', '00:11:00', '00:14:00', 3.00, 0.15, 5, '2024-10-10 19:09:20'),
(00000068, 00000002, '2024-10-11', '00:12:00', '00:14:00', 3.00, 0.10, 5, '2024-10-10 19:10:44'),
(00000069, 00000002, '2024-10-11', '00:14:00', '00:16:00', 4.00, 0.13, 1, '2024-10-10 19:13:23'),
(00000070, 00000002, '2024-10-11', '00:19:00', '00:21:00', 3.00, 0.10, 5, '2024-10-10 19:17:38'),
(00000071, 00000002, '2024-10-11', '00:29:00', '00:31:00', 3.00, 0.10, 5, '2024-10-10 19:27:32'),
(00000072, 00000002, '2024-10-11', '00:33:00', '00:34:00', 6.00, 0.10, 5, '2024-10-10 19:33:09'),
(00000073, 00000002, '2024-10-11', '00:35:00', '00:36:00', 1.00, 0.02, 5, '2024-10-10 19:34:26'),
(00000074, 00000002, '2024-10-11', '00:40:00', '00:41:00', 12.00, 0.20, 5, '2024-10-10 19:39:42'),
(00000075, 00000002, '2024-10-11', '01:04:00', '01:06:00', 2.00, 0.07, 5, '2024-10-10 20:03:07'),
(00000076, 00000002, '2024-10-11', '01:09:00', '01:11:00', 23.00, 0.77, 5, '2024-10-10 20:08:48'),
(00000077, 00000002, '2024-10-11', '01:17:00', '01:18:00', 2.00, 0.03, 4, '2024-10-10 20:18:02'),
(00000078, 00000002, '2024-10-11', '01:23:00', '01:24:00', 23.00, 0.38, 4, '2024-10-10 20:24:01'),
(00000079, 00000002, '2024-10-11', '01:39:00', '01:39:00', 2.00, 0.00, 4, '2024-10-10 20:39:01'),
(00000080, 00000002, '2024-10-11', '01:44:00', '01:45:00', 2.00, 0.03, 4, '2024-10-10 20:45:01'),
(00000081, 00000002, '2024-10-11', '21:15:00', '22:15:00', 50.00, 50.00, 1, '2024-10-11 15:17:00'),
(00000082, 00000000, '2024-10-11', '21:20:00', '21:21:00', 23.00, 0.38, 4, '2024-10-11 16:21:02'),
(00000083, 00000002, '2024-10-11', '22:11:00', '22:13:00', 2.00, 0.07, 4, '2024-10-11 17:18:30'),
(00000084, 00000002, '2024-10-11', '22:23:00', '22:25:00', 3.00, 0.10, 4, '2024-10-11 17:24:07'),
(00000085, 00000002, '2024-10-11', '22:31:00', '22:33:00', 2.00, 0.07, 4, '2024-10-11 17:33:28'),
(00000086, 00000002, '2024-10-11', '22:36:00', '22:38:00', 23.00, 0.77, 4, '2024-10-11 17:43:37'),
(00000087, 00000002, '2024-10-11', '22:46:00', '22:48:00', 3.00, 0.10, 4, '2024-10-11 17:48:03'),
(00000088, 00000002, '2024-10-11', '22:52:00', '22:53:00', 3.00, 0.05, 4, '2024-10-11 17:57:37'),
(00000089, 00000002, '2024-10-11', '23:00:00', '23:02:00', 23.00, 0.77, 4, '2024-10-11 18:02:02'),
(00000090, 00000002, '2024-10-12', '00:30:00', '00:31:00', 23.00, 0.38, 4, '2024-10-11 19:33:45'),
(00000091, 00000002, '2024-10-12', '00:36:00', '00:37:00', 23.00, 0.38, 4, '2024-10-11 19:38:07'),
(00000092, 00000002, '2024-10-12', '00:40:00', '00:41:00', 23.00, 0.38, 4, '2024-10-11 19:41:01'),
(00000093, 00000002, '2024-10-12', '00:45:00', '00:46:00', 12.00, 0.20, 4, '2024-10-11 19:46:37'),
(00000094, 00000002, '2024-10-12', '00:50:00', '00:51:00', 2.00, 0.03, 1, '2024-10-11 19:49:39'),
(00000095, 00000002, '2024-10-12', '01:09:00', '01:10:00', 2.00, 0.03, 4, '2024-10-11 20:10:01'),
(00000096, 00000002, '2024-10-12', '01:17:00', '01:18:00', 2.00, 0.03, 4, '2024-10-11 20:18:01'),
(00000097, 00000000, '2024-10-12', '01:26:00', '01:27:00', 2.00, 0.03, 4, '2024-10-11 20:27:01'),
(00000098, 00000001, '2024-10-23', '23:35:00', '23:50:00', 50.00, 12.50, 5, '2024-10-23 18:32:10');

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
  `v_luggage` int(5) NOT NULL,
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

INSERT INTO `vehicles` (`v_id`, `v_name`, `v_seat`, `v_luggage`, `v_airbags`, `v_wchair`, `v_babyseat`, `v_pricing`, `v_img`, `date_added`) VALUES
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
(00000003, 00000003, '', '', '', '', '', '', '', '', '', '', '2024-09-06 14:30:46'),
(00000004, 00000004, '', '', '', '', '', '', '', '', '', '', '2024-10-02 15:59:04'),
(00000005, 00000005, '', '', '', '', '', '', '', '', '', '', '2024-10-23 19:17:20');

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
(00000017, 00000000, 00000002, 00000028, '00:00:08', '2024-09-07 12:50:49'),
(00000018, 00000000, 00000001, 00000030, '00:00:03', '2024-09-09 21:51:28'),
(00000019, 00000000, 00000001, 00000031, '00:00:03', '2024-09-09 22:08:13'),
(00000020, 00000000, 00000001, 00000032, '00:00:02', '2024-09-10 22:42:48'),
(00000021, 00000000, 00000001, 00000035, '00:00:09', '2024-09-10 22:57:54'),
(00000022, 00000000, 00000002, 00000037, '00:00:04', '2024-09-11 18:20:57'),
(00000023, 00000000, 00000002, 00000039, '00:00:03', '2024-09-11 19:47:57'),
(00000024, 00000000, 00000002, 00000040, '00:00:30', '2024-09-12 19:03:06'),
(00000025, 00000000, 00000002, 00000029, '00:00:02', '2024-09-12 19:28:17'),
(00000026, 00000000, 00000002, 00000041, '00:00:20', '2024-09-12 19:35:21'),
(00000027, 00000000, 00000002, 00000042, '00:00:02', '2024-09-12 19:48:48'),
(00000028, 00000000, 00000002, 00000043, '00:00:10', '2024-09-12 19:55:24'),
(00000029, 00000000, 00000002, 00000044, '00:00:11', '2024-09-12 20:15:51'),
(00000030, 00000000, 00000001, 00000036, '00:00:04', '2024-09-13 11:45:14'),
(00000031, 00000000, 00000001, 00000045, '00:00:01', '2024-09-13 18:09:46'),
(00000032, 00000000, 00000002, 00000046, '00:00:02', '2024-09-14 08:30:34'),
(00000033, 00000000, 00000001, 00000049, '00:00:03', '2024-09-17 21:36:33');

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
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`ts_id`);

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
  MODIFY `log_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1152;

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `ap_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `booking_type`
--
ALTER TABLE `booking_type`
  MODIFY `b_type_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `break_time`
--
ALTER TABLE `break_time`
  MODIFY `bt_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  MODIFY `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `dd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `driver_history`
--
ALTER TABLE `driver_history`
  MODIFY `history_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1817;

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
  MODIFY `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

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
  MODIFY `dt_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `ts_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

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
  MODIFY `vd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `waiting_time`
--
ALTER TABLE `waiting_time`
  MODIFY `wt_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
