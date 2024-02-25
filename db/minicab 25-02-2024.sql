-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2024 at 08:11 AM
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
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `ap_id` int(55) NOT NULL,
  `ap_name` varchar(255) NOT NULL,
  `ap_address` varchar(255) NOT NULL,
  `ap_city` varchar(255) NOT NULL,
  `ap_code` varchar(55) NOT NULL,
  `ap_date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`ap_id`, `ap_name`, `ap_address`, `ap_city`, `ap_code`, `ap_date_added`) VALUES
(1, 'Gatwick Airport', 'Horley, Gatwick RH6 0NP', 'United Kingdom', 'LGW', '2023-10-28'),
(2, 'Heathrow Airport', 'Longford TW6, UK', 'United Kingdom', 'LHR', '2023-10-28'),
(3, 'Manchester Airport', 'Manchester M90 1QX', 'United Kingdom', 'MAN', '2023-10-28'),
(4, 'Birmingham Airport', 'Birmingham B26 3QJ', 'United Kingdom', 'BHX', '2023-10-28'),
(5, 'Stansted Airport', 'Bassingbourn Rd, Stansted CM24 1QW', 'United Kingdom', 'STN', '2023-10-28'),
(6, 'Leeds Bradford Airport', 'Whitehouse Ln, Yeadon, Leeds LS19 7TU', 'United Kingdom', 'LBA', '2023-10-28'),
(7, 'Luton Airport', 'Airport Way, Luton LU2 9LY', 'United Kingdom', 'LTN', '2023-10-28'),
(8, 'Southend Airport', 'Eastwoodbury Cres, Southend-on-Sea SS2 6YF', 'United Kingdom', 'SEN', '2023-10-28'),
(9, 'London City Airport', 'Hartmann Rd, London E16 2PX', 'United Kingdom', 'LCY', '2023-10-28'),
(10, 'Newcastle International Airport', 'Woolsington, Newcastle upon Tyne NE13 8BZ', 'United Kingdom', 'NCL', '2023-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(55) NOT NULL,
  `book_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `bid_amount` varchar(255) NOT NULL,
  `bid_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booker_account`
--

CREATE TABLE `booker_account` (
  `acc_id` int(55) NOT NULL,
  `c_id` int(55) NOT NULL,
  `book_id` int(55) NOT NULL,
  `comission_amount` decimal(10,0) NOT NULL,
  `comission_status` varchar(255) NOT NULL,
  `commission_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booker_account`
--

INSERT INTO `booker_account` (`acc_id`, `c_id`, `book_id`, `comission_amount`, `comission_status`, `commission_date`) VALUES
(1, 1, 1, 25, '', '2024-02-25 12:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `b_type_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `pickup` varchar(255) NOT NULL,
  `stops` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `passenger` int(55) NOT NULL,
  `pick_date` date NOT NULL,
  `pick_time` time NOT NULL,
  `journey_type` varchar(55) NOT NULL,
  `v_id` int(11) NOT NULL,
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
  `booking_status` varchar(55) NOT NULL,
  `bid_status` int(11) NOT NULL DEFAULT 0,
  `bid_note` varchar(255) NOT NULL,
  `book_add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `b_type_id`, `c_id`, `pickup`, `stops`, `destination`, `address`, `postal_code`, `passenger`, `pick_date`, `pick_time`, `journey_type`, `v_id`, `luggage`, `child_seat`, `flight_number`, `delay_time`, `note`, `journey_fare`, `journey_distance`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `booking_status`, `bid_status`, `bid_note`, `book_add_date`) VALUES
(00000000001, 3, 1, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 2, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 12:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `booking_type`
--

CREATE TABLE `booking_type` (
  `b_type_id` int(11) NOT NULL,
  `b_type_name` varchar(255) NOT NULL,
  `b_added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_type`
--

INSERT INTO `booking_type` (`b_type_id`, `b_type_name`, `b_added_date`) VALUES
(1, 'Cash/Card', '2023-12-20 19:35:58'),
(2, 'Account', '2023-12-20 19:35:58'),
(3, 'Booker', '2023-12-20 19:35:58'),
(4, 'Parcel Delivery', '2023-12-20 19:35:58'),
(5, 'Online App/Website', '2023-12-20 19:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `c_id` int(55) NOT NULL,
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
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `status`, `company_name`, `commission_type`, `percentage`, `fixed`, `acount_status`, `account_type`, `reg_date`) VALUES
(1, 'Azib Ali', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', '', 'Male', 'English', '', 'WJ123', '', '', 0, '', '', 0, 0, 0, 2, '2024-02-25 11:47:05'),
(2, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'asdf1234', '', 'Male', 'English', '', '38000', '', '', 0, '', '1', 15, 0, 0, 2, '2024-02-20 17:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(55) NOT NULL,
  `user_id` int(55) NOT NULL,
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
  `com_date_reg` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `user_id`, `com_name`, `com_logo`, `com_phone`, `com_c_email`, `com_a_email`, `com_a_phone`, `com_web`, `com_licence`, `com_vat`, `com_r_num`, `com_tax`, `com_address`, `com_zip`, `com_city`, `com_country`, `com_language`, `com_currency`, `com_time_zone`, `com_date_reg`) VALUES
(1, 1, 'Prenero Studio', 'avatar.png', '+923157524000', 'hello@prenero.com', 'admin@prenero.com', '+923157524000', 'prenero.com', '12345678', '15', '987654321', 15, 'Shop # 24', '38000', 'Faisalabad', 'Pakistan', 'English', 'GBP', 'Asia', '2023-11-03 14:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `date_country_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `date_country_add`) VALUES
(1, 'Afghanistan', '2024-02-09 22:12:23'),
(2, 'Albania', '2024-02-09 22:12:23'),
(3, 'Algeria', '2024-02-09 22:12:23'),
(4, 'Andorra', '2024-02-09 22:12:23'),
(5, 'Angola', '2024-02-09 22:12:23'),
(6, 'Antigua and Barbuda', '2024-02-09 22:12:23'),
(7, 'Argentina', '2024-02-09 22:12:23'),
(8, 'Armenia', '2024-02-09 22:12:23'),
(9, 'Australia', '2024-02-09 22:12:23'),
(10, 'Austria', '2024-02-09 22:12:23'),
(11, 'Azerbaijan', '2024-02-09 22:12:23'),
(12, 'The Bahamas', '2024-02-09 22:12:23'),
(13, 'Bahrain', '2024-02-09 22:12:23'),
(14, 'Bangladesh', '2024-02-09 22:12:23'),
(15, 'Barbados', '2024-02-09 22:12:23'),
(16, 'Belarus', '2024-02-09 22:12:23'),
(17, 'Belgium', '2024-02-09 22:12:23'),
(18, 'Belize', '2024-02-09 22:12:23'),
(19, 'Benin', '2024-02-09 22:12:23'),
(20, 'Bhutan', '2024-02-09 22:12:23'),
(21, 'Bolivia', '2024-02-09 22:12:23'),
(22, 'Bosnia and Herzegovina', '2024-02-09 22:12:23'),
(23, 'Botswana', '2024-02-09 22:12:23'),
(24, 'Brazil', '2024-02-09 22:12:23'),
(25, 'Brunei', '2024-02-09 22:12:23'),
(26, 'Bulgaria', '2024-02-09 22:12:23'),
(27, 'Burkina Faso', '2024-02-09 22:12:23'),
(28, 'Burundi', '2024-02-09 22:12:23'),
(29, 'Cabo Verde', '2024-02-09 22:12:23'),
(30, 'Cambodia', '2024-02-09 22:12:23'),
(31, 'Cameroon', '2024-02-09 22:12:23'),
(32, 'Canada', '2024-02-09 22:12:23'),
(33, 'Central African Republic', '2024-02-09 22:12:23'),
(34, 'Chad', '2024-02-09 22:12:23'),
(35, 'Chile', '2024-02-09 22:12:23'),
(36, 'China', '2024-02-09 22:12:23'),
(37, 'Colombia', '2024-02-09 22:12:23'),
(38, 'Comoros', '2024-02-09 22:12:23'),
(39, 'Congo, Democratic Republic of the', '2024-02-09 22:12:23'),
(40, 'Congo, Republic of the', '2024-02-09 22:12:23'),
(41, 'Costa Rica', '2024-02-09 22:12:23'),
(42, 'Côte d’Ivoire', '2024-02-09 22:12:23'),
(43, 'Croatia', '2024-02-09 22:12:23'),
(44, 'Cuba', '2024-02-09 22:12:23'),
(45, 'Cyprus', '2024-02-09 22:12:23'),
(46, 'Czech Republic', '2024-02-09 22:12:23'),
(47, 'Denmark', '2024-02-09 22:12:23'),
(48, 'Djibouti', '2024-02-09 22:12:23'),
(49, 'Dominica', '2024-02-09 22:12:23'),
(50, 'Dominican Republic', '2024-02-09 22:12:23'),
(51, 'East Timor (Timor-Leste)', '2024-02-09 22:12:23'),
(52, 'Ecuador', '2024-02-09 22:12:23'),
(53, 'Egypt', '2024-02-09 22:12:23'),
(54, 'El Salvador', '2024-02-09 22:12:23'),
(55, 'Equatorial Guinea', '2024-02-09 22:12:23'),
(56, 'Eritrea', '2024-02-09 22:12:23'),
(57, 'Estonia', '2024-02-09 22:12:23'),
(58, 'Eswatini', '2024-02-09 22:12:23'),
(59, 'Ethiopia', '2024-02-09 22:12:23'),
(60, 'Fiji', '2024-02-09 22:12:23'),
(61, 'Finland', '2024-02-09 22:12:23'),
(62, 'France', '2024-02-09 22:12:23'),
(63, 'Gabon', '2024-02-09 22:12:23'),
(64, 'The Gambia', '2024-02-09 22:12:23'),
(65, 'Georgia', '2024-02-09 22:12:23'),
(66, 'Germany', '2024-02-09 22:12:23'),
(67, 'Ghana', '2024-02-09 22:12:23'),
(68, 'Greece', '2024-02-09 22:12:23'),
(69, 'Grenada', '2024-02-09 22:12:23'),
(70, 'Guatemala', '2024-02-09 22:12:23'),
(71, 'Guinea', '2024-02-09 22:12:23'),
(72, 'Guinea-Bissau', '2024-02-09 22:12:23'),
(73, 'Guyana', '2024-02-09 22:12:23'),
(74, 'Haiti', '2024-02-09 22:12:23'),
(75, 'Honduras', '2024-02-09 22:12:23'),
(76, 'Hungary', '2024-02-09 22:12:23'),
(77, 'Iceland', '2024-02-09 22:12:23'),
(78, 'India', '2024-02-09 22:12:23'),
(79, 'Indonesia', '2024-02-09 22:12:23'),
(80, 'Iran', '2024-02-09 22:12:23'),
(81, 'Iraq', '2024-02-09 22:12:23'),
(82, 'Ireland', '2024-02-09 22:12:23'),
(83, 'Israel', '2024-02-09 22:12:23'),
(84, 'Italy', '2024-02-09 22:12:23'),
(85, 'Jamaica', '2024-02-09 22:12:23'),
(86, 'Japan', '2024-02-09 22:12:23'),
(87, 'Jordan', '2024-02-09 22:12:23'),
(88, 'Kazakhstan', '2024-02-09 22:12:23'),
(89, 'Kenya', '2024-02-09 22:12:23'),
(90, 'Kiribati', '2024-02-09 22:12:23'),
(91, 'Korea, North', '2024-02-09 22:12:23'),
(92, 'Korea, South', '2024-02-09 22:12:23'),
(93, 'Kosovo', '2024-02-09 22:12:23'),
(94, 'Kuwait', '2024-02-09 22:12:23'),
(95, 'Kyrgyzstan', '2024-02-09 22:12:23'),
(96, 'Laos', '2024-02-09 22:12:23'),
(97, 'Latvia', '2024-02-09 22:12:23'),
(98, 'Lebanon', '2024-02-09 22:12:23'),
(99, 'Lesotho', '2024-02-09 22:12:23'),
(100, 'Liberia', '2024-02-09 22:12:23'),
(101, 'Libya', '2024-02-09 22:12:23'),
(102, 'Liechtenstein', '2024-02-09 22:12:23'),
(103, 'Lithuania', '2024-02-09 22:12:23'),
(104, 'Luxembourg', '2024-02-09 22:12:23'),
(105, 'Madagascar', '2024-02-09 22:12:23'),
(106, 'Malawi', '2024-02-09 22:12:23'),
(107, 'Malaysia', '2024-02-09 22:12:23'),
(108, 'Maldives', '2024-02-09 22:12:23'),
(109, 'Mali', '2024-02-09 22:12:23'),
(110, 'Malta', '2024-02-09 22:12:23'),
(111, 'Marshall Islands', '2024-02-09 22:12:23'),
(112, 'Mauritania', '2024-02-09 22:12:23'),
(113, 'Mauritius', '2024-02-09 22:12:23'),
(114, 'Mexico', '2024-02-09 22:12:23'),
(115, 'Micronesia, Federated States of', '2024-02-09 22:12:23'),
(116, 'Moldova', '2024-02-09 22:12:23'),
(117, 'Monaco', '2024-02-09 22:12:23'),
(118, 'Mongolia', '2024-02-09 22:12:23'),
(119, 'Montenegro', '2024-02-09 22:12:23'),
(120, 'Morocco', '2024-02-09 22:12:23'),
(121, 'Mozambique', '2024-02-09 22:12:23'),
(122, 'Myanmar (Burma)', '2024-02-09 22:12:23'),
(123, 'Namibia', '2024-02-09 22:12:23'),
(124, 'Nauru', '2024-02-09 22:12:23'),
(125, 'Nepal', '2024-02-09 22:12:23'),
(126, 'Netherlands', '2024-02-09 22:12:23'),
(127, 'New Zealand', '2024-02-09 22:12:23'),
(128, 'Nicaragua', '2024-02-09 22:12:23'),
(129, 'Niger', '2024-02-09 22:12:23'),
(130, 'Nigeria', '2024-02-09 22:12:23'),
(131, 'North Macedonia', '2024-02-09 22:12:23'),
(132, 'Norway', '2024-02-09 22:12:23'),
(133, 'Oman', '2024-02-09 22:12:23'),
(134, 'Pakistan', '2024-02-09 22:12:23'),
(135, 'Palau', '2024-02-09 22:12:23'),
(136, 'Panama', '2024-02-09 22:12:23'),
(137, 'Papua New Guinea', '2024-02-09 22:12:23'),
(138, 'Paraguay', '2024-02-09 22:12:23'),
(139, 'Peru', '2024-02-09 22:12:23'),
(140, 'Philippines', '2024-02-09 22:12:23'),
(141, 'Poland', '2024-02-09 22:12:23'),
(142, 'Portugal', '2024-02-09 22:12:23'),
(143, 'Qatar', '2024-02-09 22:12:23'),
(144, 'Romania', '2024-02-09 22:12:23'),
(145, 'Russia', '2024-02-09 22:12:23'),
(146, 'Rwanda', '2024-02-09 22:12:23'),
(147, 'Saint Kitts and Nevis', '2024-02-09 22:12:23'),
(148, 'Saint Lucia', '2024-02-09 22:12:23'),
(149, 'Saint Vincent and the Grenadines', '2024-02-09 22:12:23'),
(150, 'Samoa', '2024-02-09 22:12:23'),
(151, 'San Marino', '2024-02-09 22:12:23'),
(152, 'Sao Tome and Principe', '2024-02-09 22:12:23'),
(153, 'Saudi Arabia', '2024-02-09 22:12:23'),
(154, 'Senegal', '2024-02-09 22:12:23'),
(155, 'Serbia', '2024-02-09 22:12:23'),
(156, 'Seychelles', '2024-02-09 22:12:23'),
(157, 'Sierra Leone', '2024-02-09 22:12:23'),
(158, 'Singapore', '2024-02-09 22:12:23'),
(159, 'Slovakia', '2024-02-09 22:12:23'),
(160, 'Slovenia', '2024-02-09 22:12:23'),
(161, 'Solomon Islands', '2024-02-09 22:12:23'),
(162, 'Somalia', '2024-02-09 22:12:23'),
(163, 'South Africa', '2024-02-09 22:12:23'),
(164, 'Spain', '2024-02-09 22:12:23'),
(165, 'Sri Lanka', '2024-02-09 22:12:23'),
(166, 'Sudan', '2024-02-09 22:12:23'),
(167, 'Sudan, South', '2024-02-09 22:12:23'),
(168, 'Suriname', '2024-02-09 22:12:23'),
(169, 'Sweden', '2024-02-09 22:12:23'),
(170, 'Switzerland', '2024-02-09 22:12:23'),
(171, 'Syria', '2024-02-09 22:12:23'),
(172, 'Taiwan', '2024-02-09 22:12:23'),
(173, 'Tajikistan', '2024-02-09 22:12:23'),
(174, 'Tanzania', '2024-02-09 22:12:23'),
(175, 'Thailand', '2024-02-09 22:12:23'),
(176, 'Togo', '2024-02-09 22:12:23'),
(177, 'Tonga', '2024-02-09 22:12:23'),
(178, 'Trinidad and Tobago', '2024-02-09 22:12:23'),
(179, 'Tunisia', '2024-02-09 22:12:23'),
(180, 'Turkey', '2024-02-09 22:12:23'),
(181, 'Turkmenistan', '2024-02-09 22:12:23'),
(182, 'Tuvalu', '2024-02-09 22:12:23'),
(183, 'Uganda', '2024-02-09 22:12:23'),
(184, 'Ukraine', '2024-02-09 22:12:23'),
(185, 'United Arab Emirates', '2024-02-09 22:12:23'),
(186, 'United Kingdom', '2024-02-09 22:12:23'),
(187, 'United States', '2024-02-09 22:12:23'),
(188, 'Uruguay', '2024-02-09 22:12:23'),
(189, 'Uzbekistan', '2024-02-09 22:12:23'),
(190, 'Vanuatu', '2024-02-09 22:12:23'),
(191, 'Vatican City', '2024-02-09 22:12:23'),
(192, 'Venezuela', '2024-02-09 22:12:23'),
(193, 'Vietnam', '2024-02-09 22:12:23'),
(194, 'Yemen', '2024-02-09 22:12:23'),
(195, 'Zambia', '2024-02-09 22:12:23'),
(196, 'Zimbabwe', '2024-02-09 22:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `des_id` int(11) NOT NULL,
  `des_name` varchar(255) NOT NULL,
  `des_address` varchar(255) NOT NULL,
  `des_city` varchar(255) NOT NULL,
  `des_code` varchar(55) NOT NULL,
  `des_date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`des_id`, `des_name`, `des_address`, `des_city`, `des_code`, `des_date_added`) VALUES
(1, 'Gatwick Airport', 'Horley, Gatwick RH6 0NP', 'United Kingdom', 'LGW', '2023-10-28'),
(2, 'Heathrow Airport', 'Longford TW6, UK', 'United Kingdom', 'LHR', '2023-10-28'),
(3, 'Manchester Airport', 'Manchester M90 1QX', 'United Kingdom', 'MAN', '2023-10-28'),
(4, 'Birmingham Airport', 'Birmingham B26 3QJ', 'United Kingdom', 'BHX', '2023-10-28'),
(5, 'Stansted Airport', 'Bassingbourn Rd, Stansted CM24 1QW', 'United Kingdom', 'STN', '2023-10-28'),
(6, 'Leeds Bradford Airport', 'Whitehouse Ln, Yeadon, Leeds LS19 7TU', 'United Kingdom', 'LBA', '2023-10-28'),
(7, 'Luton Airport', 'Airport Way, Luton LU2 9LY', 'United Kingdom', 'LTN', '2023-10-28'),
(8, 'Southend Airport', 'Eastwoodbury Cres, Southend-on-Sea SS2 6YF', 'United Kingdom', 'SEN', '2023-10-28'),
(9, 'London City Airport', 'Hartmann Rd, London E16 2PX', 'United Kingdom', 'LCY', '2023-10-28'),
(10, 'Newcastle International Airport', 'Woolsington, Newcastle upon Tyne NE13 8BZ', 'United Kingdom', 'NCL', '2023-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `d_id` int(55) NOT NULL,
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
  `d_licence` varchar(55) NOT NULL,
  `d_licence_exp` varchar(55) NOT NULL,
  `pco_licence` varchar(55) NOT NULL,
  `pco_exp` varchar(55) NOT NULL,
  `dl_front` varchar(255) NOT NULL,
  `dl_back` varchar(255) NOT NULL,
  `national_insurance` varchar(255) NOT NULL,
  `basic_disclosure` varchar(255) NOT NULL,
  `work_proof` varchar(255) NOT NULL,
  `passport` varchar(255) NOT NULL,
  `dvla` varchar(255) NOT NULL,
  `d_remarks` varchar(255) NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL,
  `acount_status` int(10) NOT NULL,
  `driver_reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `dl_front`, `dl_back`, `national_insurance`, `basic_disclosure`, `work_proof`, `passport`, `dvla`, `d_remarks`, `latitude`, `longitude`, `status`, `acount_status`, `driver_reg_date`) VALUES
(1, 'Azib Ali', 'eurodatatechnology@gmail.com', '+443157524000', 'asdf1234', '', '', '65d4a05d55869_dp.png', 'Male', 'English', 'London', '', '', '', '', '65d4a14c0f978.jpeg', '65d4a1580abfd.jpg', '', '', '', '', '', '', '', '', '', 0, '2024-02-20 17:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `driver_acounts`
--

CREATE TABLE `driver_acounts` (
  `ac_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `d_com` varchar(255) NOT NULL,
  `pay_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_location`
--

CREATE TABLE `driver_location` (
  `loc_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_vehicle`
--

CREATE TABLE `driver_vehicle` (
  `dv_id` int(55) NOT NULL,
  `v_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
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
  `date_v_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fares`
--

CREATE TABLE `fares` (
  `fare_id` int(55) NOT NULL,
  `job_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `journey_fare` int(55) NOT NULL,
  `car_parking` int(55) NOT NULL,
  `waiting` int(55) NOT NULL,
  `tolls` int(55) NOT NULL,
  `extras` int(55) NOT NULL,
  `fare_status` varchar(255) NOT NULL,
  `apply_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `job_id` int(55) NOT NULL,
  `c_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `journey_fare` int(11) NOT NULL,
  `car_parking` int(11) NOT NULL,
  `waiting` int(11) NOT NULL,
  `tolls` int(11) NOT NULL,
  `extra` int(11) NOT NULL,
  `total_pay` varchar(55) NOT NULL,
  `driver_commission` int(55) NOT NULL,
  `invoice_status` varchar(55) NOT NULL,
  `invoice_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `job_note` text NOT NULL,
  `journey_fare` int(55) NOT NULL,
  `booking_fee` int(55) NOT NULL,
  `car_parking` int(55) NOT NULL,
  `waiting` int(55) NOT NULL,
  `tolls` int(55) NOT NULL,
  `extra` int(55) NOT NULL,
  `job_status` varchar(255) NOT NULL,
  `date_job_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `lang_id` int(55) NOT NULL,
  `language` varchar(255) NOT NULL,
  `date_lang_add` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`lang_id`, `language`, `date_lang_add`) VALUES
(1, 'English', '2023-10-25'),
(2, 'French', '2023-10-25'),
(3, 'Spanish', '2023-10-25'),
(4, 'German', '2023-10-25'),
(5, 'Portuguese', '2023-10-25'),
(6, 'Arabic', '2023-10-25'),
(7, 'Russian', '2023-10-25'),
(8, 'Japanese', '2023-10-25'),
(9, 'Italian', '2023-10-25'),
(10, 'Bengali', '2023-10-25'),
(11, 'Hindi', '2023-10-25'),
(12, 'Korean', '2023-10-25'),
(13, 'Greek', '2023-10-25'),
(14, 'Turkish', '2023-10-25'),
(15, 'Indonesian', '2023-10-25'),
(16, 'Danish', '2023-10-25'),
(17, 'Gujarati', '2023-10-25'),
(18, 'Finnish', '2023-10-25'),
(19, 'Dutch', '2023-10-25'),
(20, 'Tamil', '2023-10-25'),
(21, 'Hungarian', '2023-10-25'),
(22, 'Romanian', '2023-10-25'),
(23, 'Czech', '2023-10-25'),
(24, 'Urdu', '2023-10-25');

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
  `mg_id` int(55) NOT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `pickup_charges` int(11) NOT NULL,
  `date_add_mg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `pay_id` int(55) NOT NULL,
  `invoice_id` int(55) NOT NULL,
  `amount` varchar(55) NOT NULL,
  `pay_month` date NOT NULL,
  `pay_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_by_location`
--

CREATE TABLE `price_by_location` (
  `pbl_id` int(55) NOT NULL,
  `vehicle_type` varchar(255) NOT NULL,
  `st_post` varchar(255) NOT NULL,
  `st_mile` varchar(255) NOT NULL,
  `fn_post` varchar(255) NOT NULL,
  `fn_mile` varchar(255) NOT NULL,
  `single_price` int(255) NOT NULL,
  `date_add_pbl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_mile`
--

CREATE TABLE `price_mile` (
  `pm_id` int(55) NOT NULL,
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
  `date_add_pm` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_postcode`
--

CREATE TABLE `price_postcode` (
  `pp_id` int(55) NOT NULL,
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
  `date_add_pp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `rev_id` int(55) NOT NULL,
  `job_id` int(11) NOT NULL,
  `d_id` int(55) NOT NULL,
  `c_id` int(55) NOT NULL,
  `rev_msg` text NOT NULL,
  `rev_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `special_dates`
--

CREATE TABLE `special_dates` (
  `dt_id` int(55) NOT NULL,
  `special_date` date NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `percent_increment` varchar(55) NOT NULL,
  `date_dt_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(55) NOT NULL,
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
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `user_email`, `user_password`, `user_phone`, `user_gender`, `designation`, `address`, `city`, `state`, `country_id`, `pc`, `nid`, `user_pic`, `reg_date`) VALUES
(1, 'Atiq', 'Ramzan', 'admin@prenero.com', 'b743c33627755c255938a992d3480cab', '', '', '', '', '', '', 37, 38000, '', '', '2024-02-20 12:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `v_id` int(55) NOT NULL,
  `v_name` varchar(255) NOT NULL,
  `v_seat` int(55) NOT NULL,
  `luggage` int(5) NOT NULL,
  `v_airbags` int(55) DEFAULT 0,
  `v_wchair` int(55) DEFAULT 0,
  `v_babyseat` int(55) DEFAULT 0,
  `v_pricing` int(55) NOT NULL,
  `v_img` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`v_id`, `v_name`, `v_seat`, `luggage`, `v_airbags`, `v_wchair`, `v_babyseat`, `v_pricing`, `v_img`, `date_added`) VALUES
(1, 'Saloon', 4, 0, 0, 0, 0, 50, 'toyota-prius.png', '2024-02-04 02:08:12'),
(2, 'Estate', 4, 0, 1, 1, 0, 50, '658a97f8e42ab_GCBtN4taYAA6D9K.jpg', '2023-12-26 02:15:44'),
(3, 'MPV\r\n', 4, 0, 0, 0, 0, 50, 'Ford-Galaxy.png', '2023-10-17 19:39:57'),
(4, 'Large MPV', 5, 0, 0, 0, 0, 50, 'Skoda_Octavia.png', '2023-10-17 19:39:57'),
(5, 'Minibus', 6, 0, 0, 0, 0, 50, 'Ford-Crown-Victoria.png', '2023-10-17 19:39:57'),
(6, 'Executive', 7, 0, 0, 0, 0, 50, 'Ford-Mondeo.png', '2023-10-17 19:39:57'),
(7, 'Executive Minibus', 8, 0, 0, 0, 0, 50, 'Skoda-Superb.png', '2023-10-17 19:39:57'),
(8, '10 - 14 Passenger', 10, 0, 0, 0, 0, 40, 'Toyota-Camry.png', '2023-10-17 19:39:57'),
(9, '15 - 16 Passenger', 15, 0, 0, 0, 0, 50, 'Citroen-Berlingo.png', '2023-10-17 19:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `zone_id` int(55) NOT NULL,
  `starting_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `distance` varchar(255) NOT NULL,
  `fare` varchar(255) NOT NULL,
  `zone_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`book_id`) USING BTREE;

--
-- Indexes for table `booking_type`
--
ALTER TABLE `booking_type`
  ADD PRIMARY KEY (`b_type_id`);

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
-- Indexes for table `driver_acounts`
--
ALTER TABLE `driver_acounts`
  ADD PRIMARY KEY (`ac_id`);

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
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `ap_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_type`
--
ALTER TABLE `booking_type`
  MODIFY `b_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `des_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `driver_acounts`
--
ALTER TABLE `driver_acounts`
  MODIFY `ac_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `dv_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fares`
--
ALTER TABLE `fares`
  MODIFY `fare_id` int(55) NOT NULL AUTO_INCREMENT;

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
  MODIFY `lang_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mg_charges`
--
ALTER TABLE `mg_charges`
  MODIFY `mg_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `pay_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_by_location`
--
ALTER TABLE `price_by_location`
  MODIFY `pbl_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_mile`
--
ALTER TABLE `price_mile`
  MODIFY `pm_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_postcode`
--
ALTER TABLE `price_postcode`
  MODIFY `pp_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `rev_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `special_dates`
--
ALTER TABLE `special_dates`
  MODIFY `dt_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(55) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
