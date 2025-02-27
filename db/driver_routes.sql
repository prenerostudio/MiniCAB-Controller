-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2025 at 07:46 PM
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
-- Table structure for table `driver_routes`
--

CREATE TABLE `driver_routes` (
  `dr_id` int(8) NOT NULL,
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `d_id` int(8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_routes`
--

INSERT INTO `driver_routes` (`dr_id`, `book_id`, `d_id`, `latitude`, `longitude`, `timestamp`) VALUES
(1, 00000012, 2, 55.36256224, -0.25485659, '2025-02-17 18:41:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `driver_routes`
--
ALTER TABLE `driver_routes`
  ADD PRIMARY KEY (`dr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driver_routes`
--
ALTER TABLE `driver_routes`
  MODIFY `dr_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
