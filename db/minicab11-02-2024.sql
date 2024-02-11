-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2024 at 04:30 PM
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
(1, 14, 2, '500', '2024-02-04 08:32:04'),
(2, 1, 1, '2', '2024-02-04 10:59:55'),
(3, 1, 1, '2', '2024-02-04 11:00:14');

-- --------------------------------------------------------

--
-- Table structure for table `booker_account`
--

CREATE TABLE `booker_account` (
  `acc_id` int(55) NOT NULL,
  `c_id` int(55) NOT NULL,
  `book_id` int(55) NOT NULL,
  `comission_amount` int(11) NOT NULL,
  `commission_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booker_account`
--

INSERT INTO `booker_account` (`acc_id`, `c_id`, `book_id`, `comission_amount`, `commission_date`) VALUES
(4, 3, 9, 50, '2024-01-18 19:48:31'),
(5, 3, 10, 50, '2024-01-18 19:49:10');

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
(00000000001, 1, 1, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', 'Central London, London, UK', 'London', 'WJ123', 2, '2023-12-30', '17:30:00', 'One Way', 2, 'yes', 'Yes', 'LN856', '00:00:30', 'N/A', 250, 28, 30, 0, 0, 0, 0, 'Booked', 0, '', '2023-12-30 22:04:55'),
(00000000004, 1, 1, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', 'Central London, London, UK', '', 'WJ123', 2, '2024-01-05', '23:03:00', 'One Way', 4, '', 'Yes', '', '00:00:00', '', 450, 28, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '2024-01-04 21:30:10'),
(00000000005, 1, 1, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', 'Eastbourne, UK', '', 'WJ123', 3, '2024-01-18', '15:16:00', 'One Way', 4, 'yes', 'Yes', '', '00:30:00', '', 2115, 141, 50, 0, 0, 0, 0, 'Pending', 1, '', '2024-01-20 22:33:01'),
(00000000009, 3, 3, 'Jail Road', '', 'General Bus Stand', 'Sargodha Road', '38000', 3, '2024-01-18', '07:43:00', 'return', 2, 'yes', 'no', 'PK365', '00:00:20', 'N/A', 500, 25, 0, 0, 0, 0, 0, 'Pending', 1, '', '2024-01-20 22:31:50'),
(00000000010, 3, 3, 'Jail Road', '', 'General Bus Stand', 'Sargodha Road', '38000', 3, '2024-01-18', '07:43:00', 'return', 2, 'yes', 'no', 'PK365', '00:20:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 'Pending', 1, '', '2024-01-20 22:31:43'),
(00000000011, 1, 3, 'Jail Road', '', 'General Bus Stand', 'Sargodha Road', '38000', 3, '2024-01-18', '07:43:00', 'return', 2, 'yes', 'no', 'PK365', '00:20:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 'Pending', 1, '', '2024-01-20 22:31:32'),
(00000000012, 1, 1, 'Drayford Close, London W9 3DJ, UK', '', 'Terminal 3, Nelson Road, Longford, Hounslow, UK', '', '', 2, '2024-01-21', '19:30:00', 'One Way', 1, '2l', 'No', 'ek001', '00:00:30', 'Please enter after 25 minutes from flight landing', 387, 26, 1, 1, 0, 0, 0, 'Pending', 1, '', '2024-01-20 22:29:10'),
(00000000013, 1, 1, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'New Civil Lines, Civil Lines, Faisalabad, Pakistan', 'faisalabad', '38000', 2, '2023-09-09', '08:08:00', 'One Way', 5, 'null', 'null', '', '00:00:00', '', 5, 1, 0, 0, 0, 0, 0, 'Booked', 0, '', '2024-01-30 21:31:13'),
(00000000014, 3, 3, 'New City Road, London, UK', '', 'New Cross, London, UK', 'uk', '34DF45', 2, '2024-01-24', '19:55:00', 'One Way', 3, '1', 'Yes', '', '00:00:00', '', 191, 13, 0, 0, 25, 50, 60, 'Booked', 0, '', '2024-01-31 19:57:03'),
(00000000015, 3, 3, 'United Kingdom House, London, UK', '', 'Ukraine Road, Salford, UK', 'uk', '34DF45', 3, '2024-01-31', '20:59:00', '', 3, '1', 'Yes', '', '00:00:00', '', 5276, 335, 0, 0, 0, 0, 0, 'Pending', 1, '', '2024-01-31 19:59:38'),
(00000000016, 3, 3, 'London, UK', '', 'Ukraine Road, London, UK', 'uk', '34DF45', 2, '2024-01-31', '20:05:00', 'One Way', 2, '2', 'Yes', '', '00:00:00', '', 88, 6, 50, 20, 0, 0, 0, 'Pending', 1, '', '2024-01-31 20:01:00'),
(00000000017, 1, 4, 'Lahore, Pakistan', '', 'Lahore City, Pakistan', 'Prenero Soluti', '38000', 2, '2024-05-09', '08:08:00', 'One Way', 3, 'Yes', 'Yes', '', '00:00:00', '', 105, 21, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-01 21:38:54'),
(00000000018, 1, 3, 'Lahore City, Pakistan', '', 'Lahore, Pakistan', 'lahore', '6500', 3, '2025-02-03', '08:09:00', 'Return', 6, 'Yes', 'Yes', '', '00:00:00', '', 219, 22, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-02 00:54:43'),
(00000000019, 1, 4, 'Lahore City, Pakistan', '', 'Lahore, Pakistan', 'lahore', '3800', 2, '2024-02-09', '05:05:05', 'Return', 7, 'Yes', 'Yes', '', '00:00:00', '', 219, 22, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-02 01:39:38'),
(00000000020, 1, 1, 'London N12, UK', '', 'Heathrow Airport (LHR), Hounslow, UK', 'r3ff3d', '821555115', 1, '2024-05-23', '00:15:20', 'One Way', 0, 'null', 'null', 'e65', '00:00:30', 'trrr3', 159, 32, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-02 17:50:27'),
(00000000021, 1, 16, 'Lahore, Pakistan', '', 'Lahore City, Pakistan', 'lahore', '380000', 3, '2024-08-09', '08:10:10', 'One Way', 4, 'Yes', 'Yes', '', '00:00:00', '', 105, 21, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-04 15:51:35');

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
(1, 'Azib Ali', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', '', '', '', '', '', '', '', 0, '', 'Percentage', 10, 0, 1, 1, '2024-01-23 09:11:53'),
(2, 'Atiq Ramzan', 'hello@prenero.com', '+923127346634', '6266a', '', '', '', '', '', '', '', 0, '', 'Percentage', 8, 0, 0, 1, '2024-01-28 07:03:15'),
(3, 'Atiq Ramzan', 'prenero12@gmail.com', '+923346452312', 'asdf1234', 'Lahore', 'Male', 'English', '', '34303', 'Nothing ðŸ˜ž\n', '23340404400404', 0, '', 'Percentage', 20, 0, 1, 2, '2024-02-03 02:43:39'),
(4, 'Atiq', 'prenero@gmail.com', '+923157524000', 'asdf1234', '', '', '', '', '', '', '', 0, '', 'Percentage', 12, 0, 0, 1, '2024-02-01 09:34:17'),
(16, 'Muhammad Atiq', 'atiqurramzan@gmail.com', '+923201839363', '12345678', 'Lahore', 'Male', 'English', '', '44000', 'N/A', '', 0, '', 'Percentage', 15, 0, 1, 2, '2024-02-04 12:11:28');

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

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `skype_acount`, `dl_front`, `dl_back`, `national_insurance`, `basic_disclosure`, `work_proof`, `passport`, `dvla`, `d_remarks`, `latitude`, `longitude`, `status`, `acount_status`, `driver_reg_date`) VALUES
(1, 'Azib Ali', 'eruodatatechnology@gmail.com', '+447552834179', 'asdf1234', '31 Drayford Close LONDON - W9 3DJ United Kingdom (GB)', 'W9 3DJ', '', 'Male', 'English', 'London', '12345678', '02-2025', '12345678', '02-2025', 'eurodatatech', '65afdc4f878bf_1000059539.jpg', '65afdc4f881d3_1000059539.jpg', '65afdc4f8836f_1000059539.jpg', '65afdc4f887ca_1000059539.jpg', '65afdc4f88c7a_1000059539.jpg', '65afdc4f89195_1000059539.jpg', '65afdc4f89714_1000059539.jpg', 'N/A', '52.1680353', '4.5082612', 'Online', 1, '2024-01-23 08:33:35'),
(2, 'talha ahmnad', 'prenero12@gmail.com', '+923346452312', 'asdf1234', '', '', '', 'Male', '', 'London', '', '', '', '', '', '65b51d5fba08c_3.jpg', '65b51d5fbaac4_3.jpg', '65b51d5fbad2c_3.jpg', '65b51d5fbb1a3_3.jpg', '65b51d5fbb5c1_1.jpg', '65b51d5fbba18_2.jpg', '65b51d5fbbe42_4.jpg', '', '52.1680358', '4.5082612', 'On Ride', 1, '2024-01-31 11:51:56'),
(4, 'Mahtab mukhtar', 'mahtab@gmail.com', '+923042459011', '6266a', '', '', '', 'Male', '', 'London', '', '', '', '', '', '65b604e052423_1000062908.jpg', '65b604e0527b5_1000062908.jpg', '65b604e053d27_1000062908.jpg', '65b604e053ff9_1000062908.jpg', '65b604e054255_1000062908.jpg', '65b604e054469_1000062908.jpg', '65b604e054947_1000062908.jpg', '', '', '', '', 1, '2024-01-28 12:40:58'),
(5, 'atiq ramzan', 'mahtab@gmail.com', '+923227932352', '12345678', '', '', '', 'Male', '', 'East Midlands', '', '', '', '', '', '65b619776982a_1000062902.jpg', '65b619776a60a_1000062902.jpg', '65b619776a80e_1000062902.jpg', '65b619776aa65_1000062902.jpg', '65b619776c62c_1000062902.jpg', '65b619776c84a_1000062902.jpg', '65b619776ca5b_1000062902.jpg', '', '52.1680352', '4.5082812', 'Offline', 1, '2024-01-28 14:08:46'),
(6, 'Testing', 'hi@gmail.com', '+923020698907', '12345678', '', '', '', 'Male', '', 'North West', '', '', '', '', '', '65b7c00f5716e_1000062978.jpg', '65b7c00f5990a_1000062978.jpg', '65b7c00f5ab66_1000062978.jpg', '65b7c00f5b0e6_1000062978.jpg', '65b7c00f5b4e0_1000062978.jpg', '65b7c00f5b851_1000062978.jpg', '65b7c00f5bcce_1000062978.jpg', '', '', '', '', 0, '2024-01-29 08:11:11');

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
(1, 1, '31.4415242', '73.0886818', '2024-01-23 08:44:59'),
(2, 1, '31.4415242', '73.0886818', '2024-01-23 08:45:00'),
(3, 1, '31.4415153', '73.0886675', '2024-01-23 08:45:10'),
(4, 1, '31.4415179', '73.0886655', '2024-01-23 08:45:22'),
(5, 1, '31.4414876', '73.0886326', '2024-01-28 11:18:07'),
(6, 1, '31.4415299', '73.0886825', '2024-01-28 11:18:17'),
(7, 1, '31.4415361', '73.0886864', '2024-01-28 11:18:30'),
(8, 1, '31.4415205', '73.088673', '2024-01-28 11:18:38'),
(9, 1, '31.4415338', '73.0886837', '2024-01-28 11:18:48'),
(10, 1, '31.4415366', '73.0886874', '2024-01-28 11:19:00'),
(11, 1, '31.4415529', '73.088706', '2024-01-28 11:19:08'),
(12, 1, '31.4415562', '73.0887104', '2024-01-28 11:19:17'),
(13, 1, '31.4415344', '73.0886911', '2024-01-28 11:19:27'),
(14, 1, '31.4415384', '73.0886905', '2024-01-28 11:19:37'),
(15, 1, '31.441552', '73.0887125', '2024-01-28 11:19:47'),
(16, 1, '31.4415368', '73.0886875', '2024-01-28 11:19:57'),
(17, 1, '31.4415348', '73.0886856', '2024-01-28 11:20:07'),
(18, 1, '31.4415355', '73.0886855', '2024-01-28 11:20:17'),
(19, 1, '31.4415356', '73.0886856', '2024-01-28 11:20:27'),
(20, 1, '31.441534', '73.0886855', '2024-01-28 11:20:37'),
(21, 1, '31.4415302', '73.0886804', '2024-01-28 11:20:48'),
(22, 1, '31.4415299', '73.0886798', '2024-01-28 11:20:58'),
(23, 1, '31.4415231', '73.0886773', '2024-01-28 11:21:07'),
(24, 1, '31.4415321', '73.0886859', '2024-01-28 11:21:18'),
(25, 1, '31.4415276', '73.0886807', '2024-01-28 11:21:31'),
(26, 1, '31.4415253', '73.0886802', '2024-01-28 11:21:35'),
(27, 1, '31.4415301', '73.0886844', '2024-01-28 11:21:45'),
(28, 1, '31.4415298', '73.0886843', '2024-01-28 11:21:55'),
(29, 1, '31.4415502', '73.0887065', '2024-01-28 11:22:08'),
(30, 1, '31.4415272', '73.0886803', '2024-01-28 11:22:16'),
(31, 1, '31.4415306', '73.088688', '2024-01-28 11:22:25'),
(32, 1, '31.4415157', '73.08867', '2024-01-28 11:22:35'),
(33, 0, '31.4415259', '73.0886762', '2024-01-28 11:22:45'),
(34, 0, '31.4415228', '73.0886732', '2024-01-28 11:22:56'),
(35, 0, '31.4415486', '73.0887123', '2024-01-28 11:23:05'),
(36, 0, '31.4415372', '73.0886989', '2024-01-28 02:12:16'),
(37, 0, '31.441538', '73.0886988', '2024-01-28 02:12:28'),
(38, 0, '31.4415369', '73.0886939', '2024-01-28 02:12:36'),
(39, 0, '31.4415362', '73.0886914', '2024-01-28 02:12:49'),
(40, 0, '31.4415343', '73.0886843', '2024-01-28 02:12:58'),
(41, 0, '31.4415552', '73.0887104', '2024-01-28 02:13:07'),
(42, 0, '31.4415332', '73.0886843', '2024-01-28 02:13:18'),
(43, 0, '31.4415344', '73.0886842', '2024-01-28 02:13:28'),
(44, 0, '31.4415055', '73.0886578', '2024-01-28 02:13:38'),
(45, 0, '31.4415008', '73.0886539', '2024-01-28 02:13:47'),
(46, 0, '31.4415084', '73.088662', '2024-01-28 02:13:56'),
(47, 0, '31.4414929', '73.0886488', '2024-01-28 02:14:06'),
(48, 0, '31.4415183', '73.0886704', '2024-01-28 02:14:17'),
(49, 0, '31.4415141', '73.088666', '2024-01-28 02:14:26'),
(50, 0, '31.4415191', '73.0886735', '2024-01-28 02:14:37'),
(51, 0, '31.4415268', '73.0886809', '2024-01-28 02:14:47'),
(52, 0, '31.4414985', '73.0886412', '2024-01-28 02:14:57'),
(53, 0, '31.4415276', '73.088673', '2024-01-28 02:15:06'),
(54, 0, '31.4415341', '73.0886797', '2024-01-28 02:15:17'),
(55, 0, '31.4415399', '73.0886642', '2024-01-28 02:15:26'),
(56, 0, '31.4415469', '73.0886593', '2024-01-28 02:15:36'),
(57, 0, '31.4415313', '73.0886902', '2024-01-28 02:15:46'),
(58, 0, '31.4415315', '73.0886875', '2024-01-28 02:16:01'),
(59, 0, '31.4415259', '73.0886705', '2024-01-28 02:16:29'),
(60, 0, '31.4414856', '73.0886274', '2024-01-28 02:16:38'),
(61, 0, '31.4415162', '73.0886643', '2024-01-28 02:16:47'),
(62, 0, '31.4415181', '73.0886636', '2024-01-28 02:17:09'),
(63, 0, '31.4414932', '73.0886864', '2024-01-28 02:17:16'),
(64, 0, '31.4414526', '73.0885867', '2024-01-28 02:17:18'),
(65, 0, '31.4414576', '73.0886039', '2024-01-28 02:17:26'),
(66, 5, '31.4413276', '73.0886623', '2024-01-29 11:19:40'),
(67, 5, '31.441325', '73.0886451', '2024-01-29 11:19:49'),
(68, 5, '31.441325', '73.088645', '2024-01-29 11:19:59'),
(69, 5, '31.441325', '73.088645', '2024-01-29 11:20:09'),
(70, 5, '31.4412418', '73.0885945', '2024-01-29 11:20:19'),
(71, 5, '31.44124', '73.088595', '2024-01-29 11:20:29'),
(72, 5, '31.44124', '73.088595', '2024-01-29 11:20:39'),
(73, 5, '31.44124', '73.088595', '2024-01-29 11:20:49'),
(74, 5, '31.4413217', '73.0886617', '2024-01-29 11:21:00'),
(75, 5, '31.4413217', '73.0886617', '2024-01-29 11:21:09'),
(76, 5, '31.4413217', '73.0886617', '2024-01-29 11:21:19'),
(77, 5, '31.4413783', '73.0885683', '2024-01-29 11:21:29'),
(78, 5, '31.4413783', '73.0885683', '2024-01-29 11:21:39'),
(79, 5, '31.4413783', '73.0885683', '2024-01-29 11:21:49'),
(80, 5, '31.4413783', '73.0885683', '2024-01-29 11:21:59'),
(81, 5, '31.4413783', '73.0885683', '2024-01-29 11:22:09'),
(82, 2, '31.4414436', '73.0887222', '2024-01-30 01:37:01'),
(83, 2, '31.4414047', '73.0886984', '2024-01-30 01:37:11'),
(84, 2, '31.441436', '73.0885449', '2024-01-30 01:37:21'),
(85, 2, '31.4411837', '73.088822', '2024-01-30 01:37:31'),
(86, 2, '31.4411968', '73.0888068', '2024-01-30 01:37:41'),
(87, 2, '31.4411627', '73.0887557', '2024-01-30 01:37:51'),
(88, 2, '31.441175', '73.0887504', '2024-01-30 01:38:01'),
(89, 2, '31.4412941', '73.0887714', '2024-01-30 01:38:10'),
(90, 2, '31.4414055', '73.0887945', '2024-01-30 01:38:21'),
(91, 2, '31.441288', '73.0887363', '2024-01-30 01:38:31'),
(92, 2, '31.4414177', '73.0886376', '2024-01-30 01:38:41'),
(93, 2, '31.4413811', '73.088623', '2024-01-30 01:38:51'),
(94, 2, '31.4413614', '73.0886361', '2024-01-30 01:39:01'),
(95, 2, '31.4413299', '73.0885559', '2024-01-30 01:39:11'),
(96, 2, '31.4412571', '73.0883369', '2024-01-30 01:39:21'),
(97, 2, '31.4413204', '73.0884794', '2024-01-30 01:39:31'),
(98, 2, '31.4413604', '73.0884943', '2024-01-30 01:39:41'),
(99, 2, '31.4413292', '73.0884776', '2024-01-30 01:39:51'),
(100, 2, '31.4413934', '73.0885461', '2024-01-30 01:40:01'),
(101, 2, '31.4414033', '73.0885683', '2024-01-30 01:40:11'),
(102, 2, '31.441314', '73.0883714', '2024-01-30 01:40:21'),
(103, 2, '31.4413219', '73.0883535', '2024-01-30 01:40:31'),
(104, 2, '31.4413921', '73.0885575', '2024-01-30 01:40:40'),
(105, 2, '31.4414293', '73.0886274', '2024-01-30 01:40:50'),
(106, 2, '31.4413695', '73.0885791', '2024-01-30 01:41:01'),
(107, 2, '31.4413041', '73.0885801', '2024-01-30 01:41:11'),
(108, 2, '31.4413227', '73.0885889', '2024-01-30 01:41:20'),
(109, 2, '31.4414007', '73.0886528', '2024-01-30 01:41:31'),
(110, 2, '31.4414117', '73.0886533', '2024-01-30 01:41:41'),
(111, 2, '31.4414316', '73.0886479', '2024-01-30 01:41:51'),
(112, 2, '31.4414317', '73.0886467', '2024-01-30 01:42:01'),
(113, 2, '31.4414664', '73.088712', '2024-01-30 01:42:11'),
(114, 2, '31.441582', '73.0888609', '2024-01-30 01:42:21'),
(115, 2, '31.4415956', '73.0888721', '2024-01-30 01:42:31'),
(116, 2, '31.4415818', '73.0888831', '2024-01-30 01:42:41'),
(117, 2, '31.4415395', '73.0888929', '2024-01-30 01:42:51'),
(118, 2, '31.4415074', '73.0889947', '2024-01-30 01:43:01'),
(119, 2, '31.4415078', '73.0889987', '2024-01-30 01:43:11'),
(120, 2, '31.4415006', '73.0890012', '2024-01-30 01:43:21'),
(121, 2, '31.4415308', '73.08897', '2024-01-30 01:43:31'),
(122, 2, '31.4415055', '73.0889909', '2024-01-30 01:43:41'),
(123, 2, '31.4415069', '73.0889836', '2024-01-30 01:43:51'),
(124, 2, '31.4415148', '73.0889718', '2024-01-30 01:44:01'),
(125, 2, '31.4414538', '73.0888749', '2024-01-30 01:44:11'),
(126, 2, '31.4414501', '73.0888824', '2024-01-30 01:44:21'),
(127, 2, '31.4414785', '73.0889187', '2024-01-30 01:44:31'),
(128, 2, '31.4414831', '73.0889069', '2024-01-30 01:44:41'),
(129, 2, '31.4415265', '73.0889539', '2024-01-30 01:44:51'),
(130, 2, '31.4415167', '73.0889414', '2024-01-30 01:45:01'),
(131, 2, '31.4415055', '73.0889107', '2024-01-30 01:45:11'),
(132, 2, '31.4415182', '73.0889076', '2024-01-30 01:45:21'),
(133, 2, '31.4415085', '73.0889349', '2024-01-30 01:45:31'),
(134, 2, '31.4415062', '73.0889271', '2024-01-30 01:45:41'),
(135, 2, '31.4414956', '73.0888926', '2024-01-30 01:45:51'),
(136, 2, '31.4414186', '73.0888356', '2024-01-30 01:46:01'),
(137, 2, '31.4415097', '73.088852', '2024-01-30 01:46:11'),
(138, 2, '31.4415203', '73.0888423', '2024-01-30 01:46:21'),
(139, 2, '31.4414693', '73.0888343', '2024-01-30 01:46:31'),
(140, 2, '31.4414617', '73.0888282', '2024-01-30 01:46:41'),
(141, 2, '31.4414833', '73.0888317', '2024-01-30 01:46:51'),
(142, 2, '31.4414715', '73.0888268', '2024-01-30 01:47:01'),
(143, 2, '31.4414778', '73.088822', '2024-01-30 01:47:11'),
(144, 2, '31.441558', '73.0888993', '2024-01-30 01:47:21'),
(145, 2, '31.4417815', '73.0891962', '2024-01-30 01:47:30'),
(146, 5, '31.4414738', '73.0886024', '2024-01-30 01:47:31'),
(147, 2, '31.4417867', '73.0892217', '2024-01-30 01:47:41'),
(148, 5, '31.4415259', '73.0886768', '2024-01-30 01:47:42'),
(149, 2, '31.4417867', '73.0892217', '2024-01-30 01:47:52'),
(150, 5, '31.4414701', '73.0885944', '2024-01-30 01:47:55'),
(151, 5, '31.4414701', '73.0885944', '2024-01-30 01:47:57'),
(152, 2, '31.4417867', '73.0892217', '2024-01-30 01:48:01'),
(153, 5, '31.4414728', '73.0885985', '2024-01-30 01:48:11'),
(154, 2, '31.4417867', '73.0892217', '2024-01-30 01:48:11'),
(155, 2, '31.4417867', '73.0892217', '2024-01-30 01:48:21'),
(156, 5, '31.441478', '73.0886075', '2024-01-30 01:48:24'),
(157, 5, '31.441478', '73.0886075', '2024-01-30 01:48:28'),
(158, 2, '31.4417867', '73.0892217', '2024-01-30 01:48:31'),
(159, 2, '31.4417867', '73.0892217', '2024-01-30 01:48:41'),
(160, 5, '31.4414719', '73.0886015', '2024-01-30 01:48:41'),
(161, 2, '31.4417867', '73.0892217', '2024-01-30 01:48:51'),
(162, 5, '31.4414736', '73.0886007', '2024-01-30 01:48:54'),
(163, 5, '31.4414736', '73.0886007', '2024-01-30 01:48:58'),
(164, 2, '31.4418083', '73.0892117', '2024-01-30 01:49:01'),
(165, 2, '31.4418083', '73.0892117', '2024-01-30 01:49:11'),
(166, 5, '31.4414724', '73.0885998', '2024-01-30 01:49:11'),
(167, 2, '31.4418083', '73.0892117', '2024-01-30 01:49:21'),
(168, 5, '31.4414731', '73.0885999', '2024-01-30 01:49:24'),
(169, 5, '31.4414731', '73.0885999', '2024-01-30 01:49:28'),
(170, 2, '31.4418083', '73.0892117', '2024-01-30 01:49:31'),
(171, 2, '31.4418083', '73.0892117', '2024-01-30 01:49:41'),
(172, 5, '31.4414742', '73.0886037', '2024-01-30 01:49:41'),
(173, 2, '31.4417826', '73.0890952', '2024-01-30 01:49:51'),
(174, 5, '31.4414716', '73.088598', '2024-01-30 01:49:54'),
(175, 5, '31.4414716', '73.088598', '2024-01-30 01:49:58'),
(176, 2, '31.441755', '73.088965', '2024-01-30 01:50:01'),
(177, 5, '31.4414728', '73.0886025', '2024-01-30 01:50:08'),
(178, 2, '31.4417568', '73.0888829', '2024-01-30 01:50:10'),
(179, 2, '31.4416004', '73.088786', '2024-01-30 01:50:21'),
(180, 2, '31.4412933', '73.0884917', '2024-01-30 01:50:31'),
(181, 2, '31.4413483', '73.088575', '2024-01-30 01:50:41'),
(182, 2, '31.4392253', '73.085484', '2024-01-30 10:23:19'),
(183, 2, '31.4392282', '73.0854807', '2024-01-30 10:23:29'),
(184, 2, '31.4392294', '73.085483', '2024-01-30 10:23:39'),
(185, 2, '31.4392281', '73.0854816', '2024-01-30 10:23:49'),
(186, 2, '31.4392048', '73.0854884', '2024-01-30 10:24:00'),
(187, 2, '31.441419', '73.0886326', '2024-01-31 01:07:48'),
(188, 2, '31.4414818', '73.0886694', '2024-01-31 01:07:58'),
(189, 2, '31.4415003', '73.0886477', '2024-01-31 01:08:08'),
(190, 2, '31.4415387', '73.0886694', '2024-01-31 01:08:18'),
(191, 2, '31.4416144', '73.088621', '2024-01-31 01:08:29'),
(192, 2, '31.4416556', '73.0888742', '2024-01-31 01:08:38'),
(193, 2, '31.441682', '73.0889065', '2024-01-31 01:08:48'),
(194, 2, '31.4416389', '73.0889181', '2024-01-31 01:08:58'),
(195, 1, '52.1683049', '4.4950108', '2024-02-02 06:00:49'),
(196, 1, '52.1681886', '4.4970625', '2024-02-02 06:00:58'),
(197, 1, '52.1680822', '4.4983305', '2024-02-02 06:01:08'),
(198, 1, '52.1680837', '4.4983054', '2024-02-02 06:01:19'),
(199, 1, '52.1680837', '4.4983054', '2024-02-02 06:01:28'),
(200, 1, '52.1680837', '4.4983054', '2024-02-02 06:01:31'),
(201, 1, '52.1680606', '4.4986887', '2024-02-02 06:01:38'),
(202, 1, '52.1680345', '4.4990449', '2024-02-02 06:01:41'),
(203, 1, '52.1679121', '4.5006917', '2024-02-02 06:01:48'),
(204, 1, '52.1679121', '4.5006917', '2024-02-02 06:01:51'),
(205, 1, '52.1677754', '4.5029155', '2024-02-02 06:01:59'),
(206, 1, '52.1677754', '4.5029155', '2024-02-02 06:02:01'),
(207, 1, '52.1676601', '4.5050182', '2024-02-02 06:02:08'),
(208, 1, '52.1676601', '4.5050182', '2024-02-02 06:02:11'),
(209, 1, '52.1677123', '4.5076608', '2024-02-02 06:02:21'),
(210, 1, '52.1677123', '4.5076608', '2024-02-02 06:02:21'),
(211, 1, '52.1680353', '4.5082612', '2024-02-02 06:02:30'),
(212, 1, '52.1680353', '4.5082612', '2024-02-02 06:02:32');

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

--
-- Dumping data for table `driver_vehicle`
--

INSERT INTO `driver_vehicle` (`dv_id`, `v_id`, `d_id`, `v_make`, `v_model`, `v_color`, `v_reg_num`, `v_phv`, `v_phv_expiry`, `v_ti`, `v_ti_expiry`, `v_mot`, `v_mot_expiry`, `date_v_add`) VALUES
(4, 4, 2, 'Suzuki', 'APV', 'White', 'LHE 3656', '1234567', '02-2025', '123456', '02-2025', '12345678', '02-2025', '2024-01-03 01:19:26'),
(5, 1, 1, 'Honda', 'City', 'Black', 'LHE 2812', '12345678', '2024-01-19', '123456', '2024-01-13', '123456', '2024-01-13', '2024-01-04 20:25:23'),
(6, 2, 0, 'Audi', 'A3', 'white', '493859559', '4956', '09/2024', '4969679', '09/2023', '496960660', '09/2023', '2024-01-28 14:11:59');

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

--
-- Dumping data for table `fares`
--

INSERT INTO `fares` (`fare_id`, `job_id`, `d_id`, `journey_fare`, `car_parking`, `waiting`, `tolls`, `extras`, `fare_status`, `apply_date`) VALUES
(2, 1, 1, 300, 20, 15, 15, 250, 'Corrected', '2024-01-04 20:26:25'),
(3, 4, 2, 5, 450, 800, 80, 50, 'Corrected', '2024-01-31 13:05:30'),
(4, 5, 2, 191, 0, 25, 50, 60, 'Pending', '2024-01-31 09:11:54');

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

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `job_id`, `c_id`, `d_id`, `journey_fare`, `car_parking`, `waiting`, `tolls`, `extra`, `total_pay`, `driver_commission`, `invoice_status`, `invoice_date`) VALUES
(00000003, 1, 1, 2, 250, 20, 0, 90, 50, '410', 82, 'unpaid', '2024-01-01 09:39:04'),
(00000004, 2, 1, 2, 250, 20, 0, 90, 50, '410', 82, 'unpaid', '2024-01-01 09:39:04'),
(00000005, 4, 3, 2, 5, 450, 800, 80, 50, '1385', 277, 'unpaid', '2024-02-08 01:06:01');

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

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `book_id`, `c_id`, `d_id`, `job_note`, `journey_fare`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `job_status`, `date_job_add`) VALUES
(00000001, 00000000001, 1, 2, '', 250, 30, 20, 0, 100, 0, 'Pending', '2024-01-01 09:39:04'),
(00000002, 00000000004, 2, 2, '', 250, 30, 20, 0, 100, 0, 'Completed', '2024-01-01 09:39:04'),
(00000004, 00000000013, 1, 2, '', 500, 30, 0, 0, 0, 0, 'Completed', '2024-01-31 01:06:01'),
(00000005, 00000000014, 3, 2, '', 191, 0, 0, 25, 50, 60, 'Waiting', '2024-01-31 19:57:03');

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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `sender_id`, `receiver_id`, `message`, `sent_at`) VALUES
(1, 1, 1, 'N/A', '2024-02-10 11:06:41'),
(2, 1, 2, 'hi', '2024-02-10 11:43:35'),
(3, 1, 2, 'hello', '2024-02-10 11:50:22'),
(4, 1, 1, 'hello', '2024-02-10 11:58:36'),
(5, 1, 2, 'hi', '2024-02-10 12:03:34');

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
(1, 1, 1, 3, 'N/A', '2024-01-18 07:55:05');

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
(1, 'Atiq', 'Ramzan', 'admin@prenero.com', 'b743c33627755c255938a992d3480cab', '+923157524000', 'Male', 'Owner', 'Faisalabad, Punjab, Pakistan', 'Faisalabad', 'Punjab', 134, 38000, '33102-1457353-9', '65c666e4956f1_1707501284.jpg', '2024-02-09 22:52:53'),
(3, 'Muhammad', 'Ismail', 'shaizy.ismail@gmail.com', '6266a', '+923346452312', 'Male', 'Acount Manager', 'N/A', 'Faisalabad', 'Punjab', 134, 38000, '3310214573539', '65c731a4dcc55_1707553188.jpg', '2024-02-10 13:19:48');

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
(1, 'Saloon', 4, 0, 0, 0, 50, 'toyota-prius.png', '2024-02-04 02:08:12'),
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
(1, 'Gatwick Airport', 'United Kingdom', 'Horley, Gatwick RH6 0NP', '50', '2023-12-26 17:01:37');

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
  MODIFY `bid_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `booking_type`
--
ALTER TABLE `booking_type`
  MODIFY `b_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `d_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `driver_acounts`
--
ALTER TABLE `driver_acounts`
  MODIFY `ac_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `dv_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fares`
--
ALTER TABLE `fares`
  MODIFY `fare_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `lang_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `rev_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `special_dates`
--
ALTER TABLE `special_dates`
  MODIFY `dt_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
