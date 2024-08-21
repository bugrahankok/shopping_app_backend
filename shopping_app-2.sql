-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 20, 2024 at 12:40 PM
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
(10, 'Mobile Phones', 'iPhone 15 Pro', 18900, b'0', 289, 'https://st-troy.mncdn.com/mnresize/800/800/Content/media/ProductImg/original/mu7j3tua-apple-iphone-15-pro-max-1tb-natural-titanium-638305577580527960.jpg'),
(11, 'Television', 'Samsung Led TV', 27990, b'0', 189, 'https://images.samsung.com/is/image/samsung/p6pim/tr/ue55cu7000uxtk/gallery/tr-crystal-uhd-cu7000-ue55cu7000uxtk-536883262?$1300_1038_PNG$'),
(15, 'Home', 'Gaming Table', 1290, b'0', 169, 'https://www.cdnaws.com/i/zizuva/ZW3D2Lqi2qQZW3D2QvGYHPsSdwLZW3D2/images/urunler/633ed76ac6791-6689.png'),
(16, 'Computer', 'MacBook Air M2', 7480, b'0', 126, 'https://www.pt.com.tr/wp-content/uploads/2024/06/tKiYdOGR9pWkrgk4MobaxgYEjlUMdXRDqPiUGW31-1536x1536.webp'),
(41, 'Bilgisayar Bileşenleri', 'NVIDIA Ekran Kartı', 1500, b'0', 137, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRMxDYoMp7j5KFWz0vo0iMNMcanKsIHctlzA&s'),
(45, 'Home Care', 'Akıllı Süpürge', 1200, b'0', 129, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSqZY21c5IVfIaCwzDWQZTk6gSUZsVdw9F0oOqPFyw6Y71PDHZJ_OtXlE57PeK-DdvWN2vQOAo&usqp=CAE'),
(46, 'Otomobil', 'Porsche Macan', 996000, b'0', 93, 'https://www.motortrend.com/uploads/2022/10/2022-Porsche-Macan-GTS-25.jpg?w=768&width=768&q=75&format=webp'),
(48, 'Car', 'Skoda SuperB', 250000, b'0', 145, 'https://media.autoexpress.co.uk/image/private/s--X-WVjvBW--/f_auto,t_content-image-full-desktop@1/v1703068046/autoexpress/2023/12/Skoda%20Superb%20vRS%20exclusive%20images.jpg'),
(58, 'Home Care', 'Coffee Machine', 17650, b'0', 120, 'https://ideacdn.net/idea/lr/96/myassets/products/564/schaerer-barista-otomatik-espresso-kahve-makinesi-8831-64-b.jpg?revision=1719036021'),
(59, 'Electronics', 'Apple Watch Ultra ', 32500, b'0', 57, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/watch-card-40-ultra2-202403_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1708673831350'),
(60, 'Home Care', 'Fridge', 42700, b'0', 110, 'https://www.adalilaronline.com/wp-content/uploads/2024/01/vestel-puzzle-gardirop-buzdolabi.jpg'),
(61, 'Art', 'zurna limanı', 100, b'0', 150, 'https://images.deliveryhero.io/image/fd-tr/LH/i3f1-listing.jpg');

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
('2024-08-14 08:19:36', 31, 1780, 1, 16, NULL),
('2024-08-14 08:19:36', 32, 15011, 2, 10, NULL),
('2024-06-14 08:19:36', 33, 1780, 2, 16, NULL),
('2024-07-14 08:19:36', 34, 15011, 1, 10, NULL),
('2024-08-14 08:19:36', 35, 1200, 1, 45, NULL),
('2024-08-14 08:19:36', 37, 1780, 2, 16, NULL),
('2024-08-14 08:19:36', 39, 1200, 10, 45, NULL),
('2024-08-14 08:19:36', 40, 1200, 2, 45, NULL),
('2024-08-12 08:19:36', 41, 1500, 1, 41, NULL),
('2024-08-03 08:19:36', 42, 1000, 1, 42, NULL),
('2024-08-14 08:19:36', 43, 700, 1, 43, NULL),
('2024-08-04 21:00:00', 44, 5, 9, 35, NULL),
('2024-08-14 08:19:36', 45, 1200, 8, 45, NULL),
('2024-08-09 08:19:35', 46, 1200, 3, 45, NULL),
('2024-08-03 21:00:00', 47, 700, 4, 43, NULL),
('2024-08-14 08:19:36', 48, 5, 2, 35, NULL),
('2022-08-16 08:19:36', 49, 1000, 8, 42, NULL),
('2024-08-13 08:19:36', 50, 1500, 5, 41, NULL),
('2024-09-15 21:00:00', 51, 5, 2, 35, NULL),
('2022-09-12 08:19:52', 52, 250, 3, 44, NULL),
('2024-08-15 17:26:38', 53, 250, 4, 44, NULL),
('2024-08-16 13:00:41', 54, 250, 2, 44, NULL),
('2024-08-16 13:00:41', 55, 1500, 3, 41, NULL),
('2024-08-16 13:00:41', 56, 1200, 4, 45, NULL),
('2024-08-19 06:37:41', 57, 123, 7, 55, NULL),
('2024-08-19 06:37:59', 58, 123, 5, 55, NULL),
('2024-08-19 06:37:59', 59, 250, 4, 44, NULL),
('2024-08-19 06:38:33', 60, 123, 3, 55, NULL),
('2024-08-19 06:38:58', 61, 123, 7, 55, NULL),
('2024-08-19 06:40:01', 62, 123, 6, 55, NULL),
('2024-08-19 06:40:30', 63, 5, 2, 35, NULL),
('2024-08-19 06:41:02', 64, 5, 4, 35, NULL),
('2024-08-19 06:43:20', 65, 250, 5, 44, 16),
('2024-08-18 06:45:35', 67, 1500, 7, 41, 16),
('2024-08-19 06:51:38', 68, 5, 4, 35, 16),
('2024-08-19 06:51:38', 69, 1200, 4, 45, 16),
('2024-08-19 06:51:38', 70, 250, 4, 44, 16),
('2024-08-19 07:10:33', 71, 123, 5, 55, 16),
('2024-08-19 07:11:14', 74, 5, 5, 35, 16),
('2024-08-19 07:26:26', 75, 123, 6, 55, 16),
('2024-08-19 07:26:26', 76, 1500, 1, 41, 16),
('2024-08-19 07:28:49', 78, 1000, 1, 42, 16),
('2024-08-15 07:40:54', 80, 12313, 11, 56, 16),
('2024-08-15 07:40:51', 81, 1000, 8, 42, 16),
('2024-08-19 07:40:51', 82, 123, 1, 55, 16),
('2024-08-19 11:22:39', 84, 1290, 2, 15, 16),
('2024-08-17 11:22:39', 85, 27990, 1, 11, 16),
('2024-08-19 11:22:39', 86, 18900, 1, 10, 16);

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
(16, 'test@gmail.com', '$2a$10$.cN8UIC3/CfepQIKGY9EreeHlv1ZhzWd4hvBX9Qoob964K/ppK8bm', 'test', 1, 100530, NULL, b'0'),
(17, 'test2@gmail.com', '$2a$10$zUiGnYp02.P/ZXzL9CJDd.07YKmGwx.6DAgWvyGf.5OIWmPDcY7QC', 'test2', 0, 148371, NULL, b'0'),
(19, 'bugrahanko1k@gmail.com', '$2a$10$vnMExyyZ2luJxJdBUpj84uyloxl6NSfOP1ssYLqPLQ8Y/LRroMala', 'bugrahankok', 0, 150000, NULL, b'0'),
(20, 'seyid@gmail.com', '$2a$10$2lBqR2GoQJ/Ryf.Gq7Q6hufSacqzbAtBziBWTqeUVZobKTQu8mmgq', 'seyyidcelik', 0, 150000000, NULL, b'0'),
(21, 'emre@gmail.com', '$2a$10$HNhzpIcWS1CTr5S.JrwlIOCj6j84Zgw1XXcos6D2Jv5JXsuo3q2Ae', 'emrebicen', 0, 15000, NULL, b'0'),
(23, 'bugrahan888@gmail.com', '$2a$10$pabHfQU0aB8M.XWxK7fkre8xlUZ3hwJ1c6ErP7rFWMRXkIupljLm.', 'bugrahankok1', 0, 0, NULL, b'0'),
(33, 'bugrahan111kok@gmail.com', '$2a$10$9iyNWnrkzAvp/.7IQI3TAOC1iFelSsIHKpWgq6xZauzmqed5IR7kS', 'bugra', 0, 0, '685882', b'0'),
(34, 'bugrahan2kok@gmail.com', '$2a$10$jBL9kZdX4l6yTAY9WrBW4uOe3uTp7eL69SEdcv8DXg8JI9VRNnD8W', 'bugra1', 0, 0, NULL, b'0'),
(35, 'bugrahankok@gmail.com', '$2a$10$JCqdqQOkRTyMYbQXjOoOu.3JM2LGQ6eBsKdRw8CHWNW68CW7x0RfK', 'tessttt', 0, 0, NULL, b'0');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
