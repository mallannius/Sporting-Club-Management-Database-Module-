-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2015 at 04:31 PM
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

-- --------------------------------------------------------

--
-- Stand-in structure for view `details`
--
CREATE TABLE IF NOT EXISTS `details` (
`Member ID` int(8)
,`Name` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE IF NOT EXISTS `equipments` (
  `Equipment Code` varchar(7) NOT NULL,
  `Equipment Name` varchar(30) DEFAULT NULL,
  `Inspection Date` date NOT NULL,
  `Inspection Time` time NOT NULL,
  `Instructor ID` varchar(5) DEFAULT NULL,
  `Report` text,
  `Report Number` varchar(7) DEFAULT NULL,
  `Repair Status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`Equipment Code`, `Equipment Name`, `Inspection Date`, `Inspection Time`, `Instructor ID`, `Report`, `Report Number`, `Repair Status`) VALUES
('E000455', 'Tennis court Net', '2015-11-17', '17:30:00', 'I0168', 'Net in Tennis court number 1 needs maintenance', 'R006844', 'Repaired');

-- --------------------------------------------------------

--
-- Table structure for table `facilities schedule`
--

CREATE TABLE IF NOT EXISTS `facilities schedule` (
  `Facility Name` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Start Time` time NOT NULL,
  `End Time` time NOT NULL,
  `Member ID` int(8) DEFAULT NULL,
  `Club ID` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facilities schedule`
--

INSERT INTO `facilities schedule` (`Facility Name`, `Date`, `Start Time`, `End Time`, `Member ID`, `Club ID`) VALUES
('Squash.room2', '2015-11-20', '13:00:00', '14:00:00', 54886657, NULL),
('Tennis.court1', '2015-11-20', '10:00:00', '11:00:00', 54886656, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE IF NOT EXISTS `instructors` (
  `Booking Reference` varchar(10) NOT NULL,
  `Instructor ID` varchar(5) NOT NULL,
  `Instructor Name` varchar(30) DEFAULT NULL,
  `Facility Name` varchar(30) DEFAULT NULL,
  `Member ID` int(8) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Start Time` time DEFAULT NULL,
  `End Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`Booking Reference`, `Instructor ID`, `Instructor Name`, `Facility Name`, `Member ID`, `Date`, `Start Time`, `End Time`) VALUES
('B000005831', 'I0168', 'Brenda Healy', 'Squash.room2', 54886657, '2015-11-20', '13:00:00', '14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `Member ID` int(8) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Date of Birth` date DEFAULT NULL,
  `Payment Method` varchar(20) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`Member ID`, `Name`, `Date of Birth`, `Payment Method`, `Email`) VALUES
(54886656, 'Jack Walsh', '1992-08-01', 'cash', 'jackwalsh@yopmail.com'),
(54886657, 'helene Brown', '1995-09-25', 'payment by card', 'helen.brown@yopmail.com'),
(54886658, 'Patricia Walsh', '2000-05-18', 'cash', 'patriciawalsh@yopmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `Payment Reference` varchar(8) NOT NULL DEFAULT '',
  `Member ID` int(8) DEFAULT NULL,
  `Club ID` varchar(4) DEFAULT NULL,
  `Payment Method` varchar(20) DEFAULT NULL,
  `Amount` int(5) DEFAULT NULL,
  `Payment Date` date DEFAULT NULL,
  `Annual Membership Renewal Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Payment Reference`, `Member ID`, `Club ID`, `Payment Method`, `Amount`, `Payment Date`, `Annual Membership Renewal Date`) VALUES
('P0020288', 54886657, NULL, 'payment by card', 200, '2015-01-31', '2016-01-31'),
('P0020289', 54886658, NULL, 'Cash', 200, '2015-01-03', '2016-01-03'),
('P0020290', 54886656, NULL, 'Cash', 200, '2015-02-03', '2016-02-03'),
('P0020291', NULL, 'C015', 'payment by card', 500, '2015-06-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sporting associations`
--

CREATE TABLE IF NOT EXISTS `sporting associations` (
  `Club ID` varchar(4) NOT NULL DEFAULT '',
  `Club Name` varchar(30) DEFAULT NULL,
  `Contact Details` int(10) DEFAULT NULL,
  `Contact Person Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sporting associations`
--

INSERT INTO `sporting associations` (`Club ID`, `Club Name`, `Contact Details`, `Contact Person Name`) VALUES
('C015', 'Galway Sports Club', 871519785, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
--
CREATE TABLE IF NOT EXISTS `view1` (
`Member ID` int(8)
,`Amount` int(5)
);

-- --------------------------------------------------------

--
-- Structure for view `details`
--
DROP TABLE IF EXISTS `details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `details` AS select `members`.`Member ID` AS `Member ID`,`members`.`Name` AS `Name` from `members`;

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1` AS select `members`.`Member ID` AS `Member ID`,`payments`.`Amount` AS `Amount` from (`members` join `payments`) where (`members`.`Member ID` = `payments`.`Member ID`);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`Equipment Code`,`Inspection Date`,`Inspection Time`),
  ADD KEY `Instructor ID` (`Instructor ID`);

--
-- Indexes for table `facilities schedule`
--
ALTER TABLE `facilities schedule`
  ADD PRIMARY KEY (`Facility Name`,`Date`,`Start Time`,`End Time`),
  ADD KEY `Member ID` (`Member ID`),
  ADD KEY `Club ID` (`Club ID`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`Booking Reference`,`Instructor ID`),
  ADD KEY `Facility Name` (`Facility Name`),
  ADD KEY `Member ID` (`Member ID`),
  ADD KEY `Date` (`Date`),
  ADD KEY `Start Time` (`Start Time`),
  ADD KEY `End Time` (`End Time`),
  ADD KEY `Foreign Key fk6` (`Facility Name`,`Date`,`Start Time`,`End Time`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`Member ID`),
  ADD KEY `Payment Method` (`Payment Method`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Payment Reference`),
  ADD KEY `Member ID` (`Member ID`),
  ADD KEY `Club ID` (`Club ID`);

--
-- Indexes for table `sporting associations`
--
ALTER TABLE `sporting associations`
  ADD PRIMARY KEY (`Club ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facilities schedule`
--
ALTER TABLE `facilities schedule`
  ADD CONSTRAINT `Foreign Key fk4` FOREIGN KEY (`Club ID`) REFERENCES `sporting associations` (`Club ID`),
  ADD CONSTRAINT `Foreign key fk3` FOREIGN KEY (`Member ID`) REFERENCES `members` (`Member ID`);

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `Foreign Key fk6` FOREIGN KEY (`Facility Name`, `Date`, `Start Time`, `End Time`) REFERENCES `facilities schedule` (`Facility Name`, `Date`, `Start Time`, `End Time`),
  ADD CONSTRAINT `Foreign key fk5` FOREIGN KEY (`Member ID`) REFERENCES `members` (`Member ID`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `Foreign Key fk2` FOREIGN KEY (`Club ID`) REFERENCES `sporting associations` (`Club ID`),
  ADD CONSTRAINT `Foreign key fk1` FOREIGN KEY (`Member ID`) REFERENCES `members` (`Member ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
