-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2024 at 02:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookId` int(13) NOT NULL,
  `bookName` varchar(200) NOT NULL,
  `synopsis` varchar(1000) NOT NULL,
  `rating` double(2,1) NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookId`, `bookName`, `synopsis`, `rating`, `image`) VALUES
(1, 'Harry Potter and the Philosopher\'s Stone', 'Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling\'s debut novel follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry. Harry makes close friends and a few enemies during his first year at the school.', 4.5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtFKRzqIPBTYkse7NKIPTjw0ggQB02c636StmC1mONyQwec4x1\r\n'),
(2, 'Finding Serendipity', 'When Tuesday McGillycuddy and her beloved dog, Baxterr, discover that Tuesday\'s mother―the famous author Serendipity Smith―has gone missing, they set out on a magical adventure. In their quest to find Serendipity, they discover the mysterious and unpredictable place that stories come from.', 5.0, 'https://books.google.com.sg/books/content?id=1QO09Ss6988C&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U0xDz7s7pwCLDWriiPdje7nSIBo1Q&w=1280'),
(3, 'Charlie and the Chocolate Factory', 'Charlie and the Chocolate Factory (1964) revolves around a poor boy, Charlie, who, despite his dire circumstances, maintains his moral compass in a world riddled with materialism as he embarks on a magical adventure inside an opulent chocolate factory.', 4.8, 'https://books.google.com.sg/books/content?id=_mNcEJiuigkC&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U3GENkR5S8WKDovjgAfCyU_I7LqPA&w=1280');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
