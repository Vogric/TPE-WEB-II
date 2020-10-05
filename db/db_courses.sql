-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 05, 2020 at 02:49 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_courses`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  `time_commitent` int(11) NOT NULL,
  `id_subject` int(11) NOT NULL,
  `difficulty` varchar(100) NOT NULL,
  `topics` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `duration`, `time_commitent`, `id_subject`, `difficulty`, `topics`) VALUES
(1, 'Pre-Programming', 11, 15, 1, 'Introductory', 'Programming basics - Concepts - Computational thinking'),
(2, 'Building your first Website', 12, 8, 1, 'Introductory', 'CSS - HTML - C++ - Javascript - SQL'),
(3, 'Interpersonal Skills at Work', 6, 11, 2, 'Intermediate', 'Communication - Problem Solving'),
(4, 'Front-End Frameworks', 10, 13, 1, 'Intermediate', 'Angular - React Native - Vue JS'),
(5, 'Quality Assurance Fundamentals', 8, 10, 1, 'Intermediate', 'Testing - Debugging - Mistakes solution'),
(6, 'First steps on Big Data', 7, 12, 3, 'Intermediate', 'Data Mining - Models - Analytics - Algorithms'),
(7, 'Introduction to Cloud Computing', 12, 12, 4, 'Introductory', 'Virtualization - Data segregation - Data recovery'),
(8, 'CyberSecurity for Begginers', 10, 7, 4, 'Introductory', 'Security technologies - Risk management - Attacks'),
(9, 'Thinking', 1, 1, 2, 'High', 'Contemplate'),
(10, 'PHP', 23, 18, 1, 'Extremely High', 'Obvious PHP'),
(11, 'Something else', 4, 40, 4, 'Low', 'Some other');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `title`) VALUES
(1, 'Programming'),
(2, 'Communication'),
(3, 'Data Science'),
(4, 'Computing');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(2, 'no@whe.re', '$2y$10$WE3ODugSNC14pzcYONZi9eXRa/i9vOn3iheAAvzeNP/enub/V98Iy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_id_subject` (`id_subject`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
