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

-- Dumping structure for table minicms.page_route
CREATE TABLE IF NOT EXISTS `page_route` (
  `routePattern` varchar(250) NOT NULL,
  `pageId` int(11) NOT NULL,
  PRIMARY KEY (`routePattern`,`pageId`),
  KEY `FK_page_route_page` (`pageId`),
  CONSTRAINT `FK_page_route_page` FOREIGN KEY (`pageId`) REFERENCES `page` (`pageId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table minicms.page_route: ~3 rows (approximately)
/*!40000 ALTER TABLE `page_route` DISABLE KEYS */;
INSERT INTO `page_route` (`routePattern`, `pageId`) VALUES
	('/', 2),
	('/about', 3),
	('/contact', 4);
/*!40000 ALTER TABLE `page_route` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
