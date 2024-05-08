-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2024 at 01:31 PM
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
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `b_type_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `c_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pickup` varchar(255) NOT NULL,
  `stops` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `passenger` tinyint(3) UNSIGNED NOT NULL,
  `pick_date` date NOT NULL,
  `pick_time` time NOT NULL,
  `journey_type` varchar(55) NOT NULL,
  `v_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `luggage` varchar(255) NOT NULL,
  `child_seat` varchar(255) NOT NULL,
  `flight_number` varchar(255) NOT NULL,
  `delay_time` time NOT NULL,
  `note` text NOT NULL,
  `journey_fare` int(11) NOT NULL,
  `journey_distance` int(11) NOT NULL,
  `booking_fee` int(11) NOT NULL,
  `car_parking` int(11) NOT NULL,
  `waiting` int(11) NOT NULL,
  `tolls` int(11) NOT NULL,
  `extra` int(11) NOT NULL,
  `booker_commission` int(10) NOT NULL,
  `booking_status` varchar(55) NOT NULL,
  `bid_status` tinyint(1) NOT NULL DEFAULT 0,
  `bid_time` datetime NOT NULL,
  `bid_note` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `book_add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `b_type_id`, `c_id`, `pickup`, `stops`, `destination`, `address`, `postal_code`, `passenger`, `pick_date`, `pick_time`, `journey_type`, `v_id`, `luggage`, `child_seat`, `flight_number`, `delay_time`, `note`, `journey_fare`, `journey_distance`, `booking_fee`, `car_parking`, `waiting`, `tolls`, `extra`, `booker_commission`, `booking_status`, `bid_status`, `bid_time`, `bid_note`, `payment_type`, `customer_name`, `customer_email`, `customer_phone`, `book_add_date`) VALUES
(00000001, 00000003, 00000002, 'Horley, Gatwick RH6 0NP', '', 'Longford TW6, UK', '', '', 0, '0000-00-00', '00:00:00', '', 00000005, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Cancelled', 1, '2024-05-05 06:17:42', '', '', '', '', '', '2024-02-25 07:33:18'),
(00000002, 00000003, 00000002, 'Eastwoodbury Cres, Southend-on-Sea SS2 6YF', '', 'Woolsington, Newcastle upon Tyne NE13 8BZ', '', '', 4, '2024-02-21', '00:47:29', '', 00000002, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Pending', 1, '2024-05-05 08:17:55', 'Bid Open for Limited Time', '', '', '', '', '2024-02-21 00:47:56'),
(00000003, 00000003, 00000002, 'Horley, Gatwick RH6 0NP', '', 'Manchester M90 1QX', '', '', 4, '2024-02-21', '08:26:08', '', 00000001, '', '', '', '00:00:00', '', 0, 367, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-21 08:26:26'),
(00000004, 00000003, 00000002, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore, Pakistan', '', '', 4, '2024-02-21', '00:00:00', '', 00000001, '', '', '', '00:00:00', '', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-21 22:39:40'),
(00000005, 00000003, 00000002, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore-Islamabad Motorway, Sabzazar Block E Sabzazar Housing Scheme Phase 1 & 2 Lahore, Pakistan', '', '', 4, '2024-02-21', '22:53:47', '', 00000001, '', '', '', '00:00:00', '', 950, 190, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 15:38:09'),
(00000006, 00000003, 00000002, 'Iqbal Cricket Stadium, New Civil Lines, Civil Lines, Faisalabad, Pakistan', '', 'Lahore City, Pakistan', '', '', 4, '2024-02-21', '11:02:00', '', 00000002, '', '', '', '00:00:00', '', 930, 186, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-22 18:04:29'),
(00000007, 00000003, 00000002, 'Horley, Gatwick RH6 0NP', '', 'Manchester M90 1QX', '', '', 4, '2024-02-22', '12:53:00', '', 00000001, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-22 00:54:22'),
(00000008, 00000003, 00000002, 'Horley, Gatwick RH6 0NP', '', 'Birmingham B26 3QJ', '', '', 4, '2024-02-22', '12:55:00', '', 00000002, '', '', '', '00:00:00', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-22 00:55:51'),
(00000009, 00000003, 00000002, 'Sargodha Road, Faisalabad, Pakistan', '', 'Jail Road, Civil Lines, Faisalabad, Pakistan', '', '', 4, '2024-02-22', '01:25:00', '', 00000002, '', '', '', '00:00:00', '', 0, 6, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-05-04 17:52:03'),
(00000010, 00000003, 00000003, 'Horley, Gatwick RH6 0NP', '', 'Longford TW6, UK', '', '', 4, '2024-02-24', '09:13:00', '', 00000002, '', '', '', '00:00:00', '', 325, 65, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-24 14:12:57'),
(00000011, 00000003, 00000002, 'Longford TW6, UK', '', 'Manchester M90 1QX', '', '', 7, '2024-02-24', '09:07:00', '', 00000006, '', '', '', '00:00:00', '', 1545, 309, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-24 21:08:02'),
(00000012, 00000003, 00000001, 'Jail Road', '', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '', '', '', '00:00:00', '', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 11:53:34'),
(00000013, 00000001, 00000001, 'Stansted Airport, Stansted, UK', '', 'London W2, UK', '', '', 1, '2024-02-25', '10:30:00', 'Return', 00000002, '1', 'Yes', 'Yrbv', '00:00:30', 'Meet inside', 1040, 69, 2, 3, 4, 5, 6, 0, 'Pending', 1, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 15:54:32'),
(00000014, 00000001, 00000001, 'Sunderland SR5, UK', '', 'Gf Wdn Fl Farnol House, Upperton Road, Eastbourne, UK', '', '', 2, '2024-02-03', '10:58:00', 'Return', 00000006, '1', '', '', '00:00:00', '', 8280, 552, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 15:56:28'),
(00000015, 00000002, 00000001, 'Winchester, UK', '', 'Fort William, UK', '', '', 2, '2024-02-26', '11:12:00', 'Return', 00000003, '', 'Yes', '', '00:00:00', '', 12555, 837, 2, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 16:13:38'),
(00000016, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 19:03:18'),
(00000017, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:26:00', '', 00000003, '2', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 19:26:45'),
(00000018, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:26:00', '', 00000003, '2', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 19:27:08'),
(00000019, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:28:00', '', 00000001, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 19:29:28'),
(00000020, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:31:00', '', 00000001, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 19:31:43'),
(00000021, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore City, Pakistan', '', '', 4, '2024-02-25', '07:38:00', '', 00000001, '1', '', '', '00:00:00', ' ', 920, 184, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 19:39:03'),
(00000022, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Lahore, Pakistan', '', '', 5, '2024-02-25', '07:41:00', '', 00000004, '4', '', '', '00:00:00', ' ', 915, 183, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 07:42:49'),
(00000023, 00000003, 00000003, 'C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', ' ', 'Horley, Gatwick RH6 0NP', '', '', 4, '2024-02-25', '07:45:00', '', 00000001, '1', '', '', '00:00:00', ' ', 0, 8, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-25 07:47:19'),
(00000024, 00000003, 00000003, 'Horley, Gatwick RH6 0NP', ' ', 'Manchester M90 1QX', '', '', 4, '2024-02-26', '12:28:00', '', 00000002, '1', '', '', '00:00:00', ' ', 0, 0, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-02-26 12:29:43'),
(00000025, 00000003, 00000003, 'Plot 140 G, Block G Model Town, Lahore, Punjab, Pakistan', '[]', 'Manchester M90 1QX', '', '', 4, '2024-03-19', '03:52:00', '', 00000002, '1', '', '', '00:00:00', ' ', 45, 9, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-19 08:51:46'),
(00000026, 00000003, 00000003, '27-Kacha, Jail Rd, behind Toyota Shaheen, Jinnah Town, Lahore, Punjab 54000, Pakistan', '[]', 'Airport Way, Luton LU2 9LY', '', '', 4, '2024-03-19', '03:55:00', '', 00000001, '1', '', '', '00:00:00', ' ', 40, 8, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-19 08:54:25'),
(00000027, 00000003, 00000003, 'Plot 140 G, Block G Model Town, Lahore, Punjab, Pakistan', '[Horley, Gatwick RH6 0NP, Longford TW6, UK, Nottingham Place, London W1U 5NY, UK]', 'Horley, Gatwick RH6 0NP', '', '', 4, '2024-03-20', '16:01:50', '', 00000001, '1', '', '', '00:00:00', ' ', 40, 8, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-19 21:01:19'),
(00000028, 00000003, 00000003, 'Plot 139 G, Block G Model Town, Lahore, Punjab, Pakistan', '[]', 'Lt. Col. Sheraz Ali Khan Shaheed Road, Phase 3 GECH Society, Lahore, Pakistan', '', '', 4, '2024-03-19', '04:25:00', '', 00000001, '1', '', '', '00:00:00', ' ', 9, 2, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-19 09:24:24'),
(00000029, 00000003, 00000003, 'Plot 140 G, Block G Model Town, Lahore, Punjab, Pakistan', '[]', 'Township Lahore, Pakistan', '', '', 4, '2024-03-19', '04:47:00', '', 00000002, '1', '', '', '00:00:00', ' ', 25, 5, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-19 21:46:28'),
(00000030, 00000003, 00000003, 'Plot 133 E, Block E Model Town, Lahore, Punjab, Pakistan', '[]', 'Shad Bagh, Lahore, Pakistan', '', '', 4, '2024-03-20', '10:24:00', '', 00000001, '1', '', '', '00:00:00', ' ', 85, 17, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-20 15:28:42'),
(00000031, 00000003, 00000003, 'Plot 139 G, Block G Model Town, Lahore, Punjab, Pakistan', '[Shadbagh Road, Shad Bagh, Lahore, Pakistan]', 'Liberty Market Gulberg III, Lahore, Pakistan', '', '', 4, '2024-03-20', '10:35:00', '', 00000001, '1', '', '', '00:00:00', ' ', 34, 7, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-20 15:37:25'),
(00000032, 00000003, 00000003, ' - C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', '[London W12, UK, London W14, UK, London W10, UK]', 'Longford TW6, UK', '', '', 5, '2024-03-20', '08:38:00', '', 00000004, '4', '', '', '00:00:00', ' ', 40, 8, 0, 0, 0, 0, 0, 0, 'Cancelled', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-20 08:41:03'),
(00000033, 00000003, 00000003, ' - C3RQ+PG, Rehman Pura Islam Nagar, Faisalabad, Punjab, Pakistan', '[Lahore, Pakistan, Lahore City, Pakistan]', 'Lahore, Pakistan', '', '', 4, '2024-03-20', '08:43:00', '', 00000002, '1', '', '', '00:00:00', ' ', 910, 182, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', '', '', '', '', '2024-03-20 20:45:02'),
(00000034, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', '', 'Personel', '', '', '', '2024-03-21 21:46:19'),
(00000035, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Pending', 0, '0000-00-00 00:00:00', 'Bid Time is about 3 hours', 'Personel', '', '', '', '2024-05-04 17:00:05'),
(00000036, 00000003, 00000003, ' - C3RJ 7QR, Islam Nagar Faisalabad, Punjab, Pakistan', '[]', 'Lahore City, Pakistan', '', '', 4, '2024-03-21', '11:17:00', '', 00000001, '1', '', '', '00:00:00', ' ', 0, 0, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', 'Personal', '', '', '', '2024-05-03 12:43:06'),
(00000037, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', 'Personel', '', '', '', '2024-05-04 17:53:01'),
(00000038, 00000003, 00000001, 'Jail Road', 'midway', 'General Bus Stand', '', '', 3, '2024-01-18', '07:43:00', '', 00000002, '2', '', '', '00:00:00', 'N/A', 500, 25, 0, 0, 0, 0, 0, 0, 'Booked', 0, '0000-00-00 00:00:00', '', 'Personel', 'Atiq Ramzan', 'admin@prenero.com', '+923157524000', '2024-05-02 16:48:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `idx_customer_id` (`c_id`),
  ADD KEY `idx_vehicle_id` (`v_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `clients` FOREIGN KEY (`c_id`) REFERENCES `clients` (`c_id`),
  ADD CONSTRAINT `vehicles` FOREIGN KEY (`v_id`) REFERENCES `vehicles` (`v_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
