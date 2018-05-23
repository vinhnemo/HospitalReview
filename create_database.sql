-- --------------------------------------------------------
    -- Table Patient
    -- ----------------------------
    DROP TABLE IF EXISTS `patient`;
    CREATE TABLE `patient` (
  `p_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `p_fname` varchar(45) NOT NULL,
  `p_lname` varchar(45) NOT NULL,
  `p_gender` varchar(45) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `p_address` varchar(150) NOT NULL,
  `languages` varchar(45) NOT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `patient_uindex` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- --------------------------------------------------------
    -- Table Admin
    -- ----------------------------
    DROP TABLE IF EXISTS `admin`;
    CREATE TABLE `admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_uindex` (`username`, `email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- --------------------------------------------------------
    -- Table Doctor
    -- ----------------------------
    DROP TABLE IF EXISTS `doctor`;
    CREATE TABLE `doctor` (
  `d_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `d_fname` varchar(150) NOT NULL,
  `d_lname` varchar(150) NOT NULL,
  `d_gender` varchar(45) NOT NULL,
  `d_degree` varchar(150) NOT NULL,
  `d_insurance` tinyint NOT NULL,
  `d_speciality` varchar(150) NOT NULL,
  `d_hour` varchar(150) NOT NULL,
  `languages` varchar(45) NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
--  --------------------------------------------------------
    -- Table Rate
    -- ----------------------------
    DROP TABLE IF EXISTS `rate`;
    CREATE TABLE `rate` (
  `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `r_rate` float(10) unsigned NOT NULL,
  `d_id` int(250) unsigned NOT NULL,
  PRIMARY KEY (`r_id`)
  FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- --------------------------------------------------------
    -- Table Comment
    -- ----------------------------
    DROP TABLE IF EXISTS `comment`;
    CREATE TABLE `comment` (
  `c_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `c_comment` varchar(255) NOT NULL,
  `d_id` int(250) unsigned NOT NULL,
  PRIMARY KEY (`c_id`)
  FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- --------------------------------------------------------
    -- Table Hospital
    -- ----------------------------
    DROP TABLE IF EXISTS `hospital`;
    CREATE TABLE `hospital` (
  `h_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `h_name` varchar(45) NOT NULL,
  `h_address` varchar(150) NOT NULL,
  `h_website` varchar(150) NOT NULL,
  `adname` varchar(150) NOT NULL,
  `ademail` varchar(150) NOT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8
 -- --------------------------------------------------------
-- --------------table deactivePatient---------------------
-- ------------------------------------------------------ -- 
CREATE TABLE `deactivepatien` (
  `DP_id` int(250) unsigned NOT NULL,
  `p_id` int(250) unsigned NOT NULL,
  PRIMARY KEY (`DP_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `deactivepatien_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- ------------------------------------------------------
-- -------------- table deactiveHospital---------------------
-- ------------------------------------------------------
CREATE TABLE `deactivehospital` (
  `DH_id` int(250) unsigned NOT NULL ,
  `h_id` int(250) unsigned NOT NULL,
  PRIMARY KEY (`DH_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `deactivehospital_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- ------------------------------------------------------
-- ----------------------------------
-- ------------------------------------------------------
