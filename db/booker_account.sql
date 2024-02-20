-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 07:08 PM
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
(4, 3, 9, 50, 'Unpaid', '2024-01-18 19:48:31'),
(5, 3, 10, 50, 'Unpaid', '2024-01-18 19:49:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booker_account`
--
ALTER TABLE `booker_account`
  ADD PRIMARY KEY (`acc_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booker_account`
--
ALTER TABLE `booker_account`
  MODIFY `acc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
