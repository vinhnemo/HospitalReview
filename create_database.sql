-- --------------------------------------------------------
    -- Table Patient
    -- ----------------------------
    SET FOREIGN_KEY_CHECKS=1;
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
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `patient_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- table token
-- ------------------------------------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
    `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
    `p_id` bigint(20) unsigned NOT NULL,
    `key` varchar(150) NULL,
    `attempt` int(10) unsigned NOT NULL,
    `date` datetime NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`p_id`) REFERENCES `patient`(`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
    -- Table Admin
    -- ----------------------------
    DROP TABLE IF EXISTS `admin`;
    CREATE TABLE `admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_uindex` (`email`)
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
-- --------------------------------------------------------
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
  `p_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`c_id`),
  FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)
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

-- ------------------------------------------------------
-- table bookmarkdoctor
-- ------------------------------------------------------
CREATE TABLE `bookmarkdoctor` (
  `p_id` bigint(20) unsigned NOT NULL ,
  `d_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`p_id`,`d_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `bookmarkdoctor_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `bookmarkdoctor_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- table bookmarkhospital
-- ------------------------------------------------------
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
-- table doctorreview
-- ------------------------------------------------------
CREATE TABLE `doctorreview` (
  `d_id` bigint(20) unsigned NOT NULL ,
  `allowReview` INT DEFAULT '1',
  PRIMARY KEY (`d_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `doctorreview_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `doctor` (`d_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ------------------------------------------------------
-- ----------------------------------
-- ------------------------------------------------------
-- ------------------------------------------------------
-- -------------- 
-- ------------------------------------------------------
-- -------------- ---------------------
CREATE TABLE `coordinate` (
  `c_id` bigint(20) unsigned NOT NULL,
  `h_id` bigint(20) unsigned NOT NULL,
  `x` float unsigned NOT NULL,
  `y` float unsigned NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `coordinate_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `hospital` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





CREATE TABLE `speciality` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `specialty` varchar(50) NOT NULL,
  `specific_specialty` varchar(50) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- ------------------------------------------------------
-- ----------------------------------
-- ------------------------------------------------------
-- -----------------------------------------------
-- ----------Database Doctor---------------------
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Hong Hoa', 'Dang', 'Female', 'phD', '1', 'Osteopathy', '8AM-4PM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Vang Thuong', 'Nguyen', 'Male', 'Professor', '0', 'Gastrointestinal', '9AM-3PM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Thi THu Hien', 'Do', 'Female', 'Masters', '1', 'Dermatology', '10AM-4PM', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Vu', 'Nguyen', 'Male', 'phD', '0', 'Neurological', '8AM-11AM', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Danh Hoa', 'Nguyen', 'Male', 'phD', '0', 'Rheumatology', '1PM-5PM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Quoc Tuan', 'Tran', 'Male', 'Masters', '1', 'Hematology', '8AM-11AM', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Quang Binh', 'Truong', 'Male', 'Professor', '1', 'Psychiatry', '8AM-11AM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Anh Tuan ', 'Ho', 'Male', 'phD', '0', 'Infectious Disease', '1PM-5PM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Minh Tuan', 'Do', 'Male', 'Masters', '0', 'Cardiology', '1PM-5PM', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Kim Thanh', 'Do', 'Male', 'phD', '0', 'Rheumatology', '9AM-12PM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Hien', 'Bui', 'Male', 'phD', '1', 'Gastrointestinal', '10AM-3PM', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Thi Thanh', 'Nguyen', 'Female', 'Bachelors', '0', 'Hematology', '8AM-5PM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Thanh Tu', 'Tran', 'Female', 'Professor', '0', 'Obstetrics', '8AM-4PM', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Tien Duc', 'Cao', 'Male', 'Professor', '1', 'Psychology', '9AM-2PM', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Hoang Kiem', 'Ha', 'Male', 'Professor', '1', 'Psychiatry', '1PM-5PM', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Bach', 'Nguyen', 'Male', 'phD', '0', 'Otolaryngology', '9AM-2PM', 'English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Ngoc Lan', 'Do', 'Female', 'Bachelor', '0', 'Gastroenterology', '10AM-3PM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Huu Thinh', 'Cao', 'Male', 'Masters', '1', 'Dermatology', '8AM-11AM', 'Vietnamese');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Dinh Toan', 'Duong', 'Male', 'phD', '1', 'Rheumatology', '9AM-2PM', 'Vietnamese, English');
INSERT INTO `doctor` (`d_fname`, `d_lname`, `d_gender`, `d_degree`, `d_insurance`, `d_speciality`, `d_hour`, `languages`) VALUES ('Ngoc', 'Ha', 'Female', 'Masters', '0', 'Gastroenterology', '8AM-2PM', 'German');

-- ------------------------------------------------------
-- ----------------------------------
-- ------------------------------------------------------
-- -----------------------------------------------
-- ----------Database Hospital---------------------
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('Bach Mai', '78 Giai Phong, Phuong Mai Ward, Dong Da District, Ha Noi', 'http://bachmai.gov.vn', 'Duyet Pham', 'duyetpham@gmail.com');
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('Cho Ray', '201B Nguyen Chi Thanh, Ward 12 ,District 5,Ho Chi Minh City', 'http://choray.vn/', 'Hung Cao', 'bvchoray@choray.vn');
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('Y Duoc Ha Noi', '1 Ton That Tung,Kim Lien Ward,Dong Da District, Ha Noi', 'http://www.benhviendaihocyhanoi.com/', 'Tien Tran', 'bvdhyd@umc.edu.vn');
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('Y Duoc Ho Chi Minh', '215 Hong Bang, Ward 11, District 5, Ho Chi Minh City', 'http://www.bvdaihoc.com.vn/', 'Hung Phan', 'hungphan6969@gmail.com');
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('FV Hospital', '6 Nguyen Luong Bang,Tan Phu Ward,District 7, Ho Chi Minh City', 'http://fvhospital.com/', 'Sinh Nguyen', 'fapvn@fapvn.vn');
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('115', '527 Su Vanh Hanh, Ward 12, District 10, Ho Chi Minh City', 'http://benhvien115.com.vn/', 'Vinh Pham', '115@gmail.com');
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('103', '261 Phung Hung.Phuc La Ward,Ha Dong District, Ha Noi', 'http://benhvien103.vn/', 'Son Nguyen', 'bv103@gmail.ocm');
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('Tu Du', '284 Cong Quynh, Pham Ngu Lao Ward,Distric 1,Ho Chi Minh City', 'http://tudu.com.vn/', 'Le Duc', 'tudu@tuduhos.com');
INSERT INTO `hospital` (`h_name`, `h_address`, `h_website`, `adname`, `ademail`) VALUES ('Viet Duc', '40 Trang Thi, Hang Bong Ward,Hoan Kiem District ,Ha Noi', 'http://benhvienvietduc.org/', 'Bao Tran', 'vietduc@vietducvn.com');

---------------Database Specialty
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('1', 'Gastroenterology', 'Gastrointestinal');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('2', 'Gastroenterology', 'Dietician');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('3', 'Gastroenterology', 'Endoscopy');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('4', 'Gastroenterology', 'Digestion');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('5', 'General Surgery', 'Rheumatology');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('6', 'General Surgery', 'Dermatology');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('7', 'General Surgery', 'Physiotherapy');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('8', 'Obstetric', 'Obstetric');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('9', 'Obstetric', 'Fertility specialist');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('10', 'General Internal', 'Cardiology');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('11', 'General Internal', 'Gastrointestinal');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('12', 'General Internal', 'Endoscopy');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('13', 'General Internal', 'Nephrology');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('14', 'General Internal', 'Pulmonology');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('15', 'General Internal', 'Infectious Disease');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('16', 'Neurology', 'Neurosurgery');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('17', 'Neurology', 'Neurological');
INSERT INTO `hospital`.`speciality` (`s_id`, `specialty`, `specific_specialty`) VALUES ('18', 'Psychiatrist', 'Psychiatrist');

-- ------------------------------------------------------
-- ----------------------------------
-- ------------------------------------------------------
-- -----------------------------------------------
-- ----------Doctor Review---------------------
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('1', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('2', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('3', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('4', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('5', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('6', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('7', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('8', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('9', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('10', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('11', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('12', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('13', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('14', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('15', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('16', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('17', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('18', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('19', '1');
INSERT INTO `doctorreview` (`d_id`, `allowReview`) VALUES ('20', '1');

