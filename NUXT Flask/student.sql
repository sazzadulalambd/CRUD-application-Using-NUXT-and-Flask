-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2024 at 10:28 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `naynabco_crud_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `course`, `email`, `phone`) VALUES
(1, 'Sazzad', 'Science', 'sazzad.sua@gmail.com ', '01772994093'),
(2, 'Rafin', 'BBA', 'rafin@gmail.com', '01442994096'),
(3, 'John Doe', 'Computer Science', 'john.doe@example.com', '1234567890'),
(4, 'Amit Doe', 'Computer Science', 'amit.doe@example.com', '1234567890'),
(5, 'nafij Doe', 'Computer Science', 'nafij.doe@example.com', '1234567890'),
(7, 'sakib', 'akib', 'akib@gmail.com', 'akib'),
(8, 'wwww', 'extinctcoder', 'extinctcoder@gmail.com', 'extinctcoder'),
(9, 'shawon', 'shawon', 'shawon', 'shawon'),
(10, 'shawon', 'shawon', 'shawon', 'shawon'),
(11, 'shawon', 'shawon', 'shawon', 'shawon'),
(12, 'shawon', 'shawon', 'shawon', 'shawon'),
(13, 'admin', 'admin', 'admin', 'admin'),
(15, 'extinctcoder', 'sad', 'sdasd@gmail.com', 'asda'),
(16, 'suas', 'suas', 'suas@gmail.com', 'suas'),
(19, 'anopom', 'anopom', 'anopom@gmail.com', 'anopom'),
(20, 'alik', 'alik', 'alik@gmail.com', 'alik'),
(21, 'manik', 'manik', 'manik@gmail.com', 'manik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
