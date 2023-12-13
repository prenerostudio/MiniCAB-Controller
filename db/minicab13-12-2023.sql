-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 04:04 PM
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
  `b_password` varchar(255) NOT NULL,
  `b_address` varchar(255) NOT NULL,
  `b_gender` varchar(55) NOT NULL,
  `b_language` varchar(55) NOT NULL,
  `b_pic` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `others` varchar(255) NOT NULL,
  `b_ni` varchar(255) NOT NULL,
  `com_percentage` varchar(10) NOT NULL,
  `com_fixed` varchar(10) NOT NULL,
  `booker_reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookers`
--

INSERT INTO `bookers` (`b_id`, `b_name`, `b_email`, `b_phone`, `b_password`, `b_address`, `b_gender`, `b_language`, `b_pic`, `postal_code`, `company_name`, `others`, `b_ni`, `com_percentage`, `com_fixed`, `booker_reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'b743c33627755c255938a992d3480cab', 'Sargodha Road Faisalabad, Punjab, Pakistan.  38000', 'Male', 'English', '', '', '', 'Other Details', '33102-1457353-9', '', '', '2023-12-13 20:00:29'),
(2, 'Azib Ali', 'azib@gmail.com', '+4123456523', '25d55ad283aa400af464c76d713c07ad', 'London', 'Male', 'English', '', '2J53', 'Euro Data Tech', '', '3310214573539', '', '', '2023-10-20 14:48:17'),
(3, 'Mahtab', 'Mahtab@prenero.com', '+923346452312', '25d55ad283aa400af464c76d713c07ad', 'Faisalabad', 'Male', 'Urdu', '', '44000', 'Prenero Studio', '', '3310214573539', '', '', '2023-10-20 14:48:29'),
(4, 'Azib Ali', 'azib@prenero.com', '+44123456789', '6266a', 'N/A', 'Male', 'English', '', 'WJ 123', 'Prenero Studio', '', '33102-1457353-9', '10', '150', '2023-12-13 15:28:48'),
(5, 'Azib Ali', 'azib@prenero.com', '+44123456789', '123456', '', 'Male', 'English', 'IMG-20230922-WA0064.jpg', 'WJ 123', '', '', '', '', '', '2023-12-13 19:04:18'),
(6, 'Azib Ali', 'azib@prenero.com', '+44123456789', '123456', '', 'Male', 'English', 'IMG-20230922-WA0073.jpg', '', '', 'Other Details', '33102-1457353-9', '', '', '2023-12-13 20:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `pickup` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `passenger` int(55) NOT NULL,
  `luggage` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `book_date` date NOT NULL,
  `book_time` time NOT NULL,
  `journey_type` varchar(55) NOT NULL,
  `v_id` int(11) NOT NULL,
  `booking_status` varchar(55) NOT NULL,
  `bid_status` varchar(255) NOT NULL,
  `bid_note` varchar(255) NOT NULL,
  `book_add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `c_id`, `pickup`, `destination`, `passenger`, `luggage`, `note`, `book_date`, `book_time`, `journey_type`, `v_id`, `booking_status`, `bid_status`, `bid_note`, `book_add_date`) VALUES
(1, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-11', '15:00:00', 'One Way', 5, 'Pending', 'Open', '', '2023-10-27 02:10:09'),
(2, 1, 'Faisalabad', 'Lahore', 4, 'No', 'N/A', '2023-10-12', '18:06:00', 'One Way', 3, 'Pending', '', '', '2023-10-27 02:11:43'),
(3, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-12', '17:05:00', 'One Way', 3, 'Pending', '', '', '2023-10-27 02:11:52'),
(4, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'Be on time', '2023-10-27', '05:00:00', 'Return', 3, 'Pending', '', '', '2023-10-27 02:12:05'),
(5, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-07', '05:25:00', 'Return', 3, 'Pending', '', '', '2023-10-27 02:12:18'),
(7, 1, 'Faisalabad', 'Lahore', 6, 'Yes', 'N/A', '2023-10-26', '22:40:00', 'Return', 3, 'Pending', '', '', '2023-10-29 20:03:30'),
(9, 2, 'Model Town', 'Lahore Airport', 4, 'Yes', 'NA', '2023-10-30', '10:00:00', 'Return', 5, 'Pending', 'Open', '', '2023-10-29 18:16:49'),
(10, 2, 'Model Town G Block', 'Lahore Airport', 4, 'Yes', 'NA', '2023-10-31', '07:19:00', 'One Way', 13, 'Booked', 'Open', '', '2023-10-30 12:26:18'),
(11, 0, '', '', 0, '', '', '0000-00-00', '00:00:00', 'One Way', 0, 'Pending', '', '', '2023-12-11 14:10:22'),
(12, 0, 'Lahore', 'Faisalabad', 0, '', '', '0000-00-00', '00:00:00', 'One Way', 0, 'Pending', '', '', '2023-12-11 14:20:45'),
(13, 0, 'Lahore', 'Faisalabad', 0, '', '', '0000-00-00', '00:00:00', 'One Way', 0, 'Pending', '', '', '2023-12-11 16:25:25');

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
  `company_name` varchar(255) NOT NULL,
  `others` varchar(255) NOT NULL,
  `c_ni` varchar(255) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `company_name`, `others`, `c_ni`, `reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'b743c33627755c255938a992d3480cab', 'Sargodha Road Faisalabad, Punjab, Pakistan. ', 'Male', 'English', '', '38000', 'Prenero Studio', 'N/A', '33102-1457353-9', '2023-10-20 14:47:31'),
(2, 'Azib Ali', 'azib@gmail.com', '+4123456523', '25d55ad283aa400af464c76d713c07ad', 'London', 'Male', 'English', '', '2J53', 'Euro Data Tech', '', '3310214573539', '2023-10-20 14:48:17'),
(3, 'Mahtab', 'Mahtab@prenero.com', '+923346452312', '25d55ad283aa400af464c76d713c07ad', 'Faisalabad', 'Male', 'Urdu', '', '44000', 'Prenero Studio', '', '3310214573539', '2023-10-20 14:48:29');

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
  `d_password` varchar(255) NOT NULL,
  `d_phone` varchar(255) NOT NULL,
  `d_address` varchar(255) NOT NULL,
  `d_pic` varchar(255) NOT NULL,
  `d_gender` varchar(55) NOT NULL,
  `d_language` varchar(55) NOT NULL,
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

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_password`, `d_phone`, `d_address`, `d_pic`, `d_gender`, `d_language`, `v_id`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `skype_acount`, `dl_front`, `dl_back`, `national_insurance`, `basic_disclosure`, `work_proof`, `passport`, `dvla`, `d_remarks`, `latitude`, `longitude`, `status`, `acount_status`, `driver_reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', '6266a', '+923157524000', 'FSD ', 'img/drivers/20181017165737_IMG_6166.png', 'Male', 'English', 1, '123456789', '2023-10-28', '123456789', '2023-10-31', '', 'driving-licence.jpeg', 'licence-back.jpg', 'national_insurance.jpg', 'Basic-Disclosure.jpg', 'work-proof.png', 'british-passport.jpg', 'DVLA-Check.jpg', 'N/A', '51.52145727821898', '-0.12723122456155755', 'Waiting for Passenger!', 1, '2023-12-07 19:21:16'),
(3, 'Shahzib', 'shazaib@prenero.com', 'asdf1234', '+44125364585', '', 'img/drivers/20181017165737_IMG_6166.png', 'Male', 'English', 16, '12345678', '2023-10-28', '123456789', '2023-10-31', 'atiq.ramzan98', '', '', '', '', '', '', '', 'N.A', '51.512474660272886', '-0.13759970050199483', 'online', 1, '2023-12-07 19:37:44'),
(5, 'Mahtab Mukhtar', 'mahtab@prenero.com', '12345678', '032415246242', '', '', 'Male', 'English', 2, '12345678', '02-2024', '123456789', '02-2024', 'prenero', '', '', '', '', '', '', '', '', '51.512474660272886', '-0.14759970050199483', 'online', 0, '2023-10-30 13:06:50'),
(6, 'Nauman Naseer', 'nauman@prenero.com', '12345678', '03241524624', '', '', '', '', 8, '', '', '', '', '', '', '', '', '', '', '', '', '', '51.512474660272886', '-0.15759970050199483', 'online', 1, '2023-10-30 12:24:43');

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
  `extra_waiting` int(55) NOT NULL,
  `parking` int(55) NOT NULL,
  `tolls` int(55) NOT NULL,
  `fare_status` varchar(255) NOT NULL,
  `apply_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fares`
--

INSERT INTO `fares` (`fare_id`, `job_id`, `d_id`, `journey_fare`, `extra_waiting`, `parking`, `tolls`, `fare_status`, `apply_date`) VALUES
(1, 1, 1, 250, 200, 150, 1500, 'Corrected', '2023-12-13');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(55) NOT NULL,
  `job_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `distance` varchar(55) NOT NULL,
  `p_method` varchar(255) NOT NULL,
  `parking_charges` varchar(255) NOT NULL,
  `extra_drop_charges` varchar(255) NOT NULL,
  `driver_waiting` varchar(255) NOT NULL,
  `fare` varchar(55) NOT NULL,
  `total_pay` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL,
  `invoice_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `job_id`, `d_id`, `distance`, `p_method`, `parking_charges`, `extra_drop_charges`, `driver_waiting`, `fare`, `total_pay`, `status`, `invoice_date`) VALUES
(1, 1, 1, '', 'cash', '20', '50', '0', '250', '320', 'unpaid', '2023-11-02 01:11:14'),
(2, 8, 6, '', 'cash', '20', '50', '0', '250', '320', 'unpaid', '2023-12-03 07:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `distance` int(55) NOT NULL,
  `pay_method` varchar(255) NOT NULL,
  `fare` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `job_status` varchar(255) NOT NULL,
  `date_job_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `book_id`, `c_id`, `d_id`, `distance`, `pay_method`, `fare`, `note`, `job_status`, `date_job_add`) VALUES
(1, 1, 1, 1, 0, '', '5000', 'N/A', 'Completed', '2023-10-07 06:28:54'),
(2, 1, 1, 1, 0, '', '5000', 'N/A', 'Completed', '2023-10-07 06:33:09'),
(3, 1, 1, 1, 0, '', '5000', 'N/A', 'Waiting', '2023-10-11 12:22:39'),
(4, 1, 1, 1, 0, '', '2500', 'N/A', 'Cancelled', '2023-10-11 12:22:00'),
(5, 10, 2, 3, 0, 'Cash', '400', 'N/A', 'Waiting', '2023-10-29 19:43:22'),
(6, 7, 1, 3, 0, 'Cash', '400', '', 'Completed', '2023-10-29 20:03:56'),
(7, 10, 2, 5, 0, 'Cash', '400', '', 'Waiting', '2023-10-30 12:26:18');

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

--
-- Dumping data for table `price_mile`
--

INSERT INTO `price_mile` (`pm_id`, `start_from`, `end_to`, `1_4p`, `1_4e`, `5_6p`, `7p`, `8p`, `9p`, `10_14p`, `15_16p`, `date_add_pm`) VALUES
(1, 1, 10, 10, 10, 15, 20, 25, 30, 35, 40, '2023-12-05'),
(2, 10, 20, 15, 20, 25, 30, 35, 40, 45, 50, '2023-12-05'),
(3, 1, 10, 10, 10, 15, 20, 25, 30, 35, 40, '2023-12-05'),
(4, 10, 20, 15, 20, 25, 30, 35, 40, 45, 50, '2023-12-05'),
(5, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, '2023-12-09');

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
  `v_seat` varchar(255) NOT NULL,
  `v_bags` varchar(255) DEFAULT NULL,
  `v_wchair` varchar(255) DEFAULT NULL,
  `v_trailer` varchar(55) DEFAULT NULL,
  `v_booster` varchar(55) DEFAULT NULL,
  `v_baby` varchar(55) DEFAULT NULL,
  `v_pricing` varchar(55) NOT NULL,
  `v_img` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`v_id`, `v_name`, `v_seat`, `v_bags`, `v_wchair`, `v_trailer`, `v_booster`, `v_baby`, `v_pricing`, `v_img`, `date_added`) VALUES
(1, 'Toyota Prius', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/toyota-prius.png', '2023-10-17 19:39:57'),
(2, 'Hackney carriage', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/hackney-carriage.png', '2023-10-17 19:39:57'),
(3, 'Ford Galaxy', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Ford-Galaxy.png', '2023-10-17 19:39:57'),
(4, 'Škoda Octavia', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Skoda_Octavia.png', '2023-10-17 19:39:57'),
(5, 'Ford Crown Victoria', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Ford-Crown-Victoria.png', '2023-10-17 19:39:57'),
(6, 'Ford Mondeo', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Ford-Mondeo.png', '2023-10-17 19:39:57'),
(7, 'Škoda Superb', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Škoda-Superb.png', '2023-10-17 19:39:57'),
(8, 'Toyota Camry', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '40', 'img/vehicles/Toyota-Camry.png', '2023-10-17 19:39:57'),
(9, 'Citroen Berlingo', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Citroen-Berlingo.png', '2023-10-17 19:39:57'),
(10, 'Mercedes C', '8', 'yes', 'yes', 'yes', 'yes', 'yes', '250', 'img/vehicles/Mercedes-C.png', '2023-10-17 19:39:57'),
(11, 'Nissan NV200', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Nissan-NV200.png', '2023-10-17 19:39:57'),
(12, 'Volkswagen Touran', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '120', 'img/vehicles/Volkswagen-Touran.png', '2023-10-17 19:39:57'),
(13, 'Hansom cab', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/hansomcab.png', '2023-10-17 19:39:57'),
(14, 'Toyota Crown', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Toyota-Crown.png', '2023-10-17 19:39:57'),
(15, 'Toyota HiAce', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Toyota-HiAce.png', '2023-10-17 19:39:57'),
(16, 'BYD e6', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/BYD-e6.png', '2023-10-17 19:39:57'),
(17, 'Hyundai Ioniq', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Hyundai-Ioniq.png', '2023-10-17 19:39:57'),
(18, 'Honda Civic', '4', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', '50', 'img/vehicles/Honda-Civic.png', '2023-10-27 05:00:53');

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
(1, 'Chiniot ', 'Sargodha', '60', '270', '2023-10-28 00:00:00');

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
  MODIFY `ap_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bookers`
--
ALTER TABLE `bookers`
  MODIFY `b_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `des_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `pm_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
