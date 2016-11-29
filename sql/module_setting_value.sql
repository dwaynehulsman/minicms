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

-- Dumping structure for table minicms.module_setting_value
CREATE TABLE IF NOT EXISTS `module_setting_value` (
  `instanceId` int(11) NOT NULL,
  `moduleName` varchar(250) NOT NULL,
  `settingName` varchar(250) NOT NULL,
  `value` text,
  PRIMARY KEY (`instanceId`,`settingName`),
  KEY `FK_module_setting_value_module_setting` (`moduleName`,`settingName`),
  CONSTRAINT `FK__module_instance` FOREIGN KEY (`instanceId`) REFERENCES `module_instance` (`instanceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_module_setting_value_module` FOREIGN KEY (`moduleName`) REFERENCES `module` (`moduleName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_module_setting_value_module_setting` FOREIGN KEY (`moduleName`, `settingName`) REFERENCES `module_setting` (`moduleName`, `settingName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='instance id, module id, setting name, JSON encoded value';

-- Dumping data for table minicms.module_setting_value: ~0 rows (approximately)
/*!40000 ALTER TABLE `module_setting_value` DISABLE KEYS */;
INSERT INTO `module_setting_value` (`instanceId`, `moduleName`, `settingName`, `value`) VALUES
	(4, 'text', 'content', 'Welcome to the homepage');
/*!40000 ALTER TABLE `module_setting_value` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
