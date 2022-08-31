-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 26, 2022 at 05:32 AM
-- Server version: 5.7.39-0ubuntu0.18.04.2
-- PHP Version: 7.2.24-0ubuntu0.18.04.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_dustbin`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_image` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'Dry Waste', 'dry.jpeg', '2022-08-19 15:05:08', '2022-08-19 15:05:08'),
(2, 'Wet Waste', 'wet.jpg', '2022-08-25 12:38:01', '2022-08-25 12:38:01'),
(3, 'Packed Food', 'packed_food.jpeg', '2022-08-25 23:46:12', '2022-08-25 23:46:12'),
(4, 'Veg Waste', 'veg_food.jpeg', '2022-08-25 23:46:20', '2022-08-25 23:46:20'),
(6, 'Dairy Waste', 'dairy_waste.jpeg', '2022-08-25 23:47:35', '2022-08-25 23:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_activities`
--

CREATE TABLE `consumer_activities` (
  `id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `activity_title` varchar(256) NOT NULL,
  `activity_type` varchar(256) NOT NULL,
  `is_read` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consumer_activities`
--

INSERT INTO `consumer_activities` (`id`, `consumer_id`, `activity_title`, `activity_type`, `is_read`, `created_at`) VALUES
(2, 5, 'Order #15 has been booked', 'ALERT', 0, '2022-08-26 04:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_categories`
--

CREATE TABLE `consumer_categories` (
  `id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price_per_unit` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consumer_categories`
--

INSERT INTO `consumer_categories` (`id`, `consumer_id`, `category_id`, `price_per_unit`, `created_at`, `updated_at`) VALUES
(14, 5, 6, '100', '2022-08-26 02:38:15', '2022-08-26 02:00:54'),
(15, 5, 1, '100', '2022-08-26 02:38:18', '2022-08-26 02:00:54');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_notifications`
--

CREATE TABLE `consumer_notifications` (
  `id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `notification_title` varchar(256) NOT NULL,
  `notification_type` varchar(256) NOT NULL,
  `is_read` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consumer_notifications`
--

INSERT INTO `consumer_notifications` (`id`, `consumer_id`, `notification_title`, `notification_type`, `is_read`, `created_at`) VALUES
(2, 5, 'Dustbin 3 is offline ', 'ALERT', 0, '2022-08-26 04:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `consumer_tags`
--

CREATE TABLE `consumer_tags` (
  `id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consumer_tags`
--

INSERT INTO `consumer_tags` (`id`, `consumer_id`, `tag_id`) VALUES
(15, 4, 1),
(16, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `consumer_user`
--

CREATE TABLE `consumer_user` (
  `id` int(11) NOT NULL,
  `consumer_name` varchar(256) DEFAULT NULL,
  `consumer_phone` varchar(10) NOT NULL,
  `consumer_profile` varchar(256) DEFAULT NULL,
  `consumer_address` varchar(256) DEFAULT NULL,
  `estimated_waste_quantity` double NOT NULL DEFAULT '0',
  `waste_usages` varchar(256) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `otp` varchar(256) NOT NULL,
  `otp_expiry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consumer_user`
--

INSERT INTO `consumer_user` (`id`, `consumer_name`, `consumer_phone`, `consumer_profile`, `consumer_address`, `estimated_waste_quantity`, `waste_usages`, `lat`, `lng`, `otp`, `otp_expiry`, `token`, `created_at`, `updated_at`) VALUES
(5, 'Pradeep Bio Plant', '8888888888', NULL, 'Silhar, Aasam', 56, NULL, 24.7570608, 92.7900585, '1234', '2022-08-26 04:19:37', 'testtoken', '2022-08-26 01:59:41', '2022-08-26 02:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `dustbins`
--

CREATE TABLE `dustbins` (
  `id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `dustbin_name` varchar(256) NOT NULL,
  `category_id` int(11) NOT NULL,
  `total_capacity` double NOT NULL DEFAULT '50',
  `current_capacity` double NOT NULL DEFAULT '0',
  `current_depth` double NOT NULL DEFAULT '0',
  `dustbin_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dustbins`
--

INSERT INTO `dustbins` (`id`, `producer_id`, `dustbin_name`, `category_id`, `total_capacity`, `current_capacity`, `current_depth`, `dustbin_status`, `created_at`, `updated_at`) VALUES
(15, 2, 'NIT Silchar Hostel 8 Mess', 1, 50, 15.170000000000002, 0, 1, '2022-08-26 00:03:58', '2022-08-26 00:03:58'),
(17, 2, 'SIH nodal center', 6, 50, 32.9, 0, 1, '2022-08-26 01:29:08', '2022-08-26 01:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `dustbin_categories`
--

CREATE TABLE `dustbin_categories` (
  `id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `dustbin_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dustbin_contents`
--

CREATE TABLE `dustbin_contents` (
  `id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `dustbin_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `closing_quantity` double NOT NULL,
  `depth` double NOT NULL,
  `closing_depth` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dustbin_contents`
--

INSERT INTO `dustbin_contents` (`id`, `producer_id`, `dustbin_id`, `quantity`, `closing_quantity`, `depth`, `closing_depth`, `created_at`) VALUES
(26, 2, 15, 4.68, 4.68, 0, 0, '2022-08-19 00:05:40'),
(27, 2, 15, 4.95, 9.629999999999999, 0, 0, '2022-08-19 00:35:17'),
(28, 2, 15, 6.18, 15.81, 0, 0, '2022-08-20 00:35:19'),
(29, 2, 15, 1.79, 17.6, 0, 0, '2022-08-20 00:35:21'),
(30, 2, 15, 2.29, 19.89, 0, 0, '2022-08-21 00:35:24'),
(31, 2, 15, 1.8, 21.69, 0, 0, '2022-08-21 00:35:31'),
(32, 2, 15, 5.93, 27.62, 0, 0, '2022-08-22 00:35:45'),
(33, 2, 15, 6.64, 34.26, 0, 0, '2022-08-22 00:35:46'),
(34, 2, 15, 1.68, 35.94, 0, 0, '2022-08-23 00:40:16'),
(35, 2, 15, 3.96, 39.9, 0, 0, '2022-08-23 00:40:19'),
(36, 2, 15, 2.5, 42.4, 0, 0, '2022-08-24 00:41:59'),
(37, 2, 15, 3.49, 45.89, 0, 0, '2022-08-24 00:42:02'),
(38, 2, 15, 1.99, 1.99, 0, 0, '2022-08-25 00:43:03'),
(39, 2, 15, 4.58, 6.57, 0, 0, '2022-08-25 00:43:04'),
(40, 2, 15, 2.64, 9.21, 0, 0, '2022-08-26 00:43:06'),
(41, 2, 15, 5.96, 15.170000000000002, 0, 0, '2022-08-26 00:43:07'),
(42, 2, 17, 6.42, 6.42, 0, 0, '2022-08-22 01:30:38'),
(43, 2, 17, 3.34, 9.76, 0, 0, '2022-08-23 01:31:49'),
(44, 2, 17, 5.15, 14.91, 0, 0, '2022-08-24 01:31:51'),
(45, 2, 17, 5.95, 20.86, 0, 0, '2022-08-25 01:31:52'),
(46, 2, 17, 2.17, 23.03, 0, 0, '2022-08-22 01:31:55'),
(47, 2, 17, 5.29, 28.32, 0, 0, '2022-08-23 01:31:57'),
(48, 2, 17, 4.58, 32.9, 0, 0, '2022-08-26 01:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `dustbin_pickups`
--

CREATE TABLE `dustbin_pickups` (
  `id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `total_distance` double NOT NULL,
  `total_weight` double(10,0) NOT NULL,
  `total_location` int(11) NOT NULL,
  `total_dustbin` int(11) NOT NULL,
  `total_cost` double NOT NULL,
  `categories_name` varchar(256) NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dustbin_pickups`
--

INSERT INTO `dustbin_pickups` (`id`, `consumer_id`, `total_distance`, `total_weight`, `total_location`, `total_dustbin`, `total_cost`, `categories_name`, `time_from`, `time_to`, `pickup_date`, `pickup_status`, `created_at`, `updated_at`) VALUES
(2, 5, 10.82, 23, 2, 4, 256, 'Bio Gas, Fertilizers', '03:28:00', '10:27:00', '2022-08-25', 1, '2022-08-26 02:15:16', '2022-08-26 02:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `dustbin_predictions`
--

CREATE TABLE `dustbin_predictions` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `dustbin_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `predicted_weight` double NOT NULL,
  `predicted_depth` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dustbin_predictions`
--

INSERT INTO `dustbin_predictions` (`id`, `date`, `dustbin_id`, `category_id`, `predicted_weight`, `predicted_depth`, `created_at`, `updated_at`) VALUES
(1, '2022-08-26', 15, 1, 8.25, 0, '2022-08-26 02:04:14', '2022-08-26 02:04:14'),
(2, '2022-08-27', 15, 1, 7.67, 0, '2022-08-26 02:04:27', '2022-08-26 02:04:27'),
(3, '2022-08-28', 15, 1, 6.87, 0, '2022-08-26 02:04:45', '2022-08-26 02:04:45'),
(4, '2022-08-29', 15, 1, 7.44, 0, '2022-08-26 02:05:03', '2022-08-26 02:05:03'),
(5, '2022-08-30', 15, 1, 7.89, 0, '2022-08-26 02:05:15', '2022-08-26 02:05:15'),
(6, '2022-08-31', 15, 1, 8.43, 0, '2022-08-26 02:05:30', '2022-08-26 02:05:30'),
(7, '2022-09-01', 15, 1, 8.46, 0, '2022-08-26 02:05:59', '2022-08-26 02:05:59'),
(8, '2022-09-02', 15, 1, 7.98, 0, '2022-08-26 02:06:35', '2022-08-26 02:06:35'),
(9, '2022-08-26', 17, 6, 6.93, 0, '2022-08-26 02:07:22', '2022-08-26 02:07:22'),
(10, '2022-08-27', 17, 6, 7.2, 0, '2022-08-26 02:07:36', '2022-08-26 02:07:36'),
(11, '2022-08-28', 17, 6, 8.26, 0, '2022-08-26 02:07:52', '2022-08-26 02:07:52'),
(12, '2022-08-29', 17, 6, 9.1, 0, '2022-08-26 02:08:20', '2022-08-26 02:08:20'),
(13, '2022-08-30', 17, 6, 7.12, 0, '2022-08-26 02:08:41', '2022-08-26 02:08:41'),
(14, '2022-08-31', 17, 6, 6.8, 0, '2022-08-26 02:08:57', '2022-08-26 02:08:57'),
(15, '2022-09-01', 17, 6, 6.89, 0, '2022-08-26 02:09:11', '2022-08-26 02:09:11'),
(16, '2022-09-02', 17, 6, 7.55, 0, '2022-08-26 02:09:30', '2022-08-26 02:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_locations`
--

CREATE TABLE `pickup_locations` (
  `id` int(11) NOT NULL,
  `pickup_id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `dustbin_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `total_weight` double NOT NULL,
  `total_cost` double NOT NULL,
  `pickup_status` int(11) NOT NULL,
  `pickup_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pickup_locations`
--

INSERT INTO `pickup_locations` (`id`, `pickup_id`, `consumer_id`, `producer_id`, `dustbin_id`, `category_id`, `from_date`, `to_date`, `total_weight`, `total_cost`, `pickup_status`, `pickup_at`, `created_at`, `updated_at`) VALUES
(3, 2, 5, 2, 15, 1, '2022-08-25', '2022-08-25', 12.23, 98.98, 1, '2022-08-26 02:17:37', '2022-08-26 02:17:37', '2022-08-26 02:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `producer_activities`
--

CREATE TABLE `producer_activities` (
  `id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `activity_title` varchar(256) NOT NULL,
  `activity_type` varchar(256) NOT NULL,
  `is_read` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producer_activities`
--

INSERT INTO `producer_activities` (`id`, `producer_id`, `activity_title`, `activity_type`, `is_read`, `created_at`) VALUES
(2, 2, 'Bin has been emptied', 'ALERT', 0, '2022-08-26 04:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `producer_notifications`
--

CREATE TABLE `producer_notifications` (
  `id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `notification_title` varchar(256) NOT NULL,
  `notification_type` varchar(256) NOT NULL,
  `is_read` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producer_notifications`
--

INSERT INTO `producer_notifications` (`id`, `producer_id`, `notification_title`, `notification_type`, `is_read`, `created_at`) VALUES
(2, 2, 'Waste has been recycled', 'ALERT', 0, '2022-08-26 04:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `producer_user`
--

CREATE TABLE `producer_user` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `producer_profile` varchar(256) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `wallet_balance` double NOT NULL DEFAULT '0',
  `green_balance` double NOT NULL DEFAULT '0',
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `otp` varchar(5) NOT NULL,
  `otp_expiry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producer_user`
--

INSERT INTO `producer_user` (`id`, `name`, `phone`, `producer_profile`, `address`, `wallet_balance`, `green_balance`, `lat`, `lng`, `otp`, `otp_expiry`, `token`, `created_at`, `updated_at`) VALUES
(2, 'NIT Silchar Hostel Mess', '9999999999', NULL, 'NIT Silchar', 0, 0, 24.7570577, 92.7900619, '1234', '2022-08-26 04:32:16', 'testtoken', '2022-08-26 00:00:10', '2022-08-26 00:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(256) NOT NULL,
  `tag_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `tag_status`) VALUES
(1, 'Bio Gas', 1),
(2, 'Fertilizer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `dustbin_id` int(11) NOT NULL,
  `txn_title` varchar(256) NOT NULL,
  `txn_amount` double NOT NULL,
  `txn_type` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumer_activities`
--
ALTER TABLE `consumer_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumer_categories`
--
ALTER TABLE `consumer_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumer_notifications`
--
ALTER TABLE `consumer_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumer_tags`
--
ALTER TABLE `consumer_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumer_user`
--
ALTER TABLE `consumer_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dustbins`
--
ALTER TABLE `dustbins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dustbin_categories`
--
ALTER TABLE `dustbin_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dustbin_contents`
--
ALTER TABLE `dustbin_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dustbin_pickups`
--
ALTER TABLE `dustbin_pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dustbin_predictions`
--
ALTER TABLE `dustbin_predictions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producer_activities`
--
ALTER TABLE `producer_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producer_notifications`
--
ALTER TABLE `producer_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producer_user`
--
ALTER TABLE `producer_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `consumer_activities`
--
ALTER TABLE `consumer_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `consumer_categories`
--
ALTER TABLE `consumer_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `consumer_notifications`
--
ALTER TABLE `consumer_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `consumer_tags`
--
ALTER TABLE `consumer_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `consumer_user`
--
ALTER TABLE `consumer_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dustbins`
--
ALTER TABLE `dustbins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `dustbin_categories`
--
ALTER TABLE `dustbin_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dustbin_contents`
--
ALTER TABLE `dustbin_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `dustbin_pickups`
--
ALTER TABLE `dustbin_pickups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dustbin_predictions`
--
ALTER TABLE `dustbin_predictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `producer_activities`
--
ALTER TABLE `producer_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `producer_notifications`
--
ALTER TABLE `producer_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `producer_user`
--
ALTER TABLE `producer_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
