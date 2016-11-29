-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table minicms.module
CREATE TABLE IF NOT EXISTS `module` (
  `moduleName` varchar(250) NOT NULL,
  `createdBy` varchar(250) DEFAULT NULL,
  `version` varchar(250) DEFAULT NULL,
  `versionReleasedAt` datetime DEFAULT NULL,
  `installedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`moduleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table minicms.module: ~6 rows (approximately)
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` (`moduleName`, `createdBy`, `version`, `versionReleasedAt`, `installedOn`) VALUES
	('content', 'mderijcke', '0.1.0', '2016-11-29 19:14:14', '2016-11-29 19:14:14'),
	('footer', 'mderijcke', '0.1.0', '2016-11-29 18:53:20', '2016-11-29 18:53:23'),
	('form', 'mderijcke', '0.1.0', '2016-11-29 18:53:59', '2016-11-29 18:53:59'),
	('grid', 'mderijcke', '0.1.0', '2016-11-29 18:53:40', '2016-11-29 18:53:40'),
	('html', 'mderijcke', '0.1.0', '2016-11-29 18:54:15', '2016-11-29 18:54:15'),
	('nav', 'mderijcke', '0.1.0', '2016-11-29 18:55:16', '2016-11-29 18:55:16'),
	('text', 'mderijcke', '0.1.0', '2016-11-29 19:17:19', '2016-11-29 19:17:20');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
