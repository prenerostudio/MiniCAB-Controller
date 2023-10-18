-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 01:26 PM
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
  `book_date` varchar(255) NOT NULL,
  `book_time` time NOT NULL,
  `journey_type` varchar(55) NOT NULL,
  `fare` int(11) NOT NULL,
  `payment_method` varchar(55) NOT NULL,
  `v_id` int(11) NOT NULL,
  `status` varchar(55) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `c_id`, `pickup`, `destination`, `passenger`, `luggage`, `note`, `book_date`, `book_time`, `journey_type`, `fare`, `payment_method`, `v_id`, `status`, `date_added`) VALUES
(1, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-11', '15:00:00', 'Economy', 8000, 'Bank Transfer', 0, 'Pending', '2023-10-10 05:55:48'),
(2, 1, 'Faisalabad', 'Lahore', 4, 'No', 'N/A', '2023-10-12', '18:06:00', 'Business', 12000, 'Cash', 0, 'Pending', '2023-10-10 05:56:36'),
(3, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-12', '17:05:00', 'Luxury', 6000, 'Bank Transfer', 0, 'Pending', '2023-10-10 05:57:54'),
(4, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'Be on time', '5:00 PM', '00:00:00', 'Business', 12000, 'Bank Transfer', 0, 'Pending', '0000-00-00 00:00:00'),
(5, 1, 'Faisalabad', 'Lahore', 2, 'Yes', 'N/A', '2023-10-07', '05:25:00', 'Luxury', 8000, 'Cash', 0, 'Pending', '2023-10-07 08:23:29'),
(7, 1, 'Faisalabad', 'Lahore', 4, 'Yes', 'N/A', '2023-10-26', '22:40:00', 'Business', 12000, 'Bank Tranfer', 0, 'Pending', '2023-10-11 12:39:10');

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
(1, 'Atiq Ramzan', 'hello@prenero.com', '+923157524000', 'b743c33627755c255938a992d3480cab', 'Faisalabad, Punjab, Pakistan.', '', '', '', '38000', 'Prenero Solutions', 'N/A', '33102-1457353-9', '2023-10-13 07:58:46'),
(2, 'Azib Ali', 'azib@gmail.com', '+4123456523', '', 'London', 'Male', 'English', '', '2J53', '', '', '', '2023-10-17 19:54:17'),
(3, 'Mahtab', 'Mahtab@prenero.com', '+923346452312', '', 'Faisalabad', 'Male', 'Urdu', '', '44000', '', '', '', '2023-10-17 19:55:19'),
(4, 'Ismail', 'ismail@prenero.com', '+4456896523', '$2y$10$VnYYMqxDHaWUCaZtGBfB9.ZCwv9bm1kYV36yt5Nl975xnpjgPaUhi', 'fsd', 'Male', 'Italian', 'img/clients/IMG_8567.JPG', '44000', 'Prenero', '', '3310214573539', '2023-10-18 16:22:15');

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
  `status` varchar(55) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`d_id`, `d_name`, `d_email`, `d_password`, `d_phone`, `d_address`, `d_pic`, `d_gender`, `d_language`, `v_id`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `skype_acount`, `d_remarks`, `latitude`, `longitude`, `status`, `reg_date`) VALUES
(1, 'Atiq Ramzan', 'hello@prenero.com', 'b743c33627755c255938a992d3480cab', '+923157524000', 'FSD ', '', '33102-1457353-9', '', 0, '', '', '', '', '', '', '51.52145727821898', '-0.12723122456155755', 'online', '2023-10-17 01:25:51'),
(2, 'Mahtab Mukhtar', 'nahtab@prenero.com', '25d55ad283aa400af464c76d713c07ad', '03241524624', 'Faisalabad, Punjab, Pakistan.', '', '33102-1457353-9', '', 0, '', '', '', '', '', '', '51.512474660272886', '-0.10759970050199483', 'online', '2023-10-10 04:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `driver_location`
--

CREATE TABLE `driver_location` (
  `loc_id` int(55) NOT NULL,
  `d_id` int(55) NOT NULL,
  `latitude` varchar(55) NOT NULL,
  `longitude` varchar(55) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_location`
--

INSERT INTO `driver_location` (`loc_id`, `d_id`, `latitude`, `longitude`, `date`) VALUES
(1, 1, '52.45252939561881', '-1.9322932108127906', '2023-10-14 08:50:00'),
(2, 1, '52.45252939561881', '-1.9322932108127906', '2023-10-14 08:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `fare` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `book_id`, `c_id`, `d_id`, `fare`, `note`, `status`, `date_added`) VALUES
(1, 1, 1, 1, '5000', 'N/A', 'Completed', '2023-10-07 06:28:54'),
(2, 1, 1, 2, '5000', 'N/A', 'Waiting', '2023-10-07 06:33:09'),
(3, 1, 1, 2, '5000', 'N/A', 'Waiting', '2023-10-11 12:22:39'),
(4, 1, 1, 2, '2500', 'N/A', 'Cancelled', '2023-10-11 12:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `lang_id` int(55) NOT NULL,
  `language` varchar(255) NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`lang_id`, `language`, `date_added`) VALUES
(1, 'English', '0000-00-00'),
(2, 'French', '0000-00-00'),
(3, 'Spanish', '0000-00-00'),
(4, 'German', '0000-00-00'),
(5, 'Portuguese', '0000-00-00'),
(6, 'Arabic', '0000-00-00'),
(7, 'Russian', '0000-00-00'),
(8, 'Japanese', '0000-00-00'),
(9, 'Italian', '0000-00-00'),
(10, 'Bengali', '0000-00-00'),
(11, 'Hindi', '0000-00-00'),
(12, 'Korean', '0000-00-00'),
(13, 'Greek', '0000-00-00'),
(14, 'Turkish', '0000-00-00'),
(15, 'Indonesian', '0000-00-00'),
(16, 'Danish', '0000-00-00'),
(17, 'Gujarati', '0000-00-00'),
(18, 'Finnish', '0000-00-00'),
(19, 'Dutch', '0000-00-00'),
(20, 'Tamil', '0000-00-00'),
(21, 'Hungarian', '0000-00-00'),
(22, 'Romanian', '0000-00-00'),
(23, 'Czech', '0000-00-00'),
(24, 'Urdu', '0000-00-00');

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
(1, 'admin@prenero.com', 'b743c33627755c255938a992d3480cab', '', 'Atiq', 'Ramzan', '+923157524000', 'Administrator', 'Faisalabad, Punjab, Pakistan', '33102-1457353-9', '2023-10-13 05:35:09');

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
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`v_id`, `v_desc`, `v_make`, `v_seat`, `v_bags`, `v_wchair`, `v_trailer`, `v_booster`, `v_baby`, `v_offer`, `v_extra`, `v_available`, `v_pricing`, `v_img`, `date_added`) VALUES
(1, 'Toyota Prius', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(2, 'Hackney carriage', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(3, 'Ford Galaxy', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(4, 'Škoda Octavia', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(5, 'Ford Crown Victoria', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(6, 'Ford Mondeo', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(7, 'Škoda Superb', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(8, 'Toyota Camry', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '40', '', '2023-10-17 19:39:57'),
(9, 'Citroen Berlingo', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(10, 'Mercedes C', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '250', '', '2023-10-17 19:39:57'),
(11, 'Nissan NV200', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(12, 'Volkswagen Touran', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '120', '', '2023-10-17 19:39:57'),
(13, 'Hansom cab', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(14, 'Toyota Crown', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(15, 'Toyota HiAce', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(16, 'BYD e6', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57'),
(17, 'Hyundai Ioniq', '', '4', 'yes', 'yes', 'yes', 'yes', 'yes', '', '', '', '50', '', '2023-10-17 19:39:57');

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
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`book_id`) USING BTREE;

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
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`) USING BTREE;

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`lang_id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `lang_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `v_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
