-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2016 at 12:31 AM
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
('0', '2016-01-13', '2016-01-14', 'Yes', '', 'A123', '123A', '11G5489'),
('ASDFGH', '2015-11-18', '2015-11-26', 'Yes', 'Wear a suit', 'B123', '123B', '12SO8976'),
('LMRTYJ', '2016-01-04', '2016-01-10', 'Yes', 'N/A', 'E123', '123E', '142OY21'),
('QWERTY', '2015-12-11', '2015-12-13', 'Yes', 'N/A', 'A123', '123C', '151D1'),
('UIOPJK', '2015-12-19', '2015-12-20', 'Yes', 'Arrive at 05:00am', 'D123', '123D', '11G5489'),
('ZXCVBN', '2016-01-08', '2016-01-11', 'Yes', 'N/A', 'C123', '123A', '132MO785');

-- --------------------------------------------------------

--
-- Stand-in structure for view `booking_details`
--
CREATE TABLE IF NOT EXISTS `booking_details` (
`Booking_Ref` varchar(30)
,`Driver_ID` varchar(30)
,`Customer_ID` varchar(30)
,`Vehicle_ID` varchar(30)
);

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
('123D', 'Daniel', 'The Neale', 'Danny@gmail.com', 875482008),
('123E', 'Jamie', 'Ballinrobe', 'Jamie@gmail.com', 879568014),
('123F', 'Frank', 'Derry', 'frank@gmail.com', 875421056),
('123G', 'Gary', 'Longford', 'gary@gmail.com', 874528904);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_information`
--
CREATE TABLE IF NOT EXISTS `customer_information` (
`customer_name` varchar(30)
,`address` varchar(100)
,`email` varchar(50)
,`phone_number` int(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `Driver_ID` varchar(30) NOT NULL,
  `Driver_Name` varchar(30) NOT NULL,
  `Phone_Number` int(15) NOT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`Driver_ID`, `Driver_Name`, `Phone_Number`, `Address`) VALUES
('A123', 'Adam', 875468902, NULL),
('B123', 'Brian', 879565872, NULL),
('C123', 'Carl', 872135802, NULL),
('D123', 'Daniel', 895647801, NULL),
('E123', 'Ethan', 875896523, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `drivers`
--
CREATE TABLE IF NOT EXISTS `drivers` (
`driver_name` varchar(30)
,`current_mileage` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `Payment_Ref` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Amount_Due` double(13,2) DEFAULT NULL,
  `Payment_Method` varchar(50) NOT NULL,
  `Booking_Ref` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Payment_Ref`, `Date`, `Amount_Due`, `Payment_Method`, `Booking_Ref`) VALUES
('ASD', '2015-12-13', 600.00, 'Cash', 'QWERTY'),
('BNM', '2015-12-20', 200.00, 'Cash', 'UIOPJK'),
('FGH', '2016-01-26', 800.00, 'Cash', 'ASDFGH'),
('GFT', '2016-01-13', NULL, 'Cash', '0'),
('JKL', '2016-01-11', 600.00, 'Mastercard', 'ZXCVBN'),
('TRY', '2016-01-10', 595.00, 'Visa', 'LMRTYJ');

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
('142OY21', 27500, '85.00', 'E123'),
('151D1', 100, '200.00', 'A123');

-- --------------------------------------------------------

--
-- Structure for view `booking_details`
--
DROP TABLE IF EXISTS `booking_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `booking_details` AS select `bookings`.`Booking_Ref` AS `Booking_Ref`,`bookings`.`Driver_ID` AS `Driver_ID`,`bookings`.`Customer_ID` AS `Customer_ID`,`bookings`.`Vehicle_ID` AS `Vehicle_ID` from `bookings`;

-- --------------------------------------------------------

--
-- Structure for view `customer_information`
--
DROP TABLE IF EXISTS `customer_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_information` AS select `customer`.`Customer_Name` AS `customer_name`,`customer`.`Address` AS `address`,`customer`.`Email` AS `email`,`customer`.`Phone_Number` AS `phone_number` from `customer`;

-- --------------------------------------------------------

--
-- Structure for view `drivers`
--
DROP TABLE IF EXISTS `drivers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `drivers` AS select `driver`.`Driver_Name` AS `driver_name`,`vehicle`.`Current_Mileage` AS `current_mileage` from (`driver` join `vehicle`) where (`driver`.`Driver_ID` = `vehicle`.`Driver_ID`);

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
  ADD KEY `Booking_Ref` (`Booking_Ref`),
  ADD KEY `Booking_Ref_2` (`Booking_Ref`);

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
