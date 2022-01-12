-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jul 2019 pada 16.42
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan-bkd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `level` enum('admin','pegawai_jft','pegawai_jfu','kepala_bkd') NOT NULL,
  `active` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `user`, `pass`, `level`, `active`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '1'),
(9, 'bambang', '202cb962ac59075b964b07152d234b70', 'kepala_bkd', '1'),
(3, 'dhani', '202cb962ac59075b964b07152d234b70', 'pegawai_jfu', '1'),
(10, 'iping', '202cb962ac59075b964b07152d234b70', 'pegawai_jft', '1'),
(8, 'iz', '202cb962ac59075b964b07152d234b70', 'kepala_bkd', '1'),
(2, 'yogx', '202cb962ac59075b964b07152d234b70', 'pegawai_jft', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori_pengaduan`
--

CREATE TABLE `tbl_kategori_pengaduan` (
  `id` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori_pengaduan`
--

INSERT INTO `tbl_kategori_pengaduan` (`id`, `kategori`) VALUES
(1, 'Kenaikan Gaji Berkala'),
(2, 'Kenaikan Pangkat'),
(3, 'Layanan Pensiun');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` text NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_tlp` varchar(15) NOT NULL,
  `jabatan` enum('admin','pegawai_jft','pegawai_jfu','kepala_bkd') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`id`, `nik`, `nama`, `alamat`, `no_tlp`, `jabatan`) VALUES
(1, '5512', 'Admin', 'Kota Pasuruan', '085', 'admin'),
(2, '1234', 'Yoga Riantiana', 'Pasuruan', '085', 'pegawai_jft'),
(3, '2345', 'Dhani', 'Paskot', '087', 'pegawai_jfu'),
(8, '3412', 'Izazz', 'Kota Pas', '085808983769', 'kepala_bkd'),
(9, '5342', 'Bambang', 'Probolinggo', '0817263534', 'kepala_bkd'),
(10, '7646', 'Ighfir', 'Beji', '085', 'pegawai_jft');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengaduan`
--

CREATE TABLE `tbl_pengaduan` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_kepala_bkd` int(11) NOT NULL,
  `pengaduan` varchar(50) NOT NULL,
  `detail_pengaduan` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengaduan`
--

INSERT INTO `tbl_pengaduan` (`id`, `id_kategori`, `id_pegawai`, `id_kepala_bkd`, `pengaduan`, `detail_pengaduan`, `status`, `tgl`) VALUES
(4, 1, 2, 8, 'Gaji Tetap', 'Gaji tidak naik', '1', '2019-07-02'),
(5, 1, 10, 9, 'Gaji Tetap', 'Gajine ra munggah munggah', '1', '2019-07-02'),
(6, 1, 3, 8, 'Gaji Tetap', 'yoi', '1', '2019-07-02'),
(7, 1, 3, 8, 'Gaji Tetap', 'qwert', '0', '2019-07-02'),
(8, 1, 3, 9, 'Gaji Lambat', 'uuu', '1', '2019-07-02'),
(9, 3, 2, 8, 'TMT salah', 'TMT salah', '0', '2019-07-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tanggapan`
--

CREATE TABLE `tbl_tanggapan` (
  `id` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tanggapan` varchar(100) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_tanggapan`
--

INSERT INTO `tbl_tanggapan` (`id`, `id_pengaduan`, `tanggapan`, `tgl`) VALUES
(3, 6, 'Oke kita tindak lanjuti', '2019-07-03'),
(4, 8, 'Siap, kita lancarkan', '2019-07-03'),
(5, 4, 'Naik sekarang juga', '2019-07-03'),
(6, 5, 'Oke', '2019-07-03');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `tbl_kategori_pengaduan`
--
ALTER TABLE `tbl_kategori_pengaduan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_pengaduan`
--
ALTER TABLE `tbl_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_kepala_bkd` (`id_kepala_bkd`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tbl_tanggapan`
--
ALTER TABLE `tbl_tanggapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_komplain` (`id_pengaduan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori_pengaduan`
--
ALTER TABLE `tbl_kategori_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengaduan`
--
ALTER TABLE `tbl_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_tanggapan`
--
ALTER TABLE `tbl_tanggapan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_pengaduan`
--
ALTER TABLE `tbl_pengaduan`
  ADD CONSTRAINT `tbl_pengaduan_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tbl_pegawai` (`id`),
  ADD CONSTRAINT `tbl_pengaduan_ibfk_4` FOREIGN KEY (`id_kepala_bkd`) REFERENCES `tbl_pegawai` (`id`),
  ADD CONSTRAINT `tbl_pengaduan_ibfk_5` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori_pengaduan` (`id`);

--
-- Ketidakleluasaan untuk tabel `tbl_tanggapan`
--
ALTER TABLE `tbl_tanggapan`
  ADD CONSTRAINT `tbl_tanggapan_ibfk_1` FOREIGN KEY (`id_pengaduan`) REFERENCES `tbl_pengaduan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
