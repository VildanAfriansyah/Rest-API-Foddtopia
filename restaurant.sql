-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 06 Feb 2020 pada 13.05
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(10) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_item` int(10) NOT NULL,
  `total` int(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id_cart`, `id_user`, `id_item`, `total`, `created_on`, `updated_on`) VALUES
(1, 3, 5, 1, '2020-01-08 07:28:15', '2019-12-29 14:49:57'),
(2, 3, 1, 3, '2020-01-08 07:28:19', '2019-12-29 14:55:48'),
(44, 21, 1, 1, '2020-01-13 04:15:40', '2020-01-13 04:15:40'),
(45, 21, 2, 1, '2020-01-13 04:15:47', '2020-01-13 04:15:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` int(10) NOT NULL,
  `category` varchar(50) NOT NULL,
  `images` varchar(45) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `category`, `images`, `created_on`, `updated_on`) VALUES
(1, 'Food', 'french fries.jpg', '2020-01-10 09:36:05', '2019-12-24 08:12:55'),
(2, 'Drink', 'coca cola.png', '2020-01-10 09:36:36', '2019-12-24 08:55:22'),
(3, 'Ice Cream', 'chocalate ice cream.jpg', '2020-01-10 09:35:55', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `item`
--

CREATE TABLE `item` (
  `id_item` int(10) NOT NULL,
  `id_category` varchar(10) NOT NULL,
  `id_restaurant` int(10) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `images` varchar(150) NOT NULL,
  `rate` float NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `item`
--

INSERT INTO `item` (`id_item`, `id_category`, `id_restaurant`, `item_name`, `price`, `description`, `images`, `rate`, `created_on`, `updated_on`) VALUES
(1, '1', 1, 'Big Mac', 30000, 'Burger super besar', 'bigmac.jpg', 3.6667, '2020-02-05 06:16:02', '2020-01-08 13:40:22'),
(2, '1', 1, 'Happy Meal', 45000, 'Paket anak-anak', 'happymeal.jpg', 3.6, '2020-01-12 09:15:06', '2020-01-08 13:41:12'),
(3, '2', 1, 'McCafe', 15000, 'Es Kopi', 'mccafe.jpg', 3, '2020-01-12 12:52:12', '2020-01-08 13:42:29'),
(4, '3', 1, 'Chocolate  Sundae', 10000, 'Es Krim Susu + Cokelat', 'chocolatesundae.jpg', 3, '2020-01-12 12:52:32', '2020-01-08 13:43:50'),
(5, '1', 1, 'Panas Spesial', 34000, 'Nasi + Telur + Fruit Tea _ Ayam', 'Panasspesial.jpg', 4.2, '2020-01-12 12:52:40', '2020-01-08 13:46:19'),
(6, '1', 3, 'Chicken Wings', 40000, 'Ayam Pedas + Saus Keju', 'chickenwings.jpg', 3.1, '2020-01-12 12:52:48', '2020-01-08 13:49:00'),
(7, '1', 3, 'Fire Chicken Bite', 45000, 'Paket Ayam Pedas + Saus Keju + Nasi', 'firechickenbite.jpg', 2.1, '2020-01-12 12:52:54', '2020-01-08 13:49:51'),
(8, '2', 3, 'Fruitarian', 12000, 'Teh rasa mangga', 'fruitarian.jpg', 4, '2020-01-13 02:25:23', '2020-01-08 13:50:27'),
(9, '2', 3, 'Pink Lava', 12000, 'Susu Rasa Strawberry', 'pinklava.jpg', 4.1, '2020-01-12 12:53:07', '2020-01-08 13:51:06'),
(10, '1', 3, 'Richeese Black', 45000, 'Black Chicken Bite', 'richeeseblack.jpg', 3, '2020-01-12 12:53:11', '2020-01-08 13:51:51'),
(11, '2', 1, 'Star Fruit Fizz', 15000, 'Coke with asian fruit flavor', 'star fruit fizz.png', 1, '2020-01-12 12:53:16', '2020-01-08 13:53:44'),
(12, '1', 2, 'Spicy Chicken Bite', 10000, 'Spycy chiken nuget bite', 'spicy chicken bite.png', 2.8, '2020-01-12 12:53:21', '2020-01-08 13:56:11'),
(13, '2', 2, 'Fresh Brewed Coffe ', 10000, 'Original Coffee ', 'fresh brewed coffee.jpg', 3.5, '2020-01-12 12:53:26', '2020-01-08 13:57:31'),
(14, '2', 2, 'Hezenut Coffee', 15000, 'Hot Coffee Hezelnut + sugar', 'hezelnut coffee.jpg', 2.5, '2020-01-12 12:53:31', '2020-01-08 13:59:25'),
(15, '3', 2, 'Chocolate Ice Cream Lava', 15000, 'Cholate Iceream', 'chocalate ice cream.jpg', 4, '2020-01-12 12:53:34', '2020-01-08 14:03:24'),
(17, '3', 1, 'Sundae Caramel', 12000, 'Ice Cream Caramel', 'sundaecaramel.jpg', 3.1, '2020-01-12 12:53:39', '2020-01-08 14:04:15'),
(19, '1', 4, 'Big Box', 180000, 'Paket Pizza', 'bigbox.jpg', 3, '2020-01-12 12:53:43', '2020-01-08 14:07:06'),
(20, '1', 4, 'Super Supreme', 150000, 'Super Big Pizza', 'supersupreme.jpg', 4.5, '2020-01-12 12:53:47', '2020-01-08 14:08:49'),
(21, '1', 1, 'Fish Fillet', 15000, 'Hot dog with fish fillet', 'fish fillet.jpg', 4.4, '2020-01-12 12:53:52', '2020-01-08 14:08:58'),
(22, '1', 4, 'Double Cheese Bite', 90000, 'Cheese Pizza', 'doublecheesebite.jpg', 2.3, '2020-01-12 12:53:59', '2020-01-08 14:12:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `restaurant`
--

CREATE TABLE `restaurant` (
  `id_restaurant` int(10) NOT NULL,
  `restaurant` varchar(50) NOT NULL,
  `images` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `descriptions` longtext NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `restaurant`
--

INSERT INTO `restaurant` (`id_restaurant`, `restaurant`, `images`, `longitude`, `descriptions`, `created_on`, `updated_on`) VALUES
(1, 'McDonald', 'mcd.jpeg', '-6.60115', 'Ayam Penyet Surabaya adalah pelopor restoran ayam penyet di Indonesia.', '2020-01-10 09:28:12', '2019-12-30 02:36:18'),
(2, 'KFC', 'kfc.jpg', '-6.379478', 'HAUS! adalah merk dagang minuman spesialis Thai Tea', '2020-01-10 09:28:44', '2019-12-30 02:41:39'),
(3, 'Richeese', 'richeese.jpg', '-6.39627', 'Geprek Bensu adalah merk dagang ayam geprek milik Ruben Onsu', '2020-01-10 09:29:20', '2019-12-30 02:39:26'),
(4, 'Pizza Hut ', 'phd.jpg', '-6.484255', 'Tong Tji merupakan nama Brand sedangkan nama perusahaannya adalah Perusahaan Teh Dua Burung Wangi.', '2020-01-10 09:28:50', '2019-12-29 07:39:56'),
(5, 'Burger Kings', 'bk.jpg', '6.560671', 'Waroeng Spesial Sambal “SS” adalah sebuah merk yang menyajikan aneka sambal segar dan masakan khas I', '2020-01-10 09:29:50', '2019-12-29 07:41:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE `review` (
  `id_comment` int(10) NOT NULL,
  `rating` int(10) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `id_item` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `review`
--

INSERT INTO `review` (`id_comment`, `rating`, `comment`, `id_item`, `id_user`, `created_on`, `updated_on`) VALUES
(1, 5, 'mantap', 1, 1, '2020-01-13 02:32:03', '2020-01-02 05:30:00'),
(2, 4, 'Gede burgernya', 1, 2, '2020-01-13 02:32:25', '2020-01-01 17:00:00'),
(14, 3, 'kurang enak', 1, 3, '2020-01-04 10:07:36', '2019-12-27 13:24:28'),
(16, 5, 'segar', 2, 1, '2019-12-28 01:10:23', '2019-12-28 01:10:23'),
(17, 5, 'jeruknya kerasa', 5, 1, '2019-12-29 09:30:53', '2019-12-29 09:30:53'),
(18, 4, 'Ayam Gepreknya Pedas', 11, 3, '2019-12-30 04:08:05', '2019-12-30 04:08:05'),
(19, 1, 'LOL', 1, 4, '2020-01-12 15:53:14', '2020-01-12 15:53:14'),
(22, 4, 'tehnya mantap', 8, 1, '2020-01-13 02:25:23', '2020-01-13 02:25:23'),
(23, 4, 'burgernya enak', 1, 21, '2020-01-13 04:13:20', '2020-01-13 04:13:20'),
(24, 5, 'mantap', 1, 1, '2020-02-05 06:16:01', '2020-02-05 06:16:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `revoked_token`
--

CREATE TABLE `revoked_token` (
  `id_token` int(10) NOT NULL,
  `token` varchar(500) NOT NULL,
  `status` int(20) NOT NULL,
  `login` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `revoked_token`
--

INSERT INTO `revoked_token` (`id_token`, `token`, `status`, `login`, `logout`) VALUES
(73, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg0ODAyODF9.-9eN9FcgXUrgnx-GGyrV4vDN4lgqHLB8JnbwPgNUQxM', 1, '2020-01-08 10:44:41', '2020-01-08 10:45:20'),
(74, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg0ODA0MDB9.3RLATGpn_8VZaS1KSwWHV6pfTR_kTWgnmOJfaDKBI8c', 0, '2020-01-08 10:46:40', '0000-00-00 00:00:00'),
(75, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg0ODA1ODd9.g8Bhh3naIa3kR34yFBww_qkDyVbrwmmaILNyCe1-l0A', 0, '2020-01-08 10:49:47', '0000-00-00 00:00:00'),
(76, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg0ODc2MDB9.0Ek5P_Wh4vn6ax6lL_5BId8pkemz7cYb9Gf0Epafls0', 0, '2020-01-08 12:46:40', '0000-00-00 00:00:00'),
(77, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg0OTI3MDR9.QDv6SI2sFzspPGmZzuxRz3DQCeDjeR245_d7IfEnIMs', 0, '2020-01-08 14:11:44', '0000-00-00 00:00:00'),
(78, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg1NDA1ODF9.xgRwpmyiH4GFsAaWtJhAw3Y0rv7Sv1kwOa8Lc6SLEIQ', 0, '2020-01-09 03:29:41', '0000-00-00 00:00:00'),
(79, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg1NDkwMzJ9.cvXPvH-JSWqN0T3Aho8QLT-qVpes1_gfHF39pSRYaJk', 1, '2020-01-09 05:50:32', '2020-01-09 05:50:50'),
(80, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg1NDkwNTh9.0QSKO1zHSsGaqXYyoW12Kz8nloRNyainpj5NSm0Cyik', 1, '2020-01-09 05:50:58', '2020-01-09 07:58:52'),
(81, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg1NDk4MjB9.YH8vUhdtdlzLCUfJRZnAnnqrn-wvmuKR2y89T03pOog', 0, '2020-01-09 06:03:40', '0000-00-00 00:00:00'),
(82, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg1NTkwNjJ9.egbB_TmQf4jhMxB_weiXtF4OgbIUe1jaiy5DueYXqXc', 0, '2020-01-09 08:37:42', '0000-00-00 00:00:00'),
(83, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg3MjY4MzB9.-VM463kLDTcbg5YZ2TKWYw6Lc0uA9Tpx3F3wvLGUu-g', 0, '2020-01-11 07:13:50', '0000-00-00 00:00:00'),
(84, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg3NjMxMjJ9.X7x20Q8zbmgH52jkKS0g2eU1jV8mklh06IpaS5g-07M', 1, '2020-01-11 17:18:42', '2020-01-11 17:21:37'),
(85, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg3NjMzMDZ9.EYzu85O9PjS7F_VZtKVycedupxIUr2b-w2GxofBQ8Vg', 1, '2020-01-11 17:21:46', '2020-01-11 17:21:50'),
(86, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IiIsImlkIjo4LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU3ODgxMTY4MH0.xds2AZTa8lwOh7P9hF2bnekbhI8b-EHz03_lr9rv7Cc', 1, '2020-01-12 06:48:00', '2020-01-12 06:49:31'),
(87, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IiIsImlkIjo4LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU3ODgxMTc3N30.xac6FKJ8ik-WDWAAEUhRBp6IL8Wj9H5WzM3J1RC_nJA', 1, '2020-01-12 06:49:37', '2020-01-12 06:50:05'),
(88, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IiIsImlkIjo4LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU3ODgxMTgxN30.uWf0YzmBIZYZvKyHO9gGwrHxdwpnWKe-K2xTpsc36oc', 1, '2020-01-12 06:50:17', '2020-01-12 06:50:50'),
(89, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IiIsImlkIjo4LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU3ODgxMTkxNX0._Aiez6ukQX8eUBagbO7LQd49AXzm31NMb6yAFHiZFM8', 1, '2020-01-12 06:51:55', '2020-01-12 06:52:00'),
(90, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IiIsImlkIjo4LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU3ODgxMTk1Mn0.ZRSWEzS7SnraLAznx_foOcaZsqbLmzJEtP4UODZ2j2I', 1, '2020-01-12 06:52:32', '2020-01-12 06:53:14'),
(91, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IiIsImlkIjo4LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU3ODgxMjAxOH0.4M4izc0twtBR2vrKJmPuGQ3QicnTeGEIi9IWXf_pSYM', 1, '2020-01-12 06:53:38', '2020-01-12 06:54:35'),
(92, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4MTIwODN9.5Al6wi_eB8k7pa5Jsf84OYcOqFWgEbjBq82ovkFESU8', 1, '2020-01-12 06:54:43', '2020-01-12 06:54:58'),
(93, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IiIsImlkIjo4LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU3ODgxMjEwM30.DLmBWseiaMw-AkyVdg9oIVKzK1Jy8xUolb060z4TFNc', 1, '2020-01-12 06:55:03', '2020-01-12 06:55:24'),
(94, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4MTIxODN9.TOvoz_SCHkiaVSD4i-8sKK23Hgtpyj2OIMltwj0Lnv0', 1, '2020-01-12 06:56:23', '2020-01-12 06:57:01'),
(95, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4MTc2ODZ9.6FDPYO5saMg-ElTTlmlFzZe5AKDPOy_BXtp0a2V28LE', 1, '2020-01-12 08:28:06', '2020-01-12 08:28:44'),
(96, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4MTc3Mzd9.J98V_yPTtTvrykr3abwf6CuF8VEDxlGMT3cXpwqKNiU', 1, '2020-01-12 08:28:57', '2020-01-12 12:44:45'),
(97, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4MzM1MDV9.8P0fBhxC3PGJiKpR0GNedyqzPbloUmrS5E9LcRj4c_4', 1, '2020-01-12 12:51:45', '2020-01-12 15:41:40'),
(98, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4NDM3MTR9.O8wvUv80V6BSM-KAZAz0etiU7x0LjdyLo8PzDpfRoBo', 1, '2020-01-12 15:41:54', '2020-01-12 15:43:00'),
(99, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4NDM3OTB9.Fy9J_X5YXSsIzckp4kHvtTUJMoZ3Bp033ll7Mp9egwc', 0, '2020-01-12 15:43:10', '0000-00-00 00:00:00'),
(100, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4NDM3OTl9.uJ-t0Y8J6Sxv2cu0mbVEaM0L82t02U0vwKOz3iZWhWg', 0, '2020-01-12 15:43:19', '0000-00-00 00:00:00'),
(101, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4ODE5NTZ9.w58Z8SL3gpvhndqmTtzZqYX47e42oxMzk8bx3Dxq_ms', 1, '2020-01-13 02:19:16', '2020-01-13 02:31:02'),
(102, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzg4ODQxMTZ9.ek_9Lhdj3iw2Krb_me2ZUzwif2gDme33Eq4_VTuPzsw', 1, '2020-01-13 02:55:16', '2020-01-13 02:59:42'),
(103, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InZpbGRhbjEyMyIsImlkIjoyMSwicm9sZXMiOiJjbGllbnQiLCJpYXQiOjE1Nzg4ODg3NzR9.39WRxkzcv95UMnDMYDzOTW0PbDFjgcG5zEHuxf40vcg', 1, '2020-01-13 04:12:54', '2020-01-13 04:20:25'),
(104, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTU2MTh9.a0zQ7WKka8puSUTIAopFZvZfGpMWyq6M1cZyR4xrGdM', 0, '2020-01-19 17:40:18', '0000-00-00 00:00:00'),
(105, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTU4Nzh9.SiZzJK2FrTQ_7KosqtMSjm5MFI_YAEED52JePDXWkgU', 0, '2020-01-19 17:44:38', '0000-00-00 00:00:00'),
(106, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTU4Nzh9.SiZzJK2FrTQ_7KosqtMSjm5MFI_YAEED52JePDXWkgU', 0, '2020-01-19 17:44:38', '0000-00-00 00:00:00'),
(107, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTU5NTZ9.NqVG6Bi_pw-w6Vs2rn3P4se3xvh_02LPe-EQQnOPkmg', 0, '2020-01-19 17:45:56', '0000-00-00 00:00:00'),
(108, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTU5NTZ9.NqVG6Bi_pw-w6Vs2rn3P4se3xvh_02LPe-EQQnOPkmg', 0, '2020-01-19 17:45:56', '0000-00-00 00:00:00'),
(109, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTU5NjF9.ol5Z8wmVL-FvW5AF1i7eNSjKWbQPCosHYu-RdhJJ0QA', 0, '2020-01-19 17:46:01', '0000-00-00 00:00:00'),
(110, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTU5NjF9.ol5Z8wmVL-FvW5AF1i7eNSjKWbQPCosHYu-RdhJJ0QA', 0, '2020-01-19 17:46:01', '0000-00-00 00:00:00'),
(111, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTYwMjV9.AdBH5m69ScIZT_4CrYW4W1VcApsZLEfQqv6ZR7uiDnM', 0, '2020-01-19 17:47:05', '0000-00-00 00:00:00'),
(112, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTYwNDJ9.h0YFVzRpBHsTljcUZsuR1OQFJ9ibKvTApRmLPz6_umc', 0, '2020-01-19 17:47:22', '0000-00-00 00:00:00'),
(113, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTYwNzZ9.59jH5THEd0fsGdwjL6iRIdeGMsJE0_GsHiMCnFdNkrk', 0, '2020-01-19 17:47:56', '0000-00-00 00:00:00'),
(114, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTYwOTF9.XBuvoWlIRgzLhXZc5Zp8HlcCBobI9iRtB6Ns-WzIV_E', 0, '2020-01-19 17:48:11', '0000-00-00 00:00:00'),
(115, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTYxMjN9.n6-uBF-fxFHmrIypjQ09kiwCf9wj5-KzGzh-IN2k6rA', 0, '2020-01-19 17:48:43', '0000-00-00 00:00:00'),
(116, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTYxMzF9.w51jcXfEjhrfm7EN806aSencr8jHt_RgfawISMdC-K8', 0, '2020-01-19 17:48:51', '0000-00-00 00:00:00'),
(117, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTYxMzV9.uCYPXdNxzqSCJW1V-kEhUsNRkdFjDZhsxJKXUEuMesI', 0, '2020-01-19 17:48:55', '0000-00-00 00:00:00'),
(118, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTY0MDB9.uoPMfrR042EdCcdkCRkaK3t025HPPp4ewlwIIhte-ik', 0, '2020-01-19 17:53:20', '0000-00-00 00:00:00'),
(119, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTY0NjR9.1HGSSKz9w2eMR3OcAmeJoxDiF2OKmxTGktvAFENyJwY', 0, '2020-01-19 17:54:24', '0000-00-00 00:00:00'),
(120, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTY1MTZ9.4rEGIQ4CrIgKWmfSYEjmJ9AzLVqTEcupszxr4nttFx0', 0, '2020-01-19 17:55:16', '0000-00-00 00:00:00'),
(121, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTY1MzB9.7KDof4P4EmABoOxOzMvDIsyPVBop40o6z7bkq5CAlaM', 0, '2020-01-19 17:55:30', '0000-00-00 00:00:00'),
(122, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTY2NjZ9.fy_xUSoSfRzURwh8KzTovhiVL8_LVugrN44SCVLBqb4', 0, '2020-01-19 17:57:46', '0000-00-00 00:00:00'),
(123, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTY4MzN9.U2ewqQpiop1NJDLTVyeKS205LV8AP1iSYX_Ar4BJu4c', 0, '2020-01-19 18:00:33', '0000-00-00 00:00:00'),
(124, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTY4NDB9.Cehew0FheJFaIFmGOysmi-epfWLw4zFPp7SnQXzPIr0', 0, '2020-01-19 18:00:40', '0000-00-00 00:00:00'),
(125, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTY5ODV9.T7LF-WzuHeun_MYcS_1D9p3iMvB6R8omT9kCXODedLY', 0, '2020-01-19 18:03:05', '0000-00-00 00:00:00'),
(126, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTcwMjF9.vcEctEYlNdrG9q8_J7H1ITuHgaG9GA5NfQ7h1qNHrao', 0, '2020-01-19 18:03:41', '0000-00-00 00:00:00'),
(127, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTcyMzB9.nlmfdpWKSHea2nrn4nEzyZXoRzmLh-b5_BkpjD3M9HM', 0, '2020-01-19 18:07:10', '0000-00-00 00:00:00'),
(128, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTcyODV9.X18-mohdfmG5FeUEIur_g74I_6F7fgEw3uvltXA3Fus', 0, '2020-01-19 18:08:05', '0000-00-00 00:00:00'),
(129, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTczMTB9.vpmkvpTaekpM8mHA4HvHc6hGmNRIps2LR4zY4elOCUQ', 0, '2020-01-19 18:08:30', '0000-00-00 00:00:00'),
(130, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTczNDh9.Z3ihAtmM2OHcsQKpBD9Kkg9wZnfrSQjwbjRUGwxVNKU', 0, '2020-01-19 18:09:08', '0000-00-00 00:00:00'),
(131, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTczNzV9.cnkXtRpAtf9JylU31anwXdrVA2jCij6V80E7p5ENuSs', 0, '2020-01-19 18:09:35', '0000-00-00 00:00:00'),
(132, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTczODF9.tirlP5fl2up9dbl43FoJpewzq2iBP_eq4K_Rt55Zs0w', 0, '2020-01-19 18:09:41', '0000-00-00 00:00:00'),
(133, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTc0ODh9.itEnVT6ARPVpHVRbK05vDGfnjsKgpXQJtZqsUwUsm2k', 0, '2020-01-19 18:11:28', '0000-00-00 00:00:00'),
(134, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTc1MzN9.K-C2_BkS8jQHdwbra6bgjsmfgAl3RyBLSwVAvzeMAYs', 0, '2020-01-19 18:12:13', '0000-00-00 00:00:00'),
(135, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTc1MzN9.K-C2_BkS8jQHdwbra6bgjsmfgAl3RyBLSwVAvzeMAYs', 0, '2020-01-19 18:12:13', '0000-00-00 00:00:00'),
(136, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTc1NzJ9.rWrAe7piu9yQeLn1fUqv-XZV2HJmSrrJi4TOn1g95Ck', 0, '2020-01-19 18:12:52', '0000-00-00 00:00:00'),
(137, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTc2MDF9.Eld6qZWOj9_Oirmx5mmGM7LiA7nJBqao8ovuQ8L73Io', 0, '2020-01-19 18:13:21', '0000-00-00 00:00:00'),
(138, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTc2NjJ9.gNHUO7jpOgoHjhJCkC8aosHgJVodluxGtgtsPOmdYqQ', 0, '2020-01-19 18:14:22', '0000-00-00 00:00:00'),
(139, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTc4MzJ9.1nTZwjyKWrG9_vePzcAyxYToIcyrZJWfqtMricHEkTE', 0, '2020-01-19 18:17:12', '0000-00-00 00:00:00'),
(140, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTc5ODZ9.1eA8iWKNyoRdsoumjh_lhhptxItnSKEDxDYjkR6wYb4', 0, '2020-01-19 18:19:46', '0000-00-00 00:00:00'),
(141, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTgwMzB9.fjo8xJTJfN2tPVdX3hOXHZK0swSRgO0TY5oJXnWe0r0', 0, '2020-01-19 18:20:31', '0000-00-00 00:00:00'),
(142, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTgwNjV9.2EqWOKMpkFllLG0viP9qF4Glf8KXL9x80I-47QOZ7U0', 0, '2020-01-19 18:21:05', '0000-00-00 00:00:00'),
(143, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTgxMDR9.LUv_qYLviP5_ApaJpo_q5Q79SWtPKdS24Z05Xv-17RA', 0, '2020-01-19 18:21:44', '0000-00-00 00:00:00'),
(144, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTg1NjF9.IqdHIzeLxNQ7ngfPgzVHKq8t5rbWUWWG8K6gbSLw83w', 0, '2020-01-19 18:29:21', '0000-00-00 00:00:00'),
(145, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTg3MjB9.KtouLC8LouHdph07gbwFYfhntkdW27vXO4tNGAX_p7M', 0, '2020-01-19 18:32:00', '0000-00-00 00:00:00'),
(146, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTg3NDF9.dCshXmJXaTBHoi_nGV9M5d-Mn4s6nwVCrYLzZU-Rz54', 0, '2020-01-19 18:32:21', '0000-00-00 00:00:00'),
(147, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTg3ODV9.fW03-4_s9dQ_EzOH3jnsF32A-2qV6ck7w1ML5hsKyw4', 0, '2020-01-19 18:33:05', '0000-00-00 00:00:00'),
(148, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTg4MTN9.hSpm7uryTZOEsGud6qGtK9hOhkxWwsLSPcHh5Ry48fg', 0, '2020-01-19 18:33:33', '0000-00-00 00:00:00'),
(149, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTkwMDF9.K2UpShHNOtlyEd4iMm0hCohf0gb0M0Jxp8HdciJCtx8', 0, '2020-01-19 18:36:41', '0000-00-00 00:00:00'),
(150, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NTk1NzF9.HzyEba16pTF2UZRlAYj76bHC07XFqmisk8SXsgnqhgI', 0, '2020-01-19 18:46:12', '0000-00-00 00:00:00'),
(151, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjAyMDd9.Ag5-2qGuesb-Ae2ZB9uUwW2472U_B0oq5oA7pbQw4ig', 0, '2020-01-19 18:56:47', '0000-00-00 00:00:00'),
(152, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjEwMDR9.Oucq1HUkqYpidi17aQHthGyFk7Yui_A0Ud_m7rIHaPc', 0, '2020-01-19 19:10:05', '0000-00-00 00:00:00'),
(153, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjI0NjB9.JxxOPGMN6aTQA5vNhm0sY3p6uu4J-fpNl6wKXUGvBas', 0, '2020-01-19 19:34:20', '0000-00-00 00:00:00'),
(154, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjQxNDN9.z-aB9oGsjFELqHx6Ms4pYuu3kt_4XQyGxMRtir_Qeq0', 0, '2020-01-19 20:02:23', '0000-00-00 00:00:00'),
(155, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjY4MTR9.nACVKMK0kSfxE-fbSCJsvq3L8xMsVNPB8KHoWa0RQm4', 0, '2020-01-19 20:46:54', '0000-00-00 00:00:00'),
(156, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjY4NTJ9.N5UHCNjU_vahj-zglcugr340FMex4fmUQSSu8uZMK0w', 0, '2020-01-19 20:47:32', '0000-00-00 00:00:00'),
(157, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjY4NTR9.ofOGr7MG5P8LPMzo9W5HWsS57buklRxVdJq4jUZ81F8', 0, '2020-01-19 20:47:34', '0000-00-00 00:00:00'),
(158, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0Njg3NDN9.z4t8TqheebXZv1u1-uFuATD1a9C3_MH_AV5nkA0t9zM', 0, '2020-01-19 21:19:04', '0000-00-00 00:00:00'),
(159, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjkyNDd9.OxfODzav6Ul7kIhnfr__5ZkEXN0F5MwnRDhGG_hj_c8', 0, '2020-01-19 21:27:27', '0000-00-00 00:00:00'),
(160, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NjkzMDh9.vK15dxfIq-i4cbUsc7TlCUpjM1ImGJlAJo30IvekLOY', 0, '2020-01-19 21:28:28', '0000-00-00 00:00:00'),
(161, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NzE3ODd9.JL_L1nKpIY3JqPJ1fSxe8b9lvu3g2BdXQnasJ_kKKw8', 0, '2020-01-19 22:09:47', '0000-00-00 00:00:00'),
(162, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NzIwNTd9.IK2UJh-YLcVCTixunqpEfR4UAHrv-oXGqtYe_vjU-Ck', 0, '2020-01-19 22:14:17', '0000-00-00 00:00:00'),
(163, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0NzI3NDh9.asCMyOrM8Pd5ZJ-v1Ych1q6z0Avf0YKdkLWg8QA_-Oc', 0, '2020-01-19 22:25:48', '0000-00-00 00:00:00'),
(164, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0ODc3MDB9.LRCbOX2A4r4AIGepCDMP80kXgfkc-0nellg2vGXgZ18', 0, '2020-01-20 02:35:00', '0000-00-00 00:00:00'),
(165, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0ODg3NTl9.j-2aicbgW59tlsa8N3DAA-aplWB7sUIgLy03_vob7xk', 0, '2020-01-20 02:52:39', '0000-00-00 00:00:00'),
(166, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk0OTQ0ODV9.k6nTWpkcc1aaq9wWV-jTCcLwBt_O3TbFwl8kSMk6l1c', 0, '2020-01-20 04:28:05', '0000-00-00 00:00:00'),
(167, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk1MDY0ODR9.BvmUiIftS-TgaCH5U5GGJ3hUJLWe9E9d9H1fEHovvA8', 0, '2020-01-20 07:48:04', '0000-00-00 00:00:00'),
(168, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1Nzk1MDY5NTR9.NPjJRqmecLhxD3cO0wajQND-9GwGNG0pKDTFq_Nlr34', 0, '2020-01-20 07:55:54', '0000-00-00 00:00:00'),
(169, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1ODA4Nzk0NTl9.Fe91UQ7iKsHamX8n8n9uppmwFxSOU9Rwt-AAfQHSOrI', 1, '2020-02-05 05:10:59', '2020-02-06 06:57:58'),
(170, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsInJvbGVzIjoiYWRtaW4iLCJpYXQiOjE1ODA5NzI3MTV9.78xhtsv48498zD5TSSy4rt-nXdOUJ7bveqcEaVzCAtg', 1, '2020-02-06 07:05:15', '2020-02-06 07:05:25'),
(171, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluMTIzIiwiaWQiOjI0LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU4MDk3NjQ5NH0.W7Lt-sjHMUVbwi3KEfVse8hfYk0Hk7elz8Tt4d57Kz8', 0, '2020-02-06 08:08:14', '0000-00-00 00:00:00'),
(172, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluMTIzIiwiaWQiOjI0LCJyb2xlcyI6ImNsaWVudCIsImlhdCI6MTU4MDk5MDY2NX0.PcRNnyEJyiRkJ3mpm2324yIKsn8THbCdx-0LqDFNGqs', 0, '2020-02-06 12:04:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id_role` int(10) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id_role`, `role`) VALUES
(1, 'admin_app'),
(2, 'admin_resto'),
(3, 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `roles` varchar(20) NOT NULL,
  `name_user` varchar(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `roles`, `name_user`, `username`, `password`, `created_on`, `updated_on`) VALUES
(1, 'admin', 'admin', 'admin', '$2a$10$QOAnYtT1tUN.tA1qxJ4X7.p6CrV7IcdY65zbkEizkOp3je4SsikVK', '2020-01-08 10:37:44', '2020-01-08 10:37:09'),
(2, 'client', 'Shina Mashiro', 'skyneko', '$2a$10$8X87bnoGn.7aDShM4vsL4.ZKk0vfxIkBDl9CV/gfw3H3cuXT06Ykq', '2020-01-11 14:56:13', '2020-01-11 14:56:13'),
(21, 'client', 'vildan', 'vildan123', '$2a$10$A1p5FNvIfyg.Gj/T1pgyu.ZHRbaMJOFXn51yWYxB.EccMAPyEYfGm', '2020-01-13 04:12:44', '2020-01-13 04:12:44'),
(22, 'admin', 'admin', 'asd', '$2a$10$K2CIZiM.w5dZNDp67zB/ouRrnnhVuR0.aHbGw3S9dDPhHgXLtcECq', '2020-02-06 08:07:11', '2020-02-06 08:07:11'),
(24, 'client', 'Vildan R', 'admin123', '$2a$10$J0jo/k7S0OzvhHdxP.ORRupXDDy9H62o9dvmBqk37cdrcIo3K3Jce', '2020-02-06 12:04:13', '2020-02-06 08:07:55');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indeks untuk tabel `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`);

--
-- Indeks untuk tabel `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- Indeks untuk tabel `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indeks untuk tabel `revoked_token`
--
ALTER TABLE `revoked_token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id_restaurant` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `review`
--
ALTER TABLE `review`
  MODIFY `id_comment` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `revoked_token`
--
ALTER TABLE `revoked_token`
  MODIFY `id_token` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
