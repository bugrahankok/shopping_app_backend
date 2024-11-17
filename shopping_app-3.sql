-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 17, 2024 at 06:18 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `completed` bit(1) NOT NULL,
  `quantity` int(255) DEFAULT '0',
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category`, `name`, `price`, `completed`, `quantity`, `image`) VALUES
(10, 'Mobile Phones', 'iPhone 15 Pro', 18900, b'0', 286, 'https://st-troy.mncdn.com/mnresize/800/800/Content/media/ProductImg/original/mu7j3tua-apple-iphone-15-pro-max-1tb-natural-titanium-638305577580527960.jpg'),
(11, 'Television', 'Samsung Led TV', 27990, b'0', 185, 'https://images.samsung.com/is/image/samsung/p6pim/tr/ue55cu7000uxtk/gallery/tr-crystal-uhd-cu7000-ue55cu7000uxtk-536883262?$1300_1038_PNG$'),
(15, 'Home', 'Gaming Table', 1290, b'0', 165, 'https://www.cdnaws.com/i/zizuva/ZW3D2Lqi2qQZW3D2QvGYHPsSdwLZW3D2/images/urunler/633ed76ac6791-6689.png'),
(16, 'Computer', 'MacBook Air M2', 7480, b'0', 125, 'https://www.pt.com.tr/wp-content/uploads/2024/06/tKiYdOGR9pWkrgk4MobaxgYEjlUMdXRDqPiUGW31-1536x1536.webp'),
(41, 'Bilgisayar Bileşenleri', 'NVIDIA Ekran Kartı', 1500, b'0', 135, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRMxDYoMp7j5KFWz0vo0iMNMcanKsIHctlzA&s'),
(45, 'Home Care', 'Akıllı Süpürge', 1200, b'0', 125, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSqZY21c5IVfIaCwzDWQZTk6gSUZsVdw9F0oOqPFyw6Y71PDHZJ_OtXlE57PeK-DdvWN2vQOAo&usqp=CAE'),
(46, 'Otomobil', 'Porsche Macan', 996000, b'0', 93, 'https://www.motortrend.com/uploads/2022/10/2022-Porsche-Macan-GTS-25.jpg?w=768&width=768&q=75&format=webp'),
(48, 'Car', 'Skoda SuperB', 250000, b'0', 144, 'https://media.autoexpress.co.uk/image/private/s--X-WVjvBW--/f_auto,t_content-image-full-desktop@1/v1703068046/autoexpress/2023/12/Skoda%20Superb%20vRS%20exclusive%20images.jpg'),
(58, 'Home Care', 'Coffee Machine', 17650, b'0', 119, 'https://ideacdn.net/idea/lr/96/myassets/products/564/schaerer-barista-otomatik-espresso-kahve-makinesi-8831-64-b.jpg?revision=1719036021'),
(59, 'Electronics', 'Apple Watch Ultra ', 32500, b'0', 57, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/watch-card-40-ultra2-202403_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1708673831350'),
(60, 'Home Care', 'Fridge', 42700, b'0', 110, 'https://www.adalilaronline.com/wp-content/uploads/2024/01/vestel-puzzle-gardirop-buzdolabi.jpg'),
(61, 'Art', 'zurna limanı', 100, b'0', 149, 'https://images.deliveryhero.io/image/fd-tr/LH/i3f1-listing.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`) VALUES
(1, 'Electronics'),
(2, 'Car'),
(3, 'Home Care'),
(4, 'Gardening'),
(5, 'Smart Home'),
(6, 'Computers'),
(7, 'Art');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sale_date`, `id`, `price`, `quantity`, `product_id`, `user_id`) VALUES
('2024-07-10 05:56:28', 90, 10, 3, 15, 16),
('2024-08-22 12:02:10', 92, 17500, 3, 45, 16),
('2024-08-22 12:02:06', 93, 2000, 4, 15, 16),
('2024-08-13 21:00:00', 94, 1500, 10, 41, 16),
('2024-08-14 08:00:00', 95, 1200, 5, 45, 16),
('2024-08-22 12:03:26', 96, 7480, 4, 16, 16),
('2024-08-22 12:03:07', 97, 15000, 1, 41, 16),
('2024-08-22 05:54:29', 98, 1290, 1, 15, 16),
('2024-08-22 12:03:04', 99, 12000, 1, 45, 16),
('2024-08-22 12:03:56', 100, 17000, 3, 11, 16),
('2024-08-22 12:02:31', 101, 2500, 1, 48, 16),
('2024-08-16 21:00:00', 102, 27990, 3, 11, 16),
('2024-08-22 12:04:17', 103, 12900, 1, 15, 16),
('2024-08-22 05:55:28', 104, 1200, 5, 45, 16),
('2024-08-22 12:02:40', 105, 990, 1, 10, 16),
('2024-08-22 12:03:36', 106, 4000, 4, 58, 16),
('2024-08-22 05:56:02', 107, 100, 24, 61, 16),
('2024-08-22 10:46:45', 109, 27990, 1, 11, 16);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `balance` double NOT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `verified` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `role`, `balance`, `verification_code`, `verified`) VALUES
(16, 'admin@gmail.com', '$2a$10$Q.HyaGg8oHRZ0zvHaL2W..3l6AIjo41m/a25zxXLS0wcSeujo6a9O', 'admin', 1, 50000000, NULL, b'1'),
(17, 'test2@gmail.com', '$2a$10$zUiGnYp02.P/ZXzL9CJDd.07YKmGwx.6DAgWvyGf.5OIWmPDcY7QC', 'test2', 0, 148371, NULL, b'1'),
(19, 'bugrahanko1k@gmail.com', '$2a$10$vnMExyyZ2luJxJdBUpj84uyloxl6NSfOP1ssYLqPLQ8Y/LRroMala', 'bugrahankok', 0, 150000, NULL, b'0'),
(20, 'seyid@gmail.com', '$2a$10$2lBqR2GoQJ/Ryf.Gq7Q6hufSacqzbAtBziBWTqeUVZobKTQu8mmgq', 'seyyidcelik', 0, 150000000, NULL, b'0'),
(21, 'emre@gmail.com', '$2a$10$HNhzpIcWS1CTr5S.JrwlIOCj6j84Zgw1XXcos6D2Jv5JXsuo3q2Ae', 'emrebicen', 0, 15000, NULL, b'0'),
(23, 'bugrahan888@gmail.com', '$2a$10$pabHfQU0aB8M.XWxK7fkre8xlUZ3hwJ1c6ErP7rFWMRXkIupljLm.', 'bugrahankok1', 0, 0, NULL, b'0'),
(33, 'bugrahan111kok@gmail.com', '$2a$10$9iyNWnrkzAvp/.7IQI3TAOC1iFelSsIHKpWgq6xZauzmqed5IR7kS', 'bugra', 0, 0, '685882', b'0'),
(34, 'bugrahan2kok@gmail.com', '$2a$10$jBL9kZdX4l6yTAY9WrBW4uOe3uTp7eL69SEdcv8DXg8JI9VRNnD8W', 'bugra1', 0, 0, NULL, b'0'),
(35, 'bugrahankok@gmail.com', '$2a$10$JCqdqQOkRTyMYbQXjOoOu.3JM2LGQ6eBsKdRw8CHWNW68CW7x0RfK', 'tessttt', 0, 0, NULL, b'0'),
(45, 'batuhankok@gmail.com', '$2a$10$lpGnKNqeybpRRuMSK3PeKOomEdQoduexKFIacXAq9.7DCoGGykqRK', 'batuhankok', 0, 0, '634627', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `user_seq`
--

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
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
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
