-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2023 at 09:52 AM
-- Server version: 10.5.20-MariaDB-cll-lve
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `euroqzwc_minicaboffice`
--

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
(1, 1, 'Gatwick Airport Horley, Gatwick RH6 0NP	United Kingdom.', 'Central London London SW1A 2DR UK.', 2, 'Yes', 'N/A', '2023-10-11', '15:00:00', 'One Way', 5, 'Pending', 'Open', '', '2023-10-27 02:10:09'),
(2, 1, 'Heathrow Airport Longford TW6, UK United Kingdom.', 'Central London London SW1A 2DR UK.', 4, 'No', 'N/A', '2023-10-12', '18:06:00', 'One Way', 3, 'Pending', '', '', '2023-10-27 02:11:43'),
(3, 1, 'Manchester Airport Manchester M90 1QX United Kingdom.', 'Central London London SW1A 2DR UK.', 2, 'Yes', 'N/A', '2023-10-12', '17:05:00', 'One Way', 3, 'Pending', '', '', '2023-10-27 02:11:52'),
(4, 1, 'Birmingham Airport Birmingham B26 3QJ United Kingdom.', 'Central London London SW1A 2DR UK.', 2, 'Yes', 'Be on time', '2023-10-27', '05:00:00', 'Return', 3, 'Pending', '', '', '2023-10-27 02:12:05'),
(5, 1, 'Stansted Airport Bassingbourn Rd, Stansted CM24 1QW United Kingdom.', 'Central London London SW1A 2DR UK.', 2, 'Yes', 'N/A', '2023-10-07', '05:25:00', 'Return', 3, 'Pending', '', '', '2023-10-27 02:12:18'),
(7, 1, 'Leeds Bradford Airport	Whitehouse Ln, Yeadon, Leeds LS19 7TU United Kingdom.', 'Central London London SW1A 2DR UK.', 6, 'Yes', 'N/A', '2023-10-26', '22:40:00', 'Return', 3, 'Pending', '', '', '2023-10-29 20:03:30'),
(9, 2, 'London City Airport Hartmann Rd, London E16 2PX	United Kingdom.', 'Central London London SW1A 2DR UK.', 4, 'Yes', 'NA', '2023-10-30', '10:00:00', 'Return', 5, 'Pending', 'Open', '', '2023-10-29 18:16:49'),
(10, 2, 'Newcastle International Airport	Woolsington, Newcastle upon Tyne NE13 8BZ United Kingdom.', 'Central London London SW1A 2DR UK.', 4, 'Yes', 'NA', '2023-10-31', '07:19:00', 'One Way', 13, 'Booked', 'Open', '', '2023-10-30 12:26:18');

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
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
