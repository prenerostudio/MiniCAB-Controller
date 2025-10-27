-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2025 at 12:08 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `address_proofs`
--

CREATE TABLE `address_proofs` (
  `ap_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `ap_1` varchar(255) NOT NULL,
  `ap_2` varchar(255) NOT NULL,
  `ap_created_at` datetime NOT NULL,
  `ap_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `bookings_history`
--

CREATE TABLE `bookings_history` (
  `book_history_id` int(8) UNSIGNED ZEROFILL NOT NULL,
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
  `book_history_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `login_token` varchar(255) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `status`, `company_name`, `commission_type`, `percentage`, `fixed`, `acount_status`, `account_type`, `login_token`, `reg_date`) VALUES
(00000001, 'Azib', 'azibahmed@hotmail.co.uk', '07552834179', 'asdf1234', '', 'Male', 'English', '', 'N3= Finchley Central', '', '', 0, '', '', 0, 0, 0, 1, '', '2024-11-24 23:09:35'),
(00000002, 'Hihya', 'hgjhy@yhoo.com', '09765433', 'bbhiggggyyy6667', '', 'Male', 'Arabic', '', 'N8= Crouch End, Hornsey', '', '', 0, '', '', 0, 0, 0, 1, '', '2024-12-02 14:42:49'),
(00000003, 'Hgft655', 'ycuf7v7@yahoo.com', '+447867777787', 'Lahore@123,', '164-166 High Road', 'Male', 'English', '', 'N7= Holloway', '', '1111', 0, '', '', 0, 0, 0, 1, '', '2024-12-06 20:53:33');

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
  `d_whatsapp` varchar(55) NOT NULL,
  `d_shift` varchar(55) NOT NULL,
  `d_pco` varchar(55) NOT NULL,
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

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `d_whatsapp`, `d_shift`, `d_pco`, `latitude`, `longitude`, `status`, `acount_status`, `signup_type`, `login_token`, `driver_reg_date`) VALUES
(00000001, 'Atiq Ramzan', 'hello@prenerostudio.com', '+443157524000', 'asdf1234', 'FSD', 'WJ123', '6759cc80c88a1_353436928_259877746737947_6774050875938775966_n.jpg', 'Male', 'English', 'Yorkshire', '', '', '', '31.4415474', '73.0886467', 'online', 1, 0, 'f392ae040e4f5f5f7f7a41ff33f494ea2589c5afe132892caa17feaa7381b5bb', '2025-05-03 18:10:05'),
(00000002, 'Azib Ahmed', 'azibahmed@hotmail.co.uk', '+447552834179', 'asdf1234', '', '', '6743acef0fc1e_Screenshot_20241124_223950.jpg', 'Male', '', 'London', '', '', '', '31.4884285', '74.3259868', 'On Ride', 1, 0, 'c2e81e45f54a9500137b6921d287cef69f949d63fe837067cac1b9141d644842', '2025-05-29 18:50:00'),
(00000003, 'shary', 'sharyjagga18@gmail.com', '+443211783119', '12345678', 'St#13 Muzaffar ', '38000', '6759ce4d55f96_1000197648.jpg', 'Male', 'English', 'West Midlands', '', '', '', '31.3782944', '73.0562847', 'online', 1, 0, '9066930ad74bdbdc7a5689592fbe3755daf66be4d8b334126cad6e43ce902b34', '2025-03-04 15:56:24'),
(00000004, 'Arshad Ali', 'att@gmail.com', '+923346452312', '$2y$10$txVdIlu8rMlmaLO6mG58L.bdbkgqZACK1c1w7K7LDh.mgp30KD5xu', '', '38000', '', 'Male', 'English', 'Birmingham', '+923157524000', 'Afternoon Shift', '1234578955', '', '', '', 1, 3, NULL, '0000-00-00 00:00:00'),
(00000005, 'AZIB Ahmed', 'azibahmed@hotmail.co.uk', '07552834179', '$2y$10$rZ9ZYdZM3vVKVDPh5Cfvc.8whwwGrKZLiV/uiBDH1INnV7wKAvfsm', '', 'N12 9PY', '', '', '', '', '+443157524000', 'NightÂ Shift', '1234567890', '', '', '', 2, 3, NULL, '0000-00-00 00:00:00'),
(00000006, 'Azib Ahmed', 'AZIBAHMED@HOTMAIL.CO.UK', '7552834179', '$2y$10$mnDEFtHB8IaG1cU/ItzU0.uWH0Zm4vaPuxHFHb9b1yx/fVjrt7F0S', '', '4157', '', '', '', '', '07552834179', 'NightÂ Shift', '6386637', '', '', '', 2, 3, NULL, '0000-00-00 00:00:00'),
(00000007, 'Saqib', 'saqibahnahhgsh@hotmail.com', '82667276', '$2y$10$Cbk4U8w66S1AxhVcqQZKyeUCcYfYY/vg0nzdfj7W9GPyVq2TwdSWy', '', 'N12 9PY', '', '', '', '', '726378363', 'NightÂ Shift', '762726', '', '', '', 2, 3, NULL, '0000-00-00 00:00:00'),
(00000008, '', '', '', '$2y$10$Te49gX7f0AVlN/S9PzgyQePM4R9QLNvpVaxC2cv1uDAa1cee1/OZ.', '', '', '', '', '', '', '', '', '', '', '', '', 0, 3, NULL, '2025-09-20 16:51:31'),
(00000009, 'Atiq ur Ramzan', 'prenerostudios@gmail.com', '+443346452312', '$2y$10$oill4CcCsSb7hPhxGi6bK..6T4MjdilvRQa4ecxhQxVm0XdEZy8gS', '', '', '', '', '', 'West Midlands', '', '', '', '', '', '', 0, 0, NULL, '2025-09-24 07:47:20');

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
-- Table structure for table `driver_extras`
--

CREATE TABLE `driver_extras` (
  `de_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `de_img` varchar(255) NOT NULL,
  `de_created_at` datetime NOT NULL,
  `de_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `driver_routes`
--

CREATE TABLE `driver_routes` (
  `dr_id` int(8) NOT NULL,
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_sessions`
--

CREATE TABLE `driver_sessions` (
  `doh_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `driver_online_at` datetime NOT NULL,
  `driver_offline_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `driving_license`
--

CREATE TABLE `driving_license` (
  `dl_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dl_number` varchar(25) NOT NULL,
  `dl_expiry` varchar(25) NOT NULL,
  `dl_front` varchar(255) NOT NULL,
  `dl_back` varchar(255) NOT NULL,
  `dl_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `dl_updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvla_check`
--

CREATE TABLE `dvla_check` (
  `dvla_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dvla_number` varchar(255) NOT NULL,
  `dvla_img` varchar(255) NOT NULL,
  `dvla_created_at` datetime NOT NULL,
  `dvla_updated_at` datetime NOT NULL
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
  `ride_status` tinyint(5) NOT NULL DEFAULT 0,
  `job_accepted_time` varchar(15) NOT NULL,
  `job_started_time` varchar(15) NOT NULL,
  `way_to_pickup_time` varchar(15) NOT NULL,
  `arrived_at_pickup_time` varchar(15) NOT NULL,
  `pob_time` varchar(15) NOT NULL,
  `dropoff_time` varchar(15) NOT NULL,
  `job_completed_time` varchar(15) NOT NULL,
  `driver_route` varchar(535) NOT NULL,
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
-- Table structure for table `national_insurance`
--

CREATE TABLE `national_insurance` (
  `ni_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `ni_number` varchar(255) NOT NULL,
  `ni_img` varchar(255) NOT NULL,
  `ni_created_at` datetime NOT NULL,
  `ni_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `open-bookings`
--

CREATE TABLE `open-bookings` (
  `ob_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `ob_status` varchar(15) NOT NULL,
  `ob_created_at` datetime NOT NULL,
  `ob_updated_at` datetime NOT NULL
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
-- Table structure for table `pco_license`
--

CREATE TABLE `pco_license` (
  `pl_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pl_number` varchar(25) NOT NULL,
  `pl_exp` date NOT NULL,
  `pl_img` varchar(255) NOT NULL,
  `pl_created_at` datetime NOT NULL,
  `pl_updated_at` datetime NOT NULL
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
-- Table structure for table `rental_agreement`
--

CREATE TABLE `rental_agreement` (
  `ra_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `ra_num` varchar(55) NOT NULL,
  `ra_exp` date NOT NULL,
  `ra_img` varchar(255) NOT NULL,
  `ra_created_at` datetime NOT NULL,
  `ra_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(00000001, 'Atiq', 'Ramzan', 'hello@prenerostudio.com', '$2y$10$k5Nu/poCw68omzTXF9TAdOMeRCVBQaeEJGljpnfZQkOTsEcazkb4K', '+923157524000', '', 'Super-admin', 'Shop # 24, Hamza Market', 'Faisalabad', 'Punjab', 134, 38000, '', '68120c1dadc46_1746013213.jpg', '2025-04-30 11:40:13'),
(00000002, 'Azib', 'Ali Butt', 'eurodatatechnology@gmail.com', '$2y$10$AWFd8I5yDq3c.FPpvw2tiOQVBG1yI/USMVDc0Sbk8J1jjI7pASzh6', '+44 7550 482970', 'Male', 'Controller', 'London', 'London', 'London', 186, 154, '', '', '2025-04-30 11:53:11'),
(00000003, 'New ', '04May25', 'socialnetworking@hotmail.co.uk', '$2y$10$FrVSf36ThX7p4XYLHTNPHuKZay/ngJ8jldORbUenjTVmv4wvGAdoC', '07552834179', 'Male', 'Controller', 'Highroad', 'London', 'England', 186, 0, 'Ushjsu38', '', '2025-05-04 20:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `user_page_access`
--

CREATE TABLE `user_page_access` (
  `access_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `user_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `add_booking` tinyint(5) NOT NULL DEFAULT 0,
  `open_booking` tinyint(4) NOT NULL DEFAULT 0,
  `all_booking` tinyint(5) NOT NULL DEFAULT 0,
  `upcoming_booking` tinyint(5) NOT NULL DEFAULT 0,
  `inprocess_booking` tinyint(5) NOT NULL DEFAULT 0,
  `completed_booking` tinyint(5) NOT NULL DEFAULT 0,
  `cancelled_booking` tinyint(5) NOT NULL DEFAULT 0,
  `available_timeslot` tinyint(5) NOT NULL DEFAULT 0,
  `waiting_timeslot` tinyint(5) NOT NULL DEFAULT 0,
  `accepted_timeslot` tinyint(5) NOT NULL DEFAULT 0,
  `cancelled_timeslot` tinyint(5) NOT NULL DEFAULT 0,
  `withdrawn_timeslot` tinyint(5) NOT NULL DEFAULT 0,
  `completed_timeslot` tinyint(5) NOT NULL DEFAULT 0,
  `new_bid` tinyint(5) NOT NULL DEFAULT 0,
  `bid_booking` tinyint(5) NOT NULL DEFAULT 0,
  `accepted_bids` tinyint(5) NOT NULL DEFAULT 0,
  `active_companies` tinyint(5) NOT NULL DEFAULT 0,
  `blocked_companies` tinyint(5) NOT NULL DEFAULT 0,
  `deleted_companies` tinyint(5) NOT NULL DEFAULT 0,
  `customer_accounts` tinyint(5) NOT NULL DEFAULT 0,
  `booker_accounts` tinyint(5) NOT NULL DEFAULT 0,
  `deleted_accounts` tinyint(5) NOT NULL DEFAULT 0,
  `web_driver` tinyint(5) NOT NULL DEFAULT 0,
  `new_driver` tinyint(5) NOT NULL DEFAULT 0,
  `active_driver` tinyint(5) NOT NULL DEFAULT 0,
  `inactive_driver` tinyint(5) NOT NULL DEFAULT 0,
  `old_driver` tinyint(5) NOT NULL DEFAULT 0,
  `deleted_drivers` tinyint(5) NOT NULL DEFAULT 0,
  `zones_list` tinyint(5) NOT NULL DEFAULT 0,
  `airports_list` tinyint(5) NOT NULL DEFAULT 0,
  `destinations_list` tinyint(5) NOT NULL DEFAULT 0,
  `railways_list` tinyint(5) NOT NULL DEFAULT 0,
  `company_profile` tinyint(5) NOT NULL DEFAULT 0,
  `vehicles_list` tinyint(5) NOT NULL DEFAULT 0,
  `pricing_models` tinyint(5) NOT NULL DEFAULT 0,
  `driver_reports` tinyint(5) NOT NULL DEFAULT 0,
  `customer_reports` tinyint(5) NOT NULL DEFAULT 0,
  `booker_reports` tinyint(5) NOT NULL DEFAULT 0,
  `activity_logs` tinyint(5) NOT NULL DEFAULT 0,
  `access_created_at` timestamp NULL DEFAULT current_timestamp(),
  `access_updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_page_access`
--

INSERT INTO `user_page_access` (`access_id`, `user_id`, `add_booking`, `open_booking`, `all_booking`, `upcoming_booking`, `inprocess_booking`, `completed_booking`, `cancelled_booking`, `available_timeslot`, `waiting_timeslot`, `accepted_timeslot`, `cancelled_timeslot`, `withdrawn_timeslot`, `completed_timeslot`, `new_bid`, `bid_booking`, `accepted_bids`, `active_companies`, `blocked_companies`, `deleted_companies`, `customer_accounts`, `booker_accounts`, `deleted_accounts`, `web_driver`, `new_driver`, `active_driver`, `inactive_driver`, `old_driver`, `deleted_drivers`, `zones_list`, `airports_list`, `destinations_list`, `railways_list`, `company_profile`, `vehicles_list`, `pricing_models`, `driver_reports`, `customer_reports`, `booker_reports`, `activity_logs`, `access_created_at`, `access_updated_at`) VALUES
(00000001, 00000001, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2025-04-30 11:38:33', '2025-04-30 11:38:33'),
(00000002, 00000002, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2025-04-30 11:50:07', '2025-04-30 11:50:07'),
(00000003, 00000003, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-05-04 20:32:33', '2025-05-04 20:32:33');

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

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_extras`
--

CREATE TABLE `vehicle_extras` (
  `ve_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `ve_img` varchar(255) NOT NULL,
  `ve_created_at` datetime NOT NULL,
  `ve_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_insurance`
--

CREATE TABLE `vehicle_insurance` (
  `vi_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `vi_num` varchar(55) NOT NULL,
  `vi_exp` date NOT NULL,
  `vi_img` varchar(255) NOT NULL,
  `vi_created_at` datetime NOT NULL,
  `vi_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_ins_schedule`
--

CREATE TABLE `vehicle_ins_schedule` (
  `is_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `is_num` varchar(55) NOT NULL,
  `is_img` varchar(255) NOT NULL,
  `is_created_at` datetime NOT NULL,
  `is_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_log_book`
--

CREATE TABLE `vehicle_log_book` (
  `lb_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `lb_number` varchar(55) NOT NULL,
  `lb_img` varchar(255) NOT NULL,
  `lb_created_at` datetime NOT NULL,
  `lb_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_mot`
--

CREATE TABLE `vehicle_mot` (
  `mot_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `mot_num` varchar(55) NOT NULL,
  `mot_expiry` date NOT NULL,
  `mot_img` varchar(255) NOT NULL,
  `mot_created_at` datetime NOT NULL,
  `mot_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_pco`
--

CREATE TABLE `vehicle_pco` (
  `vpco_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `vpco_num` varchar(55) NOT NULL,
  `vpco_exp` date NOT NULL,
  `vpco_img` varchar(255) NOT NULL,
  `vpco_created_at` datetime NOT NULL,
  `vpco_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_pictures`
--

CREATE TABLE `vehicle_pictures` (
  `vp_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `vp_front` varchar(255) NOT NULL,
  `vp_back` varchar(255) NOT NULL,
  `vp_created_at` datetime NOT NULL,
  `vp_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_road_tax`
--

CREATE TABLE `vehicle_road_tax` (
  `rt_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `rt_num` varchar(55) NOT NULL,
  `rt_exp` date NOT NULL,
  `rt_img` varchar(255) NOT NULL,
  `rt_created_at` datetime NOT NULL,
  `rt_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `lat_min` varchar(15) NOT NULL,
  `lat_max` varchar(15) NOT NULL,
  `lng_min` varchar(15) NOT NULL,
  `lng_max` varchar(15) NOT NULL,
  `zone_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_name`, `lat_min`, `lat_max`, `lng_min`, `lng_max`, `zone_created_at`) VALUES
(00000000001, 'N1', '51.526467', '51.5512914', '-0.1307457', '-0.0760385', '2025-02-12 08:18:29'),
(00000000002, 'N2', '51.5711385', '51.604809', '-0.192013', '-0.150792', '2025-02-12 08:18:31'),
(00000000003, 'N4', '51.5580121', '51.6002982', '-0.122014', '-0.0566344', '2025-02-12 08:18:32'),
(00000000004, 'N5', '51.5462393', '51.5620806', '-0.1096356', '-0.086148', '2025-02-12 08:18:34'),
(00000000005, 'N7', '51.5410567', '51.5656478', '-0.1365943', '-0.1034215', '2025-02-12 08:18:36'),
(00000000006, 'N8', '51.5732272', '51.5966577', '-0.1362966', '-0.0990215', '2025-02-12 08:18:38'),
(00000000007, 'N9', '51.6126964', '51.6432734', '-0.0853966', '-0.0289414', '2025-02-12 08:18:40'),
(00000000008, 'N10', '51.5792085', '51.6102789', '-0.1643579', '-0.1303774', '2025-02-12 08:18:42'),
(00000000009, 'N11', '51.5998084', '51.6314263', '-0.1621689', '-0.1106266', '2025-02-12 08:18:44'),
(00000000010, 'N12', '51.6002101', '51.6275183', '-0.211838', '-0.1516131', '2025-02-12 08:18:46'),
(00000000011, 'N13', '51.6057576', '51.6339912', '-0.1247067', '-0.0824167', '2025-02-12 08:18:48'),
(00000000012, 'N14', '51.6142618', '51.6559664', '-0.1494878', '-0.1127384', '2025-02-12 08:18:50'),
(00000000013, 'N15', '51.574359', '51.5917633', '-0.1034414', '-0.0594244', '2025-02-12 08:18:51'),
(00000000014, 'N16', '51.5467323', '51.5773551', '-0.0921974', '-0.0597426', '2025-02-12 08:18:53'),
(00000000015, 'N17', '51.5808228', '51.6100959', '-0.0987188', '-0.0432671', '2025-02-12 08:18:55'),
(00000000016, 'N18', '51.6013314', '51.6221586', '-0.097388', '-0.0344266', '2025-02-12 08:18:57'),
(00000000017, 'N19', '51.552425', '51.5741832', '-0.1467072', '-0.1167737', '2025-02-12 08:18:59'),
(00000000018, 'N20', '51.6179871', '51.6402814', '-0.2355371', '-0.1502141', '2025-02-12 08:19:01'),
(00000000019, 'N21', '51.6237346', '51.6498114', '-0.1193181', '-0.0795818', '2025-02-12 08:19:03'),
(00000000020, 'N22', '51.5902898', '51.6125755', '-0.1405614', '-0.0908285', '2025-02-12 08:19:05'),
(00000000021, 'NW1', '51.5181816', '51.5491029', '-0.1710652', '-0.1225189', '2025-02-12 08:19:07'),
(00000000022, 'NW2', '51.5423013', '51.5772408', '-0.2545518', '-0.1926397', '2025-02-12 08:19:09'),
(00000000023, 'NW3', '51.5389944', '51.5725695', '-0.198863', '-0.1503295', '2025-02-12 08:19:11'),
(00000000024, 'NW4', '51.5722448', '51.6066401', '-0.240172', '-0.2060506', '2025-02-12 08:19:13'),
(00000000025, 'NW5', '51.5444769', '51.5638808', '-0.1589275', '-0.1300452', '2025-02-12 08:19:15'),
(00000000026, 'NW6', '51.5275369', '51.5572343', '-0.2231894', '-0.1751049', '2025-02-12 08:19:17'),
(00000000027, 'NW7', '51.6006833', '51.6419471', '-0.2728431', '-0.1996722', '2025-02-12 08:19:18'),
(00000000028, 'NW8', '51.521033', '51.5420088', '-0.1901306', '-0.1546578', '2025-02-12 08:19:20'),
(00000000029, 'NW9', '51.5634155', '51.6099163', '-0.2861413', '-0.2318774', '2025-02-12 08:19:22'),
(00000000030, 'NW10', '51.5220713', '51.5758464', '-0.2934827', '-0.2115132', '2025-02-12 08:19:24'),
(00000000031, 'NW11', '51.561953', '51.5908788', '-0.2161936', '-0.174374', '2025-02-12 08:19:26'),
(00000000032, 'SE1', '51.482756', '51.5094946', '-0.1276992', '-0.0600444', '2025-02-12 08:19:28'),
(00000000033, 'SE2', '51.473384', '51.508405', '0.0991966', '0.1392757', '2025-02-12 08:19:30'),
(00000000034, 'SE3', '51.4545789', '51.4848087', '-0.0086245', '0.1051638', '2025-02-12 08:19:32'),
(00000000035, 'SE4', '51.4466587', '51.4722026', '-0.0508264', '-0.0214411', '2025-02-12 08:19:34'),
(00000000036, 'SE5', '51.4577531', '51.4883073', '-0.1112464', '-0.0728691', '2025-02-12 08:19:36'),
(00000000037, 'SE6', '51.4222726', '51.4512694', '-0.0393088', '0.0155156', '2025-02-12 08:19:38'),
(00000000038, 'SE7', '51.474141', '51.4970655', '0.0193609', '0.0530201', '2025-02-12 08:19:40'),
(00000000039, 'SE8', '51.4656259', '51.493624', '-0.0465317', '-0.0133075', '2025-02-12 08:19:42'),
(00000000040, 'SE9', '51.4205704', '51.4714601', '0.0261494', '0.0882568', '2025-02-12 08:19:44'),
(00000000041, 'SE10', '51.4690157', '51.506202', '-0.021967', '0.0231881', '2025-02-12 08:19:46'),
(00000000042, 'SE11', '51.4807198', '51.4970247', '-0.1226967', '-0.1015098', '2025-02-12 08:19:48'),
(00000000043, 'SE12', '51.4219408', '51.4603899', '0.0006012', '0.0385403', '2025-02-12 08:19:49'),
(00000000044, 'SE13', '51.445282', '51.474421', '-0.0301063', '0.006845', '2025-02-12 08:19:51'),
(00000000045, 'SE14', '51.465345', '51.4880401', '-0.0540067', '-0.0263066', '2025-02-12 08:19:53'),
(00000000046, 'SE15', '51.4529526', '51.4869691', '-0.0866559', '-0.044924', '2025-02-12 08:19:55'),
(00000000047, 'SE16', '51.4834035', '51.5080586', '-0.0829341', '-0.0307635', '2025-02-12 08:19:57'),
(00000000048, 'SE17', '51.4795788', '51.4961458', '-0.1076125', '-0.077775', '2025-02-12 08:20:00'),
(00000000049, 'SE18', '51.4640304', '51.497697', '0.0373121', '0.1077459', '2025-02-12 08:20:01'),
(00000000050, 'SE19', '51.4049677', '51.4296922', '-0.1076408', '-0.0655599', '2025-02-12 08:20:03'),
(00000000051, 'SE20', '51.4005259', '51.4241997', '-0.0737023', '-0.0450899', '2025-02-12 08:20:05'),
(00000000052, 'SE21', '51.4276012', '51.4548964', '-0.106084', '-0.06831', '2025-02-12 08:20:07'),
(00000000053, 'SE22', '51.4401031', '51.4656671', '-0.0874422', '-0.050997', '2025-02-12 08:20:09'),
(00000000054, 'SE23', '51.4293455', '51.4707039', '-0.070343', '-0.0332512', '2025-02-12 08:20:11'),
(00000000055, 'SE24', '51.4409798', '51.4660924', '-0.1110049', '-0.0849874', '2025-02-12 08:20:13'),
(00000000056, 'SE25', '51.383881', '51.4102362', '-0.0934554', '-0.0541723', '2025-02-12 08:20:15'),
(00000000057, 'SE26', '51.417846', '51.4380956', '-0.07826', '-0.02797', '2025-02-12 08:20:17'),
(00000000058, 'SE27', '51.4225764', '51.4410574', '-0.1158607', '-0.0855142', '2025-02-12 08:20:19'),
(00000000059, 'SE28', '51.4898113', '51.5153358', '0.0725153', '0.1461936', '2025-02-12 08:20:20'),
(00000000060, 'SW1', '51.4839696', '51.51038', '-0.1628816', '-0.1190027', '2025-02-12 08:20:22'),
(00000000061, 'SW2', '51.4360653', '51.4622075', '-0.1436572', '-0.105155', '2025-02-12 08:20:24'),
(00000000062, 'SW3', '51.4818579', '51.5017644', '-0.1798581', '-0.1500367', '2025-02-12 08:20:26'),
(00000000063, 'SW4', '51.4476746', '51.4747695', '-0.162205', '-0.1198231', '2025-02-12 08:20:28'),
(00000000064, 'SW5', '51.4856161', '51.4952631', '-0.2023586', '-0.1819319', '2025-02-12 08:20:30'),
(00000000065, 'SW6', '51.4634857', '51.4893186', '-0.2285897', '-0.1791877', '2025-02-12 08:20:32'),
(00000000066, 'SW7', '51.4873561', '51.5039861', '-0.1894606', '-0.1617648', '2025-02-12 08:20:34'),
(00000000067, 'SW8', '51.4660035', '51.4871524', '-0.1540065', '-0.1135074', '2025-02-12 08:20:36'),
(00000000068, 'SW9', '51.4577533', '51.4812895', '-0.1304741', '-0.1006759', '2025-02-12 08:20:38'),
(00000000069, 'SW10', '51.4730968', '51.4907922', '-0.1936283', '-0.172636', '2025-02-12 08:20:39'),
(00000000070, 'SW11', '51.4483421', '51.4858379', '-0.185923', '-0.1264466', '2025-02-12 08:20:41'),
(00000000071, 'SW12', '51.4329447', '51.4542725', '-0.1652555', '-0.1304286', '2025-02-12 08:20:43'),
(00000000072, 'SW13', '51.4650409', '51.4891323', '-0.2571464', '-0.225566', '2025-02-12 08:20:45'),
(00000000073, 'SW14', '51.4548741', '51.4735479', '-0.2808552', '-0.2513052', '2025-02-12 08:20:47'),
(00000000074, 'SW15', '51.4234656', '51.4761059', '-0.2680283', '-0.1985499', '2025-02-12 08:20:49'),
(00000000075, 'SW16', '51.3989151', '51.4404688', '-0.1525823', '-0.104769', '2025-02-12 08:20:51'),
(00000000076, 'SW17', '51.4176949', '51.4465721', '-0.1911789', '-0.1447511', '2025-02-12 08:20:53'),
(00000000077, 'SW18', '51.4344308', '51.4659225', '-0.2163357', '-0.1634431', '2025-02-12 08:20:55'),
(00000000078, 'SW19', '51.4018671', '51.4517622', '-0.2532763', '-0.1658533', '2025-02-12 08:20:57'),
(00000000079, 'SW20', '51.3914499', '51.4282207', '-0.2578966', '-0.204588', '2025-02-12 08:20:59'),
(00000000080, 'W1', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-02-12 08:21:00'),
(00000000081, 'W2', '51.5021711', '51.5247211', '-0.200807', '-0.1526405', '2025-02-12 08:21:03'),
(00000000082, 'W3', '51.4930751', '51.5285002', '-0.2938302', '-0.2446634', '2025-02-12 08:21:05'),
(00000000083, 'W4', '51.470586', '51.5049485', '-0.2878457', '-0.2427799', '2025-02-12 08:21:07'),
(00000000084, 'W5', '51.4917778', '51.5353487', '-0.3236721', '-0.281625', '2025-02-12 08:21:09'),
(00000000085, 'W6', '51.4816219', '51.503219', '-0.2496055', '-0.2090354', '2025-02-12 08:21:10'),
(00000000086, 'W7', '51.4924626', '51.5285698', '-0.351573', '-0.3227212', '2025-02-12 08:21:12'),
(00000000087, 'W8', '51.4935719', '51.5101183', '-0.206937', '-0.1729163', '2025-02-12 08:21:14'),
(00000000088, 'W9', '51.5204875', '51.5357331', '-0.2077417', '-0.176718', '2025-02-12 08:21:16'),
(00000000089, 'W10', '51.5111158', '51.5335504', '-0.2411272', '-0.2014415', '2025-02-12 08:21:18'),
(00000000090, 'W11', '51.5035391', '51.5214833', '-0.2199851', '-0.1930701', '2025-02-12 08:21:20'),
(00000000091, 'W12', '51.4976028', '51.5243467', '-0.2532785', '-0.2150609', '2025-02-12 08:21:22'),
(00000000092, 'W13', '51.4961988', '51.5311614', '-0.3356536', '-0.3086644', '2025-02-12 08:21:24'),
(00000000093, 'W14', '51.4843604', '51.5054669', '-0.222502', '-0.1990329', '2025-02-12 08:21:26'),
(00000000094, 'E1', '51.5084076', '51.5273098', '-0.0794887', '-0.0336199', '2025-02-12 08:21:28'),
(00000000095, 'E2', '51.5227184', '51.5368002', '-0.0790813', '-0.0401986', '2025-02-12 08:21:30'),
(00000000096, 'E3', '51.5151624', '51.5428539', '-0.0476375', '0.0014455', '2025-02-12 08:21:32'),
(00000000097, 'E4', '51.6004451', '51.6693649', '-0.0399256', '0.0267634', '2025-02-12 08:21:34'),
(00000000098, 'E5', '51.5486207', '51.5808228', '-0.072145', '-0.0308111', '2025-02-12 08:21:35'),
(00000000099, 'E6', '51.5068206', '51.5446798', '0.034408', '0.0948084', '2025-02-12 08:21:37'),
(00000000100, 'E7', '51.5368029', '51.5637084', '0.0086548', '0.0480722', '2025-02-12 08:21:39'),
(00000000101, 'E8', '51.5340221', '51.5549641', '-0.0779661', '-0.0516773', '2025-02-12 08:21:41'),
(00000000102, 'E9', '51.5330574', '51.5553067', '-0.0734585', '-0.0148638', '2025-02-12 08:21:43'),
(00000000103, 'E10', '51.5513042', '51.5813499', '-0.0514706', '0.0039371', '2025-02-12 08:21:45'),
(00000000104, 'E11', '51.5522898', '51.5888637', '-0.0088005', '0.0473981', '2025-02-12 08:21:47'),
(00000000105, 'E12', '51.5392035', '51.567113', '0.0252901', '0.0692558', '2025-02-12 08:21:49'),
(00000000106, 'E13', '51.5169233', '51.5381598', '0.0095778', '0.0427017', '2025-02-12 08:21:51'),
(00000000107, 'E14', '51.4845174', '51.5292147', '-0.0426855', '0.0118075', '2025-02-12 08:21:53'),
(00000000108, 'E15', '51.5238998', '51.5566387', '-0.0259028', '0.0248865', '2025-02-12 08:21:54'),
(00000000109, 'E16', '51.4963789', '51.5284923', '-0.0051151', '0.0873028', '2025-02-12 08:21:56'),
(00000000110, 'E17', '51.5690024', '51.6059487', '-0.0595118', '0.0113624', '2025-02-12 08:21:58'),
(00000000111, 'E18', '51.5833059', '51.6012241', '0.0075371', '0.0395057', '2025-02-12 08:22:00'),
(00000000112, 'E20', '51.5333505', '51.5556402', '-0.0223925', '-0.0031179', '2025-02-12 08:22:02'),
(00000000113, 'EC1A', '51.5151404', '51.5251854', '-0.112569', '-0.0952965', '2025-02-12 08:22:04'),
(00000000114, 'EC1M', '51.5179631', '51.5238604', '-0.1072861', '-0.0964914', '2025-02-12 08:22:06'),
(00000000115, 'EC1N', '51.5169224', '51.5220387', '-0.1126981', '-0.1052379', '2025-02-12 08:22:08'),
(00000000116, 'EC1P', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-02-12 08:22:10'),
(00000000117, 'EC1R', '51.5211738', '51.531516', '-0.1133632', '-0.1027887', '2025-02-12 08:22:12'),
(00000000118, 'EC1V', '51.5225228', '51.5327768', '-0.1072812', '-0.0782378', '2025-02-12 08:22:14'),
(00000000119, 'EC1Y', '51.5201157', '51.5261034', '-0.0979616', '-0.0855541', '2025-02-12 08:22:16'),
(00000000120, 'EC2A', '51.5184844', '51.5270285', '-0.0887763', '-0.0772896', '2025-02-12 08:22:18'),
(00000000121, 'EC2M', '51.5152879', '51.5203405', '-0.0895892', '-0.0768701', '2025-02-12 08:22:20'),
(00000000122, 'EC2N', '51.5136035', '51.5171284', '-0.0877953', '-0.0806127', '2025-02-12 08:22:22'),
(00000000123, 'EC2P', '51.5158968', '51.5170898', '-0.0941145', '-0.0923366', '2025-02-12 08:22:23'),
(00000000124, 'EC2R', '51.5128498', '51.5174847', '-0.0924799', '-0.0836757', '2025-02-12 08:22:26'),
(00000000125, 'EC2V', '51.5134531', '51.5178278', '-0.0983535', '-0.0897415', '2025-02-12 08:22:27'),
(00000000126, 'EC2Y', '51.5172867', '51.5222459', '-0.0974787', '-0.0876581', '2025-02-12 08:22:29'),
(00000000127, 'EC3A', '51.5126515', '51.5160754', '-0.0828445', '-0.0742659', '2025-02-12 08:22:31'),
(00000000128, 'EC3M', '51.510105', '51.5133804', '-0.0855194', '-0.0779012', '2025-02-12 08:22:33'),
(00000000129, 'EC3N', '51.5051497', '51.5148025', '-0.0816789', '-0.0711074', '2025-02-12 08:22:36'),
(00000000130, 'EC3P', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-02-12 08:22:38'),
(00000000131, 'EC3R', '51.5068267', '51.5114784', '-0.0870444', '-0.078659', '2025-02-12 08:22:39'),
(00000000132, 'EC3V', '51.5107555', '51.5148356', '-0.0893103', '-0.0812791', '2025-02-12 08:22:41'),
(00000000133, 'EC4A', '51.5137153', '51.5178283', '-0.1117661', '-0.1034559', '2025-02-12 08:22:43'),
(00000000134, 'EC4M', '51.5122243', '51.5166959', '-0.1044528', '-0.0928159', '2025-02-12 08:22:45'),
(00000000135, 'EC4N', '51.5106947', '51.5136094', '-0.0958155', '-0.0861113', '2025-02-12 08:22:47'),
(00000000136, 'EC4P', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-02-12 08:22:49'),
(00000000137, 'EC4R', '51.5075728', '51.5122541', '-0.0947794', '-0.0855194', '2025-02-12 08:22:51'),
(00000000138, 'EC4V', '51.5087858', '51.5140536', '-0.1118012', '-0.0929211', '2025-02-12 08:22:53'),
(00000000139, 'EC4Y', '51.51096', '51.5142288', '-0.1124803', '-0.1027835', '2025-02-12 08:22:55'),
(00000000140, 'WC1A', '51.5160164', '51.52014', '-0.1306899', '-0.120887', '2025-02-12 08:22:56'),
(00000000141, 'WC1B', '51.5164153', '51.5235435', '-0.1322545', '-0.1193185', '2025-02-12 08:22:58'),
(00000000142, 'WC1E', '51.51802', '51.5255107', '-0.1373311', '-0.1244693', '2025-02-12 08:23:00'),
(00000000143, 'WC1H', '51.5216664', '51.5304854', '-0.1344133', '-0.1187161', '2025-02-12 08:23:02'),
(00000000144, 'WC1N', '51.5190255', '51.526696', '-0.1272451', '-0.1138362', '2025-02-12 08:23:04'),
(00000000145, 'WC1R', '51.5179371', '51.5215193', '-0.1203304', '-0.1116431', '2025-02-12 08:23:07'),
(00000000146, 'WC1V', '51.5148185', '51.5192224', '-0.1266493', '-0.1104007', '2025-02-12 08:23:09'),
(00000000147, 'WC1X', '51.5183412', '51.5314761', '-0.1226281', '-0.1093415', '2025-02-12 08:23:11'),
(00000000148, 'WC2A', '51.5131815', '51.5180784', '-0.1198584', '-0.1107777', '2025-02-12 08:23:13'),
(00000000149, 'WC2B', '51.5118711', '51.5176795', '-0.1247178', '-0.1147516', '2025-02-12 08:23:15'),
(00000000150, 'WC2E', '51.5099137', '51.5150475', '-0.1272502', '-0.1190258', '2025-02-12 08:23:17'),
(00000000151, 'WC2H', '51.5083016', '51.5170092', '-0.1319154', '-0.1232186', '2025-02-12 08:23:19'),
(00000000152, 'WC2N', '51.5056585', '51.5117841', '-0.1290915', '-0.1164559', '2025-02-12 08:23:20'),
(00000000153, 'WC2R', '51.5079845', '51.5139283', '-0.1259237', '-0.1100217', '2025-02-12 08:23:22'),
(00000000154, 'N1', '51.526467', '51.5512914', '-0.1307457', '-0.0760385', '2025-03-04 15:05:36'),
(00000000155, 'N2', '51.5711385', '51.604809', '-0.192013', '-0.150792', '2025-03-04 15:05:38'),
(00000000156, 'N4', '51.5580121', '51.6002982', '-0.122014', '-0.0566344', '2025-03-04 15:05:40'),
(00000000157, 'N5', '51.5462393', '51.5620806', '-0.1096356', '-0.086148', '2025-03-04 15:05:43'),
(00000000158, 'N7', '51.5410567', '51.5656478', '-0.1365943', '-0.1034215', '2025-03-04 15:05:45'),
(00000000159, 'N8', '51.5732272', '51.5966577', '-0.1362966', '-0.0990215', '2025-03-04 15:05:47'),
(00000000160, 'N9', '51.6126964', '51.6432734', '-0.0853966', '-0.0289414', '2025-03-04 15:05:49'),
(00000000161, 'N10', '51.5792085', '51.6102789', '-0.1643579', '-0.1303774', '2025-03-04 15:05:51'),
(00000000162, 'N11', '51.5998084', '51.6314263', '-0.1621689', '-0.1106266', '2025-03-04 15:05:53'),
(00000000163, 'N12', '51.6002101', '51.6275183', '-0.211838', '-0.1516131', '2025-03-04 15:05:56'),
(00000000164, 'N13', '51.6057576', '51.6339912', '-0.1247067', '-0.0824167', '2025-03-04 15:05:58'),
(00000000165, 'N14', '51.6142618', '51.6559664', '-0.1494878', '-0.1127384', '2025-03-04 15:06:00'),
(00000000166, 'N15', '51.574359', '51.5917633', '-0.1034414', '-0.0594244', '2025-03-04 15:06:02'),
(00000000167, 'N16', '51.5467323', '51.5773551', '-0.0921974', '-0.0597426', '2025-03-04 15:06:04'),
(00000000168, 'N17', '51.5808228', '51.6100959', '-0.0987188', '-0.0432671', '2025-03-04 15:06:06'),
(00000000169, 'N18', '51.6013314', '51.6221586', '-0.097388', '-0.0344266', '2025-03-04 15:06:08'),
(00000000170, 'N19', '51.552425', '51.5741832', '-0.1467072', '-0.1167737', '2025-03-04 15:06:11'),
(00000000171, 'N20', '51.6179871', '51.6402814', '-0.2355371', '-0.1502141', '2025-03-04 15:06:13'),
(00000000172, 'N21', '51.6237346', '51.6498114', '-0.1193181', '-0.0795818', '2025-03-04 15:06:15'),
(00000000173, 'N22', '51.5902898', '51.6125755', '-0.1405614', '-0.0908285', '2025-03-04 15:06:17'),
(00000000174, 'NW1', '51.5181816', '51.5491029', '-0.1710652', '-0.1225189', '2025-03-04 15:06:19'),
(00000000175, 'NW2', '51.5423013', '51.5772408', '-0.2545518', '-0.1926397', '2025-03-04 15:06:21'),
(00000000176, 'NW3', '51.5389944', '51.5725695', '-0.198863', '-0.1503295', '2025-03-04 15:06:23'),
(00000000177, 'NW4', '51.5722448', '51.6066401', '-0.240172', '-0.2060506', '2025-03-04 15:06:26'),
(00000000178, 'NW5', '51.5444769', '51.5638808', '-0.1589275', '-0.1300452', '2025-03-04 15:06:28'),
(00000000179, 'NW6', '51.5275369', '51.5572343', '-0.2231894', '-0.1751049', '2025-03-04 15:06:30'),
(00000000180, 'NW7', '51.6006833', '51.6419471', '-0.2728431', '-0.1996722', '2025-03-04 15:06:32'),
(00000000181, 'NW8', '51.521033', '51.5420088', '-0.1901306', '-0.1546578', '2025-03-04 15:06:34'),
(00000000182, 'NW9', '51.5634155', '51.6099163', '-0.2861413', '-0.2318774', '2025-03-04 15:06:37'),
(00000000183, 'NW10', '51.5220713', '51.5758464', '-0.2934827', '-0.2115132', '2025-03-04 15:06:39'),
(00000000184, 'NW11', '51.561953', '51.5908788', '-0.2161936', '-0.174374', '2025-03-04 15:06:41'),
(00000000185, 'SE1', '51.482756', '51.5094946', '-0.1276992', '-0.0600444', '2025-03-04 15:06:43'),
(00000000186, 'SE2', '51.473384', '51.508405', '0.0991966', '0.1392757', '2025-03-04 15:06:45'),
(00000000187, 'SE3', '51.4545789', '51.4848087', '-0.0086245', '0.1051638', '2025-03-04 15:06:47'),
(00000000188, 'SE4', '51.4466587', '51.4722026', '-0.0508264', '-0.0214411', '2025-03-04 15:06:49'),
(00000000189, 'SE5', '51.4577531', '51.4883073', '-0.1112464', '-0.0728691', '2025-03-04 15:06:52'),
(00000000190, 'SE6', '51.4222726', '51.4512694', '-0.0393088', '0.0155156', '2025-03-04 15:06:54'),
(00000000191, 'SE7', '51.474141', '51.4970655', '0.0193609', '0.0530201', '2025-03-04 15:06:56'),
(00000000192, 'SE8', '51.4656259', '51.493624', '-0.0465317', '-0.0133075', '2025-03-04 15:06:58'),
(00000000193, 'SE9', '51.4205704', '51.4714601', '0.0261494', '0.0882568', '2025-03-04 15:07:00'),
(00000000194, 'SE10', '51.4690157', '51.506202', '-0.021967', '0.0231881', '2025-03-04 15:07:02'),
(00000000195, 'SE11', '51.4807198', '51.4970247', '-0.1226967', '-0.1015098', '2025-03-04 15:07:05'),
(00000000196, 'SE12', '51.4219408', '51.4603899', '0.0006012', '0.0385403', '2025-03-04 15:07:07'),
(00000000197, 'SE13', '51.445282', '51.474421', '-0.0301063', '0.006845', '2025-03-04 15:07:09'),
(00000000198, 'SE14', '51.465345', '51.4880401', '-0.0540067', '-0.0263066', '2025-03-04 15:07:11'),
(00000000199, 'SE15', '51.4529526', '51.4869691', '-0.0866559', '-0.044924', '2025-03-04 15:07:13'),
(00000000200, 'SE16', '51.4834035', '51.5080586', '-0.0829341', '-0.0307635', '2025-03-04 15:07:15'),
(00000000201, 'SE17', '51.4795788', '51.4961458', '-0.1076125', '-0.077775', '2025-03-04 15:07:17'),
(00000000202, 'SE18', '51.4640304', '51.497697', '0.0373121', '0.1077459', '2025-03-04 15:07:19'),
(00000000203, 'SE19', '51.4049677', '51.4296922', '-0.1076408', '-0.0655599', '2025-03-04 15:07:22'),
(00000000204, 'SE20', '51.4005259', '51.4241997', '-0.0737023', '-0.0450899', '2025-03-04 15:07:24'),
(00000000205, 'SE21', '51.4276012', '51.4548964', '-0.106084', '-0.06831', '2025-03-04 15:07:26'),
(00000000206, 'SE22', '51.4401031', '51.4656671', '-0.0874422', '-0.050997', '2025-03-04 15:07:28'),
(00000000207, 'SE23', '51.4293455', '51.4707039', '-0.070343', '-0.0332512', '2025-03-04 15:07:30'),
(00000000208, 'SE24', '51.4409798', '51.4660924', '-0.1110049', '-0.0849874', '2025-03-04 15:07:32'),
(00000000209, 'SE25', '51.383881', '51.4102362', '-0.0934554', '-0.0541723', '2025-03-04 15:07:34'),
(00000000210, 'EN1', '51.6339728', '51.6818169', '-0.0836417', '-0.0445415', '2025-03-05 08:11:43'),
(00000000211, 'EN2', '51.6445124', '51.7005072', '-0.1623605', '-0.0556429', '2025-03-05 08:11:45'),
(00000000212, 'EN3', '51.6358036', '51.6821846', '-0.0549939', '-0.0025459', '2025-03-05 08:11:47'),
(00000000213, 'EN4', '51.6298227', '51.6855581', '-0.1942867', '-0.0272403', '2025-03-05 08:11:49'),
(00000000214, 'EN5', '51.6359907', '51.6866676', '-0.256036', '-0.1664391', '2025-03-05 08:11:52'),
(00000000215, 'EN6', '51.6778546', '51.7268876', '-0.2681254', '-0.1018469', '2025-03-05 08:11:54'),
(00000000216, 'EN7', '51.6796999', '51.7406251', '-0.1119354', '-0.0439723', '2025-03-05 08:11:56'),
(00000000217, 'EN8', '51.6794632', '51.7325492', '-0.0592149', '-0.0095496', '2025-03-05 08:11:58'),
(00000000218, 'EN9', '51.6652595', '51.7504518', '-0.0211531', '0.0706109', '2025-03-05 08:12:00'),
(00000000219, 'EN10', '51.7119292', '51.7564063', '-0.096562', '0.0066623', '2025-03-05 08:12:02'),
(00000000220, 'EN11', '51.7450863', '51.7816575', '-0.0561845', '0.0139111', '2025-03-05 08:12:04'),
(00000000221, 'CM0', '51.6176152', '51.7488585', '0.7603346', '0.9821885', '2025-03-05 08:12:06'),
(00000000222, 'CM1', '51.6941648', '51.8300643', '0.320406', '0.5158758', '2025-03-05 08:12:08'),
(00000000223, 'CM2', '51.6611325', '51.7568343', '0.4216149', '0.5646177', '2025-03-05 08:12:10'),
(00000000224, 'CM3', '51.6296019', '51.8644398', '0.3654646', '0.8011502', '2025-03-05 08:12:13'),
(00000000225, 'CM4', '51.640508', '51.7383084', '0.2816055', '0.4959591', '2025-03-05 08:12:15'),
(00000000226, 'CM5', '51.6636667', '51.7934753', '0.1624738', '0.3499639', '2025-03-05 08:12:17'),
(00000000227, 'CM6', '51.7636538', '51.9722108', '0.2401613', '0.5181493', '2025-03-05 08:12:19'),
(00000000228, 'CM7', '51.8631685', '52.0240397', '0.3887852', '0.6023555', '2025-03-05 08:12:21'),
(00000000229, 'CM8', '51.7556718', '51.8810275', '0.5421367', '0.7187208', '2025-03-05 08:12:23'),
(00000000230, 'CM9', '51.6716851', '51.8088923', '0.5860585', '0.9032405', '2025-03-05 08:12:25'),
(00000000231, 'CM11', '51.5882599', '51.65932', '0.4170102', '0.5163793', '2025-03-05 08:12:27'),
(00000000232, 'CM12', '51.5836338', '51.6554625', '0.3634604', '0.4381703', '2025-03-05 08:12:29'),
(00000000233, 'CM13', '51.555005', '51.6583915', '0.2643655', '0.4034916', '2025-03-05 08:12:31'),
(00000000234, 'CM14', '51.5944378', '51.6817128', '0.2016822', '0.3239081', '2025-03-05 08:12:33'),
(00000000235, 'CM15', '51.6133129', '51.7000273', '0.2377034', '0.3688569', '2025-03-05 08:12:36'),
(00000000236, 'CM16', '51.6516148', '51.7448398', '0.0527235', '0.1977145', '2025-03-05 08:12:38'),
(00000000237, 'CM17', '51.7289412', '51.8064624', '0.1133333', '0.2520824', '2025-03-05 08:12:40'),
(00000000238, 'CM18', '51.729895', '51.7671396', '0.08608', '0.1288905', '2025-03-05 08:12:42'),
(00000000239, 'CM19', '51.7382734', '51.7798688', '0.0098506', '0.0931811', '2025-03-05 08:12:44'),
(00000000240, 'CM20', '51.7637146', '51.8109995', '0.0618427', '0.1406691', '2025-03-05 08:12:46'),
(00000000241, 'CM21', '51.7888716', '51.8465806', '0.0693475', '0.1850324', '2025-03-05 08:12:48'),
(00000000242, 'CM22', '51.7827535', '51.9487407', '0.1566935', '0.3079616', '2025-03-05 08:12:50'),
(00000000243, 'CM23', '51.8255806', '51.9555056', '0.1076121', '0.2071147', '2025-03-05 08:12:52'),
(00000000244, 'CM24', '51.8694403', '51.9200113', '0.1664875', '0.269019', '2025-03-05 08:12:54'),
(00000000245, 'CM77', '51.8286856', '51.9202963', '0.4692487', '0.6653369', '2025-03-05 08:12:56'),
(00000000246, 'CM92', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-03-05 08:12:58'),
(00000000247, 'CM98', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-03-05 08:13:00'),
(00000000248, 'CM99', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-03-05 08:13:02'),
(00000000249, 'BR1', '51.3899649', '51.4357354', '-0.0145541', '0.0667368', '2025-03-05 08:13:05'),
(00000000250, 'BR2', '51.3302565', '51.4160564', '-0.0113778', '0.0654897', '2025-03-05 08:13:07'),
(00000000251, 'BR3', '51.3770309', '51.4247372', '-0.0575951', '0.0004971', '2025-03-05 08:13:09'),
(00000000252, 'BR4', '51.3548107', '51.3918699', '-0.0267879', '0.0189342', '2025-03-05 08:13:11'),
(00000000253, 'BR5', '51.3629455', '51.4170539', '0.0618988', '0.1514304', '2025-03-05 08:13:13'),
(00000000254, 'BR6', '51.3190069', '51.3884646', '0.0345813', '0.1787456', '2025-03-05 08:13:15'),
(00000000255, 'BR7', '51.3947406', '51.4317585', '0.0372972', '0.1004006', '2025-03-05 08:13:17'),
(00000000256, 'BR8', '51.3687941', '51.4176623', '0.1339057', '0.2230747', '2025-03-05 08:13:19'),
(00000000257, 'WD3', '51.5965011', '51.7026036', '-0.5444111', '-0.4248163', '2025-03-05 08:13:21'),
(00000000258, 'WD4', '51.6772731', '51.7277438', '-0.5150814', '-0.4161819', '2025-03-05 08:13:23'),
(00000000259, 'WD5', '51.6932407', '51.7338299', '-0.4360872', '-0.3856635', '2025-03-05 08:13:26'),
(00000000260, 'WD6', '51.6356087', '51.6895369', '-0.3433633', '-0.2349296', '2025-03-05 08:13:28'),
(00000000261, 'WD7', '51.6652844', '51.711025', '-0.3464008', '-0.2562907', '2025-03-05 08:13:30'),
(00000000262, 'WD17', '51.6396042', '51.6848199', '-0.4446382', '-0.3838756', '2025-03-05 08:13:32'),
(00000000263, 'WD18', '51.6324338', '51.6614592', '-0.4473198', '-0.3856361', '2025-03-05 08:13:34'),
(00000000264, 'WD19', '51.6145645', '51.6479709', '-0.4170266', '-0.3613821', '2025-03-05 08:13:36'),
(00000000265, 'WD23', '51.6257744', '51.6703592', '-0.3878858', '-0.3096511', '2025-03-05 08:13:39'),
(00000000266, 'WD24', '51.6566983', '51.6856396', '-0.4219578', '-0.3725911', '2025-03-05 08:13:41'),
(00000000267, 'WD25', '51.6469518', '51.7161747', '-0.42416', '-0.3271342', '2025-03-05 08:13:43'),
(00000000268, 'WD99', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-03-05 08:13:45'),
(00000000269, 'IG1', '51.5435053', '51.57657', '0.0399866', '0.0947615', '2025-03-05 08:13:47'),
(00000000270, 'IG2', '51.5657105', '51.6019431', '0.058367', '0.1147808', '2025-03-05 08:13:50'),
(00000000271, 'IG3', '51.5474155', '51.5825872', '0.0882599', '0.120696', '2025-03-05 08:13:52'),
(00000000272, 'IG4', '51.5743604', '51.589374', '0.0388675', '0.0613726', '2025-03-05 08:13:54'),
(00000000273, 'IG5', '51.5801221', '51.6003675', '0.0470835', '0.0772538', '2025-03-05 08:13:56'),
(00000000274, 'IG6', '51.577031', '51.6133855', '0.0680519', '0.1307132', '2025-03-05 08:13:58'),
(00000000275, 'IG7', '51.6029643', '51.6495355', '0.0480827', '0.1518841', '2025-03-05 08:14:01'),
(00000000276, 'IG8', '51.5860834', '51.6269881', '-0.0017014', '0.073136', '2025-03-05 08:14:03'),
(00000000277, 'IG9', '51.6123543', '51.641418', '0.0210019', '0.0840639', '2025-03-05 08:14:04'),
(00000000278, 'IG10', '51.6299637', '51.6760639', '0.0105474', '0.1017169', '2025-03-05 08:14:06'),
(00000000279, 'IG11', '51.5091426', '51.5524615', '0.066572', '0.1364464', '2025-03-05 08:14:08'),
(00000000280, 'HA0', '51.5317796', '51.5784038', '-0.3354508', '-0.2777542', '2025-03-05 08:14:11'),
(00000000281, 'HA1', '51.5565066', '51.5971704', '-0.3612579', '-0.3150949', '2025-03-05 08:14:13'),
(00000000282, 'HA2', '51.5552247', '51.6067645', '-0.3878453', '-0.3395358', '2025-03-05 08:14:15'),
(00000000283, 'HA3', '51.5715596', '51.6276606', '-0.3624067', '-0.2806285', '2025-03-05 08:14:17'),
(00000000284, 'HA4', '51.5473284', '51.5967302', '-0.4472318', '-0.377946', '2025-03-05 08:14:19'),
(00000000285, 'HA5', '51.5732791', '51.6258268', '-0.4297113', '-0.3556559', '2025-03-05 08:14:21'),
(00000000286, 'HA6', '51.5907115', '51.6356799', '-0.4596477', '-0.4014916', '2025-03-05 08:14:23'),
(00000000287, 'HA7', '51.5893405', '51.6377933', '-0.3483553', '-0.2855963', '2025-03-05 08:14:25'),
(00000000288, 'HA8', '51.5936689', '51.6381845', '-0.303616', '-0.2477383', '2025-03-05 08:14:27'),
(00000000289, 'HA9', '51.5443556', '51.5795351', '-0.3125614', '-0.2615983', '2025-03-05 08:14:29'),
(00000000290, 'UB1', '51.5043567', '51.5327748', '-0.3932363', '-0.3442554', '2025-03-05 08:14:31'),
(00000000291, 'UB2', '51.4898678', '51.5096078', '-0.4111123', '-0.3424726', '2025-03-05 08:14:33'),
(00000000292, 'UB3', '51.4806307', '51.5261695', '-0.4541442', '-0.4009571', '2025-03-05 08:14:35'),
(00000000293, 'UB3', '51.4806307', '51.5261695', '-0.4541442', '-0.4009571', '2025-03-05 08:14:37'),
(00000000294, 'UB4', '51.5028768', '51.5473104', '-0.4415229', '-0.3762535', '2025-03-05 08:14:39'),
(00000000295, 'UB5', '51.5282069', '51.559538', '-0.4157325', '-0.3406113', '2025-03-05 08:14:41'),
(00000000296, 'UB5', '51.5282069', '51.559538', '-0.4157325', '-0.3406113', '2025-03-05 08:14:44'),
(00000000297, 'UB6', '51.5118941', '51.5576892', '-0.3716601', '-0.3040065', '2025-03-05 08:14:46'),
(00000000298, 'UB7', '51.4728675', '51.5225113', '-0.5016846', '-0.4431356', '2025-03-05 08:14:48'),
(00000000299, 'UB8', '51.5136856', '51.5598044', '-0.4964309', '-0.4373919', '2025-03-05 08:14:50'),
(00000000300, 'UB8', '51.5136856', '51.5598044', '-0.4964309', '-0.4373919', '2025-03-05 08:14:52'),
(00000000301, 'UB9', '51.542649', '51.6213326', '-0.5330277', '-0.4385073', '2025-03-05 08:14:54'),
(00000000302, 'UB10', '51.5261695', '51.575389', '-0.4823991', '-0.4087666', '2025-03-05 08:14:56'),
(00000000303, 'UB11', '51.5070712', '51.5156097', '-0.4579523', '-0.4325979', '2025-03-05 08:14:58'),
(00000000304, 'UB18', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-03-05 08:15:00'),
(00000000305, 'RM1', '51.5651342', '51.6132566', '0.1685376', '0.2076293', '2025-03-05 08:15:02'),
(00000000306, 'RM2', '51.5734429', '51.5953343', '0.182545', '0.2212665', '2025-03-05 08:15:04'),
(00000000307, 'RM3', '51.5837905', '51.6269105', '0.1922407', '0.2606632', '2025-03-05 08:15:06'),
(00000000308, 'RM4', '51.6055875', '51.6821152', '0.0993852', '0.2348963', '2025-03-05 08:15:08'),
(00000000309, 'RM5', '51.5844619', '51.6244557', '0.1367344', '0.1804026', '2025-03-05 08:15:10'),
(00000000310, 'RM6', '51.566065', '51.6035817', '0.1096888', '0.1518738', '2025-03-05 08:15:12'),
(00000000311, 'RM7', '51.546369', '51.597988', '0.1463557', '0.1899886', '2025-03-05 08:15:15'),
(00000000312, 'RM8', '51.5391886', '51.5692754', '0.1062867', '0.1607619', '2025-03-05 08:15:17'),
(00000000313, 'RM9', '51.5083736', '51.5566777', '0.1074825', '0.1657298', '2025-03-05 08:15:19'),
(00000000314, 'RM10', '51.5265811', '51.5627336', '0.1466762', '0.1798101', '2025-03-05 08:15:21'),
(00000000315, 'RM11', '51.5571624', '51.5887099', '0.1863776', '0.2516005', '2025-03-05 08:15:23'),
(00000000316, 'RM12', '51.5344997', '51.5664328', '0.1726578', '0.2371689', '2025-03-05 08:15:25'),
(00000000317, 'RM13', '51.4841517', '51.5453634', '0.1564787', '0.2442428', '2025-03-05 08:15:27'),
(00000000318, 'RM14', '51.520627', '51.599049', '0.2082198', '0.4068901', '2025-03-05 08:15:29'),
(00000000319, 'RM15', '51.4884299', '51.5392475', '0.2028951', '0.3321697', '2025-03-05 08:15:32'),
(00000000320, 'RM16', '51.4695387', '51.5419118', '0.2673719', '0.4021689', '2025-03-05 08:15:34'),
(00000000321, 'RM17', '51.4648324', '51.4948959', '0.3039253', '0.3571343', '2025-03-05 08:15:36'),
(00000000322, 'RM18', '51.4475921', '51.4942205', '0.3232107', '0.4597136', '2025-03-05 08:15:38'),
(00000000323, 'RM19', '51.4644149', '51.4965313', '0.2091312', '0.2889456', '2025-03-05 08:15:40'),
(00000000324, 'RM20', '51.4586993', '51.4930697', '0.257154', '0.3092108', '2025-03-05 08:15:42'),
(00000000325, 'TW1', '51.4317861', '51.4660353', '-0.3408939', '-0.3034404', '2025-03-05 08:15:44'),
(00000000326, 'TW2', '51.4307287', '51.4597096', '-0.3826182', '-0.3333537', '2025-03-05 08:15:46'),
(00000000327, 'TW3', '51.4533784', '51.4805685', '-0.3877705', '-0.345332', '2025-03-05 08:15:48'),
(00000000328, 'TW4', '51.4450867', '51.4792102', '-0.415432', '-0.3682098', '2025-03-05 08:15:50'),
(00000000329, 'TW5', '51.4699649', '51.4946788', '-0.4297077', '-0.3527941', '2025-03-05 08:15:52'),
(00000000330, 'TW6', '51.4536091', '51.4816967', '-0.4958545', '-0.4053232', '2025-03-05 08:15:54'),
(00000000331, 'TW7', '51.4556875', '51.4963542', '-0.3633384', '-0.3106098', '2025-03-05 08:15:57'),
(00000000332, 'TW8', '51.4721762', '51.4995353', '-0.3310673', '-0.2834724', '2025-03-05 08:15:59'),
(00000000333, 'TW9', '51.457328', '51.4872419', '-0.3196057', '-0.2707056', '2025-03-05 08:16:01'),
(00000000334, 'TW10', '51.4217971', '51.4667775', '-0.3290778', '-0.253361', '2025-03-05 08:16:03'),
(00000000335, 'TW11', '51.4076393', '51.4372459', '-0.3536101', '-0.3061197', '2025-03-05 08:16:05'),
(00000000336, 'TW12', '51.4073864', '51.4351015', '-0.3971225', '-0.336482', '2025-03-05 08:16:07'),
(00000000337, 'TW13', '51.4205508', '51.4501612', '-0.4396776', '-0.3670001', '2025-03-05 08:16:09'),
(00000000338, 'TW14', '51.4378104', '51.470007', '-0.4643086', '-0.3891982', '2025-03-05 08:16:11'),
(00000000339, 'TW15', '51.4146654', '51.4460198', '-0.4892261', '-0.4265005', '2025-03-05 08:16:13'),
(00000000340, 'TW16', '51.3924686', '51.4312048', '-0.4384686', '-0.3748431', '2025-03-05 08:16:15'),
(00000000341, 'TW17', '51.3783335', '51.4257848', '-0.486513', '-0.4208579', '2025-03-05 08:16:17'),
(00000000342, 'TW18', '51.3939131', '51.457649', '-0.5373297', '-0.4678876', '2025-03-05 08:16:19'),
(00000000343, 'TW19', '51.4369161', '51.4761001', '-0.5740134', '-0.4563303', '2025-03-05 08:16:21'),
(00000000344, 'TW20', '51.3989421', '51.4484832', '-0.6098057', '-0.5106131', '2025-03-05 08:16:24'),
(00000000345, 'DA1', '51.4256627', '51.4744762', '0.1619653', '0.2573992', '2025-03-05 08:16:25'),
(00000000346, 'DA2', '51.3966015', '51.4643192', '0.1553006', '0.3068965', '2025-03-05 08:16:28'),
(00000000347, 'DA3', '51.3569947', '51.4093767', '0.236638', '0.3485034', '2025-03-05 08:16:30'),
(00000000348, 'DA4', '51.3370455', '51.4180617', '0.1758003', '0.2893596', '2025-03-05 08:16:32'),
(00000000349, 'DA5', '51.4231041', '51.452806', '0.1126904', '0.1803712', '2025-03-05 08:16:34'),
(00000000350, 'DA6', '51.4474639', '51.4614265', '0.1140854', '0.1665379', '2025-03-05 08:16:36'),
(00000000351, 'DA7', '51.4533891', '51.4798197', '0.1181916', '0.1820962', '2025-03-05 08:16:38'),
(00000000352, 'DA8', '51.4592899', '51.4968838', '0.1453163', '0.2481643', '2025-03-05 08:16:40'),
(00000000353, 'DA9', '51.4340292', '51.4682164', '0.2475502', '0.3050094', '2025-03-05 08:16:42'),
(00000000354, 'DA10', '51.4301475', '51.4598522', '0.2713455', '0.3253086', '2025-03-05 08:16:44'),
(00000000355, 'DA11', '51.4123212', '51.4702893', '0.3021002', '0.3752027', '2025-03-05 08:16:46'),
(00000000356, 'DA12', '51.3794311', '51.4527148', '0.3512194', '0.4539398', '2025-03-05 08:16:49'),
(00000000357, 'DA13', '51.3213002', '51.4304577', '0.2877338', '0.4179933', '2025-03-05 08:16:51'),
(00000000358, 'DA14', '51.4086975', '51.4394959', '0.0799391', '0.1624311', '2025-03-05 08:16:53'),
(00000000359, 'DA15', '51.4264724', '51.4569903', '0.0795109', '0.1199711', '2025-03-05 08:16:55'),
(00000000360, 'DA16', '51.451423', '51.4786998', '0.0751311', '0.1267036', '2025-03-05 08:16:57'),
(00000000361, 'DA17', '51.4769533', '51.5108324', '0.1228199', '0.1761849', '2025-03-05 08:16:59'),
(00000000362, 'DA18', '51.4913405', '51.5060414', '0.1278373', '0.1534364', '2025-03-05 08:17:01'),
(00000000363, 'CR0', '51.3279453', '51.3957549', '-0.1521291', '0.0030477', '2025-03-05 08:17:03'),
(00000000364, 'CR2', '51.3190034', '51.3667307', '-0.1159822', '-0.0369138', '2025-03-05 08:17:05'),
(00000000365, 'CR3', '51.261243', '51.3172128', '-0.135685', '-0.0024398', '2025-03-05 08:17:07'),
(00000000366, 'CR4', '51.3804708', '51.4198521', '-0.1845828', '-0.1244498', '2025-03-05 08:17:09'),
(00000000367, 'CR5', '51.2738022', '51.3330257', '-0.2031039', '-0.0963189', '2025-03-05 08:17:12'),
(00000000368, 'CR6', '51.274904', '51.3370517', '-0.0868407', '0.0150205', '2025-03-05 08:17:14'),
(00000000369, 'CR7', '51.3872771', '51.4139849', '-0.1317819', '-0.0897767', '2025-03-05 08:17:16'),
(00000000370, 'CR8', '51.2984244', '51.3516736', '-0.1505862', '-0.0817958', '2025-03-05 08:17:18'),
(00000000371, 'CR9', '51.34141', '51.3898929', '-0.1338834', '0.0003861', '2025-03-05 08:17:21'),
(00000000372, 'CR44', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-03-05 08:17:23'),
(00000000373, 'CR90', '34.5614', '60.9157', '-8.8988999', '33.9165549', '2025-03-05 08:17:25'),
(00000000374, 'KT1', '51.3937601', '51.41843', '-0.3221708', '-0.2728847', '2025-03-05 08:17:27'),
(00000000375, 'KT2', '51.4097523', '51.4324548', '-0.3139628', '-0.2511202', '2025-03-05 08:17:29'),
(00000000376, 'KT3', '51.3828894', '51.4168181', '-0.2829485', '-0.2269982', '2025-03-05 08:17:31'),
(00000000377, 'KT4', '51.3657822', '51.3906571', '-0.277504', '-0.2185181', '2025-03-05 08:17:33'),
(00000000378, 'KT5', '51.3739714', '51.4014988', '-0.3018081', '-0.2660809', '2025-03-05 08:17:35'),
(00000000379, 'KT6', '51.3708498', '51.402277', '-0.3254168', '-0.2797892', '2025-03-05 08:17:37'),
(00000000380, 'KT7', '51.3752109', '51.4012225', '-0.3539344', '-0.3203966', '2025-03-05 08:17:39'),
(00000000381, 'KT8', '51.3886281', '51.4115323', '-0.4015059', '-0.3150344', '2025-03-05 08:17:41'),
(00000000382, 'KT9', '51.3278817', '51.3759026', '-0.3411714', '-0.2734165', '2025-03-05 08:17:43'),
(00000000383, 'KT10', '51.3421322', '51.3907171', '-0.3973147', '-0.3190886', '2025-03-05 08:17:45'),
(00000000384, 'KT11', '51.2897783', '51.3544873', '-0.4615852', '-0.3554481', '2025-03-05 08:17:47'),
(00000000385, 'KT12', '51.3450189', '51.4080893', '-0.4480365', '-0.356611', '2025-03-05 08:17:49'),
(00000000386, 'KT13', '51.338483', '51.3894119', '-0.4861929', '-0.4235865', '2025-03-05 08:17:51'),
(00000000387, 'KT14', '51.326688', '51.352592', '-0.5236216', '-0.4567963', '2025-03-05 08:17:53'),
(00000000388, 'KT15', '51.3382655', '51.3841619', '-0.5276683', '-0.4666306', '2025-03-05 08:17:56'),
(00000000389, 'KT16', '51.3425853', '51.4143077', '-0.6063731', '-0.4701908', '2025-03-05 08:17:58'),
(00000000390, 'KT17', '51.3137573', '51.3731754', '-0.2685573', '-0.2251295', '2025-03-05 08:18:00'),
(00000000391, 'KT18', '51.2603276', '51.3382228', '-0.3115801', '-0.2229902', '2025-03-05 08:18:02'),
(00000000392, 'KT19', '51.3304621', '51.3725465', '-0.3097858', '-0.2453532', '2025-03-05 08:18:04'),
(00000000393, 'KT20', '51.2455627', '51.3148302', '-0.3179108', '-0.185593', '2025-03-05 08:18:06'),
(00000000394, 'KT21', '51.2923879', '51.3367504', '-0.3327773', '-0.2788206', '2025-03-05 08:18:08'),
(00000000395, 'KT22', '51.2657761', '51.3493927', '-0.3817801', '-0.2823327', '2025-03-05 08:18:10'),
(00000000396, 'KT23', '51.2551389', '51.2995889', '-0.4044155', '-0.3526472', '2025-03-05 08:18:12'),
(00000000397, 'KT24', '51.2314773', '51.300616', '-0.4746042', '-0.384959', '2025-03-05 08:18:14'),
(00000000398, 'SM1', '51.3561829', '51.3858197', '-0.2153432', '-0.1706027', '2025-03-05 08:18:16'),
(00000000399, 'SM2', '51.3318621', '51.3607802', '-0.234996', '-0.1738788', '2025-03-05 08:18:18'),
(00000000400, 'SM3', '51.3495673', '51.3879423', '-0.2333097', '-0.1970867', '2025-03-05 08:18:21'),
(00000000401, 'SM4', '51.3804058', '51.4037872', '-0.2337575', '-0.168911', '2025-03-05 08:18:24'),
(00000000402, 'SM5', '51.3304002', '51.3932613', '-0.1899599', '-0.1474954', '2025-03-05 08:18:26'),
(00000000403, 'SM6', '51.3379719', '51.3834785', '-0.1612985', '-0.121722', '2025-03-05 08:18:28'),
(00000000404, 'SM7', '51.3010799', '51.3404451', '-0.2336825', '-0.1624598', '2025-03-05 08:18:30');

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
-- Indexes for table `address_proofs`
--
ALTER TABLE `address_proofs`
  ADD PRIMARY KEY (`ap_id`);

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
-- Indexes for table `bookings_history`
--
ALTER TABLE `bookings_history`
  ADD PRIMARY KEY (`book_history_id`),
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
-- Indexes for table `driver_extras`
--
ALTER TABLE `driver_extras`
  ADD PRIMARY KEY (`de_id`);

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
-- Indexes for table `driver_routes`
--
ALTER TABLE `driver_routes`
  ADD PRIMARY KEY (`dr_id`);

--
-- Indexes for table `driver_sessions`
--
ALTER TABLE `driver_sessions`
  ADD PRIMARY KEY (`doh_id`);

--
-- Indexes for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  ADD PRIMARY KEY (`dv_id`);

--
-- Indexes for table `driving_license`
--
ALTER TABLE `driving_license`
  ADD PRIMARY KEY (`dl_id`);

--
-- Indexes for table `dvla_check`
--
ALTER TABLE `dvla_check`
  ADD PRIMARY KEY (`dvla_id`);

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
-- Indexes for table `national_insurance`
--
ALTER TABLE `national_insurance`
  ADD PRIMARY KEY (`ni_id`);

--
-- Indexes for table `open-bookings`
--
ALTER TABLE `open-bookings`
  ADD PRIMARY KEY (`ob_id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `pco_license`
--
ALTER TABLE `pco_license`
  ADD PRIMARY KEY (`pl_id`);

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
-- Indexes for table `rental_agreement`
--
ALTER TABLE `rental_agreement`
  ADD PRIMARY KEY (`ra_id`);

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
-- Indexes for table `user_page_access`
--
ALTER TABLE `user_page_access`
  ADD PRIMARY KEY (`access_id`) USING BTREE;

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`v_id`);

--
-- Indexes for table `vehicle_extras`
--
ALTER TABLE `vehicle_extras`
  ADD PRIMARY KEY (`ve_id`);

--
-- Indexes for table `vehicle_insurance`
--
ALTER TABLE `vehicle_insurance`
  ADD PRIMARY KEY (`vi_id`);

--
-- Indexes for table `vehicle_ins_schedule`
--
ALTER TABLE `vehicle_ins_schedule`
  ADD PRIMARY KEY (`is_id`);

--
-- Indexes for table `vehicle_log_book`
--
ALTER TABLE `vehicle_log_book`
  ADD PRIMARY KEY (`lb_id`);

--
-- Indexes for table `vehicle_mot`
--
ALTER TABLE `vehicle_mot`
  ADD PRIMARY KEY (`mot_id`);

--
-- Indexes for table `vehicle_pco`
--
ALTER TABLE `vehicle_pco`
  ADD PRIMARY KEY (`vpco_id`);

--
-- Indexes for table `vehicle_pictures`
--
ALTER TABLE `vehicle_pictures`
  ADD PRIMARY KEY (`vp_id`);

--
-- Indexes for table `vehicle_road_tax`
--
ALTER TABLE `vehicle_road_tax`
  ADD PRIMARY KEY (`rt_id`);

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
  MODIFY `log_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address_proofs`
--
ALTER TABLE `address_proofs`
  MODIFY `ap_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `ap_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings_history`
--
ALTER TABLE `bookings_history`
  MODIFY `book_history_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

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
  MODIFY `d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `driver_extras`
--
ALTER TABLE `driver_extras`
  MODIFY `de_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_history`
--
ALTER TABLE `driver_history`
  MODIFY `history_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_routes`
--
ALTER TABLE `driver_routes`
  MODIFY `dr_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_sessions`
--
ALTER TABLE `driver_sessions`
  MODIFY `doh_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `dv_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driving_license`
--
ALTER TABLE `driving_license`
  MODIFY `dl_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dvla_check`
--
ALTER TABLE `dvla_check`
  MODIFY `dvla_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

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
  MODIFY `mp_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `national_insurance`
--
ALTER TABLE `national_insurance`
  MODIFY `ni_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `open-bookings`
--
ALTER TABLE `open-bookings`
  MODIFY `ob_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `pay_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pco_license`
--
ALTER TABLE `pco_license`
  MODIFY `pl_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `rental_agreement`
--
ALTER TABLE `rental_agreement`
  MODIFY `ra_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `rev_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `special_dates`
--
ALTER TABLE `special_dates`
  MODIFY `dt_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `ts_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_page_access`
--
ALTER TABLE `user_page_access`
  MODIFY `access_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_extras`
--
ALTER TABLE `vehicle_extras`
  MODIFY `ve_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_insurance`
--
ALTER TABLE `vehicle_insurance`
  MODIFY `vi_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_ins_schedule`
--
ALTER TABLE `vehicle_ins_schedule`
  MODIFY `is_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_log_book`
--
ALTER TABLE `vehicle_log_book`
  MODIFY `lb_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_mot`
--
ALTER TABLE `vehicle_mot`
  MODIFY `mot_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_pco`
--
ALTER TABLE `vehicle_pco`
  MODIFY `vpco_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_pictures`
--
ALTER TABLE `vehicle_pictures`
  MODIFY `vp_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_road_tax`
--
ALTER TABLE `vehicle_road_tax`
  MODIFY `rt_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `waiting_time`
--
ALTER TABLE `waiting_time`
  MODIFY `wt_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
