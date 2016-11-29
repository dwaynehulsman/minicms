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

-- Dumping structure for table minicms.module_instance
CREATE TABLE IF NOT EXISTS `module_instance` (
  `instanceId` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `moduleName` varchar(250) NOT NULL,
  `parentInstanceId` int(11) DEFAULT NULL,
  `ranking` int(11) NOT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK_module_instance_page` (`pageId`),
  KEY `FK_module_instance_module_instance` (`parentInstanceId`),
  KEY `FK_module_instance_module` (`moduleName`),
  CONSTRAINT `FK_module_instance_module` FOREIGN KEY (`moduleName`) REFERENCES `module` (`moduleName`),
  CONSTRAINT `FK_module_instance_module_instance` FOREIGN KEY (`parentInstanceId`) REFERENCES `module_instance` (`instanceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_module_instance_page` FOREIGN KEY (`pageId`) REFERENCES `page` (`pageId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table minicms.module_instance: ~3 rows (approximately)
/*!40000 ALTER TABLE `module_instance` DISABLE KEYS */;
INSERT INTO `module_instance` (`instanceId`, `pageId`, `moduleName`, `parentInstanceId`, `ranking`) VALUES
	(1, 1, 'nav', NULL, 10),
	(2, 1, 'content', NULL, 20),
	(3, 1, 'footer', NULL, 30),
	(4, 2, 'text', NULL, 10);
/*!40000 ALTER TABLE `module_instance` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
