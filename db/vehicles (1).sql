-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2023 at 12:33 PM
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
  `v_seat` int(55) NOT NULL,
  `v_airbags` int(55) DEFAULT 0,
  `v_wchair` int(55) DEFAULT 0,
  `v_babyseat` int(55) DEFAULT 0,
  `v_pricing` int(55) NOT NULL,
  `v_img` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`v_id`, `v_name`, `v_seat`, `v_airbags`, `v_wchair`, `v_babyseat`, `v_pricing`, `v_img`, `date_added`) VALUES
(1, 'Saloon', 4, 0, 0, 0, 50, 'toyota-prius.png', '2023-10-17 19:39:57'),
(2, 'Estate', 4, 1, 1, 0, 50, '658a97f8e42ab_GCBtN4taYAA6D9K.jpg', '2023-12-26 02:15:44'),
(3, 'MPV\r\n', 4, 0, 0, 0, 50, 'Ford-Galaxy.png', '2023-10-17 19:39:57'),
(4, 'Large MPV', 5, 0, 0, 0, 50, 'Skoda_Octavia.png', '2023-10-17 19:39:57'),
(5, 'Minibus', 6, 0, 0, 0, 50, 'Ford-Crown-Victoria.png', '2023-10-17 19:39:57'),
(6, 'Executive', 7, 0, 0, 0, 50, 'Ford-Mondeo.png', '2023-10-17 19:39:57'),
(7, 'Executive Minibus', 8, 0, 0, 0, 50, 'Skoda-Superb.png', '2023-10-17 19:39:57'),
(8, '10 - 14 Passenger', 10, 0, 0, 0, 40, 'Toyota-Camry.png', '2023-10-17 19:39:57'),
(9, '15 - 16 Passenger', 15, 0, 0, 0, 50, 'Citroen-Berlingo.png', '2023-10-17 19:39:57');

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
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
