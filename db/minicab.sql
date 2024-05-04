-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2024 at 03:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `user` varchar(255) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`log_id`, `activity_type`, `timestamp`, `user`, `details`) VALUES
(00000001, 'Booking Opens for Bid', '2024-05-02 11:24:07', 'Controller', 'Controller Has Opened a Bid for Booking 000000000000002'),
(00000002, 'Activate Driver ', '2024-05-04 10:09:20', 'Controller', 'Driver 00000008 Has Been Activated'),
(00000003, 'New Driver ', '2024-05-04 10:34:26', 'Atiq Ramzan', 'New Driver Acount Created by Atiq Ramzan'),
(00000004, 'Fare Correction ', '2024-05-04 10:36:30', 'Cotroller', 'Controller has approve Fare against Fare ID: 00000006'),
(00000005, 'New Airport Added', '2024-05-04 10:56:22', 'Controller', 'New Airport Has been Added by Controller'),
(00000006, 'Bid Accepted ', '2024-05-04 12:40:20', 'Controller', 'Bid From Driver Azib Ali  Has Been Accepted by Controller.'),
(00000007, 'Bid Accepted ', '2024-05-04 12:41:04', 'Controller', 'Bid From Driver Azib Ali  Has Been Accepted by Controller.');

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
(00000010, 'Newcastle International Airport', 'Woolsington, Newcastle upon Tyne NE13 8BZ', 'United Kingdom', 'NCL', '2023-10-27 19:00:00'),
(00000013, 'Testing', 'dnfvksdfvdskds', 'dvsdvsdsvsv', 'dsvsdvsd', '2024-05-04 10:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `availability_times`
--

CREATE TABLE `availability_times` (
  `at_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `day_title` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `availability_times`
--

INSERT INTO `availability_times` (`at_id`, `d_id`, `day_title`, `start_time`, `end_time`, `added_time`) VALUES
(00000002, 00000001, 'Monday', '09:00:00', '17:00:00', '2024-03-16 09:09:44'),
(00000008, 00000005, 'Wednesday', '12:15:00', '20:25:00', '2024-03-17 16:16:19'),
(00000012, 00000001, 'Friday', '12:07:00', '16:07:00', '2024-03-18 15:08:02'),
(00000013, 00000001, 'Friday', '12:07:00', '16:07:00', '2024-03-18 15:08:08'),
(00000014, 00000001, 'Friday', '12:07:00', '16:07:00', '2024-03-18 15:08:10'),
(00000015, 00000001, 'Friday', '12:07:00', '16:07:00', '2024-03-18 15:08:11'),
(00000016, 00000001, 'Friday', '12:07:00', '16:07:00', '2024-03-18 15:08:12'),
(00000020, 00000001, 'Saturday', '01:28:00', '11:28:00', '2024-03-19 06:38:54'),
(00000021, 00000001, 'Saturday', '03:25:00', '03:28:00', '2024-03-19 07:18:38'),
(00000022, 00000001, 'Saturday', '11:25:00', '00:28:00', '2024-03-19 07:20:17'),
(00000023, 00000001, 'Wednesday', '01:00:00', '02:00:00', '2024-03-19 07:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `bid_amount` decimal(5,2) NOT NULL,
  `bidding_status` int(11) NOT NULL DEFAULT 0,
  `bid_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid_id`, `book_id`, `d_id`, `bid_amount`, `bidding_status`, `bid_date`) VALUES
(00000000001, 00000009, 00000001, 35.00, 1, '2024-05-04 12:41:04'),
(00000000002, 00000001, 00000001, 35.00, 1, '2024-05-04 12:46:41');

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
(00000001, 00000000002, 00000000001, 0, '', '2024-02-20 19:40:23'),
(00000002, 00000000002, 00000000002, 0, '', '2024-02-20 19:47:56'),
(00000003, 00000000002, 00000000003, 0, '', '2024-02-21 03:26:26'),
(00000004, 00000000002, 00000000004, 0, '', '2024-02-21 17:39:40'),
(00000005, 00000000002, 00000000005, 0, '', '2024-02-21 17:58:30'),
(00000006, 00000000002, 00000000006, 0, '', '2024-02-21 18:05:49'),
(00000007, 00000000002, 00000000007, 0, '', '2024-02-21 19:54:22'),
(00000008, 00000000002, 00000000008, 50, '', '2024-02-21 19:55:51'),
(00000009, 00000000002, 00000000009, 25, '', '2024-02-22 08:25:54'),
(00000010, 00000000003, 00000000010, 0, '', '2024-02-24 09:12:57'),
(00000011, 00000000002, 00000000011, 50, '', '2024-02-24 16:08:02'),
(00000012, 00000000001, 00000000012, 25, '', '2024-02-25 06:53:34'),
(00000013, 00000000001, 00000000016, 25, '', '2024-02-25 14:03:18'),
(00000014, 00000000003, 00000000017, 0, '', '2024-02-25 14:26:45'),
(00000015, 00000000003, 00000000018, 0, '', '2024-02-25 14:27:08'),
(00000016, 00000000003, 00000000019, 0, '', '2024-02-25 14:29:28'),
(00000017, 00000000003, 00000000020, 20, '', '2024-02-25 14:31:43'),
(00000018, 00000000003, 00000000021, 20, '', '2024-02-25 14:39:03'),
(00000019, 00000000003, 00000000022, 20, '', '2024-02-25 14:41:56'),
(00000020, 00000000003, 00000000023, 20, '', '2024-02-25 14:46:36'),
(00000021, 00000000003, 00000000024, 0, '', '2024-02-25 19:28:24'),
(00000022, 00000000003, 00000000025, 0, '', '2024-03-19 15:51:32'),
(00000023, 00000000003, 00000000026, 0, '', '2024-03-19 15:54:15'),
(00000024, 00000000003, 00000000027, 20, '', '2024-03-19 16:01:19'),
(00000025, 00000000003, 00000000028, 0, '', '2024-03-19 16:23:59'),
(00000026, 00000000003, 00000000029, 0, '', '2024-03-19 16:46:28'),
(00000027, 00000000003, 00000000030, 0, '', '2024-03-20 10:28:42'),
(00000028, 00000000003, 00000000031, 20, '', '2024-03-20 10:37:25'),
(00000029, 00000000003, 00000000032, 0, '', '2024-03-20 15:40:41'),
(00000030, 00000000003, 00000000033, 0, '', '2024-03-20 15:45:02'),
(00000031, 00000000001, 00000000034, 25, '', '2024-03-21 16:46:19'),
(00000032, 00000000001, 00000000035, 25, '', '2024-03-21 16:57:31'),
(00000033, 00000000003, 00000000036, 0, '', '2024-03-21 18:25:48'),
(00000034, 00000000001, 00000000037, 25, '', '2024-03-21 18:42:53'),
(00000035, 00000000001, 00000000038, 25, '', '2024-03-21 18:44:00');

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
  `passenger` int(55) NOT NULL,
  `pick_date` date NOT NULL,
  `pick_time` time NOT NULL,
  `journey_type` varchar(55) NOT NULL,
  `v_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `luggage` varchar(255) NOT NULL,
  `child_seat` varchar(255) NOT NULL,
  `flight_number` varchar(255) NOT NULL,
  `delay_time` time NOT NULL,
  `note` text NOT NULL,
  `journey_fare` int(55) NOT NULL,
  `journey_distance` int(55) NOT NULL,
  `booking_fee` int(11) NOT NULL,
  `car_parking` int(11) NOT NULL,
  `waiting` int(11) NOT NULL,
  `tolls` int(11) NOT NULL,
  `extra` int(11) NOT NULL,
  `booker_commission` int(10) NOT NULL,
  `booking_status` varchar(55) NOT NULL,
  `bid_status` int(11) NOT NULL DEFAULT 0,
  `bid_time` varchar(255) NOT NULL,
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
(00000001, 00000003, 00000002, 'Horley, Gatwick RH6 0NP', '', 'Longford TW6, UK', '', '', 0, '0000-00-00', '00:00:00', '', 00000005, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '', '', '', '', '', '2024-02-25 07:33:18'),
(00000002, 00000003, 00000002, 'Eastwoodbury Cres, Southend-on-Sea SS2 6YF', '', 'Woolsington, Newcastle upon Tyne NE13 8BZ', '', '', 4, '2024-02-21', '00:47:29', '', 00000002, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Pending', 1, '3 Hours', 'Bid Open for Limited Time', '', '', '', '', '2024-02-21 00:47:56'),
(00000003, 00000003, 00000002, 'Horley, Gatwick RH6 0NP', '', 'Manchester M90 1QX', '', '', 4, '2024-02-21', '08:26:08', '', 00000001, '', '', '', '00:00:00', '', 0, 367, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-21 08:26:26'),
(00000004, 00000003, 00000002, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore, Pakistan', '', '', 4, '2024-02-21', '00:00:00', '', 00000001, '', '', '', '00:00:00', '', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-21 22:39:40'),
(00000005, 00000003, 00000002, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore-Islamabad Motorway, Sabzazar Block E Sabzazar Housing Scheme Phase 1 & 2 Lahore, Pakistan', '', '', 4, '2024-02-21', '22:53:47', '', 00000001, '', '', '', '00:00:00', '', 950, 190, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-25 15:38:09'),
(00000006, 00000003, 00000002, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore City, Pakistan', '', '', 4, '2024-02-21', '11:02:00', '', 00000002, '', '', '', '00:00:00', '', 930, 186, 0, 0, 0, 0, 0, 0, 'Booked', 0, '', '', '', '', '', '', '2024-02-22 18:04:29'),
(00000007, 00000003, 00000002, 'Horley, Gatwick RH6 0NP', '', 'Manchester M90 1QX', '', '', 4, '2024-02-22', '12:53:00', '', 00000001, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-22 00:54:22'),
(00000008, 00000003, 00000002, 'Horley, Gatwick RH6 0NP', '', 'Birmingham B26 3QJ', '', '', 4, '2024-02-22', '12:55:00', '', 00000002, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-22 00:55:51'),
(00000009, 00000003, 00000002, 'Sargodha Road, Faisalabad, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-02-22', '01:25:00', '', 00000002, '', '', '', '00:00:00', '', 0, 6, 0, 0, 0, 0, 0, 0, 'Booked', 0, '', '', '', '', '', '', '2024-05-04 17:52:03'),
(00000010, 00000003, 00000003, 'Horley, Gatwick RH6 0NP', '', 'Longford TW6, UK', '', '', 4, '2024-02-24', '09:13:00', '', 00000002, '', '', '', '00:00:00', '', 325, 65, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-24 14:12:57'),
(00000011, 00000003, 00000002, 'Longford TW6, UK', '', 'Manchester M90 1QX', '', '', 7, '2024-02-24', '09:07:00', '', 00000006, '', '', '', '00:00:00', '', 1545, 309, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-24 21:08:02'),
(00000012, 00000003, 00000001, 'Jail Road', '', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '', '', '', '00:00:00', '', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-25 11:53:34'),
(00000013, 00000001, 00000001, 'Stansted Airport, Stansted, UK', '', 'London W2, UK', '', '', 1, '2024-02-25', '10:30:00', 'Return', 00000002, '1', 'Yes', 'Yrbv', '00:00:30', 'Meet inside', 1040, 69, 2, 3, 4, 5, 6, 0, 'Pending', 1, '', '', '', '', '', '', '2024-02-25 15:54:32'),
(00000014, 00000001, 00000001, 'Sunderland SR5, UK', '', 'Gf Wdn Fl Farnol House, Upperton Road, Eastbourne, UK', '', '', 2, '2024-02-03', '10:58:00', 'Return', 00000006, '1', '', '', '00:00:00', '', 8280, 552, 0, 0, 0, 0, 0, 0, 'Booked', 0, '', '', '', '', '', '', '2024-02-25 15:56:28'),
(00000015, 00000002, 00000001, 'Winchester, UK', '', 'Fort William, UK', '', '', 2, '2024-02-26', '11:12:00', 'Return', 00000003, '', 'Yes', '', '00:00:00', '', 12555, 837, 2, 0, 0, 0, 0, 0, 'Booked', 0, '', '', '', '', '', '', '2024-02-25 16:13:38'),
(00000016, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-25 19:03:18'),
(00000017, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:26:00', '', 00000003, '2', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-25 19:26:45'),
(00000018, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:26:00', '', 00000003, '2', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-25 19:27:08'),
(00000019, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:28:00', '', 00000001, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-25 19:29:28'),
(00000020, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:31:00', '', 00000001, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-25 19:31:43'),
(00000021, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:38:00', '', 00000001, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-02-25 19:39:03'),
(00000022, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore, Pakistan', '', '', 5, '2024-02-25', '07:41:00', '', 00000004, '4', '', '', '00:00:00', ' ', 915, 183, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '', '', '', '', '', '2024-02-25 07:42:49'),
(00000023, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Horley, Gatwick RH6 0NP', '', '', 4, '2024-02-25', '07:45:00', '', 00000001, '1', '', '', '00:00:00', ' ', 0, 8, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '', '', '', '', '', '2024-02-25 07:47:19'),
(00000024, 00000003, 00000003, 'Horley, Gatwick RH6 0NP', ' ', 'Manchester M90 1QX', '', '', 4, '2024-02-26', '12:28:00', '', 00000002, '1', '', '', '00:00:00', ' ', 0, 0, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '', '', '', '', '', '2024-02-26 12:29:43'),
(00000025, 00000003, 00000003, 'Plot 140 G, Block G Model Town, Lahore, Punjab, Pakistan', '[]', 'Manchester M90 1QX', '', '', 4, '2024-03-19', '03:52:00', '', 00000002, '1', '', '', '00:00:00', ' ', 45, 9, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '', '', '', '', '', '2024-03-19 08:51:46'),
(00000026, 00000003, 00000003, '27-Kacha, Jail Rd, behind Toyota Shaheen, Jinnah Town, Lahore, Punjab 54000, Pakistan', '[]', 'Airport Way, Luton LU2 9LY', '', '', 4, '2024-03-19', '03:55:00', '', 00000001, '1', '', '', '00:00:00', ' ', 40, 8, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '', '', '', '', '', '2024-03-19 08:54:25'),
(00000027, 00000003, 00000003, 'Plot 140 G, Block G Model Town, Lahore, Punjab, Pakistan', '[Horley, Gatwick RH6 0NP, Longford TW6, UK, Nottingham Place, London W1U 5NY, UK]', 'Horley, Gatwick RH6 0NP', '', '', 4, '2024-03-20', '16:01:50', '', 00000001, '1', '', '', '00:00:00', ' ', 40, 8, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-03-19 21:01:19'),
(00000028, 00000003, 00000003, 'Plot 139 G, Block G Model Town, Lahore, Punjab, Pakistan', '[]', 'Lt. Col. Sheraz Ali Khan Shaheed Road, Phase 3 GECH Society, Lahore, Pakistan', '', '', 4, '2024-03-19', '04:25:00', '', 00000001, '1', '', '', '00:00:00', ' ', 9, 2, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '', '', '', '', '', '2024-03-19 09:24:24'),
(00000029, 00000003, 00000003, 'Plot 140 G, Block G Model Town, Lahore, Punjab, Pakistan', '[]', 'Township Lahore, Pakistan', '', '', 4, '2024-03-19', '04:47:00', '', 00000002, '1', '', '', '00:00:00', ' ', 25, 5, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-03-19 21:46:28'),
(00000030, 00000003, 00000003, 'Plot 133 E, Block E Model Town, Lahore, Punjab, Pakistan', '[]', 'Shad Bagh, Lahore, Pakistan', '', '', 4, '2024-03-20', '10:24:00', '', 00000001, '1', '', '', '00:00:00', ' ', 85, 17, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-03-20 15:28:42'),
(00000031, 00000003, 00000003, 'Plot 139 G, Block G Model Town, Lahore, Punjab, Pakistan', '[Shadbagh Road, Shad Bagh, Lahore, Pakistan]', 'Liberty Market Gulberg III, Lahore, Pakistan', '', '', 4, '2024-03-20', '10:35:00', '', 00000001, '1', '', '', '00:00:00', ' ', 34, 7, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-03-20 15:37:25'),
(00000032, 00000003, 00000003, ' - C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', '[London W12, UK, London W14, UK, London W10, UK]', 'Longford TW6, UK', '', '', 5, '2024-03-20', '08:38:00', '', 00000004, '4', '', '', '00:00:00', ' ', 40, 8, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '', '', '', '', '', '2024-03-20 08:41:03'),
(00000033, 00000003, 00000003, ' - C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', '[Lahore, Pakistan, Lahore City, Pakistan]', 'Lahore, Pakistan', '', '', 4, '2024-03-20', '08:43:00', '', 00000002, '1', '', '', '00:00:00', ' ', 910, 182, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', '', '', '', '', '2024-03-20 20:45:02'),
(00000034, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '', 'Personel', '', '', '', '2024-03-21 21:46:19'),
(00000035, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '3 Hours', 'Bid Time is about 3 hours', 'Personel', '', '', '', '2024-05-04 17:00:05'),
(00000036, 00000003, 00000003, ' - C3RJ 7QR, Islam Nagar Faisalabad, Punjab, Pakistan', '[]', 'Lahore City, Pakistan', '', '', 4, '2024-03-21', '11:17:00', '', 00000001, '1', '', '', '00:00:00', ' ', 0, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '', '', 'Personal', '', '', '', '2024-05-03 12:43:06'),
(00000037, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Booked', 0, '', '', 'Personel', '', '', '', '2024-05-04 17:53:01'),
(00000038, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Booked', 0, '', '', 'Personel', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-05-02 16:48:14');

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
(00000002, 00000001, 'Desigred vehicle not available', '2024-02-25 01:39:14'),
(00000003, 00000023, 'no neeed', '2024-02-25 02:47:19'),
(00000004, 00000024, 'i change my mind', '2024-02-26 07:28:54'),
(00000005, 00000024, 'i change my mind', '2024-02-26 07:29:43'),
(00000006, 00000025, 'testing', '2024-03-19 03:51:46'),
(00000007, 00000026, 'testing', '2024-03-19 03:54:25'),
(00000008, 00000028, 'hh', '2024-03-19 04:24:24'),
(00000009, 00000032, 'yes', '2024-03-20 03:41:03'),
(00000010, 00000036, 'yes', '2024-03-21 06:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `c_id` int(11) UNSIGNED ZEROFILL NOT NULL,
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
  `acount_status` int(11) NOT NULL,
  `account_type` int(11) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `status`, `company_name`, `commission_type`, `percentage`, `fixed`, `acount_status`, `account_type`, `reg_date`) VALUES
(00000000001, 'Azib Ali Butt', 'eurodatatech@gmail.com', '+447552834179', 'asdf1234', '', 'Male', 'English', '65d4808f69592_1708425359.png', 'WJ123', '', '', 0, '', '', 0, 0, 1, 1, '2024-02-20 10:36:10'),
(00000000002, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'asdf1234', ',bj g vgvygc vycyc uxcxctrxd rdcxrx dddtrxtrxtxcxccxexetx', 'Male', 'Portuguese', '', '38000bj ', '', '', 0, '', '1', 50, 0, 1, 2, '2024-02-20 21:16:13'),
(00000000003, 'Atiq Ramazan', 'Prenero@gmail.com', '+447500000000', 'asdf1234', '', '', '', '', '', '', '', 0, '', '2', 20, 50, 0, 2, '2024-02-26 08:10:18');

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
(00000001, 00000001, 'Prenero Studio', 'avatar.png', '+923157524000', 'hello@prenero.com', 'admin@prenero.com', '+923157524000', 'prenero.com', '12345678', '15', '987654321', 15, 'Shop # 24', '38000', 'Faisalabad', 'Pakistan', 'English', 'GBP', 'Asia', '2023-11-03 09:47:30');

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
(00000001, 00000001, 'Jail Road Faisalabad.', '2024-02-27 04:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `delete_customers`
--

CREATE TABLE `delete_customers` (
  `del_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `request_msg` text NOT NULL,
  `delete_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL,
  `acount_status` int(10) NOT NULL,
  `driver_reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `latitude`, `longitude`, `status`, `acount_status`, `driver_reg_date`) VALUES
(00000001, 'Azib Ali ', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', 'london uk new#485 new uk', '', '../../img/drivers/1000046675.jpg', 'Male', 'English', 'London', '31.4414239', '73.0886877', 'On Ride', 1, '2024-05-04 16:44:34'),
(00000007, 'Atiq Ramzan', 'prenero123@gmail.com', '+92334652', '6266a', '', '', '', '', '', 'London', '', '', '', 0, '2024-05-03 07:21:04'),
(00000008, 'Mahtab', 'mahtab@gmail.com', '+447500000001', 'asdf1234', '', '', '', '', '', 'North West', '', '', '', 1, '2024-05-04 10:09:20'),
(00000009, 'Atiq Ramzan', 'prenero123@gmail.com', '+9233465212345', '6266a', '', '', '', '', '', 'London', '', '', '', 0, '2024-05-04 10:34:26');

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

--
-- Dumping data for table `driver_accounts`
--

INSERT INTO `driver_accounts` (`ac_id`, `d_id`, `invoice_id`, `d_com`, `com_status`, `pay_date`) VALUES
(00000001, 00000001, 00000001, '50', 'Unpaid', '2024-03-16 07:19:47'),
(00000002, 00000001, 00000002, '75', 'Unpaid', '2024-03-16 07:19:50'),
(00000003, 00000001, 00000003, '125', 'Paid', '2024-03-16 07:21:27');

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

--
-- Dumping data for table `driver_bank_details`
--

INSERT INTO `driver_bank_details` (`d_bank_id`, `d_id`, `bank_name`, `account_number`, `sort_code`, `date_added`) VALUES
(00000003, 00000001, 'Mezaan Bank', '01078562365', 'MZ5236', '2024-03-16 07:10:35'),
(00000004, 00000001, 'Mezaan Bank', '01078562365', 'MZ5236', '2024-03-16 09:09:52');

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
(00000001, 00000001, '65f1be9caaf41.jpg', '65f211694b1e4.jpg', '', '', '', '', '', '', '2024-03-10 20:37:53'),
(00000002, 00000004, '', '', '', '', '', '', '', '', '2024-03-15 21:11:38'),
(00000003, 00000005, '65f5cdca2b009.jpg', '65f5cddfecb5b.jpg', '65f5cdecaab8e.jpg', '65f5cdfeaa8ff.jpg', '65f5ce06cf732.jpg', '65f5ce0f3e30b.jpg', '65f5b35c5e659.jpg', '', '2024-03-16 02:54:58'),
(00000004, 00000007, '', '', '', '', '', '', '', '', '2024-05-03 07:21:04'),
(00000005, 00000008, '', '', '', '', '', '', '', '', '2024-05-04 08:08:40'),
(00000006, 00000009, '', '', '', '', '', '', '', '', '2024-05-04 10:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `driver_location`
--

CREATE TABLE `driver_location` (
  `loc_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_location`
--

INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(00000000001, 00000000001, '31.4414085', '73.0886461', '2024-02-22 01:03:53'),
(00000000002, 00000000001, '31.4414085', '73.0886483', '2024-02-22 01:04:02'),
(00000000003, 00000000001, '31.4414028', '73.0886492', '2024-02-22 01:04:12'),
(00000000004, 00000000001, '31.4414081', '73.0886469', '2024-02-22 01:04:22'),
(00000000005, 00000000001, '31.4414078', '73.0886461', '2024-02-22 01:04:35'),
(00000000006, 00000000001, '31.4414094', '73.0886476', '2024-02-22 01:04:43'),
(00000000007, 00000000001, '31.4414095', '73.0886476', '2024-02-22 01:04:52'),
(00000000008, 00000000001, '31.4414042', '73.0886516', '2024-02-22 01:05:02'),
(00000000009, 00000000001, '31.4414095', '73.0886475', '2024-02-22 01:05:14'),
(00000000010, 00000000001, '31.4414081', '73.0886481', '2024-02-22 01:05:22'),
(00000000011, 00000000001, '31.4414091', '73.0886474', '2024-02-22 01:05:32'),
(00000000012, 00000000001, '31.4413987', '73.0886432', '2024-02-22 01:05:43'),
(00000000013, 00000000001, '31.441409', '73.0886461', '2024-02-22 01:05:54'),
(00000000014, 00000000001, '31.4414039', '73.0886422', '2024-02-22 01:06:03'),
(00000000015, 00000000001, '31.4414029', '73.0886425', '2024-02-22 01:06:12'),
(00000000016, 00000000001, '31.4414004', '73.088649', '2024-02-22 01:06:22'),
(00000000017, 00000000001, '31.4414011', '73.0886421', '2024-02-22 01:06:32'),
(00000000018, 00000000001, '31.4413994', '73.088642', '2024-02-22 01:06:43'),
(00000000019, 00000000001, '31.4414022', '73.0886496', '2024-02-22 01:06:58'),
(00000000020, 00000000001, '31.4414023', '73.0886496', '2024-02-22 01:07:05'),
(00000000021, 00000000001, '31.4414093', '73.0886473', '2024-02-22 01:07:13'),
(00000000022, 00000000001, '31.441409', '73.0886461', '2024-02-22 01:07:23'),
(00000000023, 00000000001, '31.4414091', '73.0886473', '2024-02-22 01:07:32'),
(00000000024, 00000000001, '31.4414005', '73.0886424', '2024-02-22 01:07:43'),
(00000000025, 00000000001, '31.4413978', '73.0886455', '2024-02-22 01:07:53'),
(00000000026, 00000000001, '31.4414008', '73.0886411', '2024-02-22 01:08:02'),
(00000000027, 00000000001, '31.4414077', '73.0886462', '2024-02-22 01:08:12'),
(00000000028, 00000000001, '31.441403', '73.0886493', '2024-02-22 01:08:22'),
(00000000029, 00000000001, '31.441401', '73.0886415', '2024-02-22 01:08:33'),
(00000000030, 00000000001, '31.441401', '73.088642', '2024-02-22 01:08:42'),
(00000000031, 00000000001, '31.4414011', '73.0886414', '2024-02-22 01:08:52'),
(00000000032, 00000000001, '31.4414087', '73.0886469', '2024-02-22 01:09:04'),
(00000000033, 00000000001, '31.4414031', '73.0886489', '2024-02-22 01:09:12'),
(00000000034, 00000000001, '31.441401', '73.0886407', '2024-02-22 01:09:25'),
(00000000035, 00000000001, '31.4414031', '73.088649', '2024-02-22 01:09:32'),
(00000000036, 00000000001, '31.4414034', '73.0886491', '2024-02-22 01:09:42'),
(00000000037, 00000000001, '31.441401', '73.0886445', '2024-02-22 01:09:52'),
(00000000038, 00000000001, '31.4414048', '73.0886483', '2024-02-22 01:10:03'),
(00000000039, 00000000001, '31.441409', '73.0886512', '2024-02-22 01:10:12'),
(00000000040, 00000000001, '31.4413997', '73.088647', '2024-02-22 01:10:22'),
(00000000041, 00000000001, '31.4414005', '73.0886454', '2024-02-22 01:10:32'),
(00000000042, 00000000001, '31.4414034', '73.0886485', '2024-02-22 01:10:43'),
(00000000043, 00000000001, '31.4414034', '73.0886487', '2024-02-22 01:10:52'),
(00000000044, 00000000001, '31.4414034', '73.0886482', '2024-02-22 01:11:03'),
(00000000045, 00000000001, '31.4414005', '73.0886476', '2024-02-22 01:11:12'),
(00000000046, 00000000001, '31.4414034', '73.0886484', '2024-02-22 01:11:22'),
(00000000047, 00000000001, '31.4414012', '73.0886457', '2024-02-22 01:11:32'),
(00000000048, 00000000001, '31.4414034', '73.0886485', '2024-02-22 01:11:42'),
(00000000049, 00000000001, '31.4414007', '73.0886462', '2024-02-22 01:11:52'),
(00000000050, 00000000001, '31.4414017', '73.0886463', '2024-02-22 01:12:03'),
(00000000051, 00000000001, '31.4414012', '73.0886462', '2024-02-22 01:12:13'),
(00000000052, 00000000001, '31.4414', '73.0886471', '2024-02-22 01:12:22'),
(00000000053, 00000000001, '31.4414035', '73.0886485', '2024-02-22 01:12:33'),
(00000000054, 00000000001, '31.4414009', '73.0886456', '2024-02-22 01:12:43'),
(00000000055, 00000000001, '31.4414033', '73.0886486', '2024-02-22 01:12:55'),
(00000000056, 00000000001, '31.4414034', '73.0886482', '2024-02-22 01:13:03'),
(00000000057, 00000000001, '31.4413999', '73.0886484', '2024-02-22 01:13:12'),
(00000000058, 00000000001, '31.4414039', '73.0886476', '2024-02-22 01:13:22'),
(00000000059, 00000000001, '31.4414034', '73.088648', '2024-02-22 01:13:34'),
(00000000060, 00000000001, '31.4414033', '73.0886484', '2024-02-22 01:13:42'),
(00000000061, 00000000001, '31.4414034', '73.0886483', '2024-02-22 01:13:53'),
(00000000062, 00000000001, '31.4414034', '73.0886486', '2024-02-22 01:14:02'),
(00000000063, 00000000001, '31.4414034', '73.0886483', '2024-02-22 01:14:12'),
(00000000064, 00000000001, '31.4414034', '73.0886485', '2024-02-22 01:14:22'),
(00000000065, 00000000001, '31.4414009', '73.0886444', '2024-02-22 01:14:32'),
(00000000066, 00000000001, '31.4414018', '73.088647', '2024-02-22 01:14:44'),
(00000000067, 00000000001, '31.4414083', '73.0886466', '2024-02-22 01:14:52'),
(00000000068, 00000000001, '31.4414034', '73.0886489', '2024-02-22 01:15:05'),
(00000000069, 00000000001, '31.4414032', '73.088649', '2024-02-22 01:15:13'),
(00000000070, 00000000001, '31.4414034', '73.0886487', '2024-02-22 01:15:23'),
(00000000071, 00000000001, '31.4414034', '73.0886491', '2024-02-22 01:15:33'),
(00000000072, 00000000001, '31.4414032', '73.0886489', '2024-02-22 01:15:42'),
(00000000073, 00000000001, '31.4414033', '73.0886487', '2024-02-22 01:15:53'),
(00000000074, 00000000001, '31.4414033', '73.0886485', '2024-02-22 01:16:02'),
(00000000075, 00000000001, '31.4414011', '73.088649', '2024-02-22 01:16:12'),
(00000000076, 00000000001, '31.4414034', '73.0886487', '2024-02-22 01:16:22'),
(00000000077, 00000000001, '31.4414008', '73.0886488', '2024-02-22 01:16:32'),
(00000000078, 00000000001, '31.4414011', '73.0886428', '2024-02-22 01:16:42'),
(00000000079, 00000000001, '31.4414034', '73.0886483', '2024-02-22 01:16:53'),
(00000000080, 00000000001, '31.4414034', '73.0886486', '2024-02-22 01:17:02'),
(00000000081, 00000000001, '31.4414087', '73.0886483', '2024-02-22 01:17:13'),
(00000000082, 00000000001, '31.4414033', '73.0886487', '2024-02-22 01:17:24'),
(00000000083, 00000000001, '31.4414072', '73.0886471', '2024-02-22 01:17:32'),
(00000000084, 00000000001, '31.4414009', '73.0886437', '2024-02-22 01:17:43'),
(00000000085, 00000000001, '31.4414034', '73.0886492', '2024-02-22 01:18:05'),
(00000000086, 00000000001, '31.4414005', '73.0886439', '2024-02-22 01:18:23'),
(00000000087, 00000000001, '31.4414033', '73.0886489', '2024-02-22 01:18:35'),
(00000000088, 00000000001, '31.4414036', '73.0886486', '2024-02-22 01:18:44'),
(00000000089, 00000000001, '31.4414036', '73.0886486', '2024-02-22 01:18:47'),
(00000000090, 00000000001, '31.4414033', '73.0886488', '2024-02-22 01:18:51'),
(00000000091, 00000000001, '31.4414034', '73.0886489', '2024-02-22 01:19:03'),
(00000000092, 00000000001, '31.4414009', '73.0886443', '2024-02-22 01:19:10'),
(00000000093, 00000000001, '31.441401', '73.0886436', '2024-02-22 01:19:17'),
(00000000094, 00000000001, '31.4414009', '73.0886445', '2024-02-22 01:19:31'),
(00000000095, 00000000001, '31.441401', '73.0886452', '2024-02-22 01:19:38'),
(00000000096, 00000000001, '31.441401', '73.0886451', '2024-02-22 01:19:44'),
(00000000097, 00000000001, '31.4414034', '73.0886488', '2024-02-22 01:19:53'),
(00000000098, 00000000001, '31.4414033', '73.0886485', '2024-02-22 01:20:03'),
(00000000099, 00000000001, '31.4414005', '73.0886454', '2024-02-22 01:20:12'),
(00000000100, 00000000001, '31.4414064', '73.0886484', '2024-02-22 01:20:23'),
(00000000101, 00000000001, '31.4414077', '73.0886488', '2024-02-22 01:20:36'),
(00000000102, 00000000001, '31.4414032', '73.0886488', '2024-02-22 01:20:44'),
(00000000103, 00000000001, '31.441401', '73.0886435', '2024-02-22 01:20:52'),
(00000000104, 00000000001, '31.4414034', '73.0886491', '2024-02-22 01:21:02'),
(00000000105, 00000000001, '31.4414036', '73.088649', '2024-02-22 01:21:13'),
(00000000106, 00000000001, '31.4414006', '73.0886443', '2024-02-22 01:21:30'),
(00000000107, 00000000001, '31.4414034', '73.0886491', '2024-02-22 01:21:52'),
(00000000108, 00000000001, '31.4414008', '73.0886453', '2024-02-22 01:21:58'),
(00000000109, 00000000001, '31.4414009', '73.0886457', '2024-02-22 01:22:01'),
(00000000110, 00000000001, '31.4414058', '73.0886477', '2024-02-22 01:22:06'),
(00000000111, 00000000001, '31.4414034', '73.0886487', '2024-02-22 01:22:15'),
(00000000112, 00000000001, '31.4414034', '73.0886485', '2024-02-22 01:22:23'),
(00000000113, 00000000001, '31.4414009', '73.0886452', '2024-02-22 01:22:36'),
(00000000114, 00000000001, '31.4414034', '73.088648', '2024-02-22 01:22:45'),
(00000000115, 00000000001, '31.4414034', '73.0886489', '2024-02-22 01:22:54'),
(00000000116, 00000000001, '31.4414033', '73.0886487', '2024-02-22 01:23:04'),
(00000000117, 00000000001, '31.4414034', '73.088649', '2024-02-22 01:23:16'),
(00000000118, 00000000001, '31.4414033', '73.0886478', '2024-02-22 01:23:28'),
(00000000119, 00000000001, '31.4414034', '73.0886489', '2024-02-22 01:23:35'),
(00000000120, 00000000001, '31.4414011', '73.0886424', '2024-02-22 01:23:44'),
(00000000121, 00000000001, '31.4414003', '73.0886463', '2024-02-22 01:23:54'),
(00000000122, 00000000001, '31.4414011', '73.0886418', '2024-02-22 01:24:05'),
(00000000123, 00000000001, '31.4414034', '73.0886492', '2024-02-22 01:24:16'),
(00000000124, 00000000001, '31.4414014', '73.0886417', '2024-02-22 01:24:25'),
(00000000125, 00000000001, '31.4414033', '73.0886493', '2024-02-22 01:24:36'),
(00000000126, 00000000001, '31.4414033', '73.0886492', '2024-02-22 01:24:49'),
(00000000127, 00000000001, '31.4414034', '73.0886491', '2024-02-22 01:24:56'),
(00000000128, 00000000001, '31.4414034', '73.0886483', '2024-02-22 01:25:06'),
(00000000129, 00000000001, '31.441401', '73.0886436', '2024-02-22 01:25:33'),
(00000000130, 00000000001, '31.4414015', '73.0886415', '2024-02-22 01:25:33'),
(00000000131, 00000000001, '31.4414012', '73.0886442', '2024-02-22 01:25:37'),
(00000000132, 00000000001, '31.4414034', '73.0886482', '2024-02-22 01:25:47'),
(00000000133, 00000000001, '31.4414048', '73.0886496', '2024-02-22 01:26:05'),
(00000000134, 00000000001, '31.4414009', '73.088643', '2024-02-22 01:26:08'),
(00000000135, 00000000001, '31.4414037', '73.0886425', '2024-02-22 01:26:15'),
(00000000136, 00000000001, '31.4414011', '73.0886442', '2024-02-22 01:26:24'),
(00000000137, 00000000001, '31.4414082', '73.088647', '2024-02-22 01:26:35'),
(00000000138, 00000000001, '31.4414086', '73.0886469', '2024-02-22 01:26:47'),
(00000000139, 00000000001, '31.4414006', '73.088646', '2024-02-22 01:26:57'),
(00000000140, 00000000001, '31.441419', '73.0886442', '2024-02-22 01:27:05'),
(00000000141, 00000000001, '31.4414017', '73.088646', '2024-02-22 01:27:23'),
(00000000142, 00000000001, '31.4414017', '73.0886461', '2024-02-22 01:27:28'),
(00000000143, 00000000001, '31.4414035', '73.0886489', '2024-02-22 01:27:35'),
(00000000144, 00000000001, '31.4367107', '73.0894414', '2024-02-23 07:09:02'),
(00000000145, 00000000001, '31.4367077', '73.0894462', '2024-02-23 07:09:12'),
(00000000146, 00000000001, '31.4367108', '73.0894376', '2024-02-23 07:09:23'),
(00000000147, 00000000001, '31.4367114', '73.0894357', '2024-02-23 07:09:32'),
(00000000148, 00000000001, '31.4366978', '73.0894632', '2024-02-23 07:09:43'),
(00000000149, 00000000001, '31.436711', '73.0894402', '2024-02-23 07:09:52'),
(00000000150, 00000000001, '31.4367049', '73.0894546', '2024-02-23 07:10:02'),
(00000000151, 00000000001, '31.4367055', '73.0894556', '2024-02-23 07:10:12'),
(00000000152, 00000000001, '31.4367124', '73.0894471', '2024-02-23 07:10:22'),
(00000000153, 00000000001, '31.4367064', '73.0894536', '2024-02-23 07:10:32'),
(00000000154, 00000000001, '31.4367075', '73.0894507', '2024-02-23 07:10:42'),
(00000000155, 00000000001, '31.4367061', '73.0894537', '2024-02-23 07:10:54'),
(00000000156, 00000000001, '31.436705', '73.0894524', '2024-02-23 07:11:02'),
(00000000157, 00000000001, '31.4367075', '73.0894406', '2024-02-23 07:11:12'),
(00000000158, 00000000001, '31.4367101', '73.0894417', '2024-02-23 07:11:22'),
(00000000159, 00000000001, '31.4367049', '73.0894561', '2024-02-23 07:11:34'),
(00000000160, 00000000001, '31.4365943', '73.0895724', '2024-02-23 07:11:44'),
(00000000161, 00000000001, '31.4365873', '73.0895823', '2024-02-23 07:11:55'),
(00000000162, 00000000001, '31.4367059', '73.0894512', '2024-02-23 07:12:04'),
(00000000163, 00000000001, '31.4367101', '73.0894417', '2024-02-23 07:12:12'),
(00000000164, 00000000001, '31.4367126', '73.0894355', '2024-02-23 07:12:22'),
(00000000165, 00000000001, '31.4367028', '73.0894551', '2024-02-23 07:12:33'),
(00000000166, 00000000001, '31.4367027', '73.0894519', '2024-02-23 07:12:42'),
(00000000167, 00000000001, '31.4365967', '73.0895734', '2024-02-23 07:12:52'),
(00000000168, 00000000001, '31.4367049', '73.0894538', '2024-02-23 07:13:02'),
(00000000169, 00000000001, '31.4366766', '73.0894796', '2024-02-23 07:13:12'),
(00000000170, 00000000001, '31.4367057', '73.0894543', '2024-02-23 07:13:22'),
(00000000171, 00000000001, '31.4367111', '73.0894468', '2024-02-23 07:13:32'),
(00000000172, 00000000001, '31.4367083', '73.0894424', '2024-02-23 07:13:42'),
(00000000173, 00000000001, '31.436708', '73.0894504', '2024-02-23 07:13:52'),
(00000000174, 00000000001, '31.4367129', '73.089442', '2024-02-23 07:14:02'),
(00000000175, 00000000001, '31.4367008', '73.0894599', '2024-02-23 07:14:12'),
(00000000176, 00000000001, '31.4367079', '73.089453', '2024-02-23 07:14:23'),
(00000000177, 00000000001, '31.4367087', '73.0894463', '2024-02-23 07:14:33'),
(00000000178, 00000000001, '31.4367059', '73.0894501', '2024-02-23 07:14:43'),
(00000000179, 00000000001, '31.4367073', '73.0894492', '2024-02-23 07:14:53'),
(00000000180, 00000000001, '31.4367067', '73.0894427', '2024-02-23 07:15:03'),
(00000000181, 00000000001, '31.4367116', '73.0894399', '2024-02-23 07:15:12'),
(00000000182, 00000000001, '31.4367065', '73.0894503', '2024-02-23 07:15:22'),
(00000000183, 00000000001, '31.4367063', '73.0894512', '2024-02-23 07:15:33'),
(00000000184, 00000000001, '31.4367105', '73.0894471', '2024-02-23 07:15:42'),
(00000000185, 00000000001, '31.4366116', '73.0895587', '2024-02-23 07:15:52'),
(00000000186, 00000000001, '31.4367062', '73.0894519', '2024-02-23 07:16:07'),
(00000000187, 00000000001, '31.4366875', '73.0894679', '2024-02-23 07:16:13'),
(00000000188, 00000000001, '31.4367034', '73.0894548', '2024-02-23 07:16:22'),
(00000000189, 00000000001, '31.4367048', '73.0894523', '2024-02-23 07:16:33'),
(00000000190, 00000000001, '31.4367016', '73.0894563', '2024-02-23 07:16:42'),
(00000000191, 00000000001, '31.4367033', '73.089457', '2024-02-23 07:16:53'),
(00000000192, 00000000001, '31.4367066', '73.0894507', '2024-02-23 07:17:02'),
(00000000193, 00000000001, '31.4367061', '73.0894505', '2024-02-23 07:17:13'),
(00000000194, 00000000001, '31.4366961', '73.0894611', '2024-02-23 07:17:22'),
(00000000195, 00000000001, '31.4367076', '73.0894519', '2024-02-23 07:17:32'),
(00000000196, 00000000001, '31.4367055', '73.089455', '2024-02-23 07:17:42'),
(00000000197, 00000000001, '31.4367085', '73.0894479', '2024-02-23 07:17:52'),
(00000000198, 00000000001, '31.4367018', '73.0894582', '2024-02-23 07:18:02'),
(00000000199, 00000000001, '31.4367028', '73.089455', '2024-02-23 07:18:13'),
(00000000200, 00000000001, '31.4367039', '73.0894537', '2024-02-23 07:18:22'),
(00000000201, 00000000001, '31.4367078', '73.0894537', '2024-02-23 07:18:32'),
(00000000202, 00000000001, '31.4367093', '73.0894505', '2024-02-23 07:18:42'),
(00000000203, 00000000001, '31.4367076', '73.089449', '2024-02-23 07:18:52'),
(00000000204, 00000000001, '31.4367073', '73.0894491', '2024-02-23 07:19:02'),
(00000000205, 00000000001, '31.4367064', '73.0894513', '2024-02-23 07:19:13'),
(00000000206, 00000000001, '31.4367048', '73.0894566', '2024-02-23 07:19:24'),
(00000000207, 00000000001, '31.4367033', '73.0894598', '2024-02-23 07:19:32'),
(00000000208, 00000000001, '31.4367074', '73.0894498', '2024-02-23 07:19:46'),
(00000000209, 00000000001, '31.4367109', '73.0894499', '2024-02-23 07:19:52'),
(00000000210, 00000000001, '31.4366972', '73.0894667', '2024-02-23 07:20:02'),
(00000000211, 00000000001, '31.436708', '73.0894488', '2024-02-23 07:20:12'),
(00000000212, 00000000001, '31.4365956', '73.0895711', '2024-02-23 07:20:26'),
(00000000213, 00000000001, '31.4367104', '73.08945', '2024-02-23 07:20:33'),
(00000000214, 00000000001, '31.4367123', '73.0894375', '2024-02-23 07:20:42'),
(00000000215, 00000000001, '31.4367052', '73.0894542', '2024-02-23 07:20:52'),
(00000000216, 00000000001, '31.4367082', '73.0894535', '2024-02-23 07:21:02'),
(00000000217, 00000000001, '31.4367061', '73.0894523', '2024-02-23 07:21:13'),
(00000000218, 00000000001, '31.4367104', '73.0894405', '2024-02-23 07:21:22'),
(00000000219, 00000000001, '31.4367023', '73.0894563', '2024-02-23 07:21:32'),
(00000000220, 00000000001, '31.4367078', '73.08945', '2024-02-23 07:21:42'),
(00000000221, 00000000001, '31.436705', '73.0894544', '2024-02-23 07:21:54'),
(00000000222, 00000000001, '31.4366977', '73.0894613', '2024-02-23 07:22:02'),
(00000000223, 00000000001, '31.4367023', '73.0894566', '2024-02-23 07:22:12'),
(00000000224, 00000000001, '31.4367067', '73.089451', '2024-02-23 07:22:22'),
(00000000225, 00000000001, '31.4367132', '73.0894446', '2024-02-23 07:22:32'),
(00000000226, 00000000001, '31.4366984', '73.0894613', '2024-02-23 07:22:42'),
(00000000227, 00000000001, '31.4367064', '73.0894518', '2024-02-23 07:22:53'),
(00000000228, 00000000001, '31.4367003', '73.0894589', '2024-02-23 07:23:02'),
(00000000229, 00000000001, '31.4367041', '73.089455', '2024-02-23 07:23:15'),
(00000000230, 00000000001, '31.436605', '73.0895602', '2024-02-23 07:23:23'),
(00000000231, 00000000001, '31.4366993', '73.0894602', '2024-02-23 07:23:32'),
(00000000232, 00000000001, '31.4367089', '73.0894481', '2024-02-23 07:23:42'),
(00000000233, 00000000001, '31.436692', '73.0894659', '2024-02-23 07:23:52'),
(00000000234, 00000000001, '31.4366987', '73.0894598', '2024-02-23 07:24:02'),
(00000000235, 00000000001, '31.4367039', '73.0894497', '2024-02-23 07:24:12'),
(00000000236, 00000000001, '31.4367068', '73.0894403', '2024-02-23 07:24:22'),
(00000000237, 00000000001, '31.4367042', '73.0894569', '2024-02-23 07:24:34'),
(00000000238, 00000000001, '31.4367048', '73.0894541', '2024-02-23 07:24:42'),
(00000000239, 00000000001, '31.436699', '73.0894614', '2024-02-23 07:24:52'),
(00000000240, 00000000001, '31.4367122', '73.0894422', '2024-02-23 07:25:02'),
(00000000241, 00000000001, '31.4367022', '73.0894567', '2024-02-23 07:25:13'),
(00000000242, 00000000001, '31.4367156', '73.0894478', '2024-02-23 07:25:22'),
(00000000243, 00000000001, '31.4367084', '73.0894491', '2024-02-23 07:25:32'),
(00000000244, 00000000001, '31.4367067', '73.0894513', '2024-02-23 07:25:45'),
(00000000245, 00000000001, '31.4367001', '73.0894638', '2024-02-23 07:25:52'),
(00000000246, 00000000001, '31.4367115', '73.0894396', '2024-02-23 07:26:02'),
(00000000247, 00000000001, '31.4367091', '73.0894498', '2024-02-23 07:26:12'),
(00000000248, 00000000001, '31.4367086', '73.0894475', '2024-02-23 07:26:24'),
(00000000249, 00000000001, '31.436709', '73.0894406', '2024-02-23 07:26:33'),
(00000000250, 00000000001, '31.4367129', '73.089446', '2024-02-23 07:26:42'),
(00000000251, 00000000001, '31.4367034', '73.0894558', '2024-02-23 07:26:52'),
(00000000252, 00000000001, '31.43671', '73.0894478', '2024-02-23 07:27:02'),
(00000000253, 00000000001, '31.4366217', '73.0895489', '2024-02-23 07:27:12'),
(00000000254, 00000000001, '31.4366906', '73.0894688', '2024-02-23 07:27:22'),
(00000000255, 00000000001, '31.4367047', '73.0894544', '2024-02-23 07:27:32'),
(00000000256, 00000000001, '31.436713', '73.0894461', '2024-02-23 07:27:42'),
(00000000257, 00000000001, '31.4367174', '73.0894403', '2024-02-23 07:27:53'),
(00000000258, 00000000001, '31.4367078', '73.0894517', '2024-02-23 07:28:02'),
(00000000259, 00000000001, '31.4367171', '73.0894443', '2024-02-23 07:28:12'),
(00000000260, 00000000001, '31.4367098', '73.0894428', '2024-02-23 07:28:22'),
(00000000261, 00000000001, '31.4367132', '73.0894449', '2024-02-23 07:28:32'),
(00000000262, 00000000001, '31.4367148', '73.0894428', '2024-02-23 07:28:42'),
(00000000263, 00000000001, '31.4367079', '73.0894512', '2024-02-23 07:28:52'),
(00000000264, 00000000001, '31.4367034', '73.0894567', '2024-02-23 07:29:02'),
(00000000265, 00000000001, '31.4365965', '73.0895751', '2024-02-23 07:29:13'),
(00000000266, 00000000001, '31.4367022', '73.0894597', '2024-02-23 07:29:22'),
(00000000267, 00000000001, '31.4367055', '73.089457', '2024-02-23 07:29:34'),
(00000000268, 00000000001, '31.4367059', '73.0894531', '2024-02-23 07:29:42'),
(00000000269, 00000000001, '31.4367117', '73.0894486', '2024-02-23 07:29:53'),
(00000000270, 00000000001, '31.4367079', '73.089452', '2024-02-23 07:30:04'),
(00000000271, 00000000001, '31.436711', '73.0894473', '2024-02-23 07:30:12'),
(00000000272, 00000000001, '31.4367099', '73.0894418', '2024-02-23 07:30:22'),
(00000000273, 00000000001, '31.4367101', '73.0894475', '2024-02-23 07:30:32'),
(00000000274, 00000000001, '31.4367023', '73.0894574', '2024-02-23 07:30:43'),
(00000000275, 00000000001, '31.4367072', '73.0894515', '2024-02-23 07:30:53'),
(00000000276, 00000000001, '31.4367056', '73.0894539', '2024-02-23 07:31:03'),
(00000000277, 00000000001, '31.4367105', '73.0894485', '2024-02-23 07:31:12'),
(00000000278, 00000000001, '31.4367058', '73.0894535', '2024-02-23 07:31:22'),
(00000000279, 00000000001, '31.4367099', '73.0894448', '2024-02-23 07:31:32'),
(00000000280, 00000000001, '31.4366985', '73.0894637', '2024-02-23 07:31:42'),
(00000000281, 00000000001, '31.4367', '73.0894611', '2024-02-23 07:31:52'),
(00000000282, 00000000001, '31.4367003', '73.0894588', '2024-02-23 07:32:05'),
(00000000283, 00000000001, '31.4367078', '73.0894495', '2024-02-23 07:32:12'),
(00000000284, 00000000001, '31.4367067', '73.0894509', '2024-02-23 07:32:22'),
(00000000285, 00000000001, '31.4367087', '73.0894472', '2024-02-23 07:32:34'),
(00000000286, 00000000001, '31.436711', '73.0894401', '2024-02-23 07:32:42'),
(00000000287, 00000000001, '31.4367065', '73.0894522', '2024-02-23 07:32:52'),
(00000000288, 00000000001, '31.4367062', '73.0894541', '2024-02-23 07:33:02'),
(00000000289, 00000000001, '31.4367065', '73.0894509', '2024-02-23 07:33:12'),
(00000000290, 00000000001, '31.4367067', '73.089453', '2024-02-23 07:33:22'),
(00000000291, 00000000001, '31.4367036', '73.089454', '2024-02-23 07:33:32'),
(00000000292, 00000000001, '31.4367038', '73.089454', '2024-02-23 07:33:44'),
(00000000293, 00000000001, '31.4367064', '73.0894533', '2024-02-23 07:33:52'),
(00000000294, 00000000001, '31.4367027', '73.0894583', '2024-02-23 07:34:02'),
(00000000295, 00000000001, '31.4367062', '73.0894548', '2024-02-23 07:34:12'),
(00000000296, 00000000001, '31.4367078', '73.0894441', '2024-02-23 07:34:22'),
(00000000297, 00000000001, '31.4365971', '73.0895751', '2024-02-23 07:34:32'),
(00000000298, 00000000001, '31.4367063', '73.0894509', '2024-02-23 07:34:42'),
(00000000299, 00000000001, '31.4367077', '73.0894539', '2024-02-23 07:34:55'),
(00000000300, 00000000001, '31.4367098', '73.0894495', '2024-02-23 07:35:06'),
(00000000301, 00000000001, '31.4367084', '73.089449', '2024-02-23 07:35:16'),
(00000000302, 00000000001, '31.4365852', '73.0895848', '2024-02-23 07:35:27'),
(00000000303, 00000000001, '31.4367013', '73.0894557', '2024-02-23 07:35:38'),
(00000000304, 00000000001, '31.4367013', '73.0894557', '2024-02-23 07:35:42'),
(00000000305, 00000000001, '31.4367021', '73.0894559', '2024-02-23 07:35:53'),
(00000000306, 00000000001, '31.4367127', '73.089445', '2024-02-23 07:36:04'),
(00000000307, 00000000001, '31.4365824', '73.0895908', '2024-02-23 07:36:14'),
(00000000308, 00000000001, '31.4367013', '73.0894596', '2024-02-23 07:36:25'),
(00000000309, 00000000001, '31.4367046', '73.0894528', '2024-02-23 07:36:36'),
(00000000310, 00000000001, '31.4365759', '73.0896004', '2024-02-23 07:36:46'),
(00000000311, 00000000001, '31.4367001', '73.0894579', '2024-02-23 07:36:57'),
(00000000312, 00000000001, '31.4367001', '73.0894579', '2024-02-23 07:37:02'),
(00000000313, 00000000001, '31.4367049', '73.0894535', '2024-02-23 07:37:13'),
(00000000314, 00000000001, '31.4367044', '73.0894543', '2024-02-23 07:37:24'),
(00000000315, 00000000001, '31.4366965', '73.0894652', '2024-02-23 07:37:34'),
(00000000316, 00000000001, '31.4367053', '73.0894544', '2024-02-23 07:37:46'),
(00000000317, 00000000001, '31.4366787', '73.0894787', '2024-02-23 07:37:56'),
(00000000318, 00000000001, '31.4367058', '73.0894517', '2024-02-23 07:38:07'),
(00000000319, 00000000001, '31.4367128', '73.0894376', '2024-02-23 07:38:19'),
(00000000320, 00000000001, '31.4367128', '73.0894376', '2024-02-23 07:38:22'),
(00000000321, 00000000001, '31.4365944', '73.0895727', '2024-02-23 07:38:33'),
(00000000322, 00000000001, '31.4367138', '73.0894456', '2024-02-23 07:38:42'),
(00000000323, 00000000001, '31.4367128', '73.0894483', '2024-02-23 07:38:52'),
(00000000324, 00000000001, '31.4365919', '73.0895776', '2024-02-23 07:39:02'),
(00000000325, 00000000001, '31.4366821', '73.0894754', '2024-02-23 07:39:12'),
(00000000326, 00000000001, '31.4366963', '73.0894627', '2024-02-23 07:39:22'),
(00000000327, 00000000001, '31.4367002', '73.0894578', '2024-02-23 07:39:32'),
(00000000328, 00000000001, '31.4367066', '73.0894515', '2024-02-23 07:39:42'),
(00000000329, 00000000001, '31.4367096', '73.0894483', '2024-02-23 07:39:55'),
(00000000330, 00000000001, '31.4367044', '73.0894549', '2024-02-23 07:40:03'),
(00000000331, 00000000001, '31.4367065', '73.0894539', '2024-02-23 07:40:12'),
(00000000332, 00000000001, '31.4366998', '73.0894582', '2024-02-23 07:40:22'),
(00000000333, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:54'),
(00000000334, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:54'),
(00000000335, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:54'),
(00000000336, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:54'),
(00000000337, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:54'),
(00000000338, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:54'),
(00000000339, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000340, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000341, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000342, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000343, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000344, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000345, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000346, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000347, 00000000001, '31.4367072', '73.0894527', '2024-02-23 07:42:55'),
(00000000348, 00000000001, '31.4366988', '73.089459', '2024-02-23 07:43:02'),
(00000000349, 00000000001, '31.4366998', '73.0894582', '2024-02-23 07:43:12'),
(00000000350, 00000000001, '31.4366914', '73.089468', '2024-02-23 07:43:22'),
(00000000351, 00000000001, '31.4366996', '73.0894607', '2024-02-23 07:43:32'),
(00000000352, 00000000001, '31.4366997', '73.08946', '2024-02-23 07:43:42'),
(00000000353, 00000000001, '31.4366941', '73.0894624', '2024-02-23 07:43:52'),
(00000000354, 00000000001, '31.4366985', '73.089459', '2024-02-23 07:44:02'),
(00000000355, 00000000001, '31.4365842', '73.0895896', '2024-02-23 07:44:12'),
(00000000356, 00000000001, '31.4367024', '73.0894565', '2024-02-23 07:44:26'),
(00000000357, 00000000001, '31.4366977', '73.0894617', '2024-02-23 07:44:32'),
(00000000358, 00000000001, '31.436705', '73.0894546', '2024-02-23 07:44:42'),
(00000000359, 00000000001, '31.4367099', '73.0894416', '2024-02-23 07:44:55'),
(00000000360, 00000000001, '31.4367081', '73.0894469', '2024-02-23 07:45:02'),
(00000000361, 00000000001, '31.4367069', '73.0894497', '2024-02-23 07:45:12'),
(00000000362, 00000000001, '31.4367088', '73.0894526', '2024-02-23 07:45:22'),
(00000000363, 00000000001, '31.4367082', '73.0894536', '2024-02-23 07:45:32'),
(00000000364, 00000000001, '31.4367035', '73.0894581', '2024-02-23 07:45:42'),
(00000000365, 00000000001, '31.4367087', '73.0894461', '2024-02-23 07:45:52'),
(00000000366, 00000000001, '31.4367127', '73.0894427', '2024-02-23 07:46:02'),
(00000000367, 00000000001, '31.4367074', '73.0894512', '2024-02-23 07:46:12'),
(00000000368, 00000000001, '31.4367084', '73.0894489', '2024-02-23 07:46:23'),
(00000000369, 00000000001, '31.4367047', '73.0894551', '2024-02-23 07:46:32'),
(00000000370, 00000000001, '31.4367062', '73.0894526', '2024-02-23 07:46:42'),
(00000000371, 00000000001, '31.4367055', '73.0894541', '2024-02-23 07:46:52'),
(00000000372, 00000000001, '31.4367089', '73.0894482', '2024-02-23 07:47:02'),
(00000000373, 00000000001, '31.4367041', '73.0894549', '2024-02-23 07:47:12'),
(00000000374, 00000000001, '31.436707', '73.0894516', '2024-02-23 07:47:22'),
(00000000375, 00000000001, '31.4367001', '73.0894591', '2024-02-23 07:47:32'),
(00000000376, 00000000001, '31.4367081', '73.0894507', '2024-02-23 07:47:42'),
(00000000377, 00000000001, '31.436697', '73.0894613', '2024-02-23 07:47:53'),
(00000000378, 00000000001, '31.4367035', '73.089456', '2024-02-23 07:48:02'),
(00000000379, 00000000001, '31.4367105', '73.0894405', '2024-02-23 07:48:14'),
(00000000380, 00000000001, '31.4367044', '73.0894542', '2024-02-23 07:48:23'),
(00000000381, 00000000001, '31.4367053', '73.0894541', '2024-02-23 07:48:32'),
(00000000382, 00000000001, '31.4367067', '73.0894525', '2024-02-23 07:48:42'),
(00000000383, 00000000001, '31.4367073', '73.0894504', '2024-02-23 07:48:52'),
(00000000384, 00000000001, '31.4367048', '73.0894545', '2024-02-23 07:49:02'),
(00000000385, 00000000001, '31.436707', '73.0894522', '2024-02-23 07:49:12'),
(00000000386, 00000000001, '31.436704', '73.0894563', '2024-02-23 07:49:22'),
(00000000387, 00000000001, '31.4367066', '73.0894549', '2024-02-23 07:49:32'),
(00000000388, 00000000001, '31.436707', '73.0894447', '2024-02-23 07:49:42'),
(00000000389, 00000000001, '31.4367047', '73.0894577', '2024-02-23 07:49:54'),
(00000000390, 00000000001, '31.4367018', '73.0894579', '2024-02-23 07:50:04'),
(00000000391, 00000000001, '31.4366994', '73.0894593', '2024-02-23 07:50:12'),
(00000000392, 00000000001, '31.4367015', '73.0894574', '2024-02-23 07:55:00'),
(00000000393, 00000000001, '31.4367068', '73.0894502', '2024-02-23 07:55:10'),
(00000000394, 00000000001, '31.4367017', '73.0894568', '2024-02-23 07:55:20'),
(00000000395, 00000000001, '31.4367036', '73.0894545', '2024-02-23 07:55:30'),
(00000000396, 00000000001, '31.436702', '73.0894577', '2024-02-23 07:55:39'),
(00000000397, 00000000001, '31.4367041', '73.0894542', '2024-02-23 07:55:50'),
(00000000398, 00000000001, '31.4367103', '73.0894477', '2024-02-23 07:56:00'),
(00000000399, 00000000001, '31.4367038', '73.0894548', '2024-02-23 07:56:09'),
(00000000400, 00000000001, '31.4367042', '73.0894553', '2024-02-23 07:56:19'),
(00000000401, 00000000001, '31.4367071', '73.0894509', '2024-02-23 07:56:30'),
(00000000402, 00000000001, '31.4367066', '73.0894517', '2024-02-23 07:56:40'),
(00000000403, 00000000001, '31.4367038', '73.0894554', '2024-02-23 07:56:50'),
(00000000404, 00000000001, '31.436706', '73.0894542', '2024-02-23 07:57:00'),
(00000000405, 00000000001, '31.4367048', '73.0894526', '2024-02-23 07:57:10'),
(00000000406, 00000000001, '31.4367095', '73.0894473', '2024-02-23 07:57:20'),
(00000000407, 00000000001, '31.4367072', '73.0894502', '2024-02-23 07:57:30'),
(00000000408, 00000000001, '31.4367052', '73.0894529', '2024-02-23 07:57:39'),
(00000000409, 00000000001, '31.4367022', '73.0894564', '2024-02-23 07:57:50'),
(00000000410, 00000000001, '31.4367061', '73.0894515', '2024-02-23 07:58:00'),
(00000000411, 00000000001, '31.436709', '73.0894468', '2024-02-23 07:58:09'),
(00000000412, 00000000001, '31.4367118', '73.089445', '2024-02-23 07:58:20'),
(00000000413, 00000000001, '31.4367063', '73.0894506', '2024-02-23 07:58:30'),
(00000000414, 00000000001, '31.4367074', '73.0894485', '2024-02-23 07:58:40'),
(00000000415, 00000000001, '31.4367027', '73.0894571', '2024-02-23 07:58:50'),
(00000000416, 00000000001, '31.4367037', '73.0894557', '2024-02-23 07:59:00'),
(00000000417, 00000000001, '31.4367058', '73.0894542', '2024-02-23 07:59:09'),
(00000000418, 00000000001, '31.4367005', '73.0894572', '2024-02-23 07:59:20'),
(00000000419, 00000000001, '31.4366987', '73.0894604', '2024-02-23 07:59:30'),
(00000000420, 00000000001, '31.4367056', '73.0894554', '2024-02-23 07:59:39'),
(00000000421, 00000000001, '31.4367055', '73.0894554', '2024-02-23 07:59:50'),
(00000000422, 00000000001, '31.4366978', '73.0894617', '2024-02-23 07:59:59'),
(00000000423, 00000000001, '31.4366909', '73.0894658', '2024-02-22 20:00:10'),
(00000000424, 00000000001, '31.4367063', '73.0894529', '2024-02-22 20:00:20'),
(00000000425, 00000000001, '31.4367065', '73.089453', '2024-02-22 20:00:30'),
(00000000426, 00000000001, '31.4367065', '73.0894458', '2024-02-22 20:00:40'),
(00000000427, 00000000001, '31.4367097', '73.0894526', '2024-02-22 20:00:49'),
(00000000428, 00000000001, '31.436705', '73.0894544', '2024-02-22 20:01:00'),
(00000000429, 00000000001, '31.4367117', '73.0894462', '2024-02-22 20:01:09'),
(00000000430, 00000000001, '31.4367051', '73.0894538', '2024-02-22 20:01:19'),
(00000000431, 00000000001, '31.4366861', '73.0894716', '2024-02-22 20:01:29'),
(00000000432, 00000000001, '31.4367065', '73.0894524', '2024-02-22 20:01:39'),
(00000000433, 00000000001, '31.4366987', '73.0894597', '2024-02-22 20:01:50'),
(00000000434, 00000000001, '31.4367063', '73.0894582', '2024-02-22 20:02:00'),
(00000000435, 00000000001, '31.4367044', '73.0894563', '2024-02-22 20:02:10'),
(00000000436, 00000000001, '31.4365695', '73.0895573', '2024-02-22 20:02:19'),
(00000000437, 00000000001, '31.4367172', '73.0894487', '2024-02-22 20:02:29'),
(00000000438, 00000000001, '31.4367025', '73.0894577', '2024-02-22 20:02:40'),
(00000000439, 00000000001, '31.4367054', '73.0894589', '2024-02-22 20:02:50'),
(00000000440, 00000000001, '31.4367066', '73.0894561', '2024-02-22 20:02:59'),
(00000000441, 00000000001, '31.4366369', '73.0894715', '2024-02-22 20:03:10'),
(00000000442, 00000000001, '31.4365415', '73.0894329', '2024-02-22 20:03:19'),
(00000000443, 00000000001, '31.4365737', '73.0895193', '2024-02-22 20:03:29'),
(00000000444, 00000000001, '31.4365483', '73.0895083', '2024-02-22 20:03:39'),
(00000000445, 00000000001, '31.4365483', '73.0895083', '2024-02-22 20:03:50'),
(00000000446, 00000000001, '31.4364514', '73.0893884', '2024-02-22 20:03:59'),
(00000000447, 00000000001, '31.4364143', '73.0892552', '2024-02-22 20:04:10'),
(00000000448, 00000000001, '31.4366721', '73.0894218', '2024-02-22 20:04:21'),
(00000000449, 00000000001, '31.4367058', '73.0894483', '2024-02-22 20:04:29'),
(00000000450, 00000000001, '31.4367096', '73.0894575', '2024-02-22 20:04:39'),
(00000000451, 00000000001, '31.4367053', '73.0894567', '2024-02-22 20:04:50'),
(00000000452, 00000000001, '31.4367029', '73.0894551', '2024-02-22 20:05:00'),
(00000000453, 00000000001, '31.4367123', '73.089449', '2024-02-22 20:05:09'),
(00000000454, 00000000001, '31.4367042', '73.0894582', '2024-02-22 20:05:20'),
(00000000455, 00000000001, '31.4367073', '73.0894505', '2024-02-22 20:05:30'),
(00000000456, 00000000001, '31.436701', '73.0894592', '2024-02-22 20:05:41'),
(00000000457, 00000000001, '31.4367025', '73.089455', '2024-02-22 20:05:50'),
(00000000458, 00000000001, '31.4367043', '73.0894553', '2024-02-22 20:05:59'),
(00000000459, 00000000001, '31.4367043', '73.0894524', '2024-02-22 20:06:09'),
(00000000460, 00000000001, '31.4366943', '73.0894666', '2024-02-22 20:06:20'),
(00000000461, 00000000001, '31.4366986', '73.0894664', '2024-02-22 20:06:30'),
(00000000462, 00000000001, '31.4367077', '73.0894546', '2024-02-22 20:06:40'),
(00000000463, 00000000001, '31.4367083', '73.089452', '2024-02-22 20:06:50'),
(00000000464, 00000000001, '31.4365991', '73.0895725', '2024-02-22 20:06:59'),
(00000000465, 00000000001, '31.436705', '73.0894609', '2024-02-22 20:07:09'),
(00000000466, 00000000001, '31.4367086', '73.0894523', '2024-02-22 20:07:19'),
(00000000467, 00000000001, '31.4367078', '73.0894614', '2024-02-22 20:07:30'),
(00000000468, 00000000001, '31.4368073', '73.0892486', '2024-02-22 20:07:40'),
(00000000469, 00000000001, '31.4368944', '73.0891183', '2024-02-22 20:07:49'),
(00000000470, 00000000001, '31.4367989', '73.0889471', '2024-02-22 20:08:02'),
(00000000471, 00000000001, '31.4367543', '73.0889093', '2024-02-22 20:08:10'),
(00000000472, 00000000001, '31.4364946', '73.0890133', '2024-02-22 20:08:20'),
(00000000473, 00000000001, '31.4365266', '73.0889503', '2024-02-22 20:08:29'),
(00000000474, 00000000001, '31.4365986', '73.0891137', '2024-02-22 20:08:40'),
(00000000475, 00000000001, '31.4368342', '73.0894675', '2024-02-22 20:08:49'),
(00000000476, 00000000001, '31.4367985', '73.0895876', '2024-02-22 20:09:00'),
(00000000477, 00000000001, '31.4368883', '73.0894618', '2024-02-22 20:09:10'),
(00000000478, 00000000001, '31.4369174', '73.0894223', '2024-02-22 20:09:20'),
(00000000479, 00000000001, '31.436981', '73.0893526', '2024-02-22 20:09:31'),
(00000000480, 00000000001, '31.4369784', '73.089302', '2024-02-22 20:09:40'),
(00000000481, 00000000001, '31.4370273', '73.0892514', '2024-02-22 20:09:49'),
(00000000482, 00000000001, '31.4370574', '73.0892078', '2024-02-22 20:10:00'),
(00000000483, 00000000001, '31.4369533', '73.0892374', '2024-02-22 20:10:10'),
(00000000484, 00000000001, '31.4369424', '73.0893206', '2024-02-22 20:10:20'),
(00000000485, 00000000001, '31.4369529', '73.0893064', '2024-02-22 20:10:30'),
(00000000486, 00000000001, '31.4369508', '73.0892287', '2024-02-22 20:10:40'),
(00000000487, 00000000001, '31.4367959', '73.0894658', '2024-02-22 20:10:50'),
(00000000488, 00000000001, '31.4368442', '73.0894485', '2024-02-22 20:11:00'),
(00000000489, 00000000001, '31.4367391', '73.0895148', '2024-02-22 20:11:10'),
(00000000490, 00000000001, '31.4367057', '73.0894557', '2024-02-22 20:11:19'),
(00000000491, 00000000001, '31.4367091', '73.0894508', '2024-02-22 20:11:30'),
(00000000492, 00000000001, '31.4368361', '73.089425', '2024-02-22 20:11:40'),
(00000000493, 00000000001, '31.43676', '73.0895132', '2024-02-22 20:11:50'),
(00000000494, 00000000001, '31.436954', '73.0892765', '2024-02-22 20:12:00'),
(00000000495, 00000000001, '31.4370503', '73.0891377', '2024-02-22 20:12:10'),
(00000000496, 00000000001, '31.4368959', '73.0892868', '2024-02-22 20:12:20'),
(00000000497, 00000000001, '31.4368865', '73.0892673', '2024-02-22 20:12:30'),
(00000000498, 00000000001, '31.4366429', '73.0895095', '2024-02-22 20:12:40'),
(00000000499, 00000000001, '31.4367028', '73.0893913', '2024-02-22 20:12:49'),
(00000000500, 00000000001, '31.4365729', '73.0894959', '2024-02-22 20:12:59'),
(00000000501, 00000000001, '31.4365977', '73.0894858', '2024-02-22 20:13:12'),
(00000000502, 00000000001, '31.4366858', '73.089481', '2024-02-22 20:13:19'),
(00000000503, 00000000001, '31.4367501', '73.0894374', '2024-02-22 20:13:30'),
(00000000504, 00000000001, '31.4367274', '73.0893646', '2024-02-22 20:13:40'),
(00000000505, 00000000001, '31.4367967', '73.0892951', '2024-02-22 20:13:49'),
(00000000506, 00000000001, '31.4368774', '73.0892085', '2024-02-22 20:13:59'),
(00000000507, 00000000001, '31.4368596', '73.0891443', '2024-02-22 20:14:10'),
(00000000508, 00000000001, '31.4368268', '73.0892324', '2024-02-22 20:14:20'),
(00000000509, 00000000001, '31.43671', '73.0894537', '2024-02-22 20:14:35'),
(00000000510, 00000000001, '31.43671', '73.0894537', '2024-02-22 20:14:40'),
(00000000511, 00000000001, '31.4367068', '73.0894614', '2024-02-22 20:14:50'),
(00000000512, 00000000001, '31.4367032', '73.0894654', '2024-02-22 20:15:00'),
(00000000513, 00000000001, '31.4366988', '73.0894654', '2024-02-22 20:15:10'),
(00000000514, 00000000001, '31.4367162', '73.0894516', '2024-02-22 20:15:23'),
(00000000515, 00000000001, '31.4367149', '73.0894311', '2024-02-22 20:15:30'),
(00000000516, 00000000001, '31.4367102', '73.0894454', '2024-02-22 20:15:39'),
(00000000517, 00000000001, '31.436624', '73.0895193', '2024-02-22 20:15:50'),
(00000000518, 00000000001, '31.4367141', '73.0894352', '2024-02-22 20:16:03'),
(00000000519, 00000000001, '31.4367084', '73.0894492', '2024-02-22 20:16:10'),
(00000000520, 00000000001, '31.4367099', '73.0894449', '2024-02-22 20:16:20'),
(00000000521, 00000000001, '31.4367114', '73.0894408', '2024-02-22 20:16:29'),
(00000000522, 00000000001, '31.4367108', '73.0894421', '2024-02-22 20:16:40'),
(00000000523, 00000000001, '31.436715', '73.0894369', '2024-02-22 20:16:50'),
(00000000524, 00000000001, '31.4366706', '73.0893938', '2024-02-22 20:17:00'),
(00000000525, 00000000001, '31.4366678', '73.0892362', '2024-02-22 20:17:10'),
(00000000526, 00000000001, '31.4366204', '73.0892524', '2024-02-22 20:17:20'),
(00000000527, 00000000001, '31.436621', '73.0892276', '2024-02-22 20:17:30'),
(00000000528, 00000000001, '31.4365608', '73.0886002', '2024-02-22 20:17:39'),
(00000000529, 00000000001, '31.4365513', '73.0883841', '2024-02-22 20:17:49'),
(00000000530, 00000000001, '31.4365492', '73.0883835', '2024-02-22 20:18:00'),
(00000000531, 00000000001, '31.4366066', '73.0895004', '2024-02-22 20:18:10'),
(00000000532, 00000000001, '31.4367145', '73.0894346', '2024-02-22 20:18:19'),
(00000000533, 00000000001, '31.4367127', '73.0894348', '2024-02-22 20:18:30'),
(00000000534, 00000000001, '31.4367094', '73.089439', '2024-02-22 20:18:40'),
(00000000535, 00000000001, '31.4367111', '73.0894485', '2024-02-22 20:18:50'),
(00000000536, 00000000001, '31.4367093', '73.0894539', '2024-02-22 20:19:00'),
(00000000537, 00000000001, '31.4367115', '73.0894476', '2024-02-22 20:19:10'),
(00000000538, 00000000001, '31.4367113', '73.0894473', '2024-02-22 20:19:19'),
(00000000539, 00000000001, '31.4367096', '73.0894522', '2024-02-22 20:19:30'),
(00000000540, 00000000001, '31.436711', '73.0894491', '2024-02-22 20:19:40'),
(00000000541, 00000000001, '31.4367106', '73.0894501', '2024-02-22 20:19:50'),
(00000000542, 00000000001, '31.4367161', '73.0894518', '2024-02-22 20:20:00'),
(00000000543, 00000000001, '31.4367104', '73.0894499', '2024-02-22 20:20:09'),
(00000000544, 00000000001, '31.4367129', '73.0894534', '2024-02-22 20:20:20'),
(00000000545, 00000000001, '31.436708', '73.0894538', '2024-02-22 20:20:34'),
(00000000546, 00000000001, '31.4366058', '73.089557', '2024-02-22 20:20:40'),
(00000000547, 00000000001, '31.4367085', '73.0894501', '2024-02-22 20:20:49'),
(00000000548, 00000000001, '31.4367101', '73.0894522', '2024-02-22 20:21:00'),
(00000000549, 00000000001, '31.4367092', '73.0894412', '2024-02-22 20:21:09'),
(00000000550, 00000000001, '31.4367116', '73.0894444', '2024-02-22 20:21:20'),
(00000000551, 00000000001, '31.4367137', '73.0894343', '2024-02-22 20:21:29'),
(00000000552, 00000000001, '31.4367129', '73.0894363', '2024-02-22 20:21:40'),
(00000000553, 00000000001, '31.4367122', '73.0894539', '2024-02-22 20:21:50'),
(00000000554, 00000000001, '31.436708', '73.0894597', '2024-02-22 20:22:00'),
(00000000555, 00000000001, '31.4367104', '73.0894359', '2024-02-22 20:22:10'),
(00000000556, 00000000001, '31.4364583', '73.08961', '2024-02-22 20:22:19'),
(00000000557, 00000000001, '31.4363405', '73.0897181', '2024-02-22 20:22:30'),
(00000000558, 00000000001, '31.4362869', '73.0899816', '2024-02-22 20:22:40'),
(00000000559, 00000000001, '31.436473', '73.0898035', '2024-02-22 20:22:50'),
(00000000560, 00000000001, '31.4364091', '73.0898106', '2024-02-22 20:23:00'),
(00000000561, 00000000001, '31.4363617', '73.0899207', '2024-02-22 20:23:10'),
(00000000562, 00000000001, '31.4364211', '73.089879', '2024-02-22 20:23:19'),
(00000000563, 00000000001, '31.436475', '73.0898219', '2024-02-22 20:23:30'),
(00000000564, 00000000001, '31.4365344', '73.0897418', '2024-02-22 20:23:40'),
(00000000565, 00000000001, '31.4365367', '73.0897383', '2024-02-22 20:23:50'),
(00000000566, 00000000001, '31.4366216', '73.0895756', '2024-02-22 20:24:00'),
(00000000567, 00000000001, '31.4366571', '73.089496', '2024-02-22 20:24:10'),
(00000000568, 00000000001, '31.4366829', '73.089402', '2024-02-22 20:24:20'),
(00000000569, 00000000001, '31.4366358', '73.0893817', '2024-02-22 20:24:31'),
(00000000570, 00000000001, '31.436606', '73.0894438', '2024-02-22 20:24:40'),
(00000000571, 00000000001, '31.4365251', '73.0893384', '2024-02-22 20:24:49'),
(00000000572, 00000000001, '31.4366021', '73.0896498', '2024-02-22 20:24:59'),
(00000000573, 00000000001, '31.4366204', '73.0895477', '2024-02-22 20:25:10'),
(00000000574, 00000000001, '31.4365737', '73.089618', '2024-02-22 20:25:20'),
(00000000575, 00000000001, '31.4366264', '73.0895195', '2024-02-22 20:25:30'),
(00000000576, 00000000001, '31.4366253', '73.0895461', '2024-02-22 20:25:40'),
(00000000577, 00000000001, '31.4367364', '73.0894303', '2024-02-22 20:25:49'),
(00000000578, 00000000001, '31.4368051', '73.0892882', '2024-02-22 20:26:00'),
(00000000579, 00000000001, '31.4368323', '73.0892471', '2024-02-22 20:26:10'),
(00000000580, 00000000001, '31.4367173', '73.089427', '2024-02-22 20:26:20'),
(00000000581, 00000000001, '31.4367134', '73.0894399', '2024-02-22 20:26:30'),
(00000000582, 00000000001, '31.4367088', '73.0894498', '2024-02-22 20:26:40'),
(00000000583, 00000000001, '31.4367074', '73.0894519', '2024-02-22 20:26:50'),
(00000000584, 00000000001, '31.43671', '73.0894477', '2024-02-22 20:27:00'),
(00000000585, 00000000001, '31.4367117', '73.089451', '2024-02-22 20:27:10'),
(00000000586, 00000000001, '31.4367123', '73.0894446', '2024-02-22 20:27:19'),
(00000000587, 00000000001, '31.4367134', '73.0894469', '2024-02-22 20:27:30'),
(00000000588, 00000000001, '31.4367103', '73.0894475', '2024-02-22 20:27:40'),
(00000000589, 00000000001, '31.4364795', '73.0896737', '2024-02-22 20:27:50'),
(00000000590, 00000000001, '31.4363858', '73.0896451', '2024-02-22 20:28:00'),
(00000000591, 00000000001, '31.4363511', '73.0895084', '2024-02-22 20:28:10'),
(00000000592, 00000000001, '31.4364864', '73.0894449', '2024-02-22 20:28:19'),
(00000000593, 00000000001, '31.4365467', '73.089702', '2024-02-22 20:28:30'),
(00000000594, 00000000001, '31.4365306', '73.0897579', '2024-02-22 20:28:40'),
(00000000595, 00000000001, '31.4366144', '73.0896575', '2024-02-22 20:28:49'),
(00000000596, 00000000001, '31.4365698', '73.0897673', '2024-02-22 20:29:00'),
(00000000597, 00000000001, '31.4367102', '73.0894518', '2024-02-22 20:29:10'),
(00000000598, 00000000001, '31.4367141', '73.0894407', '2024-02-22 20:29:19'),
(00000000599, 00000000001, '31.4367127', '73.0894462', '2024-02-22 20:29:30'),
(00000000600, 00000000001, '31.4367142', '73.0894528', '2024-02-22 20:29:40'),
(00000000601, 00000000001, '31.4367133', '73.0894344', '2024-02-22 20:29:49'),
(00000000602, 00000000001, '31.4364831', '73.0898732', '2024-02-22 20:30:00'),
(00000000603, 00000000001, '31.4367607', '73.0894958', '2024-02-22 20:30:09'),
(00000000604, 00000000001, '31.4367835', '73.0894254', '2024-02-22 20:30:20'),
(00000000605, 00000000001, '31.4368685', '73.0893237', '2024-02-22 20:30:30'),
(00000000606, 00000000001, '31.4369751', '73.0892451', '2024-02-22 20:30:40'),
(00000000607, 00000000001, '31.436972', '73.0892407', '2024-02-22 20:30:50'),
(00000000608, 00000000001, '31.4369779', '73.0891933', '2024-02-22 20:31:01'),
(00000000609, 00000000001, '31.4367546', '73.089475', '2024-02-22 20:31:10'),
(00000000610, 00000000001, '31.4366715', '73.0896006', '2024-02-22 20:31:20'),
(00000000611, 00000000001, '31.436689', '73.0895752', '2024-02-22 20:31:29'),
(00000000612, 00000000001, '31.4367072', '73.089472', '2024-02-22 20:31:41'),
(00000000613, 00000000001, '31.4367106', '73.0894376', '2024-02-22 20:31:51'),
(00000000614, 00000000001, '31.436712', '73.089446', '2024-02-22 20:31:59'),
(00000000615, 00000000001, '31.4367161', '73.0894447', '2024-02-22 20:32:10'),
(00000000616, 00000000001, '31.4367074', '73.089457', '2024-02-22 20:32:19'),
(00000000617, 00000000001, '31.4366121', '73.089549', '2024-02-22 20:32:29'),
(00000000618, 00000000001, '31.4367081', '73.0894523', '2024-02-22 20:32:40'),
(00000000619, 00000000001, '31.4367087', '73.089439', '2024-02-22 20:32:50'),
(00000000620, 00000000001, '31.4367076', '73.0894529', '2024-02-22 20:33:03'),
(00000000621, 00000000001, '31.4367087', '73.0894515', '2024-02-22 20:33:10'),
(00000000622, 00000000001, '31.4367102', '73.0894523', '2024-02-22 20:33:19'),
(00000000623, 00000000001, '31.4367124', '73.0894549', '2024-02-22 20:33:31'),
(00000000624, 00000000001, '31.4367074', '73.0894523', '2024-02-22 20:33:40'),
(00000000625, 00000000001, '31.4367118', '73.0894486', '2024-02-22 20:33:49'),
(00000000626, 00000000001, '31.4367089', '73.0894498', '2024-02-22 20:34:00'),
(00000000627, 00000000001, '31.436706', '73.0894462', '2024-02-22 20:34:10'),
(00000000628, 00000000001, '31.4367122', '73.0894342', '2024-02-22 20:34:20'),
(00000000629, 00000000001, '31.4367117', '73.0894322', '2024-02-22 20:34:30'),
(00000000630, 00000000001, '31.4367116', '73.0894347', '2024-02-22 20:34:40'),
(00000000631, 00000000001, '31.4367143', '73.0894318', '2024-02-22 20:34:50'),
(00000000632, 00000000001, '31.4367177', '73.0894412', '2024-02-22 20:35:00'),
(00000000633, 00000000001, '31.4367189', '73.0894398', '2024-02-22 20:35:10'),
(00000000634, 00000000001, '31.4367128', '73.0894449', '2024-02-22 20:35:21'),
(00000000635, 00000000001, '31.4367107', '73.0894457', '2024-02-22 20:35:30'),
(00000000636, 00000000001, '31.4367102', '73.0894327', '2024-02-22 20:35:43'),
(00000000637, 00000000001, '31.4367193', '73.0894488', '2024-02-22 20:35:50'),
(00000000638, 00000000001, '31.4367115', '73.0894485', '2024-02-22 20:36:03'),
(00000000639, 00000000001, '31.4367122', '73.0894477', '2024-02-22 20:36:09'),
(00000000640, 00000000001, '31.4367083', '73.0894516', '2024-02-22 20:36:20'),
(00000000641, 00000000001, '31.4367086', '73.08945', '2024-02-22 20:36:30'),
(00000000642, 00000000001, '31.4367119', '73.089443', '2024-02-22 20:36:40'),
(00000000643, 00000000001, '31.43671', '73.0894431', '2024-02-22 20:36:49'),
(00000000644, 00000000001, '31.4367117', '73.0894436', '2024-02-22 20:37:03'),
(00000000645, 00000000001, '31.4367109', '73.0894461', '2024-02-22 20:37:10'),
(00000000646, 00000000001, '31.436712', '73.0894461', '2024-02-22 20:37:19'),
(00000000647, 00000000001, '31.4367088', '73.0894428', '2024-02-22 20:37:30'),
(00000000648, 00000000001, '31.4367079', '73.0894489', '2024-02-22 20:37:40'),
(00000000649, 00000000001, '31.4367139', '73.0894401', '2024-02-22 20:37:50'),
(00000000650, 00000000001, '31.4367129', '73.0894386', '2024-02-22 20:38:00');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(00000000651, 00000000001, '31.4367126', '73.0894534', '2024-02-22 20:38:09'),
(00000000652, 00000000001, '31.436706', '73.0894387', '2024-02-22 20:38:22'),
(00000000653, 00000000001, '31.4367069', '73.089437', '2024-02-22 20:38:30'),
(00000000654, 00000000001, '31.4367122', '73.089436', '2024-02-22 20:38:40'),
(00000000655, 00000000001, '31.4367162', '73.0894482', '2024-02-22 20:38:49'),
(00000000656, 00000000001, '31.4367107', '73.0894555', '2024-02-22 20:39:00'),
(00000000657, 00000000001, '31.436711', '73.0894542', '2024-02-22 20:39:10'),
(00000000658, 00000000001, '31.4367113', '73.0894496', '2024-02-22 20:39:20'),
(00000000659, 00000000001, '31.4367072', '73.089453', '2024-02-22 20:39:30'),
(00000000660, 00000000001, '31.4367659', '73.0893735', '2024-02-22 20:39:40'),
(00000000661, 00000000001, '31.4368915', '73.089377', '2024-02-22 20:39:50'),
(00000000662, 00000000001, '31.4366926', '73.0893266', '2024-02-22 20:40:10'),
(00000000663, 00000000001, '31.4366721', '73.0893806', '2024-02-22 20:40:10'),
(00000000664, 00000000001, '31.4369288', '73.0892544', '2024-02-22 20:40:20'),
(00000000665, 00000000001, '31.4371279', '73.0892535', '2024-02-22 20:40:31'),
(00000000666, 00000000001, '31.4370634', '73.0894215', '2024-02-22 20:40:40'),
(00000000667, 00000000001, '31.4370249', '73.0894244', '2024-02-22 20:40:49'),
(00000000668, 00000000001, '31.4368908', '73.0895205', '2024-02-22 20:41:00'),
(00000000669, 00000000001, '31.4368468', '73.0895777', '2024-02-22 20:41:10'),
(00000000670, 00000000001, '31.4367562', '73.0895568', '2024-02-22 20:41:20'),
(00000000671, 00000000001, '31.4366837', '73.0896306', '2024-02-22 20:41:30'),
(00000000672, 00000000001, '31.4367088', '73.0894765', '2024-02-22 20:41:40'),
(00000000673, 00000000001, '31.4367108', '73.0894506', '2024-02-22 20:41:49'),
(00000000674, 00000000001, '31.4367114', '73.0894499', '2024-02-22 20:41:59'),
(00000000675, 00000000001, '31.4367109', '73.0894576', '2024-02-22 20:42:10'),
(00000000676, 00000000001, '31.4367114', '73.0894491', '2024-02-22 20:42:20'),
(00000000677, 00000000001, '31.4367079', '73.0894534', '2024-02-22 20:42:30'),
(00000000678, 00000000001, '31.4370385', '73.0892888', '2024-02-22 20:42:40'),
(00000000679, 00000000001, '31.436712', '73.0893784', '2024-02-22 20:42:50'),
(00000000680, 00000000001, '31.4368301', '73.0893489', '2024-02-22 20:43:00'),
(00000000681, 00000000001, '31.4368967', '73.089283', '2024-02-22 20:43:10'),
(00000000682, 00000000001, '31.4368784', '73.0893568', '2024-02-22 20:43:20'),
(00000000683, 00000000001, '31.4369669', '73.0893639', '2024-02-22 20:43:30'),
(00000000684, 00000000001, '31.4368871', '73.0893572', '2024-02-22 20:43:40'),
(00000000685, 00000000001, '31.436856', '73.0893706', '2024-02-22 20:43:51'),
(00000000686, 00000000001, '31.4370116', '73.0893729', '2024-02-22 20:43:59'),
(00000000687, 00000000001, '31.4371878', '73.0892738', '2024-02-22 20:44:09'),
(00000000688, 00000000001, '31.4367223', '73.0894336', '2024-02-22 20:44:20'),
(00000000689, 00000000001, '31.4367137', '73.08944', '2024-02-22 20:44:29'),
(00000000690, 00000000001, '31.4367011', '73.0896314', '2024-02-22 20:44:40'),
(00000000691, 00000000001, '31.4365087', '73.0896494', '2024-02-22 20:44:49'),
(00000000692, 00000000001, '31.4365531', '73.0896344', '2024-02-22 20:45:00'),
(00000000693, 00000000001, '31.4364827', '73.0896104', '2024-02-22 20:45:10'),
(00000000694, 00000000001, '31.4365591', '73.0895748', '2024-02-22 20:45:20'),
(00000000695, 00000000001, '31.4364838', '73.0895096', '2024-02-22 20:45:30'),
(00000000696, 00000000001, '31.4363195', '73.0894866', '2024-02-22 20:45:40'),
(00000000697, 00000000001, '31.4364396', '73.0894715', '2024-02-22 20:45:49'),
(00000000698, 00000000001, '31.436539', '73.0895116', '2024-02-22 20:45:59'),
(00000000699, 00000000001, '31.4367183', '73.0896064', '2024-02-22 20:46:11'),
(00000000700, 00000000001, '31.4367814', '73.0895921', '2024-02-22 20:46:20'),
(00000000701, 00000000001, '31.4367095', '73.0894513', '2024-02-22 20:46:31'),
(00000000702, 00000000001, '31.436708', '73.0894528', '2024-02-22 20:46:40'),
(00000000703, 00000000001, '31.4367052', '73.0894545', '2024-02-22 20:46:49'),
(00000000704, 00000000001, '31.4367087', '73.0894541', '2024-02-22 20:47:00'),
(00000000705, 00000000001, '31.4367087', '73.0894533', '2024-02-22 20:47:10'),
(00000000706, 00000000001, '31.4367075', '73.0894504', '2024-02-22 20:47:19'),
(00000000707, 00000000001, '31.4367058', '73.0894459', '2024-02-22 20:47:30'),
(00000000708, 00000000001, '31.4367122', '73.0894452', '2024-02-22 20:47:40'),
(00000000709, 00000000001, '31.4367079', '73.0894507', '2024-02-22 20:47:50'),
(00000000710, 00000000001, '31.4367106', '73.0894525', '2024-02-22 20:48:00'),
(00000000711, 00000000001, '31.4367098', '73.0894447', '2024-02-22 20:48:10'),
(00000000712, 00000000001, '31.4367039', '73.089457', '2024-02-22 20:48:20'),
(00000000713, 00000000001, '31.4367103', '73.0894483', '2024-02-22 20:48:30'),
(00000000714, 00000000001, '31.4367137', '73.0894516', '2024-02-22 20:48:40'),
(00000000715, 00000000001, '31.4367156', '73.0894523', '2024-02-22 20:48:49'),
(00000000716, 00000000001, '31.4367102', '73.0894436', '2024-02-22 20:49:00'),
(00000000717, 00000000001, '31.4367102', '73.0894464', '2024-02-22 20:49:10'),
(00000000718, 00000000001, '31.4367096', '73.0894515', '2024-02-22 20:49:20'),
(00000000719, 00000000001, '31.4365962', '73.0895725', '2024-02-22 20:49:30'),
(00000000720, 00000000001, '31.4367137', '73.0894496', '2024-02-22 20:49:40'),
(00000000721, 00000000001, '31.4367102', '73.0894442', '2024-02-22 20:49:50'),
(00000000722, 00000000001, '31.4367114', '73.0894425', '2024-02-22 20:50:00'),
(00000000723, 00000000001, '31.4367127', '73.0894472', '2024-02-22 20:50:10'),
(00000000724, 00000000001, '31.4367129', '73.0894489', '2024-02-22 20:50:20'),
(00000000725, 00000000001, '31.4367088', '73.0894483', '2024-02-22 20:50:30'),
(00000000726, 00000000001, '31.4367097', '73.0894482', '2024-02-22 20:50:40'),
(00000000727, 00000000001, '31.4367123', '73.0894474', '2024-02-22 20:50:49'),
(00000000728, 00000000001, '31.4365752', '73.0890794', '2024-02-22 20:51:00'),
(00000000729, 00000000001, '31.4367071', '73.0894463', '2024-02-22 20:51:11'),
(00000000730, 00000000001, '31.4367087', '73.089451', '2024-02-22 20:51:19'),
(00000000731, 00000000001, '31.4367101', '73.0894461', '2024-02-22 20:51:29'),
(00000000732, 00000000001, '31.436708', '73.0894484', '2024-02-22 20:51:40'),
(00000000733, 00000000001, '31.4367079', '73.0894479', '2024-02-22 20:51:50'),
(00000000734, 00000000001, '31.4365896', '73.0895792', '2024-02-22 20:52:00'),
(00000000735, 00000000001, '31.4367135', '73.0894453', '2024-02-22 20:52:10'),
(00000000736, 00000000001, '31.4367076', '73.0894482', '2024-02-22 20:52:20'),
(00000000737, 00000000001, '31.4367081', '73.089448', '2024-02-22 20:52:30'),
(00000000738, 00000000001, '31.4367056', '73.0894506', '2024-02-22 20:52:39'),
(00000000739, 00000000001, '31.4367077', '73.0894475', '2024-02-22 20:52:49'),
(00000000740, 00000000001, '31.4367106', '73.0894513', '2024-02-22 20:52:59'),
(00000000741, 00000000001, '31.4367073', '73.0894487', '2024-02-22 20:53:10'),
(00000000742, 00000000001, '31.4367063', '73.0894496', '2024-02-22 20:53:19'),
(00000000743, 00000000001, '31.4367085', '73.0894495', '2024-02-22 20:53:30'),
(00000000744, 00000000001, '31.4367108', '73.0894488', '2024-02-22 20:53:39'),
(00000000745, 00000000001, '31.4367092', '73.0894529', '2024-02-22 20:53:50'),
(00000000746, 00000000001, '31.4364911', '73.0898356', '2024-02-22 20:53:59'),
(00000000747, 00000000001, '31.4366034', '73.0897452', '2024-02-22 20:54:10'),
(00000000748, 00000000001, '31.4366671', '73.0896811', '2024-02-22 20:54:19'),
(00000000749, 00000000001, '31.4366854', '73.0896005', '2024-02-22 20:54:29'),
(00000000750, 00000000001, '31.4366199', '73.0896241', '2024-02-22 20:54:39'),
(00000000751, 00000000001, '31.4366988', '73.0895482', '2024-02-22 20:54:50'),
(00000000752, 00000000001, '31.436643', '73.089542', '2024-02-22 20:55:00'),
(00000000753, 00000000001, '31.4366408', '73.0895153', '2024-02-22 20:55:10'),
(00000000754, 00000000001, '31.4366325', '73.0895146', '2024-02-22 20:55:19'),
(00000000755, 00000000001, '31.4365872', '73.0896044', '2024-02-22 20:55:30'),
(00000000756, 00000000001, '31.4365836', '73.0896637', '2024-02-22 20:55:39'),
(00000000757, 00000000001, '31.4365696', '73.0897096', '2024-02-22 20:55:51'),
(00000000758, 00000000001, '31.4365748', '73.0896803', '2024-02-22 20:56:00'),
(00000000759, 00000000001, '31.4366285', '73.0896212', '2024-02-22 20:56:10'),
(00000000760, 00000000001, '31.4366779', '73.0894774', '2024-02-22 20:56:19'),
(00000000761, 00000000001, '31.4366807', '73.0894031', '2024-02-22 20:56:30'),
(00000000762, 00000000001, '31.4366317', '73.0894591', '2024-02-22 20:56:39'),
(00000000763, 00000000001, '31.4365822', '73.089466', '2024-02-22 20:56:50'),
(00000000764, 00000000001, '31.4365494', '73.0895011', '2024-02-22 20:56:59'),
(00000000765, 00000000001, '31.4364893', '73.08953', '2024-02-22 20:57:10'),
(00000000766, 00000000001, '31.4364657', '73.089586', '2024-02-22 20:57:19'),
(00000000767, 00000000001, '31.4364679', '73.0896145', '2024-02-22 20:57:30'),
(00000000768, 00000000001, '31.4365031', '73.0895797', '2024-02-22 20:57:40'),
(00000000769, 00000000001, '31.436493', '73.0896505', '2024-02-22 20:57:50'),
(00000000770, 00000000001, '31.4364652', '73.0897323', '2024-02-22 20:57:59'),
(00000000771, 00000000001, '31.4364649', '73.089777', '2024-02-22 20:58:09'),
(00000000772, 00000000001, '31.4364769', '73.0898123', '2024-02-22 20:58:19'),
(00000000773, 00000000001, '31.4364604', '73.0898127', '2024-02-22 20:58:30'),
(00000000774, 00000000001, '31.4364569', '73.0898263', '2024-02-22 20:58:40'),
(00000000775, 00000000001, '31.4364657', '73.0897092', '2024-02-22 20:58:50'),
(00000000776, 00000000001, '31.4365013', '73.0896186', '2024-02-22 20:59:00'),
(00000000777, 00000000001, '31.4364594', '73.089714', '2024-02-22 20:59:10'),
(00000000778, 00000000001, '31.4364491', '73.0895925', '2024-02-22 20:59:20'),
(00000000779, 00000000001, '31.4364155', '73.0900269', '2024-02-22 20:59:30'),
(00000000780, 00000000001, '31.4362683', '73.0901587', '2024-02-22 20:59:39'),
(00000000781, 00000000001, '31.4362737', '73.0897194', '2024-02-22 20:59:50'),
(00000000782, 00000000001, '31.436348', '73.0897037', '2024-02-22 20:59:59'),
(00000000783, 00000000001, '31.4364639', '73.0891441', '2024-02-22 21:00:10'),
(00000000784, 00000000001, '31.4366399', '73.0888252', '2024-02-22 21:00:20'),
(00000000785, 00000000001, '31.4366112', '73.0887412', '2024-02-22 21:00:29'),
(00000000786, 00000000001, '31.436706', '73.0893853', '2024-02-22 21:00:40'),
(00000000787, 00000000001, '31.4367081', '73.0894522', '2024-02-22 21:00:50'),
(00000000788, 00000000001, '31.4367036', '73.0894628', '2024-02-22 21:01:00'),
(00000000789, 00000000001, '31.4367128', '73.089453', '2024-02-22 21:01:10'),
(00000000790, 00000000001, '31.4367089', '73.0894536', '2024-02-22 21:01:19'),
(00000000791, 00000000001, '31.4367079', '73.0894489', '2024-02-22 21:01:30'),
(00000000792, 00000000001, '31.43671', '73.0894514', '2024-02-22 21:01:39'),
(00000000793, 00000000001, '31.436706', '73.0894526', '2024-02-22 21:01:49'),
(00000000794, 00000000001, '31.4367119', '73.0894531', '2024-02-22 21:02:00'),
(00000000795, 00000000001, '31.4367085', '73.0894522', '2024-02-22 21:02:10'),
(00000000796, 00000000001, '31.436708', '73.0894513', '2024-02-22 21:02:20'),
(00000000797, 00000000001, '31.437119', '73.0882157', '2024-02-22 21:02:30'),
(00000000798, 00000000001, '31.4371535', '73.0881394', '2024-02-22 21:02:39'),
(00000000799, 00000000001, '31.4371825', '73.0881236', '2024-02-22 21:02:51'),
(00000000800, 00000000001, '31.436712', '73.0894432', '2024-02-22 21:03:06'),
(00000000801, 00000000001, '31.436712', '73.0894432', '2024-02-22 21:03:10'),
(00000000802, 00000000001, '31.4367065', '73.0894531', '2024-02-22 21:03:20'),
(00000000803, 00000000001, '31.4367096', '73.0894514', '2024-02-22 21:03:30'),
(00000000804, 00000000001, '31.4367101', '73.0894505', '2024-02-22 21:03:40'),
(00000000805, 00000000001, '31.4367084', '73.0894491', '2024-02-22 21:03:50'),
(00000000806, 00000000001, '31.4367095', '73.0894487', '2024-02-22 21:04:00'),
(00000000807, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:22'),
(00000000808, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:22'),
(00000000809, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:22'),
(00000000810, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:22'),
(00000000811, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:22'),
(00000000812, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000813, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000814, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000815, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000816, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000817, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000818, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000819, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000820, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000821, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000822, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:23'),
(00000000823, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000824, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000825, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000826, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000827, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000828, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000829, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000830, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000831, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000832, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000833, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:24'),
(00000000834, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:25'),
(00000000835, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:25'),
(00000000836, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:25'),
(00000000837, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:25'),
(00000000838, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:25'),
(00000000839, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:25'),
(00000000840, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:25'),
(00000000841, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:26'),
(00000000842, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:26'),
(00000000843, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:26'),
(00000000844, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:26'),
(00000000845, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:26'),
(00000000846, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:26'),
(00000000847, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:27'),
(00000000848, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:27'),
(00000000849, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:27'),
(00000000850, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:27'),
(00000000851, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:27'),
(00000000852, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:27'),
(00000000853, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:27'),
(00000000854, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:27'),
(00000000855, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:27'),
(00000000856, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:28'),
(00000000857, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000858, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:28'),
(00000000859, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000860, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:28'),
(00000000861, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:28'),
(00000000862, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000863, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000864, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000865, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000866, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000867, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000868, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000869, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000870, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000871, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000872, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:28'),
(00000000873, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000874, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000875, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000876, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000877, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000878, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000879, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000880, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:29'),
(00000000881, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000882, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000883, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:29'),
(00000000884, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:29'),
(00000000885, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:29'),
(00000000886, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000887, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000888, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000889, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000890, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000891, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000892, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000893, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000894, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000895, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:30'),
(00000000896, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:30'),
(00000000897, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000898, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000899, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000900, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000901, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000902, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000903, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000904, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:30'),
(00000000905, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000906, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000907, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:31'),
(00000000908, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:31'),
(00000000909, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000910, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000911, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000912, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000913, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000914, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000915, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000916, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:31'),
(00000000917, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000918, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:31'),
(00000000919, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:31'),
(00000000920, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:31'),
(00000000921, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:32'),
(00000000922, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:32'),
(00000000923, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:32'),
(00000000924, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:32'),
(00000000925, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:32'),
(00000000926, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:32'),
(00000000927, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:32'),
(00000000928, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:32'),
(00000000929, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:32'),
(00000000930, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:32'),
(00000000931, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:32'),
(00000000932, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:32'),
(00000000933, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:33'),
(00000000934, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000935, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:33'),
(00000000936, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000937, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000938, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000939, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000940, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:33'),
(00000000941, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000942, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:33'),
(00000000943, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000944, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000945, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:33'),
(00000000946, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:34'),
(00000000947, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:34'),
(00000000948, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:35'),
(00000000949, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:35'),
(00000000950, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:35'),
(00000000951, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:35'),
(00000000952, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:35'),
(00000000953, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:35'),
(00000000954, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:36'),
(00000000955, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:36'),
(00000000956, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:36'),
(00000000957, 00000000001, '31.4367099', '73.089439', '2024-02-22 21:30:36'),
(00000000958, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:37'),
(00000000959, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:37'),
(00000000960, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:39'),
(00000000961, 00000000001, '31.4367132', '73.0894441', '2024-02-22 21:30:39'),
(00000000962, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:40'),
(00000000963, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:41'),
(00000000964, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:41'),
(00000000965, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:41'),
(00000000966, 00000000001, '31.4367097', '73.0894493', '2024-02-22 21:30:42'),
(00000000967, 00000000001, '31.4367148', '73.0894477', '2024-02-22 21:30:49'),
(00000000968, 00000000001, '31.4367101', '73.0894471', '2024-02-22 21:31:00'),
(00000000969, 00000000001, '31.4367133', '73.0894381', '2024-02-22 21:31:10'),
(00000000970, 00000000001, '31.4367141', '73.0894398', '2024-02-22 21:31:20'),
(00000000971, 00000000001, '31.4366515', '73.0895494', '2024-02-22 21:31:30'),
(00000000972, 00000000001, '31.436711', '73.0894433', '2024-02-22 21:31:40'),
(00000000973, 00000000001, '31.4367124', '73.0894401', '2024-02-22 21:31:50'),
(00000000974, 00000000001, '31.4366236', '73.0895298', '2024-02-22 21:32:00'),
(00000000975, 00000000001, '31.4365722', '73.0896787', '2024-02-22 21:32:10'),
(00000000976, 00000000001, '31.436611', '73.0896664', '2024-02-22 21:32:20'),
(00000000977, 00000000001, '31.436625', '73.0896817', '2024-02-22 21:32:30'),
(00000000978, 00000000001, '31.4366022', '73.0896193', '2024-02-22 21:32:40'),
(00000000979, 00000000001, '31.4365406', '73.0895278', '2024-02-22 21:32:51'),
(00000000980, 00000000001, '31.4363823', '73.0899422', '2024-02-22 21:33:00'),
(00000000981, 00000000001, '31.4362364', '73.0901118', '2024-02-22 21:33:09'),
(00000000982, 00000000001, '31.4360748', '73.0902258', '2024-02-22 21:33:20'),
(00000000983, 00000000001, '31.4358906', '73.0904603', '2024-02-22 21:33:30'),
(00000000984, 00000000001, '31.4358503', '73.0905005', '2024-02-22 21:33:40'),
(00000000985, 00000000001, '31.4362319', '73.090313', '2024-02-22 21:33:50'),
(00000000986, 00000000001, '31.4363299', '73.0902272', '2024-02-22 21:33:59'),
(00000000987, 00000000001, '31.4362544', '73.0901584', '2024-02-22 21:34:10'),
(00000000988, 00000000001, '31.4363881', '73.0900374', '2024-02-22 21:34:19'),
(00000000989, 00000000001, '31.4364532', '73.0898704', '2024-02-22 21:34:29'),
(00000000990, 00000000001, '31.4364533', '73.0898617', '2024-02-22 21:34:40'),
(00000000991, 00000000001, '31.4364533', '73.0898617', '2024-02-22 21:34:50'),
(00000000992, 00000000001, '31.4364533', '73.0898617', '2024-02-22 21:35:00'),
(00000000993, 00000000001, '31.4367193', '73.0894526', '2024-02-22 21:35:10'),
(00000000994, 00000000001, '31.4367137', '73.0894364', '2024-02-22 21:35:19'),
(00000000995, 00000000001, '31.4367143', '73.0894341', '2024-02-22 21:35:29'),
(00000000996, 00000000001, '31.4367139', '73.0894411', '2024-02-22 21:35:40'),
(00000000997, 00000000001, '31.4367145', '73.0894338', '2024-02-22 21:35:50'),
(00000000998, 00000000001, '31.436716', '73.0894327', '2024-02-22 21:36:00'),
(00000000999, 00000000001, '31.4367145', '73.0894343', '2024-02-22 21:36:10'),
(00000001000, 00000000001, '31.4367144', '73.0894344', '2024-02-22 21:36:20'),
(00000001001, 00000000001, '31.4367148', '73.0894364', '2024-02-22 21:36:29'),
(00000001002, 00000000001, '31.4367142', '73.0894339', '2024-02-22 21:36:42'),
(00000001003, 00000000001, '31.4367132', '73.089438', '2024-02-22 21:36:50'),
(00000001004, 00000000001, '31.4367112', '73.0894355', '2024-02-22 21:37:00'),
(00000001005, 00000000001, '31.4367085', '73.0894487', '2024-02-22 21:37:10'),
(00000001006, 00000000001, '31.4367139', '73.0894379', '2024-02-22 21:37:20'),
(00000001007, 00000000001, '31.4367128', '73.0894388', '2024-02-22 21:37:30'),
(00000001008, 00000000001, '31.4367115', '73.0894359', '2024-02-22 21:37:40'),
(00000001009, 00000000001, '31.4367124', '73.089436', '2024-02-22 21:37:50'),
(00000001010, 00000000001, '31.4367134', '73.0894398', '2024-02-22 21:37:59'),
(00000001011, 00000000001, '31.4367128', '73.0894356', '2024-02-22 21:38:10'),
(00000001012, 00000000001, '31.4367135', '73.0894389', '2024-02-22 21:38:20'),
(00000001013, 00000000001, '31.4367205', '73.0894508', '2024-02-22 21:38:30'),
(00000001014, 00000000001, '31.436715', '73.0894379', '2024-02-22 21:38:39'),
(00000001015, 00000000001, '31.4367145', '73.0894391', '2024-02-22 21:38:49'),
(00000001016, 00000000001, '31.4367144', '73.0894385', '2024-02-22 21:38:59'),
(00000001017, 00000000001, '31.4367128', '73.0894363', '2024-02-22 21:39:10'),
(00000001018, 00000000001, '31.436721', '73.0894494', '2024-02-22 21:39:20'),
(00000001019, 00000000001, '31.4367149', '73.0894387', '2024-02-22 21:39:30'),
(00000001020, 00000000001, '31.4367195', '73.0894477', '2024-02-22 21:39:40'),
(00000001021, 00000000001, '31.4367136', '73.0894346', '2024-02-22 21:39:50'),
(00000001022, 00000000001, '31.4367136', '73.0894357', '2024-02-22 21:40:00'),
(00000001023, 00000000001, '31.436714', '73.0894389', '2024-02-22 21:40:10'),
(00000001024, 00000000001, '31.4367145', '73.0894378', '2024-02-22 21:40:20'),
(00000001025, 00000000001, '31.4367118', '73.0894385', '2024-02-22 21:40:30'),
(00000001026, 00000000001, '31.4367149', '73.0894392', '2024-02-22 21:40:39'),
(00000001027, 00000000001, '31.4367147', '73.0894386', '2024-02-22 21:40:50'),
(00000001028, 00000000001, '31.4367195', '73.0894506', '2024-02-22 21:40:59'),
(00000001029, 00000000001, '31.4367123', '73.0894363', '2024-02-22 21:41:09'),
(00000001030, 00000000001, '31.4367147', '73.0894389', '2024-02-22 21:41:20'),
(00000001031, 00000000001, '31.4367138', '73.0894375', '2024-02-22 21:41:29'),
(00000001032, 00000000001, '31.4367127', '73.0894349', '2024-02-22 21:41:39'),
(00000001033, 00000000001, '31.4367129', '73.0894352', '2024-02-22 21:41:50'),
(00000001034, 00000000001, '31.4367135', '73.0894384', '2024-02-22 21:41:59'),
(00000001035, 00000000001, '31.4367131', '73.0894352', '2024-02-22 21:42:10'),
(00000001036, 00000000001, '31.4367147', '73.0894382', '2024-02-22 21:42:20'),
(00000001037, 00000000001, '31.4367085', '73.0894467', '2024-02-22 21:42:30'),
(00000001038, 00000000001, '31.4367124', '73.0894368', '2024-02-22 21:42:40'),
(00000001039, 00000000001, '31.4367155', '73.0894375', '2024-02-22 21:42:49'),
(00000001040, 00000000001, '31.4367123', '73.0894361', '2024-02-22 21:43:00'),
(00000001041, 00000000001, '31.4367146', '73.089446', '2024-02-22 21:43:10'),
(00000001042, 00000000001, '31.4367205', '73.0894485', '2024-02-22 21:43:19'),
(00000001043, 00000000001, '31.4367159', '73.0894375', '2024-02-22 21:43:30'),
(00000001044, 00000000001, '31.4367153', '73.0894377', '2024-02-22 21:43:40'),
(00000001045, 00000000001, '31.4367121', '73.0894374', '2024-02-22 21:43:50'),
(00000001046, 00000000001, '31.4367152', '73.0894472', '2024-02-22 21:44:00'),
(00000001047, 00000000001, '31.4367128', '73.089435', '2024-02-22 21:44:10'),
(00000001048, 00000000001, '31.4367221', '73.0894487', '2024-02-22 21:44:20'),
(00000001049, 00000000001, '31.4367138', '73.0894374', '2024-02-22 21:44:30'),
(00000001050, 00000000001, '31.4367192', '73.0894482', '2024-02-22 21:44:39'),
(00000001051, 00000000001, '31.4367137', '73.0894334', '2024-02-22 21:44:50'),
(00000001052, 00000000001, '31.4367129', '73.0894364', '2024-02-22 21:44:59'),
(00000001053, 00000000001, '31.436714', '73.0894324', '2024-02-22 21:45:10'),
(00000001054, 00000000001, '31.4367117', '73.0894378', '2024-02-22 21:45:20'),
(00000001055, 00000000001, '31.436721', '73.089449', '2024-02-22 21:45:30'),
(00000001056, 00000000001, '31.4367214', '73.0894469', '2024-02-22 21:45:40'),
(00000001057, 00000000001, '31.4367209', '73.089448', '2024-02-22 21:45:50'),
(00000001058, 00000000001, '31.4367146', '73.0894404', '2024-02-22 21:45:59'),
(00000001059, 00000000001, '31.4367194', '73.0894481', '2024-02-22 21:46:09'),
(00000001060, 00000000001, '31.4366073', '73.089541', '2024-02-22 21:46:20'),
(00000001061, 00000000001, '31.4366558', '73.089607', '2024-02-22 21:46:30'),
(00000001062, 00000000001, '31.4366314', '73.0896365', '2024-02-22 21:46:39'),
(00000001063, 00000000001, '31.4366063', '73.089693', '2024-02-22 21:46:50'),
(00000001064, 00000000001, '31.4366291', '73.0895392', '2024-02-22 21:46:59'),
(00000001065, 00000000001, '31.4366357', '73.0894535', '2024-02-22 21:47:10'),
(00000001066, 00000000001, '31.4366003', '73.0893981', '2024-02-22 21:47:20'),
(00000001067, 00000000001, '31.4365516', '73.0893836', '2024-02-22 21:47:30'),
(00000001068, 00000000001, '31.4365614', '73.0894361', '2024-02-22 21:47:40'),
(00000001069, 00000000001, '31.4366151', '73.0894233', '2024-02-22 21:47:50'),
(00000001070, 00000000001, '31.4366638', '73.0894431', '2024-02-22 21:48:00'),
(00000001071, 00000000001, '31.4366987', '73.0894386', '2024-02-22 21:48:10'),
(00000001072, 00000000001, '31.4367631', '73.0894225', '2024-02-22 21:48:20'),
(00000001073, 00000000001, '31.436837', '73.0894104', '2024-02-22 21:48:30'),
(00000001074, 00000000001, '31.4368597', '73.0893223', '2024-02-22 21:48:39'),
(00000001075, 00000000001, '31.4368421', '73.0893185', '2024-02-22 21:48:50'),
(00000001076, 00000000001, '31.4367473', '73.089421', '2024-02-22 21:49:00'),
(00000001077, 00000000001, '31.4366993', '73.0894086', '2024-02-22 21:49:10'),
(00000001078, 00000000001, '31.436612', '73.0893501', '2024-02-22 21:49:20'),
(00000001079, 00000000001, '31.4366789', '73.0893713', '2024-02-22 21:49:30'),
(00000001080, 00000000001, '31.4367576', '73.0894865', '2024-02-22 21:49:40'),
(00000001081, 00000000001, '31.4367763', '73.0895981', '2024-02-22 21:49:50'),
(00000001082, 00000000001, '31.4368243', '73.0896938', '2024-02-22 21:50:00'),
(00000001083, 00000000001, '31.4368394', '73.0897129', '2024-02-22 21:50:10'),
(00000001084, 00000000001, '31.4366891', '73.089727', '2024-02-22 21:50:20'),
(00000001085, 00000000001, '31.4365871', '73.0897495', '2024-02-22 21:50:30'),
(00000001086, 00000000001, '31.4365833', '73.0897383', '2024-02-22 21:50:39'),
(00000001087, 00000000001, '31.4366855', '73.0896151', '2024-02-22 21:50:50'),
(00000001088, 00000000001, '31.4366944', '73.0896098', '2024-02-22 21:50:59'),
(00000001089, 00000000001, '31.4366508', '73.0896009', '2024-02-22 21:51:10'),
(00000001090, 00000000001, '31.4365872', '73.0894946', '2024-02-22 21:51:20'),
(00000001091, 00000000001, '31.436538', '73.0893601', '2024-02-22 21:51:30'),
(00000001092, 00000000001, '31.436555', '73.0892909', '2024-02-22 21:51:39'),
(00000001093, 00000000001, '31.4365197', '73.0892209', '2024-02-22 21:51:49'),
(00000001094, 00000000001, '31.4365226', '73.0890536', '2024-02-22 21:51:59'),
(00000001095, 00000000001, '31.4365316', '73.0890845', '2024-02-22 21:52:09'),
(00000001096, 00000000001, '31.4366162', '73.0892248', '2024-02-22 21:52:19'),
(00000001097, 00000000001, '31.4367829', '73.0894306', '2024-02-22 21:52:30'),
(00000001098, 00000000001, '31.4367977', '73.0894114', '2024-02-22 21:52:39'),
(00000001099, 00000000001, '31.436746', '73.08934', '2024-02-22 21:52:49'),
(00000001100, 00000000001, '31.4367524', '73.0893661', '2024-02-22 21:52:59'),
(00000001101, 00000000001, '31.4367777', '73.0894352', '2024-02-22 21:53:09'),
(00000001102, 00000000001, '31.4368194', '73.0894976', '2024-02-22 21:53:19'),
(00000001103, 00000000001, '31.436833', '73.0895644', '2024-02-22 21:53:30'),
(00000001104, 00000000001, '31.43673', '73.08951', '2024-02-22 21:53:40'),
(00000001105, 00000000001, '31.4367066', '73.0894832', '2024-02-22 21:53:50'),
(00000001106, 00000000001, '31.4367043', '73.0894537', '2024-02-22 21:54:00'),
(00000001107, 00000000001, '31.4367052', '73.0894496', '2024-02-22 21:54:12'),
(00000001108, 00000000001, '31.4367101', '73.08945', '2024-02-22 21:54:20'),
(00000001109, 00000000001, '31.4367086', '73.0894512', '2024-02-22 21:54:30'),
(00000001110, 00000000001, '31.4367058', '73.0894548', '2024-02-22 21:54:39'),
(00000001111, 00000000001, '31.4414026', '73.0886492', '2024-02-23 03:50:05'),
(00000001112, 00000000001, '31.4414028', '73.0886491', '2024-02-23 03:50:15'),
(00000001113, 00000000001, '31.4414093', '73.0886478', '2024-02-23 03:50:25'),
(00000001114, 00000000001, '31.4414007', '73.0886401', '2024-02-23 03:50:35'),
(00000001115, 00000000001, '31.4414007', '73.08864', '2024-02-23 03:50:45'),
(00000001116, 00000000001, '31.441401', '73.0886403', '2024-02-23 03:50:55'),
(00000001117, 00000000001, '31.4414091', '73.088647', '2024-02-23 03:51:05'),
(00000001118, 00000000001, '31.4414097', '73.0886481', '2024-02-23 03:51:38'),
(00000001119, 00000000001, '31.4414097', '73.0886481', '2024-02-23 03:51:38'),
(00000001120, 00000000001, '31.4414097', '73.0886481', '2024-02-23 03:51:38'),
(00000001121, 00000000001, '31.4413997', '73.0886425', '2024-02-23 03:51:45'),
(00000001122, 00000000001, '31.4414095', '73.0886465', '2024-02-23 03:51:55'),
(00000001123, 00000000001, '31.4414088', '73.0886464', '2024-02-23 03:52:05'),
(00000001124, 00000000001, '31.4413996', '73.0886439', '2024-02-23 03:52:15'),
(00000001125, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001126, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001127, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001128, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001129, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001130, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001131, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001132, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001133, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001134, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001135, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001136, 00000000001, '31.441401', '73.0886411', '2024-02-23 03:54:23'),
(00000001137, 00000000001, '31.4414083', '73.0886465', '2024-02-23 03:54:25'),
(00000001138, 00000000001, '31.4414011', '73.0886409', '2024-02-23 03:54:35'),
(00000001139, 00000000001, '31.441409', '73.0886466', '2024-02-23 03:54:45'),
(00000001140, 00000000001, '31.4414', '73.0886413', '2024-02-23 03:55:23'),
(00000001141, 00000000001, '31.4414', '73.0886413', '2024-02-23 03:55:23'),
(00000001142, 00000000001, '31.4414', '73.0886413', '2024-02-23 03:55:23'),
(00000001143, 00000000001, '31.4414', '73.0886413', '2024-02-23 03:55:25'),
(00000001144, 00000000001, '31.4414088', '73.0886473', '2024-02-23 03:55:35'),
(00000001145, 00000000001, '31.4414085', '73.0886462', '2024-02-23 03:55:45'),
(00000001146, 00000000001, '31.441401', '73.0886451', '2024-02-23 03:55:55'),
(00000001147, 00000000001, '31.4414004', '73.0886406', '2024-02-23 03:56:05'),
(00000001148, 00000000001, '31.4414034', '73.0886423', '2024-02-23 03:56:15'),
(00000001149, 00000000001, '31.4413994', '73.0886413', '2024-02-23 03:56:25'),
(00000001150, 00000000001, '31.4414', '73.088642', '2024-02-23 03:56:45'),
(00000001151, 00000000001, '31.4414', '73.088642', '2024-02-23 03:56:46'),
(00000001152, 00000000001, '31.4414085', '73.0886456', '2024-02-23 03:56:55'),
(00000001153, 00000000001, '31.4414006', '73.0886404', '2024-02-23 03:57:05'),
(00000001154, 00000000001, '31.4414091', '73.088647', '2024-02-23 03:57:19'),
(00000001155, 00000000001, '31.4414012', '73.0886402', '2024-02-23 03:57:25'),
(00000001156, 00000000001, '31.4414002', '73.0886415', '2024-02-23 03:57:35'),
(00000001157, 00000000001, '31.4414032', '73.0886491', '2024-02-23 03:57:50'),
(00000001158, 00000000001, '31.4414032', '73.0886491', '2024-02-23 03:57:55'),
(00000001159, 00000000001, '31.4414009', '73.0886405', '2024-02-23 03:58:09'),
(00000001160, 00000000001, '31.4414004', '73.0886409', '2024-02-23 03:58:15'),
(00000001161, 00000000001, '31.441399', '73.0886414', '2024-02-23 03:58:25'),
(00000001162, 00000000001, '31.4413993', '73.0886438', '2024-02-23 03:58:36'),
(00000001163, 00000000001, '31.4414008', '73.0886406', '2024-02-23 03:58:45'),
(00000001164, 00000000001, '31.441401', '73.0886404', '2024-02-23 03:58:57'),
(00000001165, 00000000001, '31.4414091', '73.0886482', '2024-02-23 03:59:05'),
(00000001166, 00000000001, '31.4413998', '73.088644', '2024-02-23 03:59:15'),
(00000001167, 00000000001, '31.4413984', '73.0886448', '2024-02-23 03:59:26'),
(00000001168, 00000000001, '31.4414091', '73.0886475', '2024-02-23 03:59:35'),
(00000001169, 00000000001, '31.4414095', '73.0886476', '2024-02-23 03:59:45'),
(00000001170, 00000000001, '31.4414008', '73.0886421', '2024-02-23 03:59:57'),
(00000001171, 00000000001, '31.4414101', '73.088649', '2024-02-23 04:00:05'),
(00000001172, 00000000001, '31.4414002', '73.0886438', '2024-02-23 04:00:15'),
(00000001173, 00000000001, '31.4414006', '73.0886404', '2024-02-23 04:00:25'),
(00000001174, 00000000001, '31.4413989', '73.0886438', '2024-02-23 04:00:35'),
(00000001175, 00000000001, '31.4414005', '73.0886406', '2024-02-23 04:00:45'),
(00000001176, 00000000001, '31.4413984', '73.0886451', '2024-02-23 04:00:55'),
(00000001177, 00000000001, '31.4414064', '73.0886487', '2024-02-23 04:01:05'),
(00000001178, 00000000001, '31.4414001', '73.0886409', '2024-02-23 04:01:15'),
(00000001179, 00000000001, '31.4413982', '73.0886451', '2024-02-23 04:01:26'),
(00000001180, 00000000001, '31.4413991', '73.0886422', '2024-02-23 04:01:35'),
(00000001181, 00000000001, '31.4413974', '73.0886452', '2024-02-23 04:01:45'),
(00000001182, 00000000001, '31.4414088', '73.0886463', '2024-02-23 04:01:55'),
(00000001183, 00000000001, '31.4414087', '73.0886468', '2024-02-23 04:02:05'),
(00000001184, 00000000001, '31.4413996', '73.0886412', '2024-02-23 04:02:18'),
(00000001185, 00000000001, '31.4413986', '73.0886441', '2024-02-23 04:02:25'),
(00000001186, 00000000001, '31.4413993', '73.0886407', '2024-02-23 04:02:35'),
(00000001187, 00000000001, '31.4413999', '73.0886419', '2024-02-23 04:02:45'),
(00000001188, 00000000001, '31.4414086', '73.0886466', '2024-02-23 04:02:56'),
(00000001189, 00000000001, '31.4414088', '73.0886476', '2024-02-23 04:03:05'),
(00000001190, 00000000001, '31.4413977', '73.0886449', '2024-02-23 04:03:15'),
(00000001191, 00000000001, '31.4414084', '73.0886471', '2024-02-23 04:03:25'),
(00000001192, 00000000001, '31.4414082', '73.0886472', '2024-02-23 04:03:35'),
(00000001193, 00000000001, '31.4413985', '73.0886449', '2024-02-23 04:03:49'),
(00000001194, 00000000001, '31.4413987', '73.0886446', '2024-02-23 04:03:55'),
(00000001195, 00000000001, '31.441409', '73.0886471', '2024-02-23 04:04:07'),
(00000001196, 00000000001, '31.4414092', '73.0886466', '2024-02-23 04:04:15'),
(00000001197, 00000000001, '31.4413991', '73.0886413', '2024-02-23 04:04:27'),
(00000001198, 00000000001, '31.4413984', '73.0886441', '2024-02-23 04:04:37'),
(00000001199, 00000000001, '31.4413989', '73.0886415', '2024-02-23 04:04:45'),
(00000001200, 00000000001, '31.4413991', '73.0886407', '2024-02-23 04:04:55'),
(00000001201, 00000000001, '31.4414091', '73.0886483', '2024-02-23 04:05:05'),
(00000001202, 00000000001, '31.4413997', '73.0886407', '2024-02-23 04:05:15'),
(00000001203, 00000000001, '31.4414095', '73.0886488', '2024-02-23 04:05:25'),
(00000001204, 00000000001, '31.4414012', '73.0886409', '2024-02-23 04:05:37'),
(00000001205, 00000000001, '31.441401', '73.0886419', '2024-02-23 04:05:45'),
(00000001206, 00000000001, '31.4413992', '73.0886447', '2024-02-23 04:05:55'),
(00000001207, 00000000001, '31.4414031', '73.0886552', '2024-02-23 04:06:05'),
(00000001208, 00000000001, '31.4414006', '73.0886443', '2024-02-23 04:06:15'),
(00000001209, 00000000001, '31.4414005', '73.0886451', '2024-02-23 04:06:25'),
(00000001210, 00000000001, '31.4414085', '73.0886467', '2024-02-23 04:06:37'),
(00000001211, 00000000001, '31.4413982', '73.0886452', '2024-02-23 04:06:45'),
(00000001212, 00000000001, '31.4414009', '73.0886407', '2024-02-23 04:06:56'),
(00000001213, 00000000001, '31.4414009', '73.0886401', '2024-02-23 04:07:05'),
(00000001214, 00000000001, '31.4414007', '73.0886403', '2024-02-23 04:07:16'),
(00000001215, 00000000001, '31.4414086', '73.0886471', '2024-02-23 04:07:25'),
(00000001216, 00000000001, '31.4414007', '73.0886407', '2024-02-23 04:07:35'),
(00000001217, 00000000001, '31.4414005', '73.0886407', '2024-02-23 04:07:45'),
(00000001218, 00000000001, '31.4413993', '73.0886415', '2024-02-23 04:07:55'),
(00000001219, 00000000001, '31.4414009', '73.0886408', '2024-02-23 04:08:05'),
(00000001220, 00000000001, '31.4414026', '73.0886495', '2024-02-23 04:08:15'),
(00000001221, 00000000001, '31.4414003', '73.0886406', '2024-02-23 04:08:26'),
(00000001222, 00000000001, '31.4414005', '73.0886404', '2024-02-23 04:08:41'),
(00000001223, 00000000001, '31.4414005', '73.0886407', '2024-02-23 04:08:45'),
(00000001224, 00000000001, '31.4414028', '73.0886489', '2024-02-23 04:08:55'),
(00000001225, 00000000001, '31.4414025', '73.0886495', '2024-02-23 04:09:06'),
(00000001226, 00000000001, '31.4414006', '73.0886401', '2024-02-23 04:09:15'),
(00000001227, 00000000001, '31.4413985', '73.0886453', '2024-02-23 04:09:25'),
(00000001228, 00000000001, '31.4414087', '73.0886462', '2024-02-23 04:09:36'),
(00000001229, 00000000001, '31.4413993', '73.0886461', '2024-02-23 04:09:45'),
(00000001230, 00000000001, '31.4413999', '73.0886415', '2024-02-23 04:09:57'),
(00000001231, 00000000001, '31.4414087', '73.0886459', '2024-02-23 04:10:05'),
(00000001232, 00000000001, '31.4414002', '73.0886411', '2024-02-23 04:10:17'),
(00000001233, 00000000001, '31.4414015', '73.0886464', '2024-02-23 04:10:25'),
(00000001234, 00000000001, '31.4414091', '73.0886487', '2024-02-23 04:10:35'),
(00000001235, 00000000001, '31.4414011', '73.0886428', '2024-02-23 04:10:45'),
(00000001236, 00000000001, '31.4414084', '73.0886476', '2024-02-23 04:10:55'),
(00000001237, 00000000001, '31.4414084', '73.0886494', '2024-02-23 04:11:05'),
(00000001238, 00000000001, '31.4414013', '73.0886405', '2024-02-23 04:11:15'),
(00000001239, 00000000001, '31.4414015', '73.0886411', '2024-02-23 04:11:25'),
(00000001240, 00000000001, '31.4414011', '73.0886404', '2024-02-23 04:11:36'),
(00000001241, 00000000001, '31.4414009', '73.0886413', '2024-02-23 04:11:45'),
(00000001242, 00000000001, '31.441409', '73.0886496', '2024-02-23 04:11:55'),
(00000001243, 00000000001, '31.441445', '73.0886645', '2024-02-23 04:12:05'),
(00000001244, 00000000001, '31.4414061', '73.0886585', '2024-02-23 04:12:15'),
(00000001245, 00000000001, '31.4414089', '73.0886511', '2024-02-23 04:12:25'),
(00000001246, 00000000001, '31.4414012', '73.0886451', '2024-02-23 04:12:36'),
(00000001247, 00000000001, '31.4414092', '73.0886509', '2024-02-23 04:12:45'),
(00000001248, 00000000001, '31.4414011', '73.0886443', '2024-02-23 04:12:55'),
(00000001249, 00000000001, '31.4414034', '73.0886485', '2024-02-23 04:13:05'),
(00000001250, 00000000001, '31.4414013', '73.0886447', '2024-02-23 04:13:15'),
(00000001251, 00000000001, '31.4414011', '73.0886454', '2024-02-23 04:13:25'),
(00000001252, 00000000001, '31.4414085', '73.0886501', '2024-02-23 04:13:35'),
(00000001253, 00000000001, '31.4414016', '73.0886459', '2024-02-23 04:13:45'),
(00000001254, 00000000001, '31.4414029', '73.088647', '2024-02-23 04:13:55'),
(00000001255, 00000000001, '31.4414037', '73.0886467', '2024-02-23 04:14:05'),
(00000001256, 00000000001, '31.4414085', '73.0886507', '2024-02-23 04:14:15'),
(00000001257, 00000000001, '31.4414088', '73.088651', '2024-02-23 04:14:25'),
(00000001258, 00000000001, '31.4414014', '73.0886449', '2024-02-23 04:14:35'),
(00000001259, 00000000001, '31.4414012', '73.0886444', '2024-02-23 04:14:45'),
(00000001260, 00000000001, '31.4414015', '73.0886451', '2024-02-23 04:14:55'),
(00000001261, 00000000001, '31.4414015', '73.0886444', '2024-02-23 04:15:05'),
(00000001262, 00000000001, '31.441401', '73.0886439', '2024-02-23 04:15:15'),
(00000001263, 00000000001, '31.4414011', '73.0886451', '2024-02-23 04:15:25'),
(00000001264, 00000000001, '31.4414008', '73.0886443', '2024-02-23 04:15:35'),
(00000001265, 00000000001, '31.4414011', '73.088644', '2024-02-23 04:15:45'),
(00000001266, 00000000001, '31.4414008', '73.0886424', '2024-02-23 04:15:55'),
(00000001267, 00000000001, '31.4414096', '73.0886477', '2024-02-23 04:16:05'),
(00000001268, 00000000001, '31.4414', '73.0886473', '2024-02-23 04:16:15'),
(00000001269, 00000000001, '31.4414093', '73.088646', '2024-02-23 04:16:25'),
(00000001270, 00000000001, '31.4414084', '73.0886466', '2024-02-23 04:16:35'),
(00000001271, 00000000001, '31.4414088', '73.0886473', '2024-02-23 04:16:45'),
(00000001272, 00000000001, '31.4414035', '73.0886489', '2024-02-23 04:16:57'),
(00000001273, 00000000001, '31.4414089', '73.0886461', '2024-02-23 04:17:05'),
(00000001274, 00000000001, '31.4414086', '73.0886465', '2024-02-23 04:17:15'),
(00000001275, 00000000001, '31.441409', '73.0886464', '2024-02-23 04:17:25'),
(00000001276, 00000000001, '31.4414093', '73.088648', '2024-02-23 04:17:35'),
(00000001277, 00000000001, '31.4414011', '73.0886405', '2024-02-23 04:17:45'),
(00000001278, 00000000001, '31.4414086', '73.0886452', '2024-02-23 04:17:55'),
(00000001279, 00000000001, '31.4414091', '73.088647', '2024-02-23 04:18:06'),
(00000001280, 00000000001, '31.4414098', '73.0886481', '2024-02-23 04:18:16'),
(00000001281, 00000000001, '31.4414092', '73.0886473', '2024-02-23 04:18:25'),
(00000001282, 00000000001, '31.4414014', '73.0886409', '2024-02-23 04:18:35'),
(00000001283, 00000000001, '31.441401', '73.0886422', '2024-02-23 04:18:47'),
(00000001284, 00000000001, '31.4414005', '73.0886403', '2024-02-23 04:18:55'),
(00000001285, 00000000001, '31.4414011', '73.0886401', '2024-02-23 04:19:05'),
(00000001286, 00000000001, '31.4414032', '73.0886489', '2024-02-23 04:19:16'),
(00000001287, 00000000001, '31.4414087', '73.088646', '2024-02-23 04:19:26'),
(00000001288, 00000000001, '31.4414009', '73.0886417', '2024-02-23 04:19:35'),
(00000001289, 00000000001, '31.441401', '73.0886425', '2024-02-23 04:19:45'),
(00000001290, 00000000001, '31.4414011', '73.0886444', '2024-02-23 04:19:55'),
(00000001291, 00000000001, '31.4414007', '73.0886452', '2024-02-23 04:20:05'),
(00000001292, 00000000001, '31.4414011', '73.0886479', '2024-02-23 04:20:15'),
(00000001293, 00000000001, '31.4414014', '73.0886485', '2024-02-23 04:20:25'),
(00000001294, 00000000001, '31.4414005', '73.088648', '2024-02-23 04:20:35'),
(00000001295, 00000000001, '31.4414057', '73.0886493', '2024-02-23 04:20:46'),
(00000001296, 00000000001, '31.4414048', '73.088649', '2024-02-23 04:20:55'),
(00000001297, 00000000001, '31.441401', '73.0886458', '2024-02-23 04:21:05'),
(00000001298, 00000000001, '31.4414034', '73.0886482', '2024-02-23 04:21:15'),
(00000001299, 00000000001, '31.4414011', '73.0886452', '2024-02-23 04:21:25'),
(00000001300, 00000000001, '31.4413995', '73.0886482', '2024-02-23 04:21:35');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(00000001301, 00000000001, '31.4414083', '73.0886479', '2024-02-23 04:21:46'),
(00000001302, 00000000001, '31.4414009', '73.0886443', '2024-02-23 04:21:55'),
(00000001303, 00000000001, '31.4414013', '73.0886399', '2024-02-23 04:22:07'),
(00000001304, 00000000001, '31.4414086', '73.0886478', '2024-02-23 04:22:16'),
(00000001305, 00000000001, '31.4414035', '73.088649', '2024-02-23 04:22:26'),
(00000001306, 00000000001, '31.4414091', '73.0886477', '2024-02-23 04:22:35'),
(00000001307, 00000000001, '31.4414013', '73.0886398', '2024-02-23 04:22:45'),
(00000001308, 00000000001, '31.4414008', '73.088646', '2024-02-23 04:22:55'),
(00000001309, 00000000001, '31.441399', '73.0886469', '2024-02-23 04:23:05'),
(00000001310, 00000000001, '31.4414008', '73.0886466', '2024-02-23 04:23:15'),
(00000001311, 00000000001, '31.4414011', '73.0886471', '2024-02-23 04:23:25'),
(00000001312, 00000000001, '31.4414009', '73.0886473', '2024-02-23 04:23:37'),
(00000001313, 00000000001, '31.4414008', '73.0886466', '2024-02-23 04:23:45'),
(00000001314, 00000000001, '31.4414034', '73.0886485', '2024-02-23 04:23:57'),
(00000001315, 00000000001, '31.4414059', '73.0886505', '2024-02-23 04:24:05'),
(00000001316, 00000000001, '31.4414027', '73.0886493', '2024-02-23 04:24:15'),
(00000001317, 00000000001, '31.4414012', '73.0886435', '2024-02-23 04:24:25'),
(00000001318, 00000000001, '31.4414009', '73.0886434', '2024-02-23 04:24:35'),
(00000001319, 00000000001, '31.4414034', '73.0886489', '2024-02-23 04:24:45'),
(00000001320, 00000000001, '31.4414008', '73.0886411', '2024-02-23 04:24:55'),
(00000001321, 00000000001, '31.4413977', '73.0886452', '2024-02-23 04:25:05'),
(00000001322, 00000000001, '31.4414003', '73.0886419', '2024-02-23 04:25:15'),
(00000001323, 00000000001, '31.4414083', '73.0886476', '2024-02-23 04:25:25'),
(00000001324, 00000000001, '31.4413985', '73.0886412', '2024-02-23 04:25:35'),
(00000001325, 00000000001, '31.4414004', '73.0886405', '2024-02-23 04:25:45'),
(00000001326, 00000000001, '31.4414', '73.0886414', '2024-02-23 04:25:55'),
(00000001327, 00000000001, '31.4414002', '73.0886416', '2024-02-23 04:26:05'),
(00000001328, 00000000001, '31.4414015', '73.0886406', '2024-02-23 04:26:15'),
(00000001329, 00000000001, '31.4414014', '73.0886399', '2024-02-23 04:26:25'),
(00000001330, 00000000001, '31.4414004', '73.0886407', '2024-02-23 04:26:36'),
(00000001331, 00000000001, '31.4414094', '73.0886477', '2024-02-23 04:26:45'),
(00000001332, 00000000001, '31.4414009', '73.0886417', '2024-02-23 04:26:57'),
(00000001333, 00000000001, '31.4414009', '73.0886427', '2024-02-23 04:27:05'),
(00000001334, 00000000001, '31.4414008', '73.0886401', '2024-02-23 04:27:15'),
(00000001335, 00000000001, '31.441401', '73.088642', '2024-02-23 04:27:29'),
(00000001336, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:00:00'),
(00000001337, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:00:11'),
(00000001338, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:00:21'),
(00000001339, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:00:31'),
(00000001340, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:00:41'),
(00000001341, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:01:25'),
(00000001342, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:01:25'),
(00000001343, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:01:25'),
(00000001344, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:01:25'),
(00000001345, 00000000001, '31.4366865', '73.0894576', '2024-02-23 06:01:30'),
(00000001346, 00000000001, '31.4367128', '73.0894464', '2024-02-23 06:02:00'),
(00000001347, 00000000001, '31.4367128', '73.0894464', '2024-02-23 06:02:00'),
(00000001348, 00000000001, '31.4367128', '73.0894464', '2024-02-23 06:02:38'),
(00000001349, 00000000001, '31.4367128', '73.0894464', '2024-02-23 06:02:38'),
(00000001350, 00000000001, '31.4367128', '73.0894464', '2024-02-23 06:02:38'),
(00000001351, 00000000001, '31.4367128', '73.0894464', '2024-02-23 06:02:38'),
(00000001352, 00000000001, '31.4367128', '73.0894464', '2024-02-23 06:02:54'),
(00000001353, 00000000001, '31.4367128', '73.0894464', '2024-02-23 06:02:54'),
(00000001354, 00000000001, '31.4414014', '73.0886402', '2024-02-23 22:07:32'),
(00000001355, 00000000001, '31.4414007', '73.08864', '2024-02-23 22:07:45'),
(00000001356, 00000000001, '31.4414005', '73.0886417', '2024-02-23 22:07:50'),
(00000001357, 00000000001, '31.4414032', '73.0886493', '2024-02-23 22:08:00'),
(00000001358, 00000000001, '31.441409', '73.0886455', '2024-02-23 22:08:09'),
(00000001359, 00000000001, '31.4414006', '73.088641', '2024-02-23 22:08:21'),
(00000001360, 00000000001, '31.4414016', '73.0886419', '2024-02-23 22:08:38'),
(00000001361, 00000000001, '31.4413994', '73.0886444', '2024-02-23 22:08:45'),
(00000001362, 00000000001, '31.4414088', '73.0886466', '2024-02-23 22:08:52'),
(00000001363, 00000000001, '31.4414079', '73.0886498', '2024-02-23 22:08:53'),
(00000001364, 00000000001, '31.4414033', '73.0886467', '2024-02-23 22:09:10'),
(00000001365, 00000000001, '31.4414013', '73.0886438', '2024-02-23 22:09:24'),
(00000001366, 00000000001, '31.4414061', '73.0886505', '2024-02-23 22:09:44'),
(00000001367, 00000000001, '31.4414028', '73.0886489', '2024-02-23 22:10:16'),
(00000001368, 00000000001, '31.4414034', '73.0886491', '2024-02-23 22:10:20'),
(00000001369, 00000000001, '31.441404', '73.0886497', '2024-02-23 22:10:20'),
(00000001370, 00000000001, '31.4414009', '73.0886435', '2024-02-23 22:10:23'),
(00000001371, 00000000001, '31.4414033', '73.0886484', '2024-02-23 22:10:46'),
(00000001372, 00000000001, '31.4414033', '73.0886488', '2024-02-23 22:10:55'),
(00000001373, 00000000001, '31.4414036', '73.0886489', '2024-02-23 22:11:13'),
(00000001374, 00000000001, '31.4414033', '73.0886486', '2024-02-23 22:11:23'),
(00000001375, 00000000001, '31.4414005', '73.0886451', '2024-02-23 22:11:52'),
(00000001376, 00000000001, '31.4414034', '73.0886483', '2024-02-23 22:11:56'),
(00000001377, 00000000001, '31.4414023', '73.0886494', '2024-02-23 22:12:03'),
(00000001378, 00000000001, '31.441409', '73.088646', '2024-02-23 22:12:16'),
(00000001379, 00000000001, '31.4414008', '73.088643', '2024-02-23 22:12:23'),
(00000001380, 00000000001, '31.4414008', '73.0886442', '2024-02-23 22:12:38'),
(00000001381, 00000000001, '31.4414032', '73.088649', '2024-02-23 22:12:47'),
(00000001382, 00000000001, '31.4414059', '73.0886477', '2024-02-23 22:12:59'),
(00000001383, 00000000001, '31.4414029', '73.0886492', '2024-02-23 22:13:09'),
(00000001384, 00000000001, '31.4414008', '73.088646', '2024-02-23 22:13:13'),
(00000001385, 00000000001, '31.4414033', '73.0886493', '2024-02-23 22:13:26'),
(00000001386, 00000000001, '31.4414087', '73.0886461', '2024-02-23 22:13:37'),
(00000001387, 00000000001, '31.4414032', '73.0886485', '2024-02-23 22:13:43'),
(00000001388, 00000000001, '31.4414033', '73.0886492', '2024-02-23 22:13:54'),
(00000001389, 00000000001, '31.4414034', '73.0886487', '2024-02-23 22:14:07'),
(00000001390, 00000000001, '31.441401', '73.0886457', '2024-02-23 22:14:22'),
(00000001391, 00000000001, '31.441401', '73.0886436', '2024-02-23 22:14:30'),
(00000001392, 00000000001, '31.4414036', '73.0886476', '2024-02-23 22:14:43'),
(00000001393, 00000000001, '31.4414009', '73.0886427', '2024-02-23 22:15:04'),
(00000001394, 00000000001, '31.4414009', '73.0886444', '2024-02-23 22:15:09'),
(00000001395, 00000000001, '31.4414035', '73.0886482', '2024-02-23 22:15:12'),
(00000001396, 00000000001, '31.4414073', '73.0886496', '2024-02-23 22:15:21'),
(00000001397, 00000000001, '31.4414012', '73.0886447', '2024-02-23 22:15:34'),
(00000001398, 00000000001, '31.4414034', '73.0886488', '2024-02-23 22:15:42'),
(00000001399, 00000000001, '31.4414081', '73.0886465', '2024-02-23 22:16:00'),
(00000001400, 00000000001, '31.4414035', '73.0886488', '2024-02-23 22:16:09'),
(00000001401, 00000000001, '31.4414034', '73.0886489', '2024-02-23 22:16:49'),
(00000001402, 00000000001, '31.4414029', '73.0886492', '2024-02-23 22:17:00'),
(00000001403, 00000000001, '31.4414029', '73.0886492', '2024-02-23 22:17:10'),
(00000001404, 00000000001, '31.4414034', '73.0886487', '2024-02-23 22:17:15'),
(00000001405, 00000000001, '31.4414009', '73.0886429', '2024-02-23 22:17:26'),
(00000001406, 00000000001, '31.441432', '73.0886591', '2024-02-23 22:17:39'),
(00000001407, 00000000001, '31.4414005', '73.0886402', '2024-02-23 22:17:50'),
(00000001408, 00000000005, '31.4414296', '73.0886435', '2024-03-16 03:00:35'),
(00000001409, 00000000005, '31.4414256', '73.0886508', '2024-03-16 03:00:47'),
(00000001410, 00000000005, '31.4414308', '73.0886426', '2024-03-16 03:00:55'),
(00000001411, 00000000005, '31.4414316', '73.0886432', '2024-03-16 03:01:05'),
(00000001412, 00000000005, '31.4414306', '73.088643', '2024-03-16 03:01:17'),
(00000001413, 00000000005, '31.4414262', '73.0886396', '2024-03-16 03:01:25'),
(00000001414, 00000000005, '31.4414313', '73.0886427', '2024-03-16 03:01:35'),
(00000001415, 00000000005, '31.4414304', '73.0886412', '2024-03-16 03:01:45'),
(00000001416, 00000000005, '31.44143', '73.0886423', '2024-03-16 03:01:55'),
(00000001417, 00000000005, '31.4414342', '73.0886451', '2024-03-16 03:02:05'),
(00000001418, 00000000005, '31.4414304', '73.0886426', '2024-03-16 03:02:15'),
(00000001419, 00000000005, '31.4414292', '73.0886431', '2024-03-16 03:02:25'),
(00000001420, 00000000005, '31.4414261', '73.0886415', '2024-03-16 03:02:36'),
(00000001421, 00000000005, '31.4414265', '73.0886424', '2024-03-16 03:02:45'),
(00000001422, 00000000005, '31.4414322', '73.088643', '2024-03-16 03:02:56'),
(00000001423, 00000000005, '31.4414309', '73.0886425', '2024-03-16 03:03:06'),
(00000001424, 00000000005, '31.441426', '73.0886403', '2024-03-16 03:03:16'),
(00000001425, 00000000005, '31.4414292', '73.0886431', '2024-03-16 03:03:26'),
(00000001426, 00000000005, '31.441426', '73.0886412', '2024-03-16 03:03:36'),
(00000001427, 00000000005, '31.4414289', '73.088643', '2024-03-16 03:03:46'),
(00000001428, 00000000005, '31.4414257', '73.0886408', '2024-03-16 03:03:57'),
(00000001429, 00000000005, '31.4414296', '73.0886388', '2024-03-16 03:04:07'),
(00000001430, 00000000005, '31.4414291', '73.0886422', '2024-03-16 03:04:17'),
(00000001431, 00000000005, '31.4414321', '73.0886405', '2024-03-16 03:04:26'),
(00000001432, 00000000005, '31.4414312', '73.0886429', '2024-03-16 03:04:37'),
(00000001433, 00000000005, '31.4414284', '73.0886434', '2024-03-16 03:04:46'),
(00000001434, 00000000005, '31.4414305', '73.0886422', '2024-03-16 03:05:03'),
(00000001435, 00000000005, '31.4414304', '73.0886423', '2024-03-16 03:05:13'),
(00000001436, 00000000005, '31.4414304', '73.0886422', '2024-03-16 03:05:15'),
(00000001437, 00000000005, '31.441429', '73.0886428', '2024-03-16 03:05:25'),
(00000001438, 00000000005, '31.4414263', '73.0886437', '2024-03-16 03:05:40'),
(00000001439, 00000000005, '31.4414293', '73.0886416', '2024-03-16 03:05:45'),
(00000001440, 00000000005, '31.4414314', '73.0886419', '2024-03-16 03:05:55'),
(00000001441, 00000000005, '31.4414314', '73.0886396', '2024-03-16 03:06:05'),
(00000001442, 00000000005, '31.4414308', '73.0886426', '2024-03-16 03:06:15'),
(00000001443, 00000000005, '31.4414257', '73.0886419', '2024-03-16 03:06:25'),
(00000001444, 00000000005, '31.4414322', '73.0886426', '2024-03-16 03:06:35'),
(00000001445, 00000000005, '31.4414327', '73.0886425', '2024-03-16 03:06:45'),
(00000001446, 00000000005, '31.4414328', '73.088642', '2024-03-16 03:06:55'),
(00000001447, 00000000005, '31.4414257', '73.0886412', '2024-03-16 03:07:06'),
(00000001448, 00000000005, '31.4414326', '73.0886444', '2024-03-16 03:07:15'),
(00000001449, 00000000005, '31.4414325', '73.0886443', '2024-03-16 03:07:26'),
(00000001450, 00000000005, '31.4414298', '73.0886419', '2024-03-16 03:07:36'),
(00000001451, 00000000005, '31.4414286', '73.0886434', '2024-03-16 03:07:46'),
(00000001452, 00000000005, '31.4414284', '73.0886434', '2024-03-16 03:07:56'),
(00000001453, 00000000005, '31.4414272', '73.0886427', '2024-03-16 03:08:06'),
(00000001454, 00000000005, '31.4414263', '73.0886388', '2024-03-16 03:08:16'),
(00000001455, 00000000005, '31.44143', '73.0886413', '2024-03-16 03:08:26'),
(00000001456, 00000000005, '31.4414299', '73.0886413', '2024-03-16 03:08:36'),
(00000001457, 00000000005, '31.441428', '73.088643', '2024-03-16 03:08:46'),
(00000001458, 00000000005, '31.4414265', '73.0886373', '2024-03-16 03:09:01'),
(00000001459, 00000000005, '31.4414264', '73.0886374', '2024-03-16 03:09:06'),
(00000001460, 00000000005, '31.441433', '73.0886444', '2024-03-16 03:09:16'),
(00000001461, 00000000005, '31.4414325', '73.0886442', '2024-03-16 03:09:26'),
(00000001462, 00000000005, '31.4414306', '73.0886421', '2024-03-16 03:09:35'),
(00000001463, 00000000005, '31.4414306', '73.0886426', '2024-03-16 03:09:46'),
(00000001464, 00000000005, '31.4414304', '73.0886419', '2024-03-16 03:09:55'),
(00000001465, 00000000005, '31.4414321', '73.0886441', '2024-03-16 03:10:05'),
(00000001466, 00000000005, '31.4414315', '73.0886432', '2024-03-16 03:10:15'),
(00000001467, 00000000005, '31.4414277', '73.0886431', '2024-03-16 03:10:25'),
(00000001468, 00000000005, '31.4414274', '73.0886429', '2024-03-16 03:10:35'),
(00000001469, 00000000005, '31.4414277', '73.0886429', '2024-03-16 03:10:45'),
(00000001470, 00000000005, '31.4414292', '73.0886407', '2024-03-16 03:10:55'),
(00000001471, 00000000005, '31.4414287', '73.08864', '2024-03-16 03:11:05'),
(00000001472, 00000000005, '31.4414321', '73.0886435', '2024-03-16 03:11:15'),
(00000001473, 00000000005, '31.4414311', '73.0886429', '2024-03-16 03:11:24'),
(00000001474, 00000000005, '31.441431', '73.0886428', '2024-03-16 03:11:34'),
(00000001475, 00000000005, '31.4414277', '73.0886433', '2024-03-16 03:11:44'),
(00000001476, 00000000005, '31.4414308', '73.0886423', '2024-03-16 03:11:54'),
(00000001477, 00000000005, '31.4414303', '73.088642', '2024-03-16 03:12:05'),
(00000001478, 00000000005, '31.4414306', '73.0886426', '2024-03-16 03:12:14'),
(00000001479, 00000000005, '31.441427', '73.0886349', '2024-03-16 03:12:24'),
(00000001480, 00000000005, '31.4414312', '73.0886427', '2024-03-16 03:12:34'),
(00000001481, 00000000005, '31.441431', '73.0886426', '2024-03-16 03:12:44'),
(00000001482, 00000000005, '31.4414321', '73.0886433', '2024-03-16 03:12:54'),
(00000001483, 00000000005, '31.4414264', '73.0886372', '2024-03-16 03:13:04'),
(00000001484, 00000000005, '31.4414264', '73.0886376', '2024-03-16 03:13:17'),
(00000001485, 00000000005, '31.4414266', '73.0886363', '2024-03-16 03:13:24'),
(00000001486, 00000000005, '31.4414267', '73.0886366', '2024-03-16 03:13:35'),
(00000001487, 00000000005, '31.4414267', '73.0886366', '2024-03-16 03:13:46'),
(00000001488, 00000000005, '31.441431', '73.0886425', '2024-03-16 03:13:57'),
(00000001489, 00000000005, '31.4414303', '73.0886418', '2024-03-16 03:14:04'),
(00000001490, 00000000005, '31.4414314', '73.0886427', '2024-03-16 03:14:14'),
(00000001491, 00000000005, '31.4414265', '73.088642', '2024-03-16 03:14:26'),
(00000001492, 00000000005, '31.4414289', '73.08864', '2024-03-16 03:14:34'),
(00000001493, 00000000005, '31.4414288', '73.0886401', '2024-03-16 03:14:44'),
(00000001494, 00000000005, '31.4414309', '73.0886427', '2024-03-16 03:14:54'),
(00000001495, 00000000005, '31.4414271', '73.0886417', '2024-03-16 03:15:05'),
(00000001496, 00000000005, '31.4414269', '73.0886391', '2024-03-16 03:15:16'),
(00000001497, 00000000005, '31.4414267', '73.088639', '2024-03-16 03:15:34'),
(00000001498, 00000000005, '31.4414264', '73.0886389', '2024-03-16 03:15:40'),
(00000001499, 00000000005, '31.4414273', '73.0886417', '2024-03-16 03:15:46'),
(00000001500, 00000000005, '31.441431', '73.0886427', '2024-03-16 03:15:55'),
(00000001501, 00000000005, '31.4414294', '73.0886407', '2024-03-16 03:16:04'),
(00000001502, 00000000005, '31.4414293', '73.0886407', '2024-03-16 03:16:14'),
(00000001503, 00000000005, '31.4414299', '73.0886412', '2024-03-16 03:16:26'),
(00000001504, 00000000005, '31.4414315', '73.0886432', '2024-03-16 03:16:34'),
(00000001505, 00000000005, '31.4414481', '73.0886483', '2024-03-16 03:16:55'),
(00000001506, 00000000005, '31.4414317', '73.0886431', '2024-03-16 03:16:59'),
(00000001507, 00000000005, '31.4414711', '73.0886454', '2024-03-16 03:17:05'),
(00000001508, 00000000005, '31.44151', '73.0887403', '2024-03-16 03:17:16'),
(00000001509, 00000000005, '31.4415148', '73.0887824', '2024-03-16 03:17:27'),
(00000001510, 00000000005, '31.4414766', '73.0889616', '2024-03-16 03:17:34'),
(00000001511, 00000000005, '31.4415493', '73.0889483', '2024-03-16 03:17:44'),
(00000001512, 00000000005, '31.4415944', '73.088876', '2024-03-16 03:17:54'),
(00000001513, 00000000005, '31.4415831', '73.0889018', '2024-03-16 03:18:05'),
(00000001514, 00000000005, '31.4415633', '73.0888517', '2024-03-16 03:18:14'),
(00000001515, 00000000005, '31.441562', '73.0888248', '2024-03-16 03:18:24'),
(00000001516, 00000000005, '31.4415617', '73.08878', '2024-03-16 03:18:34'),
(00000001517, 00000000005, '31.4415023', '73.0886743', '2024-03-16 03:18:44'),
(00000001518, 00000000005, '31.4414425', '73.0886238', '2024-03-16 03:18:55'),
(00000001519, 00000000005, '31.4414429', '73.08862', '2024-03-16 03:19:05'),
(00000001520, 00000000005, '31.441506', '73.0886915', '2024-03-16 03:19:15'),
(00000001521, 00000000005, '31.4415668', '73.0887253', '2024-03-16 03:19:24'),
(00000001522, 00000000005, '31.441565', '73.0887283', '2024-03-16 03:19:34'),
(00000001523, 00000000005, '31.4414883', '73.0886618', '2024-03-16 03:19:44'),
(00000001524, 00000000005, '31.4414429', '73.088676', '2024-03-16 03:19:54'),
(00000001525, 00000000005, '31.4414119', '73.0886279', '2024-03-16 03:20:05'),
(00000001526, 00000000005, '31.4413432', '73.0885883', '2024-03-16 03:20:14'),
(00000001527, 00000000005, '31.4415019', '73.0888218', '2024-03-16 03:20:24'),
(00000001528, 00000000005, '31.4414379', '73.0887496', '2024-03-16 03:20:35'),
(00000001529, 00000000005, '31.4414517', '73.088793', '2024-03-16 03:20:46'),
(00000001530, 00000000005, '31.4414329', '73.0886965', '2024-03-16 03:20:56'),
(00000001531, 00000000005, '31.4414315', '73.0886418', '2024-03-16 03:21:05'),
(00000001532, 00000000005, '31.4414289', '73.0886434', '2024-03-16 03:21:14'),
(00000001533, 00000000005, '31.441426', '73.0886354', '2024-03-16 03:21:24'),
(00000001534, 00000000005, '31.4414268', '73.0886365', '2024-03-16 03:21:39'),
(00000001535, 00000000005, '31.441427', '73.0886362', '2024-03-16 03:21:46'),
(00000001536, 00000000005, '31.441431', '73.0886425', '2024-03-16 03:21:55'),
(00000001537, 00000000005, '31.4414287', '73.0886434', '2024-03-16 03:22:04'),
(00000001538, 00000000005, '31.4414312', '73.0886428', '2024-03-16 03:22:14'),
(00000001539, 00000000005, '31.4414316', '73.0886432', '2024-03-16 03:22:24'),
(00000001540, 00000000005, '31.441431', '73.0886425', '2024-03-16 03:22:36'),
(00000001541, 00000000005, '31.4414289', '73.0886434', '2024-03-16 03:22:44'),
(00000001542, 00000000005, '31.4414311', '73.0886425', '2024-03-16 03:22:54'),
(00000001543, 00000000005, '31.4414271', '73.0886348', '2024-03-16 03:23:09'),
(00000001544, 00000000005, '31.4414312', '73.0886428', '2024-03-16 03:23:14'),
(00000001545, 00000000005, '31.4414271', '73.0886348', '2024-03-16 03:23:29'),
(00000001546, 00000000005, '31.4414312', '73.0886427', '2024-03-16 03:23:34'),
(00000001547, 00000000005, '31.4414288', '73.0886434', '2024-03-16 03:23:46'),
(00000001548, 00000000005, '31.4414289', '73.0886434', '2024-03-16 03:23:54'),
(00000001549, 00000000005, '31.4414289', '73.0886434', '2024-03-16 03:24:04'),
(00000001550, 00000000005, '31.4414311', '73.0886426', '2024-03-16 03:24:14'),
(00000001551, 00000000005, '31.4414288', '73.0886434', '2024-03-16 03:24:24'),
(00000001552, 00000000005, '31.4414289', '73.0886434', '2024-03-16 03:24:34'),
(00000001553, 00000000005, '31.4414288', '73.0886434', '2024-03-16 03:24:45'),
(00000001554, 00000000005, '31.4414289', '73.0886434', '2024-03-16 03:24:54'),
(00000001555, 00000000005, '31.4414288', '73.0886434', '2024-03-16 03:25:09'),
(00000001556, 00000000005, '31.4414266', '73.0886364', '2024-03-16 03:25:14'),
(00000001557, 00000000005, '31.4414288', '73.0886433', '2024-03-16 03:25:27'),
(00000001558, 00000000005, '31.441429', '73.0886432', '2024-03-16 03:25:44'),
(00000001559, 00000000005, '31.4414264', '73.0886365', '2024-03-16 03:25:46'),
(00000001560, 00000000005, '31.441426', '73.088639', '2024-03-16 03:25:54'),
(00000001561, 00000000005, '31.4414314', '73.0886428', '2024-03-16 03:26:05'),
(00000001562, 00000000005, '31.4414262', '73.0886405', '2024-03-16 03:26:14'),
(00000001563, 00000000005, '31.4414304', '73.0886428', '2024-03-16 03:26:25'),
(00000001564, 00000000005, '31.4414273', '73.088642', '2024-03-16 03:26:34'),
(00000001565, 00000000005, '31.4414262', '73.0886413', '2024-03-16 03:26:44'),
(00000001566, 00000000005, '31.4414306', '73.0886427', '2024-03-16 03:26:54'),
(00000001567, 00000000005, '31.4414307', '73.0886425', '2024-03-16 03:27:04'),
(00000001568, 00000000005, '31.4414271', '73.088642', '2024-03-16 03:27:14'),
(00000001569, 00000000005, '31.4414303', '73.088643', '2024-03-16 03:27:24'),
(00000001570, 00000000005, '31.441425', '73.0886419', '2024-03-16 03:27:34'),
(00000001571, 00000000005, '31.441429', '73.0886429', '2024-03-16 03:27:44'),
(00000001572, 00000000005, '31.4414258', '73.0886392', '2024-03-16 03:27:54'),
(00000001573, 00000000001, '31.441433', '73.0886445', '2024-03-17 04:51:14'),
(00000001574, 00000000001, '31.4413685', '73.0890536', '2024-03-17 04:51:21'),
(00000001575, 00000000001, '31.4414591', '73.0885428', '2024-03-17 04:51:35'),
(00000001576, 00000000001, '31.4414262', '73.0886391', '2024-03-17 04:51:42'),
(00000001577, 00000000001, '31.4414286', '73.0886442', '2024-03-17 04:51:51'),
(00000001578, 00000000001, '31.4414289', '73.0886434', '2024-03-17 04:52:03'),
(00000001579, 00000000001, '31.4413485', '73.0888677', '2024-03-17 04:52:11'),
(00000001580, 00000000001, '31.4413984', '73.0888788', '2024-03-17 04:52:25'),
(00000001581, 00000000001, '31.4414337', '73.0887022', '2024-03-17 04:52:31'),
(00000001582, 00000000001, '31.4414298', '73.0886397', '2024-03-17 04:52:41'),
(00000001583, 00000000001, '31.4414296', '73.0886371', '2024-03-17 04:52:51'),
(00000001584, 00000000001, '31.4414294', '73.0886399', '2024-03-17 04:53:01'),
(00000001585, 00000000001, '31.4414337', '73.088645', '2024-03-17 04:53:12'),
(00000001586, 00000000001, '31.4414274', '73.0886446', '2024-03-17 04:53:21'),
(00000001587, 00000000001, '31.441429', '73.0886429', '2024-03-17 04:53:31'),
(00000001588, 00000000001, '31.4414264', '73.0886383', '2024-03-17 04:53:41'),
(00000001589, 00000000001, '31.4414333', '73.0886454', '2024-03-17 04:53:52'),
(00000001590, 00000000001, '31.4407031', '73.0880423', '2024-03-17 04:54:02'),
(00000001591, 00000000001, '31.4408676', '73.0884793', '2024-03-17 04:54:11'),
(00000001592, 00000000001, '31.4410242', '73.0888579', '2024-03-17 04:54:23'),
(00000001593, 00000000001, '31.4410483', '73.0890443', '2024-03-17 04:54:31'),
(00000001594, 00000000001, '31.4410755', '73.088926', '2024-03-17 04:54:41'),
(00000001595, 00000000001, '31.4411564', '73.0887821', '2024-03-17 04:54:51'),
(00000001596, 00000000001, '31.4412449', '73.0885909', '2024-03-17 04:55:02'),
(00000001597, 00000000001, '31.4413388', '73.0884208', '2024-03-17 04:55:11'),
(00000001598, 00000000001, '31.4412042', '73.0885395', '2024-03-17 04:55:21'),
(00000001599, 00000000001, '31.4410656', '73.0885447', '2024-03-17 04:55:31'),
(00000001600, 00000000001, '31.441274', '73.0885943', '2024-03-17 04:55:42'),
(00000001601, 00000000001, '31.4411482', '73.0885604', '2024-03-17 04:55:51'),
(00000001602, 00000000001, '31.4414228', '73.0886408', '2024-03-17 04:56:02'),
(00000001603, 00000000001, '31.4414313', '73.0886414', '2024-03-17 04:56:12'),
(00000001604, 00000000001, '31.4414479', '73.0885905', '2024-03-17 04:56:21'),
(00000001605, 00000000001, '31.4414285', '73.088642', '2024-03-17 04:56:33'),
(00000001606, 00000000001, '31.4413827', '73.0885857', '2024-03-17 04:56:42'),
(00000001607, 00000000001, '31.4413817', '73.0884764', '2024-03-17 04:56:54'),
(00000001608, 00000000001, '31.4414174', '73.0885428', '2024-03-17 04:57:01'),
(00000001609, 00000000001, '31.4414093', '73.0885127', '2024-03-17 04:57:12'),
(00000001610, 00000000001, '31.4413874', '73.0884949', '2024-03-17 04:57:22'),
(00000001611, 00000000001, '31.441471', '73.0885738', '2024-03-17 04:57:31'),
(00000001612, 00000000001, '31.4414672', '73.0886056', '2024-03-17 04:57:43'),
(00000001613, 00000000001, '31.4414561', '73.0886074', '2024-03-17 04:57:51'),
(00000001614, 00000000001, '31.4415761', '73.0886647', '2024-03-17 04:58:02'),
(00000001615, 00000000001, '31.4415148', '73.088695', '2024-03-17 04:58:11'),
(00000001616, 00000000001, '31.4414451', '73.0886455', '2024-03-17 04:58:21'),
(00000001617, 00000000001, '31.4416037', '73.0887454', '2024-03-17 04:58:31'),
(00000001618, 00000000001, '31.4414913', '73.0887454', '2024-03-17 04:58:42'),
(00000001619, 00000000001, '31.4413916', '73.0886889', '2024-03-17 04:58:51'),
(00000001620, 00000000001, '31.441416', '73.0887139', '2024-03-17 04:59:01'),
(00000001621, 00000000001, '31.4414136', '73.0886405', '2024-03-18 03:10:25'),
(00000001622, 00000000001, '31.4414136', '73.0886405', '2024-03-18 03:10:35'),
(00000001623, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:10:46'),
(00000001624, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:10:56'),
(00000001625, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:11:05'),
(00000001626, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:11:15'),
(00000001627, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:11:25'),
(00000001628, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:11:35'),
(00000001629, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:11:55'),
(00000001630, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:11:55'),
(00000001631, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:12:15'),
(00000001632, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:12:15'),
(00000001633, 00000000001, '31.4414255', '73.0886334', '2024-03-18 03:12:25'),
(00000001634, 00000000001, '31.3950208', '73.1086848', '2024-03-18 03:13:36'),
(00000001635, 00000000001, '31.3950208', '73.1086848', '2024-03-18 03:13:36'),
(00000001636, 00000000001, '31.3950208', '73.1086848', '2024-03-18 03:13:36'),
(00000001637, 00000000001, '31.3950208', '73.1086848', '2024-03-18 03:13:36'),
(00000001638, 00000000001, '31.3950208', '73.1086848', '2024-03-18 03:13:36'),
(00000001639, 00000000001, '31.3950208', '73.1086848', '2024-03-18 03:13:36'),
(00000001640, 00000000001, '31.3950208', '73.1086848', '2024-03-18 03:13:36'),
(00000001641, 00000000001, '31.4414145', '73.0886448', '2024-03-18 20:13:39'),
(00000001642, 00000000001, '31.4414145', '73.0886448', '2024-03-18 20:13:52'),
(00000001643, 00000000001, '31.4414145', '73.0886448', '2024-03-18 20:14:02'),
(00000001644, 00000000001, '31.4414148', '73.0886448', '2024-03-18 20:14:12'),
(00000001645, 00000000001, '31.441415', '73.0886445', '2024-03-18 20:14:19'),
(00000001646, 00000000001, '31.4414162', '73.0886433', '2024-03-18 20:14:29'),
(00000001647, 00000000001, '31.4414155', '73.0886428', '2024-03-18 20:14:40'),
(00000001648, 00000000001, '31.44142', '73.0886466', '2024-03-18 20:14:49'),
(00000001649, 00000000001, '31.441415', '73.0886445', '2024-03-18 20:15:03'),
(00000001650, 00000000001, '31.4414174', '73.0886438', '2024-03-18 20:15:09'),
(00000001651, 00000000001, '31.4414361', '73.0885837', '2024-03-18 20:15:19'),
(00000001652, 00000000001, '31.4414146', '73.0886453', '2024-03-18 20:15:29'),
(00000001653, 00000000001, '31.4414368', '73.088584', '2024-03-18 20:15:39'),
(00000001654, 00000000001, '31.4414176', '73.0886431', '2024-03-18 20:15:50'),
(00000001655, 00000000001, '31.4414172', '73.0886437', '2024-03-18 20:16:00'),
(00000001656, 00000000001, '31.4414175', '73.0886436', '2024-03-18 20:16:09'),
(00000001657, 00000000001, '31.4414155', '73.0886429', '2024-03-18 20:16:20'),
(00000001658, 00000000001, '31.4414149', '73.0886438', '2024-03-18 20:16:29'),
(00000001659, 00000000001, '31.4414147', '73.0886448', '2024-03-18 20:16:39'),
(00000001660, 00000000001, '31.4414179', '73.0886437', '2024-03-18 20:16:49'),
(00000001661, 00000000001, '31.4414177', '73.0886435', '2024-03-18 20:16:59'),
(00000001662, 00000000001, '31.4414148', '73.0886447', '2024-03-18 20:17:09'),
(00000001663, 00000000001, '31.4414173', '73.0886431', '2024-03-18 20:17:20'),
(00000001664, 00000000001, '31.441415', '73.088644', '2024-03-18 20:17:30'),
(00000001665, 00000000001, '31.4414151', '73.0886437', '2024-03-18 20:17:39'),
(00000001666, 00000000001, '31.4414158', '73.0886412', '2024-03-18 20:17:49'),
(00000001667, 00000000001, '31.4414151', '73.0886441', '2024-03-18 20:18:00'),
(00000001668, 00000000001, '31.4414362', '73.0885838', '2024-03-18 20:18:15'),
(00000001669, 00000000001, '31.4414157', '73.0886417', '2024-03-18 20:18:22'),
(00000001670, 00000000001, '31.441415', '73.0886446', '2024-03-18 20:18:29'),
(00000001671, 00000000001, '31.4414157', '73.0886419', '2024-03-18 20:18:44'),
(00000001672, 00000000001, '31.4414168', '73.0886436', '2024-03-18 20:18:55'),
(00000001673, 00000000001, '31.4414169', '73.0886432', '2024-03-18 20:19:07'),
(00000001674, 00000000001, '31.4414159', '73.0886422', '2024-03-18 20:19:10'),
(00000001675, 00000000001, '31.4414157', '73.0886427', '2024-03-18 20:19:21'),
(00000001676, 00000000001, '31.4414169', '73.0886428', '2024-03-18 20:19:33'),
(00000001677, 00000000001, '31.441415', '73.0886441', '2024-03-18 20:19:42'),
(00000001678, 00000000001, '31.4414168', '73.0886437', '2024-03-18 20:19:49'),
(00000001679, 00000000001, '31.441415', '73.0886445', '2024-03-18 20:19:59'),
(00000001680, 00000000001, '31.441415', '73.0886437', '2024-03-18 20:20:09'),
(00000001681, 00000000001, '31.4414151', '73.0886431', '2024-03-18 20:20:29'),
(00000001682, 00000000001, '31.441415', '73.0886441', '2024-03-18 20:20:29'),
(00000001683, 00000000001, '31.4414151', '73.0886437', '2024-03-18 20:20:39'),
(00000001684, 00000000001, '31.4414151', '73.0886437', '2024-03-18 20:20:49'),
(00000001685, 00000000001, '31.441415', '73.0886444', '2024-03-18 20:21:00'),
(00000001686, 00000000001, '31.4414177', '73.0886436', '2024-03-18 20:21:09'),
(00000001687, 00000000001, '31.441415', '73.0886437', '2024-03-18 20:21:19'),
(00000001688, 00000000001, '31.441415', '73.0886445', '2024-03-18 20:21:29'),
(00000001689, 00000000001, '31.4414168', '73.0886418', '2024-03-18 20:21:40'),
(00000001690, 00000000001, '31.4414156', '73.0886427', '2024-03-18 20:21:49'),
(00000001691, 00000000001, '31.4414166', '73.0886437', '2024-03-18 20:22:01'),
(00000001692, 00000000001, '31.4414216', '73.0886473', '2024-03-18 20:22:09'),
(00000001693, 00000000001, '31.4414149', '73.0886502', '2024-03-18 20:22:20'),
(00000001694, 00000000001, '31.441415', '73.0886439', '2024-03-18 20:22:29'),
(00000001695, 00000000001, '31.4416037', '73.0887471', '2024-03-18 20:22:39'),
(00000001696, 00000000001, '31.4414128', '73.0886435', '2024-03-18 20:22:49'),
(00000001697, 00000000001, '31.441415', '73.0886438', '2024-03-18 20:22:59'),
(00000001698, 00000000001, '31.441415', '73.0886443', '2024-03-18 20:23:09'),
(00000001699, 00000000001, '31.441415', '73.0886445', '2024-03-18 20:23:19'),
(00000001700, 00000000001, '31.441415', '73.0886445', '2024-03-18 20:23:29'),
(00000001701, 00000000001, '31.4414173', '73.0886434', '2024-03-18 20:23:39'),
(00000001702, 00000000001, '31.4414152', '73.0886436', '2024-03-18 20:23:49'),
(00000001703, 00000000001, '31.4414149', '73.0886437', '2024-03-18 20:24:08'),
(00000001704, 00000000001, '31.4414147', '73.0886448', '2024-03-18 20:24:11'),
(00000001705, 00000000001, '31.4414102', '73.0886413', '2024-03-18 20:24:20'),
(00000001706, 00000000001, '31.441415', '73.0886437', '2024-03-18 20:24:29'),
(00000001707, 00000000001, '31.44141', '73.0886414', '2024-03-18 20:24:47'),
(00000001708, 00000000001, '31.441415', '73.0886436', '2024-03-18 20:25:20'),
(00000001709, 00000000001, '31.441415', '73.0886441', '2024-03-18 20:25:21'),
(00000001710, 00000000001, '31.4414169', '73.0886508', '2024-03-18 20:25:23'),
(00000001711, 00000000001, '31.4414175', '73.088646', '2024-03-18 20:25:28'),
(00000001712, 00000000001, '31.4414141', '73.0886432', '2024-03-18 20:25:31'),
(00000001713, 00000000001, '31.441421', '73.0886464', '2024-03-18 20:25:42'),
(00000001714, 00000000001, '31.4414213', '73.0886452', '2024-03-18 20:25:50'),
(00000001715, 00000000001, '31.4414189', '73.0886561', '2024-03-18 20:26:02'),
(00000001716, 00000000001, '31.4415913', '73.0887329', '2024-03-18 20:26:10'),
(00000001717, 00000000001, '31.4409907', '73.0880687', '2024-03-18 20:26:19'),
(00000001718, 00000000001, '31.4410644', '73.0880856', '2024-03-18 20:26:29'),
(00000001719, 00000000001, '31.4410867', '73.0880733', '2024-03-18 20:26:40'),
(00000001720, 00000000001, '31.4411379', '73.0880215', '2024-03-18 20:26:49'),
(00000001721, 00000000001, '31.4411383', '73.0880217', '2024-03-18 20:26:59'),
(00000001722, 00000000001, '31.4411359', '73.0880631', '2024-03-18 20:27:09'),
(00000001723, 00000000001, '31.4414122', '73.0886403', '2024-03-18 20:27:25'),
(00000001724, 00000000001, '31.4414179', '73.0886507', '2024-03-18 20:27:31'),
(00000001725, 00000000001, '31.4414181', '73.0886464', '2024-03-18 20:27:45'),
(00000001726, 00000000001, '31.4414105', '73.0886449', '2024-03-18 20:28:03'),
(00000001727, 00000000001, '31.4415792', '73.0887072', '2024-03-18 20:28:03'),
(00000001728, 00000000001, '31.4414181', '73.0886465', '2024-03-18 20:28:10'),
(00000001729, 00000000001, '31.4414104', '73.0886411', '2024-03-18 20:28:21'),
(00000001730, 00000000001, '31.4414158', '73.0886425', '2024-03-18 20:28:29'),
(00000001731, 00000000001, '31.4414135', '73.0886468', '2024-03-18 20:28:47'),
(00000001732, 00000000001, '31.4774536', '74.3255602', '2024-03-19 22:04:45'),
(00000001733, 00000000001, '31.4774202', '74.3255995', '2024-03-19 22:04:55'),
(00000001734, 00000000001, '31.4774394', '74.3255697', '2024-03-19 22:05:06'),
(00000001735, 00000000001, '31.4774394', '74.3255697', '2024-03-19 22:05:15'),
(00000001736, 00000000001, '31.4774394', '74.3255697', '2024-03-19 22:05:25'),
(00000001737, 00000000001, '31.4774394', '74.3255697', '2024-03-19 22:05:35'),
(00000001738, 00000000001, '31.4774155', '74.3256327', '2024-03-19 22:05:45'),
(00000001739, 00000000001, '31.477415', '74.3256332', '2024-03-19 22:05:55'),
(00000001740, 00000000001, '31.477415', '74.3256332', '2024-03-19 22:06:05'),
(00000001741, 00000000001, '31.477415', '74.3256332', '2024-03-19 22:06:15'),
(00000001742, 00000000001, '31.477415', '74.3256332', '2024-03-19 22:06:25'),
(00000001743, 00000000001, '31.477415', '74.3256332', '2024-03-19 22:06:35'),
(00000001744, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:06:46'),
(00000001745, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:06:55'),
(00000001746, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:07:05'),
(00000001747, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:07:15'),
(00000001748, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:07:25'),
(00000001749, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:07:35'),
(00000001750, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:07:45'),
(00000001751, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:07:55'),
(00000001752, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:08:05'),
(00000001753, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:08:15'),
(00000001754, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:08:25'),
(00000001755, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:08:36'),
(00000001756, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:08:45'),
(00000001757, 00000000001, '31.4773856', '74.325681', '2024-03-19 22:08:49'),
(00000001758, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001759, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001760, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001761, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001762, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001763, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001764, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001765, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001766, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001767, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001768, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001769, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001770, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:44'),
(00000001771, 00000000001, '31.4773788', '74.3256489', '2024-03-19 22:13:46'),
(00000001772, 00000000001, '31.4773124', '74.3256655', '2024-03-19 22:13:46'),
(00000001773, 00000000001, '31.4773124', '74.3256655', '2024-03-19 22:13:46'),
(00000001774, 00000000001, '31.4773124', '74.3256655', '2024-03-19 22:13:46'),
(00000001775, 00000000001, '31.4773124', '74.3256655', '2024-03-19 22:13:50'),
(00000001776, 00000000001, '31.4774283', '74.3254551', '2024-05-02 08:49:29'),
(00000001777, 00000000001, '31.477369', '74.3254813', '2024-05-02 08:49:38'),
(00000001778, 00000000001, '31.4772647', '74.3254753', '2024-05-02 08:49:48'),
(00000001779, 00000000001, '31.4773513', '74.3254188', '2024-05-02 08:49:58'),
(00000001780, 00000000001, '31.4772968', '74.3253919', '2024-05-02 08:50:08'),
(00000001781, 00000000001, '31.4772916', '74.3254096', '2024-05-02 08:50:18'),
(00000001782, 00000000001, '31.4773703', '74.3253909', '2024-05-02 08:50:28'),
(00000001783, 00000000001, '31.4774494', '74.3253529', '2024-05-02 08:50:38'),
(00000001784, 00000000001, '31.477379', '74.3253829', '2024-05-02 08:50:48'),
(00000001785, 00000000001, '31.4773717', '74.3253817', '2024-05-02 08:50:58'),
(00000001786, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001787, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001788, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001789, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001790, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001791, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001792, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001793, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001794, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001795, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001796, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001797, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001798, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001799, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001800, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001801, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001802, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001803, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001804, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001805, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001806, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001807, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001808, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001809, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001810, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001811, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001812, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001813, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001814, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001815, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001816, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001817, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001818, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001819, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001820, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001821, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001822, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001823, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001824, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001825, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001826, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001827, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001828, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001829, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001830, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001831, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001832, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001833, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001834, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001835, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001836, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001837, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001838, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001839, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001840, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001841, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001842, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001843, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001844, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001845, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001846, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001847, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001848, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001849, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001850, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001851, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001852, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001853, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001854, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001855, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001856, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001857, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001858, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001859, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001860, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001861, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001862, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001863, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001864, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001865, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001866, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001867, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001868, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001869, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001870, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001871, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001872, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001873, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:45'),
(00000001874, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:46'),
(00000001875, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:46'),
(00000001876, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:46'),
(00000001877, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:46'),
(00000001878, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:48'),
(00000001879, 00000000001, '31.4773037', '74.3254415', '2024-05-02 08:58:49'),
(00000001880, 00000000001, '31.4772933', '74.3254233', '2024-05-02 08:58:58'),
(00000001881, 00000000001, '31.4772933', '74.3254233', '2024-05-02 08:58:59'),
(00000001882, 00000000001, '31.4773798', '74.3254233', '2024-05-02 08:59:08'),
(00000001883, 00000000001, '31.4773798', '74.3254233', '2024-05-02 08:59:09'),
(00000001884, 00000000001, '31.4772907', '74.3254448', '2024-05-02 08:59:18'),
(00000001885, 00000000001, '31.4772907', '74.3254448', '2024-05-02 08:59:19'),
(00000001886, 00000000001, '31.4772779', '74.3254303', '2024-05-02 08:59:28'),
(00000001887, 00000000001, '31.4772779', '74.3254303', '2024-05-02 08:59:28'),
(00000001888, 00000000001, '31.4773127', '74.3253824', '2024-05-02 08:59:39'),
(00000001889, 00000000001, '31.4773127', '74.3253824', '2024-05-02 08:59:39'),
(00000001890, 00000000001, '31.4772999', '74.3253941', '2024-05-02 08:59:48'),
(00000001891, 00000000001, '31.4772999', '74.3253941', '2024-05-02 08:59:49'),
(00000001892, 00000000001, '31.4772973', '74.3253904', '2024-05-02 08:59:59'),
(00000001893, 00000000001, '31.4772973', '74.3253904', '2024-05-02 08:59:59'),
(00000001894, 00000000001, '31.4773811', '74.3253867', '2024-05-02 09:00:08'),
(00000001895, 00000000001, '31.4773811', '74.3253867', '2024-05-02 09:00:09'),
(00000001896, 00000000001, '31.4775744', '74.3253827', '2024-05-02 09:00:18'),
(00000001897, 00000000001, '31.4775744', '74.3253827', '2024-05-02 09:00:18'),
(00000001898, 00000000001, '31.4774837', '74.3253701', '2024-05-02 09:00:28'),
(00000001899, 00000000001, '31.4774837', '74.3253701', '2024-05-02 09:00:28'),
(00000001900, 00000000001, '31.4774023', '74.3253914', '2024-05-02 09:00:38'),
(00000001901, 00000000001, '31.4774023', '74.3253914', '2024-05-02 09:00:39'),
(00000001902, 00000000001, '31.4773188', '74.3254214', '2024-05-02 09:00:48'),
(00000001903, 00000000001, '31.4773188', '74.3254214', '2024-05-02 09:00:48'),
(00000001904, 00000000001, '31.4772558', '74.3254349', '2024-05-02 09:00:58'),
(00000001905, 00000000001, '31.4772558', '74.3254349', '2024-05-02 09:00:59'),
(00000001906, 00000000001, '31.4772236', '74.3254238', '2024-05-02 09:01:09'),
(00000001907, 00000000001, '31.4772236', '74.3254238', '2024-05-02 09:01:09'),
(00000001908, 00000000001, '31.4772118', '74.3254317', '2024-05-02 09:01:18'),
(00000001909, 00000000001, '31.4772118', '74.3254317', '2024-05-02 09:01:19'),
(00000001910, 00000000001, '31.477225', '74.32543', '2024-05-02 09:01:28'),
(00000001911, 00000000001, '31.477225', '74.32543', '2024-05-02 09:01:28'),
(00000001912, 00000000001, '31.477314', '74.3254169', '2024-05-02 09:01:38'),
(00000001913, 00000000001, '31.477314', '74.3254169', '2024-05-02 09:01:38'),
(00000001914, 00000000001, '31.4773084', '74.3254414', '2024-05-02 09:01:48'),
(00000001915, 00000000001, '31.4773084', '74.3254414', '2024-05-02 09:01:49'),
(00000001916, 00000000001, '31.4773317', '74.3254317', '2024-05-02 09:01:59'),
(00000001917, 00000000001, '31.4773317', '74.3254317', '2024-05-02 09:02:00'),
(00000001918, 00000000001, '31.4773367', '74.3254218', '2024-05-02 09:02:08'),
(00000001919, 00000000001, '31.4773367', '74.3254218', '2024-05-02 09:02:08'),
(00000001920, 00000000001, '31.4772552', '74.3254649', '2024-05-02 09:02:18'),
(00000001921, 00000000001, '31.4772552', '74.3254649', '2024-05-02 09:02:19'),
(00000001922, 00000000001, '31.4772815', '74.32547', '2024-05-02 09:02:28'),
(00000001923, 00000000001, '31.4772815', '74.32547', '2024-05-02 09:02:29'),
(00000001924, 00000000001, '31.4773567', '74.32543', '2024-05-02 09:02:38'),
(00000001925, 00000000001, '31.4773567', '74.32543', '2024-05-02 09:02:39'),
(00000001926, 00000000001, '31.477335', '74.3254317', '2024-05-02 09:02:48'),
(00000001927, 00000000001, '31.477335', '74.3254317', '2024-05-02 09:02:48'),
(00000001928, 00000000001, '31.4773369', '74.3254213', '2024-05-02 09:02:59'),
(00000001929, 00000000001, '31.4773369', '74.3254213', '2024-05-02 09:03:00'),
(00000001930, 00000000001, '31.4773387', '74.3254321', '2024-05-02 09:03:08'),
(00000001931, 00000000001, '31.4773387', '74.3254321', '2024-05-02 09:03:08'),
(00000001932, 00000000001, '31.47736', '74.32542', '2024-05-02 09:03:19'),
(00000001933, 00000000001, '31.47736', '74.32542', '2024-05-02 09:03:19'),
(00000001934, 00000000001, '31.4773877', '74.3254069', '2024-05-02 09:03:29'),
(00000001935, 00000000001, '31.4773877', '74.3254069', '2024-05-02 09:03:29'),
(00000001936, 00000000001, '31.4773603', '74.3254248', '2024-05-02 09:03:38'),
(00000001937, 00000000001, '31.4773603', '74.3254248', '2024-05-02 09:03:39'),
(00000001938, 00000000001, '31.4773429', '74.325445', '2024-05-02 09:03:48'),
(00000001939, 00000000001, '31.4773429', '74.325445', '2024-05-02 09:03:49'),
(00000001940, 00000000001, '31.4773317', '74.3254417', '2024-05-02 09:03:59'),
(00000001941, 00000000001, '31.4773317', '74.3254417', '2024-05-02 09:03:59'),
(00000001942, 00000000001, '31.4773383', '74.3254146', '2024-05-02 09:04:08'),
(00000001943, 00000000001, '31.4773383', '74.3254146', '2024-05-02 09:04:08'),
(00000001944, 00000000001, '31.4773383', '74.325415', '2024-05-02 09:04:18'),
(00000001945, 00000000001, '31.4773383', '74.325415', '2024-05-02 09:04:19'),
(00000001946, 00000000001, '31.4773599', '74.3254299', '2024-05-02 09:04:28'),
(00000001947, 00000000001, '31.4773599', '74.3254299', '2024-05-02 09:04:28'),
(00000001948, 00000000001, '31.47736', '74.32543', '2024-05-02 09:04:39'),
(00000001949, 00000000001, '31.47736', '74.32543', '2024-05-02 09:04:39'),
(00000001950, 00000000001, '31.4772667', '74.3254633', '2024-05-02 09:04:48');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(00000001951, 00000000001, '31.4772667', '74.3254633', '2024-05-02 09:04:49'),
(00000001952, 00000000001, '31.4772667', '74.3254633', '2024-05-02 09:04:58'),
(00000001953, 00000000001, '31.4772667', '74.3254633', '2024-05-02 09:04:58'),
(00000001954, 00000000001, '31.4772451', '74.3254355', '2024-05-02 09:05:08'),
(00000001955, 00000000001, '31.4772451', '74.3254355', '2024-05-02 09:05:09'),
(00000001956, 00000000001, '31.4772928', '74.325423', '2024-05-02 09:05:18'),
(00000001957, 00000000001, '31.4772928', '74.325423', '2024-05-02 09:05:19'),
(00000001958, 00000000001, '31.4773235', '74.3254333', '2024-05-02 09:05:28'),
(00000001959, 00000000001, '31.4773235', '74.3254333', '2024-05-02 09:05:29'),
(00000001960, 00000000001, '31.4773233', '74.3254333', '2024-05-02 09:05:38'),
(00000001961, 00000000001, '31.4773233', '74.3254333', '2024-05-02 09:05:39'),
(00000001962, 00000000001, '31.4773233', '74.3254333', '2024-05-02 09:05:48'),
(00000001963, 00000000001, '31.4773233', '74.3254333', '2024-05-02 09:05:48'),
(00000001964, 00000000001, '31.4773233', '74.3254333', '2024-05-02 09:05:58'),
(00000001965, 00000000001, '31.4773233', '74.3254333', '2024-05-02 09:05:58'),
(00000001966, 00000000001, '31.4772465', '74.3254467', '2024-05-02 09:06:08'),
(00000001967, 00000000001, '31.4772465', '74.3254467', '2024-05-02 09:06:08'),
(00000001968, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:18'),
(00000001969, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:18'),
(00000001970, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:28'),
(00000001971, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:29'),
(00000001972, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:38'),
(00000001973, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:39'),
(00000001974, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:48'),
(00000001975, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:49'),
(00000001976, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:06:58'),
(00000001977, 00000000001, '31.4772467', '74.3254467', '2024-05-02 09:07:00'),
(00000001978, 00000000001, '31.4773283', '74.3254099', '2024-05-02 09:07:09'),
(00000001979, 00000000001, '31.4773283', '74.3254099', '2024-05-02 09:07:10'),
(00000001980, 00000000001, '31.4773351', '74.325418', '2024-05-02 09:07:20'),
(00000001981, 00000000001, '31.4773351', '74.325418', '2024-05-02 09:07:20'),
(00000001982, 00000000001, '31.4773139', '74.3254326', '2024-05-02 09:07:29'),
(00000001983, 00000000001, '31.4773139', '74.3254326', '2024-05-02 09:07:29'),
(00000001984, 00000000001, '31.47731', '74.3254283', '2024-05-02 09:07:39'),
(00000001985, 00000000001, '31.47731', '74.3254283', '2024-05-02 09:07:39'),
(00000001986, 00000000001, '31.4772554', '74.3254498', '2024-05-02 09:07:49'),
(00000001987, 00000000001, '31.4772554', '74.3254498', '2024-05-02 09:07:49'),
(00000001988, 00000000001, '31.477187', '74.3254502', '2024-05-02 09:07:59'),
(00000001989, 00000000001, '31.477187', '74.3254502', '2024-05-02 09:07:59'),
(00000001990, 00000000001, '31.4771916', '74.3254518', '2024-05-02 09:08:11'),
(00000001991, 00000000001, '31.4771916', '74.3254518', '2024-05-02 09:08:11'),
(00000001992, 00000000001, '31.4771917', '74.3254517', '2024-05-02 09:08:18'),
(00000001993, 00000000001, '31.4771917', '74.3254517', '2024-05-02 09:08:19'),
(00000001994, 00000000001, '31.4772718', '74.3254037', '2024-05-02 09:08:28'),
(00000001995, 00000000001, '31.4772734', '74.3254027', '2024-05-02 09:08:29'),
(00000001996, 00000000001, '31.4772667', '74.3253967', '2024-05-02 09:08:38'),
(00000001997, 00000000001, '31.4772667', '74.3253967', '2024-05-02 09:08:39'),
(00000001998, 00000000001, '31.4772667', '74.3253967', '2024-05-02 09:08:48'),
(00000001999, 00000000001, '31.4772667', '74.3253967', '2024-05-02 09:08:49'),
(00000002000, 00000000001, '31.47727', '74.3254032', '2024-05-02 09:08:58'),
(00000002001, 00000000001, '31.47727', '74.3254033', '2024-05-02 09:08:59'),
(00000002002, 00000000001, '31.4772586', '74.325428', '2024-05-02 09:09:10'),
(00000002003, 00000000001, '31.4772584', '74.3254282', '2024-05-02 09:09:10'),
(00000002004, 00000000001, '31.4772916', '74.3254664', '2024-05-02 09:09:18'),
(00000002005, 00000000001, '31.4772916', '74.3254664', '2024-05-02 09:09:18'),
(00000002006, 00000000001, '31.4772519', '74.3255046', '2024-05-02 09:09:28'),
(00000002007, 00000000001, '31.4772519', '74.3255046', '2024-05-02 09:09:28'),
(00000002008, 00000000001, '31.4772367', '74.3255033', '2024-05-02 09:09:38'),
(00000002009, 00000000001, '31.4772367', '74.3255033', '2024-05-02 09:09:38'),
(00000002010, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:09:48'),
(00000002011, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:09:48'),
(00000002012, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:09:58'),
(00000002013, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:09:59'),
(00000002014, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:08'),
(00000002015, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:08'),
(00000002016, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:18'),
(00000002017, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:18'),
(00000002018, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:28'),
(00000002019, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:29'),
(00000002020, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:38'),
(00000002021, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:38'),
(00000002022, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:48'),
(00000002023, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:48'),
(00000002024, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:58'),
(00000002025, 00000000001, '31.4772733', '74.3254917', '2024-05-02 09:10:58'),
(00000002026, 00000000001, '31.4771728', '74.3254917', '2024-05-02 09:11:08'),
(00000002027, 00000000001, '31.4771728', '74.3254917', '2024-05-02 09:11:08'),
(00000002028, 00000000001, '31.4771667', '74.3254933', '2024-05-02 09:11:18'),
(00000002029, 00000000001, '31.4771667', '74.3254933', '2024-05-02 09:11:19'),
(00000002030, 00000000001, '31.4771667', '74.3254933', '2024-05-02 09:11:28'),
(00000002031, 00000000001, '31.4771667', '74.3254933', '2024-05-02 09:11:28'),
(00000002032, 00000000001, '31.4771667', '74.3254933', '2024-05-02 09:11:38'),
(00000002033, 00000000001, '31.4771667', '74.3254933', '2024-05-02 09:11:38'),
(00000002034, 00000000001, '31.4771667', '74.3254933', '2024-05-02 09:11:48'),
(00000002035, 00000000001, '31.4771667', '74.3254933', '2024-05-02 09:11:49'),
(00000002036, 00000000001, '31.4772533', '74.3254967', '2024-05-02 09:11:58'),
(00000002037, 00000000001, '31.4772533', '74.3254967', '2024-05-02 09:11:58'),
(00000002038, 00000000001, '31.4772895', '74.3254967', '2024-05-02 09:12:08'),
(00000002039, 00000000001, '31.4772895', '74.3254967', '2024-05-02 09:12:08'),
(00000002040, 00000000001, '31.4772802', '74.3254883', '2024-05-02 09:12:18'),
(00000002041, 00000000001, '31.4772802', '74.3254883', '2024-05-02 09:12:19'),
(00000002042, 00000000001, '31.47728', '74.3254783', '2024-05-02 09:12:28'),
(00000002043, 00000000001, '31.47728', '74.3254783', '2024-05-02 09:12:28'),
(00000002044, 00000000001, '31.47728', '74.3254783', '2024-05-02 09:12:38'),
(00000002045, 00000000001, '31.47728', '74.3254783', '2024-05-02 09:12:39'),
(00000002046, 00000000001, '31.4773516', '74.3254356', '2024-05-02 09:12:48'),
(00000002047, 00000000001, '31.4773516', '74.3254356', '2024-05-02 09:12:48'),
(00000002048, 00000000001, '31.4773333', '74.325445', '2024-05-02 09:12:58'),
(00000002049, 00000000001, '31.4773333', '74.325445', '2024-05-02 09:12:59'),
(00000002050, 00000000001, '31.4773333', '74.325445', '2024-05-02 09:13:08'),
(00000002051, 00000000001, '31.4773333', '74.325445', '2024-05-02 09:13:08'),
(00000002052, 00000000001, '31.4414918', '73.0886762', '2024-05-03 06:25:34'),
(00000002053, 00000000001, '31.4415428', '73.0886528', '2024-05-03 06:25:54'),
(00000002054, 00000000001, '31.4413334', '73.0884822', '2024-05-03 06:26:04'),
(00000002055, 00000000001, '31.441413', '73.0885651', '2024-05-03 06:26:17'),
(00000002056, 00000000001, '31.4414465', '73.0885894', '2024-05-03 06:26:24'),
(00000002057, 00000000001, '31.4414845', '73.0886237', '2024-05-03 06:26:34'),
(00000002058, 00000000001, '31.4414761', '73.0886109', '2024-05-03 06:26:44'),
(00000002059, 00000000001, '31.4414852', '73.0886222', '2024-05-03 06:26:54'),
(00000002060, 00000000001, '31.4414815', '73.0886157', '2024-05-03 06:27:04'),
(00000002061, 00000000001, '31.4414866', '73.0886278', '2024-05-03 06:27:14'),
(00000002062, 00000000001, '31.4414592', '73.0885995', '2024-05-03 06:27:24'),
(00000002063, 00000000001, '31.4414946', '73.088645', '2024-05-03 06:27:34'),
(00000002064, 00000000001, '31.441487', '73.0886285', '2024-05-03 06:27:44'),
(00000002065, 00000000001, '31.4414862', '73.0886252', '2024-05-03 06:27:54'),
(00000002066, 00000000001, '31.4415008', '73.0886373', '2024-05-03 06:28:04'),
(00000002067, 00000000001, '31.4414915', '73.0886316', '2024-05-03 06:28:14'),
(00000002068, 00000000001, '31.4414452', '73.0885851', '2024-05-03 06:28:24'),
(00000002069, 00000000001, '31.4414883', '73.0886276', '2024-05-03 06:28:34'),
(00000002070, 00000000001, '31.4414686', '73.0886028', '2024-05-03 06:28:48'),
(00000002071, 00000000001, '31.4414821', '73.0886205', '2024-05-03 06:28:54'),
(00000002072, 00000000001, '31.4414485', '73.0885862', '2024-05-03 06:29:04'),
(00000002073, 00000000001, '31.4415009', '73.0886408', '2024-05-03 06:29:33'),
(00000002074, 00000000001, '31.4415009', '73.0886408', '2024-05-03 06:29:33'),
(00000002075, 00000000001, '31.4415009', '73.0886408', '2024-05-03 06:29:34'),
(00000002076, 00000000001, '31.4414602', '73.0885979', '2024-05-03 06:29:44'),
(00000002077, 00000000001, '31.4414628', '73.0886008', '2024-05-03 06:29:58'),
(00000002078, 00000000001, '31.4414924', '73.0886305', '2024-05-03 06:30:04'),
(00000002079, 00000000001, '31.4415213', '73.0886568', '2024-05-03 06:30:14'),
(00000002080, 00000000001, '31.4414457', '73.0885834', '2024-05-03 06:30:24'),
(00000002081, 00000000001, '31.4414532', '73.0885911', '2024-05-03 06:30:34'),
(00000002082, 00000000001, '31.4414641', '73.0886059', '2024-05-03 06:30:44'),
(00000002083, 00000000001, '31.4414522', '73.088587', '2024-05-03 06:30:54'),
(00000002084, 00000000001, '31.4415048', '73.0886421', '2024-05-03 06:31:04'),
(00000002085, 00000000001, '31.4414755', '73.0886124', '2024-05-03 06:31:14'),
(00000002086, 00000000001, '31.4414923', '73.0886296', '2024-05-03 06:31:24'),
(00000002087, 00000000001, '31.4414556', '73.0885982', '2024-05-03 06:31:34'),
(00000002088, 00000000001, '31.4414486', '73.0885873', '2024-05-03 06:31:44'),
(00000002089, 00000000001, '31.4414617', '73.0886', '2024-05-03 06:31:54'),
(00000002090, 00000000001, '31.4415029', '73.0886386', '2024-05-03 06:32:04'),
(00000002091, 00000000001, '31.4414441', '73.0885844', '2024-05-03 06:32:14'),
(00000002092, 00000000001, '31.4414972', '73.0886343', '2024-05-03 06:32:24'),
(00000002093, 00000000001, '31.4414743', '73.0886417', '2024-05-03 06:32:34'),
(00000002094, 00000000001, '31.441456', '73.0885927', '2024-05-03 06:32:44'),
(00000002095, 00000000001, '31.4414724', '73.0886084', '2024-05-03 06:32:54'),
(00000002096, 00000000001, '31.4414435', '73.0885864', '2024-05-03 06:33:04'),
(00000002097, 00000000001, '31.4414472', '73.0885856', '2024-05-03 06:33:14'),
(00000002098, 00000000001, '31.4414493', '73.0885877', '2024-05-03 06:33:24'),
(00000002099, 00000000001, '31.4414429', '73.0885806', '2024-05-03 06:33:34'),
(00000002100, 00000000001, '31.4414584', '73.0886009', '2024-05-03 06:33:44'),
(00000002101, 00000000001, '31.4414742', '73.0886128', '2024-05-03 06:33:54'),
(00000002102, 00000000001, '31.441496', '73.088634', '2024-05-03 06:34:04'),
(00000002103, 00000000001, '31.4414821', '73.0886196', '2024-05-03 06:34:14'),
(00000002104, 00000000001, '31.4414776', '73.0886178', '2024-05-03 06:34:24'),
(00000002105, 00000000001, '31.4414852', '73.0886272', '2024-05-03 06:34:34'),
(00000002106, 00000000001, '31.4414688', '73.0886098', '2024-05-03 06:34:44'),
(00000002107, 00000000001, '31.4414623', '73.0885997', '2024-05-03 06:34:54'),
(00000002108, 00000000001, '31.441493', '73.0886314', '2024-05-03 06:35:04'),
(00000002109, 00000000001, '31.4415848', '73.0886882', '2024-05-03 06:35:14'),
(00000002110, 00000000001, '31.4415363', '73.0886701', '2024-05-03 06:36:48'),
(00000002111, 00000000001, '31.4415363', '73.0886701', '2024-05-03 06:36:49'),
(00000002112, 00000000001, '31.4415363', '73.0886701', '2024-05-03 06:36:50'),
(00000002113, 00000000001, '31.441486', '73.0886286', '2024-05-03 06:36:58'),
(00000002114, 00000000001, '31.441486', '73.0886286', '2024-05-03 06:36:58'),
(00000002115, 00000000001, '31.441486', '73.0886286', '2024-05-03 06:36:59'),
(00000002116, 00000000001, '31.441486', '73.0886286', '2024-05-03 06:37:00'),
(00000002117, 00000000001, '31.4415018', '73.0886387', '2024-05-03 06:37:08'),
(00000002118, 00000000001, '31.4415018', '73.0886387', '2024-05-03 06:37:08'),
(00000002119, 00000000001, '31.4415018', '73.0886387', '2024-05-03 06:37:09'),
(00000002120, 00000000001, '31.4415018', '73.0886387', '2024-05-03 06:37:10'),
(00000002121, 00000000001, '31.4414993', '73.0886413', '2024-05-03 06:37:18'),
(00000002122, 00000000001, '31.4414993', '73.0886413', '2024-05-03 06:37:18'),
(00000002123, 00000000001, '31.4414993', '73.0886413', '2024-05-03 06:37:21'),
(00000002124, 00000000001, '31.4414993', '73.0886413', '2024-05-03 06:37:22'),
(00000002125, 00000000001, '31.4415074', '73.0886449', '2024-05-03 06:37:28'),
(00000002126, 00000000001, '31.4415074', '73.0886449', '2024-05-03 06:37:28'),
(00000002127, 00000000001, '31.4415074', '73.0886449', '2024-05-03 06:37:29'),
(00000002128, 00000000001, '31.4415074', '73.0886449', '2024-05-03 06:37:30'),
(00000002129, 00000000001, '31.4415039', '73.0886467', '2024-05-03 06:37:38'),
(00000002130, 00000000001, '31.4415039', '73.0886467', '2024-05-03 06:37:38'),
(00000002131, 00000000001, '31.4415039', '73.0886467', '2024-05-03 06:37:39'),
(00000002132, 00000000001, '31.4415039', '73.0886467', '2024-05-03 06:37:40'),
(00000002133, 00000000001, '31.4415095', '73.0887095', '2024-05-03 06:37:52'),
(00000002134, 00000000001, '31.4415095', '73.0887095', '2024-05-03 06:37:52'),
(00000002135, 00000000001, '31.4415095', '73.0887095', '2024-05-03 06:37:52'),
(00000002136, 00000000001, '31.4415095', '73.0887095', '2024-05-03 06:37:52'),
(00000002137, 00000000001, '31.4414488', '73.08859', '2024-05-03 06:37:58'),
(00000002138, 00000000001, '31.4414488', '73.08859', '2024-05-03 06:37:59'),
(00000002139, 00000000001, '31.4414488', '73.08859', '2024-05-03 06:37:59'),
(00000002140, 00000000001, '31.4414488', '73.08859', '2024-05-03 06:38:00'),
(00000002141, 00000000001, '31.4414494', '73.0885893', '2024-05-03 06:38:08'),
(00000002142, 00000000001, '31.4414494', '73.0885893', '2024-05-03 06:38:09'),
(00000002143, 00000000001, '31.4414494', '73.0885893', '2024-05-03 06:38:10'),
(00000002144, 00000000001, '31.4414484', '73.0885851', '2024-05-03 06:38:16'),
(00000002145, 00000000001, '31.4414835', '73.0886228', '2024-05-03 06:38:18'),
(00000002146, 00000000001, '31.4414835', '73.0886228', '2024-05-03 06:38:19'),
(00000002147, 00000000001, '31.4414835', '73.0886228', '2024-05-03 06:38:20'),
(00000002148, 00000000001, '31.4416551', '73.0886266', '2024-05-03 06:38:26'),
(00000002149, 00000000001, '31.4416565', '73.0886267', '2024-05-03 06:38:28'),
(00000002150, 00000000001, '31.4416565', '73.0886267', '2024-05-03 06:38:29'),
(00000002151, 00000000001, '31.4416565', '73.0886267', '2024-05-03 06:38:30'),
(00000002152, 00000000001, '31.4414084', '73.0884635', '2024-05-03 06:38:36'),
(00000002153, 00000000001, '31.4414084', '73.0884635', '2024-05-03 06:38:38'),
(00000002154, 00000000001, '31.4414084', '73.0884635', '2024-05-03 06:38:39'),
(00000002155, 00000000001, '31.4414084', '73.0884635', '2024-05-03 06:38:40'),
(00000002156, 00000000001, '31.4414993', '73.0884044', '2024-05-03 06:38:46'),
(00000002157, 00000000001, '31.4414993', '73.0884044', '2024-05-03 06:38:48'),
(00000002158, 00000000001, '31.4414993', '73.0884044', '2024-05-03 06:38:49'),
(00000002159, 00000000001, '31.4414993', '73.0884044', '2024-05-03 06:38:50'),
(00000002160, 00000000001, '31.4415383', '73.0885336', '2024-05-03 06:38:56'),
(00000002161, 00000000001, '31.4415383', '73.0885336', '2024-05-03 06:38:58'),
(00000002162, 00000000001, '31.4415383', '73.0885336', '2024-05-03 06:38:59'),
(00000002163, 00000000001, '31.4415383', '73.0885336', '2024-05-03 06:39:00'),
(00000002164, 00000000001, '31.4415217', '73.0885048', '2024-05-03 06:39:06'),
(00000002165, 00000000001, '31.4415217', '73.0885048', '2024-05-03 06:39:08'),
(00000002166, 00000000001, '31.4415217', '73.0885048', '2024-05-03 06:39:09'),
(00000002167, 00000000001, '31.4415217', '73.0885048', '2024-05-03 06:39:10'),
(00000002168, 00000000001, '31.4415433', '73.0887298', '2024-05-03 06:39:16'),
(00000002169, 00000000001, '31.4415433', '73.0887298', '2024-05-03 06:39:18'),
(00000002170, 00000000001, '31.4415433', '73.0887298', '2024-05-03 06:39:19'),
(00000002171, 00000000001, '31.4415433', '73.0887298', '2024-05-03 06:39:20'),
(00000002172, 00000000001, '31.4415425', '73.0887629', '2024-05-03 06:39:26'),
(00000002173, 00000000001, '31.4415425', '73.0887629', '2024-05-03 06:39:28'),
(00000002174, 00000000001, '31.4415425', '73.0887629', '2024-05-03 06:39:29'),
(00000002175, 00000000001, '31.4415425', '73.0887629', '2024-05-03 06:39:30'),
(00000002176, 00000000001, '31.4415412', '73.0887299', '2024-05-03 06:39:36'),
(00000002177, 00000000001, '31.4415412', '73.0887299', '2024-05-03 06:39:38'),
(00000002178, 00000000001, '31.4415412', '73.0887299', '2024-05-03 06:39:39'),
(00000002179, 00000000001, '31.4415412', '73.0887299', '2024-05-03 06:39:40'),
(00000002180, 00000000001, '31.4415456', '73.0887779', '2024-05-03 06:39:46'),
(00000002181, 00000000001, '31.4415456', '73.0887779', '2024-05-03 06:39:48'),
(00000002182, 00000000001, '31.4415456', '73.0887779', '2024-05-03 06:39:49'),
(00000002183, 00000000001, '31.4415456', '73.0887779', '2024-05-03 06:39:50'),
(00000002184, 00000000001, '31.4415122', '73.0888359', '2024-05-03 06:39:56'),
(00000002185, 00000000001, '31.4415122', '73.0888359', '2024-05-03 06:39:58'),
(00000002186, 00000000001, '31.4415122', '73.0888359', '2024-05-03 06:39:59'),
(00000002187, 00000000001, '31.4415122', '73.0888359', '2024-05-03 06:40:00'),
(00000002188, 00000000001, '31.441553', '73.0890184', '2024-05-03 06:40:06'),
(00000002189, 00000000001, '31.441553', '73.0890184', '2024-05-03 06:40:08'),
(00000002190, 00000000001, '31.441553', '73.0890184', '2024-05-03 06:40:09'),
(00000002191, 00000000001, '31.441553', '73.0890184', '2024-05-03 06:40:10'),
(00000002192, 00000000001, '31.441509', '73.0888116', '2024-05-03 06:40:16'),
(00000002193, 00000000001, '31.441509', '73.0888116', '2024-05-03 06:40:18'),
(00000002194, 00000000001, '31.441509', '73.0888116', '2024-05-03 06:40:19'),
(00000002195, 00000000001, '31.441509', '73.0888116', '2024-05-03 06:40:20'),
(00000002196, 00000000001, '31.441528', '73.0887123', '2024-05-03 06:40:26'),
(00000002197, 00000000001, '31.441528', '73.0887123', '2024-05-03 06:40:28'),
(00000002198, 00000000001, '31.441528', '73.0887123', '2024-05-03 06:40:29'),
(00000002199, 00000000001, '31.441528', '73.0887123', '2024-05-03 06:40:30'),
(00000002200, 00000000001, '31.441556', '73.088599', '2024-05-03 06:40:36'),
(00000002201, 00000000001, '31.441556', '73.088599', '2024-05-03 06:40:38'),
(00000002202, 00000000001, '31.441556', '73.088599', '2024-05-03 06:40:39'),
(00000002203, 00000000001, '31.441556', '73.088599', '2024-05-03 06:40:40'),
(00000002204, 00000000001, '31.4416265', '73.0886909', '2024-05-03 06:40:46'),
(00000002205, 00000000001, '31.4416265', '73.0886909', '2024-05-03 06:40:48'),
(00000002206, 00000000001, '31.4416265', '73.0886909', '2024-05-03 06:40:49'),
(00000002207, 00000000001, '31.4416265', '73.0886909', '2024-05-03 06:40:50'),
(00000002208, 00000000001, '31.4417284', '73.0886681', '2024-05-03 06:40:56'),
(00000002209, 00000000001, '31.4417284', '73.0886681', '2024-05-03 06:40:58'),
(00000002210, 00000000001, '31.4417284', '73.0886681', '2024-05-03 06:40:59'),
(00000002211, 00000000001, '31.4417284', '73.0886681', '2024-05-03 06:41:00'),
(00000002212, 00000000001, '31.4416801', '73.0885216', '2024-05-03 06:41:06'),
(00000002213, 00000000001, '31.4416801', '73.0885216', '2024-05-03 06:41:08'),
(00000002214, 00000000001, '31.4416801', '73.0885216', '2024-05-03 06:41:09'),
(00000002215, 00000000001, '31.4416801', '73.0885216', '2024-05-03 06:41:10'),
(00000002216, 00000000001, '31.4415758', '73.0884357', '2024-05-03 06:41:16'),
(00000002217, 00000000001, '31.4415758', '73.0884357', '2024-05-03 06:41:18'),
(00000002218, 00000000001, '31.4415758', '73.0884357', '2024-05-03 06:41:19'),
(00000002219, 00000000001, '31.4415758', '73.0884357', '2024-05-03 06:41:20'),
(00000002220, 00000000001, '31.4415903', '73.0885435', '2024-05-03 06:41:26'),
(00000002221, 00000000001, '31.4415903', '73.0885435', '2024-05-03 06:41:28'),
(00000002222, 00000000001, '31.4415903', '73.0885435', '2024-05-03 06:41:29'),
(00000002223, 00000000001, '31.4415903', '73.0885435', '2024-05-03 06:41:30'),
(00000002224, 00000000001, '31.4414296', '73.0883845', '2024-05-03 06:41:36'),
(00000002225, 00000000001, '31.4414296', '73.0883845', '2024-05-03 06:41:38'),
(00000002226, 00000000001, '31.4414296', '73.0883845', '2024-05-03 06:41:39'),
(00000002227, 00000000001, '31.4414296', '73.0883845', '2024-05-03 06:41:40'),
(00000002228, 00000000001, '31.4413026', '73.0883954', '2024-05-03 06:41:46'),
(00000002229, 00000000001, '31.4413026', '73.0883954', '2024-05-03 06:41:48'),
(00000002230, 00000000001, '31.4413026', '73.0883954', '2024-05-03 06:41:49'),
(00000002231, 00000000001, '31.4413026', '73.0883954', '2024-05-03 06:41:50'),
(00000002232, 00000000001, '31.44121', '73.0884359', '2024-05-03 06:41:56'),
(00000002233, 00000000001, '31.44121', '73.0884359', '2024-05-03 06:41:58'),
(00000002234, 00000000001, '31.44121', '73.0884359', '2024-05-03 06:41:59'),
(00000002235, 00000000001, '31.44121', '73.0884359', '2024-05-03 06:42:00'),
(00000002236, 00000000001, '31.4411817', '73.0883735', '2024-05-03 06:42:06'),
(00000002237, 00000000001, '31.4411817', '73.0883735', '2024-05-03 06:42:08'),
(00000002238, 00000000001, '31.4411817', '73.0883735', '2024-05-03 06:42:09'),
(00000002239, 00000000001, '31.4411817', '73.0883735', '2024-05-03 06:42:10'),
(00000002240, 00000000001, '31.4411207', '73.0883728', '2024-05-03 06:42:16'),
(00000002241, 00000000001, '31.4411207', '73.0883728', '2024-05-03 06:42:18'),
(00000002242, 00000000001, '31.4411207', '73.0883728', '2024-05-03 06:42:19'),
(00000002243, 00000000001, '31.4411207', '73.0883728', '2024-05-03 06:42:20'),
(00000002244, 00000000001, '31.4413387', '73.0885747', '2024-05-03 06:42:26'),
(00000002245, 00000000001, '31.4413387', '73.0885747', '2024-05-03 06:42:28'),
(00000002246, 00000000001, '31.4413387', '73.0885747', '2024-05-03 06:42:29'),
(00000002247, 00000000001, '31.4413387', '73.0885747', '2024-05-03 06:42:30'),
(00000002248, 00000000001, '31.4413768', '73.0887078', '2024-05-03 06:42:36'),
(00000002249, 00000000001, '31.4413768', '73.0887078', '2024-05-03 06:42:38'),
(00000002250, 00000000001, '31.4413768', '73.0887078', '2024-05-03 06:42:39'),
(00000002251, 00000000001, '31.4413768', '73.0887078', '2024-05-03 06:42:40'),
(00000002252, 00000000001, '31.4413283', '73.0887409', '2024-05-03 06:42:46'),
(00000002253, 00000000001, '31.4413283', '73.0887409', '2024-05-03 06:42:48'),
(00000002254, 00000000001, '31.4413283', '73.0887409', '2024-05-03 06:42:49'),
(00000002255, 00000000001, '31.4413283', '73.0887409', '2024-05-03 06:42:50'),
(00000002256, 00000000001, '31.4413623', '73.0887426', '2024-05-03 06:42:58'),
(00000002257, 00000000001, '31.4413623', '73.0887426', '2024-05-03 06:43:00'),
(00000002258, 00000000001, '31.4413623', '73.0887426', '2024-05-03 06:43:00'),
(00000002259, 00000000001, '31.4414211', '73.0886222', '2024-05-03 06:43:07'),
(00000002260, 00000000001, '31.4414211', '73.0886222', '2024-05-03 06:43:08'),
(00000002261, 00000000001, '31.4414211', '73.0886222', '2024-05-03 06:43:09'),
(00000002262, 00000000001, '31.4414211', '73.0886222', '2024-05-03 06:43:12'),
(00000002263, 00000000001, '31.4414474', '73.0885876', '2024-05-03 06:43:16'),
(00000002264, 00000000001, '31.4414508', '73.0885805', '2024-05-03 06:43:18'),
(00000002265, 00000000001, '31.4414508', '73.0885805', '2024-05-03 06:43:19'),
(00000002266, 00000000001, '31.4414508', '73.0885805', '2024-05-03 06:43:20'),
(00000002267, 00000000001, '31.4414484', '73.088584', '2024-05-03 06:43:28'),
(00000002268, 00000000001, '31.4414484', '73.088584', '2024-05-03 06:43:29'),
(00000002269, 00000000001, '31.4414484', '73.088584', '2024-05-03 06:43:30'),
(00000002270, 00000000001, '31.4414484', '73.088584', '2024-05-03 06:43:32'),
(00000002271, 00000000001, '31.4414475', '73.0885895', '2024-05-03 06:43:38'),
(00000002272, 00000000001, '31.4414475', '73.0885895', '2024-05-03 06:43:39'),
(00000002273, 00000000001, '31.4414475', '73.0885895', '2024-05-03 06:43:40'),
(00000002274, 00000000001, '31.4414475', '73.0885897', '2024-05-03 06:43:44'),
(00000002275, 00000000001, '31.4414476', '73.0885906', '2024-05-03 06:43:48'),
(00000002276, 00000000001, '31.4414476', '73.0885906', '2024-05-03 06:43:49'),
(00000002277, 00000000001, '31.4414476', '73.0885906', '2024-05-03 06:43:50'),
(00000002278, 00000000001, '31.4414476', '73.0885877', '2024-05-03 06:43:58'),
(00000002279, 00000000001, '31.4414476', '73.0885877', '2024-05-03 06:43:59'),
(00000002280, 00000000001, '31.4414476', '73.0885877', '2024-05-03 06:44:00'),
(00000002281, 00000000001, '31.4414476', '73.0885877', '2024-05-03 06:44:00'),
(00000002282, 00000000001, '31.4414607', '73.0886034', '2024-05-03 06:44:08'),
(00000002283, 00000000001, '31.4414607', '73.0886034', '2024-05-03 06:44:09'),
(00000002284, 00000000001, '31.4414607', '73.0886034', '2024-05-03 06:44:10'),
(00000002285, 00000000001, '31.4414607', '73.0886034', '2024-05-03 06:44:10'),
(00000002286, 00000000001, '31.441502', '73.0886469', '2024-05-03 06:44:18'),
(00000002287, 00000000001, '31.441502', '73.0886469', '2024-05-03 06:44:19'),
(00000002288, 00000000001, '31.441502', '73.0886469', '2024-05-03 06:44:20'),
(00000002289, 00000000001, '31.441502', '73.0886469', '2024-05-03 06:44:20'),
(00000002290, 00000000001, '31.4414455', '73.0885827', '2024-05-03 06:44:28'),
(00000002291, 00000000001, '31.4414455', '73.0885827', '2024-05-03 06:44:29'),
(00000002292, 00000000001, '31.4414455', '73.0885827', '2024-05-03 06:44:30'),
(00000002293, 00000000001, '31.4414455', '73.0885827', '2024-05-03 06:44:30'),
(00000002294, 00000000001, '31.4415279', '73.0886669', '2024-05-03 06:44:38'),
(00000002295, 00000000001, '31.4415279', '73.0886669', '2024-05-03 06:44:39'),
(00000002296, 00000000001, '31.4415279', '73.0886669', '2024-05-03 06:44:40'),
(00000002297, 00000000001, '31.4415279', '73.0886669', '2024-05-03 06:44:40'),
(00000002298, 00000000001, '31.4414781', '73.0886211', '2024-05-03 06:44:48'),
(00000002299, 00000000001, '31.4414781', '73.0886211', '2024-05-03 06:44:49'),
(00000002300, 00000000001, '31.4414781', '73.0886211', '2024-05-03 06:44:50'),
(00000002301, 00000000001, '31.4414781', '73.0886211', '2024-05-03 06:44:50'),
(00000002302, 00000000001, '31.4414492', '73.088605', '2024-05-03 06:44:58'),
(00000002303, 00000000001, '31.4414492', '73.088605', '2024-05-03 06:44:59'),
(00000002304, 00000000001, '31.4414492', '73.088605', '2024-05-03 06:45:00'),
(00000002305, 00000000001, '31.4414492', '73.088605', '2024-05-03 06:45:00'),
(00000002306, 00000000001, '31.4415035', '73.0886442', '2024-05-03 06:45:08'),
(00000002307, 00000000001, '31.4415035', '73.0886442', '2024-05-03 06:45:09'),
(00000002308, 00000000001, '31.4415035', '73.0886442', '2024-05-03 06:45:10'),
(00000002309, 00000000001, '31.4415035', '73.0886442', '2024-05-03 06:45:10'),
(00000002310, 00000000001, '31.4414677', '73.0886133', '2024-05-03 06:45:18'),
(00000002311, 00000000001, '31.4414677', '73.0886133', '2024-05-03 06:45:19'),
(00000002312, 00000000001, '31.4414677', '73.0886133', '2024-05-03 06:45:20'),
(00000002313, 00000000001, '31.4414677', '73.0886133', '2024-05-03 06:45:20'),
(00000002314, 00000000001, '31.4415187', '73.0886571', '2024-05-03 06:45:28'),
(00000002315, 00000000001, '31.4415187', '73.0886571', '2024-05-03 06:45:29'),
(00000002316, 00000000001, '31.4415187', '73.0886571', '2024-05-03 06:45:30'),
(00000002317, 00000000001, '31.4415187', '73.0886571', '2024-05-03 06:45:30'),
(00000002318, 00000000001, '31.4414984', '73.0886361', '2024-05-03 06:45:38'),
(00000002319, 00000000001, '31.4414984', '73.0886361', '2024-05-03 06:45:39'),
(00000002320, 00000000001, '31.4414984', '73.0886361', '2024-05-03 06:45:40'),
(00000002321, 00000000001, '31.4414984', '73.0886361', '2024-05-03 06:45:40'),
(00000002322, 00000000001, '31.4414432', '73.0885834', '2024-05-03 06:45:48'),
(00000002323, 00000000001, '31.4414432', '73.0885834', '2024-05-03 06:45:49'),
(00000002324, 00000000001, '31.4414432', '73.0885834', '2024-05-03 06:45:50'),
(00000002325, 00000000001, '31.4414432', '73.0885834', '2024-05-03 06:45:50'),
(00000002326, 00000000001, '31.4415104', '73.0886461', '2024-05-03 06:45:58'),
(00000002327, 00000000001, '31.4415104', '73.0886461', '2024-05-03 06:45:59'),
(00000002328, 00000000001, '31.4415104', '73.0886461', '2024-05-03 06:46:00'),
(00000002329, 00000000001, '31.4415104', '73.0886461', '2024-05-03 06:46:00'),
(00000002330, 00000000001, '31.4414845', '73.0886243', '2024-05-03 06:46:08'),
(00000002331, 00000000001, '31.4414845', '73.0886243', '2024-05-03 06:46:09'),
(00000002332, 00000000001, '31.4414845', '73.0886243', '2024-05-03 06:46:10'),
(00000002333, 00000000001, '31.4414845', '73.0886243', '2024-05-03 06:46:10'),
(00000002334, 00000000001, '31.4414556', '73.0885961', '2024-05-03 06:46:18'),
(00000002335, 00000000001, '31.4414556', '73.0885961', '2024-05-03 06:46:19'),
(00000002336, 00000000001, '31.4414556', '73.0885961', '2024-05-03 06:46:20'),
(00000002337, 00000000001, '31.4414556', '73.0885961', '2024-05-03 06:46:20'),
(00000002338, 00000000001, '31.441472', '73.0886095', '2024-05-03 06:46:28'),
(00000002339, 00000000001, '31.441472', '73.0886095', '2024-05-03 06:46:29'),
(00000002340, 00000000001, '31.441472', '73.0886095', '2024-05-03 06:46:30'),
(00000002341, 00000000001, '31.441472', '73.0886095', '2024-05-03 06:46:30'),
(00000002342, 00000000001, '31.4414454', '73.0885821', '2024-05-03 06:46:38'),
(00000002343, 00000000001, '31.4414454', '73.0885821', '2024-05-03 06:46:39'),
(00000002344, 00000000001, '31.4414454', '73.0885821', '2024-05-03 06:46:40'),
(00000002345, 00000000001, '31.4414454', '73.0885821', '2024-05-03 06:46:40'),
(00000002346, 00000000001, '31.4414987', '73.0886364', '2024-05-03 06:46:48'),
(00000002347, 00000000001, '31.4414987', '73.0886364', '2024-05-03 06:46:49'),
(00000002348, 00000000001, '31.4414987', '73.0886364', '2024-05-03 06:46:50'),
(00000002349, 00000000001, '31.4414987', '73.0886364', '2024-05-03 06:46:50'),
(00000002350, 00000000001, '31.4414974', '73.0886356', '2024-05-03 06:46:58'),
(00000002351, 00000000001, '31.4414848', '73.0886198', '2024-05-03 06:46:59'),
(00000002352, 00000000001, '31.4414848', '73.0886198', '2024-05-03 06:47:00'),
(00000002353, 00000000001, '31.4414848', '73.0886198', '2024-05-03 06:47:00'),
(00000002354, 00000000001, '31.441454', '73.0885916', '2024-05-03 06:47:08'),
(00000002355, 00000000001, '31.4414462', '73.0885849', '2024-05-03 06:47:09'),
(00000002356, 00000000001, '31.4414462', '73.0885849', '2024-05-03 06:47:10'),
(00000002357, 00000000001, '31.4414462', '73.0885849', '2024-05-03 06:47:10'),
(00000002358, 00000000001, '31.4414272', '73.0886345', '2024-05-03 06:47:18'),
(00000002359, 00000000001, '31.4414272', '73.0886345', '2024-05-03 06:47:19'),
(00000002360, 00000000001, '31.4414272', '73.0886345', '2024-05-03 06:47:20'),
(00000002361, 00000000001, '31.4414272', '73.0886345', '2024-05-03 06:47:20'),
(00000002362, 00000000001, '31.4415181', '73.0886658', '2024-05-03 06:47:28'),
(00000002363, 00000000001, '31.4415181', '73.0886658', '2024-05-03 06:47:29'),
(00000002364, 00000000001, '31.4415181', '73.0886658', '2024-05-03 06:47:30'),
(00000002365, 00000000001, '31.4415181', '73.0886658', '2024-05-03 06:47:30'),
(00000002366, 00000000001, '31.4415221', '73.0886653', '2024-05-03 06:47:38'),
(00000002367, 00000000001, '31.4415221', '73.0886653', '2024-05-03 06:47:39'),
(00000002368, 00000000001, '31.4415221', '73.0886653', '2024-05-03 06:47:40'),
(00000002369, 00000000001, '31.4415221', '73.0886653', '2024-05-03 06:47:40'),
(00000002370, 00000000001, '31.4413598', '73.0887625', '2024-05-03 06:47:51'),
(00000002371, 00000000001, '31.4413598', '73.0887625', '2024-05-03 06:47:51'),
(00000002372, 00000000001, '31.4413598', '73.0887625', '2024-05-03 06:47:51'),
(00000002373, 00000000001, '31.4413598', '73.0887625', '2024-05-03 06:47:51'),
(00000002374, 00000000001, '31.4413535', '73.0887098', '2024-05-03 06:47:58'),
(00000002375, 00000000001, '31.4413535', '73.0887098', '2024-05-03 06:47:59'),
(00000002376, 00000000001, '31.4413535', '73.0887098', '2024-05-03 06:48:00'),
(00000002377, 00000000001, '31.4413535', '73.0887098', '2024-05-03 06:48:00'),
(00000002378, 00000000001, '31.4413945', '73.088655', '2024-05-03 06:48:08'),
(00000002379, 00000000001, '31.4413945', '73.088655', '2024-05-03 06:48:09'),
(00000002380, 00000000001, '31.4413945', '73.088655', '2024-05-03 06:48:10'),
(00000002381, 00000000001, '31.4413945', '73.088655', '2024-05-03 06:48:10'),
(00000002382, 00000000001, '31.4413276', '73.0887288', '2024-05-03 06:48:18'),
(00000002383, 00000000001, '31.4413276', '73.0887288', '2024-05-03 06:48:19'),
(00000002384, 00000000001, '31.4413276', '73.0887288', '2024-05-03 06:48:20'),
(00000002385, 00000000001, '31.4413276', '73.0887288', '2024-05-03 06:48:20'),
(00000002386, 00000000001, '31.4413365', '73.0886628', '2024-05-03 06:48:28'),
(00000002387, 00000000001, '31.4413365', '73.0886628', '2024-05-03 06:48:30'),
(00000002388, 00000000001, '31.4413365', '73.0886628', '2024-05-03 06:48:30'),
(00000002389, 00000000001, '31.4413365', '73.0886628', '2024-05-03 06:48:30'),
(00000002390, 00000000001, '31.441354', '73.0886384', '2024-05-03 06:48:38'),
(00000002391, 00000000001, '31.441354', '73.0886384', '2024-05-03 06:48:39'),
(00000002392, 00000000001, '31.441354', '73.0886384', '2024-05-03 06:48:40'),
(00000002393, 00000000001, '31.441354', '73.0886384', '2024-05-03 06:48:40'),
(00000002394, 00000000001, '31.441393', '73.0886595', '2024-05-03 06:48:48'),
(00000002395, 00000000001, '31.441393', '73.0886595', '2024-05-03 06:48:49'),
(00000002396, 00000000001, '31.441393', '73.0886595', '2024-05-03 06:48:50'),
(00000002397, 00000000001, '31.441393', '73.0886595', '2024-05-03 06:48:50'),
(00000002398, 00000000001, '31.4413259', '73.0887812', '2024-05-03 06:48:58'),
(00000002399, 00000000001, '31.4413259', '73.0887812', '2024-05-03 06:48:59'),
(00000002400, 00000000001, '31.4413259', '73.0887812', '2024-05-03 06:49:00'),
(00000002401, 00000000001, '31.4413259', '73.0887812', '2024-05-03 06:49:00'),
(00000002402, 00000000001, '31.4413315', '73.0887791', '2024-05-03 06:49:08'),
(00000002403, 00000000001, '31.4413315', '73.0887791', '2024-05-03 06:49:09'),
(00000002404, 00000000001, '31.4413315', '73.0887791', '2024-05-03 06:49:10'),
(00000002405, 00000000001, '31.4413315', '73.0887791', '2024-05-03 06:49:10'),
(00000002406, 00000000001, '31.4413144', '73.0887185', '2024-05-03 06:49:18'),
(00000002407, 00000000001, '31.4413144', '73.0887185', '2024-05-03 06:49:19'),
(00000002408, 00000000001, '31.4413144', '73.0887185', '2024-05-03 06:49:20'),
(00000002409, 00000000001, '31.4413144', '73.0887185', '2024-05-03 06:49:20'),
(00000002410, 00000000001, '31.4413823', '73.0886623', '2024-05-03 06:49:28'),
(00000002411, 00000000001, '31.4413823', '73.0886623', '2024-05-03 06:49:29'),
(00000002412, 00000000001, '31.4413823', '73.0886623', '2024-05-03 06:49:30'),
(00000002413, 00000000001, '31.4413823', '73.0886623', '2024-05-03 06:49:30'),
(00000002414, 00000000001, '31.4414102', '73.0886575', '2024-05-03 06:49:38'),
(00000002415, 00000000001, '31.4414102', '73.0886575', '2024-05-03 06:49:39'),
(00000002416, 00000000001, '31.4414102', '73.0886575', '2024-05-03 06:49:40'),
(00000002417, 00000000001, '31.4414102', '73.0886575', '2024-05-03 06:49:40'),
(00000002418, 00000000001, '31.4413999', '73.0886508', '2024-05-03 06:49:48'),
(00000002419, 00000000001, '31.4413999', '73.0886508', '2024-05-03 06:49:49'),
(00000002420, 00000000001, '31.4413999', '73.0886508', '2024-05-03 06:49:50'),
(00000002421, 00000000001, '31.4413999', '73.0886508', '2024-05-03 06:49:50'),
(00000002422, 00000000001, '31.4413583', '73.0886352', '2024-05-03 06:49:58'),
(00000002423, 00000000001, '31.4413583', '73.0886352', '2024-05-03 06:49:59'),
(00000002424, 00000000001, '31.4413583', '73.0886352', '2024-05-03 06:50:00'),
(00000002425, 00000000001, '31.4413583', '73.0886352', '2024-05-03 06:50:00'),
(00000002426, 00000000001, '31.4412262', '73.0887059', '2024-05-03 06:50:08'),
(00000002427, 00000000001, '31.4412262', '73.0887059', '2024-05-03 06:50:09'),
(00000002428, 00000000001, '31.4412262', '73.0887059', '2024-05-03 06:50:10'),
(00000002429, 00000000001, '31.4412262', '73.0887059', '2024-05-03 06:50:10'),
(00000002430, 00000000001, '31.4412404', '73.0887291', '2024-05-03 06:50:18'),
(00000002431, 00000000001, '31.4412404', '73.0887291', '2024-05-03 06:50:19'),
(00000002432, 00000000001, '31.4412404', '73.0887291', '2024-05-03 06:50:20'),
(00000002433, 00000000001, '31.4412404', '73.0887291', '2024-05-03 06:50:20'),
(00000002434, 00000000001, '31.4411975', '73.0887664', '2024-05-03 06:50:28'),
(00000002435, 00000000001, '31.4411975', '73.0887664', '2024-05-03 06:50:29'),
(00000002436, 00000000001, '31.4411975', '73.0887664', '2024-05-03 06:50:30'),
(00000002437, 00000000001, '31.4411975', '73.0887664', '2024-05-03 06:50:30'),
(00000002438, 00000000001, '31.4413282', '73.0886552', '2024-05-03 06:50:38'),
(00000002439, 00000000001, '31.4413282', '73.0886552', '2024-05-03 06:50:39'),
(00000002440, 00000000001, '31.4413282', '73.0886552', '2024-05-03 06:50:40'),
(00000002441, 00000000001, '31.4413282', '73.0886552', '2024-05-03 06:50:40'),
(00000002442, 00000000001, '31.4413335', '73.0886257', '2024-05-03 06:50:48'),
(00000002443, 00000000001, '31.4413335', '73.0886257', '2024-05-03 06:50:49'),
(00000002444, 00000000001, '31.4413335', '73.0886257', '2024-05-03 06:50:50'),
(00000002445, 00000000001, '31.4413335', '73.0886257', '2024-05-03 06:50:50'),
(00000002446, 00000000001, '31.4414689', '73.0884948', '2024-05-03 06:50:58'),
(00000002447, 00000000001, '31.4414689', '73.0884948', '2024-05-03 06:50:59'),
(00000002448, 00000000001, '31.4414689', '73.0884948', '2024-05-03 06:51:00'),
(00000002449, 00000000001, '31.4414689', '73.0884948', '2024-05-03 06:51:00'),
(00000002450, 00000000001, '31.4415525', '73.0885', '2024-05-03 06:51:08'),
(00000002451, 00000000001, '31.4415525', '73.0885', '2024-05-03 06:51:09'),
(00000002452, 00000000001, '31.4415525', '73.0885', '2024-05-03 06:51:10'),
(00000002453, 00000000001, '31.4415525', '73.0885', '2024-05-03 06:51:10'),
(00000002454, 00000000001, '31.4414149', '73.088613', '2024-05-03 06:51:18'),
(00000002455, 00000000001, '31.4414149', '73.088613', '2024-05-03 06:51:19'),
(00000002456, 00000000001, '31.4414149', '73.088613', '2024-05-03 06:51:20'),
(00000002457, 00000000001, '31.4414149', '73.088613', '2024-05-03 06:51:20'),
(00000002458, 00000000001, '31.4414535', '73.0886368', '2024-05-03 06:51:28'),
(00000002459, 00000000001, '31.4414535', '73.0886368', '2024-05-03 06:51:29'),
(00000002460, 00000000001, '31.4414535', '73.0886368', '2024-05-03 06:51:30'),
(00000002461, 00000000001, '31.4414535', '73.0886368', '2024-05-03 06:51:30'),
(00000002462, 00000000001, '31.4414143', '73.0885486', '2024-05-03 06:51:38'),
(00000002463, 00000000001, '31.4414143', '73.0885486', '2024-05-03 06:51:39'),
(00000002464, 00000000001, '31.4414143', '73.0885486', '2024-05-03 06:51:40'),
(00000002465, 00000000001, '31.4414143', '73.0885486', '2024-05-03 06:51:40'),
(00000002466, 00000000001, '31.4414329', '73.0885642', '2024-05-03 06:51:48'),
(00000002467, 00000000001, '31.4414329', '73.0885642', '2024-05-03 06:51:49'),
(00000002468, 00000000001, '31.4414329', '73.0885642', '2024-05-03 06:51:50'),
(00000002469, 00000000001, '31.4414329', '73.0885642', '2024-05-03 06:51:50'),
(00000002470, 00000000001, '31.4414297', '73.0886304', '2024-05-03 06:51:58'),
(00000002471, 00000000001, '31.4414297', '73.0886304', '2024-05-03 06:51:59'),
(00000002472, 00000000001, '31.4414297', '73.0886304', '2024-05-03 06:52:00'),
(00000002473, 00000000001, '31.4414297', '73.0886304', '2024-05-03 06:52:00'),
(00000002474, 00000000001, '31.4413981', '73.088506', '2024-05-03 06:52:08'),
(00000002475, 00000000001, '31.4413981', '73.088506', '2024-05-03 06:52:09'),
(00000002476, 00000000001, '31.4413981', '73.088506', '2024-05-03 06:52:10'),
(00000002477, 00000000001, '31.4413981', '73.088506', '2024-05-03 06:52:10'),
(00000002478, 00000000001, '31.4413565', '73.0885734', '2024-05-03 06:52:18'),
(00000002479, 00000000001, '31.4413565', '73.0885734', '2024-05-03 06:52:19'),
(00000002480, 00000000001, '31.4413565', '73.0885734', '2024-05-03 06:52:20'),
(00000002481, 00000000001, '31.4413565', '73.0885734', '2024-05-03 06:52:20'),
(00000002482, 00000000001, '31.4413853', '73.0887731', '2024-05-03 06:52:28'),
(00000002483, 00000000001, '31.4413853', '73.0887731', '2024-05-03 06:52:29'),
(00000002484, 00000000001, '31.4413853', '73.0887731', '2024-05-03 06:52:30'),
(00000002485, 00000000001, '31.4413853', '73.0887731', '2024-05-03 06:52:30'),
(00000002486, 00000000001, '31.4414193', '73.0888412', '2024-05-03 06:52:38'),
(00000002487, 00000000001, '31.4414193', '73.0888412', '2024-05-03 06:52:39'),
(00000002488, 00000000001, '31.4414193', '73.0888412', '2024-05-03 06:52:40'),
(00000002489, 00000000001, '31.4414193', '73.0888412', '2024-05-03 06:52:40'),
(00000002490, 00000000001, '31.4414064', '73.0887822', '2024-05-03 06:52:48'),
(00000002491, 00000000001, '31.4414064', '73.0887822', '2024-05-03 06:52:49'),
(00000002492, 00000000001, '31.4414064', '73.0887822', '2024-05-03 06:52:50'),
(00000002493, 00000000001, '31.4414064', '73.0887822', '2024-05-03 06:52:50'),
(00000002494, 00000000001, '31.441434', '73.0887315', '2024-05-03 06:52:58'),
(00000002495, 00000000001, '31.441434', '73.0887315', '2024-05-03 06:52:59'),
(00000002496, 00000000001, '31.441434', '73.0887315', '2024-05-03 06:53:00'),
(00000002497, 00000000001, '31.441434', '73.0887315', '2024-05-03 06:53:00'),
(00000002498, 00000000001, '31.4414346', '73.0886726', '2024-05-03 06:53:08'),
(00000002499, 00000000001, '31.4414346', '73.0886726', '2024-05-03 06:53:09'),
(00000002500, 00000000001, '31.4414346', '73.0886726', '2024-05-03 06:53:10'),
(00000002501, 00000000001, '31.4414346', '73.0886726', '2024-05-03 06:53:10'),
(00000002502, 00000000001, '31.4415228', '73.0887444', '2024-05-03 06:53:18'),
(00000002503, 00000000001, '31.4415228', '73.0887444', '2024-05-03 06:53:19'),
(00000002504, 00000000001, '31.4415228', '73.0887444', '2024-05-03 06:53:20'),
(00000002505, 00000000001, '31.4415228', '73.0887444', '2024-05-03 06:53:20'),
(00000002506, 00000000001, '31.4415579', '73.088709', '2024-05-03 06:53:28'),
(00000002507, 00000000001, '31.4415579', '73.088709', '2024-05-03 06:53:29'),
(00000002508, 00000000001, '31.4415579', '73.088709', '2024-05-03 06:53:30'),
(00000002509, 00000000001, '31.4415579', '73.088709', '2024-05-03 06:53:30'),
(00000002510, 00000000001, '31.4414726', '73.0887099', '2024-05-03 06:53:38'),
(00000002511, 00000000001, '31.4414726', '73.0887099', '2024-05-03 06:53:39'),
(00000002512, 00000000001, '31.4414726', '73.0887099', '2024-05-03 06:53:40'),
(00000002513, 00000000001, '31.4414726', '73.0887099', '2024-05-03 06:53:40'),
(00000002514, 00000000001, '31.441425', '73.0885866', '2024-05-03 06:53:48'),
(00000002515, 00000000001, '31.441425', '73.0885866', '2024-05-03 06:53:49'),
(00000002516, 00000000001, '31.441425', '73.0885866', '2024-05-03 06:53:50'),
(00000002517, 00000000001, '31.441425', '73.0885866', '2024-05-03 06:53:50'),
(00000002518, 00000000001, '31.4414459', '73.0885669', '2024-05-03 06:53:58'),
(00000002519, 00000000001, '31.4414459', '73.0885669', '2024-05-03 06:53:59'),
(00000002520, 00000000001, '31.4414459', '73.0885669', '2024-05-03 06:54:00'),
(00000002521, 00000000001, '31.4414459', '73.0885669', '2024-05-03 06:54:00'),
(00000002522, 00000000001, '31.4414903', '73.0886394', '2024-05-03 06:54:08'),
(00000002523, 00000000001, '31.4414903', '73.0886394', '2024-05-03 06:54:09'),
(00000002524, 00000000001, '31.4414903', '73.0886394', '2024-05-03 06:54:10'),
(00000002525, 00000000001, '31.4414903', '73.0886394', '2024-05-03 06:54:10'),
(00000002526, 00000000001, '31.4414836', '73.0886579', '2024-05-03 06:54:18'),
(00000002527, 00000000001, '31.4414836', '73.0886579', '2024-05-03 06:54:19'),
(00000002528, 00000000001, '31.4414836', '73.0886579', '2024-05-03 06:54:20'),
(00000002529, 00000000001, '31.4414836', '73.0886579', '2024-05-03 06:54:20'),
(00000002530, 00000000001, '31.4414493', '73.0886377', '2024-05-03 06:54:28'),
(00000002531, 00000000001, '31.4414493', '73.0886377', '2024-05-03 06:54:29'),
(00000002532, 00000000001, '31.4414493', '73.0886377', '2024-05-03 06:54:30'),
(00000002533, 00000000001, '31.4414493', '73.0886377', '2024-05-03 06:54:30'),
(00000002534, 00000000001, '31.4414436', '73.0886828', '2024-05-03 06:54:38'),
(00000002535, 00000000001, '31.4414436', '73.0886828', '2024-05-03 06:54:39'),
(00000002536, 00000000001, '31.4414436', '73.0886828', '2024-05-03 06:54:40'),
(00000002537, 00000000001, '31.4414436', '73.0886828', '2024-05-03 06:54:40'),
(00000002538, 00000000001, '31.4414806', '73.0887838', '2024-05-03 06:54:48'),
(00000002539, 00000000001, '31.4414806', '73.0887838', '2024-05-03 06:54:49'),
(00000002540, 00000000001, '31.4414806', '73.0887838', '2024-05-03 06:54:50'),
(00000002541, 00000000001, '31.4414806', '73.0887838', '2024-05-03 06:54:50'),
(00000002542, 00000000001, '31.4415616', '73.0887233', '2024-05-03 06:54:58'),
(00000002543, 00000000001, '31.4415616', '73.0887233', '2024-05-03 06:54:59'),
(00000002544, 00000000001, '31.4415616', '73.0887233', '2024-05-03 06:55:00'),
(00000002545, 00000000001, '31.4415616', '73.0887233', '2024-05-03 06:55:00'),
(00000002546, 00000000001, '31.4415892', '73.0887338', '2024-05-03 06:55:08'),
(00000002547, 00000000001, '31.4415892', '73.0887338', '2024-05-03 06:55:09'),
(00000002548, 00000000001, '31.4415892', '73.0887338', '2024-05-03 06:55:10'),
(00000002549, 00000000001, '31.4415892', '73.0887338', '2024-05-03 06:55:10'),
(00000002550, 00000000001, '31.4415405', '73.0886114', '2024-05-03 06:55:18'),
(00000002551, 00000000001, '31.4415405', '73.0886114', '2024-05-03 06:55:19'),
(00000002552, 00000000001, '31.4415405', '73.0886114', '2024-05-03 06:55:20'),
(00000002553, 00000000001, '31.4415405', '73.0886114', '2024-05-03 06:55:20'),
(00000002554, 00000000001, '31.4414258', '73.0886468', '2024-05-03 06:55:28'),
(00000002555, 00000000001, '31.4414258', '73.0886468', '2024-05-03 06:55:29'),
(00000002556, 00000000001, '31.4414258', '73.0886468', '2024-05-03 06:55:30'),
(00000002557, 00000000001, '31.4414258', '73.0886468', '2024-05-03 06:55:30'),
(00000002558, 00000000001, '31.441468', '73.0884943', '2024-05-03 06:55:38'),
(00000002559, 00000000001, '31.441468', '73.0884943', '2024-05-03 06:55:40'),
(00000002560, 00000000001, '31.441468', '73.0884943', '2024-05-03 06:55:40'),
(00000002561, 00000000001, '31.441468', '73.0884943', '2024-05-03 06:55:40'),
(00000002562, 00000000001, '31.4414532', '73.0885931', '2024-05-03 06:55:48'),
(00000002563, 00000000001, '31.4414532', '73.0885931', '2024-05-03 06:55:49'),
(00000002564, 00000000001, '31.4414532', '73.0885931', '2024-05-03 06:55:50'),
(00000002565, 00000000001, '31.4414532', '73.0885931', '2024-05-03 06:55:50'),
(00000002566, 00000000001, '31.4415066', '73.0886386', '2024-05-03 06:55:58'),
(00000002567, 00000000001, '31.4415066', '73.0886386', '2024-05-03 06:55:59'),
(00000002568, 00000000001, '31.4415066', '73.0886386', '2024-05-03 06:56:00'),
(00000002569, 00000000001, '31.4415066', '73.0886386', '2024-05-03 06:56:00'),
(00000002570, 00000000001, '31.4415966', '73.0885509', '2024-05-03 06:56:08'),
(00000002571, 00000000001, '31.4415966', '73.0885509', '2024-05-03 06:56:09'),
(00000002572, 00000000001, '31.4415966', '73.0885509', '2024-05-03 06:56:10'),
(00000002573, 00000000001, '31.4415966', '73.0885509', '2024-05-03 06:56:10'),
(00000002574, 00000000001, '31.4416802', '73.0884669', '2024-05-03 06:56:21'),
(00000002575, 00000000001, '31.4416802', '73.0884669', '2024-05-03 06:56:21'),
(00000002576, 00000000001, '31.4416802', '73.0884669', '2024-05-03 06:56:21'),
(00000002577, 00000000001, '31.4416802', '73.0884669', '2024-05-03 06:56:21'),
(00000002578, 00000000001, '31.4415332', '73.0885165', '2024-05-03 06:56:28'),
(00000002579, 00000000001, '31.4415332', '73.0885165', '2024-05-03 06:56:29'),
(00000002580, 00000000001, '31.4415332', '73.0885165', '2024-05-03 06:56:30'),
(00000002581, 00000000001, '31.4415332', '73.0885165', '2024-05-03 06:56:30'),
(00000002582, 00000000001, '31.4414113', '73.0885786', '2024-05-03 06:56:38'),
(00000002583, 00000000001, '31.4414113', '73.0885786', '2024-05-03 06:56:39'),
(00000002584, 00000000001, '31.4414113', '73.0885786', '2024-05-03 06:56:40'),
(00000002585, 00000000001, '31.4414113', '73.0885786', '2024-05-03 06:56:40'),
(00000002586, 00000000001, '31.4414561', '73.0885861', '2024-05-03 06:56:48'),
(00000002587, 00000000001, '31.4414561', '73.0885861', '2024-05-03 06:56:49'),
(00000002588, 00000000001, '31.4414561', '73.0885861', '2024-05-03 06:56:50'),
(00000002589, 00000000001, '31.4414561', '73.0885861', '2024-05-03 06:56:50'),
(00000002590, 00000000001, '31.44145', '73.0885847', '2024-05-03 06:56:58'),
(00000002591, 00000000001, '31.44145', '73.0885847', '2024-05-03 06:57:00'),
(00000002592, 00000000001, '31.44145', '73.0885847', '2024-05-03 06:57:00'),
(00000002593, 00000000001, '31.44145', '73.0885847', '2024-05-03 06:57:00'),
(00000002594, 00000000001, '31.4414617', '73.0885905', '2024-05-03 06:57:08'),
(00000002595, 00000000001, '31.4414617', '73.0885905', '2024-05-03 06:57:09'),
(00000002596, 00000000001, '31.4414617', '73.0885905', '2024-05-03 06:57:10'),
(00000002597, 00000000001, '31.4414617', '73.0885905', '2024-05-03 06:57:10'),
(00000002598, 00000000001, '31.4413813', '73.0886221', '2024-05-03 06:57:18'),
(00000002599, 00000000001, '31.4413813', '73.0886221', '2024-05-03 06:57:19'),
(00000002600, 00000000001, '31.4413813', '73.0886221', '2024-05-03 06:57:20');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(00000002601, 00000000001, '31.4413813', '73.0886221', '2024-05-03 06:57:20'),
(00000002602, 00000000001, '31.4413252', '73.0885641', '2024-05-03 06:57:28'),
(00000002603, 00000000001, '31.4413252', '73.0885641', '2024-05-03 06:57:29'),
(00000002604, 00000000001, '31.4413252', '73.0885641', '2024-05-03 06:57:30'),
(00000002605, 00000000001, '31.4413252', '73.0885641', '2024-05-03 06:57:30'),
(00000002606, 00000000001, '31.4412711', '73.0885428', '2024-05-03 06:57:38'),
(00000002607, 00000000001, '31.4412711', '73.0885428', '2024-05-03 06:57:39'),
(00000002608, 00000000001, '31.4412711', '73.0885428', '2024-05-03 06:57:40'),
(00000002609, 00000000001, '31.4412711', '73.0885428', '2024-05-03 06:57:40'),
(00000002610, 00000000001, '31.4414127', '73.0887097', '2024-05-03 06:57:48'),
(00000002611, 00000000001, '31.4414127', '73.0887097', '2024-05-03 06:57:49'),
(00000002612, 00000000001, '31.4414127', '73.0887097', '2024-05-03 06:57:50'),
(00000002613, 00000000001, '31.4414127', '73.0887097', '2024-05-03 06:57:50'),
(00000002614, 00000000001, '31.4413279', '73.0886988', '2024-05-03 06:57:58'),
(00000002615, 00000000001, '31.4413279', '73.0886988', '2024-05-03 06:57:59'),
(00000002616, 00000000001, '31.4413279', '73.0886988', '2024-05-03 06:58:00'),
(00000002617, 00000000001, '31.4413279', '73.0886988', '2024-05-03 06:58:00'),
(00000002618, 00000000001, '31.4412623', '73.0886352', '2024-05-03 06:58:08'),
(00000002619, 00000000001, '31.4412623', '73.0886352', '2024-05-03 06:58:09'),
(00000002620, 00000000001, '31.4412623', '73.0886352', '2024-05-03 06:58:10'),
(00000002621, 00000000001, '31.4412623', '73.0886352', '2024-05-03 06:58:10'),
(00000002622, 00000000001, '31.4412979', '73.0886743', '2024-05-03 06:58:18'),
(00000002623, 00000000001, '31.4412979', '73.0886743', '2024-05-03 06:58:19'),
(00000002624, 00000000001, '31.4412979', '73.0886743', '2024-05-03 06:58:20'),
(00000002625, 00000000001, '31.4412979', '73.0886743', '2024-05-03 06:58:20'),
(00000002626, 00000000001, '31.44139', '73.0887298', '2024-05-03 06:58:28'),
(00000002627, 00000000001, '31.44139', '73.0887298', '2024-05-03 06:58:29'),
(00000002628, 00000000001, '31.44139', '73.0887298', '2024-05-03 06:58:30'),
(00000002629, 00000000001, '31.44139', '73.0887298', '2024-05-03 06:58:30'),
(00000002630, 00000000001, '31.4415024', '73.0887523', '2024-05-03 06:58:38'),
(00000002631, 00000000001, '31.4415024', '73.0887523', '2024-05-03 06:58:39'),
(00000002632, 00000000001, '31.4415024', '73.0887523', '2024-05-03 06:58:40'),
(00000002633, 00000000001, '31.4415024', '73.0887523', '2024-05-03 06:58:40'),
(00000002634, 00000000001, '31.4416919', '73.0887682', '2024-05-03 06:58:48'),
(00000002635, 00000000001, '31.4416919', '73.0887682', '2024-05-03 06:58:49'),
(00000002636, 00000000001, '31.4416919', '73.0887682', '2024-05-03 06:58:50'),
(00000002637, 00000000001, '31.4416919', '73.0887682', '2024-05-03 06:58:50'),
(00000002638, 00000000001, '31.4414927', '73.0886927', '2024-05-03 06:58:58'),
(00000002639, 00000000001, '31.4414927', '73.0886927', '2024-05-03 06:58:59'),
(00000002640, 00000000001, '31.4414927', '73.0886927', '2024-05-03 06:59:00'),
(00000002641, 00000000001, '31.4414927', '73.0886927', '2024-05-03 06:59:00'),
(00000002642, 00000000001, '31.4414176', '73.0886917', '2024-05-03 06:59:08'),
(00000002643, 00000000001, '31.4413623', '73.0886883', '2024-05-03 06:59:12'),
(00000002644, 00000000001, '31.4413623', '73.0886883', '2024-05-03 06:59:12'),
(00000002645, 00000000001, '31.4413623', '73.0886883', '2024-05-03 06:59:12'),
(00000002646, 00000000001, '31.4414162', '73.0887368', '2024-05-03 06:59:19'),
(00000002647, 00000000001, '31.4414162', '73.0887368', '2024-05-03 06:59:19'),
(00000002648, 00000000001, '31.4414162', '73.0887368', '2024-05-03 06:59:20'),
(00000002649, 00000000001, '31.4414162', '73.0887368', '2024-05-03 06:59:20'),
(00000002650, 00000000001, '31.4415402', '73.0888255', '2024-05-03 06:59:28'),
(00000002651, 00000000001, '31.4415402', '73.0888255', '2024-05-03 06:59:29'),
(00000002652, 00000000001, '31.4415402', '73.0888255', '2024-05-03 06:59:30'),
(00000002653, 00000000001, '31.4415402', '73.0888255', '2024-05-03 06:59:30'),
(00000002654, 00000000001, '31.4414141', '73.0888108', '2024-05-03 06:59:38'),
(00000002655, 00000000001, '31.4414141', '73.0888108', '2024-05-03 06:59:39'),
(00000002656, 00000000001, '31.4414141', '73.0888108', '2024-05-03 06:59:40'),
(00000002657, 00000000001, '31.4414141', '73.0888108', '2024-05-03 06:59:40'),
(00000002658, 00000000001, '31.4413674', '73.0887349', '2024-05-03 06:59:48'),
(00000002659, 00000000001, '31.4413674', '73.0887349', '2024-05-03 06:59:49'),
(00000002660, 00000000001, '31.4413674', '73.0887349', '2024-05-03 06:59:50'),
(00000002661, 00000000001, '31.4413674', '73.0887349', '2024-05-03 06:59:50'),
(00000002662, 00000000001, '31.4412862', '73.0886312', '2024-05-03 06:59:58'),
(00000002663, 00000000001, '31.4412862', '73.0886312', '2024-05-03 06:59:59'),
(00000002664, 00000000001, '31.4412862', '73.0886312', '2024-05-03 07:00:00'),
(00000002665, 00000000001, '31.4412862', '73.0886312', '2024-05-03 07:00:00'),
(00000002666, 00000000001, '31.4423316', '73.0891289', '2024-05-03 07:00:33'),
(00000002667, 00000000001, '31.4418047', '73.0887559', '2024-05-03 07:00:33'),
(00000002668, 00000000001, '31.4413909', '73.088647', '2024-05-03 07:00:34'),
(00000002669, 00000000001, '31.4418047', '73.0887559', '2024-05-03 07:00:34'),
(00000002670, 00000000001, '31.4423316', '73.0891289', '2024-05-03 07:00:34'),
(00000002671, 00000000001, '31.4423316', '73.0891289', '2024-05-03 07:00:34'),
(00000002672, 00000000001, '31.4418047', '73.0887559', '2024-05-03 07:00:34'),
(00000002673, 00000000001, '31.4413909', '73.088647', '2024-05-03 07:00:34'),
(00000002674, 00000000001, '31.4423316', '73.0891289', '2024-05-03 07:00:34'),
(00000002675, 00000000001, '31.4413909', '73.088647', '2024-05-03 07:00:34'),
(00000002676, 00000000001, '31.4418047', '73.0887559', '2024-05-03 07:00:34'),
(00000002677, 00000000001, '31.4413909', '73.088647', '2024-05-03 07:00:34'),
(00000002678, 00000000001, '31.4415132', '73.0886275', '2024-05-03 07:00:43'),
(00000002679, 00000000001, '31.4415132', '73.0886275', '2024-05-03 07:00:43'),
(00000002680, 00000000001, '31.4415132', '73.0886275', '2024-05-03 07:00:43'),
(00000002681, 00000000001, '31.4415132', '73.0886275', '2024-05-03 07:00:43'),
(00000002682, 00000000001, '31.4412129', '73.0886171', '2024-05-03 07:01:05'),
(00000002683, 00000000001, '31.4412129', '73.0886171', '2024-05-03 07:01:06'),
(00000002684, 00000000001, '31.4412129', '73.0886171', '2024-05-03 07:01:06'),
(00000002685, 00000000001, '31.4412129', '73.0886171', '2024-05-03 07:01:06'),
(00000002686, 00000000001, '31.4412129', '73.0886171', '2024-05-03 07:01:06'),
(00000002687, 00000000001, '31.4412129', '73.0886171', '2024-05-03 07:01:06'),
(00000002688, 00000000001, '31.4412129', '73.0886171', '2024-05-03 07:01:06'),
(00000002689, 00000000001, '31.4412129', '73.0886171', '2024-05-03 07:01:06'),
(00000002690, 00000000001, '31.4411794', '73.0885983', '2024-05-03 07:01:08'),
(00000002691, 00000000001, '31.4411794', '73.0885983', '2024-05-03 07:01:09'),
(00000002692, 00000000001, '31.4411794', '73.0885983', '2024-05-03 07:01:10'),
(00000002693, 00000000001, '31.4411794', '73.0885983', '2024-05-03 07:01:10'),
(00000002694, 00000000001, '31.4412484', '73.0884994', '2024-05-03 07:01:18'),
(00000002695, 00000000001, '31.4412484', '73.0884994', '2024-05-03 07:01:19'),
(00000002696, 00000000001, '31.4412484', '73.0884994', '2024-05-03 07:01:20'),
(00000002697, 00000000001, '31.4412484', '73.0884994', '2024-05-03 07:01:20'),
(00000002698, 00000000001, '31.4413201', '73.0885765', '2024-05-03 07:01:28'),
(00000002699, 00000000001, '31.4413201', '73.0885765', '2024-05-03 07:01:29'),
(00000002700, 00000000001, '31.4413201', '73.0885765', '2024-05-03 07:01:30'),
(00000002701, 00000000001, '31.4413201', '73.0885765', '2024-05-03 07:01:30'),
(00000002702, 00000000001, '31.4412753', '73.0885077', '2024-05-03 07:01:38'),
(00000002703, 00000000001, '31.4412753', '73.0885077', '2024-05-03 07:01:39'),
(00000002704, 00000000001, '31.4412753', '73.0885077', '2024-05-03 07:01:40'),
(00000002705, 00000000001, '31.4412753', '73.0885077', '2024-05-03 07:01:40'),
(00000002706, 00000000001, '31.4412867', '73.0885133', '2024-05-03 07:01:48'),
(00000002707, 00000000001, '31.4412867', '73.0885133', '2024-05-03 07:01:49'),
(00000002708, 00000000001, '31.4412867', '73.0885133', '2024-05-03 07:01:50'),
(00000002709, 00000000001, '31.4412867', '73.0885133', '2024-05-03 07:01:50'),
(00000002710, 00000000001, '31.4413371', '73.0885488', '2024-05-03 07:01:58'),
(00000002711, 00000000001, '31.4413395', '73.0885442', '2024-05-03 07:02:03'),
(00000002712, 00000000001, '31.4413395', '73.0885442', '2024-05-03 07:02:03'),
(00000002713, 00000000001, '31.4413395', '73.0885442', '2024-05-03 07:02:03'),
(00000002714, 00000000001, '31.4414262', '73.0885566', '2024-05-03 07:02:08'),
(00000002715, 00000000001, '31.4414262', '73.0885566', '2024-05-03 07:02:09'),
(00000002716, 00000000001, '31.4414262', '73.0885566', '2024-05-03 07:02:10'),
(00000002717, 00000000001, '31.4414262', '73.0885566', '2024-05-03 07:02:10'),
(00000002718, 00000000001, '31.4415262', '73.0886611', '2024-05-03 07:05:00'),
(00000002719, 00000000001, '31.4415262', '73.0886611', '2024-05-03 07:05:00'),
(00000002720, 00000000001, '31.4415212', '73.0886021', '2024-05-03 07:05:03'),
(00000002721, 00000000001, '31.4414708', '73.0886029', '2024-05-03 07:05:14'),
(00000002722, 00000000001, '31.441338', '73.0884399', '2024-05-03 07:05:23'),
(00000002723, 00000000001, '31.4413068', '73.0884868', '2024-05-03 07:05:34'),
(00000002724, 00000000001, '31.44132', '73.0885081', '2024-05-03 07:05:44'),
(00000002725, 00000000001, '31.4413426', '73.0884888', '2024-05-03 07:05:54'),
(00000002726, 00000000001, '31.4413238', '73.0885269', '2024-05-03 07:06:04'),
(00000002727, 00000000001, '31.4413782', '73.0885763', '2024-05-03 07:06:14'),
(00000002728, 00000000001, '31.441379', '73.0886516', '2024-05-03 07:06:24'),
(00000002729, 00000000001, '31.4413714', '73.0886677', '2024-05-03 07:06:34'),
(00000002730, 00000000001, '31.4414421', '73.088725', '2024-05-03 07:06:46'),
(00000002731, 00000000001, '31.4414239', '73.0886877', '2024-05-03 07:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `driver_vehicle`
--

CREATE TABLE `driver_vehicle` (
  `dv_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `v_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(11) UNSIGNED ZEROFILL NOT NULL,
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
(00000000001, 00000000001, 00000000001, 'Honda', 'Civic', 'Black', '635', '1234567', '02-2025', '123456', '02-2025', '123456', '02-2025', '2024-03-13 20:53:13'),
(00000000002, 00000000003, 00000000005, 'toytoa', '2018', 'red', '395959559', '3959556959', '09/2023', '49449', '09/2023', '3944949', '09/2034', '2024-03-16 14:59:38');

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
(00000001, 00000001, 00000001, 930, 10, 0, 0, 50, 'Corrected', '2024-02-23 07:56:48'),
(00000002, 00000002, 00000001, 950, 0, 0, 50, 0, 'Pending', '2024-02-24 07:06:19'),
(00000003, 00000003, 00000001, 1040, 3, 4, 5, 6, 'Pending', '2024-02-24 22:48:12'),
(00000004, 00000004, 00000001, 8280, 0, 0, 0, 0, 'Pending', '2024-02-24 23:07:58'),
(00000005, 00000005, 00000001, 12555, 0, 0, 0, 0, 'Pending', '2024-02-24 23:14:46'),
(00000006, 00000006, 00000001, 500, 0, 0, 0, 0, 'Corrected', '2024-05-04 10:36:30');

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
(00000001, 00000001, 00000000, 00000001, 930, 10, 0, 0, 50, '990', 198, 'unpaid', '2024-02-23 03:31:06'),
(00000002, 00000005, 00000000, 00000001, 12555, 0, 0, 0, 0, '12555', 2511, 'unpaid', '2024-03-18 20:01:03'),
(00000003, 00000006, 00000000, 00000001, 500, 0, 0, 0, 0, '500', 100, 'unpaid', '2024-05-02 09:07:07'),
(00000004, 00000004, 00000000, 00000001, 8280, 0, 0, 0, 0, '8280', 1656, 'unpaid', '2024-05-02 09:09:02');

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
(00000001, 00000000006, 00000000002, 00000000001, '', 930, 30, 0, 0, 0, 0, 'Completed', '2024-02-23 03:31:06'),
(00000004, 00000000014, 00000000001, 00000000001, '', 8280, 0, 0, 0, 0, 0, 'Completed', '2024-05-02 09:09:02'),
(00000005, 00000000015, 00000000001, 00000000001, '', 12555, 2, 0, 0, 0, 0, 'Completed', '2024-03-18 20:01:03'),
(00000006, 00000000038, 00000000001, 00000000001, '', 500, 0, 0, 0, 0, 0, 'Completed', '2024-05-02 09:07:07'),
(00000007, 00000000036, 00000000003, 00000000001, '', 0, 0, 0, 0, 0, 0, 'waiting', '2024-05-03 16:43:06'),
(00000008, 00000000009, 00000000002, 00000000001, '', 0, 0, 0, 0, 0, 120, 'waiting', '2024-05-05 00:52:03'),
(00000009, 00000000037, 00000000001, 00000000009, '', 500, 30, 10, 20, 50, 0, 'waiting', '2024-05-05 00:53:01');

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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `sender_id`, `receiver_id`, `message`, `sent_at`) VALUES
(1, 1, 1, 'Hi', '2024-02-25 07:29:08'),
(2, 1, 1, 'No Pob', '2024-02-25 07:29:14'),
(3, 1, 1, 'fgg', '2024-05-03 16:14:47'),
(4, 1, 1, 'ffg', '2024-05-03 16:15:58'),
(5, 1, 1, 'bcbf', '2024-05-03 16:16:05'),
(6, 1, 1, 'x', '2024-05-03 16:19:28'),
(7, 1, 1, 'sss', '2024-05-03 16:19:33');

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
  `1_4p` int(10) NOT NULL,
  `1_4e` int(10) NOT NULL,
  `5_6p` int(10) NOT NULL,
  `7p` int(10) NOT NULL,
  `8p` int(10) NOT NULL,
  `9p` int(10) NOT NULL,
  `10_14p` int(10) NOT NULL,
  `15_16p` int(10) NOT NULL,
  `date_add_pm` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_postcode`
--

CREATE TABLE `price_postcode` (
  `pp_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `pickup` varchar(55) NOT NULL,
  `dropoff` varchar(55) NOT NULL,
  `1_4p` int(10) NOT NULL,
  `1_4e` int(10) NOT NULL,
  `5_6p` int(10) NOT NULL,
  `7p` int(10) NOT NULL,
  `8p` int(10) NOT NULL,
  `9p` int(10) NOT NULL,
  `10_14p` int(10) NOT NULL,
  `15_16p` int(10) NOT NULL,
  `date_add_pp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(00000001, 'Atiq', 'Ramzan', 'admin@prenero.com', '2c29030971430433fc33d0ab2f9658a2', '+923157524000', 'Male', 'Owner', 'Shop # 24, Hamza Market, Sargodha Road', 'Faisalabad', 'Punjab', 134, 38000, '33102-1457353-9', '65d78e4408f10_1708625476.jpg', '2024-04-22 15:31:22');

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
(00000000001, 'Saloon', 4, 1, 0, 0, 0, 50, 'toyota-prius.png', '2024-02-03 21:08:12'),
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
(00000001, 00000001, '65f1f95f3aa3e.jpg', '65f1fa7ecb099.jpg', '65f5acaee1f7b.png', '65f1fd73a5607.jpg', '65f5619ad1036.png', '65f561a736e6a.png', '65f561b13747a.png', '65f561b9225dc.png', '65f561c6df664.png', '65f561cfb4264.png', '2024-03-08 06:55:06'),
(00000002, 00000008, '', '', '', '', '', '', '', '', '', '', '2024-05-04 10:06:01'),
(00000003, 00000007, '', '', '', '', '', '', '', '', '', '', '2024-05-04 10:21:56'),
(00000004, 00000009, '', '', '', '', '', '', '', '', '', '', '2024-05-04 10:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `zone_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `starting_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `distance` varchar(255) NOT NULL,
  `fare` varchar(255) NOT NULL,
  `zone_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `starting_point`, `end_point`, `distance`, `fare`, `zone_date`) VALUES
(00000000001, 'Large, popular zoo established in 1872 with an aviary, camel & pony rides & a restaurant.', 'Shahrah-e-Quaid-e-Azam, Mozang Chungi, Lahore, Punjab 54000, Pakistan', '85', '500', '2024-03-19 08:17:09'),
(00000000002, 'Large, popular zoo established in 1872 with an aviary, camel & pony rides & a restaurant.', 'Shahrah-e-Quaid-e-Azam, Mozang Chungi, Lahore, Punjab 54000, Pakistan', '85', '4666', '2024-03-19 08:17:23'),
(00000000003, 'Large, popular zoo established in 1872 with an aviary, camel & pony rides & a restaurant.', 'Shahrah-e-Quaid-e-Azam, Mozang Chungi, Lahore, Punjab 54000, Pakistan', '83', '3456', '2024-03-19 08:26:39'),
(00000000004, '', '', '', '', '2024-05-01 12:30:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_id`);

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
  ADD PRIMARY KEY (`book_id`) USING BTREE;

--
-- Indexes for table `booking_type`
--
ALTER TABLE `booking_type`
  ADD PRIMARY KEY (`b_type_id`);

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
-- Indexes for table `delete_customers`
--
ALTER TABLE `delete_customers`
  ADD PRIMARY KEY (`del_id`);

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
  MODIFY `log_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `ap_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `availability_times`
--
ALTER TABLE `availability_times`
  MODIFY `at_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `booking_type`
--
ALTER TABLE `booking_type`
  MODIFY `b_type_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  MODIFY `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `delete_customers`
--
ALTER TABLE `delete_customers`
  MODIFY `del_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `des_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `driver_accounts`
--
ALTER TABLE `driver_accounts`
  MODIFY `ac_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_bank_details`
--
ALTER TABLE `driver_bank_details`
  MODIFY `d_bank_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver_documents`
--
ALTER TABLE `driver_documents`
  MODIFY `dd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2732;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `dv_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fares`
--
ALTER TABLE `fares`
  MODIFY `fare_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mg_charges`
--
ALTER TABLE `mg_charges`
  MODIFY `mg_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `pay_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_by_location`
--
ALTER TABLE `price_by_location`
  MODIFY `pbl_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_mile`
--
ALTER TABLE `price_mile`
  MODIFY `pm_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_postcode`
--
ALTER TABLE `price_postcode`
  MODIFY `pp_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `railway_stations`
--
ALTER TABLE `railway_stations`
  MODIFY `rail_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `rev_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `special_dates`
--
ALTER TABLE `special_dates`
  MODIFY `dt_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vehicle_documents`
--
ALTER TABLE `vehicle_documents`
  MODIFY `vd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
