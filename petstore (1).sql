-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 02:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoption_requests`
--

CREATE TABLE `adoption_requests` (
  `id` int(11) NOT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `pet_name` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `requester_name` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `admin_message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adoption_requests`
--

INSERT INTO `adoption_requests` (`id`, `pet_id`, `pet_name`, `reason`, `requester_id`, `requester_name`, `status`, `admin_message`, `created_at`) VALUES
(3, 1, 'Buddy', 'asdadawfaw', 11, 'user1', 'Rejected', 'Sorry, your adoption request for Buddy (age 2.5) was rejected. Please contact our team if you have any questions or would like more information.', '2025-02-15 09:11:36'),
(4, 1, 'Buddy', 'afafwafa', 11, 'user1', 'Rejected', 'Sorry, your adoption request for Buddy (age 2.5) has been rejected. Please contact us for more details.', '2025-02-15 09:18:44'),
(5, 1, 'Buddy', 'cause am lonely ', 12, 'ml', 'Approved', 'Congratulations! Your adoption request for Buddy (age 2.5) has been approved. Please bring your ID to our center.', '2025-02-15 16:17:54'),
(6, 11, 'Oliver', 'asdasdadwa', 6, 'admin1', 'Rejected', 'Sorry, your adoption request for Oliver (age 4.0) has been rejected. Please contact us for more details.', '2025-02-15 17:19:26'),
(7, 10, 'Sadie', 'asdasdad', 11, 'user1', 'Rejected', 'Sorry, your adoption request for Sadie (age 4.0) has been rejected. Please contact us for more details.', '2025-02-16 05:22:04'),
(8, 11, 'Oliver', 'lonely ', 11, 'user1', 'Approved', 'Congratulations! Your adoption request for Oliver (age 4.0) has been approved. Please bring your ID to our center.', '2025-02-16 06:38:04'),
(9, 10, 'Sadie', 'i feel lonely', 13, 'kii', 'Approved', 'Congratulations! Your adoption request for Sadie (age 4.0) has been approved. Please bring your ID to our center.', '2025-02-16 07:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `species` enum('Dog','Cat') NOT NULL,
  `age` decimal(3,1) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `species`, `age`, `description`, `image_url`, `created_at`) VALUES
(5, 'Max(Australian Terrier)', 'Dog', 1.0, 'Max was rescued from a tough situation, but his tail never stops wagging. He loves belly rubs and fetch!', 'uploads/dogs1.jpg', '2025-02-15 17:12:41'),
(6, 'Luna', 'Cat', 5.0, 'Luna is a sweet, gentle cat who adores naps in the sun. She\'ll curl up in your lap for hours', 'uploads/cat002.jpg', '2025-02-15 17:16:20'),
(7, 'Cupcake', 'Dog', 3.0, 'Energetic and playful, Cupcake needs plenty of room to run around. He’ll love outdoor adventures with you.', 'uploads/dogs2.jpg', '2025-02-15 17:16:52'),
(8, 'Misty', 'Dog', 4.0, 'Misty’s bright green eyes reflect her curious nature. She’s playful, affectionate, and loves cozy spots.', 'uploads/cats2.jpeg', '2025-02-15 17:17:19'),
(9, 'Charlie', 'Dog', 3.0, 'Charlie has a heart of gold and an endless supply of kisses. He’ll be your best friend in no time!', 'uploads/dogs3.jpg', '2025-02-15 17:17:50'),
(10, 'Sadie', 'Dog', 4.0, 'Shy at first, Sadie opens up once she knows she’s safe. She’s a gentle soul looking for a patient family.', 'uploads/dogs4.jpg', '2025-02-15 17:18:17'),
(11, 'Oliver', 'Cat', 4.0, 'A mischievous cat who loves climbing and exploring. Oliver will keep you happily on your toes!', 'uploads/Cat03.jpg', '2025-02-15 17:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` varchar(50) NOT NULL DEFAULT 'cat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `description`, `image_url`, `created_at`, `category`) VALUES
(7, 'Kitty Tuna & Salmon', 5.50, 'Delicious wet food to keep your cat happy and healthy.', 'uploads/Kitty tuna.webp', '2025-02-15 17:21:16', 'cat'),
(8, 'Interactive Feather Toy', 7.99, 'Engaging toy designed to keep your cat active and entertained.', 'uploads/CatToy.webp', '2025-02-15 17:21:36', 'cat'),
(10, 'Plush Cat Bed', 15.99, 'Soft, plush bed offering warmth and comfort for naptime.', 'uploads/bed.webp', '2025-02-15 17:22:36', 'cat'),
(11, 'Stylish Cat Collar', 8.50, 'Comfortable collar with a safety release buckle.', 'uploads/collar.jpg', '2025-02-15 17:22:48', 'cat'),
(12, 'Cat Scratcher Lounge', 22.00, 'Sturdy corrugated surface to satisfy your cat’s scratching instincts.', 'uploads/Scratch.jpg', '2025-02-15 17:23:04', 'cat'),
(13, 'Dental Chew Treats', 4.99, 'Helps maintain oral health and fresh breath for your cat.', 'uploads/DentalChew.webp', '2025-02-15 17:23:17', 'cat'),
(14, 'Premium Dog Food', 24.99, 'Nutrient-rich kibble for optimal canine health and energy', 'uploads/Premium dog Food.webp', '2025-02-15 17:24:37', 'dog'),
(15, 'Durable Chew Toy', 12.49, 'Long-lasting chew designed to help clean teeth and prevent boredom.', 'uploads/chewtoy.jpg', '2025-02-15 17:24:51', 'dog'),
(16, 'Stylish Dog Collar', 9.99, 'Comfortable and durable collar with adjustable fit.', 'uploads/Gold_Choke_Parent.jpg', '2025-02-15 17:25:05', 'dog'),
(17, 'Cozy Dog Bed', 19.99, 'Soft, plush bed offering warmth and comfort for naptime', 'uploads/Cozy dog bed.jpg', '2025-02-15 17:25:18', 'dog'),
(18, 'Gentle Dog Shampoo', 6.99, 'Keep your dog’s coat clean and smelling fresh.', 'uploads/Shampoo dog.jpg', '2025-02-15 17:25:31', 'dog'),
(19, 'Comfort Fit Harness', 14.99, 'Easy on/off design with adjustable straps for all breeds.', 'uploads/Harness.jpg', '2025-02-15 17:25:44', 'dog'),
(22, 'cat bed', 19.00, 'It helps the cats to sleep better', 'uploads/bed.webp', '2025-02-16 07:58:52', 'cat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(6, '', '', 'admin1', 'adminlog@gmail.com', '$2y$10$KYGKUyENdKEa6NDPzUmHZehu8DAps1EERjTNyN6/K2eOKfuRcMxVu', 'admin', '2025-02-13 09:14:00'),
(11, 'Kidus', 'Ezra', 'user1', 'user@gmail.com', '$2y$10$Z8WoNh08ZmeP36gyQGnC5eb/vAG64YXESLWNJgXsI04ARPsDB9uJa', 'user', '2025-02-15 07:19:02'),
(12, 'mailaf', 'm', 'ml', 'ml@gmail.com', '$2y$10$faoFgorSb/y7vZIMmxM7M.ZR6GJDLPZLcP.MXul/uUwvJo2S4Q3Vi', 'user', '2025-02-15 16:16:26'),
(13, 'kiiid', 'ezra', 'kii', 'kii@Gmail.com', '$2y$10$rhUqgjIDvS9wPfD6Lea.1O8m/pz53p2TRcMmWft3/lree58DeQmaO', 'user', '2025-02-16 07:56:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoption_requests`
--
ALTER TABLE `adoption_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoption_requests`
--
ALTER TABLE `adoption_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
