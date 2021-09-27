-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2021 at 06:13 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_db`
--
CREATE DATABASE IF NOT EXISTS `ecom_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecom_db`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, '1995'),
(2, '1994'),
(3, 'Hyung_Line'),
(5, '1997'),
(6, '1992'),
(7, '1993'),
(8, 'Vocal line'),
(9, 'Maknae Line'),
(10, 'Rap line'),
(12, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_amount` float NOT NULL,
  `order_transaction` varchar(255) NOT NULL,
  `order_currency` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `order_amount`, `order_transaction`, `order_currency`, `order_status`) VALUES
(29, '2020-10-13', 146.2, '4AC12', 'USA', 'Completed'),
(30, '2020-12-18', 345.2, '4582562', 'USA', 'Completed'),
(31, '2020-12-18', 345.2, '4582562', 'USA', 'Completed'),
(32, '2020-12-18', 345.2, '4582562', 'USA', 'Completed'),
(33, '2021-01-22', 91.47, '124A', 'USA', 'completed'),
(34, '2021-01-23', 54.08, '124AA', 'USA', 'completed'),
(35, '2021-01-26', 21.08, 'A787B', 'USA', 'complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_price` float NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `short_desc` text NOT NULL,
  `product_image` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_title`, `product_category_id`, `product_price`, `product_quantity`, `product_description`, `short_desc`, `product_image`) VALUES
(1, 'Chimmy Boucle pouch', 1, 23.59, 9, '100% Polyester\r\nBT21 is a globally beloved character of millennials created in collaboration with LINE FRIENDS and BTS\r\nCHIMMY Character: Passionate Puppy\r\nFor your Siesta, it will be perfect!\r\nProduct Dimension (MM): 250 (H) x 260 (L) x 270 (W) / Material: 100% Polyester\r\nOfficial LINE FRIENDS Goods and Merchandise from LINE FRIENDS', 'Product Dimension (MM): 250 (H) x 260 (L) x 270 (W) / Material: 100% Polyester', 'IMG_20190519_184955.jpg'),
(2, 'V stand Doll', 1, 30.49, 2, 'Different Level of Cuteness! Biggest lineup of BT21 BABY merchandise.<br> Cuteness Overload coming your way.BT21 BABY sitting doll. Cotton and bead stuffing inside to keep cute pose.', 'Cotton and bead stuffing inside to keep cute pose.', 'vday.jfif'),
(3, 'Jin with trophy', 3, 30.4933, 1, 'Different Level of Cuteness! Biggest lineup of BT21 BABY merchandise.<br> Cuteness Overload coming your way.BT21 BABY sitting doll.<br> Cotton and bead stuffing inside to keep cute pose.', 'Cotton and bead stuffing inside to keep cute pose.', 'CiVGfYiUYAEzvJ-.jfif'),
(4, 'V Sleep', 9, 30.49, 4, 'Different Level of Cuteness! Biggest lineup of BT21 BABY merchandise.<br> Cuteness Overload coming your way.BT21 BABY sitting doll. Cotton and bead stuffing inside to keep cute pose.', 'Cotton and bead stuffing inside to keep cute pose.', 'BTS-ON-Video-Thumb-1152x482.jpg'),
(21, 'RM ', 3, 100.24, 0, 'Like reading<br> IQ-148 <br>Leader of world\'s biggest boy band', 'My Boyfriend', 'IMG_20190518_103436.jpg'),
(22, 'J-hope', 3, 12.54, 5, 'Best Dancer Ever<br>  Sunshine <br> Happy pill <br>Hope World', 'My Man is hot as hell', 'IMG_20190505_180127.jpg'),
(23, 'Yoongi', 3, 100.25, 2, 'Min Yoon-gi (Korean: 민윤기; born March 9, 1993), better known by his stage names Suga (stylized as SUGA) and Agust D, is a South Korean rapper, songwriter, and record producer. <Br> Managed by Big Hit Entertainment, he debuted as a member of the South Korean pop idol group BTS in 2013.', 'Savage king and Mine', 'IMG_20190513_105601.jpg'),
(24, 'JungKook', 9, 100.451, 2, 'Jeon Jung-kook (Korean: 전정국; born September 1, 1997), better known mononymously as Jungkook, is a South Korean singer and songwriter. <br> He is the youngest member of and vocalist in the South Korean boy band BTS.', 'My Baby& Golden Maknae', 'IMG_20190519_233310.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `product_id`, `order_id`, `product_quantity`) VALUES
(16, 4, 29, 4),
(18, 3, 31, 1),
(20, 4, 31, 1),
(22, 2, 32, 1),
(23, 2, 33, 3),
(24, 1, 34, 1),
(25, 4, 34, 1),
(26, 21, 35, 1),
(27, 2, 35, 1),
(28, 1, 35, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `password`) VALUES
(1, 'rico', 'rico@hotmail.com', '701289'),
(4, 'JoenJK', 'jk@gmail.com', 'test123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `Constrain_Foreign_product_pcategory_id` (`product_category_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `Constrain_Foreign_reports_order_id` (`order_id`),
  ADD KEY `Constrain_Foreign_reports_product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Constrain_Foreign_product_pcategory_id` FOREIGN KEY (`product_category_id`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `Constrain_Foreign_reports_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Constrain_Foreign_reports_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;


