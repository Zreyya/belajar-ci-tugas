-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2026 pada 08.17
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ci4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `discounts`
--

INSERT INTO `discounts` (`id`, `tanggal`, `nominal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2026-07-03', 250000, '2026-07-03 02:57:52', '2026-07-10 03:04:04', NULL),
(2, '2026-07-07', 100000, '2026-07-03 02:57:52', NULL, NULL),
(3, '2026-07-08', 200000, '2026-07-03 02:57:52', NULL, NULL),
(4, '2026-07-09', 150000, '2026-07-03 02:57:52', NULL, NULL),
(5, '2026-07-10', 250000, '2026-07-03 02:57:52', NULL, NULL),
(6, '2026-07-11', 300000, '2026-07-03 02:57:52', NULL, NULL),
(7, '2026-07-12', 300000, '2026-07-03 02:57:52', NULL, NULL),
(8, '2026-07-13', 300000, '2026-07-03 02:57:52', NULL, NULL),
(9, '2026-07-14', 300000, '2026-07-03 02:57:52', NULL, NULL),
(10, '2026-07-15', 300000, '2026-07-03 02:57:52', NULL, NULL),
(12, '2026-07-16', 150000, '2026-07-09 17:26:06', '2026-07-09 17:26:06', NULL),
(15, '2026-07-17', 20000, '2026-07-10 03:06:07', '2026-07-10 03:06:07', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2026-05-13-004346', 'App\\Database\\Migrations\\User', 'default', 'App', 1781664667, 1),
(2, '2026-05-13-004347', 'App\\Database\\Migrations\\Product', 'default', 'App', 1781664667, 1),
(3, '2026-05-13-004348', 'App\\Database\\Migrations\\Transaction', 'default', 'App', 1781664667, 1),
(4, '2026-05-13-004348', 'App\\Database\\Migrations\\TransactionDetail', 'default', 'App', 1781664667, 1),
(5, '2026-05-20-002526', 'App\\Database\\Migrations\\AddDeletedAtToTables', 'default', 'App', 1781664667, 1),
(10, '2026-06-17-025221', 'App\\Database\\Migrations\\User', 'default', 'App', 1781665202, 2),
(11, '2026-06-17-025222', 'App\\Database\\Migrations\\Product', 'default', 'App', 1781665202, 2),
(12, '2026-06-17-025222', 'App\\Database\\Migrations\\Transaction', 'default', 'App', 1781665202, 2),
(13, '2026-06-17-025223', 'App\\Database\\Migrations\\TransactionDetail', 'default', 'App', 1781665202, 2),
(14, '2026-06-17-030535', 'App\\Database\\Migrations\\AddDeletedAtToTables', 'default', 'App', 1781665553, 3),
(15, '2026-07-09-142449', 'App\\Database\\Migrations\\CreateDiscountsTable', 'default', 'App', 1783609063, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `jumlah` int(5) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `nama`, `harga`, `jumlah`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ASUS TUF A15 FA506NF', 10899000, 5, 'asus_tuf_a15.jpg', '2026-06-17 03:00:45', NULL, NULL),
(2, 'Asus Vivobook 14 A1404ZA', 6899000, 7, 'asus_vivobook_14.jpg', '2026-06-17 03:00:45', NULL, NULL),
(3, 'Lenovo IdeaPad Slim 3-14IAU7', 6299000, 5, 'lenovo_idepad_slim_3.jpg', '2026-06-17 03:00:45', NULL, NULL),
(7, 'Yoga Slim 7i Aura Edition', 15000000, 10, '', '2026-06-27 01:26:56', '2026-06-27 01:26:56', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `total_harga` double NOT NULL,
  `alamat` text NOT NULL,
  `ongkir` double DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id`, `username`, `total_harga`, `alamat`, `ongkir`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'rafa123', 28706000, 'Jl. Imam Bonjol 207', 9000, 1, '2026-06-17 04:38:11', '2026-07-10 02:54:31', NULL),
(2, 'rafa123', 17509000, 'Jl. Imam Bonjol 207', 11000, 0, '2026-07-09 18:55:54', '2026-07-09 18:55:54', NULL),
(3, 'rafa123', 17509000, 'Jl. Imam Bonjol 207', 11000, 0, '2026-07-09 19:04:28', '2026-07-09 19:04:28', NULL),
(4, 'naila12', 16709000, 'Jl. Imam Bonjol 207', 11000, 0, '2026-07-10 03:07:51', '2026-07-10 03:07:51', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `jumlah` int(5) NOT NULL,
  `diskon` double DEFAULT NULL,
  `subtotal_harga` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaction_detail`
--

INSERT INTO `transaction_detail` (`id`, `transaction_id`, `product_id`, `jumlah`, `diskon`, `subtotal_harga`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 1, 0, 6899000, '2026-06-17 04:38:11', '2026-06-17 04:38:11', NULL),
(2, 1, 1, 2, 0, 21798000, '2026-06-17 04:38:11', '2026-06-17 04:38:11', NULL),
(3, 2, 1, 1, 0, 10749000, '2026-07-09 18:55:54', '2026-07-09 18:55:54', NULL),
(4, 2, 2, 1, 0, 6749000, '2026-07-09 18:55:54', '2026-07-09 18:55:54', NULL),
(5, 3, 1, 1, 150000, 10749000, '2026-07-09 19:04:28', '2026-07-09 19:04:28', NULL),
(6, 3, 2, 1, 150000, 6749000, '2026-07-09 19:04:28', '2026-07-09 19:04:28', NULL),
(7, 4, 1, 1, 250000, 10649000, '2026-07-10 03:07:51', '2026-07-10 03:07:51', NULL),
(8, 4, 3, 1, 250000, 6049000, '2026-07-10 03:07:51', '2026-07-10 03:07:51', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'rafa123', 'situmorang.mutia@gmail.co.id', '$2y$10$Fism48.EhyxwcHQmmjEjUu5i5yZFjmNR.a8hmy7MW3ULeaiDTLE82', 'admin', '2026-06-17 03:00:47', NULL, NULL),
(2, 'vivi.lazuardi', 'joko89@wijaya.id', '$2y$10$Wh7lIkjFD6lWusjFgc/KlubcJthE0SfgPZ9IPiv22GV.kgjCeon1i', 'admin', '2026-06-17 03:00:47', NULL, NULL),
(3, 'naila12', 'shania.suryono@yahoo.co.id', '$2y$10$mNMfeauk9DuOakOktmt0GOic/D5Dg25zim8sQWZmfH9xn1/XZJ4KG', 'guest', '2026-06-17 03:00:47', NULL, NULL),
(4, 'latupono.suci', 'fzulaika@siregar.in', '$2y$10$DiMgl0Ekjuewjp.HMhrGp.s9pjfv7R.ky79sUInQBf1GBbdkkn.GK', 'guest', '2026-06-17 03:00:47', NULL, NULL),
(5, 'padmi42', 'lili93@gmail.co.id', '$2y$10$C.Gc9tQK1tI3Q6sQqL3ZI.CWRrAVSICRFXk2OjtrGAQeyX7PhZW7m', 'guest', '2026-06-17 03:00:47', NULL, NULL),
(6, 'among98', 'calista.suryatmi@wastuti.biz.id', '$2y$10$n4qz2kQtR.ypurJz6iGE9u3aWaoPe5QWQ8QY.hNwvs3p49n7lBW2K', 'admin', '2026-06-17 03:00:47', NULL, NULL),
(7, 'ulva.nababan', 'hesti.utami@yahoo.co.id', '$2y$10$c/3GxeXm0jeCFWjN21n4neg9ByTqm8679gE6hzWWoU2Z4XaQ7KPoS', 'guest', '2026-06-17 03:00:47', NULL, NULL),
(8, 'harto58', 'epermata@gmail.com', '$2y$10$lgOgqUvQSSLcDuFdVnSsi.E.vI8aWHbNDr6q37GR8y0kA86Gkaraq', 'guest', '2026-06-17 03:00:47', NULL, NULL),
(9, 'enajmudin', 'grajata@yahoo.co.id', '$2y$10$8JBp0GGdlo/G2SevVyhkc.K7Srlb0sNNV4YnTLIsjqwK5sfMFFdHm', 'guest', '2026-06-17 03:00:48', NULL, NULL),
(10, 'ami26', 'reksa.hutasoit@utami.id', '$2y$10$vfOfZemJKjgu/vMhaz4RQe4boue3kt7i609vd/u4iZCyL3qB8AJ5a', 'admin', '2026-06-17 03:00:48', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tanggal` (`tanggal`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
