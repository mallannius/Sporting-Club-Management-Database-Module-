-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2015 at 04:35 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `riverside club`
--

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`Equipment Code`, `Equipment Name`, `Inspection Date`, `Inspection Time`, `Instructor ID`, `Report`, `Report Number`, `Repair Status`) VALUES
('E000455', 'Tennis court Net', '2015-11-17', '17:30:00', 'I0168', 'Net in Tennis court number 1 needs maintenance', 'R006844', 'Repaired');

--
-- Dumping data for table `facilities schedule`
--

INSERT INTO `facilities schedule` (`Facility Name`, `Date`, `Start Time`, `End Time`, `Member ID`, `Club ID`) VALUES
('Squash.room2', '2015-11-20', '13:00:00', '14:00:00', 54886657, NULL),
('Tennis.court1', '2015-11-20', '10:00:00', '11:00:00', 54886656, NULL);

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`Booking Reference`, `Instructor ID`, `Instructor Name`, `Facility Name`, `Member ID`, `Date`, `Start Time`, `End Time`) VALUES
('B000005831', 'I0168', 'Brenda Healy', 'Squash.room2', 54886657, '2015-11-20', '13:00:00', '14:00:00');

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`Member ID`, `Name`, `Date of Birth`, `Payment Method`, `Email`) VALUES
(54886656, 'Jack Walsh', '1992-08-01', 'cash', 'jackwalsh@yopmail.com'),
(54886657, 'helene Brown', '1995-09-25', 'payment by card', 'helen.brown@yopmail.com'),
(54886658, 'Patricia Walsh', '2000-05-18', 'cash', 'patriciawalsh@yopmail.com');

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Payment Reference`, `Member ID`, `Club ID`, `Payment Method`, `Amount`, `Payment Date`, `Annual Membership Renewal Date`) VALUES
('P0020288', 54886657, NULL, 'payment by card', 200, '2015-01-31', '2016-01-31'),
('P0020289', 54886658, NULL, 'Cash', 200, '2015-01-03', '2016-01-03'),
('P0020290', 54886656, NULL, 'Cash', 200, '2015-02-03', '2016-02-03'),
('P0020291', NULL, 'C015', 'payment by card', 500, '2015-06-30', NULL);

--
-- Dumping data for table `sporting associations`
--

INSERT INTO `sporting associations` (`Club ID`, `Club Name`, `Contact Details`, `Contact Person Name`) VALUES
('C015', 'Galway Sports Club', 871519785, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
