-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema modulopg
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema modulopg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modulopg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `modulopg` ;

-- -----------------------------------------------------
-- Table `modulopg`.`tilfra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`tilfra` (
  `﻿Id_PK` INT(11) NOT NULL,
  `fraflytningskommune` VARCHAR(80) NULL DEFAULT NULL,
  `tilflytningskommune` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`﻿Id_PK`),
  UNIQUE INDEX `fraflytningskommune_UNIQUE` (`fraflytningskommune` ASC) VISIBLE,
  UNIQUE INDEX `tilflytningskommune_UNIQUE` (`tilflytningskommune` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`year_count`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`year_count` (
  `﻿Id_PK` INT(11) NOT NULL,
  `FK_Fra_Til` INT(11) NULL DEFAULT NULL,
  `year_count` INT(11) NULL DEFAULT NULL,
  `tilfra_﻿Id_PK` INT(11) NOT NULL,
  PRIMARY KEY (`﻿Id_PK`),
  INDEX `fk_year_count_tilfra_idx` (`tilfra_﻿Id_PK` ASC) VISIBLE,
  CONSTRAINT `fk_year_count_tilfra`
    FOREIGN KEY (`tilfra_﻿Id_PK`)
    REFERENCES `modulopg`.`tilfra` (`﻿Id_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`gender` (
  `﻿Id_PK` INT(11) NOT NULL,
  `years - FK` INT(11) NULL DEFAULT NULL,
  `alder` VARCHAR(8) NULL DEFAULT NULL,
  `gender` VARCHAR(7) NULL DEFAULT NULL,
  `year_count_﻿Id_PK` INT(11) NOT NULL,
  PRIMARY KEY (`﻿Id_PK`),
  INDEX `fk_gender_year_count1_idx` (`year_count_﻿Id_PK` ASC) VISIBLE,
  CONSTRAINT `fk_gender_year_count1`
    FOREIGN KEY (`year_count_﻿Id_PK`)
    REFERENCES `modulopg`.`year_count` (`﻿Id_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`data1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`data1` (
  `﻿Id_PK` INT(11) NOT NULL,
  `gender_FK` INT(11) NULL DEFAULT NULL,
  `data` INT(11) NULL DEFAULT NULL,
  `gender_﻿Id_PK` INT(11) NOT NULL,
  PRIMARY KEY (`﻿Id_PK`),
  INDEX `fk_data1_gender1_idx` (`gender_﻿Id_PK` ASC) VISIBLE,
  CONSTRAINT `fk_data1_gender1`
    FOREIGN KEY (`gender_﻿Id_PK`)
    REFERENCES `modulopg`.`gender` (`﻿Id_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
