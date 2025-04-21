-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 08:33 PM
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
  `user_type` enum('client','driver','user') NOT NULL,
  `user_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`log_id`, `activity_type`, `timestamp`, `user_type`, `user_id`, `details`) VALUES
(00000001, 'New Booker', '2024-11-23 14:17:27', 'user', 00000001, 'New Booker Umar Atiq  Added by Controller.'),
(00000002, 'Booker Verified', '2024-11-23 14:18:14', 'user', 00000001, 'Booker 00000001 Has Been Verified by Controller.');

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
(00000001, 'Umar Atiq', 'umar@prenero.com', '+443346452312', '12345678', 'London, UK', 'Male', 'English', '6741e3f76c148_1732371447.png', 'N3= Finchley Central', '', '', 0, '', '1', 10, 0, 1, 2, '', '2024-11-23 14:18:14');

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
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL,
  `acount_status` int(10) NOT NULL,
  `signup_type` tinyint(5) NOT NULL,
  `login_token` varchar(255) DEFAULT NULL,
  `driver_reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

--
-- Dumping data for table `special_dates`
--

INSERT INTO `special_dates` (`dt_id`, `special_date`, `event_name`, `percent_increment`, `date_dt_added`) VALUES
(00000000002, '2024-08-14', 'Azadi Daya', '15', '2024-07-13 12:28:28');

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
(00000001, 'Atiq', 'Ramzan', 'admin@prenero.com', '2c29030971430433fc33d0ab2f9658a2', '+923157524000', 'Male', 'Owner', 'Shop # 24, Hamza Market, Sargodha Road', 'Faisalabad', 'Punjab', 134, 38000, '33102-1457353-9', '6692115e98268_1720848734.jpg', '2024-07-19 11:29:25'),
(00000002, 'Azib ', 'Ali Butt', 'eurodatatechnology@gmail.com', '25d55ad283aa400af464c76d713c07ad', '+447552834179', 'Male', 'Administrator', 'London, United Kingdom.', 'London', '', 186, 0, '', '669210dd613b8_1720848605.jpg', '2024-07-13 05:30:05');

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
(00000000001, 'Saloon', 4, 1, 0, 0, 0, 50, 'toyota-prius.png', '2024-09-23 11:14:23'),
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
  MODIFY `log_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `c_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

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
  MODIFY `dt_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `ts_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `zone_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
