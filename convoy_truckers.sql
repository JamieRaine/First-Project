-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2015 at 11:39 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `convoy_truckers`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `Booking_Ref` varchar(30) NOT NULL,
  `Date_From` date NOT NULL,
  `Date_To` date NOT NULL,
  `Driver_Required` varchar(5) NOT NULL,
  `Additional_Details` text NOT NULL,
  `Driver_ID` varchar(30) NOT NULL,
  `Customer_ID` varchar(30) NOT NULL,
  `Vehicle_ID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`Booking_Ref`, `Date_From`, `Date_To`, `Driver_Required`, `Additional_Details`, `Driver_ID`, `Customer_ID`, `Vehicle_ID`) VALUES
('QWERTY', '2015-12-11', '2015-12-13', 'Yes', 'N/A', 'A123', '123C', '151D1');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_ID` varchar(30) NOT NULL,
  `Customer_Name` varchar(30) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone_Number` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Customer_Name`, `Address`, `Email`, `Phone_Number`) VALUES
('123A', 'Michael', 'Galway', 'Michael@gmail.com', 874102987),
('123B', 'Chris', 'Ballinrobe', 'Chris@gmail.com', 876598023),
('123C', 'Liam', 'Dublin', 'Liam@gmail.com', 874895810),
('123D', 'Danny Higgins', 'The Neale', 'Danny@gmail.com', 875482008);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `Driver_ID` varchar(30) NOT NULL,
  `Driver_Name` varchar(30) NOT NULL,
  `Phone_Number` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`Driver_ID`, `Driver_Name`, `Phone_Number`) VALUES
('A123', 'Adam', 875468902),
('B123', 'Brian', 879565872),
('C123', 'Carl', 872135802),
('D123', 'Daniel', 895647801);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `Payment_Ref` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Amount_Due` double(13,2) NOT NULL,
  `Payment_Method` varchar(50) NOT NULL,
  `Booking_Ref` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Payment_Ref`, `Date`, `Amount_Due`, `Payment_Method`, `Booking_Ref`) VALUES
('ASD', '2015-12-13', 600.00, 'Visa', 'QWERTY');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `Vehicle_ID` varchar(30) NOT NULL,
  `Current_Mileage` int(10) NOT NULL,
  `Cost_Per_Day` decimal(13,2) NOT NULL,
  `Driver_ID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vehicle_ID`, `Current_Mileage`, `Cost_Per_Day`, `Driver_ID`) VALUES
('11G5489', 35000, '100.00', 'D123'),
('12SO8976', 1000, '100.00', 'B123'),
('132MO785', 14000, '150.00', 'C123'),
('151D1', 100, '200.00', 'A123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`Booking_Ref`),
  ADD KEY `Driver_ID` (`Driver_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Vehicle_ID` (`Vehicle_ID`),
  ADD KEY `Booking_Ref` (`Booking_Ref`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`Driver_ID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Payment_Ref`),
  ADD KEY `Booking_Ref` (`Booking_Ref`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_ID`),
  ADD KEY `Driver_ID` (`Driver_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`Booking_Ref`) REFERENCES `bookings` (`Booking_Ref`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`Driver_ID`) REFERENCES `driver` (`Driver_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
