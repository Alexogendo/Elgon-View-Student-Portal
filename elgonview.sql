-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 27, 2019 at 08:34 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elgonview`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `GetAllDegrees`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllDegrees` (IN `inst_id` INT(11))  BEGIN
 select * 
 from degree 
 where institute_id=inst_id;
 END$$

DROP PROCEDURE IF EXISTS `GetContactList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetContactList` (IN `login_user` INT(11))  BEGIN
 SELECT * 
 FROM user
 JOIN contact
 ON contact_id = id
 WHERE user_id = login_user;
 END$$

DROP PROCEDURE IF EXISTS `GetMsgList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMsgList` (IN `from_id` INT(11), IN `login_user` INT(11))  BEGIN
 SELECT * 
 FROM chat
 WHERE (sent_from = from_id and sent_to = login_user) or (sent_from = login_user and sent_to = from_id);
 END$$

DROP PROCEDURE IF EXISTS `Login`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Login` (IN `email` TEXT, IN `passwd` VARCHAR(32))  BEGIN
 SELECT * 
 FROM user
 WHERE email_id = email and password = passwd;
 END$$

DROP PROCEDURE IF EXISTS `msg_counter`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `msg_counter` (IN `id` INT(11))  BEGIN
 SELECT * 
 FROM chat
 WHERE sent_to = id;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `article_tbl`
--

DROP TABLE IF EXISTS `article_tbl`;
CREATE TABLE IF NOT EXISTS `article_tbl` (
  `a_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `loca_id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `status` char(10) NOT NULL,
  `note` varchar(100) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article_tbl`
--

INSERT INTO `article_tbl` (`a_id`, `loca_id`, `title`, `content`, `status`, `note`) VALUES
(2, 1, 'Student Entry', 'link to other page', 'Private', 'ttt'),
(3, 1, 'Teachers Entry', 'link to teacher entry', 'Public', 'for teacher');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `sent_to` int(11) NOT NULL,
  `sent_from` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `sent_to`, `sent_from`, `message`, `sent_date`) VALUES
(111, 2, 1, 'hello', '2017-06-04 04:07:35'),
(112, 5, 1, 'Excuse me?', '2017-06-04 21:46:56'),
(113, 1, 5, 'yes?', '2017-06-05 03:40:24'),
(114, 5, 1, 'Hello???', '2017-06-05 03:41:39'),
(115, 1, 5, 'yupp??? -_-', '2017-06-05 03:42:36'),
(120, 6, 1, 'hello', '2017-06-05 08:20:34'),
(121, 7, 1, 'Hello', '2017-06-05 11:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`user_id`, `contact_id`) VALUES
(1, 5),
(1, 6),
(5, 1),
(5, 6),
(5, 7),
(5, 8),
(5, 2),
(1, 2),
(1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
CREATE TABLE IF NOT EXISTS `degree` (
  `degree_id` int(11) NOT NULL,
  `degree_name` varchar(50) NOT NULL,
  `institute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `degree`
--

INSERT INTO `degree` (`degree_id`, `degree_name`, `institute_id`) VALUES
(1, 'Bachelors in Computer Science', 7),
(2, 'Software Engineering', 7),
(3, 'Chemical Engineering', 7),
(4, 'Masters in Business Administration (MBA)', 7),
(5, 'Software Engineering', 8),
(6, 'MSc. Mining Engineering', 8),
(7, 'M.Phil. Applied Mathematics', 8);

-- --------------------------------------------------------

--
-- Table structure for table `facuties_tbl`
--

DROP TABLE IF EXISTS `facuties_tbl`;
CREATE TABLE IF NOT EXISTS `facuties_tbl` (
  `faculties_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `faculties_name` varchar(50) NOT NULL,
  `note` varchar(100) NOT NULL,
  PRIMARY KEY (`faculties_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facuties_tbl`
--

INSERT INTO `facuties_tbl` (`faculties_id`, `faculties_name`, `note`) VALUES
(2, 'Science and Technology', 'Part of science'),
(3, 'Law', 'part of Law');

-- --------------------------------------------------------

--
-- Table structure for table `has_degree`
--

DROP TABLE IF EXISTS `has_degree`;
CREATE TABLE IF NOT EXISTS `has_degree` (
  `student_id` int(11) NOT NULL,
  `degree_id` int(11) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `from_year` int(11) NOT NULL,
  `to_year` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `has_degree`
--

INSERT INTO `has_degree` (`student_id`, `degree_id`, `verified`, `from_year`, `to_year`, `institute_id`) VALUES
(1, 1, 0, 2015, 2019, 7),
(1, 6, 0, 2017, 2021, 8),
(1, 3, 0, 1999, 2015, 7),
(5, 1, 0, 2015, 2019, 7),
(13, 5, 0, 2013, 2020, 8);

-- --------------------------------------------------------

--
-- Table structure for table `has_document`
--

DROP TABLE IF EXISTS `has_document`;
CREATE TABLE IF NOT EXISTS `has_document` (
  `student_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `doc_name` varchar(30) NOT NULL,
  `file` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `has_interest`
--

DROP TABLE IF EXISTS `has_interest`;
CREATE TABLE IF NOT EXISTS `has_interest` (
  `student_id` int(11) NOT NULL,
  `interest` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `has_interest`
--

INSERT INTO `has_interest` (`student_id`, `interest`) VALUES
(1, 'Blogging'),
(1, 'Reading');

-- --------------------------------------------------------

--
-- Table structure for table `has_job`
--

DROP TABLE IF EXISTS `has_job`;
CREATE TABLE IF NOT EXISTS `has_job` (
  `student_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `has_skill`
--

DROP TABLE IF EXISTS `has_skill`;
CREATE TABLE IF NOT EXISTS `has_skill` (
  `student_id` int(11) NOT NULL,
  `skill` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `has_skill`
--

INSERT INTO `has_skill` (`student_id`, `skill`) VALUES
(5, 'Data analyst'),
(1, 'Front End Developer'),
(1, 'Python Expert'),
(1, 'Sleeping'),
(14, 'Playing guiter');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `job_id` int(11) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `location` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `salary` int(11) NOT NULL,
  `job_type` varchar(20) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_tb`
--

DROP TABLE IF EXISTS `location_tb`;
CREATE TABLE IF NOT EXISTS `location_tb` (
  `loca_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `l_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `note` varchar(150) NOT NULL,
  PRIMARY KEY (`loca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_tb`
--

INSERT INTO `location_tb` (`loca_id`, `l_name`, `description`, `note`) VALUES
(1, 'left menu', 'link to other page', 'menu'),
(2, 'Reports', 'Stores reports', 'Reports are for both students and staff.');

-- --------------------------------------------------------

--
-- Table structure for table `stu_score_tbl`
--

DROP TABLE IF EXISTS `stu_score_tbl`;
CREATE TABLE IF NOT EXISTS `stu_score_tbl` (
  `ss_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `stu_id` int(10) NOT NULL,
  `faculties_id` int(10) NOT NULL,
  `sub_id` int(10) NOT NULL,
  `miderm` float NOT NULL,
  `final` float NOT NULL,
  `note` varchar(100) NOT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stu_score_tbl`
--

INSERT INTO `stu_score_tbl` (`ss_id`, `stu_id`, `faculties_id`, `sub_id`, `miderm`, `final`, `note`) VALUES
(1, 1, 2, 1, 39, 39, 'good'),
(2, 1, 2, 2, 40, 40, 'top score'),
(6, 1, 2, 3, 30, 34, 'good'),
(7, 1, 2, 4, 40, 39, 'top'),
(8, 1, 2, 5, 57, 40, 'good'),
(9, 1, 2, 6, 54, 39, 'good'),
(10, 2, 2, 1, 48, 40, 'good'),
(11, 2, 2, 2, 60, 40, 'good'),
(12, 2, 2, 3, 57, 40, 'good'),
(13, 2, 2, 4, 57, 40, 'good'),
(15, 2, 2, 5, 48, 40, 'good'),
(16, 2, 2, 6, 59, 39, 'good'),
(17, 3, 2, 1, 53, 34, 'good'),
(18, 3, 2, 2, 40, 40, 'good'),
(19, 3, 2, 3, 48, 40, 'good'),
(20, 3, 2, 4, 40, 34, 'good'),
(21, 3, 2, 5, 49, 34, 'good'),
(22, 3, 2, 6, 54, 34, 'good'),
(23, 4, 2, 1, 59, 40, 'good'),
(24, 4, 2, 2, 53, 40, 'good'),
(25, 4, 2, 3, 59, 40, 'good'),
(26, 4, 2, 4, 58, 40, 'good'),
(27, 4, 2, 5, 58, 40, 'good'),
(28, 4, 2, 6, 59, 40, 'good');

-- --------------------------------------------------------

--
-- Table structure for table `stu_tbl`
--

DROP TABLE IF EXISTS `stu_tbl`;
CREATE TABLE IF NOT EXISTS `stu_tbl` (
  `stu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL DEFAULT '1234',
  `gender` char(10) NOT NULL,
  `dob` date NOT NULL,
  `pob` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `note` varchar(100) NOT NULL,
  `img_url` varchar(255) NOT NULL DEFAULT 'images/dp.png	',
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stu_tbl`
--

INSERT INTO `stu_tbl` (`stu_id`, `f_name`, `l_name`, `password`, `gender`, `dob`, `pob`, `address`, `phone`, `email`, `note`, `img_url`) VALUES
(1, 'Mom', 'Vannak', '1234', 'Male', '1991-03-01', 'Takeo Province', 'Phnom Penh', '088 9 666 120', 'vannakkmum@gmail.com', 'Student', 'images/dp.png	'),
(2, 'Chon', 'Phearak', '1234', 'Male', '1990-05-04', 'Takeo Province  ', '  Phnom Penh', '015 66 77 33', 'phearakchon@yahoo.com  ', 'Student', 'images/dp.png	'),
(3, 'Soa', 'Muny', '1234', 'Male', '1988-05-05', 'Takeo Province   ', '   Phnom Penh', '097 69 90 123', 'munysoa@gmail.com   ', 'Student', 'images/dp.png	'),
(4, 'Sok', 'Cheatha', '1234', 'Female', '1989-06-06', 'Kompot', 'Phnom Penh', '099 77 66 55 ', 'cheatasok@gmail.com', 'Student', 'images/dp.png	');

-- --------------------------------------------------------

--
-- Table structure for table `sub_tbl`
--

DROP TABLE IF EXISTS `sub_tbl`;
CREATE TABLE IF NOT EXISTS `sub_tbl` (
  `sub_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `faculties_id` int(10) NOT NULL,
  `teacher_id` int(10) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `sub_name` varchar(100) NOT NULL,
  `note` varchar(100) NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_tbl`
--

INSERT INTO `sub_tbl` (`sub_id`, `faculties_id`, `teacher_id`, `semester`, `sub_name`, `note`) VALUES
(1, 2, 1, '1', 'Web Programming', 'HTML and CSS'),
(2, 2, 2, '1', 'OOP and C++', 'Part of C Language'),
(3, 2, 3, '2', 'English for Computing', 'part 2'),
(4, 2, 4, '2', 'Network', 'part2'),
(5, 2, 5, '2', 'VB.Net', 'part 2'),
(6, 2, 6, '2', 'Database', 'part 2'),
(7, 2, 4, 'One', 'IC3', 'Basic IC3');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_tbl`
--

DROP TABLE IF EXISTS `teacher_tbl`;
CREATE TABLE IF NOT EXISTS `teacher_tbl` (
  `teacher_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `gender` char(10) NOT NULL,
  `dob` date NOT NULL,
  `pob` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `salary` float NOT NULL,
  `married` char(10) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `note` varchar(100) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_tbl`
--

INSERT INTO `teacher_tbl` (`teacher_id`, `f_name`, `l_name`, `gender`, `dob`, `pob`, `address`, `degree`, `salary`, `married`, `phone`, `email`, `note`) VALUES
(1, 'Hang', 'Sovann', 'Male', '1985-03-05', 'Kandal Province', 'Phnom Penh', 'Master', 1500, 'No', '015 871 787', 'sovannhang@gmail.com', 'Teacher and Staff'),
(2, 'Pheng', 'Tola', 'Male', '1986-03-08', 'Kompong Cham Province', 'Phnom Penh', 'Bachelor', 1500, 'Yes', '016 572 393', 'tolapheng@gmail.com', 'Teacher and Staff'),
(3, 'Sann', 'Vannthoeun', 'Male', '1990-07-03', 'Kandal Province', 'kankal', 'Bachelor', 1000, 'Yes', '087 666 55 ', 'vannthoeunsann@gmail.com', 'English'),
(4, 'Tang', 'Hay', 'Male', '0000-00-00', 'Kroches', 'Phnom Penh', 'Bachelor', 1000, 'Yes', '099 77 66 33', 'haytang@gmail.com', 'network'),
(6, 'Sann', 'Sotherath', 'Male', '1985-02-01', 'Kandal Province', 'Phnom Penh', 'Bachelor', 1300, 'Yes', '012 33 44 55', 'sotherathsann@gmail.com', 'Database');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `email_id` text NOT NULL,
  `password` varchar(32) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `user_type` enum('student','institute','company') NOT NULL,
  `img_url` varchar(255) NOT NULL DEFAULT 'images/dp.png',
  `gender` varchar(20) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `pob` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `f_name`, `l_name`, `name`, `user_name`, `email_id`, `password`, `contact_no`, `user_type`, `img_url`, `gender`, `dob`, `pob`, `address`) VALUES
(1, NULL, NULL, 'Asad Ali', 'Asad', 'asad@gmail.com', 'asad', '03025855267', 'student', 'https://2.bp.blogspot.com/-oPwiFzGzO_o/V8lWeLItEiI/AAAAAAAADb4/tFg849jD-T0mCsPYvr8KrEEmTu3YZLMJACLcB/s1600/best-whatsapp-dp-quotes.jpg', NULL, NULL, NULL, NULL),
(2, NULL, NULL, 'mujeeb', 'mujeeb', 'mujeeb@gmail.com', 'asad', '0300-2222111', 'student', 'https://www.iconfinder.com/data/icons/freeline/32/account_friend_human_man_member_person_profile_user_users-256.png', NULL, NULL, NULL, NULL),
(5, NULL, NULL, 'Ajwad', 'ajwad.striker', 'ajwad@gmail.com', 'ajwad', '0301-1111111', 'company', 'images/dp.png', NULL, NULL, NULL, NULL),
(6, NULL, NULL, 'Random user', 'random', 'company@gmail.com', 'company', '0', 'company', 'images/dp.png', NULL, NULL, NULL, NULL),
(7, NULL, NULL, 'National University of Science and Technology, H-12, Islamabad', 'nust', 'admissions@nust.edu.pk', 'nust', '+92-51-90856878', 'institute', 'https://upload.wikimedia.org/wikipedia/en/thumb/2/22/NUST_Vector.svg/1026px-NUST_Vector.svg.png', NULL, NULL, NULL, NULL),
(8, NULL, NULL, 'University of Engineering and Technology, Lahore', 'uet.lahore', 'admissions@uet.edu.pk', 'uetlahore', '042-99029245', 'institute', 'https://upload.wikimedia.org/wikipedia/en/thumb/b/b0/University_of_Engineering_and_Technology_Lahore_logo.svg/1018px-University_of_Engineering_and_Technology_Lahore_logo.svg.png', NULL, NULL, NULL, NULL),
(9, NULL, NULL, 'Usman', 'baou.usman', 'usman@gmail.com', 'baou', '', 'student', 'images/dp.png', NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'Mubeen Butt', 'mubeen', 'mubeen@gmail.com', 'mubeen', '', 'student', 'images/dp.png', NULL, NULL, NULL, NULL),
(11, NULL, NULL, 'Alex Nyabuto', 'alexnyabuto', 'alexnyabuto8@gmail.com', '12345678', '0711295523', 'student', 'images/dp.png', NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'Janeffer', 'janeffer', 'janeffer@gmail.com', '12345678', '', 'student', 'images/dp.png', NULL, NULL, NULL, NULL),
(13, NULL, NULL, 'Rigan', 'rigan10', 'rigan10@gmail.com', '12345678', '0712456890', 'company', 'images/dp.png', NULL, NULL, NULL, NULL),
(14, NULL, NULL, 'Jane Kiende', 'jane10', 'kiende@gmail.com', '12345678', '2556666222', 'student', 'images/dp.png', NULL, NULL, NULL, NULL),
(15, 'Dennis', 'dennis', 'Dennis dennis', 'deb@gmail.com', 'deb@gmail.com', '1234', '074444444', 'student', 'images/dp.png', 'Male', '1995/8/9', 'kisii', '536');

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

DROP TABLE IF EXISTS `users_tbl`;
CREATE TABLE IF NOT EXISTS `users_tbl` (
  `u_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` char(10) NOT NULL,
  `note` varchar(100) NOT NULL,
  `role` enum('teacher','admin') NOT NULL DEFAULT 'teacher',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`u_id`, `username`, `password`, `type`, `note`, `role`) VALUES
(1, 'admin', 'admin', 'creator', 'creator', 'admin'),
(2, 'Alex', 'alex', 'creator', 'creator', 'teacher'),
(3, 'jane', '1234', 'creator', 'creator', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
