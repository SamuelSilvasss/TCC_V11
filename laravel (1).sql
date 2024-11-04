-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Out-2024 às 15:46
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `laravel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_mercado`
--

CREATE TABLE `avaliacao_mercado` (
  `id_avaliacao_mercado` bigint(20) UNSIGNED NOT NULL,
  `id_mercado` bigint(20) UNSIGNED NOT NULL,
  `avaliacao_mercado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `avaliacao_mercado`
--

INSERT INTO `avaliacao_mercado` (`id_avaliacao_mercado`, `id_mercado`, `avaliacao_mercado`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2024-10-08 20:59:40', '2024-10-08 20:59:40'),
(2, 2, 1, '2024-10-08 20:59:48', '2024-10-08 20:59:48'),
(3, 3, 3, '2024-10-08 20:59:56', '2024-10-08 20:59:56'),
(4, 4, 5, '2024-10-08 21:00:00', '2024-10-08 21:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_preco`
--

CREATE TABLE `avaliacao_preco` (
  `id_avaliacao_preco` bigint(20) UNSIGNED NOT NULL,
  `avaliacao_preco` enum('Correto','Incorreto') NOT NULL,
  `id_produto` bigint(20) UNSIGNED NOT NULL,
  `id_mercado` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `avaliacao_preco`
--

INSERT INTO `avaliacao_preco` (`id_avaliacao_preco`, `avaliacao_preco`, `id_produto`, `id_mercado`, `created_at`, `updated_at`) VALUES
(1, 'Correto', 17, 1, '2024-10-04 22:32:36', '2024-10-04 22:32:36'),
(2, 'Correto', 17, 1, '2024-10-04 22:50:53', '2024-10-04 22:50:53'),
(3, 'Correto', 17, 1, '2024-10-04 22:51:27', '2024-10-04 22:51:27'),
(4, 'Correto', 17, 1, '2024-10-04 22:53:59', '2024-10-04 22:53:59'),
(5, 'Correto', 17, 1, '2024-10-04 22:54:17', '2024-10-04 22:54:17'),
(6, 'Incorreto', 17, 1, '2024-10-04 22:57:28', '2024-10-04 22:57:28'),
(7, 'Incorreto', 17, 1, '2024-10-04 22:57:48', '2024-10-04 22:57:48'),
(8, 'Incorreto', 17, 1, '2024-10-04 23:02:55', '2024-10-04 23:02:55'),
(9, 'Correto', 17, 1, '2024-10-08 01:05:11', '2024-10-08 01:05:11'),
(10, 'Correto', 17, 1, '2024-10-08 01:10:21', '2024-10-08 01:10:21'),
(11, 'Incorreto', 17, 1, '2024-10-08 01:15:59', '2024-10-08 01:15:59'),
(12, 'Incorreto', 1, 1, '2024-10-15 16:35:39', '2024-10-15 16:35:39'),
(13, 'Correto', 1, 2, '2024-10-15 16:35:42', '2024-10-15 16:35:42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `id_favorito` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_produto` bigint(20) UNSIGNED NOT NULL,
  `id_mercado` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `favoritos`
--

INSERT INTO `favoritos` (`id_favorito`, `user_id`, `id_produto`, `id_mercado`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 1, '2024-10-15 15:36:28', '2024-10-15 15:36:28'),
(2, 1, 17, 1, '2024-10-15 15:43:58', '2024-10-15 15:43:58'),
(3, 1, 17, 1, '2024-10-15 15:54:44', '2024-10-15 15:54:44'),
(4, 2, 17, 1, '2024-10-15 15:58:06', '2024-10-15 15:58:06'),
(5, 2, 18, 1, '2024-10-15 16:10:30', '2024-10-15 16:10:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mercados`
--

CREATE TABLE `mercados` (
  `id_mercado` bigint(20) UNSIGNED NOT NULL,
  `nome_mercado` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `mercados`
--

INSERT INTO `mercados` (`id_mercado`, `nome_mercado`, `created_at`, `updated_at`) VALUES
(1, 'Mercado Noemia', NULL, NULL),
(2, 'Mercado Tietê', NULL, NULL),
(3, 'Mercado Economix', NULL, NULL),
(4, 'Mercado Atacadinho', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(19, '0001_01_01_000000_create_users_table', 1),
(20, '0001_01_01_000001_create_cache_table', 1),
(21, '0001_01_01_000002_create_jobs_table', 1),
(22, '2024_10_04_135336_create_bd__t_c_c', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` bigint(20) UNSIGNED NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome_produto`, `marca`, `created_at`, `updated_at`) VALUES
(1, 'Arroz', 'Camil', NULL, NULL),
(2, 'Arroz', 'Tio João', NULL, NULL),
(3, 'Feijão', 'Camil', NULL, NULL),
(4, 'Feijão', 'Kicaldo', NULL, NULL),
(5, 'Açúcar', 'União', NULL, NULL),
(6, 'Açúcar', 'Caravelas', NULL, NULL),
(7, 'Sal', 'Cisne', NULL, NULL),
(8, 'Sal', 'Lebre', NULL, NULL),
(9, 'Café', 'Pilão', NULL, NULL),
(10, 'Café', 'União', NULL, NULL),
(11, 'Macarrão', 'Galo', NULL, NULL),
(12, 'Macarrão', 'Adria', NULL, NULL),
(13, 'Farinha de trigo', 'Dona Benta', NULL, NULL),
(14, 'Farinha de trigo', 'Qualitá', NULL, NULL),
(15, 'Farinha temperada', 'Yoki', NULL, NULL),
(16, 'Farinha temperada', 'Kodilar', NULL, NULL),
(17, 'Achocolatado em pó', 'Italac', NULL, NULL),
(18, 'Achocolatado em pó', 'Toddy', NULL, NULL),
(19, 'Óleo', 'Soya', NULL, NULL),
(20, 'Óleo', 'Liza', NULL, NULL),
(21, 'Creme de leite', 'Italac', NULL, NULL),
(22, 'Creme de leite', 'Nestlé', NULL, NULL),
(23, 'Molho de tomate', 'Quero', NULL, NULL),
(24, 'Molho de tomate', 'Fugini', NULL, NULL),
(25, 'Bolacha (Cream Cracker)', 'Adria', NULL, NULL),
(26, 'Bolacha (Cream Cracker)', 'Bauduco', NULL, NULL),
(27, 'Leite condensado', 'Piracanjuba', NULL, NULL),
(28, 'Leite condensado', 'Italac', NULL, NULL),
(29, 'Sabonete', 'Dove', NULL, NULL),
(30, 'Sabonete', 'Lux', NULL, NULL),
(31, 'Pasta de dente', 'Colgate', NULL, NULL),
(32, 'Pasta de dente', 'Sorriso', NULL, NULL),
(33, 'Papel higiênico', 'Sublime', NULL, NULL),
(34, 'Papel higiênico', 'Personal', NULL, NULL),
(35, 'Leite', 'Italac', NULL, NULL),
(36, 'Leite', 'Piracanjuba', NULL, NULL),
(37, 'Refresco em pó', 'Tang', NULL, NULL),
(38, 'Refresco em pó', 'Mid', NULL, NULL),
(39, 'Detergente', 'Limpol', NULL, NULL),
(40, 'Detergente', 'Ypê', NULL, NULL),
(41, 'Sabão em pó', 'Ypê', NULL, NULL),
(42, 'Sabão em pó', 'Omo', NULL, NULL),
(43, 'Esponja de aço', 'Bombril', NULL, NULL),
(44, 'Esponja de aço', 'Assolan', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_caracteristicas`
--

CREATE TABLE `produtos_caracteristicas` (
  `id_preco` bigint(20) UNSIGNED NOT NULL,
  `id_produto` bigint(20) UNSIGNED NOT NULL,
  `id_mercado` bigint(20) UNSIGNED NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos_caracteristicas`
--

INSERT INTO `produtos_caracteristicas` (`id_preco`, `id_produto`, `id_mercado`, `preco`, `created_at`, `updated_at`) VALUES
(69, 18, 1, '6.20', NULL, NULL),
(70, 18, 2, '6.20', NULL, NULL),
(71, 18, 3, '6.20', NULL, NULL),
(72, 18, 4, '6.20', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('O9GQxCRAS7xwbvcXZMG4BlzmioOQIgtB0M1A2R7M', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM2p1a0w1VmdJQnRrUTVGcGNWQzBXNzhiQmtsWG1kNUNnV3JSVURMbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYWwiO319', 1728999915);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jobson', 'jobson.santiago@etec.sp.gov.br', NULL, '$2y$12$AfxxY9XNvgxEqk/5PfNSeed85e2A21j9JdvAMb.hQHmk/x3QAgHye', NULL, '2024-10-04 23:02:03', '2024-10-04 23:02:03'),
(2, 'messi', 'messi@gmail.com', NULL, '$2y$12$ObgcbHnvZ3WpVXU47PGeLO6wEyimX6c39IjAMRCGZZJ3DLLooInhS', NULL, '2024-10-15 15:57:53', '2024-10-15 15:57:53');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacao_mercado`
--
ALTER TABLE `avaliacao_mercado`
  ADD PRIMARY KEY (`id_avaliacao_mercado`),
  ADD KEY `avaliacao_mercado_id_mercado_foreign` (`id_mercado`);

--
-- Índices para tabela `avaliacao_preco`
--
ALTER TABLE `avaliacao_preco`
  ADD PRIMARY KEY (`id_avaliacao_preco`),
  ADD KEY `avaliacao_preco_id_produto_foreign` (`id_produto`),
  ADD KEY `avaliacao_preco_id_mercado_foreign` (`id_mercado`);

--
-- Índices para tabela `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Índices para tabela `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id_favorito`),
  ADD KEY `id_usuario` (`user_id`),
  ADD KEY `id_produto` (`id_produto`),
  ADD KEY `id_mercado` (`id_mercado`);

--
-- Índices para tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Índices para tabela `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mercados`
--
ALTER TABLE `mercados`
  ADD PRIMARY KEY (`id_mercado`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `produtos_caracteristicas`
--
ALTER TABLE `produtos_caracteristicas`
  ADD PRIMARY KEY (`id_preco`),
  ADD KEY `produtos_caracteristicas_id_produto_foreign` (`id_produto`),
  ADD KEY `produtos_caracteristicas_id_mercado_foreign` (`id_mercado`);

--
-- Índices para tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao_mercado`
--
ALTER TABLE `avaliacao_mercado`
  MODIFY `id_avaliacao_mercado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `avaliacao_preco`
--
ALTER TABLE `avaliacao_preco`
  MODIFY `id_avaliacao_preco` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id_favorito` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mercados`
--
ALTER TABLE `mercados`
  MODIFY `id_mercado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `produtos_caracteristicas`
--
ALTER TABLE `produtos_caracteristicas`
  MODIFY `id_preco` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacao_mercado`
--
ALTER TABLE `avaliacao_mercado`
  ADD CONSTRAINT `avaliacao_mercado_id_mercado_foreign` FOREIGN KEY (`id_mercado`) REFERENCES `mercados` (`id_mercado`);

--
-- Limitadores para a tabela `avaliacao_preco`
--
ALTER TABLE `avaliacao_preco`
  ADD CONSTRAINT `avaliacao_preco_id_mercado_foreign` FOREIGN KEY (`id_mercado`) REFERENCES `mercados` (`id_mercado`),
  ADD CONSTRAINT `avaliacao_preco_id_produto_foreign` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);

--
-- Limitadores para a tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_3` FOREIGN KEY (`id_mercado`) REFERENCES `mercados` (`id_mercado`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_caracteristicas`
--
ALTER TABLE `produtos_caracteristicas`
  ADD CONSTRAINT `produtos_caracteristicas_id_mercado_foreign` FOREIGN KEY (`id_mercado`) REFERENCES `mercados` (`id_mercado`),
  ADD CONSTRAINT `produtos_caracteristicas_id_produto_foreign` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
