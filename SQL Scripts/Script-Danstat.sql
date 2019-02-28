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
-- Table `modulopg`.`areadan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`areadan` (
  `﻿ID_PK` INT(11) NOT NULL,
  `Område` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`﻿ID_PK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`yearcountdan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`yearcountdan` (
  `﻿ID_PK` INT(11) NOT NULL,
  `FK_Område` INT(11) NOT NULL,
  `Year_Count` INT(11) NOT NULL,
  `areadan_﻿ID_PK` INT(11) NOT NULL,
  PRIMARY KEY (`﻿ID_PK`),
  INDEX `fk_yearcountdan_areadan_idx` (`areadan_﻿ID_PK` ASC) VISIBLE,
  CONSTRAINT `fk_yearcountdan_areadan`
    FOREIGN KEY (`areadan_﻿ID_PK`)
    REFERENCES `modulopg`.`areadan` (`﻿ID_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`genderdan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`genderdan` (
  `﻿ID` INT(11) NOT NULL,
  `Gender` TEXT NOT NULL,
  PRIMARY KEY (`﻿ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`grunddan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`grunddan` (
  `﻿ID` INT(11) NOT NULL,
  `FK_Yearcount` INT(11) NULL DEFAULT NULL,
  `Grund` VARCHAR(70) NOT NULL,
  `FK_Gender` INT(11) NULL DEFAULT NULL,
  `yearcountdan_﻿ID_PK` INT(11) NOT NULL,
  `genderdan_﻿ID` INT(11) NOT NULL,
  PRIMARY KEY (`﻿ID`, `genderdan_﻿ID`),
  INDEX `fk_grunddan_yearcountdan1_idx` (`yearcountdan_﻿ID_PK` ASC) VISIBLE,
  INDEX `fk_grunddan_genderdan1_idx` (`genderdan_﻿ID` ASC) VISIBLE,
  CONSTRAINT `fk_grunddan_yearcountdan1`
    FOREIGN KEY (`yearcountdan_﻿ID_PK`)
    REFERENCES `modulopg`.`yearcountdan` (`﻿ID_PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grunddan_genderdan1`
    FOREIGN KEY (`genderdan_﻿ID`)
    REFERENCES `modulopg`.`genderdan` (`﻿ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`datadan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`datadan` (
  `﻿ID` INT(11) NOT NULL,
  `FK-Gender` INT(11) NULL DEFAULT NULL,
  `Data` INT(11) NOT NULL,
  `grunddan_﻿ID` INT(11) NOT NULL,
  `grunddan_genderdan_﻿ID` INT(11) NOT NULL,
  PRIMARY KEY (`﻿ID`),
  INDEX `fk_datadan_grunddan1_idx` (`grunddan_﻿ID` ASC, `grunddan_genderdan_﻿ID` ASC) VISIBLE,
  CONSTRAINT `fk_datadan_grunddan1`
    FOREIGN KEY (`grunddan_﻿ID` , `grunddan_genderdan_﻿ID`)
    REFERENCES `modulopg`.`grunddan` (`﻿ID` , `genderdan_﻿ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
