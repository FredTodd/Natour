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


CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255)
);
INSERT INTO User (name, email, phone_number, address)
VALUES
    ('John Doe', 'john@example.com', '123-456-7890', '123 Main St, City, Country'),
    ('Jane Smith', 'jane@example.com', '987-654-3210', '456 Elm St, Town, Country'),
    ('Alice Johnson', 'alice@example.com', '555-123-4567', '789 Oak St, Village, Country');

CREATE TABLE Package (
    package_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    destination VARCHAR(100)
);

-- Insert some sample data
INSERT INTO Package (name, description, price, destination)
VALUES
    ('Family Vacation', 'Enjoy a fun-filled family vacation with activities for all ages.', 1500.00, 'Beach Resort'),
    ('Romantic Getaway', 'Escape with your loved one for a romantic retreat.', 1000.00, 'Mountain Lodge'),
    ('Adventure Tour', 'Experience thrilling adventures in exotic locations.', 800.00, 'Jungle Expedition');


CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    role VARCHAR(50)
);

INSERT INTO Employee (name, email, phone_number, role)
VALUES
    ('John Doe', 'john@example.com', '123-456-7890', 'Manager'),
    ('Jane Smith', 'jane@example.com', '987-654-3210', 'Sales Representative'),
    ('Alice Johnson', 'alice@example.com', '555-123-4567', 'Accountant');

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    package VARCHAR(100), -- Assuming "package" represents the type of booking package
    customer_id INT,
    booking_date DATE,
    guests INT,
    price DECIMAL(10, 2) -- Assuming price is in decimal format with 10 digits in total and 2 digits after the decimal point
);

INSERT INTO Booking (booking_id, package, customer_id, booking_date, guests, price)
VALUES
    (101, 'Family Vacation', 1, '2024-03-21', 4, 1500.00),
    (102, 'Romantic Getaway', 2, '2024-03-20', 2, 1000.00),
    (103, 'Adventure Tour', 3, '2024-03-19', 1, 800.00);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    payment_type VARCHAR(50),
    booking_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount DECIMAL(10, 2)
);

-- Insert some sample data
INSERT INTO Payment (payment_id, payment_type, booking_id, payment_date, payment_method, amount)
VALUES
    (1, 'Credit Card', 101, '2024-03-21', 'Visa', 150.00),
    (2, 'Cash', 102, '2024-03-20', 'Cash', 200.00),
    (3, 'Debit Card', 103, '2024-03-19', 'Mastercard', 100.50);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    booking_id INT,
    review TEXT,
    rating FLOAT,
    date DATE
);

-- Insert some sample data
INSERT INTO Reviews (review_id, booking_id, review, rating, date)
VALUES
    (1, 101, 'Great experience, loved the service!', 4.5, '2024-03-21'),
    (2, 102, 'Room was clean and comfortable.', 4.0, '2024-03-20'),
    (3, 103, 'Staff was friendly and helpful.', 5.0, '2024-03-19');