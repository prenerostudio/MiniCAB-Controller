-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2024 at 10:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minicab`
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
(00000001, 'Price by Post Code Deleted', '2024-07-13 08:20:25', 'user', 00000001, 'Price by Post Code Has Been Deleted by Controller.'),
(00000002, 'Price by Mile Deleted', '2024-07-13 08:23:33', 'user', 00000001, 'Price by Mile Has Been Deleted by Controller.'),
(00000003, 'Meet & Greet Charges Deleted', '2024-07-13 08:33:35', 'user', 00000001, 'Meet & Greet Charges Has Been Deleted by Controller.'),
(00000004, 'Meet & Greet Charges Deleted', '2024-07-13 08:35:57', 'user', 00000001, 'Meet & Greet Charges Has Been Deleted by Controller.'),
(00000005, 'New Zone Added', '2024-07-13 12:00:34', 'user', 00000001, 'New Zone  -  Has Been Added by Controller.'),
(00000006, 'Zone Deleted ', '2024-07-13 12:00:45', 'user', 00000001, 'Zone Address Has Been Deleted by Controller.'),
(00000007, 'Meet & Greet Charges Deleted', '2024-07-13 12:31:15', 'user', 00000001, 'Meet & Greet Charges Has Been Deleted by Controller.'),
(00000008, 'Peak Hours Deleted Deleted', '2024-07-13 14:11:21', 'user', 00000001, 'Peak Hours Deleted Has Been Deleted by Controller.'),
(00000009, 'Controller Logged-In', '2024-07-14 17:17:03', 'user', 00000000, 'Controller Atiq Logged in successfully.'),
(00000010, 'Job Dispatched', '2024-07-17 03:48:06', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000011, 'New Company Added', '2024-07-17 11:39:06', 'user', 00000001, 'New Company Prenero Studio Has been Added by Controller.'),
(00000012, 'Company Profile Image Update', '2024-07-17 11:52:44', 'user', 00000001, 'Company Profile Image 00000001 Has Been Updated by Controller.'),
(00000013, 'Company Image Deleted', '2024-07-17 11:57:30', 'user', 00000001, 'Company Image Has Been Deleted by Controller.'),
(00000014, 'Company Profile Image Update', '2024-07-17 12:25:04', 'user', 00000001, 'Company Profile Image 00000002 Has Been Updated by Controller.'),
(00000015, 'Block Company', '2024-07-17 13:14:01', 'user', 00000001, 'Company ID: 00000001 Has Been Blocked'),
(00000016, 'Activate Company', '2024-07-17 13:14:04', 'user', 00000001, 'Company ID: 00000001 Has Been Activated'),
(00000017, 'Block Company', '2024-07-17 13:14:05', 'user', 00000001, 'Company ID: 00000001 Has Been Blocked'),
(00000018, 'Activate Company', '2024-07-17 13:14:15', 'user', 00000001, 'Company ID: 00000001 Has Been Activated'),
(00000019, 'Activate Company', '2024-07-17 13:14:21', 'user', 00000001, 'Company ID: 00000002 Has Been Activated'),
(00000020, 'Delete Account Request', '2024-07-17 14:28:00', 'driver', 00000001, 'Delete Account Request Pending.'),
(00000021, 'Delete Account Request', '2024-07-17 14:28:13', 'driver', 00000001, 'Delete Account Request Pending.'),
(00000022, 'Driver Acount Deletion Request Cancelled', '2024-07-18 09:14:23', 'user', 00000001, 'Driver Acount Deletion Request has been Cancelled.'),
(00000023, 'Driver Acount Deletion Request Cancelled', '2024-07-18 09:16:07', 'user', 00000001, 'Driver Acount Deletion Request has been Cancelled.'),
(00000024, 'Driver Acount Deletion Request Cancelled', '2024-07-18 09:18:28', 'user', 00000001, 'Driver Acount Deletion Request has been Cancelled.'),
(00000025, 'Driver Account Deletion Request Approved', '2024-07-18 09:27:50', 'user', 00000001, 'Driver Account Deletion Request has been Approved.'),
(00000026, 'Activate Driver', '2024-07-18 12:46:40', 'user', 00000001, 'Driver ID: 00000001 Has Been Activated'),
(00000027, 'Driver Account Deletion Request Approved', '2024-07-18 12:47:10', 'user', 00000001, 'Driver Account Deletion Request has been Approved.'),
(00000028, 'New Driver Added', '2024-07-18 13:01:18', 'user', 00000002, 'New Driver Atiq Ramzan Has been Added by Controller.'),
(00000029, 'Journey Fare Added', '2024-07-18 13:24:53', 'driver', 00000001, 'Journey Fare added for correction against job #: 1.'),
(00000030, 'New Customer Added', '2024-07-19 07:46:36', 'user', 00000001, 'New Customer Awaise Pasha Has been Added by Controller.'),
(00000031, 'Customer Verified', '2024-07-19 07:51:31', 'user', 00000001, 'Customer 00000003 Has Been Verified by Controller.'),
(00000032, 'Booker Profile Updated', '2024-07-19 07:53:48', 'user', 00000001, 'Booker Profile 00000002 Has Been Updated by Controller.'),
(00000033, 'Booker Profile Updated', '2024-07-19 07:54:36', 'user', 00000001, 'Booker Profile 00000002 Has Been Updated by Controller.'),
(00000034, 'Driver Verified', '2024-07-19 07:55:21', 'user', 00000001, 'Driver 00000002 Has Been verified by Controller.'),
(00000035, 'Driver Verified', '2024-07-19 07:55:38', 'user', 00000001, 'Driver 00000001 Has Been verified by Controller.'),
(00000036, 'Booker Verified', '2024-07-19 08:17:30', 'user', 00000001, 'Booker 00000002 Has Been Verified by Controller.'),
(00000037, 'Job Dispatched', '2024-07-19 08:32:19', 'user', 00000001, 'Job has been dispatched to driver by Controller.'),
(00000038, 'Booking Cancelled', '2024-07-19 08:44:30', 'user', 00000001, 'Booking ID: 00000013 Has been Cancelled by Controller.'),
(00000039, 'Block Company', '2024-07-19 09:08:18', 'user', 00000001, 'Company ID: 00000001 Has Been Blocked'),
(00000040, 'Controller Logged-In', '2024-08-24 14:08:18', 'user', 00000001, 'Controller Atiq logged in successfully.'),
(00000041, 'Controller Logged-In', '2024-08-28 12:06:59', 'user', 00000001, 'Controller logged in successfully.'),
(00000042, 'New Driver Added', '2024-08-28 12:13:10', 'user', 00000003, 'New Driver Azib Ali Butt Has been Added by Controller.'),
(00000043, 'Driver Inactive', '2024-08-31 06:36:40', 'user', 00000001, 'Driver 00000002 Has Been made by Controller.'),
(00000044, 'Activate Driver', '2024-08-31 06:41:02', 'user', 00000001, 'Driver ID: 00000002 Has Been Activated');

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
(00000001, 00000000001, 00000000002, 25, '', '2024-06-11 11:06:34');

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
(00000061, 00000001, 00000001, 'Weston-super-Mare, UK', '', 'Eastbourne, UK', '', 'N4= Finsbury Park, Manor House', 2, '2024-08-31', '15:00:00', 'One Way', 00000001, '', 'No', '', '00:00:00', '', 5085, 339, 0, 58, 50, 18, 88, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34'),
(00000062, 00000001, 00000001, 'West Cromwell Road, London, UK', '', 'Heathrow Long Stay Terminal 5, Northern Perimeter Road, Hounslow, UK', '', ' ', 1, '2024-08-31', '11:20:00', 'One Way', 00000003, '', '', '', '00:00:00', '', 350, 23, 0, 555, 5555, 66666, 55, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', 'awaise@gmail.com', '+44256423120', '2024-08-31 16:06:34');

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
  `total_time` datetime NOT NULL,
  `break_status` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `status`, `company_name`, `commission_type`, `percentage`, `fixed`, `acount_status`, `account_type`, `reg_date`) VALUES
(00000002, 'Atiq Ramzan', 'prenero12@gmail.com', '+923127346634', '6266a', '', 'Male', 'English', '', 'N12', '', '33102-1457353-9', 0, '', 'fixed', 0, 0, 1, 2, '2024-07-19 08:17:30'),
(00000003, 'Awaise Pasha', 'awaise@gmail.com', '+44256423120', '123456', '', 'Male', 'English', '', 'W12', '', '', 0, '', '', 0, 0, 1, 1, '0000-00-00 00:00:00');

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
(00000001, 'Prenero Solutions', 'prenero12@gmail.com', '+923127346634', '6266a', 'P-24, Hamza Market', 'Atiq Ramzan', '', '38000', '1102', 0, '2024-07-19 09:08:18'),
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

--
-- Dumping data for table `customers_address`
--

INSERT INTO `customers_address` (`ca_id`, `c_id`, `address`, `date_add_added`) VALUES
(00000001, 00000001, 'Jail Road Faisalabad.', '2024-06-11 13:51:55');

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

--
-- Dumping data for table `customer_bank_account`
--

INSERT INTO `customer_bank_account` (`cb_id`, `c_id`, `cb_account_title`, `cb_account_number`, `cb_bank_name`, `cb_date_added`) VALUES
(00000001, 00000001, 'Atiq Ramzan', '0417854256312', 'Meezan Bank', '2024-06-10 22:56:32');

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

--
-- Dumping data for table `customer_cards`
--

INSERT INTO `customer_cards` (`cc_id`, `c_id`, `card_name`, `card_number`, `card_expiry`, `card_cvv`, `card_date_add`) VALUES
(00000001, 1, 'Atiq Ramzan', '4648540026141600', '02-2024', 949, '2024-06-11 11:13:18');

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

--
-- Dumping data for table `delete_drivers`
--

INSERT INTO `delete_drivers` (`del_d_id`, `d_id`, `request_msg`, `req_status`, `del_d_date`) VALUES
(00000002, 00000001, 'Testing', 1, '2024-07-18 12:47:10');

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
  `driver_reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `pco_num`, `latitude`, `longitude`, `status`, `acount_status`, `signup_type`, `driver_reg_date`) VALUES
(00000001, 'Azib Ali', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', 'London ', 'WJ1234', '669212c35f56b_booker_app.png', 'Male', 'English', 'Bermingham', '1234567', '', '', 'online', 1, 3, '0000-00-00 00:00:00'),
(00000002, 'Atiq Ramzan', 'admin@prenero.com', '+443157524000', '123456', '', 'W12', '', 'Male', 'English', 'Ireland', '', '', '', '', 1, 0, '2024-08-31 06:41:02'),
(00000003, 'Azib Ali Butt', 'eurodatatechnology@gmail.com', '+44 7552 834179', 'asdf1234', '', 'N12', '', 'Male', 'English', 'London', '', '', '', '', 0, 0, '2024-08-28 12:13:10');

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
(00000001, 00000001, '6666edcda14a5.jpg', '', '', '', '', '', '', '', '2024-06-10 12:13:01'),
(00000002, 00000002, '', '', '', '', '', '', '', '', '2024-07-18 13:01:18'),
(00000003, 00000003, '', '', '', '', '', '', '', '', '2024-08-28 12:13:10');

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
(00000001, 00000001, 00000002, '2024-07-17 03:48:06'),
(00000002, 00000002, 00000003, '2024-07-19 08:32:19');

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
(1, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:30:04'),
(2, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:30:14'),
(3, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:30:24'),
(4, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:30:34'),
(5, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:30:45'),
(6, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:30:54'),
(7, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:30:59'),
(8, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:31:04'),
(9, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:31:09'),
(10, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:31:14'),
(11, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:31:19'),
(12, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:31:25'),
(13, 00000001, '51.6132667', '-0.1756567', '2024-06-12 12:31:29'),
(14, 00000001, '51.6133445', '-0.1757347', '2024-06-12 12:31:35'),
(15, 00000001, '51.61335', '-0.17574', '2024-06-12 12:31:39'),
(16, 00000001, '51.61335', '-0.17574', '2024-06-12 12:31:44'),
(17, 00000001, '51.61335', '-0.17574', '2024-06-12 12:31:49'),
(18, 00000001, '51.61335', '-0.17574', '2024-06-12 12:31:54'),
(19, 00000001, '51.61335', '-0.17574', '2024-06-12 12:31:59'),
(20, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:04'),
(21, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:09'),
(22, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:14'),
(23, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:19'),
(24, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:24'),
(25, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:29'),
(26, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:34'),
(27, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:39'),
(28, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:44'),
(29, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:49'),
(30, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:54'),
(31, 00000001, '51.61335', '-0.17574', '2024-06-12 12:32:59'),
(32, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:05'),
(33, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:09'),
(34, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:14'),
(35, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:19'),
(36, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:24'),
(37, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:29'),
(38, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:34'),
(39, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:39'),
(40, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:45'),
(41, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:49'),
(42, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:54'),
(43, 00000001, '51.61335', '-0.17574', '2024-06-12 12:33:59'),
(44, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:04'),
(45, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:09'),
(46, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:14'),
(47, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:19'),
(48, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:24'),
(49, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:29'),
(50, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:35'),
(51, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:39'),
(52, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:44'),
(53, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:54'),
(54, 00000001, '51.61335', '-0.17574', '2024-06-12 12:34:59'),
(55, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:05'),
(56, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:09'),
(57, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:14'),
(58, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:19'),
(59, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:24'),
(60, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:29'),
(61, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:35'),
(62, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:39'),
(63, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:45'),
(64, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:49'),
(65, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:54'),
(66, 00000001, '51.61335', '-0.17574', '2024-06-12 12:35:59'),
(67, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:05'),
(68, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:10'),
(69, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:14'),
(70, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:19'),
(71, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:25'),
(72, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:29'),
(73, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:35'),
(74, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:39'),
(75, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:44'),
(76, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:50'),
(77, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:54'),
(78, 00000001, '51.61335', '-0.17574', '2024-06-12 12:36:59'),
(79, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:05'),
(80, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:09'),
(81, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:14'),
(82, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:19'),
(83, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:25'),
(84, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:29'),
(85, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:34'),
(86, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:39'),
(87, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:44'),
(88, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:49'),
(89, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:54'),
(90, 00000001, '51.61335', '-0.17574', '2024-06-12 12:37:59'),
(91, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:04'),
(92, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:09'),
(93, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:14'),
(94, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:19'),
(95, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:24'),
(96, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:29'),
(97, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:35'),
(98, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:39'),
(99, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:45'),
(100, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:49'),
(101, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:56'),
(102, 00000001, '51.61335', '-0.17574', '2024-06-12 12:38:59'),
(103, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:04'),
(104, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:09'),
(105, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:14'),
(106, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:19'),
(107, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:24'),
(108, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:29'),
(109, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:35'),
(110, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:39'),
(111, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:44'),
(112, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:49'),
(113, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:55'),
(114, 00000001, '51.61335', '-0.17574', '2024-06-12 12:39:59'),
(115, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:04'),
(116, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:09'),
(117, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:14'),
(118, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:19'),
(119, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:24'),
(120, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:29'),
(121, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:34'),
(122, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:39'),
(123, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:44'),
(124, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:49'),
(125, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:54'),
(126, 00000001, '51.61335', '-0.17574', '2024-06-12 12:40:59'),
(127, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:04'),
(128, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:09'),
(129, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:15'),
(130, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:19'),
(131, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:25'),
(132, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:29'),
(133, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:35'),
(134, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:39'),
(135, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:44'),
(136, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:49'),
(137, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:55'),
(138, 00000001, '51.61335', '-0.17574', '2024-06-12 12:41:59'),
(139, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:05'),
(140, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:09'),
(141, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:14'),
(142, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:19'),
(143, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:24'),
(144, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:29'),
(145, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:35'),
(146, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:39'),
(147, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:44'),
(148, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:49'),
(149, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:55'),
(150, 00000001, '51.61335', '-0.17574', '2024-06-12 12:42:59'),
(151, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:04'),
(152, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:09'),
(153, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:15'),
(154, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:19'),
(155, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:24'),
(156, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:29'),
(157, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:35'),
(158, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:39'),
(159, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:44'),
(160, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:49'),
(161, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:54'),
(162, 00000001, '51.61335', '-0.17574', '2024-06-12 12:43:59'),
(163, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:04'),
(164, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:09'),
(165, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:14'),
(166, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:19'),
(167, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:24'),
(168, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:29'),
(169, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:34'),
(170, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:39'),
(171, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:45'),
(172, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:49'),
(173, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:54'),
(174, 00000001, '51.61335', '-0.17574', '2024-06-12 12:44:59'),
(175, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:04'),
(176, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:09'),
(177, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:15'),
(178, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:19'),
(179, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:24'),
(180, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:29'),
(181, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:34'),
(182, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:39'),
(183, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:44'),
(184, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:49'),
(185, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:54'),
(186, 00000001, '51.61335', '-0.17574', '2024-06-12 12:45:59'),
(187, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:04'),
(188, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:09'),
(189, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:14'),
(190, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:19'),
(191, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:24'),
(192, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:29'),
(193, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:34'),
(194, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:39'),
(195, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:45'),
(196, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:49'),
(197, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:54'),
(198, 00000001, '51.61335', '-0.17574', '2024-06-12 12:46:59'),
(199, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:05'),
(200, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:09'),
(201, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:15'),
(202, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:19'),
(203, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:25'),
(204, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:29'),
(205, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:34'),
(206, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:39'),
(207, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:45'),
(208, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:49'),
(209, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:54'),
(210, 00000001, '51.61335', '-0.17574', '2024-06-12 12:47:59'),
(211, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:04'),
(212, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:09'),
(213, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:14'),
(214, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:19'),
(215, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:24'),
(216, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:29'),
(217, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:34'),
(218, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:39'),
(219, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:45'),
(220, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:49'),
(221, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:54'),
(222, 00000001, '51.61335', '-0.17574', '2024-06-12 12:48:59'),
(223, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:04'),
(224, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:09'),
(225, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:14'),
(226, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:19'),
(227, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:24'),
(228, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:29'),
(229, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:34'),
(230, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:39'),
(231, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:44'),
(232, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:49'),
(233, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:55'),
(234, 00000001, '51.61335', '-0.17574', '2024-06-12 12:49:59'),
(235, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:05'),
(236, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:09'),
(237, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:15'),
(238, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:19'),
(239, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:25'),
(240, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:29'),
(241, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:34'),
(242, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:39'),
(243, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:44'),
(244, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:49'),
(245, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:54'),
(246, 00000001, '51.61335', '-0.17574', '2024-06-12 12:50:59'),
(247, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:04'),
(248, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:09'),
(249, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:14'),
(250, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:19'),
(251, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:24'),
(252, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:29'),
(253, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:35'),
(254, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:39'),
(255, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:45'),
(256, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:49'),
(257, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:54'),
(258, 00000001, '51.61335', '-0.17574', '2024-06-12 12:51:59'),
(259, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:04'),
(260, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:09'),
(261, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:15'),
(262, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:19'),
(263, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:24'),
(264, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:29'),
(265, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:34'),
(266, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:39'),
(267, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:45'),
(268, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:49'),
(269, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:55'),
(270, 00000001, '51.61335', '-0.17574', '2024-06-12 12:52:59'),
(271, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:05'),
(272, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:09'),
(273, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:14'),
(274, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:19'),
(275, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:24'),
(276, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:29'),
(277, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:34'),
(278, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:39'),
(279, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:45'),
(280, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:49'),
(281, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:54'),
(282, 00000001, '51.61335', '-0.17574', '2024-06-12 12:53:59'),
(283, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:04'),
(284, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:09'),
(285, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:15'),
(286, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:19'),
(287, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:24'),
(288, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:29'),
(289, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:34'),
(290, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:39'),
(291, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:45'),
(292, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:49'),
(293, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:54'),
(294, 00000001, '51.61335', '-0.17574', '2024-06-12 12:54:59'),
(295, 00000001, '51.61335', '-0.17574', '2024-06-12 12:55:05'),
(296, 00000001, '51.61335', '-0.17574', '2024-06-12 12:55:09'),
(297, 00000001, '51.61335', '-0.17574', '2024-06-12 12:55:15'),
(298, 00000001, '51.61335', '-0.17574', '2024-06-12 12:55:19'),
(299, 00000001, '51.61335', '-0.17574', '2024-06-12 12:55:24'),
(300, 00000001, '51.61335', '-0.17574', '2024-06-12 12:55:29'),
(301, 00000001, '51.61335', '-0.17574', '2024-06-12 12:55:34');

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
(00000001, 00000001, 00000001, 300, 20, 15, 15, 250, 'Pending', '2024-07-18 01:24:53');

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
  `date_job_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `book_id`, `c_id`, `d_id`, `job_note`, `journey_fare`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `job_status`, `date_job_add`) VALUES
(00000001, 00000000005, 00000000002, 00000000001, '', 500, 0, 0, 0, 0, 0, 'completed', '2024-07-19 08:43:16'),
(00000002, 00000000003, 00000000002, 00000000002, '', 5040, 0, 0, 0, 0, 0, 'waiting', '2024-07-19 08:32:19');

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
  `rev_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `job_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `rev_msg` text NOT NULL,
  `rev_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`rev_id`, `job_id`, `d_id`, `c_id`, `rev_msg`, `rev_date`) VALUES
(00000000001, 00000000001, 00000000001, 00000000003, 'N/A', '2024-06-11 14:37:51');

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
(00000001, 'Atiq', 'Ramzan', 'admin@prenero.com', 'b743c33627755c255938a992d3480cab', '+923157524000', 'Male', 'Owner', 'Shop # 24, Hamza Market, Sargodha Road', 'Faisalabad', 'Punjab', 134, 38000, '33102-1457353-9', '6692115e98268_1720848734.jpg', '2024-07-13 05:32:14'),
(00000002, 'Azib ', 'Ali Butt', 'eurodatatechnology@gmail.com', '25d55ad283aa400af464c76d713c07ad', '+447552834179', 'Male', 'Administrator', 'London, United Kingdom.', 'London', '', 186, 0, '', '669210dd613b8_1720848605.jpg', '2024-07-13 05:30:05');

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
(00000000001, 'Saloon', 58, 1, 0, 0, 0, 50, 'toyota-prius.png', '2024-05-10 11:54:45'),
(00000000002, 'Estate', 4, 1, 1, 1, 0, 50, 'Ford-Galaxy.png', '2023-12-25 21:15:44'),
(00000000003, 'MPV', 4, 2, 0, 0, 0, 50, 'Ford-Galaxy.png', '2023-10-17 14:39:57'),
(00000000004, 'Large MPV', 5, 4, 0, 0, 0, 50, 'Skoda_Octavia.png', '2023-10-17 14:39:57'),
(00000000005, 'Minibus', 6, 6, 0, 0, 0, 50, 'Ford-Crown-Victoria.png', '2023-10-17 14:39:57'),
(00000000006, 'Executive', 7, 6, 0, 0, 0, 50, 'Ford-Mondeo.png', '2023-10-17 14:39:57'),
(00000000007, 'Executive Minibus', 8, 6, 0, 0, 0, 50, 'Ford-Mondeo.png', '2023-10-17 14:39:57'),
(00000000008, '10 - 14 Passenger', 10, 10, 0, 0, 0, 40, 'Toyota-Camry.png', '2023-10-17 14:39:57'),
(00000000009, '15 - 16 Passenger', 15, 14, 0, 0, 0, 50, 'Citroen-Berlingo.png', '2023-10-17 14:39:57');

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
(00000001, 00000001, '', '', '', '', '', '', '', '', '', '', '2024-06-10 11:50:08'),
(00000002, 00000002, '', '', '', '', '', '', '', '', '', '', '2024-07-18 13:01:18'),
(00000003, 00000003, '', '', '', '', '', '', '', '', '', '', '2024-08-28 12:13:10');

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
  MODIFY `log_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `ap_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `availability_times`
--
ALTER TABLE `availability_times`
  MODIFY `at_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `booking_type`
--
ALTER TABLE `booking_type`
  MODIFY `b_type_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `break_time`
--
ALTER TABLE `break_time`
  MODIFY `bt_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  MODIFY `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `ca_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_bank_account`
--
ALTER TABLE `customer_bank_account`
  MODIFY `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_cards`
--
ALTER TABLE `customer_cards`
  MODIFY `cc_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `del_d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `history_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2120;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `dv_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fares`
--
ALTER TABLE `fares`
  MODIFY `fare_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `rev_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `special_dates`
--
ALTER TABLE `special_dates`
  MODIFY `dt_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `wt_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
