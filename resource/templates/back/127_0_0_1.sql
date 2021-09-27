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

-- --------------------------------------------------------

-- Database: `school`
--
CREATE DATABASE IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `school`;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `stuname` varchar(256) NOT NULL,
  `gender` char(1) NOT NULL,
  `course` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `stuname`, `gender`, `course`) VALUES
(1, 'Linn Latt', 'm', 'PF'),
(2, 'Jimin', 'm', 'Java'),
(3, 'NamJoon', 'm', 'PHP'),
(4, 'Tae Tae', 'm', 'PF'),
(5, 'Jihyo', 'f', 'Java'),
(6, 'Jisoo', 'f', 'PHP'),
(7, 'IU', 'f', 'PF'),
(8, 'JungKook', 'm', 'Java'),
(9, 'SoekJin', 'm', 'PHP'),
(10, 'Yoongi', 'm', 'Java'),
(11, 'Hoseok', 'm', 'PHP'),
(12, 'YoenJun', 'm', 'Java'),
(13, 'Soobin', 'm', 'PF'),
(14, 'Huening kai', 'm', 'PHP'),
(15, 'Beogum', 'm', 'PHP'),
(16, 'Taehyun', 'm', 'Java'),
(17, 'Jessi', 'f', 'Java'),
(18, 'Hwasa', 'f', 'PF');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `uploadimg`
--
CREATE DATABASE IF NOT EXISTS `uploadimg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uploadimg`;

-- --------------------------------------------------------

--
-- Table structure for table `profileimg`
--

CREATE TABLE `profileimg` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first` varchar(256) NOT NULL,
  `last` varchar(256) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profileimg`
--
ALTER TABLE `profileimg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `profileimg`
--
ALTER TABLE `profileimg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `useracc`
--
CREATE DATABASE IF NOT EXISTS `useracc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `useracc`;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `a_id` int(11) NOT NULL,
  `a_title` varchar(90) NOT NULL,
  `a_text` text NOT NULL,
  `a_author` varchar(256) NOT NULL,
  `a_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`a_id`, `a_title`, `a_text`, `a_author`, `a_date`) VALUES
(1, 'BTS Dynamite', 'Dynamite By BTS reaches a new unique listener peak on Melon, surpassing 680,000 ULs', 'K-Charts', '2020-09-05 09:35:00'),
(2, 'Sleep in PHP', 'sleep — Delay execution Delays the program execution for the given number of seconds.', 'php author', '2020-08-05 09:35:00'),
(3, 'The Way That I Love You', 'Hi guys, every day I update the channel with lyric videos of the newest pop, chill tracks, indie pop, pop soul, pop r&b and chill vibes playlist / best chill out music mix/ sad - beautiful love songs for my subscribers. ♪♪ So, chill with some lovely songs and tell me about your feelings in the comments.Thank you so much for your support ^^', 'Love Life Lyrics', '2020-09-03 09:15:00'),
(4, 'Most PAK Idol Group', '1. BTS <br>2. IKON <br>3. Twice <br>4. Big Bang <br>5. Blackpink', 'BTS-Publicity', '2020-09-05 09:35:00'),
(5, 'All time song with the most PAK', '1. Any Song 274 <br>2. Love Scenario 204 <br>3. Beach Again 171 <br>4.#DYNAMITE 137*<br>5. Leon 136<br>6. Blueming 117<br>7. Eight 114  ', 'BTS Updates', '2020-09-07 11:45:21');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL,
  `subject` varchar(128) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `new_id`, `subject`, `content`, `date`) VALUES
(1, 0, 'you-were-born-to-be-real-not-perfect', 'In todays society there is this image of the perfect woman and the perfect men. Woman have to be skinny with a beautiful face that they can only get by putting a lot of make up. They are expected to have the perfect job and to take care of the household at the same time. They have to go to the gym almost everyday and eat really healthy. They can\'t gain any weight because that\'s really bad in society. Men have to be muscular and handsome. They also have to have a really good job, really good car and perfect clothes. If you\'re not perfect in front of society then they will judge you so much that it\'s going to make you feel bad about yourself. In reality most women are not skinny and have the perfect body and some of them don\'t even have time to put make up on because they have a lot of things to do. Not all men are going to have muscular bodies and a perfect job. They don\'t have time to go to the gym because they have to work to support their family. Nobody can perfect because everyone has their flaws no matte how hard they try to be perfect they won\'t reach it. The only thing left is to be real with yourself and everybody else because that\'s what really counts.', '2015-11-14 16:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `profileimg`
--

CREATE TABLE `profileimg` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profileimg`
--

INSERT INTO `profileimg` (`id`, `userid`, `status`) VALUES
(32, 25, 1),
(35, 26, 1),
(36, 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_first` varchar(60) NOT NULL,
  `user_last` varchar(60) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_uid` varchar(60) NOT NULL,
  `user_pwd` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_first`, `user_last`, `user_email`, `user_uid`, `user_pwd`) VALUES
(16, 'Jung', 'Hoseok', 'hosoek@gmail.com', 'lead vocal & rapper', '$2y$10$7uyXQy4HlVEDZebtHrE9ZurIVjltD.D3xswnI3IFHpHr0tKZjz0/.'),
(17, 'Park', 'Jimin', 'jimin@gmail.com', 'lead vocal & dancer', '$2y$10$p3FsY2EbQ1MW59Z1u5/yBOFjAB8p08GG3a1v64LHoCT9Tinq/hsoe'),
(18, 'Kim', 'Taehyung', 'taehyung@gmail.com', 'main vocal&visual', '$2y$10$MBMVF9viRqINAUZg0iQSeO/76Yl0cccAbok1vY5mVQYVjEOrAb8l.'),
(19, 'Joen', 'JungKook', 'jk@gmail.com', 'main vocal', '$2y$10$J5R8r8m3QkkK00i74gM5u.vaz40KmSrW24NnxwTxXRSe5ezHkLTQq'),
(20, 'linn', 'latt', 'linnlatt1718@gmail.com', 'std', '$2y$10$WZ9/zr0CtGhPWP1SLRcCDOLrhoFfe/0jovDtRGXnJ/tNRc8ckhMfm'),
(21, 'Kim', 'Namjoon', 'kimnamjoon@gmail.com', 'leader', '$2y$10$39yf.cm/0KJZFlFtUKciBeoWvGhnyG3OBEY4aAt4UWe.LeN9Y5eK.'),
(22, 'Kim', 'Soekjin', 'soekjin@gmail.com', 'main vocal&visual', '$2y$10$qNQmaz0tc2X9ySibFa5E3ebh8sgOy0zP5mwJ9s1ksnpe5buaP2iLe'),
(24, 'Thant', 'Zin', 'thantzin@gmail.com', 'Thantzin2028', '$2y$10$f0QDucHFpiT.0L0pm8LkOeZEdvAXmJ7H86uQrD1bNij556m9tD89a'),
(25, 'bts', 'shin', 'shin2002@gmail.com', 'shin220', '$2y$10$V1/HEOOddOFJk/GFc3Mts.Cj.zGhaQExVxoqipRJu1dZgiZJThIyK'),
(26, 'Thant', 'Zin', 'thantzin70@gmail.com', 'huhihi', '$2y$10$vLJAnhyDkHCjibB1pl4ACOWSHCJbGMytf8RsD8MuBCh76qeCSLuOu'),
(27, 'Linn', 'Latt', 'linnlattoo1718@gmail.com', 'Admin', '$2y$10$MWkZBw4a9g/rz.GNAYdN1eRNhQPjp/3pxFmdRxogqVs3bdrR541Z2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profileimg`
--
ALTER TABLE `profileimg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profileimg`
--
ALTER TABLE `profileimg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
