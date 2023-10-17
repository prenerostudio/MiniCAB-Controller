-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 07:50 AM
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
-- Database: `taxi_dispatch`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(55) NOT NULL,
  `bid_ride_id` int(55) NOT NULL,
  `driver_id` int(55) NOT NULL,
  `bid_amount` varchar(255) NOT NULL,
  `bid_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid_id`, `bid_ride_id`, `driver_id`, `bid_amount`, `bid_date`) VALUES
(1, 1, 1, '12000', '2023-10-14 08:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `bid_rides`
--

CREATE TABLE `bid_rides` (
  `bid_ride_id` int(55) NOT NULL,
  `ride_id` int(55) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bid_rides`
--

INSERT INTO `bid_rides` (`bid_ride_id`, `ride_id`, `status`, `date_added`) VALUES
(1, 4, 'Open', '2023-10-07 07:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(55) NOT NULL,
  `driver_id` int(55) NOT NULL,
  `cus_id` int(55) NOT NULL,
  `ride_id` int(55) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `driver_id`, `cus_id`, `ride_id`, `amount`, `note`, `status`, `date_added`) VALUES
(1, 1, 1, 1, '5000', 'N/A', 'Completed', '2023-10-07 06:28:54'),
(2, 1, 1, 2, '5000', 'N/A', 'Pending', '2023-10-07 06:33:09'),
(3, 1, 1, 3, '5000', 'N/A', 'Pending', '2023-10-11 12:22:39'),
(4, 1, 1, 4, '2500', 'N/A', 'Cancelled', '2023-10-11 12:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `c_id` int(55) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `c_email` varchar(255) NOT NULL,
  `c_phone` varchar(255) NOT NULL,
  `c_password` varchar(255) NOT NULL,
  `c_address` varchar(255) NOT NULL,
  `c_gender` varchar(55) NOT NULL,
  `c_language` varchar(55) NOT NULL,
  `c_pic` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `others` varchar(255) NOT NULL,
  `c_ni` varchar(255) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `company_name`, `others`, `c_ni`, `reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'b743c33627755c255938a992d3480cab', 'Faisalabad, Punjab, Pakistan.', '', '', '', '38000', 'Prenero Solutions', 'N/A', '33102-1457353-9', '2023-10-13 07:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `d_id` int(55) NOT NULL,
  `d_name` varchar(255) NOT NULL,
  `d_email` varchar(255) NOT NULL,
  `d_password` varchar(255) NOT NULL,
  `d_phone` varchar(255) NOT NULL,
  `d_address` varchar(255) NOT NULL,
  `d_pic` varchar(255) NOT NULL,
  `d_gender` varchar(55) NOT NULL,
  `d_language` varchar(55) NOT NULL,
  `v_id` int(55) NOT NULL,
  `d_licence` varchar(55) NOT NULL,
  `d_licence_exp` varchar(55) NOT NULL,
  `pco_licence` varchar(55) NOT NULL,
  `pco_exp` varchar(55) NOT NULL,
  `skype_acount` varchar(255) NOT NULL,
  `d_remarks` varchar(255) NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_password`, `d_phone`, `d_address`, `d_pic`, `d_gender`, `d_language`, `v_id`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `skype_acount`, `d_remarks`, `latitude`, `longitude`, `reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', 'b743c33627755c255938a992d3480cab', '+923157524000', 'FSD ', 'api-app.png', '33102-1457353-9', '', 0, '', '', '', '', '', '', '51.52145727821898', '-0.12723122456155755', '2023-10-13 08:13:48'),
(2, 'Mahtab Mukhtar', 'nahtab@prenero.com', '25d55ad283aa400af464c76d713c07ad', '03241524624', 'Faisalabad, Punjab, Pakistan.', '', '33102-1457353-9', '', 0, '', '', '', '', '', '', '51.512474660272886', '-0.10759970050199483', '2023-10-10 04:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `driver_location`
--

CREATE TABLE `driver_location` (
  `loc_id` int(55) NOT NULL,
  `driver_id` int(55) NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_location`
--

INSERT INTO `driver_location` (`loc_id`, `driver_id`, `latitude`, `longitude`, `date`) VALUES
(1, 1, '52.45252939561881', '-1.9322932108127906', '2023-10-14 08:50:00'),
(2, 1, '52.45252939561881', '-1.9322932108127906', '2023-10-14 08:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

CREATE TABLE `rides` (
  `ride_id` int(55) NOT NULL,
  `cus_id` int(55) NOT NULL,
  `pickup` varchar(255) NOT NULL,
  `dropoff` varchar(255) NOT NULL,
  `passenger` int(55) NOT NULL,
  `bagage` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `ride_date` varchar(255) NOT NULL,
  `ride_time` time NOT NULL,
  `car_type` varchar(55) NOT NULL,
  `amount` int(55) NOT NULL,
  `payment_method` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rides`
--

INSERT INTO `rides` (`ride_id`, `cus_id`, `pickup`, `dropoff`, `passenger`, `bagage`, `note`, `ride_date`, `ride_time`, `car_type`, `amount`, `payment_method`, `status`, `date_added`) VALUES
(1, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-11', '15:00:00', 'Economy', 8000, 'Bank Transfer', 'Pending', '2023-10-10 05:55:48'),
(2, 1, 'Faisalabad', 'Lahore', 4, 'No', 'N/A', '2023-10-12', '18:06:00', 'Business', 12000, 'Cash', 'Pending', '2023-10-10 05:56:36'),
(3, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-12', '17:05:00', 'Luxury', 6000, 'Bank Transfer', 'Pending', '2023-10-10 05:57:54'),
(4, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'Be on time', '5:00 PM', '00:00:00', 'Business', 12000, 'Bank Transfer', 'Pending', '0000-00-00 00:00:00'),
(5, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-07', '05:25:00', 'Luxury', 8000, 'Cash', 'Pending', '2023-10-07 08:23:29'),
(7, 1, 'Faisalabad', 'Lahore', 4, 'Yes', 'N/A', '2023-10-26', '22:40:00', 'Business', 12000, 'Bank Tranfer', 'Pending', '2023-10-11 12:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(55) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_pic` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `nid` varchar(255) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_pic`, `first_name`, `last_name`, `user_phone`, `designation`, `address`, `nid`, `reg_date`) VALUES
(1, 'admin@prenero.com', 'b743c33627755c255938a992d3480cab', '', 'Atiq', 'Ramzan', '+923157524000', 'Administrator', 'Faisalabad, Punjab, Pakistan', '33102-1457353-9', '2023-10-13 05:35:09'),
(2, 'saqib@prenero.com', '6266a', '', 'Atiq', 'Ramzan', '+923157524000', 'Administrator', 'Faisalabad, Punjab, Pakistan', '33102-1457353-9', '2023-10-14 08:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `v_id` int(55) NOT NULL,
  `v_desc` varchar(255) NOT NULL,
  `v_make` varchar(255) NOT NULL,
  `v_seat` varchar(255) NOT NULL,
  `v_bags` varchar(255) NOT NULL,
  `v_wchair` varchar(255) NOT NULL,
  `v_trailer` varchar(55) NOT NULL,
  `v_booster` varchar(55) NOT NULL,
  `v_baby` varchar(55) NOT NULL,
  `v_offer` varchar(55) NOT NULL,
  `v_extra` varchar(55) NOT NULL,
  `v_available` varchar(55) NOT NULL,
  `v_pricing` varchar(55) NOT NULL,
  `v_img` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`);

--
-- Indexes for table `bid_rides`
--
ALTER TABLE `bid_rides`
  ADD PRIMARY KEY (`bid_ride_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `driver_location`
--
ALTER TABLE `driver_location`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `rides`
--
ALTER TABLE `rides`
  ADD PRIMARY KEY (`ride_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bid_rides`
--
ALTER TABLE `bid_rides`
  MODIFY `bid_ride_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `d_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_location`
--
ALTER TABLE `driver_location`
  MODIFY `loc_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rides`
--
ALTER TABLE `rides`
  MODIFY `ride_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
