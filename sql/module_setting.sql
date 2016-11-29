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

-- Dumping structure for table minicms.module_setting
CREATE TABLE IF NOT EXISTS `module_setting` (
  `moduleName` varchar(250) NOT NULL,
  `settingName` varchar(250) NOT NULL,
  `settingType` varchar(50) NOT NULL,
  `defaultValue` text,
  PRIMARY KEY (`moduleName`,`settingName`),
  KEY `FK_module_setting_module_setting_type` (`settingType`),
  CONSTRAINT `FK_module_setting_module_setting_type` FOREIGN KEY (`settingType`) REFERENCES `module_setting_type` (`settingType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='module id, setting name, setting type, default value';

-- Dumping data for table minicms.module_setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `module_setting` DISABLE KEYS */;
INSERT INTO `module_setting` (`moduleName`, `settingName`, `settingType`, `defaultValue`) VALUES
	('text', 'content', 'multiline', NULL);
/*!40000 ALTER TABLE `module_setting` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
