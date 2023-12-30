-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2023 at 11:12 AM
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

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid_id`, `book_id`, `d_id`, `bid_amount`, `bid_date`) VALUES
(1, 1, 1, '120', '2023-10-14 08:31:01'),
(2, 2, 2, '120', '2023-10-27 02:21:59'),
(3, 2, 2, '120', '2023-10-27 02:22:07'),
(4, 1, 2, '120', '2023-10-27 02:22:13'),
(5, 1, 1, '120', '2023-10-27 02:22:17'),
(6, 3, 1, '120', '2023-10-27 02:22:22'),
(7, 4, 1, '120', '2023-10-27 02:22:26'),
(8, 5, 2, '80', '2023-10-27 02:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `bookers`
--

CREATE TABLE `bookers` (
  `b_id` int(55) NOT NULL,
  `b_name` varchar(255) NOT NULL,
  `b_email` varchar(255) NOT NULL,
  `b_phone` varchar(255) NOT NULL,
  `b_address` varchar(255) NOT NULL,
  `b_gender` varchar(55) NOT NULL,
  `b_language` varchar(55) NOT NULL,
  `b_pic` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `others` varchar(255) NOT NULL,
  `b_ni` varchar(255) NOT NULL,
  `commision_type` varchar(10) NOT NULL,
  `percent` int(10) NOT NULL,
  `fixed` int(10) NOT NULL,
  `acount_status` int(10) NOT NULL,
  `booker_reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookers`
--

INSERT INTO `bookers` (`b_id`, `b_name`, `b_email`, `b_phone`, `b_address`, `b_gender`, `b_language`, `b_pic`, `postal_code`, `company_name`, `others`, `b_ni`, `commision_type`, `percent`, `fixed`, `acount_status`, `booker_reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'Sargodha Road Faisalabad, Punjab, Pakistan.  38000', 'Male', 'English', '', '', '', 'Other Details', '33102-1457353-9', '', 0, 0, 0, '2023-12-13 20:00:29'),
(2, 'Azib Ali', 'azib@gmail.com', '+4123456523', 'London', 'Male', 'English', '', '2J53', 'Euro Data Tech', '', '3310214573539', '', 0, 0, 0, '2023-10-20 14:48:17'),
(3, 'Mahtab', 'Mahtab@prenero.com', '+923346452312', 'Faisalabad', 'Male', 'Urdu', '', '44000', 'Prenero Studio', '', '3310214573539', '', 0, 0, 0, '2023-10-20 14:48:29'),
(4, 'Azib Ali', 'azib@prenero.com', '+44123456789', 'N/A', 'Male', 'English', '23754970_1626130610784651_3422355630783723154_n.png', 'WJ 123', 'Prenero Studio', '', '33102-1457353-9', '10', 150, 0, 0, '2023-12-28 14:32:15'),
(5, 'Azib Ali', 'azib@prenero.com', '+44123456789', '', 'Male', 'English', 'IMG-20230922-WA0064.jpg', 'WJ 123', '', '', '', '', 0, 0, 0, '2023-12-13 19:04:18'),
(6, 'Azib Ali', 'azib@prenero.com', '+44123456789', '', 'Male', 'English', 'IMG-20230922-WA0073.jpg', '', '', 'Other Details', '33102-1457353-9', '', 0, 0, 1, '2023-12-28 14:32:25'),
(7, 'Azib Ali', 'azib@prenero.com', '+441234567894', 'wewdwdwdwed', 'Female', 'English', 'dp.png', 'WJ 123', 'Prenero Studio', 'wdewdwedwe', '33102-1457353-9', 'Fixed', 0, 25, 1, '2023-12-28 14:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `b_type_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `pickup` varchar(255) NOT NULL,
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

INSERT INTO `bookings` (`book_id`, `b_type_id`, `c_id`, `pickup`, `destination`, `address`, `postal_code`, `passenger`, `pick_date`, `pick_time`, `journey_type`, `v_id`, `luggage`, `child_seat`, `flight_number`, `delay_time`, `note`, `journey_fare`, `journey_distance`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `booking_status`, `bid_status`, `bid_note`, `book_add_date`) VALUES
(00000000001, 1, 1, 'Faisalabad', 'Lahore', '', '', 2, '2023-10-11', '15:00:00', 'One Way', 2, 'Yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', 1, '', '2023-10-27 02:10:09'),
(00000000002, 1, 1, 'Faisalabad', 'Lahore', '', '', 4, '2023-10-12', '18:06:00', 'One Way', 3, 'No', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-10-27 02:11:43'),
(00000000003, 1, 1, 'Faisalabad', 'Lahore', '', '', 2, '2023-10-12', '17:05:00', 'One Way', 5, 'Yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-10-27 02:11:52'),
(00000000004, 1, 1, 'Faisalabad', 'Lahore', '', '', 2, '2023-10-27', '05:00:00', 'Return', 7, 'Yes', '', '', '00:00:00', 'Be on time', 230, 26, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-10-27 02:12:05'),
(00000000005, 1, 1, 'Faisalabad', 'Lahore', '', '', 2, '2023-10-07', '05:25:00', 'Return', 1, 'Yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '2023-10-27 02:12:18'),
(00000000007, 1, 1, 'Faisalabad', 'Lahore', '', '', 6, '2023-10-26', '22:40:00', 'Return', 1, 'Yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', 1, '', '2023-12-28 16:53:19'),
(00000000009, 1, 2, 'Model Town', 'Lahore Airport', '', '', 4, '2023-10-30', '10:00:00', 'Return', 6, 'Yes', '', '', '00:00:00', 'NA', 230, 26, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-10-29 18:16:49'),
(00000000010, 1, 2, 'Model Town G Block', 'Lahore Airport', '', '', 4, '2023-10-31', '07:19:00', 'One Way', 4, 'Yes', '', '', '00:00:00', 'NA', 230, 26, 0, 0, 0, 0, 0, 'Pending', 1, '', '2023-12-28 16:52:28'),
(00000000014, 1, 3, 'London Airport', 'Central London', '', '', 4, '2023-12-21', '20:09:00', 'Return', 3, 'yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', 1, '', '2023-12-14 19:33:19'),
(00000000015, 1, 1, 'Heatherow Airport', 'Central London', '', '', 2, '2023-12-18', '14:00:00', 'One Way', 2, 'Yes', '', '', '00:00:00', 'N/A', 500, 22, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-12-28 16:52:38'),
(00000000016, 1, 1, 'Heatherow Airport', 'Central London', '', '', 2, '2023-12-18', '14:00:00', 'One Way', 1, 'Yes', '', '', '00:00:00', 'N/A', 500, 22, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-12-29 17:39:34'),
(00000000018, 0, 1, 'Heatherow Airport', 'Central London', '', '', 2, '0000-00-00', '00:00:00', 'One Way', 0, 'Yes', '', '', '00:00:00', 'N/A', 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-12-22 16:06:42'),
(00000000019, 1, 1, 'Shop # 24, Rehman Pura, Street # 3, Sargodha Road, Faisalabad.', 'Faisalabad International Airport, Jhang Road, Faisalabad', 'Islam Nager Faisalabad', '38000', 2, '2023-12-23', '16:00:00', 'One Way', 2, 'Yes', 'Yes', 'PK36524', '00:00:30', 'N/A', 2500, 15, 300, 50, 0, 100, 0, 'Pending', 0, 'Low Price Bid', '2023-12-29 18:36:26'),
(00000000020, 1, 1, 'Shop # 24, Rehman Pura, Street # 3, Sargodha Road, Faisalabad.', 'Faisalabad International Airport, Jhang Road, Faisalabad', 'Islam Nager Faisalabad', '38000', 2, '2023-12-23', '16:00:00', 'One Way', 2, 'Yes', 'Yes', 'PK36524', '00:00:30', 'N/A', 2500, 15, 250, 50, 100, 100, 100, 'Booked', 0, '', '2023-12-28 02:18:44'),
(00000000022, 2, 2, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', '', '', 0, '0000-00-00', '00:00:00', 'One Way', 0, '', 'Yes', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-12-28 02:21:20'),
(00000000023, 3, 3, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', 'Central London, London, UK', 'London', '44000', 4, '2023-12-30', '19:30:00', 'One Way', 4, 'yes', 'Yes', 'LN856', '00:00:30', '', 0, 28, 0, 0, 0, 0, 0, 'Booked', 0, '', '2023-12-28 02:27:02'),
(00000000024, 0, 0, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', 'Central London, London, UK', '', '', 0, '0000-00-00', '00:00:00', 'One Way', 0, '', 'Yes', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '2023-12-29 15:48:15');

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
  `c_address` varchar(255) NOT NULL,
  `c_gender` varchar(55) NOT NULL,
  `c_language` varchar(55) NOT NULL,
  `c_pic` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `others` text NOT NULL,
  `c_ni` varchar(255) NOT NULL,
  `status` int(5) NOT NULL,
  `acount_status` int(5) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_email`, `c_phone`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `status`, `acount_status`, `reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'Islam Nager', 'Male', 'Urdu', 'whatsapp-cover.png', '38000', 'N/A', '33102-1457353-9', 1, 1, '2023-12-22 12:05:21'),
(2, 'Azib Ali', 'azib@gmail.com', '+4123456523', 'London', 'Male', 'English', '191292809_191887349457614_3854475109950517153_n.jpg', '2J53', '', '3310214573539', 0, 0, '2023-12-24 17:58:36'),
(3, 'Mahtab Mukhtar', 'Mahtab@prenero.com', '+923346452312', 'Faisalabad', 'Male', 'Urdu', 'atiq-ramzan.png', '44000', '', '3310214573539', 0, 1, '2023-12-23 18:53:10'),
(5, 'Umar Atiq', 'umar@gmail.com', '+44257852264', 'Faisalabad', 'Male', 'English', 'afb06be2-b1dc-40cd-929a-8a17ba78ee82.jpg', 'WJ 123', 'Others', '3310214573539', 0, 0, '2023-12-23 22:57:12');

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
  `d_address` varchar(255) NOT NULL,
  `d_post_code` varchar(55) NOT NULL,
  `d_pic` varchar(255) NOT NULL,
  `d_gender` varchar(55) NOT NULL,
  `d_language` varchar(55) NOT NULL,
  `licence_authority` varchar(255) NOT NULL,
  `v_id` int(55) NOT NULL,
  `d_licence` varchar(55) NOT NULL,
  `d_licence_exp` varchar(55) NOT NULL,
  `pco_licence` varchar(55) NOT NULL,
  `pco_exp` varchar(55) NOT NULL,
  `skype_acount` varchar(255) NOT NULL,
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

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `v_id`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `skype_acount`, `dl_front`, `dl_back`, `national_insurance`, `basic_disclosure`, `work_proof`, `passport`, `dvla`, `d_remarks`, `latitude`, `longitude`, `status`, `acount_status`, `driver_reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'jghjgjhgjhgjgjg', '', '658d40ffd295a_IMG_web.jpg', 'Male', 'English', 'Ireland', 4, '12345678', '02-2024', '123456789', '02-2024', 'prenero', '658aea8c7548c.png', '', '', '', '', '', '', 'jgfjhjghjgjgjg', '51.512474660272886', '-0.14759970050199483', 'online', 1, '2023-12-28 14:33:51'),
(3, 'Mahtab Mukhtar', 'mahtab@prenero.com', '+923346452312', 'jghjgjhgjhgjgjg', '', '658d40f6a16df_atiqramzan.png', 'Male', 'English', 'Ireland', 4, '12345678', '02-2024', '123456789', '02-2024', 'prenero', '', '', '', '', '', '', '', 'jgfjhjghjgjgjg', '51.512474660272886', '-0.14759970050199483', 'online', 1, '2023-12-28 14:33:42'),
(5, 'Nauman Naseer', 'mauman@prenero.com', '+923217456894', 'jghjgjhgjhgjgjg', '', '658d40ef7aaa9_afb06be2-b1dc-40cd-929a-8a17ba78ee82.jpg', 'Male', 'English', 'Ireland', 4, '12345678', '02-2024', '123456789', '02-2024', 'prenero', '658aea29bf002.png', '', '', '', '', '', '', 'jgfjhjghjgjgjg', '51.512474660272886', '-0.14759970050199483', 'online', 1, '2023-12-28 14:33:35'),
(6, 'Azib Ali', 'azib@eurodatatech.com', '+44 2845789566', 'jghjgjhgjhgjgjg', '', '658d40bc53f9c_191292809_191887349457614_3854475109950517153_n.jpg', 'Male', 'English', 'Ireland', 4, '12345678', '02-2024', '123456789', '02-2024', 'prenero', '658ae9d34b9ff.png', '658ecde0a1d8d.jpg', '658ece655c3fd.jpg', '658ecee91a4d3.jpg', '658ed017e33e2.png', '658ed021aff3e.png', '658ed0271c0d5.jpg', 'jgfjhjghjgjgjg', '51.512474660272886', '-0.14759970050199483', 'online', 1, '2023-12-30 13:22:48'),
(8, 'Muhammad Saeed', 'admin@prenero.com', '+923127346634', '', '38000', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2023-12-30 00:42:33');

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

--
-- Dumping data for table `driver_location`
--

INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(2, 1, '52.45252939561881', '-1.9322932108127906', '2023-10-14 08:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `driver_vehicle`
--

CREATE TABLE `driver_vehicle` (
  `dv_id` int(55) NOT NULL,
  `v_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `date_v_add` date NOT NULL
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
  `apply_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fares`
--

INSERT INTO `fares` (`fare_id`, `job_id`, `d_id`, `journey_fare`, `car_parking`, `waiting`, `tolls`, `extras`, `fare_status`, `apply_date`) VALUES
(1, 1, 1, 250, 50, 50, 100, 10, 'Corrected', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(55) NOT NULL,
  `job_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `journey_fare` int(11) NOT NULL,
  `car_parking` int(11) NOT NULL,
  `waiting` int(11) NOT NULL,
  `tolls` int(11) NOT NULL,
  `extra` int(11) NOT NULL,
  `total_pay` varchar(55) NOT NULL,
  `invoice_status` varchar(55) NOT NULL,
  `invoice_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `job_id`, `d_id`, `journey_fare`, `car_parking`, `waiting`, `tolls`, `extra`, `total_pay`, `invoice_status`, `invoice_date`) VALUES
(1, 1, 1, 400, 20, 50, 0, 250, '720', 'unpaid', '2023-11-02 01:11:14'),
(2, 8, 6, 400, 20, 50, 0, 250, '720', 'unpaid', '2023-12-03 07:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
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

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `book_id`, `c_id`, `d_id`, `job_note`, `journey_fare`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `job_status`, `date_job_add`) VALUES
(1, 20, 1, 1, 'Bootstrap’s form controls expand on our Rebooted form styles with classes. Use these classes to opt into their customized displays for a more consistent rendering across browsers and devices.\r\n\r\nBe sure to use an appropriate type attribute on all inputs (e.g., email for email address or number for numerical information) to take advantage of newer input controls like email verification, number selection, and more.\r\n\r\nHere’s a quick example to demonstrate Bootstrap’s form styles. Keep reading for documentation on required classes, form layout, and more.', 2500, 250, 50, 100, 100, 100, 'completed', '2023-12-28 02:18:44'),
(3, 23, 3, 6, '', 250, 20, 50, 100, 50, 0, 'waiting', '2023-12-28 02:27:02'),
(4, 20, 1, 1, 'Bootstrap’s form controls expand on our Rebooted form styles with classes. Use these classes to opt into their customized displays for a more consistent rendering across browsers and devices.\r\n\r\nBe sure to use an appropriate type attribute on all inputs (e.g., email for email address or number for numerical information) to take advantage of newer input controls like email verification, number selection, and more.\r\n\r\nHere’s a quick example to demonstrate Bootstrap’s form styles. Keep reading for documentation on required classes, form layout, and more.', 2500, 250, 50, 100, 100, 100, 'completed', '2023-12-28 02:18:44'),
(5, 20, 1, 1, 'Bootstrap’s form controls expand on our Rebooted form styles with classes. Use these classes to opt into their customized displays for a more consistent rendering across browsers and devices.\r\n\r\nBe sure to use an appropriate type attribute on all inputs (e.g., email for email address or number for numerical information) to take advantage of newer input controls like email verification, number selection, and more.\r\n\r\nHere’s a quick example to demonstrate Bootstrap’s form styles. Keep reading for documentation on required classes, form layout, and more.', 2500, 250, 50, 100, 100, 100, 'waiting', '2023-12-28 02:18:44');

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
-- Table structure for table `mg_charges`
--

CREATE TABLE `mg_charges` (
  `mg_id` int(55) NOT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `pickup_charges` int(11) NOT NULL,
  `date_add_mg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mg_charges`
--

INSERT INTO `mg_charges` (`mg_id`, `pickup_location`, `pickup_charges`, `date_add_mg`) VALUES
(2, 'London International Airport', 50, '2023-12-10');

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

--
-- Dumping data for table `price_by_location`
--

INSERT INTO `price_by_location` (`pbl_id`, `vehicle_type`, `st_post`, `st_mile`, `fn_post`, `fn_mile`, `single_price`, `date_add_pbl`) VALUES
(1, '1-4 Passengers', '', '1', '123456', '1', 25, '2023-12-09'),
(2, '1-4 Passengers', 'we234', '1', 'inp24', '1', 15, '2023-12-09'),
(3, '1-4 Passengers', 'E1 7HT', '', 'E14 5NP', '', 0, '2023-12-09');

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

--
-- Dumping data for table `price_postcode`
--

INSERT INTO `price_postcode` (`pp_id`, `pickup`, `dropoff`, `1_4p`, `1_4e`, `5_6p`, `7p`, `8p`, `9p`, `10_14p`, `15_16p`, `date_add_pp`) VALUES
(1, 'E1 7HT', 'E14 5NP', 15, 3, 5, 6, 8, 9, 11, 12, '2023-12-09');

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

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`rev_id`, `job_id`, `d_id`, `c_id`, `rev_msg`, `rev_date`) VALUES
(1, 1, 1, 1, 'Very nice experince of travelling with this guy', '2023-11-02 12:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(55) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_pic` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `nid` varchar(255) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_pic`, `first_name`, `last_name`, `user_phone`, `designation`, `address`, `nid`, `reg_date`) VALUES
(1, 'admin@prenero.com', 'b743c33627755c255938a992d3480cab', '', 'Atiq', 'Ramzan', '+923157524000', 'Administrator', 'Faisalabad, Punjab, Pakistan', '33102-1457353-9', '2023-10-13 05:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `v_id` int(55) NOT NULL,
  `v_name` varchar(255) NOT NULL,
  `v_seat` int(55) NOT NULL,
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

INSERT INTO `vehicles` (`v_id`, `v_name`, `v_seat`, `v_airbags`, `v_wchair`, `v_babyseat`, `v_pricing`, `v_img`, `date_added`) VALUES
(1, 'Saloon', 4, 0, 0, 0, 50, 'toyota-prius.png', '2023-10-17 19:39:57'),
(2, 'Estate', 4, 1, 1, 0, 50, '658a97f8e42ab_GCBtN4taYAA6D9K.jpg', '2023-12-26 02:15:44'),
(3, 'MPV\r\n', 4, 0, 0, 0, 50, 'Ford-Galaxy.png', '2023-10-17 19:39:57'),
(4, 'Large MPV', 5, 0, 0, 0, 50, 'Skoda_Octavia.png', '2023-10-17 19:39:57'),
(5, 'Minibus', 6, 0, 0, 0, 50, 'Ford-Crown-Victoria.png', '2023-10-17 19:39:57'),
(6, 'Executive', 7, 0, 0, 0, 50, 'Ford-Mondeo.png', '2023-10-17 19:39:57'),
(7, 'Executive Minibus', 8, 0, 0, 0, 50, 'Skoda-Superb.png', '2023-10-17 19:39:57'),
(8, '10 - 14 Passenger', 10, 0, 0, 0, 40, 'Toyota-Camry.png', '2023-10-17 19:39:57'),
(9, '15 - 16 Passenger', 15, 0, 0, 0, 50, 'Citroen-Berlingo.png', '2023-10-17 19:39:57');

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
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `starting_point`, `end_point`, `distance`, `fare`, `zone_date`) VALUES
(1, 'Gatwick Airport', 'United Kingdom', 'Horley, Gatwick RH6 0NP', 'LGW', '2023-12-26 17:01:37');

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
-- Indexes for table `bookers`
--
ALTER TABLE `bookers`
  ADD PRIMARY KEY (`b_id`);

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
  MODIFY `bid_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bookers`
--
ALTER TABLE `bookers`
  MODIFY `b_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `booking_type`
--
ALTER TABLE `booking_type`
  MODIFY `b_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `des_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `driver_acounts`
--
ALTER TABLE `driver_acounts`
  MODIFY `ac_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `dv_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fares`
--
ALTER TABLE `fares`
  MODIFY `fare_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `lang_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `mg_charges`
--
ALTER TABLE `mg_charges`
  MODIFY `mg_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `pay_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_by_location`
--
ALTER TABLE `price_by_location`
  MODIFY `pbl_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `price_mile`
--
ALTER TABLE `price_mile`
  MODIFY `pm_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_postcode`
--
ALTER TABLE `price_postcode`
  MODIFY `pp_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `rev_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
