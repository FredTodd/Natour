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
-- Database: 'sd2-db'
--

-- --------------------------------------------------------

--
-- Table structures
--

CREATE TABLE 'User_Info' (
  'Customer_ID' int NOT NULL,
  'Name' varchar(512) NOT NULL,
  'Email' varchar(512) NOT NULL,
  'P_number' int NOT NULL,
  'Address' varchar(512) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE 'Packages' (
  'Package_ID' int NOT NULL,
  'Name' varchar(512) NOT NULL,
  'Desc' varchar(512) NOT NULL,
  'Price' int NOT NULL,
  'Destination' varchar(512) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE 'Payment' (
  'Payment_ID' int NOT NULL,
  'Booking_ID' int NOT NULL,
  'Date' Date NOT NULL,
  'Method' varchar(512) NOT NULL,
  'Amount' int NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE 'Bookings' (
  'Booking_ID' int NOT NULL,
  'Customer_ID' int NOT NULL,
  'Package_ID' int NOT NULL,
  'Booking_date' Date NOT NULL,
  'Guest_no' int NOT NULL,
  'Price' int NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE 'Reviews' (
  'Review_ID' int NOT NULL,
  'Customer_ID' int NOT NULL,
  'Booking_ID' int NOT NULL,
  'Rating' int NOT NULL,
  'Review' varchar(800) NOT NULL,
  'Date' Date NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE 'Employees' (
  'Employee_ID' int NOT NULL,
  'Name' varchar(512) NOT NULL,
  'Role' varchar(512) NOT NULL,
  'Email' varchar(512) NOT NULL,
  'P_number' int NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for tables
--

INSERT INTO 'User_Info' ('Customer_ID', 'Name', 'Email', 'P_number', 'Address') VALUES
(8594033, 'Liam', 'Liam@gmail.com', 07973646703, '32 Pigeon Avenue WA7 5JT'),
(5994825, 'Sasha', 'Sasha@hotmail.com', 01313570121, '4 Union St LA1 7HR'),
(3844713, 'Henry', 'Henry@hotmail.com', 07319727246, '66 High Street BN2 1RP'),
(4893321, 'Ella', 'Ella@gmail.com', 07894473186, '84 Downend Rd BS1 5UE'),
(4058721, 'Taya', 'Taya@hotmail.com', 01582764439, '18 Southdown Rd AL4 1PR'),
(1849902, 'Adam', 'Adam@hotmail.com', 07921489557, '44 Station Rd TR7 1RE');

INSERT INTO 'Packages' ('Package_ID', 'Name', 'Desc', 'Price', 'Destination') VALUES
(00026, 'Safari Expedition in Serengeti', 'Embark on an exhilarating safari adventure through the vast plains of the Serengeti. Witness the awe-inspiring migration of wildebeests and zebras, encounter majestic lions, and marvel at the breathtaking landscapes of the African savannah. This expedition offers guided game drives, luxurious tented accommodations, and a chance to immerse yourself in the rich Maasai culture.', 1800, 'Serengeti National Park, Tanzania'),
(00027, 'Cultural Odyssey in Kyoto', 'Immerse yourself in the rich history and vibrant culture of Japans ancient capital, Kyoto. Explore magnificent temples, stroll through traditional gardens, and participate in tea ceremonies steeped in tradition. This cultural odyssey offers a unique glimpse into Japans past and present, with opportunities to learn from local artisans and experience the beauty of Japanese hospitality.', 2000, 'Kyoto, Japan'),
(00028, 'Island Paradise in Santorini', 'Indulge in the ultimate island getaway amidst the stunning beauty of Santorini. Relax on pristine beaches, soak in panoramic views of the Aegean Sea, and wander through charming villages with whitewashed buildings and blue-domed churches. With luxurious accommodations, exquisite cuisine, and breathtaking sunsets, this escape promises unforgettable moments of bliss and relaxation.', 1400, 'Santorini, Greece');

INSERT INTO 'Payment' ('Payment_ID', 'Booking_ID', 'Date', 'Method', 'Amount') VALUES
(00382, 599403, '2024-06-18', 'Credit Card', 4000),
(00744, 889304, '2024-09-04', 'Bank Transfer', 3600),
(00269, 504495, '2025-01-22', 'Credit Card', 4200);

INSERT INTO 'Bookings' ('Booking_ID', 'Customer_ID', 'Package_ID', 'Booking_date', 'Guest_no', 'Price') VALUES
(599403, 8594033, 00027, '2024-03-14', 2, 4000),
(889304, 5994825, 00026, '2024-02-07', 2, 3600),
(504495, 3844713, 00028, '2024-02-01', 3, 4200),
(783361, 4893321, 00025, '2022-07-21', 1, 1900),
(294013, 4058721, 00023, '2022-10-16', 2, 3800),
(657831, 1849902, 00028, '2021-06-27', 2, 2800);

INSERT INTO 'Reviews' ('Review_ID', 'Customer_ID', 'Booking_ID', 'Rating', 'Review', 'Date') VALUES
(104, 4893321, 783361, 8,'"After my beach retreat in Maui with the travel agency, I am still mesmerized by the beauty of the Hawaii paradise. The beaches were pristine, the sunsets unforgettable, and the hospitality warm. It was the perfect escape, and I cant wait to go back!"' , '2022-08-10'),
(122, 4058721, 294013, 9,'"Following my adventure in the Swiss Alps with the travel agency, Im still buzzing with excitement! The breathtaking views, crisp mountain air, and thrilling activities made for an unforgettable trip. Cant wait to return for more adrenaline-pumping fun!"' , '2022-11-03'),
(146, 1849902, 657831, 9,'"After my getaway in Santorini with the travel agency, Im still dreaming of its enchanting beauty! The whitewashed buildings, stunning sunsets, and crystal-clear waters created a magical atmosphere. It was the perfect romantic escape, and Im already planning my return trip!"' , '2021-07-13');

INSERT INTO 'Employees' ('Employee_ID', 'Name', 'Role', 'Email', 'P_number') VALUES
(19032, 'Charlie', 'Marketing Specialist', 'Charlie@gmail.com', 07582733982),
(19032, 'Megan', 'Travel Consultant', 'Megan@outlook.com', 07974744823),
(19032, 'Amelie', 'Customer Support', 'Amelie@gmail.com', 01582588402);

--
-- Indexes for dumped tables
--

--
-- Indexes for tables
--
ALTER TABLE 'User_Info'
  ADD PRIMARY KEY ('Customer_ID');

ALTER TABLE 'Packages'
  ADD PRIMARY KEY ('Package_ID');

ALTER TABLE 'Payment'
  ADD PRIMARY KEY ('Payment_ID'),
  ADD FOREIGN KEY ('Booking_ID') REFERENCES 'Bookings'('Booking_ID');

ALTER TABLE 'Bookings'
  ADD PRIMARY KEY ('Booking_ID'),
  ADD FOREIGN KEY ('Customer_ID') REFERENCES 'User_Info'('Customer_ID'),
  ADD FOREIGN KEY ('Package_ID') REFERENCES 'Packages'('Package_ID');

ALTER TABLE 'Reviews'
  ADD PRIMARY KEY ('Review_ID'),
  ADD FOREIGN KEY ('Customer_ID') REFERENCES 'User_Info'('Customer_ID'),
  ADD FOREIGN KEY ('Booking_ID') REFERENCES 'Bookings'('Booking_ID');

ALTER TABLE 'Employees'
  ADD PRIMARY KEY ('Employee_ID');

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for tables
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
