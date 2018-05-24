

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 -- ------------------------------------------------------

    -- Table Rate
    -- ----------------------------
    DROP TABLE IF EXISTS `rate`;
    CREATE TABLE `rate` (
  `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `r_rate` float(10) unsigned NOT NULL,
  `d_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`r_id`),
  FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ------------------------------------------------------

    -- Table Comment
    -- ----------------------------
    DROP TABLE IF EXISTS `comment`;
    CREATE TABLE `comment` (
  `c_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `c_comment` varchar(255) NOT NULL,
  `d_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`c_id`),
  FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ------------------------------------------------------

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

) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



CREATE TABLE `deactivepatien` (
  `DP_id` bigint(20) unsigned NOT NULL,
  `p_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`DP_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `deactivepatien_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ------------------------------------------------------
-- table deactiveHospital

-- ------------------------------------------------------
CREATE TABLE `deactivehospital` (
  `DH_id` bigint(20) unsigned NOT NULL ,
  `h_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`DH_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `deactivehospital_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bookmarkdoctor` (
  `p_id` bigint(20) unsigned NOT NULL ,
  `d_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`p_id`,`d_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `bookmarkdoctor_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `bookmarkdoctor_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bookmarkhospital` (
  `p_id` bigint(20) unsigned NOT NULL ,
  `h_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`p_id`,`h_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `bookmarkhospital_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `bookmarkhospital_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- ----------------------------------
-- ------------------------------------------------------
-- ------------------------------------------------------
-- -------------- Database Doctor---------------------
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Linh', 'Nguyen', 'Female', 'PhD', '1', 'Dermatology', '4', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Vu', 'Long', 'Male', 'Masters', '0', 'Cardiology', '6', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Duyet', 'Pham', 'Male', 'Masters', '0', 'Otolaryngology', '4', 'English, Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Anh', 'Ha', 'Female', 'PhD', '1', 'Hematology', '2', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Tien', 'Tran', 'Male', 'Masters', '0', 'Psychiatry', '9', 'English, Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Trinh', 'Phan', 'Female', 'Masters', '0', 'Neurosurgery', '6', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Vinh', 'Do', 'Male', 'PhD', '1', 'Infectious Disease', '3', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Sinh', 'Nguyen', 'Male', 'Masters', '0', 'Psychology', '1', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Hue', 'Nguyen', 'Female', 'Masters', '0', 'Rheumatology', '6', 'English, Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Hung', 'Phan', 'Male', 'Masters', '1', 'Otolaryngology', '2', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Anh', 'Vu', 'Female', 'PhD', '0', 'Gastroenterology', '6', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Lan', 'Tra', 'Male', 'Masters', '0', 'Obstetrics', '4', 'English, Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Toan', 'Duong', 'Male', 'Masters', '1', 'Pediatrics', '6', 'English');
-- ------------------------------------------------------
-- -------------- ---------------------
