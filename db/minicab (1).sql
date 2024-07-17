-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2024 at 10:45 AM
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
(00000009, 'New Driver Added', '2024-07-15 11:02:02', 'user', 00000002, 'New Driver Atiq Ramzan Has been Added by Controller.'),
(00000010, 'Driver Verified', '2024-07-15 11:19:05', 'user', 00000001, 'Driver 00000002 Has Been verified by Controller.');

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
(00000002, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-07-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Personel', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-06-11 16:06:34');

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
(00000001, 'Atiq Ramzan', 'prenero12@gmail.com', '+923127346634', '6266a', '', '', '', '', '', '', '', 0, '', '', 0, 0, 0, 2, '2024-06-10 23:05:33');

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
(00000001, 'Atiq Ramzan', 'prenero12@gmail.com', '+923127346634', '6266a', '', '', '', '', '', 1, '2024-07-14 08:58:31');

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
(00000001, 'Azib Ali', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', 'London ', 'WJ1234', '669212c35f56b_booker_app.png', 'Male', 'English', 'Bermingham', '1234567', '', '', 'online', 1, 0, '2024-07-13 05:39:57'),
(00000002, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'asdf1234', '', 'W12', '', 'Male', 'English', 'Bermingham', '', '', '', '', 1, 0, '0000-00-00 00:00:00');

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
(00000002, 00000002, '', '', '', '', '', '', '', '', '2024-07-15 11:02:02');

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
(301, 00000001, '51.61335', '-0.17574', '2024-06-12 12:55:34'),
(302, 00000001, '31.4414973', '73.088642', '2024-07-08 14:56:40'),
(303, 00000001, '31.441487', '73.0886342', '2024-07-08 14:56:50'),
(304, 00000001, '31.4414851', '73.088634', '2024-07-08 14:57:00'),
(305, 00000001, '31.4414867', '73.0886402', '2024-07-08 14:57:09'),
(306, 00000001, '31.4414883', '73.0886401', '2024-07-08 14:57:20'),
(307, 00000001, '31.4414857', '73.0886349', '2024-07-08 14:57:30'),
(308, 00000001, '31.4414875', '73.0886362', '2024-07-08 14:57:40'),
(309, 00000001, '31.4367427', '73.0894774', '2024-07-12 08:49:04'),
(310, 00000001, '31.4367404', '73.089473', '2024-07-12 08:49:40'),
(311, 00000001, '31.436739', '73.089488', '2024-07-12 08:49:48'),
(312, 00000001, '31.4367402', '73.0894722', '2024-07-12 08:50:03'),
(313, 00000001, '31.4367403', '73.0894701', '2024-07-12 08:50:13'),
(314, 00000001, '31.4367404', '73.0894702', '2024-07-12 08:50:30'),
(315, 00000001, '31.4367404', '73.0894702', '2024-07-12 08:50:30'),
(316, 00000001, '31.4367398', '73.0894791', '2024-07-12 08:50:39'),
(317, 00000001, '31.4367407', '73.0894696', '2024-07-12 08:50:49'),
(318, 00000001, '31.4367406', '73.0894748', '2024-07-12 08:50:59'),
(319, 00000001, '31.4367421', '73.0894797', '2024-07-12 08:51:09'),
(320, 00000001, '31.4367423', '73.0894743', '2024-07-12 08:51:19'),
(321, 00000001, '31.4367423', '73.089476', '2024-07-12 08:51:29'),
(322, 00000001, '31.4367423', '73.0894743', '2024-07-12 08:51:39'),
(323, 00000001, '31.4367423', '73.089476', '2024-07-12 08:51:49'),
(324, 00000001, '31.4367423', '73.0894743', '2024-07-12 08:51:59'),
(325, 00000001, '31.4367424', '73.0894744', '2024-07-12 08:52:09'),
(326, 00000001, '31.4367424', '73.0894744', '2024-07-12 08:52:19'),
(327, 00000001, '31.4367406', '73.0894729', '2024-07-12 08:52:34'),
(328, 00000001, '31.4367394', '73.0894775', '2024-07-12 08:52:39'),
(329, 00000001, '31.4367388', '73.0894792', '2024-07-12 08:52:49'),
(330, 00000001, '31.4367314', '73.0894951', '2024-07-12 08:52:58'),
(331, 00000001, '31.4367338', '73.089494', '2024-07-12 08:53:09'),
(332, 00000001, '31.4367338', '73.089494', '2024-07-12 08:53:18'),
(333, 00000001, '31.4367417', '73.0894753', '2024-07-12 08:53:36'),
(334, 00000001, '31.4367404', '73.0894742', '2024-07-12 08:53:41'),
(335, 00000001, '31.4367406', '73.0894742', '2024-07-12 08:53:51'),
(336, 00000001, '31.4367414', '73.0894749', '2024-07-12 08:54:01'),
(337, 00000001, '31.4367412', '73.0894746', '2024-07-12 08:54:08'),
(338, 00000001, '31.4367437', '73.089476', '2024-07-12 08:54:26'),
(339, 00000001, '31.4367437', '73.089476', '2024-07-12 08:54:28'),
(340, 00000001, '31.4367406', '73.0894742', '2024-07-12 08:54:48'),
(341, 00000001, '31.4367406', '73.0894742', '2024-07-12 08:54:48'),
(342, 00000001, '31.4367412', '73.0894746', '2024-07-12 08:54:58'),
(343, 00000001, '31.4367414', '73.0894749', '2024-07-12 08:55:08'),
(344, 00000001, '31.4367416', '73.0894752', '2024-07-12 08:55:18'),
(345, 00000001, '31.4367421', '73.0894766', '2024-07-12 08:55:33'),
(346, 00000001, '31.4367421', '73.0894766', '2024-07-12 08:55:38'),
(347, 00000001, '31.4367419', '73.0894764', '2024-07-12 08:55:48'),
(348, 00000001, '31.4367408', '73.0894746', '2024-07-12 08:55:58'),
(349, 00000001, '31.4367411', '73.0894749', '2024-07-12 08:56:08'),
(350, 00000001, '31.4367416', '73.0894754', '2024-07-12 08:56:18'),
(351, 00000001, '31.4367408', '73.0894745', '2024-07-12 08:56:28'),
(352, 00000001, '31.4367411', '73.0894747', '2024-07-12 08:56:39'),
(353, 00000001, '31.4367411', '73.0894747', '2024-07-12 08:56:48'),
(354, 00000001, '31.4367408', '73.0894745', '2024-07-12 08:57:00'),
(355, 00000001, '31.4367411', '73.0894747', '2024-07-12 08:57:08'),
(356, 00000001, '31.4367426', '73.0894742', '2024-07-12 08:57:20'),
(357, 00000001, '31.436741', '73.0894752', '2024-07-12 08:57:35'),
(358, 00000001, '31.436741', '73.0894752', '2024-07-12 08:57:38'),
(359, 00000001, '31.4367413', '73.0894755', '2024-07-12 08:57:48'),
(360, 00000001, '31.4367421', '73.0894745', '2024-07-12 08:58:00'),
(361, 00000001, '31.4367424', '73.0894744', '2024-07-12 08:58:08'),
(362, 00000001, '31.4367417', '73.089476', '2024-07-12 08:58:20'),
(363, 00000001, '31.4367408', '73.0894747', '2024-07-12 08:58:35'),
(364, 00000001, '31.4367408', '73.0894747', '2024-07-12 08:58:38'),
(365, 00000001, '31.4367408', '73.0894747', '2024-07-12 08:58:48'),
(366, 00000001, '31.4367403', '73.0894743', '2024-07-12 08:59:04'),
(367, 00000001, '31.4367403', '73.0894743', '2024-07-12 08:59:08'),
(368, 00000001, '31.4367402', '73.0894745', '2024-07-12 08:59:18'),
(369, 00000001, '31.4367407', '73.0894749', '2024-07-12 08:59:28'),
(370, 00000001, '31.4367421', '73.0894745', '2024-07-12 08:59:48'),
(371, 00000001, '31.4367421', '73.0894745', '2024-07-12 08:59:49'),
(372, 00000001, '31.4367408', '73.0894746', '2024-07-12 08:59:58'),
(373, 00000001, '31.4367405', '73.0894746', '2024-07-12 09:00:12'),
(374, 00000001, '31.436741', '73.0894753', '2024-07-12 09:00:18'),
(375, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:00:28'),
(376, 00000001, '31.436741', '73.0894752', '2024-07-12 09:00:38'),
(377, 00000001, '31.4367413', '73.0894755', '2024-07-12 09:00:48'),
(378, 00000001, '31.4367405', '73.0894744', '2024-07-12 09:00:59'),
(379, 00000001, '31.4367413', '73.0894755', '2024-07-12 09:01:14'),
(380, 00000001, '31.4367413', '73.0894755', '2024-07-12 09:01:18'),
(381, 00000001, '31.4367419', '73.0894768', '2024-07-12 09:01:28'),
(382, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:01:39'),
(383, 00000001, '31.4367402', '73.0894745', '2024-07-12 09:01:48'),
(384, 00000001, '31.4367405', '73.0894744', '2024-07-12 09:01:58'),
(385, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:02:08'),
(386, 00000001, '31.4367401', '73.0894748', '2024-07-12 09:02:18'),
(387, 00000001, '31.4367413', '73.0894745', '2024-07-12 09:02:28'),
(388, 00000001, '31.4367419', '73.0894758', '2024-07-12 09:02:40'),
(389, 00000001, '31.4367405', '73.0894745', '2024-07-12 09:02:50'),
(390, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:03:01'),
(391, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:03:08'),
(392, 00000001, '31.4367405', '73.0894745', '2024-07-12 09:03:18'),
(393, 00000001, '31.4367403', '73.0894743', '2024-07-12 09:03:28'),
(394, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:03:38'),
(395, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:03:55'),
(396, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:03:58'),
(397, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:04:15'),
(398, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:04:20'),
(399, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:04:28'),
(400, 00000001, '31.4367402', '73.0894744', '2024-07-12 09:04:38'),
(401, 00000001, '31.4367403', '73.0894743', '2024-07-12 09:04:48'),
(402, 00000001, '31.4367403', '73.0894743', '2024-07-12 09:04:58'),
(403, 00000001, '31.4367403', '73.0894743', '2024-07-12 09:05:10'),
(404, 00000001, '31.4367415', '73.0894761', '2024-07-12 09:05:20'),
(405, 00000001, '31.4367416', '73.0894762', '2024-07-12 09:05:36'),
(406, 00000001, '31.4367416', '73.0894762', '2024-07-12 09:05:38'),
(407, 00000001, '31.43674', '73.0894748', '2024-07-12 09:05:55'),
(408, 00000001, '31.43674', '73.0894748', '2024-07-12 09:05:58'),
(409, 00000001, '31.4367407', '73.0894769', '2024-07-12 09:06:08'),
(410, 00000001, '31.4367419', '73.0894759', '2024-07-12 09:06:18'),
(411, 00000001, '31.4367419', '73.0894759', '2024-07-12 09:06:28'),
(412, 00000001, '31.43674', '73.0894748', '2024-07-12 09:06:46'),
(413, 00000001, '31.4367419', '73.0894758', '2024-07-12 09:06:51'),
(414, 00000001, '31.4367419', '73.0894758', '2024-07-12 09:06:58'),
(415, 00000001, '31.4367402', '73.0894745', '2024-07-12 09:07:16'),
(416, 00000001, '31.436738', '73.0894741', '2024-07-12 09:07:26'),
(417, 00000001, '31.436738', '73.0894741', '2024-07-12 09:07:28'),
(418, 00000001, '31.4414449', '73.0885334', '2024-07-13 15:51:12'),
(419, 00000001, '31.4414501', '73.0884999', '2024-07-13 15:51:22'),
(420, 00000001, '31.4414546', '73.0885046', '2024-07-13 15:51:31'),
(421, 00000001, '31.4414499', '73.0884999', '2024-07-13 15:51:42'),
(422, 00000001, '31.44145', '73.0885', '2024-07-13 15:51:51'),
(423, 00000001, '31.44145', '73.0885', '2024-07-13 15:52:01'),
(424, 00000001, '31.4416011', '73.0887241', '2024-07-13 15:52:12'),
(425, 00000001, '31.4415631', '73.0886038', '2024-07-13 15:52:22'),
(426, 00000001, '31.4415696', '73.0884967', '2024-07-13 15:52:31'),
(427, 00000001, '31.4415473', '73.0884513', '2024-07-13 15:52:41'),
(428, 00000001, '31.441497', '73.088455', '2024-07-13 15:52:51'),
(429, 00000001, '31.4414339', '73.0884822', '2024-07-13 15:53:02'),
(430, 00000001, '31.4415012', '73.0886066', '2024-07-13 15:53:11'),
(431, 00000001, '31.4414542', '73.0886537', '2024-07-13 15:53:22'),
(432, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(433, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(434, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(435, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(436, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(437, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(438, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(439, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(440, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(441, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(442, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(443, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:44'),
(444, 00000001, '31.441455', '73.0886533', '2024-07-13 15:55:54'),
(445, 00000001, '31.441455', '73.0886533', '2024-07-13 15:56:09'),
(446, 00000001, '31.441455', '73.0886533', '2024-07-13 15:56:19'),
(447, 00000001, '31.441455', '73.0886533', '2024-07-13 15:56:29'),
(448, 00000001, '31.441455', '73.0886533', '2024-07-13 15:56:39'),
(449, 00000001, '31.441455', '73.0886533', '2024-07-13 15:56:49'),
(450, 00000001, '31.4414942', '73.0886451', '2024-07-13 15:57:09'),
(451, 00000001, '31.4414928', '73.0886445', '2024-07-13 15:57:20'),
(452, 00000001, '31.4414954', '73.0886428', '2024-07-13 15:57:29'),
(453, 00000001, '31.4414882', '73.0886445', '2024-07-13 15:57:39'),
(454, 00000001, '31.4414923', '73.0886464', '2024-07-13 15:57:49'),
(455, 00000001, '31.4414904', '73.0886475', '2024-07-13 15:57:59'),
(456, 00000001, '31.4414884', '73.0886454', '2024-07-13 15:58:09'),
(457, 00000001, '31.4414923', '73.0886462', '2024-07-13 15:58:13'),
(458, 00000001, '31.4414923', '73.0886462', '2024-07-13 15:58:19'),
(459, 00000001, '31.4414923', '73.0886462', '2024-07-13 15:58:22'),
(460, 00000001, '31.4414923', '73.088646', '2024-07-13 15:58:31'),
(461, 00000001, '31.4414923', '73.088646', '2024-07-13 15:58:32'),
(462, 00000001, '31.4414882', '73.0886055', '2024-07-13 15:58:39'),
(463, 00000001, '31.4414882', '73.0886055', '2024-07-13 15:58:42'),
(464, 00000001, '31.4414337', '73.0886208', '2024-07-13 07:50:09'),
(465, 00000001, '31.4412941', '73.0889169', '2024-07-13 07:50:27'),
(466, 00000001, '31.4412941', '73.0889169', '2024-07-13 07:50:27'),
(467, 00000001, '31.4412941', '73.0889169', '2024-07-13 07:50:27'),
(468, 00000001, '31.4412941', '73.0889169', '2024-07-13 07:50:27'),
(469, 00000001, '31.4412941', '73.0889169', '2024-07-13 07:50:27'),
(470, 00000001, '31.4412941', '73.0889169', '2024-07-13 07:50:27'),
(471, 00000001, '31.4412941', '73.0889169', '2024-07-13 07:50:27'),
(472, 00000001, '31.4413495', '73.0886596', '2024-07-13 07:50:29'),
(473, 00000001, '31.4413602', '73.0886161', '2024-07-13 07:50:29'),
(474, 00000001, '31.4413602', '73.0886161', '2024-07-13 07:50:30'),
(475, 00000001, '31.4413546', '73.0885824', '2024-07-13 07:50:30'),
(476, 00000001, '31.4413528', '73.088558', '2024-07-13 07:50:32'),
(477, 00000001, '31.4413708', '73.0885505', '2024-07-13 07:50:33'),
(478, 00000001, '31.4413708', '73.0885505', '2024-07-13 07:50:33'),
(479, 00000001, '31.4413947', '73.0885454', '2024-07-13 07:50:34'),
(480, 00000001, '31.4414109', '73.0885553', '2024-07-13 07:50:35'),
(481, 00000001, '31.4414162', '73.0885577', '2024-07-13 07:50:36'),
(482, 00000001, '31.4414113', '73.0885503', '2024-07-13 07:50:39'),
(483, 00000001, '31.4414073', '73.0885553', '2024-07-13 07:50:39'),
(484, 00000001, '31.4414024', '73.0885766', '2024-07-13 07:50:39'),
(485, 00000001, '31.4414024', '73.0885766', '2024-07-13 07:50:40'),
(486, 00000001, '31.4413929', '73.0886382', '2024-07-13 07:50:43'),
(487, 00000001, '31.4414024', '73.0885766', '2024-07-13 07:50:45'),
(488, 00000001, '31.4413918', '73.08865', '2024-07-13 07:50:46'),
(489, 00000001, '31.4413921', '73.0886471', '2024-07-13 07:50:46'),
(490, 00000001, '31.4413921', '73.0886459', '2024-07-13 07:50:49'),
(491, 00000001, '31.4413918', '73.08865', '2024-07-13 07:50:50'),
(492, 00000001, '31.4413929', '73.0886382', '2024-07-13 07:50:51'),
(493, 00000001, '31.4413918', '73.08865', '2024-07-13 07:50:52'),
(494, 00000001, '31.4413918', '73.08865', '2024-07-13 07:50:52'),
(495, 00000001, '31.441405', '73.0886432', '2024-07-13 07:50:53'),
(496, 00000001, '31.441405', '73.0886432', '2024-07-13 07:50:53'),
(497, 00000001, '31.4413918', '73.08865', '2024-07-13 07:50:53'),
(498, 00000001, '31.441405', '73.0886432', '2024-07-13 07:50:53'),
(499, 00000001, '31.441406', '73.0886427', '2024-07-13 07:50:54'),
(500, 00000001, '31.441406', '73.0886427', '2024-07-13 07:50:55'),
(501, 00000001, '31.441406', '73.0886427', '2024-07-13 07:50:56'),
(502, 00000001, '31.441406', '73.0887043', '2024-07-13 07:51:01'),
(503, 00000001, '31.441406', '73.0887043', '2024-07-13 07:51:03'),
(504, 00000001, '31.441406', '73.0887043', '2024-07-13 07:51:03'),
(505, 00000001, '31.441406', '73.0887043', '2024-07-13 07:51:04'),
(506, 00000001, '31.4414059', '73.0887072', '2024-07-13 07:51:06'),
(507, 00000001, '31.4414102', '73.0887221', '2024-07-13 07:51:07'),
(508, 00000001, '31.4414102', '73.0887221', '2024-07-13 07:51:07'),
(509, 00000001, '31.4414111', '73.0887307', '2024-07-13 07:51:08'),
(510, 00000001, '31.4414112', '73.0887336', '2024-07-13 07:51:09'),
(511, 00000001, '31.4414142', '73.0887361', '2024-07-13 07:51:09'),
(512, 00000001, '31.4414137', '73.0887353', '2024-07-13 07:51:10'),
(513, 00000001, '31.4414142', '73.0887361', '2024-07-13 07:51:11'),
(514, 00000001, '31.4414142', '73.0887361', '2024-07-13 07:51:12'),
(515, 00000001, '31.4414142', '73.0887361', '2024-07-13 07:51:12'),
(516, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:18'),
(517, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:18'),
(518, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:18'),
(519, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:18'),
(520, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:18'),
(521, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:18'),
(522, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:19'),
(523, 00000001, '31.4414933', '73.088645', '2024-07-13 07:51:22'),
(524, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:22'),
(525, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:22'),
(526, 00000001, '31.4414933', '73.088645', '2024-07-13 07:51:23'),
(527, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:23'),
(528, 00000001, '31.4414915', '73.0886471', '2024-07-13 07:51:23'),
(529, 00000001, '31.4414933', '73.088645', '2024-07-13 07:51:23'),
(530, 00000001, '31.4414933', '73.088645', '2024-07-13 07:51:24'),
(531, 00000001, '31.4414933', '73.088645', '2024-07-13 07:51:24'),
(532, 00000001, '31.4414933', '73.088645', '2024-07-13 07:51:25'),
(533, 00000001, '31.4414933', '73.088645', '2024-07-13 07:51:29'),
(534, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:51:29'),
(535, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:51:30'),
(536, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:51:31'),
(537, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:32'),
(538, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:33'),
(539, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:51:33'),
(540, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:35'),
(541, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:38'),
(542, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:38'),
(543, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:39'),
(544, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:41'),
(545, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:41'),
(546, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:41'),
(547, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:41'),
(548, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:42'),
(549, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:43'),
(550, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:51:43'),
(551, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:43'),
(552, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:44'),
(553, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:44'),
(554, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:45'),
(555, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:46'),
(556, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:49'),
(557, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:49'),
(558, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:50'),
(559, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:50'),
(560, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:51:52'),
(561, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:51:53'),
(562, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:51:53'),
(563, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:51:54'),
(564, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:51:55'),
(565, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:51:55'),
(566, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:51:56'),
(567, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:59'),
(568, 00000001, '31.441492', '73.0886465', '2024-07-13 07:51:59'),
(569, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:00'),
(570, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:00'),
(571, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:02'),
(572, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:03'),
(573, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:04'),
(574, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:04'),
(575, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:04'),
(576, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:05'),
(577, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:06'),
(578, 00000001, '31.4414915', '73.0886386', '2024-07-13 07:52:09'),
(579, 00000001, '31.4414915', '73.0886386', '2024-07-13 07:52:09'),
(580, 00000001, '31.4414915', '73.0886386', '2024-07-13 07:52:10'),
(581, 00000001, '31.4414915', '73.0886386', '2024-07-13 07:52:11'),
(582, 00000001, '31.4414919', '73.0886462', '2024-07-13 07:52:12'),
(583, 00000001, '31.4414919', '73.0886462', '2024-07-13 07:52:13'),
(584, 00000001, '31.4414919', '73.0886462', '2024-07-13 07:52:13'),
(585, 00000001, '31.4414919', '73.0886462', '2024-07-13 07:52:14'),
(586, 00000001, '31.4414919', '73.0886462', '2024-07-13 07:52:14'),
(587, 00000001, '31.4414919', '73.0886462', '2024-07-13 07:52:15'),
(588, 00000001, '31.4414919', '73.0886462', '2024-07-13 07:52:16'),
(589, 00000001, '31.441492', '73.0886466', '2024-07-13 07:52:19'),
(590, 00000001, '31.441492', '73.0886466', '2024-07-13 07:52:19'),
(591, 00000001, '31.441492', '73.0886466', '2024-07-13 07:52:20'),
(592, 00000001, '31.441492', '73.0886466', '2024-07-13 07:52:20'),
(593, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:22'),
(594, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:23'),
(595, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:23'),
(596, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:24'),
(597, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:24'),
(598, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:25'),
(599, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:26'),
(600, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:29'),
(601, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:29'),
(602, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:30'),
(603, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:30'),
(604, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:36'),
(605, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:36'),
(606, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:36'),
(607, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:36'),
(608, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:36'),
(609, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:36'),
(610, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:36'),
(611, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:39'),
(612, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:39'),
(613, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:40'),
(614, 00000001, '31.441491', '73.0886393', '2024-07-13 07:52:40'),
(615, 00000001, '31.4414919', '73.0886464', '2024-07-13 07:52:42'),
(616, 00000001, '31.4414919', '73.0886464', '2024-07-13 07:52:43'),
(617, 00000001, '31.4414919', '73.0886464', '2024-07-13 07:52:43'),
(618, 00000001, '31.4414919', '73.0886464', '2024-07-13 07:52:44'),
(619, 00000001, '31.4414919', '73.0886464', '2024-07-13 07:52:44'),
(620, 00000001, '31.4414919', '73.0886464', '2024-07-13 07:52:45'),
(621, 00000001, '31.4414919', '73.0886464', '2024-07-13 07:52:46'),
(622, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:52:49'),
(623, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:52:49'),
(624, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:52:50'),
(625, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:52:50'),
(626, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:52'),
(627, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:53'),
(628, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:53'),
(629, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:54'),
(630, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:54'),
(631, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:55'),
(632, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:56'),
(633, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:59'),
(634, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:59'),
(635, 00000001, '31.441492', '73.0886465', '2024-07-13 07:52:59'),
(636, 00000001, '31.441492', '73.0886465', '2024-07-13 07:53:00'),
(637, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:02'),
(638, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:03'),
(639, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:03'),
(640, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:04'),
(641, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:04'),
(642, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:05'),
(643, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:06'),
(644, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:09'),
(645, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:09'),
(646, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:10'),
(647, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:10'),
(648, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:12'),
(649, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:13'),
(650, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:13'),
(651, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:14'),
(652, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:14'),
(653, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:15'),
(654, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:16'),
(655, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:19'),
(656, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:19'),
(657, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:20'),
(658, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:20'),
(659, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:22'),
(660, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:23'),
(661, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:23'),
(662, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:24'),
(663, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:24'),
(664, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:25'),
(665, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:26'),
(666, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:29'),
(667, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:29'),
(668, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:30'),
(669, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:30'),
(670, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:32'),
(671, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:33'),
(672, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:33'),
(673, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:34'),
(674, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:34'),
(675, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:35'),
(676, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:36'),
(677, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:39'),
(678, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:39'),
(679, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:40'),
(680, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:40'),
(681, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:42'),
(682, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:43'),
(683, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:43'),
(684, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:44'),
(685, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:45'),
(686, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:45'),
(687, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:53:49'),
(688, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(689, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(690, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(691, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(692, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(693, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(694, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(695, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(696, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:57'),
(697, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:58'),
(698, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:58'),
(699, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:59'),
(700, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:53:59'),
(701, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:00'),
(702, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:00'),
(703, 00000001, '31.4414911', '73.0886402', '2024-07-13 07:54:02'),
(704, 00000001, '31.4414911', '73.0886402', '2024-07-13 07:54:03'),
(705, 00000001, '31.4414911', '73.0886402', '2024-07-13 07:54:03'),
(706, 00000001, '31.4414911', '73.0886402', '2024-07-13 07:54:04'),
(707, 00000001, '31.4414911', '73.0886402', '2024-07-13 07:54:04'),
(708, 00000001, '31.4414911', '73.0886402', '2024-07-13 07:54:05'),
(709, 00000001, '31.4414911', '73.0886402', '2024-07-13 07:54:06'),
(710, 00000001, '31.4414921', '73.0886462', '2024-07-13 07:54:09'),
(711, 00000001, '31.4414921', '73.0886462', '2024-07-13 07:54:10'),
(712, 00000001, '31.4414921', '73.0886462', '2024-07-13 07:54:11'),
(713, 00000001, '31.4414921', '73.0886462', '2024-07-13 07:54:12'),
(714, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:54:13'),
(715, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:54:14'),
(716, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:54:14'),
(717, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:54:15'),
(718, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:54:16'),
(719, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:54:16'),
(720, 00000001, '31.4414921', '73.0886465', '2024-07-13 07:54:17'),
(721, 00000001, '31.441492', '73.0886465', '2024-07-13 07:54:19'),
(722, 00000001, '31.441492', '73.0886465', '2024-07-13 07:54:19'),
(723, 00000001, '31.441492', '73.0886465', '2024-07-13 07:54:20'),
(724, 00000001, '31.441492', '73.0886465', '2024-07-13 07:54:20'),
(725, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:54:22'),
(726, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:54:23'),
(727, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:54:24'),
(728, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:54:24'),
(729, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:54:24'),
(730, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:54:26'),
(731, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:54:26'),
(732, 00000001, '31.4414925', '73.08865', '2024-07-13 07:54:29'),
(733, 00000001, '31.4414925', '73.08865', '2024-07-13 07:54:29'),
(734, 00000001, '31.4414925', '73.08865', '2024-07-13 07:54:29'),
(735, 00000001, '31.4414925', '73.08865', '2024-07-13 07:54:30'),
(736, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:32'),
(737, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:33'),
(738, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:33'),
(739, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:34'),
(740, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:34'),
(741, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:35'),
(742, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:36'),
(743, 00000001, '31.4414898', '73.0886401', '2024-07-13 07:54:39'),
(744, 00000001, '31.4414898', '73.0886401', '2024-07-13 07:54:39'),
(745, 00000001, '31.4414898', '73.0886401', '2024-07-13 07:54:40'),
(746, 00000001, '31.4414898', '73.0886401', '2024-07-13 07:54:40'),
(747, 00000001, '31.4414921', '73.0886461', '2024-07-13 07:54:42'),
(748, 00000001, '31.4414921', '73.0886461', '2024-07-13 07:54:43'),
(749, 00000001, '31.4414921', '73.0886461', '2024-07-13 07:54:43'),
(750, 00000001, '31.4414921', '73.0886461', '2024-07-13 07:54:44'),
(751, 00000001, '31.4414921', '73.0886461', '2024-07-13 07:54:44'),
(752, 00000001, '31.4414921', '73.0886461', '2024-07-13 07:54:45'),
(753, 00000001, '31.4414921', '73.0886461', '2024-07-13 07:54:46'),
(754, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:49'),
(755, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:49'),
(756, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:50'),
(757, 00000001, '31.4414923', '73.0886464', '2024-07-13 07:54:51'),
(758, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:52'),
(759, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:52'),
(760, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:53'),
(761, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:54'),
(762, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:54'),
(763, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:55'),
(764, 00000001, '31.4414921', '73.0886464', '2024-07-13 07:54:56'),
(765, 00000001, '31.4414923', '73.088646', '2024-07-13 07:54:59'),
(766, 00000001, '31.4414923', '73.088646', '2024-07-13 07:54:59'),
(767, 00000001, '31.4414923', '73.088646', '2024-07-13 07:54:59'),
(768, 00000001, '31.4414923', '73.088646', '2024-07-13 07:55:00'),
(769, 00000001, '31.4414923', '73.088646', '2024-07-13 07:55:02'),
(770, 00000001, '31.4414923', '73.088646', '2024-07-13 07:55:03'),
(771, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:06'),
(772, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:06'),
(773, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:06'),
(774, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:06'),
(775, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:06'),
(776, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:09'),
(777, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:09');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(778, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:09'),
(779, 00000001, '31.4414923', '73.0886463', '2024-07-13 07:55:10'),
(780, 00000001, '31.441492', '73.0886465', '2024-07-13 07:55:12'),
(781, 00000001, '31.441492', '73.0886465', '2024-07-13 07:55:13'),
(782, 00000001, '31.441492', '73.0886465', '2024-07-13 07:55:13'),
(783, 00000001, '31.441492', '73.0886465', '2024-07-13 07:55:14'),
(784, 00000001, '31.441492', '73.0886465', '2024-07-13 07:55:14'),
(785, 00000001, '31.441492', '73.0886465', '2024-07-13 07:55:15'),
(786, 00000001, '31.441492', '73.0886465', '2024-07-13 07:55:16'),
(787, 00000001, '31.4414932', '73.0886459', '2024-07-13 07:55:16'),
(788, 00000001, '31.4414932', '73.0886459', '2024-07-13 07:55:19'),
(789, 00000001, '31.4414932', '73.0886459', '2024-07-13 07:55:19'),
(790, 00000001, '31.4414932', '73.0886459', '2024-07-13 07:55:20'),
(791, 00000001, '31.4414932', '73.0886459', '2024-07-13 07:55:20'),
(792, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:26'),
(793, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:26'),
(794, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:26'),
(795, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:26'),
(796, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:26'),
(797, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:27'),
(798, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:29'),
(799, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:29'),
(800, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:29'),
(801, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:29'),
(802, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:30'),
(803, 00000001, '31.4414892', '73.0886455', '2024-07-13 07:55:30'),
(804, 00000001, '31.441493', '73.088646', '2024-07-13 07:55:32'),
(805, 00000001, '31.441493', '73.088646', '2024-07-13 07:55:33'),
(806, 00000001, '31.441493', '73.088646', '2024-07-13 07:55:33'),
(807, 00000001, '31.441493', '73.088646', '2024-07-13 07:55:34'),
(808, 00000001, '31.441493', '73.088646', '2024-07-13 07:55:34'),
(809, 00000001, '31.441493', '73.088646', '2024-07-13 07:55:35'),
(810, 00000001, '31.441493', '73.088646', '2024-07-13 07:55:36'),
(811, 00000001, '31.4414925', '73.0886458', '2024-07-13 07:55:39'),
(812, 00000001, '31.4414925', '73.0886458', '2024-07-13 07:55:40'),
(813, 00000001, '31.4414925', '73.0886458', '2024-07-13 07:55:40'),
(814, 00000001, '31.4414925', '73.0886458', '2024-07-13 07:55:40'),
(815, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:55:42'),
(816, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:55:43'),
(817, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:55:43'),
(818, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:55:44'),
(819, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:55:44'),
(820, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:55:45'),
(821, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:55:46'),
(822, 00000001, '31.4414889', '73.0886444', '2024-07-13 07:55:49'),
(823, 00000001, '31.4414889', '73.0886444', '2024-07-13 07:55:49'),
(824, 00000001, '31.4414889', '73.0886444', '2024-07-13 07:55:50'),
(825, 00000001, '31.4414889', '73.0886444', '2024-07-13 07:55:50'),
(826, 00000001, '31.4414889', '73.0886444', '2024-07-13 07:55:52'),
(827, 00000001, '31.4414924', '73.0886459', '2024-07-13 07:55:53'),
(828, 00000001, '31.4414924', '73.0886459', '2024-07-13 07:55:53'),
(829, 00000001, '31.4414924', '73.0886459', '2024-07-13 07:55:54'),
(830, 00000001, '31.4414924', '73.0886459', '2024-07-13 07:55:55'),
(831, 00000001, '31.4414924', '73.0886459', '2024-07-13 07:55:55'),
(832, 00000001, '31.4414924', '73.0886459', '2024-07-13 07:55:56'),
(833, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:01'),
(834, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:01'),
(835, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:01'),
(836, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:01'),
(837, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:02'),
(838, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:03'),
(839, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:04'),
(840, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:04'),
(841, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:04'),
(842, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:05'),
(843, 00000001, '31.4414929', '73.088646', '2024-07-13 07:56:06'),
(844, 00000001, '31.4414871', '73.088643', '2024-07-13 07:56:09'),
(845, 00000001, '31.4414871', '73.088643', '2024-07-13 07:56:09'),
(846, 00000001, '31.4414871', '73.088643', '2024-07-13 07:56:09'),
(847, 00000001, '31.4414871', '73.088643', '2024-07-13 07:56:10'),
(848, 00000001, '31.4414921', '73.0886455', '2024-07-13 07:56:12'),
(849, 00000001, '31.4414921', '73.0886455', '2024-07-13 07:56:13'),
(850, 00000001, '31.4414921', '73.0886455', '2024-07-13 07:56:13'),
(851, 00000001, '31.4414921', '73.0886455', '2024-07-13 07:56:14'),
(852, 00000001, '31.4414921', '73.0886455', '2024-07-13 07:56:15'),
(853, 00000001, '31.4414921', '73.0886455', '2024-07-13 07:56:15'),
(854, 00000001, '31.4414921', '73.0886455', '2024-07-13 07:56:16'),
(855, 00000001, '31.4414924', '73.0886457', '2024-07-13 07:56:19'),
(856, 00000001, '31.4414924', '73.0886457', '2024-07-13 07:56:19'),
(857, 00000001, '31.4414924', '73.0886457', '2024-07-13 07:56:19'),
(858, 00000001, '31.4414924', '73.0886457', '2024-07-13 07:56:20'),
(859, 00000001, '31.4414889', '73.0886449', '2024-07-13 07:56:22'),
(860, 00000001, '31.4414889', '73.0886449', '2024-07-13 07:56:23'),
(861, 00000001, '31.4414889', '73.0886449', '2024-07-13 07:56:23'),
(862, 00000001, '31.4414889', '73.0886449', '2024-07-13 07:56:24'),
(863, 00000001, '31.4414889', '73.0886449', '2024-07-13 07:56:25'),
(864, 00000001, '31.4414889', '73.0886449', '2024-07-13 07:56:25'),
(865, 00000001, '31.4414889', '73.0886449', '2024-07-13 07:56:26'),
(866, 00000001, '31.4414922', '73.0886456', '2024-07-13 07:56:29'),
(867, 00000001, '31.4414922', '73.0886456', '2024-07-13 07:56:29'),
(868, 00000001, '31.4414922', '73.0886456', '2024-07-13 07:56:30'),
(869, 00000001, '31.4414922', '73.0886456', '2024-07-13 07:56:31'),
(870, 00000001, '31.4414924', '73.0886456', '2024-07-13 07:56:32'),
(871, 00000001, '31.4414924', '73.0886456', '2024-07-13 07:56:33'),
(872, 00000001, '31.4414924', '73.0886456', '2024-07-13 07:56:33'),
(873, 00000001, '31.4414924', '73.0886456', '2024-07-13 07:56:33'),
(874, 00000001, '31.4414924', '73.0886456', '2024-07-13 07:56:34'),
(875, 00000001, '31.4414924', '73.0886456', '2024-07-13 07:56:34'),
(876, 00000001, '31.4414924', '73.0886456', '2024-07-13 07:56:35'),
(877, 00000001, '31.4414924', '73.0886456', '2024-07-13 07:56:36'),
(878, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:56:39'),
(879, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:56:39'),
(880, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:56:40'),
(881, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:56:40'),
(882, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:42'),
(883, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:43'),
(884, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:43'),
(885, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:43'),
(886, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:44'),
(887, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:44'),
(888, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:45'),
(889, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:46'),
(890, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:49'),
(891, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:49'),
(892, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:50'),
(893, 00000001, '31.4414922', '73.0886457', '2024-07-13 07:56:50'),
(894, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:56:53'),
(895, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:56:53'),
(896, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:56:53'),
(897, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:56:53'),
(898, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:56:54'),
(899, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:56:54'),
(900, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:56:55'),
(901, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:56:56'),
(902, 00000001, '31.441492', '73.0886465', '2024-07-13 07:56:59'),
(903, 00000001, '31.441492', '73.0886465', '2024-07-13 07:56:59'),
(904, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:00'),
(905, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:00'),
(906, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:02'),
(907, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:03'),
(908, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:03'),
(909, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:03'),
(910, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:04'),
(911, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:05'),
(912, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:05'),
(913, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:06'),
(914, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:09'),
(915, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:09'),
(916, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:10'),
(917, 00000001, '31.441492', '73.0886465', '2024-07-13 07:57:10'),
(918, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:12'),
(919, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:13'),
(920, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:13'),
(921, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:13'),
(922, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:14'),
(923, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:15'),
(924, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:15'),
(925, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:16'),
(926, 00000001, '31.4414925', '73.0886459', '2024-07-13 07:57:19'),
(927, 00000001, '31.4414925', '73.0886459', '2024-07-13 07:57:19'),
(928, 00000001, '31.4414925', '73.0886459', '2024-07-13 07:57:23'),
(929, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:42'),
(930, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(931, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(932, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(933, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(934, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(935, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(936, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(937, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(938, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(939, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(940, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(941, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:43'),
(942, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:44'),
(943, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:44'),
(944, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:44'),
(945, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:44'),
(946, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:44'),
(947, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:44'),
(948, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:44'),
(949, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:44'),
(950, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:45'),
(951, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:45'),
(952, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:45'),
(953, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:45'),
(954, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:45'),
(955, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:45'),
(956, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:45'),
(957, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:45'),
(958, 00000001, '31.4414925', '73.0886459', '2024-07-13 07:57:45'),
(959, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:46'),
(960, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:48'),
(961, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:57:49'),
(962, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:57:49'),
(963, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:57:50'),
(964, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:57:50'),
(965, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:52'),
(966, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:53'),
(967, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:53'),
(968, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:55'),
(969, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:55'),
(970, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:55'),
(971, 00000001, '31.4414923', '73.0886456', '2024-07-13 07:57:56'),
(972, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:59'),
(973, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:57:59'),
(974, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:58:00'),
(975, 00000001, '31.4414922', '73.0886458', '2024-07-13 07:58:01'),
(976, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:58:02'),
(977, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:58:03'),
(978, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:58:03'),
(979, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:58:04'),
(980, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:58:04'),
(981, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:58:05'),
(982, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:58:06'),
(983, 00000001, '31.4414198', '73.0885518', '2024-07-13 07:58:23'),
(984, 00000001, '31.441417', '73.0885876', '2024-07-13 07:58:24'),
(985, 00000001, '31.4414108', '73.0886085', '2024-07-13 07:58:25'),
(986, 00000001, '31.4414108', '73.0886085', '2024-07-13 07:58:25'),
(987, 00000001, '31.4414012', '73.0886319', '2024-07-13 07:58:26'),
(988, 00000001, '31.4413897', '73.0886654', '2024-07-13 07:58:28'),
(989, 00000001, '31.4413897', '73.0886654', '2024-07-13 07:58:28'),
(990, 00000001, '31.4413846', '73.0886786', '2024-07-13 07:58:29'),
(991, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:30'),
(992, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:30'),
(993, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:30'),
(994, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:30'),
(995, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:30'),
(996, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:30'),
(997, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:30'),
(998, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:31'),
(999, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:31'),
(1000, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:31'),
(1001, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:31'),
(1002, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:31'),
(1003, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:31'),
(1004, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:32'),
(1005, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:33'),
(1006, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:33'),
(1007, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:33'),
(1008, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:33'),
(1009, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:33'),
(1010, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:33'),
(1011, 00000001, '31.4413865', '73.0886664', '2024-07-13 07:58:33'),
(1012, 00000001, '31.4413157', '73.088726', '2024-07-13 07:58:35'),
(1013, 00000001, '31.4413157', '73.088726', '2024-07-13 07:58:35'),
(1014, 00000001, '31.4413157', '73.088726', '2024-07-13 07:58:35'),
(1015, 00000001, '31.4413157', '73.088726', '2024-07-13 07:58:35'),
(1016, 00000001, '31.4413157', '73.088726', '2024-07-13 07:58:35'),
(1017, 00000001, '31.4413157', '73.088726', '2024-07-13 07:58:35'),
(1018, 00000001, '31.4413157', '73.088726', '2024-07-13 07:58:36'),
(1019, 00000001, '31.4414072', '73.0886784', '2024-07-13 07:58:43'),
(1020, 00000001, '31.4414072', '73.0886784', '2024-07-13 07:58:43'),
(1021, 00000001, '31.4414072', '73.0886784', '2024-07-13 07:58:43'),
(1022, 00000001, '31.4414072', '73.0886784', '2024-07-13 07:58:43'),
(1023, 00000001, '31.4414072', '73.0886784', '2024-07-13 07:58:43'),
(1024, 00000001, '31.4414072', '73.0886784', '2024-07-13 07:58:43'),
(1025, 00000001, '31.4414072', '73.0886784', '2024-07-13 07:58:43'),
(1026, 00000001, '31.4414072', '73.0886784', '2024-07-13 07:58:44'),
(1027, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1028, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1029, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1030, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1031, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1032, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1033, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1034, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1035, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:00'),
(1036, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:01'),
(1037, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:01'),
(1038, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:01'),
(1039, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:01'),
(1040, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:01'),
(1041, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:02'),
(1042, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:02'),
(1043, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:02'),
(1044, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:02'),
(1045, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:02'),
(1046, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:02'),
(1047, 00000001, '31.4415377', '73.0886421', '2024-07-13 07:59:02'),
(1048, 00000001, '31.441612', '73.0886082', '2024-07-13 07:59:04'),
(1049, 00000001, '31.441612', '73.0886082', '2024-07-13 07:59:04'),
(1050, 00000001, '31.441612', '73.0886082', '2024-07-13 07:59:04'),
(1051, 00000001, '31.441612', '73.0886082', '2024-07-13 07:59:04'),
(1052, 00000001, '31.441612', '73.0886082', '2024-07-13 07:59:04'),
(1053, 00000001, '31.4416431', '73.0885904', '2024-07-13 07:59:05'),
(1054, 00000001, '31.4416431', '73.0885904', '2024-07-13 07:59:06'),
(1055, 00000001, '31.4417992', '73.0884907', '2024-07-13 07:59:09'),
(1056, 00000001, '31.4417992', '73.0884907', '2024-07-13 07:59:09'),
(1057, 00000001, '31.4417992', '73.0884907', '2024-07-13 07:59:10'),
(1058, 00000001, '31.4417992', '73.0884907', '2024-07-13 07:59:10'),
(1059, 00000001, '31.4417992', '73.0884907', '2024-07-13 07:59:12'),
(1060, 00000001, '31.4417992', '73.0884907', '2024-07-13 07:59:13'),
(1061, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:22'),
(1062, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:22'),
(1063, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:23'),
(1064, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:23'),
(1065, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:23'),
(1066, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:23'),
(1067, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:24'),
(1068, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:24'),
(1069, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:24'),
(1070, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:24'),
(1071, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:24'),
(1072, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:24'),
(1073, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:25'),
(1074, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:25'),
(1075, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:25'),
(1076, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:25'),
(1077, 00000001, '31.4414943', '73.0886451', '2024-07-13 07:59:26'),
(1078, 00000001, '31.44149', '73.0886476', '2024-07-13 07:59:29'),
(1079, 00000001, '31.44149', '73.0886476', '2024-07-13 07:59:29'),
(1080, 00000001, '31.44149', '73.0886476', '2024-07-13 07:59:30'),
(1081, 00000001, '31.44149', '73.0886476', '2024-07-13 07:59:30'),
(1082, 00000001, '31.44149', '73.0886476', '2024-07-13 07:59:32'),
(1083, 00000001, '31.4414918', '73.0886465', '2024-07-13 07:59:33'),
(1084, 00000001, '31.4414918', '73.0886465', '2024-07-13 07:59:33'),
(1085, 00000001, '31.4414918', '73.0886465', '2024-07-13 07:59:34'),
(1086, 00000001, '31.4414918', '73.0886465', '2024-07-13 07:59:35'),
(1087, 00000001, '31.4414918', '73.0886465', '2024-07-13 07:59:35'),
(1088, 00000001, '31.4414918', '73.0886465', '2024-07-13 07:59:36'),
(1089, 00000001, '31.4414923', '73.088646', '2024-07-13 07:59:39'),
(1090, 00000001, '31.4414923', '73.088646', '2024-07-13 07:59:39'),
(1091, 00000001, '31.4414923', '73.088646', '2024-07-13 07:59:40'),
(1092, 00000001, '31.4414923', '73.088646', '2024-07-13 07:59:40'),
(1093, 00000001, '31.4414923', '73.088646', '2024-07-13 07:59:42'),
(1094, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:59:43'),
(1095, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:59:43'),
(1096, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:59:44'),
(1097, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:59:44'),
(1098, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:59:45'),
(1099, 00000001, '31.4414922', '73.0886459', '2024-07-13 07:59:46'),
(1100, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:59:49'),
(1101, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:59:49'),
(1102, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:59:50'),
(1103, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:59:51'),
(1104, 00000001, '31.4414923', '73.0886457', '2024-07-13 07:59:54'),
(1105, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:59:57'),
(1106, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:59:59'),
(1107, 00000001, '31.4414922', '73.0886464', '2024-07-13 07:59:59'),
(1108, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:01'),
(1109, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:02'),
(1110, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:02'),
(1111, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:02'),
(1112, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:02'),
(1113, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:03'),
(1114, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:04'),
(1115, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:04'),
(1116, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:04'),
(1117, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:05'),
(1118, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:05'),
(1119, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:09'),
(1120, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:09'),
(1121, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:09'),
(1122, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:10'),
(1123, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:10'),
(1124, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:10'),
(1125, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:12'),
(1126, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:12'),
(1127, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1128, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1129, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1130, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1131, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1132, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1133, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1134, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1135, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1136, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1137, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1138, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:23'),
(1139, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:24'),
(1140, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:24'),
(1141, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:25'),
(1142, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:25'),
(1143, 00000001, '31.4414923', '73.088646', '2024-07-13 08:00:26'),
(1144, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:31'),
(1145, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:31'),
(1146, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:32'),
(1147, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:32'),
(1148, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:35'),
(1149, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:00:35'),
(1150, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:00:36'),
(1151, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:00:36'),
(1152, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:00:36'),
(1153, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:00:37'),
(1154, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:00:38'),
(1155, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:00:39'),
(1156, 00000001, '31.4414223', '73.0885933', '2024-07-13 08:00:41'),
(1157, 00000001, '31.4414223', '73.0885933', '2024-07-13 08:00:43'),
(1158, 00000001, '31.4414223', '73.0885933', '2024-07-13 08:00:43'),
(1159, 00000001, '31.4414223', '73.0885933', '2024-07-13 08:00:43'),
(1160, 00000001, '31.4414223', '73.0885933', '2024-07-13 08:00:43'),
(1161, 00000001, '31.4414223', '73.0885933', '2024-07-13 08:00:44'),
(1162, 00000001, '31.4414223', '73.0885933', '2024-07-13 08:00:44'),
(1163, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:50'),
(1164, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:50'),
(1165, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:51'),
(1166, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:51'),
(1167, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:51'),
(1168, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:51'),
(1169, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:52'),
(1170, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:52'),
(1171, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:52'),
(1172, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:52'),
(1173, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:53'),
(1174, 00000001, '31.4414909', '73.0886455', '2024-07-13 08:00:53'),
(1175, 00000001, '31.4414929', '73.0886463', '2024-07-13 08:00:54'),
(1176, 00000001, '31.4414929', '73.0886463', '2024-07-13 08:00:55'),
(1177, 00000001, '31.4414929', '73.0886463', '2024-07-13 08:00:55'),
(1178, 00000001, '31.4414929', '73.0886463', '2024-07-13 08:00:56'),
(1179, 00000001, '31.4414929', '73.0886463', '2024-07-13 08:00:59'),
(1180, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:04'),
(1181, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:05'),
(1182, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:05'),
(1183, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:06'),
(1184, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:06'),
(1185, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:06'),
(1186, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:07'),
(1187, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:07'),
(1188, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:07'),
(1189, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:08'),
(1190, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:09'),
(1191, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:10'),
(1192, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:10'),
(1193, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:11'),
(1194, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:12'),
(1195, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:13'),
(1196, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:14'),
(1197, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:16'),
(1198, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:17'),
(1199, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:19'),
(1200, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:20'),
(1201, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:01:20'),
(1202, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:21'),
(1203, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:01:21'),
(1204, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:01:23'),
(1205, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:01:23'),
(1206, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:01:23'),
(1207, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:01:25'),
(1208, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:01:26'),
(1209, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:01:28'),
(1210, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:01:30'),
(1211, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:30'),
(1212, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:01:32'),
(1213, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:33'),
(1214, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:35'),
(1215, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:35'),
(1216, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:35'),
(1217, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:35'),
(1218, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:36'),
(1219, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:36'),
(1220, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:36'),
(1221, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:36'),
(1222, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:37'),
(1223, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:01:40'),
(1224, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:01:40'),
(1225, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:41'),
(1226, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:42'),
(1227, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:42'),
(1228, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:44'),
(1229, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:44'),
(1230, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:01:46'),
(1231, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:46'),
(1232, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:01:46'),
(1233, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:46'),
(1234, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:01:51'),
(1235, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:01:52'),
(1236, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:01:52'),
(1237, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:01:54'),
(1238, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:01:54'),
(1239, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:01:55'),
(1240, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:01:55'),
(1241, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:01:55'),
(1242, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:57'),
(1243, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:57'),
(1244, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:01:57'),
(1245, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:01:58'),
(1246, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:59'),
(1247, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:01:59'),
(1248, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:02:02'),
(1249, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:02:02'),
(1250, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:02:02'),
(1251, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:02:03'),
(1252, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:02:03'),
(1253, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:02:06'),
(1254, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:02:06'),
(1255, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:02:07'),
(1256, 00000001, '31.4413343', '73.0887737', '2024-07-13 08:02:08'),
(1257, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:02:08'),
(1258, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:02:09'),
(1259, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:02:09'),
(1260, 00000001, '31.4412196', '73.0888689', '2024-07-13 08:02:11'),
(1261, 00000001, '31.4412123', '73.0888514', '2024-07-13 08:02:13'),
(1262, 00000001, '31.4412123', '73.0888514', '2024-07-13 08:02:13'),
(1263, 00000001, '31.4412123', '73.0888514', '2024-07-13 08:02:13'),
(1264, 00000001, '31.4412196', '73.0888689', '2024-07-13 08:02:13'),
(1265, 00000001, '31.4412196', '73.0888689', '2024-07-13 08:02:14'),
(1266, 00000001, '31.4412123', '73.0888514', '2024-07-13 08:02:15'),
(1267, 00000001, '31.4412123', '73.0888514', '2024-07-13 08:02:17'),
(1268, 00000001, '31.4412452', '73.0887411', '2024-07-13 08:02:17'),
(1269, 00000001, '31.4412123', '73.0888514', '2024-07-13 08:02:17'),
(1270, 00000001, '31.4412123', '73.0888514', '2024-07-13 08:02:19'),
(1271, 00000001, '31.4412196', '73.0888689', '2024-07-13 08:02:20'),
(1272, 00000001, '31.4412452', '73.0887411', '2024-07-13 08:02:20'),
(1273, 00000001, '31.4412452', '73.0887411', '2024-07-13 08:02:21'),
(1274, 00000001, '31.4412452', '73.0887411', '2024-07-13 08:02:23'),
(1275, 00000001, '31.4412452', '73.0887411', '2024-07-13 08:02:23'),
(1276, 00000001, '31.4414909', '73.0886456', '2024-07-13 08:02:26'),
(1277, 00000001, '31.4414909', '73.0886456', '2024-07-13 08:02:26'),
(1278, 00000001, '31.4414909', '73.0886456', '2024-07-13 08:02:26'),
(1279, 00000001, '31.4414909', '73.0886456', '2024-07-13 08:02:26'),
(1280, 00000001, '31.4414909', '73.0886456', '2024-07-13 08:02:26'),
(1281, 00000001, '31.4414909', '73.0886456', '2024-07-13 08:02:26'),
(1282, 00000001, '31.4414909', '73.0886456', '2024-07-13 08:02:26'),
(1283, 00000001, '31.4414909', '73.0886456', '2024-07-13 08:02:26'),
(1284, 00000001, '31.4412739', '73.0887186', '2024-07-13 08:02:29'),
(1285, 00000001, '31.4412739', '73.0887186', '2024-07-13 08:02:29'),
(1286, 00000001, '31.4412739', '73.0887186', '2024-07-13 08:02:30'),
(1287, 00000001, '31.4412739', '73.0887186', '2024-07-13 08:02:30'),
(1288, 00000001, '31.4412739', '73.0887186', '2024-07-13 08:02:33'),
(1289, 00000001, '31.4412739', '73.0887186', '2024-07-13 08:02:34'),
(1290, 00000001, '31.4412739', '73.0887186', '2024-07-13 08:02:36'),
(1291, 00000001, '31.4412464', '73.0887324', '2024-07-13 08:02:36'),
(1292, 00000001, '31.4412739', '73.0887186', '2024-07-13 08:02:37'),
(1293, 00000001, '31.4412464', '73.0887324', '2024-07-13 08:02:38'),
(1294, 00000001, '31.4412464', '73.0887324', '2024-07-13 08:02:38'),
(1295, 00000001, '31.4412599', '73.0887328', '2024-07-13 08:02:39'),
(1296, 00000001, '31.4412464', '73.0887324', '2024-07-13 08:02:39'),
(1297, 00000001, '31.4412618', '73.0887296', '2024-07-13 08:02:40'),
(1298, 00000001, '31.4412618', '73.0887296', '2024-07-13 08:02:41'),
(1299, 00000001, '31.4412599', '73.0887328', '2024-07-13 08:02:42'),
(1300, 00000001, '31.4412618', '73.0887296', '2024-07-13 08:02:42'),
(1301, 00000001, '31.4412618', '73.0887296', '2024-07-13 08:02:43'),
(1302, 00000001, '31.4412618', '73.0887296', '2024-07-13 08:02:43'),
(1303, 00000001, '31.4412618', '73.0887296', '2024-07-13 08:02:44'),
(1304, 00000001, '31.4412618', '73.0887296', '2024-07-13 08:02:44'),
(1305, 00000001, '31.4412422', '73.0886456', '2024-07-13 08:02:45'),
(1306, 00000001, '31.441242', '73.0886337', '2024-07-13 08:02:47'),
(1307, 00000001, '31.4412422', '73.0886456', '2024-07-13 08:02:48'),
(1308, 00000001, '31.441251', '73.0886745', '2024-07-13 08:02:49'),
(1309, 00000001, '31.4412589', '73.0886961', '2024-07-13 08:02:50'),
(1310, 00000001, '31.441251', '73.0886745', '2024-07-13 08:02:50'),
(1311, 00000001, '31.4412589', '73.0886961', '2024-07-13 08:02:50'),
(1312, 00000001, '31.4412686', '73.0887233', '2024-07-13 08:02:54'),
(1313, 00000001, '31.4412658', '73.0887363', '2024-07-13 08:02:55'),
(1314, 00000001, '31.4412658', '73.0887363', '2024-07-13 08:02:55'),
(1315, 00000001, '31.4412658', '73.0887363', '2024-07-13 08:02:56'),
(1316, 00000001, '31.4412658', '73.0887363', '2024-07-13 08:02:56'),
(1317, 00000001, '31.4412658', '73.0887363', '2024-07-13 08:02:57'),
(1318, 00000001, '31.4412658', '73.0887363', '2024-07-13 08:02:57'),
(1319, 00000001, '31.4412658', '73.0887363', '2024-07-13 08:02:58'),
(1320, 00000001, '31.4412479', '73.0887478', '2024-07-13 08:03:01'),
(1321, 00000001, '31.4412479', '73.0887478', '2024-07-13 08:03:02'),
(1322, 00000001, '31.4412479', '73.0887478', '2024-07-13 08:03:03'),
(1323, 00000001, '31.4412514', '73.0887668', '2024-07-13 08:03:04'),
(1324, 00000001, '31.4412479', '73.0887478', '2024-07-13 08:03:04'),
(1325, 00000001, '31.4412705', '73.0887672', '2024-07-13 08:03:05'),
(1326, 00000001, '31.4412705', '73.0887672', '2024-07-13 08:03:05'),
(1327, 00000001, '31.4412835', '73.088757', '2024-07-13 08:03:05'),
(1328, 00000001, '31.4412705', '73.0887672', '2024-07-13 08:03:08'),
(1329, 00000001, '31.4412835', '73.088757', '2024-07-13 08:03:09'),
(1330, 00000001, '31.4412835', '73.088757', '2024-07-13 08:03:10'),
(1331, 00000001, '31.4412835', '73.088757', '2024-07-13 08:03:11'),
(1332, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:13'),
(1333, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:13'),
(1334, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:13'),
(1335, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:14'),
(1336, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:15'),
(1337, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:15'),
(1338, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:16'),
(1339, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:16'),
(1340, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:18'),
(1341, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:20'),
(1342, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:20'),
(1343, 00000001, '31.4414942', '73.088645', '2024-07-13 08:03:21'),
(1344, 00000001, '31.4414942', '73.088645', '2024-07-13 08:03:21'),
(1345, 00000001, '31.4414942', '73.088645', '2024-07-13 08:03:23'),
(1346, 00000001, '31.4414925', '73.0886456', '2024-07-13 08:03:24'),
(1347, 00000001, '31.4414942', '73.088645', '2024-07-13 08:03:25'),
(1348, 00000001, '31.441491', '73.0886467', '2024-07-13 08:03:25'),
(1349, 00000001, '31.4414942', '73.088645', '2024-07-13 08:03:25'),
(1350, 00000001, '31.4414925', '73.0886456', '2024-07-13 08:03:25'),
(1351, 00000001, '31.4414942', '73.088645', '2024-07-13 08:03:26'),
(1352, 00000001, '31.4414942', '73.088645', '2024-07-13 08:03:27'),
(1353, 00000001, '31.4414925', '73.0886456', '2024-07-13 08:03:27'),
(1354, 00000001, '31.4414925', '73.0886456', '2024-07-13 08:03:28'),
(1355, 00000001, '31.4414925', '73.0886456', '2024-07-13 08:03:29'),
(1356, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:03:30'),
(1357, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:03:32'),
(1358, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:03:33'),
(1359, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:03:34'),
(1360, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:03:34'),
(1361, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:03:34'),
(1362, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:03:35'),
(1363, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:03:35'),
(1364, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:03:36'),
(1365, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:03:36'),
(1366, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:03:37'),
(1367, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:03:38'),
(1368, 00000001, '31.4412972', '73.0886765', '2024-07-13 08:03:43'),
(1369, 00000001, '31.4412972', '73.0886765', '2024-07-13 08:03:43'),
(1370, 00000001, '31.4412972', '73.0886765', '2024-07-13 08:03:43'),
(1371, 00000001, '31.441266', '73.0886888', '2024-07-13 08:03:43'),
(1372, 00000001, '31.4412972', '73.0886765', '2024-07-13 08:03:43'),
(1373, 00000001, '31.4412482', '73.0887072', '2024-07-13 08:03:43'),
(1374, 00000001, '31.4412357', '73.0887228', '2024-07-13 08:03:45'),
(1375, 00000001, '31.4412482', '73.0887072', '2024-07-13 08:03:45'),
(1376, 00000001, '31.4412482', '73.0887072', '2024-07-13 08:03:46'),
(1377, 00000001, '31.4412357', '73.0887228', '2024-07-13 08:03:46'),
(1378, 00000001, '31.4412357', '73.0887228', '2024-07-13 08:03:47'),
(1379, 00000001, '31.4412357', '73.0887228', '2024-07-13 08:03:48'),
(1380, 00000001, '31.4412714', '73.0887347', '2024-07-13 08:03:49'),
(1381, 00000001, '31.4413232', '73.0887289', '2024-07-13 08:03:53'),
(1382, 00000001, '31.4413232', '73.0887289', '2024-07-13 08:03:53'),
(1383, 00000001, '31.4412972', '73.088735', '2024-07-13 08:03:54'),
(1384, 00000001, '31.4412972', '73.088735', '2024-07-13 08:03:55'),
(1385, 00000001, '31.4413207', '73.0887328', '2024-07-13 08:03:55'),
(1386, 00000001, '31.4413232', '73.0887289', '2024-07-13 08:03:55'),
(1387, 00000001, '31.4413232', '73.0887289', '2024-07-13 08:03:55'),
(1388, 00000001, '31.4413232', '73.0887267', '2024-07-13 08:03:55'),
(1389, 00000001, '31.4413329', '73.0887249', '2024-07-13 08:03:56'),
(1390, 00000001, '31.4412714', '73.0887347', '2024-07-13 08:03:57'),
(1391, 00000001, '31.4413232', '73.0887289', '2024-07-13 08:03:57'),
(1392, 00000001, '31.4413754', '73.0887064', '2024-07-13 08:04:00'),
(1393, 00000001, '31.4413754', '73.0887064', '2024-07-13 08:04:01'),
(1394, 00000001, '31.4413668', '73.0887114', '2024-07-13 08:04:02'),
(1395, 00000001, '31.4413668', '73.0887114', '2024-07-13 08:04:03'),
(1396, 00000001, '31.4413874', '73.088703', '2024-07-13 08:04:03'),
(1397, 00000001, '31.4413874', '73.088703', '2024-07-13 08:04:04'),
(1398, 00000001, '31.4413874', '73.088703', '2024-07-13 08:04:04'),
(1399, 00000001, '31.4413874', '73.088703', '2024-07-13 08:04:04'),
(1400, 00000001, '31.4413874', '73.088703', '2024-07-13 08:04:06'),
(1401, 00000001, '31.4413902', '73.0887116', '2024-07-13 08:04:07'),
(1402, 00000001, '31.4413902', '73.0887116', '2024-07-13 08:04:08'),
(1403, 00000001, '31.4413874', '73.088703', '2024-07-13 08:04:10'),
(1404, 00000001, '31.4413856', '73.0887045', '2024-07-13 08:04:11'),
(1405, 00000001, '31.4413828', '73.0887008', '2024-07-13 08:04:12'),
(1406, 00000001, '31.4413783', '73.0886992', '2024-07-13 08:04:12'),
(1407, 00000001, '31.4413783', '73.0886992', '2024-07-13 08:04:13'),
(1408, 00000001, '31.4413828', '73.0887008', '2024-07-13 08:04:13'),
(1409, 00000001, '31.4413766', '73.0886977', '2024-07-13 08:04:15'),
(1410, 00000001, '31.4413783', '73.0886992', '2024-07-13 08:04:15'),
(1411, 00000001, '31.4413783', '73.0886992', '2024-07-13 08:04:15'),
(1412, 00000001, '31.4413721', '73.088695', '2024-07-13 08:04:17'),
(1413, 00000001, '31.4413766', '73.0886977', '2024-07-13 08:04:18'),
(1414, 00000001, '31.4413766', '73.0886977', '2024-07-13 08:04:18'),
(1415, 00000001, '31.4413856', '73.0887045', '2024-07-13 08:04:20'),
(1416, 00000001, '31.4413705', '73.088694', '2024-07-13 08:04:22'),
(1417, 00000001, '31.4413607', '73.0886682', '2024-07-13 08:04:23'),
(1418, 00000001, '31.4413607', '73.0886682', '2024-07-13 08:04:23'),
(1419, 00000001, '31.4413705', '73.088694', '2024-07-13 08:04:23'),
(1420, 00000001, '31.44137', '73.0886774', '2024-07-13 08:04:24'),
(1421, 00000001, '31.4413701', '73.0886747', '2024-07-13 08:04:25'),
(1422, 00000001, '31.4413675', '73.0886727', '2024-07-13 08:04:25'),
(1423, 00000001, '31.4413701', '73.0886747', '2024-07-13 08:04:25'),
(1424, 00000001, '31.4413706', '73.0886733', '2024-07-13 08:04:25'),
(1425, 00000001, '31.44137', '73.0886774', '2024-07-13 08:04:26'),
(1426, 00000001, '31.4413706', '73.0886733', '2024-07-13 08:04:28'),
(1427, 00000001, '31.44137', '73.0886774', '2024-07-13 08:04:28'),
(1428, 00000001, '31.4413732', '73.0886601', '2024-07-13 08:04:30'),
(1429, 00000001, '31.441376', '73.0886624', '2024-07-13 08:04:32'),
(1430, 00000001, '31.4413696', '73.0886557', '2024-07-13 08:04:34'),
(1431, 00000001, '31.4413677', '73.0886552', '2024-07-13 08:04:35'),
(1432, 00000001, '31.4413677', '73.0886552', '2024-07-13 08:04:36'),
(1433, 00000001, '31.4413696', '73.0886557', '2024-07-13 08:04:37'),
(1434, 00000001, '31.4413677', '73.0886552', '2024-07-13 08:04:37'),
(1435, 00000001, '31.4413754', '73.0886622', '2024-07-13 08:04:38'),
(1436, 00000001, '31.4413727', '73.0886608', '2024-07-13 08:04:39'),
(1437, 00000001, '31.4413696', '73.0886557', '2024-07-13 08:04:40'),
(1438, 00000001, '31.441376', '73.0886624', '2024-07-13 08:04:41'),
(1439, 00000001, '31.4413727', '73.0886608', '2024-07-13 08:04:42'),
(1440, 00000001, '31.4413673', '73.088596', '2024-07-13 08:04:42'),
(1441, 00000001, '31.4413679', '73.0886558', '2024-07-13 08:04:42'),
(1442, 00000001, '31.4413732', '73.0886601', '2024-07-13 08:04:42'),
(1443, 00000001, '31.4413727', '73.0886482', '2024-07-13 08:04:43'),
(1444, 00000001, '31.4413727', '73.0886482', '2024-07-13 08:04:43'),
(1445, 00000001, '31.4413628', '73.0885767', '2024-07-13 08:04:44'),
(1446, 00000001, '31.4413628', '73.0885767', '2024-07-13 08:04:44'),
(1447, 00000001, '31.4413643', '73.088566', '2024-07-13 08:04:45'),
(1448, 00000001, '31.4413628', '73.0885767', '2024-07-13 08:04:46'),
(1449, 00000001, '31.4413643', '73.088566', '2024-07-13 08:04:47'),
(1450, 00000001, '31.4413643', '73.088566', '2024-07-13 08:04:47'),
(1451, 00000001, '31.4413643', '73.088566', '2024-07-13 08:04:47'),
(1452, 00000001, '31.441369', '73.0885453', '2024-07-13 08:04:50'),
(1453, 00000001, '31.4413619', '73.0885518', '2024-07-13 08:04:53'),
(1454, 00000001, '31.4413685', '73.0885534', '2024-07-13 08:04:53'),
(1455, 00000001, '31.4413685', '73.0885534', '2024-07-13 08:04:55'),
(1456, 00000001, '31.4413599', '73.0885755', '2024-07-13 08:04:55'),
(1457, 00000001, '31.4413599', '73.0885755', '2024-07-13 08:04:55'),
(1458, 00000001, '31.4413608', '73.0885689', '2024-07-13 08:04:56'),
(1459, 00000001, '31.4413629', '73.0885815', '2024-07-13 08:04:56'),
(1460, 00000001, '31.4413608', '73.0885689', '2024-07-13 08:04:56'),
(1461, 00000001, '31.4413599', '73.0885755', '2024-07-13 08:04:56'),
(1462, 00000001, '31.4413641', '73.0885909', '2024-07-13 08:05:00'),
(1463, 00000001, '31.441369', '73.0885453', '2024-07-13 08:05:00'),
(1464, 00000001, '31.4413641', '73.0885909', '2024-07-13 08:05:00'),
(1465, 00000001, '31.4413653', '73.0885938', '2024-07-13 08:05:00'),
(1466, 00000001, '31.4413653', '73.0885938', '2024-07-13 08:05:03'),
(1467, 00000001, '31.4413673', '73.0886104', '2024-07-13 08:05:04'),
(1468, 00000001, '31.4413673', '73.0886104', '2024-07-13 08:05:04'),
(1469, 00000001, '31.4413673', '73.0886104', '2024-07-13 08:05:04'),
(1470, 00000001, '31.4413673', '73.0886104', '2024-07-13 08:05:04'),
(1471, 00000001, '31.4413582', '73.0886242', '2024-07-13 08:05:07'),
(1472, 00000001, '31.4413673', '73.0886104', '2024-07-13 08:05:07'),
(1473, 00000001, '31.4413582', '73.0886242', '2024-07-13 08:05:08'),
(1474, 00000001, '31.4413558', '73.0886258', '2024-07-13 08:05:09'),
(1475, 00000001, '31.4413558', '73.0886258', '2024-07-13 08:05:12'),
(1476, 00000001, '31.4413558', '73.0886258', '2024-07-13 08:05:12'),
(1477, 00000001, '31.4413558', '73.0886258', '2024-07-13 08:05:13'),
(1478, 00000001, '31.4413558', '73.0886258', '2024-07-13 08:05:13'),
(1479, 00000001, '31.4413558', '73.0886258', '2024-07-13 08:05:14'),
(1480, 00000001, '31.4413975', '73.0886139', '2024-07-13 08:05:14'),
(1481, 00000001, '31.4413975', '73.0886139', '2024-07-13 08:05:14'),
(1482, 00000001, '31.4414004', '73.088615', '2024-07-13 08:05:15'),
(1483, 00000001, '31.4413558', '73.0886258', '2024-07-13 08:05:15'),
(1484, 00000001, '31.441401', '73.0886155', '2024-07-13 08:05:16'),
(1485, 00000001, '31.4414069', '73.0886253', '2024-07-13 08:05:19'),
(1486, 00000001, '31.4414069', '73.0886253', '2024-07-13 08:05:20'),
(1487, 00000001, '31.4414069', '73.0886253', '2024-07-13 08:05:22'),
(1488, 00000001, '31.4414069', '73.0886253', '2024-07-13 08:05:23'),
(1489, 00000001, '31.4414069', '73.0886253', '2024-07-13 08:05:23'),
(1490, 00000001, '31.4414069', '73.0886253', '2024-07-13 08:05:24'),
(1491, 00000001, '31.4414069', '73.0886253', '2024-07-13 08:05:28'),
(1492, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:29'),
(1493, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:30'),
(1494, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:30'),
(1495, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:30'),
(1496, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:30'),
(1497, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:32'),
(1498, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:32'),
(1499, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:32'),
(1500, 00000001, '31.4414911', '73.0886465', '2024-07-13 08:05:38'),
(1501, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:39'),
(1502, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:39'),
(1503, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:39'),
(1504, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:40'),
(1505, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:40'),
(1506, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:41'),
(1507, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:41'),
(1508, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:41'),
(1509, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:43'),
(1510, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:43'),
(1511, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:43'),
(1512, 00000001, '31.4414924', '73.0886465', '2024-07-13 08:05:44'),
(1513, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:05:45'),
(1514, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:05:45'),
(1515, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:05:45'),
(1516, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:05:49'),
(1517, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:05:50'),
(1518, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:05:50'),
(1519, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:05:51'),
(1520, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:05:53'),
(1521, 00000001, '31.4414919', '73.0886465', '2024-07-13 08:05:54'),
(1522, 00000001, '31.4414919', '73.0886465', '2024-07-13 08:05:54'),
(1523, 00000001, '31.4414919', '73.0886465', '2024-07-13 08:05:54'),
(1524, 00000001, '31.4414919', '73.0886465', '2024-07-13 08:05:55'),
(1525, 00000001, '31.4414919', '73.0886465', '2024-07-13 08:05:56'),
(1526, 00000001, '31.4414919', '73.0886465', '2024-07-13 08:05:56'),
(1527, 00000001, '31.4414919', '73.0886465', '2024-07-13 08:05:57');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(1528, 00000001, '31.4414919', '73.0886465', '2024-07-13 08:05:59'),
(1529, 00000001, '31.4414921', '73.0886464', '2024-07-13 08:06:00'),
(1530, 00000001, '31.4414921', '73.0886464', '2024-07-13 08:06:00'),
(1531, 00000001, '31.4414921', '73.0886464', '2024-07-13 08:06:00'),
(1532, 00000001, '31.4414921', '73.0886464', '2024-07-13 08:06:01'),
(1533, 00000001, '31.4414921', '73.0886464', '2024-07-13 08:06:02'),
(1534, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:03'),
(1535, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:04'),
(1536, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:05'),
(1537, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:05'),
(1538, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:05'),
(1539, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:06'),
(1540, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:09'),
(1541, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:09'),
(1542, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:10'),
(1543, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:13'),
(1544, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:14'),
(1545, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:14'),
(1546, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:15'),
(1547, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:16'),
(1548, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:16'),
(1549, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:20'),
(1550, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:21'),
(1551, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:22'),
(1552, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:22'),
(1553, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:23'),
(1554, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:23'),
(1555, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:23'),
(1556, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:24'),
(1557, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:25'),
(1558, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:25'),
(1559, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:26'),
(1560, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:26'),
(1561, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:06:29'),
(1562, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:31'),
(1563, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:32'),
(1564, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:32'),
(1565, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:32'),
(1566, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:33'),
(1567, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:36'),
(1568, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:37'),
(1569, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:37'),
(1570, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:37'),
(1571, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:37'),
(1572, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:06:38'),
(1573, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:39'),
(1574, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:39'),
(1575, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:39'),
(1576, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:41'),
(1577, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:42'),
(1578, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:43'),
(1579, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:45'),
(1580, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:48'),
(1581, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:49'),
(1582, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:50'),
(1583, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:51'),
(1584, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:52'),
(1585, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:52'),
(1586, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:52'),
(1587, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:06:53'),
(1588, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:54'),
(1589, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:55'),
(1590, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:55'),
(1591, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:56'),
(1592, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:56'),
(1593, 00000001, '31.4414923', '73.088646', '2024-07-13 08:06:59'),
(1594, 00000001, '31.4414923', '73.088646', '2024-07-13 08:07:02'),
(1595, 00000001, '31.4414923', '73.088646', '2024-07-13 08:07:02'),
(1596, 00000001, '31.4413822', '73.0885077', '2024-07-13 08:07:03'),
(1597, 00000001, '31.4414923', '73.088646', '2024-07-13 08:07:03'),
(1598, 00000001, '31.4414923', '73.088646', '2024-07-13 08:07:04'),
(1599, 00000001, '31.4413709', '73.0884969', '2024-07-13 08:07:05'),
(1600, 00000001, '31.4413704', '73.0885047', '2024-07-13 08:07:05'),
(1601, 00000001, '31.4413772', '73.0885014', '2024-07-13 08:07:05'),
(1602, 00000001, '31.4414923', '73.088646', '2024-07-13 08:07:05'),
(1603, 00000001, '31.4413709', '73.0884969', '2024-07-13 08:07:07'),
(1604, 00000001, '31.441364', '73.0885023', '2024-07-13 08:07:09'),
(1605, 00000001, '31.4413555', '73.0884879', '2024-07-13 08:07:14'),
(1606, 00000001, '31.441364', '73.0885023', '2024-07-13 08:07:14'),
(1607, 00000001, '31.441364', '73.0885023', '2024-07-13 08:07:15'),
(1608, 00000001, '31.4413566', '73.0884874', '2024-07-13 08:07:15'),
(1609, 00000001, '31.441364', '73.0885023', '2024-07-13 08:07:15'),
(1610, 00000001, '31.4413576', '73.0884872', '2024-07-13 08:07:15'),
(1611, 00000001, '31.4413576', '73.0884872', '2024-07-13 08:07:16'),
(1612, 00000001, '31.4413733', '73.0885068', '2024-07-13 08:07:18'),
(1613, 00000001, '31.4413612', '73.0884995', '2024-07-13 08:07:18'),
(1614, 00000001, '31.4413576', '73.0884872', '2024-07-13 08:07:18'),
(1615, 00000001, '31.4413594', '73.0885081', '2024-07-13 08:07:19'),
(1616, 00000001, '31.4413594', '73.0885081', '2024-07-13 08:07:19'),
(1617, 00000001, '31.441368', '73.0885121', '2024-07-13 08:07:20'),
(1618, 00000001, '31.4413606', '73.0885234', '2024-07-13 08:07:23'),
(1619, 00000001, '31.4413619', '73.088529', '2024-07-13 08:07:24'),
(1620, 00000001, '31.4413619', '73.088529', '2024-07-13 08:07:25'),
(1621, 00000001, '31.441368', '73.0885121', '2024-07-13 08:07:25'),
(1622, 00000001, '31.44138', '73.0885618', '2024-07-13 08:07:26'),
(1623, 00000001, '31.4413659', '73.0885368', '2024-07-13 08:07:26'),
(1624, 00000001, '31.4413566', '73.0884874', '2024-07-13 08:07:27'),
(1625, 00000001, '31.4413659', '73.0885368', '2024-07-13 08:07:27'),
(1626, 00000001, '31.4413732', '73.0885507', '2024-07-13 08:07:28'),
(1627, 00000001, '31.4413986', '73.0885683', '2024-07-13 08:07:32'),
(1628, 00000001, '31.4414101', '73.0885852', '2024-07-13 08:07:32'),
(1629, 00000001, '31.4413986', '73.0885683', '2024-07-13 08:07:32'),
(1630, 00000001, '31.4413996', '73.0885694', '2024-07-13 08:07:33'),
(1631, 00000001, '31.4414189', '73.0885896', '2024-07-13 08:07:33'),
(1632, 00000001, '31.4413996', '73.0885694', '2024-07-13 08:07:33'),
(1633, 00000001, '31.4414189', '73.0885896', '2024-07-13 08:07:33'),
(1634, 00000001, '31.4414261', '73.0885931', '2024-07-13 08:07:34'),
(1635, 00000001, '31.4414261', '73.0885931', '2024-07-13 08:07:34'),
(1636, 00000001, '31.4414268', '73.0885953', '2024-07-13 08:07:38'),
(1637, 00000001, '31.4414299', '73.0886126', '2024-07-13 08:07:41'),
(1638, 00000001, '31.4414312', '73.0886152', '2024-07-13 08:07:41'),
(1639, 00000001, '31.4414299', '73.0886126', '2024-07-13 08:07:41'),
(1640, 00000001, '31.4414272', '73.0885946', '2024-07-13 08:07:41'),
(1641, 00000001, '31.441434', '73.08862', '2024-07-13 08:07:42'),
(1642, 00000001, '31.4414312', '73.0886152', '2024-07-13 08:07:43'),
(1643, 00000001, '31.4414347', '73.0886199', '2024-07-13 08:07:43'),
(1644, 00000001, '31.4414335', '73.0886198', '2024-07-13 08:07:45'),
(1645, 00000001, '31.4414347', '73.0886199', '2024-07-13 08:07:45'),
(1646, 00000001, '31.4414347', '73.0886199', '2024-07-13 08:07:45'),
(1647, 00000001, '31.4414319', '73.0886186', '2024-07-13 08:07:46'),
(1648, 00000001, '31.4414347', '73.0886199', '2024-07-13 08:07:50'),
(1649, 00000001, '31.4414278', '73.0886145', '2024-07-13 08:07:51'),
(1650, 00000001, '31.4414269', '73.0886136', '2024-07-13 08:07:52'),
(1651, 00000001, '31.4414269', '73.0886136', '2024-07-13 08:07:52'),
(1652, 00000001, '31.4414249', '73.0886114', '2024-07-13 08:07:53'),
(1653, 00000001, '31.4414259', '73.0886132', '2024-07-13 08:07:54'),
(1654, 00000001, '31.441431', '73.0886139', '2024-07-13 08:07:55'),
(1655, 00000001, '31.4414259', '73.0886132', '2024-07-13 08:07:56'),
(1656, 00000001, '31.441431', '73.0886139', '2024-07-13 08:07:56'),
(1657, 00000001, '31.4414321', '73.0886154', '2024-07-13 08:07:56'),
(1658, 00000001, '31.4414321', '73.0886154', '2024-07-13 08:07:56'),
(1659, 00000001, '31.4414278', '73.0886145', '2024-07-13 08:07:57'),
(1660, 00000001, '31.4414128', '73.0886341', '2024-07-13 08:08:00'),
(1661, 00000001, '31.4414099', '73.0886372', '2024-07-13 08:08:00'),
(1662, 00000001, '31.4414128', '73.0886341', '2024-07-13 08:08:00'),
(1663, 00000001, '31.4414128', '73.0886341', '2024-07-13 08:08:02'),
(1664, 00000001, '31.4414156', '73.0886278', '2024-07-13 08:08:02'),
(1665, 00000001, '31.4414207', '73.0886272', '2024-07-13 08:08:03'),
(1666, 00000001, '31.4414207', '73.0886272', '2024-07-13 08:08:03'),
(1667, 00000001, '31.4414207', '73.0886272', '2024-07-13 08:08:04'),
(1668, 00000001, '31.4414247', '73.0886214', '2024-07-13 08:08:05'),
(1669, 00000001, '31.4414272', '73.0886207', '2024-07-13 08:08:06'),
(1670, 00000001, '31.4414207', '73.0886272', '2024-07-13 08:08:07'),
(1671, 00000001, '31.4414272', '73.0886207', '2024-07-13 08:08:09'),
(1672, 00000001, '31.4414272', '73.0886207', '2024-07-13 08:08:15'),
(1673, 00000001, '31.4414272', '73.0886207', '2024-07-13 08:08:15'),
(1674, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:15'),
(1675, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:15'),
(1676, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:16'),
(1677, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:16'),
(1678, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:16'),
(1679, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:16'),
(1680, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:17'),
(1681, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:19'),
(1682, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:20'),
(1683, 00000001, '31.4414272', '73.0886207', '2024-07-13 08:08:20'),
(1684, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:08:21'),
(1685, 00000001, '31.4414927', '73.0886463', '2024-07-13 08:08:22'),
(1686, 00000001, '31.4414927', '73.0886463', '2024-07-13 08:08:24'),
(1687, 00000001, '31.4414927', '73.0886463', '2024-07-13 08:08:24'),
(1688, 00000001, '31.4414927', '73.0886463', '2024-07-13 08:08:25'),
(1689, 00000001, '31.4414927', '73.0886463', '2024-07-13 08:08:26'),
(1690, 00000001, '31.4414927', '73.0886463', '2024-07-13 08:08:26'),
(1691, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:27'),
(1692, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:28'),
(1693, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:29'),
(1694, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:31'),
(1695, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:32'),
(1696, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:32'),
(1697, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:33'),
(1698, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:33'),
(1699, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:34'),
(1700, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:34'),
(1701, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:34'),
(1702, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:08:35'),
(1703, 00000001, '31.4414924', '73.0886458', '2024-07-13 08:08:36'),
(1704, 00000001, '31.4414924', '73.0886458', '2024-07-13 08:08:39'),
(1705, 00000001, '31.4414924', '73.0886458', '2024-07-13 08:08:40'),
(1706, 00000001, '31.4414923', '73.088646', '2024-07-13 08:08:40'),
(1707, 00000001, '31.4414923', '73.088646', '2024-07-13 08:08:43'),
(1708, 00000001, '31.4414923', '73.088646', '2024-07-13 08:08:43'),
(1709, 00000001, '31.4414924', '73.0886458', '2024-07-13 08:08:44'),
(1710, 00000001, '31.4414923', '73.088646', '2024-07-13 08:08:45'),
(1711, 00000001, '31.4414923', '73.088646', '2024-07-13 08:08:45'),
(1712, 00000001, '31.4414923', '73.088646', '2024-07-13 08:08:47'),
(1713, 00000001, '31.4414923', '73.088646', '2024-07-13 08:08:47'),
(1714, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:08:48'),
(1715, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:08:51'),
(1716, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:08:51'),
(1717, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:08:51'),
(1718, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:08:52'),
(1719, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:08:52'),
(1720, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:08:55'),
(1721, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:08:55'),
(1722, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:08:55'),
(1723, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:08:56'),
(1724, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:08:56'),
(1725, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:08:56'),
(1726, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:00'),
(1727, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:01'),
(1728, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:02'),
(1729, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:09:03'),
(1730, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:09:03'),
(1731, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:09:04'),
(1732, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:09:04'),
(1733, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:09:04'),
(1734, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:09:05'),
(1735, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:09:05'),
(1736, 00000001, '31.4414923', '73.088646', '2024-07-13 08:09:06'),
(1737, 00000001, '31.4414923', '73.088646', '2024-07-13 08:09:09'),
(1738, 00000001, '31.4414923', '73.088646', '2024-07-13 08:09:10'),
(1739, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:09:11'),
(1740, 00000001, '31.4414923', '73.088646', '2024-07-13 08:09:11'),
(1741, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:09:12'),
(1742, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:09:13'),
(1743, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:09:13'),
(1744, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:09:14'),
(1745, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:25'),
(1746, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:25'),
(1747, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:25'),
(1748, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:25'),
(1749, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:25'),
(1750, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:25'),
(1751, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:26'),
(1752, 00000001, '31.4414921', '73.0886464', '2024-07-13 08:09:27'),
(1753, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:09:27'),
(1754, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:09:27'),
(1755, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:27'),
(1756, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:28'),
(1757, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:28'),
(1758, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:09:28'),
(1759, 00000001, '31.4414248', '73.0886272', '2024-07-13 08:09:29'),
(1760, 00000001, '31.4414248', '73.0886272', '2024-07-13 08:09:29'),
(1761, 00000001, '31.4414263', '73.0886259', '2024-07-13 08:09:29'),
(1762, 00000001, '31.4414263', '73.0886259', '2024-07-13 08:09:31'),
(1763, 00000001, '31.4414317', '73.0886198', '2024-07-13 08:09:33'),
(1764, 00000001, '31.4414306', '73.0886222', '2024-07-13 08:09:33'),
(1765, 00000001, '31.4414317', '73.0886198', '2024-07-13 08:09:34'),
(1766, 00000001, '31.4414312', '73.0886155', '2024-07-13 08:09:34'),
(1767, 00000001, '31.4414312', '73.0886155', '2024-07-13 08:09:34'),
(1768, 00000001, '31.4414319', '73.0886113', '2024-07-13 08:09:35'),
(1769, 00000001, '31.4414323', '73.0886086', '2024-07-13 08:09:36'),
(1770, 00000001, '31.4414291', '73.088602', '2024-07-13 08:09:39'),
(1771, 00000001, '31.4414321', '73.0886028', '2024-07-13 08:09:40'),
(1772, 00000001, '31.4414321', '73.0886028', '2024-07-13 08:09:40'),
(1773, 00000001, '31.4414291', '73.088602', '2024-07-13 08:09:41'),
(1774, 00000001, '31.4414417', '73.0886031', '2024-07-13 08:09:42'),
(1775, 00000001, '31.4414467', '73.088602', '2024-07-13 08:09:43'),
(1776, 00000001, '31.4414467', '73.088602', '2024-07-13 08:09:43'),
(1777, 00000001, '31.4414505', '73.0885985', '2024-07-13 08:09:44'),
(1778, 00000001, '31.4414541', '73.0885957', '2024-07-13 08:09:45'),
(1779, 00000001, '31.4414564', '73.0885938', '2024-07-13 08:09:46'),
(1780, 00000001, '31.4414505', '73.0885985', '2024-07-13 08:09:46'),
(1781, 00000001, '31.4414516', '73.0885861', '2024-07-13 08:09:50'),
(1782, 00000001, '31.4414553', '73.0885882', '2024-07-13 08:09:50'),
(1783, 00000001, '31.4414516', '73.0885861', '2024-07-13 08:09:51'),
(1784, 00000001, '31.4414553', '73.0885882', '2024-07-13 08:09:51'),
(1785, 00000001, '31.4414483', '73.0885855', '2024-07-13 08:09:52'),
(1786, 00000001, '31.4414515', '73.0885889', '2024-07-13 08:09:53'),
(1787, 00000001, '31.4414515', '73.0885889', '2024-07-13 08:09:53'),
(1788, 00000001, '31.4414552', '73.088593', '2024-07-13 08:09:54'),
(1789, 00000001, '31.441457', '73.0885962', '2024-07-13 08:09:56'),
(1790, 00000001, '31.4414552', '73.088593', '2024-07-13 08:09:56'),
(1791, 00000001, '31.441457', '73.0885953', '2024-07-13 08:09:57'),
(1792, 00000001, '31.4414534', '73.088602', '2024-07-13 08:09:59'),
(1793, 00000001, '31.4414506', '73.0886023', '2024-07-13 08:10:00'),
(1794, 00000001, '31.4414506', '73.0886023', '2024-07-13 08:10:01'),
(1795, 00000001, '31.4414534', '73.088602', '2024-07-13 08:10:02'),
(1796, 00000001, '31.4414462', '73.0886021', '2024-07-13 08:10:02'),
(1797, 00000001, '31.4414462', '73.0886021', '2024-07-13 08:10:03'),
(1798, 00000001, '31.4414462', '73.0886021', '2024-07-13 08:10:05'),
(1799, 00000001, '31.4414462', '73.0886021', '2024-07-13 08:10:07'),
(1800, 00000001, '31.4414314', '73.0886125', '2024-07-13 08:10:07'),
(1801, 00000001, '31.4414462', '73.0886021', '2024-07-13 08:10:07'),
(1802, 00000001, '31.4414294', '73.0886136', '2024-07-13 08:10:07'),
(1803, 00000001, '31.4414286', '73.0886108', '2024-07-13 08:10:09'),
(1804, 00000001, '31.4414286', '73.0886108', '2024-07-13 08:10:09'),
(1805, 00000001, '31.4414286', '73.0886108', '2024-07-13 08:10:10'),
(1806, 00000001, '31.4414267', '73.0886094', '2024-07-13 08:10:12'),
(1807, 00000001, '31.4414267', '73.0886094', '2024-07-13 08:10:13'),
(1808, 00000001, '31.4414286', '73.0886108', '2024-07-13 08:10:13'),
(1809, 00000001, '31.4414267', '73.0886094', '2024-07-13 08:10:13'),
(1810, 00000001, '31.4414267', '73.0886094', '2024-07-13 08:10:14'),
(1811, 00000001, '31.4414267', '73.0886094', '2024-07-13 08:10:16'),
(1812, 00000001, '31.4414267', '73.0886094', '2024-07-13 08:10:16'),
(1813, 00000001, '31.4414267', '73.0886094', '2024-07-13 08:10:21'),
(1814, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:24'),
(1815, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:24'),
(1816, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:24'),
(1817, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:24'),
(1818, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:25'),
(1819, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:25'),
(1820, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:26'),
(1821, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:26'),
(1822, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:26'),
(1823, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:26'),
(1824, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:10:28'),
(1825, 00000001, '31.4414937', '73.0886463', '2024-07-13 08:10:29'),
(1826, 00000001, '31.4414937', '73.0886463', '2024-07-13 08:10:29'),
(1827, 00000001, '31.4414937', '73.0886463', '2024-07-13 08:10:30'),
(1828, 00000001, '31.4414937', '73.0886463', '2024-07-13 08:10:30'),
(1829, 00000001, '31.4414219', '73.0886128', '2024-07-13 08:10:36'),
(1830, 00000001, '31.4414219', '73.0886128', '2024-07-13 08:10:36'),
(1831, 00000001, '31.4414219', '73.0886128', '2024-07-13 08:10:37'),
(1832, 00000001, '31.4414219', '73.0886128', '2024-07-13 08:10:37'),
(1833, 00000001, '31.4414219', '73.0886128', '2024-07-13 08:10:37'),
(1834, 00000001, '31.4414219', '73.0886128', '2024-07-13 08:10:37'),
(1835, 00000001, '31.4414219', '73.0886128', '2024-07-13 08:10:37'),
(1836, 00000001, '31.4414162', '73.0886102', '2024-07-13 08:10:39'),
(1837, 00000001, '31.4414162', '73.0886102', '2024-07-13 08:10:39'),
(1838, 00000001, '31.4414162', '73.0886102', '2024-07-13 08:10:40'),
(1839, 00000001, '31.4414162', '73.0886102', '2024-07-13 08:10:42'),
(1840, 00000001, '31.4413346', '73.0886393', '2024-07-13 08:10:43'),
(1841, 00000001, '31.4413346', '73.0886393', '2024-07-13 08:10:43'),
(1842, 00000001, '31.4413346', '73.0886393', '2024-07-13 08:10:45'),
(1843, 00000001, '31.4413346', '73.0886393', '2024-07-13 08:10:46'),
(1844, 00000001, '31.4413346', '73.0886393', '2024-07-13 08:10:46'),
(1845, 00000001, '31.4413346', '73.0886393', '2024-07-13 08:10:47'),
(1846, 00000001, '31.4413346', '73.0886393', '2024-07-13 08:10:47'),
(1847, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:49'),
(1848, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:49'),
(1849, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:50'),
(1850, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:51'),
(1851, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:52'),
(1852, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:53'),
(1853, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:53'),
(1854, 00000001, '31.4413426', '73.088594', '2024-07-13 08:10:56'),
(1855, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:56'),
(1856, 00000001, '31.441332', '73.0886376', '2024-07-13 08:10:57'),
(1857, 00000001, '31.4413426', '73.088594', '2024-07-13 08:10:59'),
(1858, 00000001, '31.4413426', '73.088594', '2024-07-13 08:10:59'),
(1859, 00000001, '31.4413426', '73.088594', '2024-07-13 08:11:00'),
(1860, 00000001, '31.4413426', '73.088594', '2024-07-13 08:11:00'),
(1861, 00000001, '31.4413426', '73.088594', '2024-07-13 08:11:00'),
(1862, 00000001, '31.4413915', '73.0885995', '2024-07-13 08:11:05'),
(1863, 00000001, '31.4413915', '73.0885995', '2024-07-13 08:11:05'),
(1864, 00000001, '31.4413915', '73.0885995', '2024-07-13 08:11:05'),
(1865, 00000001, '31.4413915', '73.0885995', '2024-07-13 08:11:05'),
(1866, 00000001, '31.4413915', '73.0885995', '2024-07-13 08:11:05'),
(1867, 00000001, '31.4413915', '73.0885995', '2024-07-13 08:11:05'),
(1868, 00000001, '31.4413818', '73.088599', '2024-07-13 08:11:06'),
(1869, 00000001, '31.4413787', '73.0885919', '2024-07-13 08:11:09'),
(1870, 00000001, '31.4413787', '73.0885919', '2024-07-13 08:11:09'),
(1871, 00000001, '31.4413795', '73.0885997', '2024-07-13 08:11:10'),
(1872, 00000001, '31.4413795', '73.0885997', '2024-07-13 08:11:10'),
(1873, 00000001, '31.4413795', '73.0885997', '2024-07-13 08:11:12'),
(1874, 00000001, '31.4413795', '73.0885997', '2024-07-13 08:11:13'),
(1875, 00000001, '31.4413795', '73.0885997', '2024-07-13 08:11:14'),
(1876, 00000001, '31.4413795', '73.0885997', '2024-07-13 08:11:14'),
(1877, 00000001, '31.4413795', '73.0885997', '2024-07-13 08:11:16'),
(1878, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:24'),
(1879, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:24'),
(1880, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:24'),
(1881, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:24'),
(1882, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:24'),
(1883, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:25'),
(1884, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:25'),
(1885, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:25'),
(1886, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:25'),
(1887, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:26'),
(1888, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:26'),
(1889, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:27'),
(1890, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:27'),
(1891, 00000001, '31.441493', '73.0886461', '2024-07-13 08:11:29'),
(1892, 00000001, '31.441493', '73.0886461', '2024-07-13 08:11:31'),
(1893, 00000001, '31.4414918', '73.0886456', '2024-07-13 08:11:32'),
(1894, 00000001, '31.441493', '73.0886461', '2024-07-13 08:11:32'),
(1895, 00000001, '31.441493', '73.0886461', '2024-07-13 08:11:32'),
(1896, 00000001, '31.4414923', '73.0886458', '2024-07-13 08:11:34'),
(1897, 00000001, '31.441493', '73.0886461', '2024-07-13 08:11:35'),
(1898, 00000001, '31.4414923', '73.0886458', '2024-07-13 08:11:35'),
(1899, 00000001, '31.4414923', '73.0886458', '2024-07-13 08:11:35'),
(1900, 00000001, '31.441493', '73.0886461', '2024-07-13 08:11:36'),
(1901, 00000001, '31.4414923', '73.0886458', '2024-07-13 08:11:38'),
(1902, 00000001, '31.4414923', '73.0886458', '2024-07-13 08:11:39'),
(1903, 00000001, '31.4414868', '73.0886406', '2024-07-13 08:11:39'),
(1904, 00000001, '31.4414868', '73.0886406', '2024-07-13 08:11:40'),
(1905, 00000001, '31.4414868', '73.0886406', '2024-07-13 08:11:40'),
(1906, 00000001, '31.4414868', '73.0886406', '2024-07-13 08:11:42'),
(1907, 00000001, '31.4414868', '73.0886406', '2024-07-13 08:11:43'),
(1908, 00000001, '31.4414868', '73.0886406', '2024-07-13 08:11:43'),
(1909, 00000001, '31.441492', '73.0886456', '2024-07-13 08:11:44'),
(1910, 00000001, '31.441492', '73.0886456', '2024-07-13 08:11:44'),
(1911, 00000001, '31.441492', '73.0886456', '2024-07-13 08:11:45'),
(1912, 00000001, '31.441492', '73.0886456', '2024-07-13 08:11:48'),
(1913, 00000001, '31.441492', '73.0886456', '2024-07-13 08:11:49'),
(1914, 00000001, '31.4414924', '73.0886457', '2024-07-13 08:11:49'),
(1915, 00000001, '31.4414924', '73.0886457', '2024-07-13 08:11:50'),
(1916, 00000001, '31.4414924', '73.0886457', '2024-07-13 08:11:51'),
(1917, 00000001, '31.4414924', '73.0886457', '2024-07-13 08:11:52'),
(1918, 00000001, '31.4414924', '73.0886457', '2024-07-13 08:11:53'),
(1919, 00000001, '31.4414924', '73.0886457', '2024-07-13 08:11:53'),
(1920, 00000001, '31.4414924', '73.0886457', '2024-07-13 08:11:54'),
(1921, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:11:54'),
(1922, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:11:55'),
(1923, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:11:56'),
(1924, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:11:59'),
(1925, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:11:59'),
(1926, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:00'),
(1927, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:00'),
(1928, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:02'),
(1929, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:03'),
(1930, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:03'),
(1931, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:04'),
(1932, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:04'),
(1933, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:05'),
(1934, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:06'),
(1935, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:09'),
(1936, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:09'),
(1937, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:10'),
(1938, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:11'),
(1939, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:12'),
(1940, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:13'),
(1941, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:13'),
(1942, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:14'),
(1943, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:12:14'),
(1944, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:12:15'),
(1945, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:12:16'),
(1946, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:12:19'),
(1947, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:36'),
(1948, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:36'),
(1949, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:36'),
(1950, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:36'),
(1951, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:36'),
(1952, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:36'),
(1953, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:36'),
(1954, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1955, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1956, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1957, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1958, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1959, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1960, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1961, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1962, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1963, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1964, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1965, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1966, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1967, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:37'),
(1968, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:39'),
(1969, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:39'),
(1970, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:40'),
(1971, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:12:40'),
(1972, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:42'),
(1973, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:43'),
(1974, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:43'),
(1975, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:44'),
(1976, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:44'),
(1977, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:45'),
(1978, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:12:46'),
(1979, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:49'),
(1980, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:49'),
(1981, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:49'),
(1982, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:50'),
(1983, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:52'),
(1984, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:53'),
(1985, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:53'),
(1986, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:54'),
(1987, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:55'),
(1988, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:56'),
(1989, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:12:57'),
(1990, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:12:59'),
(1991, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:12:59'),
(1992, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:12:59'),
(1993, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:13:01'),
(1994, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:13:02'),
(1995, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:13:03'),
(1996, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:13:03'),
(1997, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:13:04'),
(1998, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:13:04'),
(1999, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:13:05'),
(2000, 00000001, '31.4414922', '73.0886464', '2024-07-13 08:13:06'),
(2001, 00000001, '31.4414898', '73.0886401', '2024-07-13 08:13:09'),
(2002, 00000001, '31.4414898', '73.0886401', '2024-07-13 08:13:09'),
(2003, 00000001, '31.4414898', '73.0886401', '2024-07-13 08:13:10'),
(2004, 00000001, '31.4414898', '73.0886401', '2024-07-13 08:13:11'),
(2005, 00000001, '31.4414921', '73.0886457', '2024-07-13 08:13:12'),
(2006, 00000001, '31.4414921', '73.0886457', '2024-07-13 08:13:13'),
(2007, 00000001, '31.4414921', '73.0886457', '2024-07-13 08:13:13'),
(2008, 00000001, '31.4414921', '73.0886457', '2024-07-13 08:13:14'),
(2009, 00000001, '31.4414921', '73.0886457', '2024-07-13 08:13:14'),
(2010, 00000001, '31.4414921', '73.0886457', '2024-07-13 08:13:16'),
(2011, 00000001, '31.4414921', '73.0886457', '2024-07-13 08:13:18'),
(2012, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:19'),
(2013, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:19'),
(2014, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:19'),
(2015, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:22'),
(2016, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:23'),
(2017, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:23'),
(2018, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:24'),
(2019, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:25'),
(2020, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:25'),
(2021, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:25'),
(2022, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:26'),
(2023, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:29'),
(2024, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:30'),
(2025, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:31'),
(2026, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:31'),
(2027, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:32'),
(2028, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:33'),
(2029, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:33'),
(2030, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:34'),
(2031, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:34'),
(2032, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:36'),
(2033, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:13:36'),
(2034, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:39'),
(2035, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:40'),
(2036, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:40'),
(2037, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:40'),
(2038, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:42'),
(2039, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:43'),
(2040, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:45'),
(2041, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:46'),
(2042, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:46'),
(2043, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:46'),
(2044, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:13:46'),
(2045, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:49'),
(2046, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:49'),
(2047, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:50'),
(2048, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:50'),
(2049, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:53'),
(2050, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:53'),
(2051, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:54'),
(2052, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:54'),
(2053, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:54'),
(2054, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:55'),
(2055, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:56'),
(2056, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:59'),
(2057, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:13:59'),
(2058, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:14:00'),
(2059, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:14:02'),
(2060, 00000001, '31.4414923', '73.088646', '2024-07-13 08:14:02'),
(2061, 00000001, '31.4414923', '73.088646', '2024-07-13 08:14:03'),
(2062, 00000001, '31.4414923', '73.088646', '2024-07-13 08:14:04'),
(2063, 00000001, '31.4414923', '73.088646', '2024-07-13 08:14:04'),
(2064, 00000001, '31.4414923', '73.088646', '2024-07-13 08:14:05'),
(2065, 00000001, '31.4414923', '73.088646', '2024-07-13 08:14:06'),
(2066, 00000001, '31.4414923', '73.088646', '2024-07-13 08:14:06'),
(2067, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:31:55'),
(2068, 00000001, '31.4414931', '73.088646', '2024-07-13 08:32:12'),
(2069, 00000001, '31.4414931', '73.088646', '2024-07-13 08:32:18'),
(2070, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:32:23'),
(2071, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:32:34'),
(2072, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:32:43'),
(2073, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:32:54'),
(2074, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:33:03'),
(2075, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:33:16'),
(2076, 00000001, '31.4414923', '73.0886462', '2024-07-13 08:33:28'),
(2077, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:33:29'),
(2078, 00000001, '31.4414922', '73.0886459', '2024-07-13 08:33:36'),
(2079, 00000001, '31.4414923', '73.088646', '2024-07-13 08:33:36'),
(2080, 00000001, '31.4414923', '73.0886456', '2024-07-13 08:33:43'),
(2081, 00000001, '31.4414931', '73.088646', '2024-07-13 08:33:47'),
(2082, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:33:55'),
(2083, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:33:56'),
(2084, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:34:05'),
(2085, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:34:06'),
(2086, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:34:16'),
(2087, 00000001, '31.4414923', '73.0886463', '2024-07-13 08:34:17'),
(2088, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:34:23'),
(2089, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:34:28'),
(2090, 00000001, '31.441492', '73.0886465', '2024-07-13 08:34:29'),
(2091, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:34:33'),
(2092, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:34:35'),
(2093, 00000001, '31.4414922', '73.0886458', '2024-07-13 08:34:36'),
(2094, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:34:38'),
(2095, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:34:43'),
(2096, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:34:44'),
(2097, 00000001, '31.4414923', '73.0886457', '2024-07-13 08:34:46'),
(2098, 00000001, '31.4414922', '73.0886457', '2024-07-13 08:34:49'),
(2099, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:39'),
(2100, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:39'),
(2101, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2102, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2103, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2104, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2105, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2106, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2107, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2108, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2109, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2110, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2111, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2112, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:40'),
(2113, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:41'),
(2114, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:41'),
(2115, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:41'),
(2116, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:41'),
(2117, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:41'),
(2118, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:41'),
(2119, 00000001, '31.4414923', '73.088646', '2024-07-13 08:35:43');

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
(00000002, 00000002, '', '', '', '', '', '', '', '', '', '', '2024-07-15 11:02:02');

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
  MODIFY `log_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `book_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `c_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `com_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `dd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver_history`
--
ALTER TABLE `driver_history`
  MODIFY `history_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

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
  MODIFY `fare_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

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
  MODIFY `vd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `clients` FOREIGN KEY (`c_id`) REFERENCES `clients` (`c_id`),
  ADD CONSTRAINT `vehicles` FOREIGN KEY (`v_id`) REFERENCES `vehicles` (`v_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
