-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2020 pada 10.39
-- Versi server: 10.1.35-MariaDB
-- Versi PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kamus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kamus`
--

CREATE TABLE `tb_kamus` (
  `id` int(11) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kamus`
--

INSERT INTO `tb_kamus` (`id`, `judul`, `isi`) VALUES
(1, 'Apa', 'Naon'),
(2, 'Gedang', 'pepaya'),
(3, 'Makan', 'Dahar, neda, babadog'),
(4, 'Tinggi', 'jangkung'),
(5, 'Pagi', 'Isuk, enjing'),
(6, 'Malam', 'Weungi'),
(7, 'Nonton', 'Lalajo'),
(8, 'Takut', 'Sieun'),
(9, 'Ambil', 'Canda'),
(10, 'Kamu', 'Maneh, Anjeun');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_kamus`
--
ALTER TABLE `tb_kamus`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kamus`
--
ALTER TABLE `tb_kamus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
