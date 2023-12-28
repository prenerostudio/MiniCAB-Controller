-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2023 at 10:27 PM
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
  `bid_status` varchar(255) NOT NULL,
  `bid_note` varchar(255) NOT NULL,
  `book_add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `b_type_id`, `c_id`, `pickup`, `destination`, `address`, `postal_code`, `passenger`, `pick_date`, `pick_time`, `journey_type`, `v_id`, `luggage`, `child_seat`, `flight_number`, `delay_time`, `note`, `journey_fare`, `journey_distance`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `booking_status`, `bid_status`, `bid_note`, `book_add_date`) VALUES
(00000000001, 1, 1, 'Faisalabad', 'Lahore', '', '', 2, '2023-10-11', '15:00:00', 'One Way', 2, 'Yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', 'Open', '', '2023-10-27 02:10:09'),
(00000000002, 1, 1, 'Faisalabad', 'Lahore', '', '', 4, '2023-10-12', '18:06:00', 'One Way', 3, 'No', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-10-27 02:11:43'),
(00000000003, 1, 1, 'Faisalabad', 'Lahore', '', '', 2, '2023-10-12', '17:05:00', 'One Way', 5, 'Yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-10-27 02:11:52'),
(00000000004, 1, 1, 'Faisalabad', 'Lahore', '', '', 2, '2023-10-27', '05:00:00', 'Return', 7, 'Yes', '', '', '00:00:00', 'Be on time', 230, 26, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-10-27 02:12:05'),
(00000000005, 1, 1, 'Faisalabad', 'Lahore', '', '', 2, '2023-10-07', '05:25:00', 'Return', 1, 'Yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-10-27 02:12:18'),
(00000000007, 1, 1, 'Faisalabad', 'Lahore', '', '', 6, '2023-10-26', '22:40:00', 'Return', 1, 'Yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-10-29 20:03:30'),
(00000000009, 1, 2, 'Model Town', 'Lahore Airport', '', '', 4, '2023-10-30', '10:00:00', 'Return', 6, 'Yes', '', '', '00:00:00', 'NA', 230, 26, 0, 0, 0, 0, 0, 'Pending', 'Open', '', '2023-10-29 18:16:49'),
(00000000010, 1, 2, 'Model Town G Block', 'Lahore Airport', '', '', 4, '2023-10-31', '07:19:00', 'One Way', 4, 'Yes', '', '', '00:00:00', 'NA', 230, 26, 0, 0, 0, 0, 0, 'Pending', 'Open', '', '2023-10-30 12:26:18'),
(00000000014, 1, 3, 'London Airport', 'Central London', '', '', 4, '2023-12-21', '20:09:00', 'Return', 3, 'yes', '', '', '00:00:00', 'N/A', 230, 26, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-12-14 19:33:19'),
(00000000015, 1, 1, 'Heatherow Airport', 'Central London', '', '', 2, '2023-12-18', '14:00:00', 'One Way', 2, 'Yes', '', '', '00:00:00', 'N/A', 500, 22, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-12-16 04:27:27'),
(00000000016, 1, 1, 'Heatherow Airport', 'Central London', '', '', 2, '2023-12-18', '14:00:00', 'One Way', 1, 'Yes', '', '', '00:00:00', 'N/A', 500, 22, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-12-16 04:29:34'),
(00000000018, 0, 1, 'Heatherow Airport', 'Central London', '', '', 2, '0000-00-00', '00:00:00', 'One Way', 0, 'Yes', '', '', '00:00:00', 'N/A', 0, 0, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-12-22 16:06:42'),
(00000000019, 1, 1, 'Shop # 24, Rehman Pura, Street # 3, Sargodha Road, Faisalabad.', 'Faisalabad International Airport, Jhang Road, Faisalabad', 'Islam Nager Faisalabad', '38000', 2, '2023-12-23', '16:00:00', 'One Way', 2, 'Yes', 'Yes', 'PK36524', '00:00:30', 'N/A', 2500, 15, 300, 50, 0, 100, 0, 'Booked', '', '', '2023-12-28 02:19:54'),
(00000000020, 1, 1, 'Shop # 24, Rehman Pura, Street # 3, Sargodha Road, Faisalabad.', 'Faisalabad International Airport, Jhang Road, Faisalabad', 'Islam Nager Faisalabad', '38000', 2, '2023-12-23', '16:00:00', 'One Way', 2, 'Yes', 'Yes', 'PK36524', '00:00:30', 'N/A', 2500, 15, 250, 50, 100, 100, 100, 'Booked', '', '', '2023-12-28 02:18:44'),
(00000000022, 2, 2, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', '', '', '', 0, '0000-00-00', '00:00:00', 'One Way', 0, '', 'Yes', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 'Pending', '', '', '2023-12-28 02:21:20'),
(00000000023, 3, 3, 'Heathrow East Terminal, Inner Ring East, Hounslow, UK', 'Central London, London, UK', 'London', '44000', 4, '2023-12-30', '19:30:00', 'One Way', 4, 'yes', 'Yes', 'LN856', '00:00:30', '', 0, 28, 0, 0, 0, 0, 0, 'Booked', '', '', '2023-12-28 02:27:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`book_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
