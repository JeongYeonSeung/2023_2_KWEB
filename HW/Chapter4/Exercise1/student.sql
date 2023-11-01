CREATE TABLE `students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `student_number` INT NOT NULL,
  `addmission_year` INT NOT NULL,
  `major` VARCHAR(20) NOT NULL,
  `call_number` VARCHAR(30) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `total_credit` INT NOT NULL DEFAULT 0,
  `avg_credit` DOUBLE NOT NULL DEFAULT 0.0,
  `attending` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;