-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para puntoventa
CREATE DATABASE IF NOT EXISTS `puntoventa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `puntoventa`;

-- Volcando estructura para tabla puntoventa.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `parent_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla puntoventa.categories: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `description`, `state`, `parent_id`, `created_at`, `updated_at`) VALUES
	(7, 'PAN', 'PAN', '1', '0', '2020-06-13 15:47:57', '2020-06-15 00:27:33'),
	(8, 'PAN TOSTADA', 'PAN TOSTADA', '1', '7', '2020-06-13 15:49:32', '2020-06-13 15:49:32'),
	(9, 'LECHE', 'LECHE4', '1', '0', NULL, '2020-06-17 01:09:39'),
	(11, 'LECHE GLORIAO', 'LECHE GLORIA20200', '1', '9', '2020-06-13 18:41:41', '2020-06-15 00:39:30'),
	(16, 'LECHE DE SOYA', 'LECHE DE SOYA', '1', '9', '2020-06-17 00:29:47', '2020-06-17 00:29:47'),
	(17, 'leche evaporada', 'evapodara', '1', '9', '2020-06-17 01:08:22', '2020-06-17 01:08:22'),
	(18, 'jasjd2020', 'asd8', '1', '9', '2020-06-17 01:11:27', '2020-07-12 01:18:31'),
	(20, 'holas', 'hola', '1', '7', '2020-06-17 02:53:01', '2020-06-17 02:53:01'),
	(21, 'kjjk', 'kk', '1', '7', '2020-07-22 04:04:29', '2020-07-22 04:04:29');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla puntoventa.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla puntoventa.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla puntoventa.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla puntoventa.images: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `img`, `product_id`, `created_at`, `updated_at`) VALUES
	(2, '/galeria_producto/1591379883_7.jpg', 1, '2020-06-05 17:58:04', '2020-06-05 17:58:04'),
	(5, '/galeria_producto/1591407735_Sin título.png', 1, '2020-06-06 01:42:17', '2020-06-06 01:42:17'),
	(6, '/galeria_producto/1592184242_book-4126483_1920.jpg', 2, '2020-06-15 01:24:02', '2020-06-15 01:24:02'),
	(8, '/galeria_producto/1595389463_12.jpg', 18, '2020-07-22 03:44:23', '2020-07-22 03:44:23'),
	(9, '/galeria_producto/1595390652_11.jpg', 3, '2020-07-22 04:04:12', '2020-07-22 04:04:12');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Volcando estructura para tabla puntoventa.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla puntoventa.migrations: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(37, '2014_10_12_000000_create_users_table', 1),
	(38, '2014_10_12_100000_create_password_resets_table', 1),
	(39, '2019_08_19_000000_create_failed_jobs_table', 1),
	(40, '2020_03_29_025155_create_categories_table', 1),
	(41, '2020_03_31_151031_create_products_table', 1),
	(42, '2020_06_05_164747_create_images_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla puntoventa.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla puntoventa.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla puntoventa.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_compra` decimal(11,2) NOT NULL,
  `price_venta` decimal(11,2) NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla puntoventa.products: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `category_id`, `description`, `codigo`, `stock`, `img`, `price_compra`, `price_venta`, `date`, `created_at`, `updated_at`) VALUES
	(3, 17, 'LECHE2020', '212', 12, '/producto/1592352980_descarga.jpg', 21.00, 12.00, '2020-06-16', '2020-06-17 00:16:20', '2020-07-22 04:02:14'),
	(8, 16, 'jkjkhk jkhjk 453646', '213', 3, '/producto/1592885288_download-1666700_1920.jpg', 32.00, 3.00, '2020-06-22', '2020-06-23 04:08:08', '2020-07-22 04:03:39'),
	(9, 16, 'tyyt', '7667', 7, '/producto/1592885364_webinar-4216601_1920.jpg', 7.00, 7.00, '2020-06-22', '2020-06-23 04:09:24', '2020-06-23 04:09:24'),
	(10, 16, '565', '7', 8, '/producto/1592885469_nostros.jpeg', 88.00, 88.00, '2020-06-22', '2020-06-23 04:11:09', '2020-06-23 04:11:09'),
	(11, 16, 'as', '3', 12, '/producto/1595390289_11.jpg', 21.00, 12.00, '2020-06-22', '2020-06-23 04:14:19', '2020-07-22 03:58:09'),
	(12, 16, 'as', '3', 12, '/producto/1592885750_WhatsApp Image 2020-06-22 at 7.58.28 AM.jpeg', 21.00, 12.00, '2020-06-22', '2020-06-23 04:15:51', '2020-06-23 04:15:51'),
	(13, 16, 'qwe', '12', 2, '/producto/1593044136_2.jpg', 222.00, 2.00, '2020-06-24', '2020-06-25 00:15:38', '2020-06-25 00:15:38'),
	(14, 16, 'd', '231', 12, '/producto/1593044687_3.jpg', 22.00, 22.00, '2020-06-24', '2020-06-25 00:24:47', '2020-06-25 00:24:47'),
	(15, 16, 'as', 'q2', 3, '/producto/1593044809_4.jpg', 323.00, 3.00, '2020-06-24', '2020-06-25 00:26:49', '2020-06-25 00:26:49'),
	(16, 17, 'a', '12', 1, '/producto/1593044975_5.jpg', 21.00, 12.00, '2020-06-24', '2020-06-25 00:29:35', '2020-06-25 00:29:35'),
	(17, 16, 'michael', 'alex', 12, '/producto/1593045089_10.jpg', 222.00, 22.00, '2020-06-24', '2020-06-25 00:31:29', '2020-06-25 00:31:29'),
	(18, 8, '6hii2020', '5', 5, '/producto/1595387319_11.jpg', 77.00, 777.00, '2020-07-11', '2020-07-12 04:27:02', '2020-07-22 03:56:09');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla puntoventa.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla puntoventa.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'michael', 'michael101136@gmail.com', NULL, '$2y$10$UL4YTl3Wp6j5A97ClZv0nOXQjq2CRLGJ/FpetiGP78pgShCrrcIPa', NULL, '2020-06-05 17:31:57', '2020-06-05 17:31:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
