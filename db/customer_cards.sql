-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2024 at 06:59 AM
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
-- Table structure for table `customer_cards`
--

CREATE TABLE `customer_cards` (
  `card_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `card_number` int(55) NOT NULL,
  `card_expiry` varchar(10) NOT NULL,
  `card_cvv` int(5) NOT NULL,
  `card_date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_cards`
--

INSERT INTO `customer_cards` (`card_id`, `c_id`, `card_name`, `card_number`, `card_expiry`, `card_cvv`, `card_date_add`) VALUES
(00000001, 1, 'Atiq Ramzan', 2147483647, '02-2024', 949, '2024-02-18 10:50:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_cards`
--
ALTER TABLE `customer_cards`
  ADD PRIMARY KEY (`card_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_cards`
--
ALTER TABLE `customer_cards`
  MODIFY `card_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
