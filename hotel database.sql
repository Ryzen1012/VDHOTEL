-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2025 at 03:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `proof_of_payment` varchar(255) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `age` int(3) NOT NULL,
  `payment_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `full_name`, `email`, `proof_of_payment`, `check_in`, `check_out`, `age`, `payment_method`) VALUES
(20, 'ryzenguerrero', 'ryzenguerrero01012@gmail.com', 'uploads/asd.jpg', '2025-03-25', '2025-03-26', 20, 'bank'),
(21, 'dsa', 'dsa@gmail.com', 'uploads/asd.jpg', '2025-03-27', '2025-03-28', 20, 'bank'),
(22, 'asd', 'asd@gmail.com', 'uploads/asd.jpg', '2025-03-27', '2025-03-28', 13, 'bank'),
(23, 'asd', 'asd@gmail.com', 'uploads/asd.jpg', '2025-03-27', '2025-03-27', 17, 'bank'),
(24, 'asd', 'asd@gmail.com', 'uploads/asd.jpg', '2025-03-27', '2025-03-27', 20, 'bank'),
(25, 'ryzenguerrero', 'asd@gmail.com', 'uploads/asd.jpg', '2025-03-28', '2025-03-29', 20, 'bank'),
(26, 'asd', 'asd@gmail.com', 'uploads/asd.jpg', '2025-03-28', '2025-03-29', 100, 'e-wallet');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `message`, `submitted_at`) VALUES
(25, 'Ryzen Guerrero', 'ryzenguerrero01012@gmail.com', 'Hiiii :)', 'Helloo :)', '2025-03-25 09:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `full_name`, `email`, `address`, `dob`, `password`, `created_at`) VALUES
(37, 'Ryzen Guerrero', 'ryzenguerrero01012@gmail.com', '2007 H. Ventura St.', '2004-10-12', '$2y$10$Lsdlk4Ng1UPHRfwi5M.sHecxv9LRMWIGunq2//RuzOKFE4daKfyGq', '2025-03-25 09:27:47'),
(38, 'dsa', 'dsa@gmail.com', 'dsa', '4333-03-31', '$2y$10$oHhyFOuncM0n9RGRmdPhtulE37YZYp7omMWvRiumMlOwfwnNbnbQ2', '2025-03-27 12:57:51');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `features` text NOT NULL,
  `facilities` text NOT NULL,
  `guests` text NOT NULL,
  `status` enum('Available','Unavailable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `image`, `price`, `features`, `facilities`, `guests`, `status`) VALUES
(120, 'Family Haven', 'img/rooms/room2.jpg', 3000.00, '1 Double-size Bed, Bathroom, Air Condition (Hot & Cold), Room Safety, Wi-Fi, Dining', 'Pool, Elevator, Parking', '5 Adults, 4 Children', 'Available'),
(121, 'Ocean Breeze', 'img/rooms/room3.jpg', 4500.00, '1 Double-size Bed, Bathroom, Air Condition (Hot & Cold), Room Safety, Wi-Fi, Dining', 'Pool, Elevator, Parking', '5 Adults, 4 Children', 'Available'),
(122, 'Garden Escape', 'img/rooms/room5.jpg', 4200.00, '2 Queen-size Beds, 2 Bathrooms, Living Room, Garden View, Air Condition, Room Safety, Wi-Fi, Dining', 'Garden Access, Pool, Parking', '4 Adults, 3 Children', 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
