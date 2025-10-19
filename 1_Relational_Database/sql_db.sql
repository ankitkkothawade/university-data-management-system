-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: devweb2024.cis.strath.ac.uk:3306
-- Generation Time: Apr 01, 2025 at 11:44 AM
-- Server version: 8.0.41-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cyb24210`
--

-- --------------------------------------------------------

--
-- Table structure for table `academicemployee`
--

CREATE TABLE `academicemployee` (
  `employee_id` int NOT NULL,
  `academic_role` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `academicemployee`
--

INSERT INTO `academicemployee` (`employee_id`, `academic_role`) VALUES
(101, 'Professor'),
(102, 'Senior Lecturer'),
(103, 'Assistant Professor'),
(104, 'Lecturer');

-- --------------------------------------------------------

--
-- Table structure for table `adminemployee`
--

CREATE TABLE `adminemployee` (
  `employee_id` int NOT NULL,
  `admin_role` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adminemployee`
--

INSERT INTO `adminemployee` (`employee_id`, `admin_role`) VALUES
(103, 'Department Head'),
(104, 'Administrator'),
(105, 'HR Manager');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `course_type` enum('undergrad','postgrad') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_type`) VALUES
(1, 'BSc Computer Science', 'undergrad'),
(2, 'BSc Information Technology', 'undergrad'),
(3, 'MSc Data Science', 'postgrad'),
(4, 'MSc Software Engineering', 'postgrad'),
(5, 'MSc Cybersecurity', 'postgrad');

-- --------------------------------------------------------

--
-- Table structure for table `course_module`
--

CREATE TABLE `course_module` (
  `course_id` int NOT NULL,
  `module_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_module`
--

INSERT INTO `course_module` (`course_id`, `module_id`) VALUES
(1, 'CS101'),
(2, 'CS102'),
(3, 'CS103'),
(4, 'CS104'),
(5, 'CS105');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `office_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `office_id`) VALUES
(101, 'Keith Smith', 1),
(102, 'Abdul Salam Kalaji', 2),
(103, 'Yashar Moshfeghi', 3),
(104, 'Feng Dong', 4),
(105, 'Zakia Majid', 5);

-- --------------------------------------------------------

--
-- Table structure for table `employee_office`
--

CREATE TABLE `employee_office` (
  `employee_id` int NOT NULL,
  `office_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee_office`
--

INSERT INTO `employee_office` (`employee_id`, `office_id`) VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5);

-- --------------------------------------------------------

--
-- Table structure for table `exam_record`
--

CREATE TABLE `exam_record` (
  `exam_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `module_id` varchar(10) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `mark` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `exam_record`
--

INSERT INTO `exam_record` (`exam_id`, `student_id`, `module_id`, `semester`, `year`, `mark`) VALUES
(1, 201, 'CS101', 1, 2024, 85),
(2, 202, 'CS102', 1, 2024, 78),
(3, 203, 'CS103', 2, 2024, 92),
(4, 204, 'CS104', 2, 2024, 65),
(5, 205, 'CS105', 1, 2024, 55);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` varchar(10) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `credit` int DEFAULT NULL,
  `is_compulsory` tinyint(1) DEFAULT NULL
) ;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `module_name`, `credit`, `is_compulsory`) VALUES
('CS101', 'Introduction to Programming', 10, 1),
('CS102', 'Database Systems', 20, 1),
('CS103', 'AI For Finance', 10, 0),
('CS104', 'Machine Learning', 20, 0),
('CS105', 'Project', 60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_lecturer`
--

CREATE TABLE `module_lecturer` (
  `module_id` varchar(10) NOT NULL,
  `academic_employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `module_lecturer`
--

INSERT INTO `module_lecturer` (`module_id`, `academic_employee_id`) VALUES
('CS101', 101),
('CS102', 102),
('CS103', 103),
('CS105', 103),
('CS104', 104);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` int NOT NULL,
  `office_location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`office_id`, `office_location`) VALUES
(1, 'Livingstone Tower - Room 101'),
(2, 'Graham Hills Building - Room 202'),
(3, 'Cathedral Street Wing - Room 303'),
(4, 'Library - Room 404'),
(5, 'James Weir - Room 505');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `supervisor_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `course_id`, `supervisor_id`) VALUES
(201, 'Ankit', 1, 101),
(202, 'Paresh', 2, 102),
(203, 'Roshan', 3, 103),
(204, 'Himanshu', 4, 104),
(205, 'Krunal', 5, 103);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academicemployee`
--
ALTER TABLE `academicemployee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `adminemployee`
--
ALTER TABLE `adminemployee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course_module`
--
ALTER TABLE `course_module`
  ADD PRIMARY KEY (`course_id`,`module_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `office_id` (`office_id`);

--
-- Indexes for table `employee_office`
--
ALTER TABLE `employee_office`
  ADD PRIMARY KEY (`employee_id`,`office_id`),
  ADD KEY `office_id` (`office_id`);

--
-- Indexes for table `exam_record`
--
ALTER TABLE `exam_record`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `module_lecturer`
--
ALTER TABLE `module_lecturer`
  ADD PRIMARY KEY (`module_id`,`academic_employee_id`),
  ADD KEY `academic_employee_id` (`academic_employee_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam_record`
--
ALTER TABLE `exam_record`
  MODIFY `exam_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academicemployee`
--
ALTER TABLE `academicemployee`
  ADD CONSTRAINT `academicemployee_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `adminemployee`
--
ALTER TABLE `adminemployee`
  ADD CONSTRAINT `adminemployee_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `course_module`
--
ALTER TABLE `course_module`
  ADD CONSTRAINT `course_module_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `course_module_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`);

--
-- Constraints for table `employee_office`
--
ALTER TABLE `employee_office`
  ADD CONSTRAINT `employee_office_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `employee_office_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`);

--
-- Constraints for table `exam_record`
--
ALTER TABLE `exam_record`
  ADD CONSTRAINT `exam_record_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `exam_record_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`);

--
-- Constraints for table `module_lecturer`
--
ALTER TABLE `module_lecturer`
  ADD CONSTRAINT `module_lecturer_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  ADD CONSTRAINT `module_lecturer_ibfk_2` FOREIGN KEY (`academic_employee_id`) REFERENCES `academicemployee` (`employee_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`supervisor_id`) REFERENCES `academicemployee` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
