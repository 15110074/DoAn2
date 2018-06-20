-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 20, 2018 lúc 04:53 AM
-- Phiên bản máy phục vụ: 10.1.32-MariaDB
-- Phiên bản PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doan2_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `gender`, `email`, `address`, `phone_number`, `created_at`, `updated_at`) VALUES
(22, 'TrinhDuLong', 'nam', 'longnguyen@gmail.com', 'HVM', '0164 289 8957', '2018-05-07 11:03:40', '2018-05-07 11:03:40'),
(23, 'TrinhDuLong', 'nam', 'longnguyen@gmail.com', 'HVM', '0164 289 8957', '2018-05-07 11:18:03', '2018-05-07 11:18:03'),
(24, 'TrinhDuLong', 'nam', 'longnguyen@gmail.com', 'HVM', '0164 289 8957', '2018-05-07 11:18:03', '2018-05-07 11:18:03'),
(25, 'DuLong', 'nam', 'admin@admin.com', 'HVM', '0164 289 8957', '2018-05-07 11:20:27', '2018-05-07 11:20:27'),
(45, 'Khang', 'nam', 'khang@gmail.com', '1', '1', '2018-05-22 18:20:21', '2018-05-22 18:20:21'),
(21, 'DuLong', 'nam', 'admin@admin.com', 'HVM', '0164 289 8957', '2018-05-07 09:51:25', '2018-05-07 09:51:25'),
(43, 'Long', 'nam', 'longnguyen@gmail.com', 'e', '110', '2018-05-07 19:09:52', '2018-05-07 19:09:52'),
(44, 'Long Trinh Du', 'nam', 'longtrinhdu@gmail.com', 'HVM', '0164 289 8957', '2018-05-09 12:40:31', '2018-05-09 12:40:31'),
(46, 'Khang', 'nam', 'khang@gmail.com', '1', '1', '2018-05-22 18:24:53', '2018-05-22 18:24:53'),
(47, 'Long', 'nam', 'longng@gmail.com', '1', '12', '2018-06-04 10:11:15', '2018-06-04 10:11:15'),
(48, 'Trinh Du Long', 'nam', 'long.trinh@marico.com', 'hcm', '0123456789', '2018-06-19 05:38:32', '2018-06-19 05:38:32'),
(49, 'Khach 1', 'nam', 'khach@gmail.com', 'HCM', '0123456789', '2018-06-19 19:50:36', '2018-06-19 19:50:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member`
--

CREATE TABLE `member` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cmnd` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `matkhau` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `member`
--

INSERT INTO `member` (`id`, `member_name`, `email`, `address`, `phone_number`, `cmnd`, `created_at`, `updated_at`, `matkhau`, `state`) VALUES
(9, 'Trinh Du Long', 'longtrinhdu@gmail.com', 'Quan 9', '01642898957', 0, '2018-05-22 17:49:23', '2018-05-22 17:49:23', '0989633160', 0),
(100, 'Admin', 'admin@gmail.com', '', '', 99999999, '2018-06-19 14:16:18', '2018-06-19 14:15:25', '123', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_customer` int(11) DEFAULT NULL,
  `madonhang` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `id_member`, `date_order`, `total`, `payment`, `created_at`, `updated_at`, `id_customer`, `madonhang`) VALUES
(6, NULL, '2018-05-07', 120000, 'COD', '2018-05-08 01:02:26', '2018-05-07 11:03:40', 22, 11112),
(5, NULL, '2018-05-07', 240000, 'COD', '2018-05-07 19:09:57', '2018-05-07 09:51:25', 21, 11111),
(23, 8, '2018-05-28', 500000, 'COD', '2018-05-27 21:40:44', '2018-05-27 21:40:44', NULL, 8530),
(7, NULL, '2018-05-07', 240000, 'COD', '2018-05-08 01:02:30', '2018-05-07 11:18:03', 23, 11113),
(8, NULL, '2018-05-07', 240000, 'COD', '2018-05-08 01:02:38', '2018-05-07 11:18:03', 24, 11114),
(9, NULL, '2018-05-07', 360000, 'COD', '2018-05-08 01:02:41', '2018-05-07 11:20:27', 25, 11115),
(16, NULL, '2018-05-09', 120000, 'COD', '2018-05-09 12:40:31', '2018-05-09 12:40:31', 44, 6844),
(24, NULL, '2018-06-04', 1300000, 'ATM', '2018-06-04 10:11:15', '2018-06-04 10:11:15', 47, 9006),
(20, NULL, '2018-05-23', 500000, 'ATM', '2018-05-22 18:20:21', '2018-05-22 18:20:21', 45, 4975),
(21, NULL, '2018-05-23', 3600000, 'COD', '2018-05-22 18:24:53', '2018-05-22 18:24:53', 46, 3504),
(25, NULL, '2018-06-19', 1500000, 'COD', '2018-06-19 05:38:33', '2018-06-19 05:38:33', 48, 4730),
(26, 9, '2018-06-20', 3800000, 'COD', '2018-06-19 18:17:49', '2018-06-19 18:17:49', NULL, 8969),
(27, NULL, '2018-06-20', 2000000, 'COD', '2018-06-19 19:50:36', '2018-06-19 19:50:36', 49, 9782),
(28, 9, '2018-06-20', 3300000, 'COD', '2018-06-19 19:51:57', '2018-06-19 19:51:57', NULL, 9227);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Soluong` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_order`, `id_product`, `unit_price`, `created_at`, `updated_at`, `Soluong`) VALUES
(5, 5, 1, 120000, '2018-05-07 09:51:25', '2018-05-07 09:51:25', 1),
(4, 5, 2, 120000, '2018-05-07 09:51:25', '2018-05-07 09:51:25', 1),
(17, 15, 2, 120000, '2018-05-07 20:42:33', '2018-05-07 20:42:33', 1),
(6, 6, 2, 120000, '2018-05-07 11:03:40', '2018-05-07 11:03:40', 1),
(7, 7, 1, 120000, '2018-05-07 11:18:03', '2018-05-07 11:18:03', 1),
(8, 7, 2, 120000, '2018-05-07 11:18:03', '2018-05-07 11:18:03', 1),
(9, 8, 1, 120000, '2018-05-07 11:18:03', '2018-05-07 11:18:03', 1),
(10, 8, 2, 120000, '2018-05-07 11:18:03', '2018-05-07 11:18:03', 1),
(11, 9, 2, 120000, '2018-05-07 11:20:27', '2018-05-07 11:20:27', 2),
(12, 9, 1, 120000, '2018-05-07 11:20:27', '2018-05-07 11:20:27', 1),
(16, 15, 1, 120000, '2018-05-07 20:42:33', '2018-05-07 20:42:33', 1),
(15, 14, 1, 120000, '2018-05-07 19:13:22', '2018-05-07 19:13:22', 1),
(18, 16, 1, 120000, '2018-05-09 12:40:31', '2018-05-09 12:40:31', 1),
(19, 17, 2, 120000, '2018-05-12 00:04:42', '2018-05-12 00:04:42', 1),
(20, 18, 1, 120000, '2018-05-12 00:05:13', '2018-05-12 00:05:13', 1),
(21, 19, 7, 1700000, '2018-05-22 17:49:59', '2018-05-22 17:49:59', 1),
(22, 20, 3, 500000, '2018-05-22 18:20:21', '2018-05-22 18:20:21', 1),
(23, 21, 7, 1700000, '2018-05-22 18:24:53', '2018-05-22 18:24:53', 1),
(24, 21, 15, 1900000, '2018-05-22 18:24:53', '2018-05-22 18:24:53', 1),
(25, 22, 3, 500000, '2018-05-22 19:33:39', '2018-05-22 19:33:39', 1),
(26, 23, 3, 500000, '2018-05-27 21:40:44', '2018-05-27 21:40:44', 1),
(27, 24, 2, 1300000, '2018-06-04 10:11:15', '2018-06-04 10:11:15', 1),
(28, 25, 1, 1500000, '2018-06-19 05:38:33', '2018-06-19 05:38:33', 1),
(29, 26, 1, 1500000, '2018-06-19 18:17:49', '2018-06-19 18:17:49', 1),
(30, 26, 5, 1800000, '2018-06-19 18:17:49', '2018-06-19 18:17:49', 1),
(31, 26, 3, 500000, '2018-06-19 18:17:49', '2018-06-19 18:17:49', 1),
(32, 27, 3, 500000, '2018-06-19 19:50:36', '2018-06-19 19:50:36', 2),
(33, 27, 6, 1000000, '2018-06-19 19:50:36', '2018-06-19 19:50:36', 1),
(34, 28, 3, 500000, '2018-06-19 19:51:57', '2018-06-19 19:51:57', 1),
(35, 28, 2, 1300000, '2018-06-19 19:51:57', '2018-06-19 19:51:57', 1),
(36, 28, 1, 1500000, '2018-06-19 19:51:57', '2018-06-19 19:51:57', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `state`, `created_at`, `updated_at`) VALUES
(1, 'Jordan', 1, 'Mua đi đừng ngại', 1500000, 0, '1-1.png', 1, NULL, NULL),
(2, 'Adidas NEO', 1, 'Mua đi đừng ngại', 1300000, 0, '1-2.png', 1, NULL, NULL),
(3, 'Thượng Đình', 1, 'Mua đi đừng ngại', 500000, 0, '1-3.png', 1, NULL, NULL),
(4, 'Adidas black', 1, 'Mua đi đừng ngại', 600000, 0, '1-4.png', 1, NULL, NULL),
(5, 'Presto', 2, 'Mua đi đừng ngại', 2000000, 1800000, '2-1.png', 1, NULL, NULL),
(6, 'Stan mith', 2, 'Mua đi đừng ngại', 1200000, 1000000, '2-2.png', 1, NULL, NULL),
(7, 'Puma Ignite Limitless', 2, 'Mua đi đừng ngại', 1900000, 1700000, '2-3.png', 1, NULL, NULL),
(8, 'PUMA Men\'s Tazon', 2, 'Mua đi đừng ngại', 1400000, 1200000, '2-4.png', 1, NULL, NULL),
(9, 'Vans', 3, 'Mua đi đừng ngại', 1000000, 0, '3-1.png', 1, NULL, NULL),
(10, 'Converse', 3, 'Mua đi đừng ngại', 1200000, 0, '3-2.png', 1, NULL, NULL),
(11, 'Yeezy V2 Oreo', 3, 'Mua đi đừng ngại', 3900000, 0, '3-3.png', 1, NULL, NULL),
(12, 'Biti\'s Hunter', 3, 'Mua đi đừng ngại', 799000, 0, '3-4.png', 1, NULL, NULL),
(13, 'Nike Air Huarache Utility', 4, 'Mua đi đừng ngại', 1000000, 0, '4-1.png', 1, NULL, NULL),
(14, 'Huarache Black Tan', 4, 'Mua đi đừng ngại', 1200000, 0, '4-2.png', 1, NULL, NULL),
(15, 'Huarache Black red', 4, 'Mua đi đừng ngại', 1900000, 0, '4-3.png', 1, NULL, NULL),
(16, 'Asics Gel-Lyte III Cosmos Pack', 4, 'Mua đi đừng ngại', 1990000, 0, '4-4.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`) VALUES
(2, 'Hàng 2'),
(3, 'Hàng 3'),
(4, 'Hàng 4'),
(1, 'Hàng 1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
