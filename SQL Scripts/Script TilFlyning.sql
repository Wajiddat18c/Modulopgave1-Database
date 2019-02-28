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
-- Table `modulopg`.`areatil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`areatil` (
  `﻿Id - PK` INT(11) NOT NULL,
  `tilflytningskommune` VARCHAR(70) NOT NULL,
  `fraflytningskommune` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`﻿Id - PK`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`yearcounttil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`yearcounttil` (
  `﻿IdPK` INT(11) NOT NULL,
  `TilOGFraFK` INT(11) NOT NULL,
  `yearcount` INT(11) NOT NULL,
  `areatil_﻿Id - PK` INT(11) NOT NULL,
  PRIMARY KEY (`﻿IdPK`),
  INDEX `fk_yearcounttil_areatil_idx` (`areatil_﻿Id - PK` ASC) VISIBLE,
  CONSTRAINT `fk_yearcounttil_areatil`
    FOREIGN KEY (`areatil_﻿Id - PK`)
    REFERENCES `modulopg`.`areatil` (`﻿Id - PK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`gendertil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`gendertil` (
  `﻿Id - pk` INT(11) NOT NULL,
  `years - FK` INT(11) NOT NULL,
  `alder` VARCHAR(10) NOT NULL,
  `gender` VARCHAR(7) NOT NULL,
  `yearcounttil_﻿IdPK` INT(11) NOT NULL,
  INDEX `fk_gendertil_yearcounttil1_idx` (`yearcounttil_﻿IdPK` ASC) VISIBLE,
  PRIMARY KEY (`﻿Id - pk`),
  CONSTRAINT `fk_gendertil_yearcounttil1`
    FOREIGN KEY (`yearcounttil_﻿IdPK`)
    REFERENCES `modulopg`.`yearcounttil` (`﻿IdPK`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `modulopg`.`datatil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modulopg`.`datatil` (
  `﻿Id - PK` INT(11) NOT NULL,
  `gender - fk` INT(11) NOT NULL,
  `data` INT(11) NOT NULL,
  `gendertil_﻿Id - pk` INT(11) NOT NULL,
  PRIMARY KEY (`﻿Id - PK`),
  INDEX `fk_datatil_gendertil1_idx` (`gendertil_﻿Id - pk` ASC) VISIBLE,
  CONSTRAINT `fk_datatil_gendertil1`
    FOREIGN KEY (`gendertil_﻿Id - pk`)
    REFERENCES `modulopg`.`gendertil` (`﻿Id - pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
