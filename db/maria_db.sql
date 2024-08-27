-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.4.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- sola 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sola` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sola`;

-- 테이블 sola.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_board_user_id` (`user_id`),
  CONSTRAINT `fk_board_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='게시판';

-- 테이블 데이터 sola.board:~13 rows (대략적) 내보내기
INSERT INTO `board` (`id`, `user_id`, `title`, `content`) VALUES
	(1, 1, '제목1', '내용1'),
	(4, 1, 'bbb', 'bbb'),
	(5, 1, 'ff', '안녕'),
	(6, 1, 'ㄹㄹㄹ', 'ㄹㄹㄹ'),
	(7, 1, 'ttt', 'ttt'),
	(8, 1, 'yyy', 'yyy'),
	(9, 1, 'uuu', 'uuu'),
	(10, 1, 'dddf', 'dddf'),
	(11, 1, '제목3', '내용3'),
	(12, 1, 'abc', 'haha'),
	(13, 2, 'bbb1r', 'bbb1'),
	(15, 2, '집집집', '가고싶다'),
	(16, 2, '홈홈홈', '홈홈홈');

-- 테이블 sola.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 sola.role:~2 rows (대략적) 내보내기
INSERT INTO `role` (`id`, `name`) VALUES
	(1, 'ROLE_USER'),
	(2, 'ROLE_ADMIN');

-- 테이블 sola.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 sola.user:~5 rows (대략적) 내보내기
INSERT INTO `user` (`id`, `username`, `password`, `enabled`) VALUES
	(1, 'aaa', '$2a$10$BsFyrMzZhJpuMPuxOPXldelf7fHQ9JXYpr6HcQ8Y2Wz7wzF/lEy3C', b'1'),
	(2, 'bbb', '$2a$10$Z/AZ4sLyjc87tEgc6WtlJe.nnL5VQ.yTaNAjE3bJH/KoawG7BGMT.', b'1'),
	(3, 'ccc', '$2a$10$L/Pf8PUe0ms6/MHmMcNF.ex8y4lERvSOVTZoT6wv3WgrZk/zSKTZ2', b'1'),
	(4, 'ddd', '$2a$10$hapKaOiNIQbeY/zVKOuS9OmmwHH.nuFBZfZvV1yWm9af7ApkxR.5y', b'1'),
	(5, 'fff', '$2a$10$JguPNCN9gKqtOAkk0LMx9O8Z9dR6akgzbI5ED.gNtiHnWOLJObyp2', b'1');

-- 테이블 sola.user_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_role_id` (`role_id`),
  CONSTRAINT `fk_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자 역할\r\n제약조건: pk -> user_id, role_id (묶어서 1개\r\nfk -> user_id, role_id(각각)';

-- 테이블 데이터 sola.user_role:~6 rows (대략적) 내보내기
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(1, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
