-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 12:32 PM
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
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `v_id` int(55) NOT NULL,
  `v_name` varchar(255) NOT NULL,
  `v_seat` varchar(255) NOT NULL,
  `v_bags` varchar(255) DEFAULT NULL,
  `v_wchair` varchar(255) DEFAULT NULL,
  `v_trailer` varchar(55) DEFAULT NULL,
  `v_booster` varchar(55) DEFAULT NULL,
  `v_baby` varchar(55) DEFAULT NULL,
  `v_pricing` varchar(55) NOT NULL,
  `v_img` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`v_id`, `v_name`, `v_seat`, `v_bags`, `v_wchair`, `v_trailer`, `v_booster`, `v_baby`, `v_pricing`, `v_img`, `date_added`) VALUES
(1, 'Saloon', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/toyota-prius.png', '2023-10-17 19:39:57'),
(2, 'Estate', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/hackney-carriage.png', '2023-10-17 19:39:57'),
(3, 'MPV\r\n', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Ford-Galaxy.png', '2023-10-17 19:39:57'),
(4, 'Large MPV', '5', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Skoda_Octavia.png', '2023-10-17 19:39:57'),
(5, 'Minibus', '6', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Ford-Crown-Victoria.png', '2023-10-17 19:39:57'),
(6, 'Executive', '7', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Ford-Mondeo.png', '2023-10-17 19:39:57'),
(7, 'Executive Minibus', '8', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Skoda-Superb.png', '2023-10-17 19:39:57'),
(8, '10 - 14 Passenger', '10-14', 'yes', 'yes', 'yes', 'yes', 'yes', '40', 'img/vehicles/Toyota-Camry.png', '2023-10-17 19:39:57'),
(9, '15 - 16 Passenger', '15-16', 'yes', 'yes', 'yes', 'yes', 'yes', '50', 'img/vehicles/Citroen-Berlingo.png', '2023-10-17 19:39:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
