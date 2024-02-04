-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 02:18 PM
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
  MODIFY `book_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
