-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 07:21 AM
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
(1, 9, 1, '35', '2024-02-24 02:10:01');

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
(1, 2, 1, 0, '', '2024-02-21 00:40:23'),
(2, 2, 2, 0, '', '2024-02-21 00:47:56'),
(3, 2, 3, 0, '', '2024-02-21 08:26:26'),
(4, 2, 4, 0, '', '2024-02-21 22:39:40'),
(5, 2, 5, 0, '', '2024-02-21 22:58:30'),
(6, 2, 6, 0, '', '2024-02-21 23:05:49'),
(7, 2, 7, 0, '', '2024-02-22 00:54:22'),
(8, 2, 8, 50, '', '2024-02-22 00:55:51'),
(9, 2, 9, 25, '', '2024-02-22 13:25:54'),
(10, 3, 10, 0, '', '2024-02-24 14:12:57'),
(11, 2, 11, 50, '', '2024-02-24 21:08:02'),
(12, 1, 12, 25, '', '2024-02-25 11:53:34'),
(13, 1, 16, 25, '', '2024-02-25 19:03:18'),
(14, 3, 17, 0, '', '2024-02-25 19:26:45'),
(15, 3, 18, 0, '', '2024-02-25 19:27:08'),
(16, 3, 19, 0, '', '2024-02-25 19:29:28'),
(17, 3, 20, 20, '', '2024-02-25 19:31:43'),
(18, 3, 21, 20, '', '2024-02-25 19:39:03'),
(19, 3, 22, 20, '', '2024-02-25 19:41:56'),
(20, 3, 23, 20, '', '2024-02-25 19:46:36'),
(21, 3, 24, 0, '', '2024-02-26 00:28:24');

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
(00000000001, 3, 2, 'Horley, Gatwick RH6 0NP', '', 'Longford TW6, UK', '', '', 0, '0000-00-00', '00:00:00', '', 0, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '2024-02-25 07:33:18'),
(00000000002, 3, 2, 'Eastwoodbury Cres, Southend-on-Sea SS2 6YF', '', 'Woolsington, Newcastle upon Tyne NE13 8BZ', '', '', 4, '2024-02-21', '00:47:29', '', 2, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-21 00:47:56'),
(00000000003, 3, 2, 'Horley, Gatwick RH6 0NP', '', 'Manchester M90 1QX', '', '', 4, '2024-02-21', '08:26:08', '', 1, '', '', '', '00:00:00', '', 0, 367, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-21 08:26:26'),
(00000000004, 3, 2, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore, Pakistan', '', '', 4, '2024-02-21', '00:00:00', '', 1, '', '', '', '00:00:00', '', 920, 184, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-21 22:39:40'),
(00000000005, 3, 2, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore-Islamabad Motorway, Sabzazar Block E Sabzazar Housing Scheme Phase 1 & 2 Lahore, Pakistan', '', '', 4, '2024-02-21', '22:53:47', '', 1, '', '', '', '00:00:00', '', 950, 190, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 15:38:09'),
(00000000006, 3, 2, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore City, Pakistan', '', '', 4, '2024-02-21', '11:02:00', '', 2, '', '', '', '00:00:00', '', 930, 186, 0, 0, 0, 0, 0, 'Booked', 0, '', '2024-02-22 18:04:29'),
(00000000007, 3, 2, 'Horley, Gatwick RH6 0NP', '', 'Manchester M90 1QX', '', '', 4, '2024-02-22', '12:53:00', '', 1, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-22 00:54:22'),
(00000000008, 3, 2, 'Horley, Gatwick RH6 0NP', '', 'Birmingham B26 3QJ', '', '', 4, '2024-02-22', '12:55:00', '', 2, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-22 00:55:51'),
(00000000009, 3, 2, 'Sargodha Road, Faisalabad, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-02-22', '01:25:00', '', 2, '', '', '', '00:00:00', '', 0, 6, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-22 13:25:54'),
(00000000010, 3, 3, 'Horley, Gatwick RH6 0NP', '', 'Longford TW6, UK', '', '', 4, '2024-02-24', '09:13:00', '', 2, '', '', '', '00:00:00', '', 325, 65, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-24 14:12:57'),
(00000000011, 3, 2, 'Longford TW6, UK', '', 'Manchester M90 1QX', '', '', 7, '2024-02-24', '09:07:00', '', 6, '', '', '', '00:00:00', '', 1545, 309, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-24 21:08:02'),
(00000000012, 3, 1, 'Jail Road', '', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 2, '', '', '', '00:00:00', '', 500, 25, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 11:53:34'),
(00000000013, 1, 1, 'Stansted Airport, Stansted, UK', '', 'London W2, UK', '', '', 1, '2024-02-25', '10:30:00', 'Return', 2, '1', 'Yes', 'Yrbv', '00:00:30', 'Meet inside', 1040, 69, 2, 3, 4, 5, 6, 'Pending', 1, '', '2024-02-25 15:54:32'),
(00000000014, 1, 1, 'Sunderland SR5, UK', '', 'Gf Wdn Fl Farnol House, Upperton Road, Eastbourne, UK', '', '', 2, '2024-02-03', '10:58:00', 'Return', 6, '1', '', '', '00:00:00', '', 8280, 552, 0, 0, 0, 0, 0, 'Booked', 0, '', '2024-02-25 15:56:28'),
(00000000015, 2, 1, 'Winchester, UK', '', 'Fort William, UK', '', '', 2, '2024-02-26', '11:12:00', 'Return', 3, '', 'Yes', '', '00:00:00', '', 12555, 837, 2, 0, 0, 0, 0, 'Booked', 0, '', '2024-02-25 16:13:38'),
(00000000016, 3, 1, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 2, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 19:03:18'),
(00000000017, 3, 3, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:26:00', '', 3, '2', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 19:26:45'),
(00000000018, 3, 3, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:26:00', '', 3, '2', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 19:27:08'),
(00000000019, 3, 3, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:28:00', '', 1, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 19:29:28'),
(00000000020, 3, 3, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:31:00', '', 1, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 19:31:43'),
(00000000021, 3, 3, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:38:00', '', 1, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 'Pending', 0, '', '2024-02-25 19:39:03'),
(00000000022, 3, 3, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore, Pakistan', '', '', 5, '2024-02-25', '07:41:00', '', 4, '4', '', '', '00:00:00', ' ', 915, 183, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '2024-02-25 07:42:49'),
(00000000023, 3, 3, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Horley, Gatwick RH6 0NP', '', '', 4, '2024-02-25', '07:45:00', '', 1, '1', '', '', '00:00:00', ' ', 0, 8, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '2024-02-25 07:47:19'),
(00000000024, 3, 3, 'Horley, Gatwick RH6 0NP', ' ', 'Manchester M90 1QX', '', '', 4, '2024-02-26', '12:28:00', '', 2, '1', '', '', '00:00:00', ' ', 0, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '', '2024-02-26 12:29:43');

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
-- Table structure for table `cancelled_bookings`
--

CREATE TABLE `cancelled_bookings` (
  `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `cancel_reason` text NOT NULL,
  `date_cancelled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cancelled_bookings`
--

INSERT INTO `cancelled_bookings` (`cb_id`, `book_id`, `cancel_reason`, `date_cancelled`) VALUES
(00000002, 00000001, 'Desigred vehicle not available', '2024-02-25 06:39:14'),
(00000003, 00000023, 'no neeed', '2024-02-25 07:47:19'),
(00000004, 00000024, 'i change my mind', '2024-02-26 12:28:54'),
(00000005, 00000024, 'i change my mind', '2024-02-26 12:29:43');

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
(1, 'Azib Ali Butt', 'eurodatatech@gmail.com', '+447552834179', 'asdf1234', '', 'Male', 'English', '65d4808f69592_1708425359.png', 'WJ123', '', '', 0, '', '', 0, 0, 1, 1, '2024-02-20 15:36:10'),
(2, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'asdf1234', ',bj g vgvygc vycyc uxcxctrxd rdcxrx dddtrxtrxtxcxccxexetx', 'Male', 'Portuguese', '', '38000bj ', '', '', 0, '', '2', 0, 20, 1, 2, '2024-02-21 02:16:13'),
(3, 'Atiq Ramazan', 'Prenero@gmail.com', '+447500000000', 'asdf1234', '', '', '', '', '', '', '', 0, '', '', 0, 0, 0, 2, '2024-02-26 13:10:18');

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
-- Table structure for table `customers_address`
--

CREATE TABLE `customers_address` (
  `ca_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) NOT NULL,
  `address` text NOT NULL,
  `date_add_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_address`
--

INSERT INTO `customers_address` (`ca_id`, `c_id`, `address`, `date_add_added`) VALUES
(00000001, 1, 'Jail Road Faisalabad.', '2024-02-27 09:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `delete_customers`
--

CREATE TABLE `delete_customers` (
  `del_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `request_msg` text NOT NULL,
  `delete_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `driver_reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `latitude`, `longitude`, `status`, `acount_status`, `driver_reg_date`) VALUES
(00000001, 'Azib Ali', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', 'london uk new#485 new uk', '', '../../img/drivers/1000046675.jpg', 'Male', 'English', 'London', '31.4414005', '73.0886402', 'Reached on Dropoff', 1, '2024-03-11 05:41:20'),
(00000002, '', 'prenero12@gmail.com', '+923346452312', 'asdf1234', '', '', '', '', '', 'London', '', '', '', 0, '2024-03-11 01:36:13'),
(00000003, 'Azib Ali', 'eurodatatechnology@gmail.com', '+923346523621', '6266a', 'FSD', 'WJ123', '../../img/drivers/background.jpg', 'Male', 'English', 'London', '', '', '', 0, '2024-03-11 16:11:03');

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
  `date_upload_document` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_documents`
--

INSERT INTO `driver_documents` (`dd_id`, `d_id`, `d_license_front`, `d_license_back`, `pco_license`, `address_proof_1`, `address_proof_2`, `dvla_check_code`, `national_insurance`, `extra`, `date_upload_document`) VALUES
(00000001, 00000001, '65f1be9caaf41.jpg', '65f211694b1e4.jpg', '', '', '', '', '', '', '2024-03-11 01:37:53');

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
(1, 1, '31.4414085', '73.0886461', '2024-02-22 06:03:53'),
(2, 1, '31.4414085', '73.0886483', '2024-02-22 06:04:02'),
(3, 1, '31.4414028', '73.0886492', '2024-02-22 06:04:12'),
(4, 1, '31.4414081', '73.0886469', '2024-02-22 06:04:22'),
(5, 1, '31.4414078', '73.0886461', '2024-02-22 06:04:35'),
(6, 1, '31.4414094', '73.0886476', '2024-02-22 06:04:43'),
(7, 1, '31.4414095', '73.0886476', '2024-02-22 06:04:52'),
(8, 1, '31.4414042', '73.0886516', '2024-02-22 06:05:02'),
(9, 1, '31.4414095', '73.0886475', '2024-02-22 06:05:14'),
(10, 1, '31.4414081', '73.0886481', '2024-02-22 06:05:22'),
(11, 1, '31.4414091', '73.0886474', '2024-02-22 06:05:32'),
(12, 1, '31.4413987', '73.0886432', '2024-02-22 06:05:43'),
(13, 1, '31.441409', '73.0886461', '2024-02-22 06:05:54'),
(14, 1, '31.4414039', '73.0886422', '2024-02-22 06:06:03'),
(15, 1, '31.4414029', '73.0886425', '2024-02-22 06:06:12'),
(16, 1, '31.4414004', '73.088649', '2024-02-22 06:06:22'),
(17, 1, '31.4414011', '73.0886421', '2024-02-22 06:06:32'),
(18, 1, '31.4413994', '73.088642', '2024-02-22 06:06:43'),
(19, 1, '31.4414022', '73.0886496', '2024-02-22 06:06:58'),
(20, 1, '31.4414023', '73.0886496', '2024-02-22 06:07:05'),
(21, 1, '31.4414093', '73.0886473', '2024-02-22 06:07:13'),
(22, 1, '31.441409', '73.0886461', '2024-02-22 06:07:23'),
(23, 1, '31.4414091', '73.0886473', '2024-02-22 06:07:32'),
(24, 1, '31.4414005', '73.0886424', '2024-02-22 06:07:43'),
(25, 1, '31.4413978', '73.0886455', '2024-02-22 06:07:53'),
(26, 1, '31.4414008', '73.0886411', '2024-02-22 06:08:02'),
(27, 1, '31.4414077', '73.0886462', '2024-02-22 06:08:12'),
(28, 1, '31.441403', '73.0886493', '2024-02-22 06:08:22'),
(29, 1, '31.441401', '73.0886415', '2024-02-22 06:08:33'),
(30, 1, '31.441401', '73.088642', '2024-02-22 06:08:42'),
(31, 1, '31.4414011', '73.0886414', '2024-02-22 06:08:52'),
(32, 1, '31.4414087', '73.0886469', '2024-02-22 06:09:04'),
(33, 1, '31.4414031', '73.0886489', '2024-02-22 06:09:12'),
(34, 1, '31.441401', '73.0886407', '2024-02-22 06:09:25'),
(35, 1, '31.4414031', '73.088649', '2024-02-22 06:09:32'),
(36, 1, '31.4414034', '73.0886491', '2024-02-22 06:09:42'),
(37, 1, '31.441401', '73.0886445', '2024-02-22 06:09:52'),
(38, 1, '31.4414048', '73.0886483', '2024-02-22 06:10:03'),
(39, 1, '31.441409', '73.0886512', '2024-02-22 06:10:12'),
(40, 1, '31.4413997', '73.088647', '2024-02-22 06:10:22'),
(41, 1, '31.4414005', '73.0886454', '2024-02-22 06:10:32'),
(42, 1, '31.4414034', '73.0886485', '2024-02-22 06:10:43'),
(43, 1, '31.4414034', '73.0886487', '2024-02-22 06:10:52'),
(44, 1, '31.4414034', '73.0886482', '2024-02-22 06:11:03'),
(45, 1, '31.4414005', '73.0886476', '2024-02-22 06:11:12'),
(46, 1, '31.4414034', '73.0886484', '2024-02-22 06:11:22'),
(47, 1, '31.4414012', '73.0886457', '2024-02-22 06:11:32'),
(48, 1, '31.4414034', '73.0886485', '2024-02-22 06:11:42'),
(49, 1, '31.4414007', '73.0886462', '2024-02-22 06:11:52'),
(50, 1, '31.4414017', '73.0886463', '2024-02-22 06:12:03'),
(51, 1, '31.4414012', '73.0886462', '2024-02-22 06:12:13'),
(52, 1, '31.4414', '73.0886471', '2024-02-22 06:12:22'),
(53, 1, '31.4414035', '73.0886485', '2024-02-22 06:12:33'),
(54, 1, '31.4414009', '73.0886456', '2024-02-22 06:12:43'),
(55, 1, '31.4414033', '73.0886486', '2024-02-22 06:12:55'),
(56, 1, '31.4414034', '73.0886482', '2024-02-22 06:13:03'),
(57, 1, '31.4413999', '73.0886484', '2024-02-22 06:13:12'),
(58, 1, '31.4414039', '73.0886476', '2024-02-22 06:13:22'),
(59, 1, '31.4414034', '73.088648', '2024-02-22 06:13:34'),
(60, 1, '31.4414033', '73.0886484', '2024-02-22 06:13:42'),
(61, 1, '31.4414034', '73.0886483', '2024-02-22 06:13:53'),
(62, 1, '31.4414034', '73.0886486', '2024-02-22 06:14:02'),
(63, 1, '31.4414034', '73.0886483', '2024-02-22 06:14:12'),
(64, 1, '31.4414034', '73.0886485', '2024-02-22 06:14:22'),
(65, 1, '31.4414009', '73.0886444', '2024-02-22 06:14:32'),
(66, 1, '31.4414018', '73.088647', '2024-02-22 06:14:44'),
(67, 1, '31.4414083', '73.0886466', '2024-02-22 06:14:52'),
(68, 1, '31.4414034', '73.0886489', '2024-02-22 06:15:05'),
(69, 1, '31.4414032', '73.088649', '2024-02-22 06:15:13'),
(70, 1, '31.4414034', '73.0886487', '2024-02-22 06:15:23'),
(71, 1, '31.4414034', '73.0886491', '2024-02-22 06:15:33'),
(72, 1, '31.4414032', '73.0886489', '2024-02-22 06:15:42'),
(73, 1, '31.4414033', '73.0886487', '2024-02-22 06:15:53'),
(74, 1, '31.4414033', '73.0886485', '2024-02-22 06:16:02'),
(75, 1, '31.4414011', '73.088649', '2024-02-22 06:16:12'),
(76, 1, '31.4414034', '73.0886487', '2024-02-22 06:16:22'),
(77, 1, '31.4414008', '73.0886488', '2024-02-22 06:16:32'),
(78, 1, '31.4414011', '73.0886428', '2024-02-22 06:16:42'),
(79, 1, '31.4414034', '73.0886483', '2024-02-22 06:16:53'),
(80, 1, '31.4414034', '73.0886486', '2024-02-22 06:17:02'),
(81, 1, '31.4414087', '73.0886483', '2024-02-22 06:17:13'),
(82, 1, '31.4414033', '73.0886487', '2024-02-22 06:17:24'),
(83, 1, '31.4414072', '73.0886471', '2024-02-22 06:17:32'),
(84, 1, '31.4414009', '73.0886437', '2024-02-22 06:17:43'),
(85, 1, '31.4414034', '73.0886492', '2024-02-22 06:18:05'),
(86, 1, '31.4414005', '73.0886439', '2024-02-22 06:18:23'),
(87, 1, '31.4414033', '73.0886489', '2024-02-22 06:18:35'),
(88, 1, '31.4414036', '73.0886486', '2024-02-22 06:18:44'),
(89, 1, '31.4414036', '73.0886486', '2024-02-22 06:18:47'),
(90, 1, '31.4414033', '73.0886488', '2024-02-22 06:18:51'),
(91, 1, '31.4414034', '73.0886489', '2024-02-22 06:19:03'),
(92, 1, '31.4414009', '73.0886443', '2024-02-22 06:19:10'),
(93, 1, '31.441401', '73.0886436', '2024-02-22 06:19:17'),
(94, 1, '31.4414009', '73.0886445', '2024-02-22 06:19:31'),
(95, 1, '31.441401', '73.0886452', '2024-02-22 06:19:38'),
(96, 1, '31.441401', '73.0886451', '2024-02-22 06:19:44'),
(97, 1, '31.4414034', '73.0886488', '2024-02-22 06:19:53'),
(98, 1, '31.4414033', '73.0886485', '2024-02-22 06:20:03'),
(99, 1, '31.4414005', '73.0886454', '2024-02-22 06:20:12'),
(100, 1, '31.4414064', '73.0886484', '2024-02-22 06:20:23'),
(101, 1, '31.4414077', '73.0886488', '2024-02-22 06:20:36'),
(102, 1, '31.4414032', '73.0886488', '2024-02-22 06:20:44'),
(103, 1, '31.441401', '73.0886435', '2024-02-22 06:20:52'),
(104, 1, '31.4414034', '73.0886491', '2024-02-22 06:21:02'),
(105, 1, '31.4414036', '73.088649', '2024-02-22 06:21:13'),
(106, 1, '31.4414006', '73.0886443', '2024-02-22 06:21:30'),
(107, 1, '31.4414034', '73.0886491', '2024-02-22 06:21:52'),
(108, 1, '31.4414008', '73.0886453', '2024-02-22 06:21:58'),
(109, 1, '31.4414009', '73.0886457', '2024-02-22 06:22:01'),
(110, 1, '31.4414058', '73.0886477', '2024-02-22 06:22:06'),
(111, 1, '31.4414034', '73.0886487', '2024-02-22 06:22:15'),
(112, 1, '31.4414034', '73.0886485', '2024-02-22 06:22:23'),
(113, 1, '31.4414009', '73.0886452', '2024-02-22 06:22:36'),
(114, 1, '31.4414034', '73.088648', '2024-02-22 06:22:45'),
(115, 1, '31.4414034', '73.0886489', '2024-02-22 06:22:54'),
(116, 1, '31.4414033', '73.0886487', '2024-02-22 06:23:04'),
(117, 1, '31.4414034', '73.088649', '2024-02-22 06:23:16'),
(118, 1, '31.4414033', '73.0886478', '2024-02-22 06:23:28'),
(119, 1, '31.4414034', '73.0886489', '2024-02-22 06:23:35'),
(120, 1, '31.4414011', '73.0886424', '2024-02-22 06:23:44'),
(121, 1, '31.4414003', '73.0886463', '2024-02-22 06:23:54'),
(122, 1, '31.4414011', '73.0886418', '2024-02-22 06:24:05'),
(123, 1, '31.4414034', '73.0886492', '2024-02-22 06:24:16'),
(124, 1, '31.4414014', '73.0886417', '2024-02-22 06:24:25'),
(125, 1, '31.4414033', '73.0886493', '2024-02-22 06:24:36'),
(126, 1, '31.4414033', '73.0886492', '2024-02-22 06:24:49'),
(127, 1, '31.4414034', '73.0886491', '2024-02-22 06:24:56'),
(128, 1, '31.4414034', '73.0886483', '2024-02-22 06:25:06'),
(129, 1, '31.441401', '73.0886436', '2024-02-22 06:25:33'),
(130, 1, '31.4414015', '73.0886415', '2024-02-22 06:25:33'),
(131, 1, '31.4414012', '73.0886442', '2024-02-22 06:25:37'),
(132, 1, '31.4414034', '73.0886482', '2024-02-22 06:25:47'),
(133, 1, '31.4414048', '73.0886496', '2024-02-22 06:26:05'),
(134, 1, '31.4414009', '73.088643', '2024-02-22 06:26:08'),
(135, 1, '31.4414037', '73.0886425', '2024-02-22 06:26:15'),
(136, 1, '31.4414011', '73.0886442', '2024-02-22 06:26:24'),
(137, 1, '31.4414082', '73.088647', '2024-02-22 06:26:35'),
(138, 1, '31.4414086', '73.0886469', '2024-02-22 06:26:47'),
(139, 1, '31.4414006', '73.088646', '2024-02-22 06:26:57'),
(140, 1, '31.441419', '73.0886442', '2024-02-22 06:27:05'),
(141, 1, '31.4414017', '73.088646', '2024-02-22 06:27:23'),
(142, 1, '31.4414017', '73.0886461', '2024-02-22 06:27:28'),
(143, 1, '31.4414035', '73.0886489', '2024-02-22 06:27:35'),
(144, 1, '31.4367107', '73.0894414', '2024-02-23 12:09:02'),
(145, 1, '31.4367077', '73.0894462', '2024-02-23 12:09:12'),
(146, 1, '31.4367108', '73.0894376', '2024-02-23 12:09:23'),
(147, 1, '31.4367114', '73.0894357', '2024-02-23 12:09:32'),
(148, 1, '31.4366978', '73.0894632', '2024-02-23 12:09:43'),
(149, 1, '31.436711', '73.0894402', '2024-02-23 12:09:52'),
(150, 1, '31.4367049', '73.0894546', '2024-02-23 12:10:02'),
(151, 1, '31.4367055', '73.0894556', '2024-02-23 12:10:12'),
(152, 1, '31.4367124', '73.0894471', '2024-02-23 12:10:22'),
(153, 1, '31.4367064', '73.0894536', '2024-02-23 12:10:32'),
(154, 1, '31.4367075', '73.0894507', '2024-02-23 12:10:42'),
(155, 1, '31.4367061', '73.0894537', '2024-02-23 12:10:54'),
(156, 1, '31.436705', '73.0894524', '2024-02-23 12:11:02'),
(157, 1, '31.4367075', '73.0894406', '2024-02-23 12:11:12'),
(158, 1, '31.4367101', '73.0894417', '2024-02-23 12:11:22'),
(159, 1, '31.4367049', '73.0894561', '2024-02-23 12:11:34'),
(160, 1, '31.4365943', '73.0895724', '2024-02-23 12:11:44'),
(161, 1, '31.4365873', '73.0895823', '2024-02-23 12:11:55'),
(162, 1, '31.4367059', '73.0894512', '2024-02-23 12:12:04'),
(163, 1, '31.4367101', '73.0894417', '2024-02-23 12:12:12'),
(164, 1, '31.4367126', '73.0894355', '2024-02-23 12:12:22'),
(165, 1, '31.4367028', '73.0894551', '2024-02-23 12:12:33'),
(166, 1, '31.4367027', '73.0894519', '2024-02-23 12:12:42'),
(167, 1, '31.4365967', '73.0895734', '2024-02-23 12:12:52'),
(168, 1, '31.4367049', '73.0894538', '2024-02-23 12:13:02'),
(169, 1, '31.4366766', '73.0894796', '2024-02-23 12:13:12'),
(170, 1, '31.4367057', '73.0894543', '2024-02-23 12:13:22'),
(171, 1, '31.4367111', '73.0894468', '2024-02-23 12:13:32'),
(172, 1, '31.4367083', '73.0894424', '2024-02-23 12:13:42'),
(173, 1, '31.436708', '73.0894504', '2024-02-23 12:13:52'),
(174, 1, '31.4367129', '73.089442', '2024-02-23 12:14:02'),
(175, 1, '31.4367008', '73.0894599', '2024-02-23 12:14:12'),
(176, 1, '31.4367079', '73.089453', '2024-02-23 12:14:23'),
(177, 1, '31.4367087', '73.0894463', '2024-02-23 12:14:33'),
(178, 1, '31.4367059', '73.0894501', '2024-02-23 12:14:43'),
(179, 1, '31.4367073', '73.0894492', '2024-02-23 12:14:53'),
(180, 1, '31.4367067', '73.0894427', '2024-02-23 12:15:03'),
(181, 1, '31.4367116', '73.0894399', '2024-02-23 12:15:12'),
(182, 1, '31.4367065', '73.0894503', '2024-02-23 12:15:22'),
(183, 1, '31.4367063', '73.0894512', '2024-02-23 12:15:33'),
(184, 1, '31.4367105', '73.0894471', '2024-02-23 12:15:42'),
(185, 1, '31.4366116', '73.0895587', '2024-02-23 12:15:52'),
(186, 1, '31.4367062', '73.0894519', '2024-02-23 12:16:07'),
(187, 1, '31.4366875', '73.0894679', '2024-02-23 12:16:13'),
(188, 1, '31.4367034', '73.0894548', '2024-02-23 12:16:22'),
(189, 1, '31.4367048', '73.0894523', '2024-02-23 12:16:33'),
(190, 1, '31.4367016', '73.0894563', '2024-02-23 12:16:42'),
(191, 1, '31.4367033', '73.089457', '2024-02-23 12:16:53'),
(192, 1, '31.4367066', '73.0894507', '2024-02-23 12:17:02'),
(193, 1, '31.4367061', '73.0894505', '2024-02-23 12:17:13'),
(194, 1, '31.4366961', '73.0894611', '2024-02-23 12:17:22'),
(195, 1, '31.4367076', '73.0894519', '2024-02-23 12:17:32'),
(196, 1, '31.4367055', '73.089455', '2024-02-23 12:17:42'),
(197, 1, '31.4367085', '73.0894479', '2024-02-23 12:17:52'),
(198, 1, '31.4367018', '73.0894582', '2024-02-23 12:18:02'),
(199, 1, '31.4367028', '73.089455', '2024-02-23 12:18:13'),
(200, 1, '31.4367039', '73.0894537', '2024-02-23 12:18:22'),
(201, 1, '31.4367078', '73.0894537', '2024-02-23 12:18:32'),
(202, 1, '31.4367093', '73.0894505', '2024-02-23 12:18:42'),
(203, 1, '31.4367076', '73.089449', '2024-02-23 12:18:52'),
(204, 1, '31.4367073', '73.0894491', '2024-02-23 12:19:02'),
(205, 1, '31.4367064', '73.0894513', '2024-02-23 12:19:13'),
(206, 1, '31.4367048', '73.0894566', '2024-02-23 12:19:24'),
(207, 1, '31.4367033', '73.0894598', '2024-02-23 12:19:32'),
(208, 1, '31.4367074', '73.0894498', '2024-02-23 12:19:46'),
(209, 1, '31.4367109', '73.0894499', '2024-02-23 12:19:52'),
(210, 1, '31.4366972', '73.0894667', '2024-02-23 12:20:02'),
(211, 1, '31.436708', '73.0894488', '2024-02-23 12:20:12'),
(212, 1, '31.4365956', '73.0895711', '2024-02-23 12:20:26'),
(213, 1, '31.4367104', '73.08945', '2024-02-23 12:20:33'),
(214, 1, '31.4367123', '73.0894375', '2024-02-23 12:20:42'),
(215, 1, '31.4367052', '73.0894542', '2024-02-23 12:20:52'),
(216, 1, '31.4367082', '73.0894535', '2024-02-23 12:21:02'),
(217, 1, '31.4367061', '73.0894523', '2024-02-23 12:21:13'),
(218, 1, '31.4367104', '73.0894405', '2024-02-23 12:21:22'),
(219, 1, '31.4367023', '73.0894563', '2024-02-23 12:21:32'),
(220, 1, '31.4367078', '73.08945', '2024-02-23 12:21:42'),
(221, 1, '31.436705', '73.0894544', '2024-02-23 12:21:54'),
(222, 1, '31.4366977', '73.0894613', '2024-02-23 12:22:02'),
(223, 1, '31.4367023', '73.0894566', '2024-02-23 12:22:12'),
(224, 1, '31.4367067', '73.089451', '2024-02-23 12:22:22'),
(225, 1, '31.4367132', '73.0894446', '2024-02-23 12:22:32'),
(226, 1, '31.4366984', '73.0894613', '2024-02-23 12:22:42'),
(227, 1, '31.4367064', '73.0894518', '2024-02-23 12:22:53'),
(228, 1, '31.4367003', '73.0894589', '2024-02-23 12:23:02'),
(229, 1, '31.4367041', '73.089455', '2024-02-23 12:23:15'),
(230, 1, '31.436605', '73.0895602', '2024-02-23 12:23:23'),
(231, 1, '31.4366993', '73.0894602', '2024-02-23 12:23:32'),
(232, 1, '31.4367089', '73.0894481', '2024-02-23 12:23:42'),
(233, 1, '31.436692', '73.0894659', '2024-02-23 12:23:52'),
(234, 1, '31.4366987', '73.0894598', '2024-02-23 12:24:02'),
(235, 1, '31.4367039', '73.0894497', '2024-02-23 12:24:12'),
(236, 1, '31.4367068', '73.0894403', '2024-02-23 12:24:22'),
(237, 1, '31.4367042', '73.0894569', '2024-02-23 12:24:34'),
(238, 1, '31.4367048', '73.0894541', '2024-02-23 12:24:42'),
(239, 1, '31.436699', '73.0894614', '2024-02-23 12:24:52'),
(240, 1, '31.4367122', '73.0894422', '2024-02-23 12:25:02'),
(241, 1, '31.4367022', '73.0894567', '2024-02-23 12:25:13'),
(242, 1, '31.4367156', '73.0894478', '2024-02-23 12:25:22'),
(243, 1, '31.4367084', '73.0894491', '2024-02-23 12:25:32'),
(244, 1, '31.4367067', '73.0894513', '2024-02-23 12:25:45'),
(245, 1, '31.4367001', '73.0894638', '2024-02-23 12:25:52'),
(246, 1, '31.4367115', '73.0894396', '2024-02-23 12:26:02'),
(247, 1, '31.4367091', '73.0894498', '2024-02-23 12:26:12'),
(248, 1, '31.4367086', '73.0894475', '2024-02-23 12:26:24'),
(249, 1, '31.436709', '73.0894406', '2024-02-23 12:26:33'),
(250, 1, '31.4367129', '73.089446', '2024-02-23 12:26:42'),
(251, 1, '31.4367034', '73.0894558', '2024-02-23 12:26:52'),
(252, 1, '31.43671', '73.0894478', '2024-02-23 12:27:02'),
(253, 1, '31.4366217', '73.0895489', '2024-02-23 12:27:12'),
(254, 1, '31.4366906', '73.0894688', '2024-02-23 12:27:22'),
(255, 1, '31.4367047', '73.0894544', '2024-02-23 12:27:32'),
(256, 1, '31.436713', '73.0894461', '2024-02-23 12:27:42'),
(257, 1, '31.4367174', '73.0894403', '2024-02-23 12:27:53'),
(258, 1, '31.4367078', '73.0894517', '2024-02-23 12:28:02'),
(259, 1, '31.4367171', '73.0894443', '2024-02-23 12:28:12'),
(260, 1, '31.4367098', '73.0894428', '2024-02-23 12:28:22'),
(261, 1, '31.4367132', '73.0894449', '2024-02-23 12:28:32'),
(262, 1, '31.4367148', '73.0894428', '2024-02-23 12:28:42'),
(263, 1, '31.4367079', '73.0894512', '2024-02-23 12:28:52'),
(264, 1, '31.4367034', '73.0894567', '2024-02-23 12:29:02'),
(265, 1, '31.4365965', '73.0895751', '2024-02-23 12:29:13'),
(266, 1, '31.4367022', '73.0894597', '2024-02-23 12:29:22'),
(267, 1, '31.4367055', '73.089457', '2024-02-23 12:29:34'),
(268, 1, '31.4367059', '73.0894531', '2024-02-23 12:29:42'),
(269, 1, '31.4367117', '73.0894486', '2024-02-23 12:29:53'),
(270, 1, '31.4367079', '73.089452', '2024-02-23 12:30:04'),
(271, 1, '31.436711', '73.0894473', '2024-02-23 12:30:12'),
(272, 1, '31.4367099', '73.0894418', '2024-02-23 12:30:22'),
(273, 1, '31.4367101', '73.0894475', '2024-02-23 12:30:32'),
(274, 1, '31.4367023', '73.0894574', '2024-02-23 12:30:43'),
(275, 1, '31.4367072', '73.0894515', '2024-02-23 12:30:53'),
(276, 1, '31.4367056', '73.0894539', '2024-02-23 12:31:03'),
(277, 1, '31.4367105', '73.0894485', '2024-02-23 12:31:12'),
(278, 1, '31.4367058', '73.0894535', '2024-02-23 12:31:22'),
(279, 1, '31.4367099', '73.0894448', '2024-02-23 12:31:32'),
(280, 1, '31.4366985', '73.0894637', '2024-02-23 12:31:42'),
(281, 1, '31.4367', '73.0894611', '2024-02-23 12:31:52'),
(282, 1, '31.4367003', '73.0894588', '2024-02-23 12:32:05'),
(283, 1, '31.4367078', '73.0894495', '2024-02-23 12:32:12'),
(284, 1, '31.4367067', '73.0894509', '2024-02-23 12:32:22'),
(285, 1, '31.4367087', '73.0894472', '2024-02-23 12:32:34'),
(286, 1, '31.436711', '73.0894401', '2024-02-23 12:32:42'),
(287, 1, '31.4367065', '73.0894522', '2024-02-23 12:32:52'),
(288, 1, '31.4367062', '73.0894541', '2024-02-23 12:33:02'),
(289, 1, '31.4367065', '73.0894509', '2024-02-23 12:33:12'),
(290, 1, '31.4367067', '73.089453', '2024-02-23 12:33:22'),
(291, 1, '31.4367036', '73.089454', '2024-02-23 12:33:32'),
(292, 1, '31.4367038', '73.089454', '2024-02-23 12:33:44'),
(293, 1, '31.4367064', '73.0894533', '2024-02-23 12:33:52'),
(294, 1, '31.4367027', '73.0894583', '2024-02-23 12:34:02'),
(295, 1, '31.4367062', '73.0894548', '2024-02-23 12:34:12'),
(296, 1, '31.4367078', '73.0894441', '2024-02-23 12:34:22'),
(297, 1, '31.4365971', '73.0895751', '2024-02-23 12:34:32'),
(298, 1, '31.4367063', '73.0894509', '2024-02-23 12:34:42'),
(299, 1, '31.4367077', '73.0894539', '2024-02-23 12:34:55'),
(300, 1, '31.4367098', '73.0894495', '2024-02-23 12:35:06'),
(301, 1, '31.4367084', '73.089449', '2024-02-23 12:35:16'),
(302, 1, '31.4365852', '73.0895848', '2024-02-23 12:35:27'),
(303, 1, '31.4367013', '73.0894557', '2024-02-23 12:35:38'),
(304, 1, '31.4367013', '73.0894557', '2024-02-23 12:35:42'),
(305, 1, '31.4367021', '73.0894559', '2024-02-23 12:35:53'),
(306, 1, '31.4367127', '73.089445', '2024-02-23 12:36:04'),
(307, 1, '31.4365824', '73.0895908', '2024-02-23 12:36:14'),
(308, 1, '31.4367013', '73.0894596', '2024-02-23 12:36:25'),
(309, 1, '31.4367046', '73.0894528', '2024-02-23 12:36:36'),
(310, 1, '31.4365759', '73.0896004', '2024-02-23 12:36:46'),
(311, 1, '31.4367001', '73.0894579', '2024-02-23 12:36:57'),
(312, 1, '31.4367001', '73.0894579', '2024-02-23 12:37:02'),
(313, 1, '31.4367049', '73.0894535', '2024-02-23 12:37:13'),
(314, 1, '31.4367044', '73.0894543', '2024-02-23 12:37:24'),
(315, 1, '31.4366965', '73.0894652', '2024-02-23 12:37:34'),
(316, 1, '31.4367053', '73.0894544', '2024-02-23 12:37:46'),
(317, 1, '31.4366787', '73.0894787', '2024-02-23 12:37:56'),
(318, 1, '31.4367058', '73.0894517', '2024-02-23 12:38:07'),
(319, 1, '31.4367128', '73.0894376', '2024-02-23 12:38:19'),
(320, 1, '31.4367128', '73.0894376', '2024-02-23 12:38:22'),
(321, 1, '31.4365944', '73.0895727', '2024-02-23 12:38:33'),
(322, 1, '31.4367138', '73.0894456', '2024-02-23 12:38:42'),
(323, 1, '31.4367128', '73.0894483', '2024-02-23 12:38:52'),
(324, 1, '31.4365919', '73.0895776', '2024-02-23 12:39:02'),
(325, 1, '31.4366821', '73.0894754', '2024-02-23 12:39:12'),
(326, 1, '31.4366963', '73.0894627', '2024-02-23 12:39:22'),
(327, 1, '31.4367002', '73.0894578', '2024-02-23 12:39:32'),
(328, 1, '31.4367066', '73.0894515', '2024-02-23 12:39:42'),
(329, 1, '31.4367096', '73.0894483', '2024-02-23 12:39:55'),
(330, 1, '31.4367044', '73.0894549', '2024-02-23 12:40:03'),
(331, 1, '31.4367065', '73.0894539', '2024-02-23 12:40:12'),
(332, 1, '31.4366998', '73.0894582', '2024-02-23 12:40:22'),
(333, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:54'),
(334, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:54'),
(335, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:54'),
(336, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:54'),
(337, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:54'),
(338, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:54'),
(339, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(340, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(341, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(342, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(343, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(344, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(345, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(346, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(347, 1, '31.4367072', '73.0894527', '2024-02-23 12:42:55'),
(348, 1, '31.4366988', '73.089459', '2024-02-23 12:43:02'),
(349, 1, '31.4366998', '73.0894582', '2024-02-23 12:43:12'),
(350, 1, '31.4366914', '73.089468', '2024-02-23 12:43:22'),
(351, 1, '31.4366996', '73.0894607', '2024-02-23 12:43:32'),
(352, 1, '31.4366997', '73.08946', '2024-02-23 12:43:42'),
(353, 1, '31.4366941', '73.0894624', '2024-02-23 12:43:52'),
(354, 1, '31.4366985', '73.089459', '2024-02-23 12:44:02'),
(355, 1, '31.4365842', '73.0895896', '2024-02-23 12:44:12'),
(356, 1, '31.4367024', '73.0894565', '2024-02-23 12:44:26'),
(357, 1, '31.4366977', '73.0894617', '2024-02-23 12:44:32'),
(358, 1, '31.436705', '73.0894546', '2024-02-23 12:44:42'),
(359, 1, '31.4367099', '73.0894416', '2024-02-23 12:44:55'),
(360, 1, '31.4367081', '73.0894469', '2024-02-23 12:45:02'),
(361, 1, '31.4367069', '73.0894497', '2024-02-23 12:45:12'),
(362, 1, '31.4367088', '73.0894526', '2024-02-23 12:45:22'),
(363, 1, '31.4367082', '73.0894536', '2024-02-23 12:45:32'),
(364, 1, '31.4367035', '73.0894581', '2024-02-23 12:45:42'),
(365, 1, '31.4367087', '73.0894461', '2024-02-23 12:45:52'),
(366, 1, '31.4367127', '73.0894427', '2024-02-23 12:46:02'),
(367, 1, '31.4367074', '73.0894512', '2024-02-23 12:46:12'),
(368, 1, '31.4367084', '73.0894489', '2024-02-23 12:46:23'),
(369, 1, '31.4367047', '73.0894551', '2024-02-23 12:46:32'),
(370, 1, '31.4367062', '73.0894526', '2024-02-23 12:46:42'),
(371, 1, '31.4367055', '73.0894541', '2024-02-23 12:46:52'),
(372, 1, '31.4367089', '73.0894482', '2024-02-23 12:47:02'),
(373, 1, '31.4367041', '73.0894549', '2024-02-23 12:47:12'),
(374, 1, '31.436707', '73.0894516', '2024-02-23 12:47:22'),
(375, 1, '31.4367001', '73.0894591', '2024-02-23 12:47:32'),
(376, 1, '31.4367081', '73.0894507', '2024-02-23 12:47:42'),
(377, 1, '31.436697', '73.0894613', '2024-02-23 12:47:53'),
(378, 1, '31.4367035', '73.089456', '2024-02-23 12:48:02'),
(379, 1, '31.4367105', '73.0894405', '2024-02-23 12:48:14'),
(380, 1, '31.4367044', '73.0894542', '2024-02-23 12:48:23'),
(381, 1, '31.4367053', '73.0894541', '2024-02-23 12:48:32'),
(382, 1, '31.4367067', '73.0894525', '2024-02-23 12:48:42'),
(383, 1, '31.4367073', '73.0894504', '2024-02-23 12:48:52'),
(384, 1, '31.4367048', '73.0894545', '2024-02-23 12:49:02'),
(385, 1, '31.436707', '73.0894522', '2024-02-23 12:49:12'),
(386, 1, '31.436704', '73.0894563', '2024-02-23 12:49:22'),
(387, 1, '31.4367066', '73.0894549', '2024-02-23 12:49:32'),
(388, 1, '31.436707', '73.0894447', '2024-02-23 12:49:42'),
(389, 1, '31.4367047', '73.0894577', '2024-02-23 12:49:54'),
(390, 1, '31.4367018', '73.0894579', '2024-02-23 12:50:04'),
(391, 1, '31.4366994', '73.0894593', '2024-02-23 12:50:12'),
(392, 1, '31.4367015', '73.0894574', '2024-02-23 12:55:00'),
(393, 1, '31.4367068', '73.0894502', '2024-02-23 12:55:10'),
(394, 1, '31.4367017', '73.0894568', '2024-02-23 12:55:20'),
(395, 1, '31.4367036', '73.0894545', '2024-02-23 12:55:30'),
(396, 1, '31.436702', '73.0894577', '2024-02-23 12:55:39'),
(397, 1, '31.4367041', '73.0894542', '2024-02-23 12:55:50'),
(398, 1, '31.4367103', '73.0894477', '2024-02-23 12:56:00'),
(399, 1, '31.4367038', '73.0894548', '2024-02-23 12:56:09'),
(400, 1, '31.4367042', '73.0894553', '2024-02-23 12:56:19'),
(401, 1, '31.4367071', '73.0894509', '2024-02-23 12:56:30'),
(402, 1, '31.4367066', '73.0894517', '2024-02-23 12:56:40'),
(403, 1, '31.4367038', '73.0894554', '2024-02-23 12:56:50'),
(404, 1, '31.436706', '73.0894542', '2024-02-23 12:57:00'),
(405, 1, '31.4367048', '73.0894526', '2024-02-23 12:57:10'),
(406, 1, '31.4367095', '73.0894473', '2024-02-23 12:57:20'),
(407, 1, '31.4367072', '73.0894502', '2024-02-23 12:57:30'),
(408, 1, '31.4367052', '73.0894529', '2024-02-23 12:57:39'),
(409, 1, '31.4367022', '73.0894564', '2024-02-23 12:57:50'),
(410, 1, '31.4367061', '73.0894515', '2024-02-23 12:58:00'),
(411, 1, '31.436709', '73.0894468', '2024-02-23 12:58:09'),
(412, 1, '31.4367118', '73.089445', '2024-02-23 12:58:20'),
(413, 1, '31.4367063', '73.0894506', '2024-02-23 12:58:30'),
(414, 1, '31.4367074', '73.0894485', '2024-02-23 12:58:40'),
(415, 1, '31.4367027', '73.0894571', '2024-02-23 12:58:50'),
(416, 1, '31.4367037', '73.0894557', '2024-02-23 12:59:00'),
(417, 1, '31.4367058', '73.0894542', '2024-02-23 12:59:09'),
(418, 1, '31.4367005', '73.0894572', '2024-02-23 12:59:20'),
(419, 1, '31.4366987', '73.0894604', '2024-02-23 12:59:30'),
(420, 1, '31.4367056', '73.0894554', '2024-02-23 12:59:39'),
(421, 1, '31.4367055', '73.0894554', '2024-02-23 12:59:50'),
(422, 1, '31.4366978', '73.0894617', '2024-02-23 12:59:59'),
(423, 1, '31.4366909', '73.0894658', '2024-02-23 01:00:10'),
(424, 1, '31.4367063', '73.0894529', '2024-02-23 01:00:20'),
(425, 1, '31.4367065', '73.089453', '2024-02-23 01:00:30'),
(426, 1, '31.4367065', '73.0894458', '2024-02-23 01:00:40'),
(427, 1, '31.4367097', '73.0894526', '2024-02-23 01:00:49'),
(428, 1, '31.436705', '73.0894544', '2024-02-23 01:01:00'),
(429, 1, '31.4367117', '73.0894462', '2024-02-23 01:01:09'),
(430, 1, '31.4367051', '73.0894538', '2024-02-23 01:01:19'),
(431, 1, '31.4366861', '73.0894716', '2024-02-23 01:01:29'),
(432, 1, '31.4367065', '73.0894524', '2024-02-23 01:01:39'),
(433, 1, '31.4366987', '73.0894597', '2024-02-23 01:01:50'),
(434, 1, '31.4367063', '73.0894582', '2024-02-23 01:02:00'),
(435, 1, '31.4367044', '73.0894563', '2024-02-23 01:02:10'),
(436, 1, '31.4365695', '73.0895573', '2024-02-23 01:02:19'),
(437, 1, '31.4367172', '73.0894487', '2024-02-23 01:02:29'),
(438, 1, '31.4367025', '73.0894577', '2024-02-23 01:02:40'),
(439, 1, '31.4367054', '73.0894589', '2024-02-23 01:02:50'),
(440, 1, '31.4367066', '73.0894561', '2024-02-23 01:02:59'),
(441, 1, '31.4366369', '73.0894715', '2024-02-23 01:03:10'),
(442, 1, '31.4365415', '73.0894329', '2024-02-23 01:03:19'),
(443, 1, '31.4365737', '73.0895193', '2024-02-23 01:03:29'),
(444, 1, '31.4365483', '73.0895083', '2024-02-23 01:03:39'),
(445, 1, '31.4365483', '73.0895083', '2024-02-23 01:03:50'),
(446, 1, '31.4364514', '73.0893884', '2024-02-23 01:03:59'),
(447, 1, '31.4364143', '73.0892552', '2024-02-23 01:04:10'),
(448, 1, '31.4366721', '73.0894218', '2024-02-23 01:04:21'),
(449, 1, '31.4367058', '73.0894483', '2024-02-23 01:04:29'),
(450, 1, '31.4367096', '73.0894575', '2024-02-23 01:04:39'),
(451, 1, '31.4367053', '73.0894567', '2024-02-23 01:04:50'),
(452, 1, '31.4367029', '73.0894551', '2024-02-23 01:05:00'),
(453, 1, '31.4367123', '73.089449', '2024-02-23 01:05:09'),
(454, 1, '31.4367042', '73.0894582', '2024-02-23 01:05:20'),
(455, 1, '31.4367073', '73.0894505', '2024-02-23 01:05:30'),
(456, 1, '31.436701', '73.0894592', '2024-02-23 01:05:41'),
(457, 1, '31.4367025', '73.089455', '2024-02-23 01:05:50'),
(458, 1, '31.4367043', '73.0894553', '2024-02-23 01:05:59'),
(459, 1, '31.4367043', '73.0894524', '2024-02-23 01:06:09'),
(460, 1, '31.4366943', '73.0894666', '2024-02-23 01:06:20'),
(461, 1, '31.4366986', '73.0894664', '2024-02-23 01:06:30'),
(462, 1, '31.4367077', '73.0894546', '2024-02-23 01:06:40'),
(463, 1, '31.4367083', '73.089452', '2024-02-23 01:06:50'),
(464, 1, '31.4365991', '73.0895725', '2024-02-23 01:06:59'),
(465, 1, '31.436705', '73.0894609', '2024-02-23 01:07:09'),
(466, 1, '31.4367086', '73.0894523', '2024-02-23 01:07:19'),
(467, 1, '31.4367078', '73.0894614', '2024-02-23 01:07:30'),
(468, 1, '31.4368073', '73.0892486', '2024-02-23 01:07:40'),
(469, 1, '31.4368944', '73.0891183', '2024-02-23 01:07:49'),
(470, 1, '31.4367989', '73.0889471', '2024-02-23 01:08:02'),
(471, 1, '31.4367543', '73.0889093', '2024-02-23 01:08:10'),
(472, 1, '31.4364946', '73.0890133', '2024-02-23 01:08:20'),
(473, 1, '31.4365266', '73.0889503', '2024-02-23 01:08:29'),
(474, 1, '31.4365986', '73.0891137', '2024-02-23 01:08:40'),
(475, 1, '31.4368342', '73.0894675', '2024-02-23 01:08:49'),
(476, 1, '31.4367985', '73.0895876', '2024-02-23 01:09:00'),
(477, 1, '31.4368883', '73.0894618', '2024-02-23 01:09:10'),
(478, 1, '31.4369174', '73.0894223', '2024-02-23 01:09:20'),
(479, 1, '31.436981', '73.0893526', '2024-02-23 01:09:31'),
(480, 1, '31.4369784', '73.089302', '2024-02-23 01:09:40'),
(481, 1, '31.4370273', '73.0892514', '2024-02-23 01:09:49'),
(482, 1, '31.4370574', '73.0892078', '2024-02-23 01:10:00'),
(483, 1, '31.4369533', '73.0892374', '2024-02-23 01:10:10'),
(484, 1, '31.4369424', '73.0893206', '2024-02-23 01:10:20'),
(485, 1, '31.4369529', '73.0893064', '2024-02-23 01:10:30'),
(486, 1, '31.4369508', '73.0892287', '2024-02-23 01:10:40'),
(487, 1, '31.4367959', '73.0894658', '2024-02-23 01:10:50'),
(488, 1, '31.4368442', '73.0894485', '2024-02-23 01:11:00'),
(489, 1, '31.4367391', '73.0895148', '2024-02-23 01:11:10'),
(490, 1, '31.4367057', '73.0894557', '2024-02-23 01:11:19'),
(491, 1, '31.4367091', '73.0894508', '2024-02-23 01:11:30'),
(492, 1, '31.4368361', '73.089425', '2024-02-23 01:11:40'),
(493, 1, '31.43676', '73.0895132', '2024-02-23 01:11:50'),
(494, 1, '31.436954', '73.0892765', '2024-02-23 01:12:00'),
(495, 1, '31.4370503', '73.0891377', '2024-02-23 01:12:10'),
(496, 1, '31.4368959', '73.0892868', '2024-02-23 01:12:20'),
(497, 1, '31.4368865', '73.0892673', '2024-02-23 01:12:30'),
(498, 1, '31.4366429', '73.0895095', '2024-02-23 01:12:40'),
(499, 1, '31.4367028', '73.0893913', '2024-02-23 01:12:49'),
(500, 1, '31.4365729', '73.0894959', '2024-02-23 01:12:59'),
(501, 1, '31.4365977', '73.0894858', '2024-02-23 01:13:12'),
(502, 1, '31.4366858', '73.089481', '2024-02-23 01:13:19'),
(503, 1, '31.4367501', '73.0894374', '2024-02-23 01:13:30'),
(504, 1, '31.4367274', '73.0893646', '2024-02-23 01:13:40'),
(505, 1, '31.4367967', '73.0892951', '2024-02-23 01:13:49'),
(506, 1, '31.4368774', '73.0892085', '2024-02-23 01:13:59'),
(507, 1, '31.4368596', '73.0891443', '2024-02-23 01:14:10'),
(508, 1, '31.4368268', '73.0892324', '2024-02-23 01:14:20'),
(509, 1, '31.43671', '73.0894537', '2024-02-23 01:14:35'),
(510, 1, '31.43671', '73.0894537', '2024-02-23 01:14:40'),
(511, 1, '31.4367068', '73.0894614', '2024-02-23 01:14:50'),
(512, 1, '31.4367032', '73.0894654', '2024-02-23 01:15:00'),
(513, 1, '31.4366988', '73.0894654', '2024-02-23 01:15:10'),
(514, 1, '31.4367162', '73.0894516', '2024-02-23 01:15:23'),
(515, 1, '31.4367149', '73.0894311', '2024-02-23 01:15:30'),
(516, 1, '31.4367102', '73.0894454', '2024-02-23 01:15:39'),
(517, 1, '31.436624', '73.0895193', '2024-02-23 01:15:50'),
(518, 1, '31.4367141', '73.0894352', '2024-02-23 01:16:03'),
(519, 1, '31.4367084', '73.0894492', '2024-02-23 01:16:10'),
(520, 1, '31.4367099', '73.0894449', '2024-02-23 01:16:20'),
(521, 1, '31.4367114', '73.0894408', '2024-02-23 01:16:29'),
(522, 1, '31.4367108', '73.0894421', '2024-02-23 01:16:40'),
(523, 1, '31.436715', '73.0894369', '2024-02-23 01:16:50'),
(524, 1, '31.4366706', '73.0893938', '2024-02-23 01:17:00'),
(525, 1, '31.4366678', '73.0892362', '2024-02-23 01:17:10'),
(526, 1, '31.4366204', '73.0892524', '2024-02-23 01:17:20'),
(527, 1, '31.436621', '73.0892276', '2024-02-23 01:17:30'),
(528, 1, '31.4365608', '73.0886002', '2024-02-23 01:17:39'),
(529, 1, '31.4365513', '73.0883841', '2024-02-23 01:17:49'),
(530, 1, '31.4365492', '73.0883835', '2024-02-23 01:18:00'),
(531, 1, '31.4366066', '73.0895004', '2024-02-23 01:18:10'),
(532, 1, '31.4367145', '73.0894346', '2024-02-23 01:18:19'),
(533, 1, '31.4367127', '73.0894348', '2024-02-23 01:18:30'),
(534, 1, '31.4367094', '73.089439', '2024-02-23 01:18:40'),
(535, 1, '31.4367111', '73.0894485', '2024-02-23 01:18:50'),
(536, 1, '31.4367093', '73.0894539', '2024-02-23 01:19:00'),
(537, 1, '31.4367115', '73.0894476', '2024-02-23 01:19:10'),
(538, 1, '31.4367113', '73.0894473', '2024-02-23 01:19:19'),
(539, 1, '31.4367096', '73.0894522', '2024-02-23 01:19:30'),
(540, 1, '31.436711', '73.0894491', '2024-02-23 01:19:40'),
(541, 1, '31.4367106', '73.0894501', '2024-02-23 01:19:50'),
(542, 1, '31.4367161', '73.0894518', '2024-02-23 01:20:00'),
(543, 1, '31.4367104', '73.0894499', '2024-02-23 01:20:09'),
(544, 1, '31.4367129', '73.0894534', '2024-02-23 01:20:20'),
(545, 1, '31.436708', '73.0894538', '2024-02-23 01:20:34'),
(546, 1, '31.4366058', '73.089557', '2024-02-23 01:20:40'),
(547, 1, '31.4367085', '73.0894501', '2024-02-23 01:20:49'),
(548, 1, '31.4367101', '73.0894522', '2024-02-23 01:21:00'),
(549, 1, '31.4367092', '73.0894412', '2024-02-23 01:21:09'),
(550, 1, '31.4367116', '73.0894444', '2024-02-23 01:21:20'),
(551, 1, '31.4367137', '73.0894343', '2024-02-23 01:21:29'),
(552, 1, '31.4367129', '73.0894363', '2024-02-23 01:21:40'),
(553, 1, '31.4367122', '73.0894539', '2024-02-23 01:21:50'),
(554, 1, '31.436708', '73.0894597', '2024-02-23 01:22:00'),
(555, 1, '31.4367104', '73.0894359', '2024-02-23 01:22:10'),
(556, 1, '31.4364583', '73.08961', '2024-02-23 01:22:19'),
(557, 1, '31.4363405', '73.0897181', '2024-02-23 01:22:30'),
(558, 1, '31.4362869', '73.0899816', '2024-02-23 01:22:40'),
(559, 1, '31.436473', '73.0898035', '2024-02-23 01:22:50'),
(560, 1, '31.4364091', '73.0898106', '2024-02-23 01:23:00'),
(561, 1, '31.4363617', '73.0899207', '2024-02-23 01:23:10'),
(562, 1, '31.4364211', '73.089879', '2024-02-23 01:23:19'),
(563, 1, '31.436475', '73.0898219', '2024-02-23 01:23:30'),
(564, 1, '31.4365344', '73.0897418', '2024-02-23 01:23:40'),
(565, 1, '31.4365367', '73.0897383', '2024-02-23 01:23:50'),
(566, 1, '31.4366216', '73.0895756', '2024-02-23 01:24:00'),
(567, 1, '31.4366571', '73.089496', '2024-02-23 01:24:10'),
(568, 1, '31.4366829', '73.089402', '2024-02-23 01:24:20'),
(569, 1, '31.4366358', '73.0893817', '2024-02-23 01:24:31'),
(570, 1, '31.436606', '73.0894438', '2024-02-23 01:24:40'),
(571, 1, '31.4365251', '73.0893384', '2024-02-23 01:24:49'),
(572, 1, '31.4366021', '73.0896498', '2024-02-23 01:24:59'),
(573, 1, '31.4366204', '73.0895477', '2024-02-23 01:25:10'),
(574, 1, '31.4365737', '73.089618', '2024-02-23 01:25:20'),
(575, 1, '31.4366264', '73.0895195', '2024-02-23 01:25:30'),
(576, 1, '31.4366253', '73.0895461', '2024-02-23 01:25:40'),
(577, 1, '31.4367364', '73.0894303', '2024-02-23 01:25:49'),
(578, 1, '31.4368051', '73.0892882', '2024-02-23 01:26:00'),
(579, 1, '31.4368323', '73.0892471', '2024-02-23 01:26:10'),
(580, 1, '31.4367173', '73.089427', '2024-02-23 01:26:20'),
(581, 1, '31.4367134', '73.0894399', '2024-02-23 01:26:30'),
(582, 1, '31.4367088', '73.0894498', '2024-02-23 01:26:40'),
(583, 1, '31.4367074', '73.0894519', '2024-02-23 01:26:50'),
(584, 1, '31.43671', '73.0894477', '2024-02-23 01:27:00'),
(585, 1, '31.4367117', '73.089451', '2024-02-23 01:27:10'),
(586, 1, '31.4367123', '73.0894446', '2024-02-23 01:27:19'),
(587, 1, '31.4367134', '73.0894469', '2024-02-23 01:27:30'),
(588, 1, '31.4367103', '73.0894475', '2024-02-23 01:27:40'),
(589, 1, '31.4364795', '73.0896737', '2024-02-23 01:27:50'),
(590, 1, '31.4363858', '73.0896451', '2024-02-23 01:28:00'),
(591, 1, '31.4363511', '73.0895084', '2024-02-23 01:28:10'),
(592, 1, '31.4364864', '73.0894449', '2024-02-23 01:28:19'),
(593, 1, '31.4365467', '73.089702', '2024-02-23 01:28:30'),
(594, 1, '31.4365306', '73.0897579', '2024-02-23 01:28:40'),
(595, 1, '31.4366144', '73.0896575', '2024-02-23 01:28:49'),
(596, 1, '31.4365698', '73.0897673', '2024-02-23 01:29:00'),
(597, 1, '31.4367102', '73.0894518', '2024-02-23 01:29:10'),
(598, 1, '31.4367141', '73.0894407', '2024-02-23 01:29:19'),
(599, 1, '31.4367127', '73.0894462', '2024-02-23 01:29:30'),
(600, 1, '31.4367142', '73.0894528', '2024-02-23 01:29:40'),
(601, 1, '31.4367133', '73.0894344', '2024-02-23 01:29:49'),
(602, 1, '31.4364831', '73.0898732', '2024-02-23 01:30:00'),
(603, 1, '31.4367607', '73.0894958', '2024-02-23 01:30:09'),
(604, 1, '31.4367835', '73.0894254', '2024-02-23 01:30:20'),
(605, 1, '31.4368685', '73.0893237', '2024-02-23 01:30:30'),
(606, 1, '31.4369751', '73.0892451', '2024-02-23 01:30:40'),
(607, 1, '31.436972', '73.0892407', '2024-02-23 01:30:50'),
(608, 1, '31.4369779', '73.0891933', '2024-02-23 01:31:01'),
(609, 1, '31.4367546', '73.089475', '2024-02-23 01:31:10'),
(610, 1, '31.4366715', '73.0896006', '2024-02-23 01:31:20'),
(611, 1, '31.436689', '73.0895752', '2024-02-23 01:31:29'),
(612, 1, '31.4367072', '73.089472', '2024-02-23 01:31:41'),
(613, 1, '31.4367106', '73.0894376', '2024-02-23 01:31:51'),
(614, 1, '31.436712', '73.089446', '2024-02-23 01:31:59'),
(615, 1, '31.4367161', '73.0894447', '2024-02-23 01:32:10'),
(616, 1, '31.4367074', '73.089457', '2024-02-23 01:32:19'),
(617, 1, '31.4366121', '73.089549', '2024-02-23 01:32:29'),
(618, 1, '31.4367081', '73.0894523', '2024-02-23 01:32:40'),
(619, 1, '31.4367087', '73.089439', '2024-02-23 01:32:50'),
(620, 1, '31.4367076', '73.0894529', '2024-02-23 01:33:03'),
(621, 1, '31.4367087', '73.0894515', '2024-02-23 01:33:10'),
(622, 1, '31.4367102', '73.0894523', '2024-02-23 01:33:19'),
(623, 1, '31.4367124', '73.0894549', '2024-02-23 01:33:31'),
(624, 1, '31.4367074', '73.0894523', '2024-02-23 01:33:40'),
(625, 1, '31.4367118', '73.0894486', '2024-02-23 01:33:49'),
(626, 1, '31.4367089', '73.0894498', '2024-02-23 01:34:00'),
(627, 1, '31.436706', '73.0894462', '2024-02-23 01:34:10'),
(628, 1, '31.4367122', '73.0894342', '2024-02-23 01:34:20'),
(629, 1, '31.4367117', '73.0894322', '2024-02-23 01:34:30'),
(630, 1, '31.4367116', '73.0894347', '2024-02-23 01:34:40'),
(631, 1, '31.4367143', '73.0894318', '2024-02-23 01:34:50'),
(632, 1, '31.4367177', '73.0894412', '2024-02-23 01:35:00'),
(633, 1, '31.4367189', '73.0894398', '2024-02-23 01:35:10'),
(634, 1, '31.4367128', '73.0894449', '2024-02-23 01:35:21'),
(635, 1, '31.4367107', '73.0894457', '2024-02-23 01:35:30'),
(636, 1, '31.4367102', '73.0894327', '2024-02-23 01:35:43'),
(637, 1, '31.4367193', '73.0894488', '2024-02-23 01:35:50'),
(638, 1, '31.4367115', '73.0894485', '2024-02-23 01:36:03'),
(639, 1, '31.4367122', '73.0894477', '2024-02-23 01:36:09'),
(640, 1, '31.4367083', '73.0894516', '2024-02-23 01:36:20'),
(641, 1, '31.4367086', '73.08945', '2024-02-23 01:36:30'),
(642, 1, '31.4367119', '73.089443', '2024-02-23 01:36:40'),
(643, 1, '31.43671', '73.0894431', '2024-02-23 01:36:49'),
(644, 1, '31.4367117', '73.0894436', '2024-02-23 01:37:03'),
(645, 1, '31.4367109', '73.0894461', '2024-02-23 01:37:10'),
(646, 1, '31.436712', '73.0894461', '2024-02-23 01:37:19'),
(647, 1, '31.4367088', '73.0894428', '2024-02-23 01:37:30'),
(648, 1, '31.4367079', '73.0894489', '2024-02-23 01:37:40'),
(649, 1, '31.4367139', '73.0894401', '2024-02-23 01:37:50'),
(650, 1, '31.4367129', '73.0894386', '2024-02-23 01:38:00'),
(651, 1, '31.4367126', '73.0894534', '2024-02-23 01:38:09'),
(652, 1, '31.436706', '73.0894387', '2024-02-23 01:38:22'),
(653, 1, '31.4367069', '73.089437', '2024-02-23 01:38:30'),
(654, 1, '31.4367122', '73.089436', '2024-02-23 01:38:40'),
(655, 1, '31.4367162', '73.0894482', '2024-02-23 01:38:49'),
(656, 1, '31.4367107', '73.0894555', '2024-02-23 01:39:00'),
(657, 1, '31.436711', '73.0894542', '2024-02-23 01:39:10'),
(658, 1, '31.4367113', '73.0894496', '2024-02-23 01:39:20'),
(659, 1, '31.4367072', '73.089453', '2024-02-23 01:39:30'),
(660, 1, '31.4367659', '73.0893735', '2024-02-23 01:39:40'),
(661, 1, '31.4368915', '73.089377', '2024-02-23 01:39:50'),
(662, 1, '31.4366926', '73.0893266', '2024-02-23 01:40:10'),
(663, 1, '31.4366721', '73.0893806', '2024-02-23 01:40:10'),
(664, 1, '31.4369288', '73.0892544', '2024-02-23 01:40:20'),
(665, 1, '31.4371279', '73.0892535', '2024-02-23 01:40:31'),
(666, 1, '31.4370634', '73.0894215', '2024-02-23 01:40:40'),
(667, 1, '31.4370249', '73.0894244', '2024-02-23 01:40:49'),
(668, 1, '31.4368908', '73.0895205', '2024-02-23 01:41:00'),
(669, 1, '31.4368468', '73.0895777', '2024-02-23 01:41:10'),
(670, 1, '31.4367562', '73.0895568', '2024-02-23 01:41:20'),
(671, 1, '31.4366837', '73.0896306', '2024-02-23 01:41:30'),
(672, 1, '31.4367088', '73.0894765', '2024-02-23 01:41:40'),
(673, 1, '31.4367108', '73.0894506', '2024-02-23 01:41:49'),
(674, 1, '31.4367114', '73.0894499', '2024-02-23 01:41:59'),
(675, 1, '31.4367109', '73.0894576', '2024-02-23 01:42:10'),
(676, 1, '31.4367114', '73.0894491', '2024-02-23 01:42:20'),
(677, 1, '31.4367079', '73.0894534', '2024-02-23 01:42:30'),
(678, 1, '31.4370385', '73.0892888', '2024-02-23 01:42:40'),
(679, 1, '31.436712', '73.0893784', '2024-02-23 01:42:50'),
(680, 1, '31.4368301', '73.0893489', '2024-02-23 01:43:00'),
(681, 1, '31.4368967', '73.089283', '2024-02-23 01:43:10'),
(682, 1, '31.4368784', '73.0893568', '2024-02-23 01:43:20'),
(683, 1, '31.4369669', '73.0893639', '2024-02-23 01:43:30'),
(684, 1, '31.4368871', '73.0893572', '2024-02-23 01:43:40'),
(685, 1, '31.436856', '73.0893706', '2024-02-23 01:43:51'),
(686, 1, '31.4370116', '73.0893729', '2024-02-23 01:43:59'),
(687, 1, '31.4371878', '73.0892738', '2024-02-23 01:44:09'),
(688, 1, '31.4367223', '73.0894336', '2024-02-23 01:44:20'),
(689, 1, '31.4367137', '73.08944', '2024-02-23 01:44:29'),
(690, 1, '31.4367011', '73.0896314', '2024-02-23 01:44:40'),
(691, 1, '31.4365087', '73.0896494', '2024-02-23 01:44:49'),
(692, 1, '31.4365531', '73.0896344', '2024-02-23 01:45:00'),
(693, 1, '31.4364827', '73.0896104', '2024-02-23 01:45:10'),
(694, 1, '31.4365591', '73.0895748', '2024-02-23 01:45:20'),
(695, 1, '31.4364838', '73.0895096', '2024-02-23 01:45:30'),
(696, 1, '31.4363195', '73.0894866', '2024-02-23 01:45:40'),
(697, 1, '31.4364396', '73.0894715', '2024-02-23 01:45:49'),
(698, 1, '31.436539', '73.0895116', '2024-02-23 01:45:59'),
(699, 1, '31.4367183', '73.0896064', '2024-02-23 01:46:11'),
(700, 1, '31.4367814', '73.0895921', '2024-02-23 01:46:20'),
(701, 1, '31.4367095', '73.0894513', '2024-02-23 01:46:31'),
(702, 1, '31.436708', '73.0894528', '2024-02-23 01:46:40'),
(703, 1, '31.4367052', '73.0894545', '2024-02-23 01:46:49'),
(704, 1, '31.4367087', '73.0894541', '2024-02-23 01:47:00'),
(705, 1, '31.4367087', '73.0894533', '2024-02-23 01:47:10'),
(706, 1, '31.4367075', '73.0894504', '2024-02-23 01:47:19'),
(707, 1, '31.4367058', '73.0894459', '2024-02-23 01:47:30'),
(708, 1, '31.4367122', '73.0894452', '2024-02-23 01:47:40'),
(709, 1, '31.4367079', '73.0894507', '2024-02-23 01:47:50'),
(710, 1, '31.4367106', '73.0894525', '2024-02-23 01:48:00'),
(711, 1, '31.4367098', '73.0894447', '2024-02-23 01:48:10'),
(712, 1, '31.4367039', '73.089457', '2024-02-23 01:48:20'),
(713, 1, '31.4367103', '73.0894483', '2024-02-23 01:48:30'),
(714, 1, '31.4367137', '73.0894516', '2024-02-23 01:48:40'),
(715, 1, '31.4367156', '73.0894523', '2024-02-23 01:48:49'),
(716, 1, '31.4367102', '73.0894436', '2024-02-23 01:49:00'),
(717, 1, '31.4367102', '73.0894464', '2024-02-23 01:49:10'),
(718, 1, '31.4367096', '73.0894515', '2024-02-23 01:49:20'),
(719, 1, '31.4365962', '73.0895725', '2024-02-23 01:49:30'),
(720, 1, '31.4367137', '73.0894496', '2024-02-23 01:49:40'),
(721, 1, '31.4367102', '73.0894442', '2024-02-23 01:49:50'),
(722, 1, '31.4367114', '73.0894425', '2024-02-23 01:50:00'),
(723, 1, '31.4367127', '73.0894472', '2024-02-23 01:50:10'),
(724, 1, '31.4367129', '73.0894489', '2024-02-23 01:50:20'),
(725, 1, '31.4367088', '73.0894483', '2024-02-23 01:50:30'),
(726, 1, '31.4367097', '73.0894482', '2024-02-23 01:50:40'),
(727, 1, '31.4367123', '73.0894474', '2024-02-23 01:50:49'),
(728, 1, '31.4365752', '73.0890794', '2024-02-23 01:51:00'),
(729, 1, '31.4367071', '73.0894463', '2024-02-23 01:51:11'),
(730, 1, '31.4367087', '73.089451', '2024-02-23 01:51:19'),
(731, 1, '31.4367101', '73.0894461', '2024-02-23 01:51:29'),
(732, 1, '31.436708', '73.0894484', '2024-02-23 01:51:40'),
(733, 1, '31.4367079', '73.0894479', '2024-02-23 01:51:50'),
(734, 1, '31.4365896', '73.0895792', '2024-02-23 01:52:00'),
(735, 1, '31.4367135', '73.0894453', '2024-02-23 01:52:10'),
(736, 1, '31.4367076', '73.0894482', '2024-02-23 01:52:20'),
(737, 1, '31.4367081', '73.089448', '2024-02-23 01:52:30'),
(738, 1, '31.4367056', '73.0894506', '2024-02-23 01:52:39'),
(739, 1, '31.4367077', '73.0894475', '2024-02-23 01:52:49'),
(740, 1, '31.4367106', '73.0894513', '2024-02-23 01:52:59'),
(741, 1, '31.4367073', '73.0894487', '2024-02-23 01:53:10'),
(742, 1, '31.4367063', '73.0894496', '2024-02-23 01:53:19'),
(743, 1, '31.4367085', '73.0894495', '2024-02-23 01:53:30'),
(744, 1, '31.4367108', '73.0894488', '2024-02-23 01:53:39'),
(745, 1, '31.4367092', '73.0894529', '2024-02-23 01:53:50'),
(746, 1, '31.4364911', '73.0898356', '2024-02-23 01:53:59'),
(747, 1, '31.4366034', '73.0897452', '2024-02-23 01:54:10'),
(748, 1, '31.4366671', '73.0896811', '2024-02-23 01:54:19'),
(749, 1, '31.4366854', '73.0896005', '2024-02-23 01:54:29'),
(750, 1, '31.4366199', '73.0896241', '2024-02-23 01:54:39'),
(751, 1, '31.4366988', '73.0895482', '2024-02-23 01:54:50'),
(752, 1, '31.436643', '73.089542', '2024-02-23 01:55:00'),
(753, 1, '31.4366408', '73.0895153', '2024-02-23 01:55:10'),
(754, 1, '31.4366325', '73.0895146', '2024-02-23 01:55:19'),
(755, 1, '31.4365872', '73.0896044', '2024-02-23 01:55:30'),
(756, 1, '31.4365836', '73.0896637', '2024-02-23 01:55:39'),
(757, 1, '31.4365696', '73.0897096', '2024-02-23 01:55:51'),
(758, 1, '31.4365748', '73.0896803', '2024-02-23 01:56:00'),
(759, 1, '31.4366285', '73.0896212', '2024-02-23 01:56:10'),
(760, 1, '31.4366779', '73.0894774', '2024-02-23 01:56:19'),
(761, 1, '31.4366807', '73.0894031', '2024-02-23 01:56:30'),
(762, 1, '31.4366317', '73.0894591', '2024-02-23 01:56:39'),
(763, 1, '31.4365822', '73.089466', '2024-02-23 01:56:50'),
(764, 1, '31.4365494', '73.0895011', '2024-02-23 01:56:59'),
(765, 1, '31.4364893', '73.08953', '2024-02-23 01:57:10'),
(766, 1, '31.4364657', '73.089586', '2024-02-23 01:57:19'),
(767, 1, '31.4364679', '73.0896145', '2024-02-23 01:57:30'),
(768, 1, '31.4365031', '73.0895797', '2024-02-23 01:57:40'),
(769, 1, '31.436493', '73.0896505', '2024-02-23 01:57:50'),
(770, 1, '31.4364652', '73.0897323', '2024-02-23 01:57:59'),
(771, 1, '31.4364649', '73.089777', '2024-02-23 01:58:09'),
(772, 1, '31.4364769', '73.0898123', '2024-02-23 01:58:19'),
(773, 1, '31.4364604', '73.0898127', '2024-02-23 01:58:30'),
(774, 1, '31.4364569', '73.0898263', '2024-02-23 01:58:40'),
(775, 1, '31.4364657', '73.0897092', '2024-02-23 01:58:50'),
(776, 1, '31.4365013', '73.0896186', '2024-02-23 01:59:00'),
(777, 1, '31.4364594', '73.089714', '2024-02-23 01:59:10'),
(778, 1, '31.4364491', '73.0895925', '2024-02-23 01:59:20'),
(779, 1, '31.4364155', '73.0900269', '2024-02-23 01:59:30'),
(780, 1, '31.4362683', '73.0901587', '2024-02-23 01:59:39'),
(781, 1, '31.4362737', '73.0897194', '2024-02-23 01:59:50'),
(782, 1, '31.436348', '73.0897037', '2024-02-23 01:59:59'),
(783, 1, '31.4364639', '73.0891441', '2024-02-23 02:00:10'),
(784, 1, '31.4366399', '73.0888252', '2024-02-23 02:00:20'),
(785, 1, '31.4366112', '73.0887412', '2024-02-23 02:00:29'),
(786, 1, '31.436706', '73.0893853', '2024-02-23 02:00:40'),
(787, 1, '31.4367081', '73.0894522', '2024-02-23 02:00:50'),
(788, 1, '31.4367036', '73.0894628', '2024-02-23 02:01:00'),
(789, 1, '31.4367128', '73.089453', '2024-02-23 02:01:10'),
(790, 1, '31.4367089', '73.0894536', '2024-02-23 02:01:19'),
(791, 1, '31.4367079', '73.0894489', '2024-02-23 02:01:30'),
(792, 1, '31.43671', '73.0894514', '2024-02-23 02:01:39'),
(793, 1, '31.436706', '73.0894526', '2024-02-23 02:01:49'),
(794, 1, '31.4367119', '73.0894531', '2024-02-23 02:02:00'),
(795, 1, '31.4367085', '73.0894522', '2024-02-23 02:02:10'),
(796, 1, '31.436708', '73.0894513', '2024-02-23 02:02:20'),
(797, 1, '31.437119', '73.0882157', '2024-02-23 02:02:30'),
(798, 1, '31.4371535', '73.0881394', '2024-02-23 02:02:39'),
(799, 1, '31.4371825', '73.0881236', '2024-02-23 02:02:51'),
(800, 1, '31.436712', '73.0894432', '2024-02-23 02:03:06'),
(801, 1, '31.436712', '73.0894432', '2024-02-23 02:03:10'),
(802, 1, '31.4367065', '73.0894531', '2024-02-23 02:03:20'),
(803, 1, '31.4367096', '73.0894514', '2024-02-23 02:03:30'),
(804, 1, '31.4367101', '73.0894505', '2024-02-23 02:03:40'),
(805, 1, '31.4367084', '73.0894491', '2024-02-23 02:03:50'),
(806, 1, '31.4367095', '73.0894487', '2024-02-23 02:04:00'),
(807, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:22'),
(808, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:22'),
(809, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:22'),
(810, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:22'),
(811, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:22'),
(812, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(813, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(814, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(815, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(816, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(817, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(818, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(819, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(820, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(821, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(822, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:23'),
(823, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(824, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(825, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(826, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(827, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(828, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(829, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(830, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(831, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(832, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(833, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:24'),
(834, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:25'),
(835, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:25'),
(836, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:25'),
(837, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:25'),
(838, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:25'),
(839, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:25'),
(840, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:25'),
(841, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:26'),
(842, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:26'),
(843, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:26'),
(844, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:26'),
(845, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:26'),
(846, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:26'),
(847, 1, '31.4367099', '73.089439', '2024-02-23 02:30:27'),
(848, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:27'),
(849, 1, '31.4367099', '73.089439', '2024-02-23 02:30:27'),
(850, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:27');
INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `time`) VALUES
(851, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:27'),
(852, 1, '31.4367099', '73.089439', '2024-02-23 02:30:27'),
(853, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:27'),
(854, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:27'),
(855, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:27'),
(856, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:28'),
(857, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(858, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:28'),
(859, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(860, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:28'),
(861, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:28'),
(862, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(863, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(864, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(865, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(866, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(867, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(868, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(869, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(870, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(871, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(872, 1, '31.4367099', '73.089439', '2024-02-23 02:30:28'),
(873, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(874, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(875, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(876, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(877, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(878, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(879, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(880, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:29'),
(881, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(882, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(883, 1, '31.4367099', '73.089439', '2024-02-23 02:30:29'),
(884, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:29'),
(885, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:29'),
(886, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(887, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(888, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(889, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(890, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(891, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(892, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(893, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(894, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(895, 1, '31.4367099', '73.089439', '2024-02-23 02:30:30'),
(896, 1, '31.4367099', '73.089439', '2024-02-23 02:30:30'),
(897, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(898, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(899, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(900, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(901, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(902, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(903, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(904, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:30'),
(905, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(906, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(907, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:31'),
(908, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:31'),
(909, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(910, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(911, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(912, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(913, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(914, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(915, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(916, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:31'),
(917, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(918, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:31'),
(919, 1, '31.4367099', '73.089439', '2024-02-23 02:30:31'),
(920, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:31'),
(921, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:32'),
(922, 1, '31.4367099', '73.089439', '2024-02-23 02:30:32'),
(923, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:32'),
(924, 1, '31.4367099', '73.089439', '2024-02-23 02:30:32'),
(925, 1, '31.4367099', '73.089439', '2024-02-23 02:30:32'),
(926, 1, '31.4367099', '73.089439', '2024-02-23 02:30:32'),
(927, 1, '31.4367099', '73.089439', '2024-02-23 02:30:32'),
(928, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:32'),
(929, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:32'),
(930, 1, '31.4367099', '73.089439', '2024-02-23 02:30:32'),
(931, 1, '31.4367099', '73.089439', '2024-02-23 02:30:32'),
(932, 1, '31.4367099', '73.089439', '2024-02-23 02:30:32'),
(933, 1, '31.4367099', '73.089439', '2024-02-23 02:30:33'),
(934, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(935, 1, '31.4367099', '73.089439', '2024-02-23 02:30:33'),
(936, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(937, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(938, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(939, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(940, 1, '31.4367099', '73.089439', '2024-02-23 02:30:33'),
(941, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(942, 1, '31.4367099', '73.089439', '2024-02-23 02:30:33'),
(943, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(944, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(945, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:33'),
(946, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:34'),
(947, 1, '31.4367099', '73.089439', '2024-02-23 02:30:34'),
(948, 1, '31.4367099', '73.089439', '2024-02-23 02:30:35'),
(949, 1, '31.4367099', '73.089439', '2024-02-23 02:30:35'),
(950, 1, '31.4367099', '73.089439', '2024-02-23 02:30:35'),
(951, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:35'),
(952, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:35'),
(953, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:35'),
(954, 1, '31.4367099', '73.089439', '2024-02-23 02:30:36'),
(955, 1, '31.4367099', '73.089439', '2024-02-23 02:30:36'),
(956, 1, '31.4367099', '73.089439', '2024-02-23 02:30:36'),
(957, 1, '31.4367099', '73.089439', '2024-02-23 02:30:36'),
(958, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:37'),
(959, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:37'),
(960, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:39'),
(961, 1, '31.4367132', '73.0894441', '2024-02-23 02:30:39'),
(962, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:40'),
(963, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:41'),
(964, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:41'),
(965, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:41'),
(966, 1, '31.4367097', '73.0894493', '2024-02-23 02:30:42'),
(967, 1, '31.4367148', '73.0894477', '2024-02-23 02:30:49'),
(968, 1, '31.4367101', '73.0894471', '2024-02-23 02:31:00'),
(969, 1, '31.4367133', '73.0894381', '2024-02-23 02:31:10'),
(970, 1, '31.4367141', '73.0894398', '2024-02-23 02:31:20'),
(971, 1, '31.4366515', '73.0895494', '2024-02-23 02:31:30'),
(972, 1, '31.436711', '73.0894433', '2024-02-23 02:31:40'),
(973, 1, '31.4367124', '73.0894401', '2024-02-23 02:31:50'),
(974, 1, '31.4366236', '73.0895298', '2024-02-23 02:32:00'),
(975, 1, '31.4365722', '73.0896787', '2024-02-23 02:32:10'),
(976, 1, '31.436611', '73.0896664', '2024-02-23 02:32:20'),
(977, 1, '31.436625', '73.0896817', '2024-02-23 02:32:30'),
(978, 1, '31.4366022', '73.0896193', '2024-02-23 02:32:40'),
(979, 1, '31.4365406', '73.0895278', '2024-02-23 02:32:51'),
(980, 1, '31.4363823', '73.0899422', '2024-02-23 02:33:00'),
(981, 1, '31.4362364', '73.0901118', '2024-02-23 02:33:09'),
(982, 1, '31.4360748', '73.0902258', '2024-02-23 02:33:20'),
(983, 1, '31.4358906', '73.0904603', '2024-02-23 02:33:30'),
(984, 1, '31.4358503', '73.0905005', '2024-02-23 02:33:40'),
(985, 1, '31.4362319', '73.090313', '2024-02-23 02:33:50'),
(986, 1, '31.4363299', '73.0902272', '2024-02-23 02:33:59'),
(987, 1, '31.4362544', '73.0901584', '2024-02-23 02:34:10'),
(988, 1, '31.4363881', '73.0900374', '2024-02-23 02:34:19'),
(989, 1, '31.4364532', '73.0898704', '2024-02-23 02:34:29'),
(990, 1, '31.4364533', '73.0898617', '2024-02-23 02:34:40'),
(991, 1, '31.4364533', '73.0898617', '2024-02-23 02:34:50'),
(992, 1, '31.4364533', '73.0898617', '2024-02-23 02:35:00'),
(993, 1, '31.4367193', '73.0894526', '2024-02-23 02:35:10'),
(994, 1, '31.4367137', '73.0894364', '2024-02-23 02:35:19'),
(995, 1, '31.4367143', '73.0894341', '2024-02-23 02:35:29'),
(996, 1, '31.4367139', '73.0894411', '2024-02-23 02:35:40'),
(997, 1, '31.4367145', '73.0894338', '2024-02-23 02:35:50'),
(998, 1, '31.436716', '73.0894327', '2024-02-23 02:36:00'),
(999, 1, '31.4367145', '73.0894343', '2024-02-23 02:36:10'),
(1000, 1, '31.4367144', '73.0894344', '2024-02-23 02:36:20'),
(1001, 1, '31.4367148', '73.0894364', '2024-02-23 02:36:29'),
(1002, 1, '31.4367142', '73.0894339', '2024-02-23 02:36:42'),
(1003, 1, '31.4367132', '73.089438', '2024-02-23 02:36:50'),
(1004, 1, '31.4367112', '73.0894355', '2024-02-23 02:37:00'),
(1005, 1, '31.4367085', '73.0894487', '2024-02-23 02:37:10'),
(1006, 1, '31.4367139', '73.0894379', '2024-02-23 02:37:20'),
(1007, 1, '31.4367128', '73.0894388', '2024-02-23 02:37:30'),
(1008, 1, '31.4367115', '73.0894359', '2024-02-23 02:37:40'),
(1009, 1, '31.4367124', '73.089436', '2024-02-23 02:37:50'),
(1010, 1, '31.4367134', '73.0894398', '2024-02-23 02:37:59'),
(1011, 1, '31.4367128', '73.0894356', '2024-02-23 02:38:10'),
(1012, 1, '31.4367135', '73.0894389', '2024-02-23 02:38:20'),
(1013, 1, '31.4367205', '73.0894508', '2024-02-23 02:38:30'),
(1014, 1, '31.436715', '73.0894379', '2024-02-23 02:38:39'),
(1015, 1, '31.4367145', '73.0894391', '2024-02-23 02:38:49'),
(1016, 1, '31.4367144', '73.0894385', '2024-02-23 02:38:59'),
(1017, 1, '31.4367128', '73.0894363', '2024-02-23 02:39:10'),
(1018, 1, '31.436721', '73.0894494', '2024-02-23 02:39:20'),
(1019, 1, '31.4367149', '73.0894387', '2024-02-23 02:39:30'),
(1020, 1, '31.4367195', '73.0894477', '2024-02-23 02:39:40'),
(1021, 1, '31.4367136', '73.0894346', '2024-02-23 02:39:50'),
(1022, 1, '31.4367136', '73.0894357', '2024-02-23 02:40:00'),
(1023, 1, '31.436714', '73.0894389', '2024-02-23 02:40:10'),
(1024, 1, '31.4367145', '73.0894378', '2024-02-23 02:40:20'),
(1025, 1, '31.4367118', '73.0894385', '2024-02-23 02:40:30'),
(1026, 1, '31.4367149', '73.0894392', '2024-02-23 02:40:39'),
(1027, 1, '31.4367147', '73.0894386', '2024-02-23 02:40:50'),
(1028, 1, '31.4367195', '73.0894506', '2024-02-23 02:40:59'),
(1029, 1, '31.4367123', '73.0894363', '2024-02-23 02:41:09'),
(1030, 1, '31.4367147', '73.0894389', '2024-02-23 02:41:20'),
(1031, 1, '31.4367138', '73.0894375', '2024-02-23 02:41:29'),
(1032, 1, '31.4367127', '73.0894349', '2024-02-23 02:41:39'),
(1033, 1, '31.4367129', '73.0894352', '2024-02-23 02:41:50'),
(1034, 1, '31.4367135', '73.0894384', '2024-02-23 02:41:59'),
(1035, 1, '31.4367131', '73.0894352', '2024-02-23 02:42:10'),
(1036, 1, '31.4367147', '73.0894382', '2024-02-23 02:42:20'),
(1037, 1, '31.4367085', '73.0894467', '2024-02-23 02:42:30'),
(1038, 1, '31.4367124', '73.0894368', '2024-02-23 02:42:40'),
(1039, 1, '31.4367155', '73.0894375', '2024-02-23 02:42:49'),
(1040, 1, '31.4367123', '73.0894361', '2024-02-23 02:43:00'),
(1041, 1, '31.4367146', '73.089446', '2024-02-23 02:43:10'),
(1042, 1, '31.4367205', '73.0894485', '2024-02-23 02:43:19'),
(1043, 1, '31.4367159', '73.0894375', '2024-02-23 02:43:30'),
(1044, 1, '31.4367153', '73.0894377', '2024-02-23 02:43:40'),
(1045, 1, '31.4367121', '73.0894374', '2024-02-23 02:43:50'),
(1046, 1, '31.4367152', '73.0894472', '2024-02-23 02:44:00'),
(1047, 1, '31.4367128', '73.089435', '2024-02-23 02:44:10'),
(1048, 1, '31.4367221', '73.0894487', '2024-02-23 02:44:20'),
(1049, 1, '31.4367138', '73.0894374', '2024-02-23 02:44:30'),
(1050, 1, '31.4367192', '73.0894482', '2024-02-23 02:44:39'),
(1051, 1, '31.4367137', '73.0894334', '2024-02-23 02:44:50'),
(1052, 1, '31.4367129', '73.0894364', '2024-02-23 02:44:59'),
(1053, 1, '31.436714', '73.0894324', '2024-02-23 02:45:10'),
(1054, 1, '31.4367117', '73.0894378', '2024-02-23 02:45:20'),
(1055, 1, '31.436721', '73.089449', '2024-02-23 02:45:30'),
(1056, 1, '31.4367214', '73.0894469', '2024-02-23 02:45:40'),
(1057, 1, '31.4367209', '73.089448', '2024-02-23 02:45:50'),
(1058, 1, '31.4367146', '73.0894404', '2024-02-23 02:45:59'),
(1059, 1, '31.4367194', '73.0894481', '2024-02-23 02:46:09'),
(1060, 1, '31.4366073', '73.089541', '2024-02-23 02:46:20'),
(1061, 1, '31.4366558', '73.089607', '2024-02-23 02:46:30'),
(1062, 1, '31.4366314', '73.0896365', '2024-02-23 02:46:39'),
(1063, 1, '31.4366063', '73.089693', '2024-02-23 02:46:50'),
(1064, 1, '31.4366291', '73.0895392', '2024-02-23 02:46:59'),
(1065, 1, '31.4366357', '73.0894535', '2024-02-23 02:47:10'),
(1066, 1, '31.4366003', '73.0893981', '2024-02-23 02:47:20'),
(1067, 1, '31.4365516', '73.0893836', '2024-02-23 02:47:30'),
(1068, 1, '31.4365614', '73.0894361', '2024-02-23 02:47:40'),
(1069, 1, '31.4366151', '73.0894233', '2024-02-23 02:47:50'),
(1070, 1, '31.4366638', '73.0894431', '2024-02-23 02:48:00'),
(1071, 1, '31.4366987', '73.0894386', '2024-02-23 02:48:10'),
(1072, 1, '31.4367631', '73.0894225', '2024-02-23 02:48:20'),
(1073, 1, '31.436837', '73.0894104', '2024-02-23 02:48:30'),
(1074, 1, '31.4368597', '73.0893223', '2024-02-23 02:48:39'),
(1075, 1, '31.4368421', '73.0893185', '2024-02-23 02:48:50'),
(1076, 1, '31.4367473', '73.089421', '2024-02-23 02:49:00'),
(1077, 1, '31.4366993', '73.0894086', '2024-02-23 02:49:10'),
(1078, 1, '31.436612', '73.0893501', '2024-02-23 02:49:20'),
(1079, 1, '31.4366789', '73.0893713', '2024-02-23 02:49:30'),
(1080, 1, '31.4367576', '73.0894865', '2024-02-23 02:49:40'),
(1081, 1, '31.4367763', '73.0895981', '2024-02-23 02:49:50'),
(1082, 1, '31.4368243', '73.0896938', '2024-02-23 02:50:00'),
(1083, 1, '31.4368394', '73.0897129', '2024-02-23 02:50:10'),
(1084, 1, '31.4366891', '73.089727', '2024-02-23 02:50:20'),
(1085, 1, '31.4365871', '73.0897495', '2024-02-23 02:50:30'),
(1086, 1, '31.4365833', '73.0897383', '2024-02-23 02:50:39'),
(1087, 1, '31.4366855', '73.0896151', '2024-02-23 02:50:50'),
(1088, 1, '31.4366944', '73.0896098', '2024-02-23 02:50:59'),
(1089, 1, '31.4366508', '73.0896009', '2024-02-23 02:51:10'),
(1090, 1, '31.4365872', '73.0894946', '2024-02-23 02:51:20'),
(1091, 1, '31.436538', '73.0893601', '2024-02-23 02:51:30'),
(1092, 1, '31.436555', '73.0892909', '2024-02-23 02:51:39'),
(1093, 1, '31.4365197', '73.0892209', '2024-02-23 02:51:49'),
(1094, 1, '31.4365226', '73.0890536', '2024-02-23 02:51:59'),
(1095, 1, '31.4365316', '73.0890845', '2024-02-23 02:52:09'),
(1096, 1, '31.4366162', '73.0892248', '2024-02-23 02:52:19'),
(1097, 1, '31.4367829', '73.0894306', '2024-02-23 02:52:30'),
(1098, 1, '31.4367977', '73.0894114', '2024-02-23 02:52:39'),
(1099, 1, '31.436746', '73.08934', '2024-02-23 02:52:49'),
(1100, 1, '31.4367524', '73.0893661', '2024-02-23 02:52:59'),
(1101, 1, '31.4367777', '73.0894352', '2024-02-23 02:53:09'),
(1102, 1, '31.4368194', '73.0894976', '2024-02-23 02:53:19'),
(1103, 1, '31.436833', '73.0895644', '2024-02-23 02:53:30'),
(1104, 1, '31.43673', '73.08951', '2024-02-23 02:53:40'),
(1105, 1, '31.4367066', '73.0894832', '2024-02-23 02:53:50'),
(1106, 1, '31.4367043', '73.0894537', '2024-02-23 02:54:00'),
(1107, 1, '31.4367052', '73.0894496', '2024-02-23 02:54:12'),
(1108, 1, '31.4367101', '73.08945', '2024-02-23 02:54:20'),
(1109, 1, '31.4367086', '73.0894512', '2024-02-23 02:54:30'),
(1110, 1, '31.4367058', '73.0894548', '2024-02-23 02:54:39'),
(1111, 1, '31.4414026', '73.0886492', '2024-02-23 08:50:05'),
(1112, 1, '31.4414028', '73.0886491', '2024-02-23 08:50:15'),
(1113, 1, '31.4414093', '73.0886478', '2024-02-23 08:50:25'),
(1114, 1, '31.4414007', '73.0886401', '2024-02-23 08:50:35'),
(1115, 1, '31.4414007', '73.08864', '2024-02-23 08:50:45'),
(1116, 1, '31.441401', '73.0886403', '2024-02-23 08:50:55'),
(1117, 1, '31.4414091', '73.088647', '2024-02-23 08:51:05'),
(1118, 1, '31.4414097', '73.0886481', '2024-02-23 08:51:38'),
(1119, 1, '31.4414097', '73.0886481', '2024-02-23 08:51:38'),
(1120, 1, '31.4414097', '73.0886481', '2024-02-23 08:51:38'),
(1121, 1, '31.4413997', '73.0886425', '2024-02-23 08:51:45'),
(1122, 1, '31.4414095', '73.0886465', '2024-02-23 08:51:55'),
(1123, 1, '31.4414088', '73.0886464', '2024-02-23 08:52:05'),
(1124, 1, '31.4413996', '73.0886439', '2024-02-23 08:52:15'),
(1125, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1126, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1127, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1128, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1129, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1130, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1131, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1132, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1133, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1134, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1135, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1136, 1, '31.441401', '73.0886411', '2024-02-23 08:54:23'),
(1137, 1, '31.4414083', '73.0886465', '2024-02-23 08:54:25'),
(1138, 1, '31.4414011', '73.0886409', '2024-02-23 08:54:35'),
(1139, 1, '31.441409', '73.0886466', '2024-02-23 08:54:45'),
(1140, 1, '31.4414', '73.0886413', '2024-02-23 08:55:23'),
(1141, 1, '31.4414', '73.0886413', '2024-02-23 08:55:23'),
(1142, 1, '31.4414', '73.0886413', '2024-02-23 08:55:23'),
(1143, 1, '31.4414', '73.0886413', '2024-02-23 08:55:25'),
(1144, 1, '31.4414088', '73.0886473', '2024-02-23 08:55:35'),
(1145, 1, '31.4414085', '73.0886462', '2024-02-23 08:55:45'),
(1146, 1, '31.441401', '73.0886451', '2024-02-23 08:55:55'),
(1147, 1, '31.4414004', '73.0886406', '2024-02-23 08:56:05'),
(1148, 1, '31.4414034', '73.0886423', '2024-02-23 08:56:15'),
(1149, 1, '31.4413994', '73.0886413', '2024-02-23 08:56:25'),
(1150, 1, '31.4414', '73.088642', '2024-02-23 08:56:45'),
(1151, 1, '31.4414', '73.088642', '2024-02-23 08:56:46'),
(1152, 1, '31.4414085', '73.0886456', '2024-02-23 08:56:55'),
(1153, 1, '31.4414006', '73.0886404', '2024-02-23 08:57:05'),
(1154, 1, '31.4414091', '73.088647', '2024-02-23 08:57:19'),
(1155, 1, '31.4414012', '73.0886402', '2024-02-23 08:57:25'),
(1156, 1, '31.4414002', '73.0886415', '2024-02-23 08:57:35'),
(1157, 1, '31.4414032', '73.0886491', '2024-02-23 08:57:50'),
(1158, 1, '31.4414032', '73.0886491', '2024-02-23 08:57:55'),
(1159, 1, '31.4414009', '73.0886405', '2024-02-23 08:58:09'),
(1160, 1, '31.4414004', '73.0886409', '2024-02-23 08:58:15'),
(1161, 1, '31.441399', '73.0886414', '2024-02-23 08:58:25'),
(1162, 1, '31.4413993', '73.0886438', '2024-02-23 08:58:36'),
(1163, 1, '31.4414008', '73.0886406', '2024-02-23 08:58:45'),
(1164, 1, '31.441401', '73.0886404', '2024-02-23 08:58:57'),
(1165, 1, '31.4414091', '73.0886482', '2024-02-23 08:59:05'),
(1166, 1, '31.4413998', '73.088644', '2024-02-23 08:59:15'),
(1167, 1, '31.4413984', '73.0886448', '2024-02-23 08:59:26'),
(1168, 1, '31.4414091', '73.0886475', '2024-02-23 08:59:35'),
(1169, 1, '31.4414095', '73.0886476', '2024-02-23 08:59:45'),
(1170, 1, '31.4414008', '73.0886421', '2024-02-23 08:59:57'),
(1171, 1, '31.4414101', '73.088649', '2024-02-23 09:00:05'),
(1172, 1, '31.4414002', '73.0886438', '2024-02-23 09:00:15'),
(1173, 1, '31.4414006', '73.0886404', '2024-02-23 09:00:25'),
(1174, 1, '31.4413989', '73.0886438', '2024-02-23 09:00:35'),
(1175, 1, '31.4414005', '73.0886406', '2024-02-23 09:00:45'),
(1176, 1, '31.4413984', '73.0886451', '2024-02-23 09:00:55'),
(1177, 1, '31.4414064', '73.0886487', '2024-02-23 09:01:05'),
(1178, 1, '31.4414001', '73.0886409', '2024-02-23 09:01:15'),
(1179, 1, '31.4413982', '73.0886451', '2024-02-23 09:01:26'),
(1180, 1, '31.4413991', '73.0886422', '2024-02-23 09:01:35'),
(1181, 1, '31.4413974', '73.0886452', '2024-02-23 09:01:45'),
(1182, 1, '31.4414088', '73.0886463', '2024-02-23 09:01:55'),
(1183, 1, '31.4414087', '73.0886468', '2024-02-23 09:02:05'),
(1184, 1, '31.4413996', '73.0886412', '2024-02-23 09:02:18'),
(1185, 1, '31.4413986', '73.0886441', '2024-02-23 09:02:25'),
(1186, 1, '31.4413993', '73.0886407', '2024-02-23 09:02:35'),
(1187, 1, '31.4413999', '73.0886419', '2024-02-23 09:02:45'),
(1188, 1, '31.4414086', '73.0886466', '2024-02-23 09:02:56'),
(1189, 1, '31.4414088', '73.0886476', '2024-02-23 09:03:05'),
(1190, 1, '31.4413977', '73.0886449', '2024-02-23 09:03:15'),
(1191, 1, '31.4414084', '73.0886471', '2024-02-23 09:03:25'),
(1192, 1, '31.4414082', '73.0886472', '2024-02-23 09:03:35'),
(1193, 1, '31.4413985', '73.0886449', '2024-02-23 09:03:49'),
(1194, 1, '31.4413987', '73.0886446', '2024-02-23 09:03:55'),
(1195, 1, '31.441409', '73.0886471', '2024-02-23 09:04:07'),
(1196, 1, '31.4414092', '73.0886466', '2024-02-23 09:04:15'),
(1197, 1, '31.4413991', '73.0886413', '2024-02-23 09:04:27'),
(1198, 1, '31.4413984', '73.0886441', '2024-02-23 09:04:37'),
(1199, 1, '31.4413989', '73.0886415', '2024-02-23 09:04:45'),
(1200, 1, '31.4413991', '73.0886407', '2024-02-23 09:04:55'),
(1201, 1, '31.4414091', '73.0886483', '2024-02-23 09:05:05'),
(1202, 1, '31.4413997', '73.0886407', '2024-02-23 09:05:15'),
(1203, 1, '31.4414095', '73.0886488', '2024-02-23 09:05:25'),
(1204, 1, '31.4414012', '73.0886409', '2024-02-23 09:05:37'),
(1205, 1, '31.441401', '73.0886419', '2024-02-23 09:05:45'),
(1206, 1, '31.4413992', '73.0886447', '2024-02-23 09:05:55'),
(1207, 1, '31.4414031', '73.0886552', '2024-02-23 09:06:05'),
(1208, 1, '31.4414006', '73.0886443', '2024-02-23 09:06:15'),
(1209, 1, '31.4414005', '73.0886451', '2024-02-23 09:06:25'),
(1210, 1, '31.4414085', '73.0886467', '2024-02-23 09:06:37'),
(1211, 1, '31.4413982', '73.0886452', '2024-02-23 09:06:45'),
(1212, 1, '31.4414009', '73.0886407', '2024-02-23 09:06:56'),
(1213, 1, '31.4414009', '73.0886401', '2024-02-23 09:07:05'),
(1214, 1, '31.4414007', '73.0886403', '2024-02-23 09:07:16'),
(1215, 1, '31.4414086', '73.0886471', '2024-02-23 09:07:25'),
(1216, 1, '31.4414007', '73.0886407', '2024-02-23 09:07:35'),
(1217, 1, '31.4414005', '73.0886407', '2024-02-23 09:07:45'),
(1218, 1, '31.4413993', '73.0886415', '2024-02-23 09:07:55'),
(1219, 1, '31.4414009', '73.0886408', '2024-02-23 09:08:05'),
(1220, 1, '31.4414026', '73.0886495', '2024-02-23 09:08:15'),
(1221, 1, '31.4414003', '73.0886406', '2024-02-23 09:08:26'),
(1222, 1, '31.4414005', '73.0886404', '2024-02-23 09:08:41'),
(1223, 1, '31.4414005', '73.0886407', '2024-02-23 09:08:45'),
(1224, 1, '31.4414028', '73.0886489', '2024-02-23 09:08:55'),
(1225, 1, '31.4414025', '73.0886495', '2024-02-23 09:09:06'),
(1226, 1, '31.4414006', '73.0886401', '2024-02-23 09:09:15'),
(1227, 1, '31.4413985', '73.0886453', '2024-02-23 09:09:25'),
(1228, 1, '31.4414087', '73.0886462', '2024-02-23 09:09:36'),
(1229, 1, '31.4413993', '73.0886461', '2024-02-23 09:09:45'),
(1230, 1, '31.4413999', '73.0886415', '2024-02-23 09:09:57'),
(1231, 1, '31.4414087', '73.0886459', '2024-02-23 09:10:05'),
(1232, 1, '31.4414002', '73.0886411', '2024-02-23 09:10:17'),
(1233, 1, '31.4414015', '73.0886464', '2024-02-23 09:10:25'),
(1234, 1, '31.4414091', '73.0886487', '2024-02-23 09:10:35'),
(1235, 1, '31.4414011', '73.0886428', '2024-02-23 09:10:45'),
(1236, 1, '31.4414084', '73.0886476', '2024-02-23 09:10:55'),
(1237, 1, '31.4414084', '73.0886494', '2024-02-23 09:11:05'),
(1238, 1, '31.4414013', '73.0886405', '2024-02-23 09:11:15'),
(1239, 1, '31.4414015', '73.0886411', '2024-02-23 09:11:25'),
(1240, 1, '31.4414011', '73.0886404', '2024-02-23 09:11:36'),
(1241, 1, '31.4414009', '73.0886413', '2024-02-23 09:11:45'),
(1242, 1, '31.441409', '73.0886496', '2024-02-23 09:11:55'),
(1243, 1, '31.441445', '73.0886645', '2024-02-23 09:12:05'),
(1244, 1, '31.4414061', '73.0886585', '2024-02-23 09:12:15'),
(1245, 1, '31.4414089', '73.0886511', '2024-02-23 09:12:25'),
(1246, 1, '31.4414012', '73.0886451', '2024-02-23 09:12:36'),
(1247, 1, '31.4414092', '73.0886509', '2024-02-23 09:12:45'),
(1248, 1, '31.4414011', '73.0886443', '2024-02-23 09:12:55'),
(1249, 1, '31.4414034', '73.0886485', '2024-02-23 09:13:05'),
(1250, 1, '31.4414013', '73.0886447', '2024-02-23 09:13:15'),
(1251, 1, '31.4414011', '73.0886454', '2024-02-23 09:13:25'),
(1252, 1, '31.4414085', '73.0886501', '2024-02-23 09:13:35'),
(1253, 1, '31.4414016', '73.0886459', '2024-02-23 09:13:45'),
(1254, 1, '31.4414029', '73.088647', '2024-02-23 09:13:55'),
(1255, 1, '31.4414037', '73.0886467', '2024-02-23 09:14:05'),
(1256, 1, '31.4414085', '73.0886507', '2024-02-23 09:14:15'),
(1257, 1, '31.4414088', '73.088651', '2024-02-23 09:14:25'),
(1258, 1, '31.4414014', '73.0886449', '2024-02-23 09:14:35'),
(1259, 1, '31.4414012', '73.0886444', '2024-02-23 09:14:45'),
(1260, 1, '31.4414015', '73.0886451', '2024-02-23 09:14:55'),
(1261, 1, '31.4414015', '73.0886444', '2024-02-23 09:15:05'),
(1262, 1, '31.441401', '73.0886439', '2024-02-23 09:15:15'),
(1263, 1, '31.4414011', '73.0886451', '2024-02-23 09:15:25'),
(1264, 1, '31.4414008', '73.0886443', '2024-02-23 09:15:35'),
(1265, 1, '31.4414011', '73.088644', '2024-02-23 09:15:45'),
(1266, 1, '31.4414008', '73.0886424', '2024-02-23 09:15:55'),
(1267, 1, '31.4414096', '73.0886477', '2024-02-23 09:16:05'),
(1268, 1, '31.4414', '73.0886473', '2024-02-23 09:16:15'),
(1269, 1, '31.4414093', '73.088646', '2024-02-23 09:16:25'),
(1270, 1, '31.4414084', '73.0886466', '2024-02-23 09:16:35'),
(1271, 1, '31.4414088', '73.0886473', '2024-02-23 09:16:45'),
(1272, 1, '31.4414035', '73.0886489', '2024-02-23 09:16:57'),
(1273, 1, '31.4414089', '73.0886461', '2024-02-23 09:17:05'),
(1274, 1, '31.4414086', '73.0886465', '2024-02-23 09:17:15'),
(1275, 1, '31.441409', '73.0886464', '2024-02-23 09:17:25'),
(1276, 1, '31.4414093', '73.088648', '2024-02-23 09:17:35'),
(1277, 1, '31.4414011', '73.0886405', '2024-02-23 09:17:45'),
(1278, 1, '31.4414086', '73.0886452', '2024-02-23 09:17:55'),
(1279, 1, '31.4414091', '73.088647', '2024-02-23 09:18:06'),
(1280, 1, '31.4414098', '73.0886481', '2024-02-23 09:18:16'),
(1281, 1, '31.4414092', '73.0886473', '2024-02-23 09:18:25'),
(1282, 1, '31.4414014', '73.0886409', '2024-02-23 09:18:35'),
(1283, 1, '31.441401', '73.0886422', '2024-02-23 09:18:47'),
(1284, 1, '31.4414005', '73.0886403', '2024-02-23 09:18:55'),
(1285, 1, '31.4414011', '73.0886401', '2024-02-23 09:19:05'),
(1286, 1, '31.4414032', '73.0886489', '2024-02-23 09:19:16'),
(1287, 1, '31.4414087', '73.088646', '2024-02-23 09:19:26'),
(1288, 1, '31.4414009', '73.0886417', '2024-02-23 09:19:35'),
(1289, 1, '31.441401', '73.0886425', '2024-02-23 09:19:45'),
(1290, 1, '31.4414011', '73.0886444', '2024-02-23 09:19:55'),
(1291, 1, '31.4414007', '73.0886452', '2024-02-23 09:20:05'),
(1292, 1, '31.4414011', '73.0886479', '2024-02-23 09:20:15'),
(1293, 1, '31.4414014', '73.0886485', '2024-02-23 09:20:25'),
(1294, 1, '31.4414005', '73.088648', '2024-02-23 09:20:35'),
(1295, 1, '31.4414057', '73.0886493', '2024-02-23 09:20:46'),
(1296, 1, '31.4414048', '73.088649', '2024-02-23 09:20:55'),
(1297, 1, '31.441401', '73.0886458', '2024-02-23 09:21:05'),
(1298, 1, '31.4414034', '73.0886482', '2024-02-23 09:21:15'),
(1299, 1, '31.4414011', '73.0886452', '2024-02-23 09:21:25'),
(1300, 1, '31.4413995', '73.0886482', '2024-02-23 09:21:35'),
(1301, 1, '31.4414083', '73.0886479', '2024-02-23 09:21:46'),
(1302, 1, '31.4414009', '73.0886443', '2024-02-23 09:21:55'),
(1303, 1, '31.4414013', '73.0886399', '2024-02-23 09:22:07'),
(1304, 1, '31.4414086', '73.0886478', '2024-02-23 09:22:16'),
(1305, 1, '31.4414035', '73.088649', '2024-02-23 09:22:26'),
(1306, 1, '31.4414091', '73.0886477', '2024-02-23 09:22:35'),
(1307, 1, '31.4414013', '73.0886398', '2024-02-23 09:22:45'),
(1308, 1, '31.4414008', '73.088646', '2024-02-23 09:22:55'),
(1309, 1, '31.441399', '73.0886469', '2024-02-23 09:23:05'),
(1310, 1, '31.4414008', '73.0886466', '2024-02-23 09:23:15'),
(1311, 1, '31.4414011', '73.0886471', '2024-02-23 09:23:25'),
(1312, 1, '31.4414009', '73.0886473', '2024-02-23 09:23:37'),
(1313, 1, '31.4414008', '73.0886466', '2024-02-23 09:23:45'),
(1314, 1, '31.4414034', '73.0886485', '2024-02-23 09:23:57'),
(1315, 1, '31.4414059', '73.0886505', '2024-02-23 09:24:05'),
(1316, 1, '31.4414027', '73.0886493', '2024-02-23 09:24:15'),
(1317, 1, '31.4414012', '73.0886435', '2024-02-23 09:24:25'),
(1318, 1, '31.4414009', '73.0886434', '2024-02-23 09:24:35'),
(1319, 1, '31.4414034', '73.0886489', '2024-02-23 09:24:45'),
(1320, 1, '31.4414008', '73.0886411', '2024-02-23 09:24:55'),
(1321, 1, '31.4413977', '73.0886452', '2024-02-23 09:25:05'),
(1322, 1, '31.4414003', '73.0886419', '2024-02-23 09:25:15'),
(1323, 1, '31.4414083', '73.0886476', '2024-02-23 09:25:25'),
(1324, 1, '31.4413985', '73.0886412', '2024-02-23 09:25:35'),
(1325, 1, '31.4414004', '73.0886405', '2024-02-23 09:25:45'),
(1326, 1, '31.4414', '73.0886414', '2024-02-23 09:25:55'),
(1327, 1, '31.4414002', '73.0886416', '2024-02-23 09:26:05'),
(1328, 1, '31.4414015', '73.0886406', '2024-02-23 09:26:15'),
(1329, 1, '31.4414014', '73.0886399', '2024-02-23 09:26:25'),
(1330, 1, '31.4414004', '73.0886407', '2024-02-23 09:26:36'),
(1331, 1, '31.4414094', '73.0886477', '2024-02-23 09:26:45'),
(1332, 1, '31.4414009', '73.0886417', '2024-02-23 09:26:57'),
(1333, 1, '31.4414009', '73.0886427', '2024-02-23 09:27:05'),
(1334, 1, '31.4414008', '73.0886401', '2024-02-23 09:27:15'),
(1335, 1, '31.441401', '73.088642', '2024-02-23 09:27:29'),
(1336, 1, '31.4366865', '73.0894576', '2024-02-23 11:00:00'),
(1337, 1, '31.4366865', '73.0894576', '2024-02-23 11:00:11'),
(1338, 1, '31.4366865', '73.0894576', '2024-02-23 11:00:21'),
(1339, 1, '31.4366865', '73.0894576', '2024-02-23 11:00:31'),
(1340, 1, '31.4366865', '73.0894576', '2024-02-23 11:00:41'),
(1341, 1, '31.4366865', '73.0894576', '2024-02-23 11:01:25'),
(1342, 1, '31.4366865', '73.0894576', '2024-02-23 11:01:25'),
(1343, 1, '31.4366865', '73.0894576', '2024-02-23 11:01:25'),
(1344, 1, '31.4366865', '73.0894576', '2024-02-23 11:01:25'),
(1345, 1, '31.4366865', '73.0894576', '2024-02-23 11:01:30'),
(1346, 1, '31.4367128', '73.0894464', '2024-02-23 11:02:00'),
(1347, 1, '31.4367128', '73.0894464', '2024-02-23 11:02:00'),
(1348, 1, '31.4367128', '73.0894464', '2024-02-23 11:02:38'),
(1349, 1, '31.4367128', '73.0894464', '2024-02-23 11:02:38'),
(1350, 1, '31.4367128', '73.0894464', '2024-02-23 11:02:38'),
(1351, 1, '31.4367128', '73.0894464', '2024-02-23 11:02:38'),
(1352, 1, '31.4367128', '73.0894464', '2024-02-23 11:02:54'),
(1353, 1, '31.4367128', '73.0894464', '2024-02-23 11:02:54'),
(1354, 1, '31.4414014', '73.0886402', '2024-02-24 03:07:32'),
(1355, 1, '31.4414007', '73.08864', '2024-02-24 03:07:45'),
(1356, 1, '31.4414005', '73.0886417', '2024-02-24 03:07:50'),
(1357, 1, '31.4414032', '73.0886493', '2024-02-24 03:08:00'),
(1358, 1, '31.441409', '73.0886455', '2024-02-24 03:08:09'),
(1359, 1, '31.4414006', '73.088641', '2024-02-24 03:08:21'),
(1360, 1, '31.4414016', '73.0886419', '2024-02-24 03:08:38'),
(1361, 1, '31.4413994', '73.0886444', '2024-02-24 03:08:45'),
(1362, 1, '31.4414088', '73.0886466', '2024-02-24 03:08:52'),
(1363, 1, '31.4414079', '73.0886498', '2024-02-24 03:08:53'),
(1364, 1, '31.4414033', '73.0886467', '2024-02-24 03:09:10'),
(1365, 1, '31.4414013', '73.0886438', '2024-02-24 03:09:24'),
(1366, 1, '31.4414061', '73.0886505', '2024-02-24 03:09:44'),
(1367, 1, '31.4414028', '73.0886489', '2024-02-24 03:10:16'),
(1368, 1, '31.4414034', '73.0886491', '2024-02-24 03:10:20'),
(1369, 1, '31.441404', '73.0886497', '2024-02-24 03:10:20'),
(1370, 1, '31.4414009', '73.0886435', '2024-02-24 03:10:23'),
(1371, 1, '31.4414033', '73.0886484', '2024-02-24 03:10:46'),
(1372, 1, '31.4414033', '73.0886488', '2024-02-24 03:10:55'),
(1373, 1, '31.4414036', '73.0886489', '2024-02-24 03:11:13'),
(1374, 1, '31.4414033', '73.0886486', '2024-02-24 03:11:23'),
(1375, 1, '31.4414005', '73.0886451', '2024-02-24 03:11:52'),
(1376, 1, '31.4414034', '73.0886483', '2024-02-24 03:11:56'),
(1377, 1, '31.4414023', '73.0886494', '2024-02-24 03:12:03'),
(1378, 1, '31.441409', '73.088646', '2024-02-24 03:12:16'),
(1379, 1, '31.4414008', '73.088643', '2024-02-24 03:12:23'),
(1380, 1, '31.4414008', '73.0886442', '2024-02-24 03:12:38'),
(1381, 1, '31.4414032', '73.088649', '2024-02-24 03:12:47'),
(1382, 1, '31.4414059', '73.0886477', '2024-02-24 03:12:59'),
(1383, 1, '31.4414029', '73.0886492', '2024-02-24 03:13:09'),
(1384, 1, '31.4414008', '73.088646', '2024-02-24 03:13:13'),
(1385, 1, '31.4414033', '73.0886493', '2024-02-24 03:13:26'),
(1386, 1, '31.4414087', '73.0886461', '2024-02-24 03:13:37'),
(1387, 1, '31.4414032', '73.0886485', '2024-02-24 03:13:43'),
(1388, 1, '31.4414033', '73.0886492', '2024-02-24 03:13:54'),
(1389, 1, '31.4414034', '73.0886487', '2024-02-24 03:14:07'),
(1390, 1, '31.441401', '73.0886457', '2024-02-24 03:14:22'),
(1391, 1, '31.441401', '73.0886436', '2024-02-24 03:14:30'),
(1392, 1, '31.4414036', '73.0886476', '2024-02-24 03:14:43'),
(1393, 1, '31.4414009', '73.0886427', '2024-02-24 03:15:04'),
(1394, 1, '31.4414009', '73.0886444', '2024-02-24 03:15:09'),
(1395, 1, '31.4414035', '73.0886482', '2024-02-24 03:15:12'),
(1396, 1, '31.4414073', '73.0886496', '2024-02-24 03:15:21'),
(1397, 1, '31.4414012', '73.0886447', '2024-02-24 03:15:34'),
(1398, 1, '31.4414034', '73.0886488', '2024-02-24 03:15:42'),
(1399, 1, '31.4414081', '73.0886465', '2024-02-24 03:16:00'),
(1400, 1, '31.4414035', '73.0886488', '2024-02-24 03:16:09'),
(1401, 1, '31.4414034', '73.0886489', '2024-02-24 03:16:49'),
(1402, 1, '31.4414029', '73.0886492', '2024-02-24 03:17:00'),
(1403, 1, '31.4414029', '73.0886492', '2024-02-24 03:17:10'),
(1404, 1, '31.4414034', '73.0886487', '2024-02-24 03:17:15'),
(1405, 1, '31.4414009', '73.0886429', '2024-02-24 03:17:26'),
(1406, 1, '31.441432', '73.0886591', '2024-02-24 03:17:39'),
(1407, 1, '31.4414005', '73.0886402', '2024-02-24 03:17:50');

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
(1, 1, 1, 'Honda', 'Civic', 'Black', '635', '1234567', '02-2025', '123456', '02-2025', '123456', '02-2025', '2024-03-14 01:53:13');

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
(1, 1, 1, 930, 10, 0, 0, 50, 'Corrected', '2024-02-23 12:56:48'),
(2, 2, 1, 950, 0, 0, 50, 0, 'Pending', '2024-02-24 12:06:19'),
(3, 3, 1, 1040, 3, 4, 5, 6, 'Pending', '2024-02-25 03:48:12'),
(4, 4, 1, 8280, 0, 0, 0, 0, 'Pending', '2024-02-25 04:07:58'),
(5, 5, 1, 12555, 0, 0, 0, 0, 'Pending', '2024-02-25 04:14:46');

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
(00000001, 1, 0, 1, 930, 10, 0, 0, 50, '990', 198, 'unpaid', '2024-02-23 08:31:06');

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
(00000001, 00000000006, 2, 1, '', 930, 30, 0, 0, 0, 0, 'Completed', '2024-02-23 08:31:06'),
(00000004, 00000000014, 1, 1, '', 8280, 0, 0, 0, 0, 0, 'waiting', '2024-02-25 15:56:28'),
(00000005, 00000000015, 1, 1, '', 12555, 2, 0, 0, 0, 0, 'waiting', '2024-02-25 16:13:38');

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
(2, 1, 1, 'No Pob', '2024-02-25 07:29:14');

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
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `user_email`, `user_password`, `user_phone`, `user_gender`, `designation`, `address`, `city`, `state`, `country_id`, `pc`, `nid`, `user_pic`, `reg_date`) VALUES
(00000001, 'Atiq', 'Ramzan', 'admin@prenero.com', '2c29030971430433fc33d0ab2f9658a2', '+923157524000', 'Male', 'Owner', 'Shop # 24, Hamza Market, Sargodha Road', 'Faisalabad', 'Punjab', 34, 38000, '33102-1457353-9', '65d78e4408f10_1708625476.jpg', '2024-02-20 05:24:20');

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
(1, 'Saloon', 4, 1, 0, 0, 0, 50, 'toyota-prius.png', '2024-02-04 02:08:12'),
(2, 'Estate', 4, 1, 1, 1, 0, 50, 'Ford-Galaxy.png', '2023-12-26 02:15:44'),
(3, 'MPV', 4, 2, 0, 0, 0, 50, 'Ford-Galaxy.png', '2023-10-17 19:39:57'),
(4, 'Large MPV', 5, 4, 0, 0, 0, 50, 'Skoda_Octavia.png', '2023-10-17 19:39:57'),
(5, 'Minibus', 6, 6, 0, 0, 0, 50, 'Ford-Crown-Victoria.png', '2023-10-17 19:39:57'),
(6, 'Executive', 7, 6, 0, 0, 0, 50, 'Ford-Mondeo.png', '2023-10-17 19:39:57'),
(7, 'Executive Minibus', 8, 6, 0, 0, 0, 50, 'Ford-Mondeo.png', '2023-10-17 19:39:57'),
(8, '10 - 14 Passenger', 10, 10, 0, 0, 0, 40, 'Toyota-Camry.png', '2023-10-17 19:39:57'),
(9, '15 - 16 Passenger', 15, 14, 0, 0, 0, 50, 'Citroen-Berlingo.png', '2023-10-17 19:39:57');

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
  `date_upload` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_documents`
--

INSERT INTO `vehicle_documents` (`vd_id`, `d_id`, `log_book`, `mot_certificate`, `pco`, `insurance`, `road_tax`, `vehicle_picture_front`, `vehicle_picture_back`, `rental_agreement`, `insurance_schedule`, `extra`, `date_upload`) VALUES
(00000001, 00000001, '65f1f95f3aa3e.jpg', '65f1fa7ecb099.jpg', '65f1fc0fa25e7.jpg', '65f1fd73a5607.jpg', '65f201df97826.jpg', '65f1ffd8d0265.jpeg', '65f2008ea6cbd.jpeg', '65f20de8edb2b.jpeg', '65f210864d1ff.jpeg', '65f2115d22106.jpg', '2024-03-08 11:55:06');

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
-- Indexes for table `driver_acounts`
--
ALTER TABLE `driver_acounts`
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
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `ap_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- AUTO_INCREMENT for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  MODIFY `cb_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `des_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_acounts`
--
ALTER TABLE `driver_acounts`
  MODIFY `ac_id` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_bank_details`
--
ALTER TABLE `driver_bank_details`
  MODIFY `d_bank_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver_documents`
--
ALTER TABLE `driver_documents`
  MODIFY `dd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1408;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `dv_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fares`
--
ALTER TABLE `fares`
  MODIFY `fare_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `marketing_preference`
--
ALTER TABLE `marketing_preference`
  MODIFY `mp_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `railway_stations`
--
ALTER TABLE `railway_stations`
  MODIFY `rail_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `user_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vehicle_documents`
--
ALTER TABLE `vehicle_documents`
  MODIFY `vd_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(55) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
