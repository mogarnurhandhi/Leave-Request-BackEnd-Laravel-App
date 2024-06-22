-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 22 Jun 2024 pada 16.13
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beizinapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `izins`
--

CREATE TABLE `izins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `verifikator_comment` text COLLATE utf8mb4_unicode_ci,
  `verifikator_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `izins`
--

INSERT INTO `izins` (`id`, `user_id`, `judul`, `isi`, `detail`, `status`, `verifikator_comment`, `verifikator_id`, `created_at`, `updated_at`) VALUES
(1, 6, 'Cuti Sakit', 'Saya sakit demam', 'Mulai tanggal 20 sampai 23 Juni 2024', 'rejected', 'jangan alasan ya', 1, '2024-06-22 01:30:22', '2024-06-22 03:49:00'),
(2, 6, 'Cuti Tunangan', 'Saya melangsungkan tunangan', 'pada tanggal 16 juli 2024', 'approved', 'okee semoga lancar ya', 2, '2024-06-22 01:45:24', '2024-06-22 03:48:43'),
(3, 6, 'Cuti Nikah', 'Saya melangsungkan pernikahan', 'pada tanggal 25-28 agustus 2024', 'pending', NULL, NULL, '2024-06-22 01:46:34', '2024-06-22 01:46:34'),
(5, 6, 'Update Cuti', 'update izin lagi pak', 'pada tanggal 27 desember 2024', 'canceled', NULL, NULL, '2024-06-22 02:28:57', '2024-06-22 04:13:09'),
(6, 6, 'Cuti lagi', 'izin lagi pak', 'pada tanggal 27 desember 2024', 'pending', NULL, NULL, '2024-06-22 08:05:46', '2024-06-22 08:05:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_06_20_130443_create_roles_table', 1),
(5, '2024_06_20_130737_create_users_table', 2),
(6, '2024_06_20_130945_create_izins_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'AuthToken', 'afeaaf8abdc03b48458e3b21344878ad05d281094e6be2f42fa0570376e328a6', '[\"*\"]', NULL, NULL, '2024-06-20 07:32:36', '2024-06-20 07:32:36'),
(2, 'App\\Models\\User', 1, 'AuthToken', '03a144ea398d135fbaeb9e52b23ea9cd5c7a1cf420ef266be95e02deff7fd859', '[\"*\"]', NULL, NULL, '2024-06-20 23:32:44', '2024-06-20 23:32:44'),
(3, 'App\\Models\\User', 1, 'AuthToken', 'dd9fe073ada9fe552129f3ddbf74cd99b3a97ee8a6252a9b594632af55944b41', '[\"*\"]', NULL, NULL, '2024-06-21 01:56:44', '2024-06-21 01:56:44'),
(4, 'App\\Models\\User', 1, 'AuthToken', 'dc0a4c0f3a5aff63763736cf813e09ffaef60cfb284ae9e3ef8dd7b02865bf88', '[\"*\"]', NULL, NULL, '2024-06-21 08:46:33', '2024-06-21 08:46:33'),
(5, 'App\\Models\\User', 1, 'AuthToken', '33ea0938a993fe577e6bfa36bb203b2e71f3effa7d1e1ddb5ce6584bbfc26bcf', '[\"*\"]', NULL, NULL, '2024-06-21 20:42:14', '2024-06-21 20:42:14'),
(6, 'App\\Models\\User', 4, 'AuthToken', '255e1cf3c32882295978779c138441c20596189daae5f26ba897c2e34f4a42fd', '[\"*\"]', NULL, NULL, '2024-06-22 00:46:31', '2024-06-22 00:46:31'),
(7, 'App\\Models\\User', 6, 'AuthToken', 'd672b078a2ec970d72655a70fdc538e93b8c122f2bc795bd92a7cddf448a5e78', '[\"*\"]', NULL, NULL, '2024-06-22 00:56:43', '2024-06-22 00:56:43'),
(8, 'App\\Models\\User', 6, 'AuthToken', '074f5e325efef5ea751f3883d96fcea43de41c86e95b3827923861cb3c06219d', '[\"*\"]', NULL, NULL, '2024-06-22 01:46:02', '2024-06-22 01:46:02'),
(9, 'App\\Models\\User', 6, 'AuthToken', '2e0041f8b8843621ebec87808c80505a56f68f03f4ae3e17fe39052188c2be6a', '[\"*\"]', NULL, NULL, '2024-06-22 09:00:14', '2024-06-22 09:00:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-06-20 06:24:59', '2024-06-20 06:24:59'),
(2, 'verifikator', '2024-06-20 06:24:59', '2024-06-20 06:24:59'),
(3, 'ordinary', '2024-06-20 06:24:59', '2024-06-20 06:24:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL DEFAULT '3',
  `status` enum('pending','verified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@mail.com', '$2y$12$HxwwnkDAaysCDsWIobPVPenC82ymtXlHXluR4dy5El4Ne.A/adEmu', 1, 'verified', NULL, '2024-06-20 07:29:36', '2024-06-20 07:29:36'),
(2, 'john die', 'john@mail.com', '$2y$12$TE58N93NpJUNzn4LaPIq0.Xy/rnNPPBLOUYgDRleQ0vn87KMgp16i', 2, 'verified', NULL, '2024-06-21 09:53:56', '2024-06-22 00:35:08'),
(3, 'axel novan', 'axnov@mail.com', '$2y$12$zTkKmOZgkTT109Pb9PY95e8YFAaKKdPY8.9/lhymlNbmqLLsVKUSC', 3, 'verified', NULL, '2024-06-21 23:55:27', '2024-06-22 00:52:25'),
(4, 'AdamVerif', 'adam123@example.com', '$2y$12$zVqO6mD9FsHrSGZRJYdtp.HuYJ7w39wJHiHXbqViz1HQar08d0bIW', 2, 'verified', NULL, '2024-06-22 00:01:11', '2024-06-22 00:01:11'),
(5, 'kim sunghon', 'kimsun@mail.com', '$2y$12$pi4S.haQC6f5MwIM/Q10melSQL9ZPnFVUFZiy9XF4Q1heSrYjR1oK', 3, 'pending', NULL, '2024-06-22 00:16:44', '2024-06-22 00:16:44'),
(6, 'abraham', 'abraham@gmail.com', '$2y$12$HvWsziHi1tLaZ58MUCAwoOEfMOwTtqB6GyCNJCj.116viAqtZA4Ju', 3, 'pending', NULL, '2024-06-22 00:55:28', '2024-06-22 08:59:14');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `izins`
--
ALTER TABLE `izins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `izins_user_id_foreign` (`user_id`),
  ADD KEY `izins_verifikator_id_foreign` (`verifikator_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `izins`
--
ALTER TABLE `izins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `izins`
--
ALTER TABLE `izins`
  ADD CONSTRAINT `izins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `izins_verifikator_id_foreign` FOREIGN KEY (`verifikator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
