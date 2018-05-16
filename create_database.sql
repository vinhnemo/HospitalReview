-- --------------------------------------------------------
    -- Table Patient
    -- ----------------------------
    CREATE TABLE `patient` (
  `p_id` int(250) unsigned NOT NULL AUTO_INCREMENT,
  `p_fname` varchar(45) NOT NULL,
  `p_lname` varchar(45) NOT NULL,
  `p_gender` varchar(45) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `p_address` varchar(150) NOT NULL,
  `languages` varchar(45) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- --------------------------------------------------------
    -- Table Admin
    -- ----------------------------
	CREATE TABLE `admin` (
  `id` int(250) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
-- --------------------------------------------------------
    -- Table Doctor
    -- ----------------------------
     CREATE TABLE `doctor` (
  `d_id` int(250) unsigned NOT NULL AUTO_INCREMENT,
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
 --------------------------------------------------------
    -- Table Rate
    -- ----------------------------
     CREATE TABLE `rate` (
  `r_id` int(250) unsigned NOT NULL AUTO_INCREMENT,
  `r_rate` float(10) unsigned NOT NULL,
  `d_id` int(250) unsigned NOT NULL,
  PRIMARY KEY (`r_id`)
  FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
--------------------------------------------------------
    -- Table Comment
    -- ----------------------------
     CREATE TABLE `comment` (
  `c_id` int(250) unsigned NOT NULL AUTO_INCREMENT,
  `c_comment` varchar(255) NOT NULL,
  `d_id` int(250) unsigned NOT NULL,
  PRIMARY KEY (`c_id`)
  FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8