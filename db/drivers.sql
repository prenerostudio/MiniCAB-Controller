-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 01:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
  `pco_num` varchar(255) NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL,
  `acount_status` int(10) NOT NULL,
  `signup_type` tinyint(5) NOT NULL,
  `driver_reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `pco_num`, `latitude`, `longitude`, `status`, `acount_status`, `signup_type`, `driver_reg_date`) VALUES
(00000001, 'Azib Ali', 'eurodatatechnology@gmail.com', '+447552834179', 'asdf1234', 'London ', 'WJ1234', '669212c35f56b_booker_app.png', 'Male', 'English', 'Bermingham', '1234567', '', '', 'online', 1, 3, '0000-00-00 00:00:00'),
(00000002, 'Atiq Ramzan', 'admin@prenero.com', '+443157524000', '123456', '', 'W12', '', 'Male', 'English', 'Ireland', '', '', '', '', 1, 0, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`d_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
