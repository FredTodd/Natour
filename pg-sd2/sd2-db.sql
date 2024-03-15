-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 30, 2022 at 09:54 AM
-- Server version: 8.0.24
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sd2-db`
--

-- --------------------------------------------------------

--
-- Table structures
--

CREATE TABLE `User_Info` (
  `Customer_ID` int NOT NULL,
  `Name` varchar(512) NOT NULL,
  `Email` varchar(512) NOT NULL,
  `P_number` int NOT NULL,
  `Address` varchar(512) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Packages` (
  `Package_ID` int NOT NULL,
  `Name` varchar(512) NOT NULL,
  `Desc` varchar(512) NOT NULL,
  `Price` int NOT NULL,
  `Destination` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Payment` (
  `Payment_ID` int NOT NULL,
  `Booking_ID` int NOT NULL,
  `Date` Date NOT NULL,
  `Method` varchar(512) NOT NULL,
  `Amount` int NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Bookings` (
  `Booking_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Package_ID` int NOT NULL,
  `Booking_date` Date NOT NULL,
  `Guest_no` int NOT NULL,
  `Price` int NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Reviews` (
  `Review_ID` int NOT NULL,
  `Customer_ID` int NOT NULL,
  `Booking_ID` int NOT NULL,
  `Rating` int NOT NULL,
  `Review` varchar(800) NOT NULL,
  `Date` Date NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Employees` (
  `Employee_ID` int NOT NULL,
  `Name` varchar(512) NOT NULL
  `Role` varchar(512) NOT NULL
  `Email` varchar(512) NOT NULL
  `P_number` int NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for tables
--

INSERT INTO `User_Info` (`Customer_ID`, 'Name', 'Email', 'P_number', 'Address') VALUES
(8594033, 'Liam', 'Liam@gmail.com', 07973646703, '32 Pigeon Avenue WA7 5JT'),
(5994825, 'Sasha', 'Sasha@hotmail.com', 01313570121, '4 Union St LA1 7HR'),
(3844713, 'Henry', 'Henry@hotmail.com', 07319727246, '66 High Street BN2 1RP');

INSERT INTO `Packages` (`Package_ID`, `Name`, 'Desc', 'Price', 'Destination') VALUES

INSERT INTO `Payment` (`Payment_ID`, `Booking_ID`, 'Date', 'Method', 'Amount') VALUES

INSERT INTO `Bookings` (`Booking_ID`, `Customer_ID`, 'Package_ID', 'Booking_date', 'Guest_no', 'Price') VALUES

INSERT INTO `Reviews` (`Review_ID`, `Customer_ID`, 'Booking_ID', 'Rating', 'Review', 'Date') VALUES

INSERT INTO `Employees` (`Employee_ID`, `Name`, 'Role', 'Email', 'P_number') VALUES

--
-- Indexes for dumped tables
--

--
-- Indexes for tables
--
ALTER TABLE `User_Info`
  ADD PRIMARY KEY (`Customer_ID`);

ALTER TABLE `Packages`
  ADD PRIMARY KEY (`Package_ID`);

ALTER TABLE `Payment`
  ADD PRIMARY KEY (`Payment_ID`);
  ADD FOREIGN KEY ('Booking_ID') REFERENCES 'Bookings'('Booking_ID');

ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`Booking_ID`);
  ADD FOREIGN KEY ('Customer_ID') REFERENCES 'User_Info'('Customer_ID');
  ADD FOREIGN KEY ('Package_ID') REFERENCES 'Packages'('Package_ID');

ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`Review_ID`);
  ADD FOREIGN KEY ('Customer_ID') REFERENCES 'User_Info'('Customer_ID');
  ADD FOREIGN KEY ('Booking_ID') REFERENCES 'Bookings'('Booking_ID');

ALTER TABLE `Employees`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for tables
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
