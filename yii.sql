-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 04, 2023 at 02:47 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii`
--

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `middlename`, `surname`, `email`, `login`, `password`, `role`) VALUES
(1, 'Админ', NULL, 'Админов', 'admin@mail.ru', 'admin', '21232f297a57a5a743894a0e4a801fc3', 2),
(2, 'Пользователь', NULL, 'Пользователь', 'user@mail.ru', 'user', 'user', 1),
(3, 'admin1', 'admin33', 'admin1', 'adminbruh@mail.ru', 'admin2', 'c84258e9c39059a89ab77d846ddab909', 1),
(4, 'asdf', 'asdf', 'asdfas', 'asdfsadfas', 'dasfasfas', 'fe4c5295f954ecc939a2a6900bbaaab1', 1),
(5, 'фыва', 'вфыафы', 'ывафыва', 'ыфвафыв', 'аыфвафы', '6aed4bf2cc9d89afad57fec1960f53fd', 1),
(6, 'вфыафы', 'фывафы', 'афыафыа', 'ыфваыфафы', 'авыфвафыа', '8677715203964bc7904ce4f672516304', 1),
(7, 'имя', '', 'фамилия', 'admin2@mail.ru', 'amidn', 'dc647eb65e6711e155375218212b3964', 1),
(8, 'adsf', 'asdfas', 'asdfasdf', 'asdfasdf', 'dfasfdasd', '206f4f069e8a9aa14e5e564cdd714068', 1),
(9, 'asd', 'asdf', 'asdf', 'asdf', 'asdf', 'f51221d6d8d19d22c4b4ca4dea5195e8', 1),
(10, 'аааа', 'аааа', 'ааааа', 'admin4@mail.ru', 'admin6', 'fc1ebc848e31e0a68e868432225e3c82', 1),
(11, 'one', 'two', 'surname', 'email', 'lgoin', 'password', 1),
(12, 'имя', '', 'фамилия', 'email@mail.ru', 'login', '5f4dcc3b5aa765d61d8327deb882cf99', 1),
(13, 'имя', '', 'фамилич', 'email@email.en', 'logs', '5f4dcc3b5aa765d61d8327deb882cf99', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`,`email`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
