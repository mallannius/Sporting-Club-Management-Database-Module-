

-- Codds Rules --

-- 
--
-- Rule 1 --

Select* from members;
-- 
--
-- Rule 2 --

-- Unambiguous query--


Select `Member ID`, `Payment Method` from members where `Member ID` = 54886656;
-- ambiguous query--

select `Payment Method` from members where `Payment Method`= 'cash';
-- 
--
-- Rule 3 --

-- Missing data is represented by 'NULL' values--

insert into payments( `Payment Reference`, `Club ID`, `Payment Method`, `Amount`, `Payment Date`) values ('P0020291', 'C015', 'payment by card', 500, 2015-06-30);
-- No 'NULL' values for primary keys --
Insert into members (name) values (‘Jessica Simpson’);
-- 
--
-- Rule 4 --

show tables;
-- 
--
-- Rule 5 --

-- Data Definition --


create table `sporting associations’ ( `Club ID’ varchar(4) NOT NULL DEFAULT ,
  `Club Name` varchar(30) DEFAULT NULL, `Contact Details` int(10) DEFAULT NULL );

-- View Definition --

create view details as SELECT `Member ID`, `Name` from members;
-- Data Manipulation --

insert into members values(54886656, 'Jack Walsh', '1992-08-01', 'cash', 'jackwalsh@yopmail.com');
-- Integrity Constraints --

ALTER TABLE `members`  ADD PRIMARY KEY (`Member ID`);

-- Transaction Boundaries --

commit;


-- 
--
-- Rule 6 --

-- View on a single table --

update details set `Name`= 'helene Brown' where `Name`= 'helen Brown';
-- 

select `Member ID`, `Name` from members;
-- View on two tables --

create view view1 as select  members.`Member ID`, `Amount` from members, payments where members.`Member ID` = payments.`Member ID`;
-- 

update view1 set `amount`= 300 , `Member ID`=54886660 where `amount`= 200 and `Member ID`= 54886656;
-- 
--
-- Rule 7 --

-- Updating multiple rows by a single command --
update payments set `Payment Method`= 'payment by card' where `Payment Method`='cash';
-- Updating two tables using a single command --

update `sporting associations`
 join `payments` on `sporting associations`.`Club ID`= payments.`Club ID` 
set `sporting associations`.`Club Name`='Galway Club' , payments.Amount=600 
where `sporting associations`.`Club ID`='C015';
-- 
--
-- Rule 9 --

Alter table `sporting associations` 
ADD `Contact Person Name` VARCHAR(30) NULL DEFAULT NULL AFTER `Contact Details`;

-- --------------------------------------------------------


-- Queries--


-- Create a database --
Create database riverside club;
-- --------------------------------------------------------

-- Create tables --
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
-- Table structure for table `sporting associations`
--

CREATE TABLE IF NOT EXISTS `sporting associations` (
  `Club ID` varchar(4) NOT NULL DEFAULT '',
  `Club Name` varchar(30) DEFAULT NULL,
  `Contact Details` int(10) DEFAULT NULL,
  `Contact Person Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


-- Inserting Data--

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

-- --------------------------------------------------------

--  views --

-- Stand-in structure for view `details`
--
CREATE TABLE IF NOT EXISTS `details` (
`Member ID` int(8)
,`Name` varchar(30)
);


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

-- Creating Indexes and adding primary keys--
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

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facilities schedule`
--
ALTER TABLE `facilities schedule`
  ADD CONSTRAINT `Foreign Key fk4` FOREIGN KEY (`Club ID`) REFERENCES `sporting associations` (`Club ID`),
  ADD CONSTRAINT `Foreign key fk3` FOREIGN KEY (`Member ID`) REFERENCES `members` (`Member ID`);


-- Setting Foreign Key Constraints --
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

-- --------------------------------------------------------


-- Updating Data --

INSERT INTO `riverside club`.`instructors` (`Booking Reference`, `Instructor ID`, `Instructor Name`, `Facility Name`, `Member ID`, `Date`, `Start Time`, `End Time`) VALUES ('B000005831', 'I0168', 'Brenda Healy', 'Squash.room2', '54886656', '2015-11-20', '13:00:00', '14:00:00');
UPDATE `riverside club`.`instructors` SET `Member ID` = '54886657' WHERE `instructors`.`Booking Reference` = 'B000005831' AND `instructors`.`Instructor ID` = 'I0168';

-- --------------------------------------------------------


-- Deleting Data --
Create user developer;
Drop user developer;

-- --------------------------------------------------------


-- selecting --

select * from members;






























