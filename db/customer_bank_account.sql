-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2024 at 07:13 AM
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
-- Table structure for table `customer_bank_account`
--

CREATE TABLE `customer_bank_account` (
  `cb_ac_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(10) NOT NULL,
  `cb_account_title` varchar(255) NOT NULL,
  `cb_account_number` varchar(255) NOT NULL,
  `cb_bank_name` varchar(255) NOT NULL,
  `cb_date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_bank_account`
--

INSERT INTO `customer_bank_account` (`cb_ac_id`, `c_id`, `cb_account_title`, `cb_account_number`, `cb_bank_name`, `cb_date_added`) VALUES
(00000001, 1, 'Atiq Ramzan', '0417854256312', 'Meezan Bank', '2024-02-18 11:13:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_bank_account`
--
ALTER TABLE `customer_bank_account`
  ADD PRIMARY KEY (`cb_ac_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_bank_account`
--
ALTER TABLE `customer_bank_account`
  MODIFY `cb_ac_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
