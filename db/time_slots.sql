-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2024 at 07:53 PM
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

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`ts_id`, `d_id`, `ts_date`, `start_time`, `end_time`, `price_hour`, `total_pay`, `ts_status`, `ts_added_time`) VALUES
(00000001, 00000001, '2024-09-22', '10:00:00', '13:00:00', 25.00, 75.00, 2, '2024-09-23 11:13:26'),
(00000002, 00000000, '2024-09-22', '14:00:00', '16:00:00', 40.00, 80.00, 0, '2024-09-23 11:10:06'),
(00000003, 00000002, '2024-09-22', '17:00:00', '19:00:00', 60.00, 120.00, 4, '2024-09-23 11:13:11'),
(00000004, 00000000, '2024-09-22', '09:00:00', '11:00:00', 60.00, 120.00, 0, '2024-09-23 11:13:04'),
(00000005, 00000000, '2024-09-22', '09:00:00', '11:00:00', 35.00, 70.00, 0, '2024-09-23 11:09:08'),
(00000006, 00000000, '2024-09-22', '09:00:00', '11:00:00', 30.00, 60.00, 0, '2024-09-23 11:09:00'),
(00000008, 00000000, '2024-09-24', '12:30:00', '15:30:00', 20.00, 60.00, 0, '2024-09-23 11:13:38'),
(00000009, 00000002, '2024-09-27', '13:45:00', '14:15:00', 30.00, 15.00, 5, '2024-09-24 05:53:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`ts_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `ts_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
