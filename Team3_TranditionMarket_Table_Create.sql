-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tranditionMarket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tranditionMarket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tranditionMarket` DEFAULT CHARACTER SET utf8 ;
USE `tranditionMarket` ;

-- -----------------------------------------------------
-- Table `tranditionMarket`.`market`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tranditionMarket`.`market` (
  `mno` INT NOT NULL AUTO_INCREMENT,
  `mname` VARCHAR(300) NOT NULL,
  `mtype` VARCHAR(100) NOT NULL,
  `madd` VARCHAR(100) NOT NULL,
  `period` VARCHAR(100) NOT NULL,
  `lat` VARCHAR(100) NOT NULL,
  `longi` VARCHAR(100) NOT NULL,
  `store` VARCHAR(100) NOT NULL,
  `object` VARCHAR(300) NOT NULL,
  `toilet` INT NOT NULL,
  `parking` INT NOT NULL,
  PRIMARY KEY (`mno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tranditionMarket`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tranditionMarket`.`user` (
  `uno` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NOT NULL,
  `pw` VARCHAR(45) NOT NULL,
  `uadd` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `intro` VARCHAR(9999) NULL,
  `uimg` VARCHAR(9999) NULL,
  `uname` VARCHAR(45) NOT NULL,
  `nick` VARCHAR(45) NOT NULL,
  `admin` INT NOT NULL,
  `warning` INT NULL,
  PRIMARY KEY (`uno`),
  UNIQUE INDEX `nick_UNIQUE` (`nick` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tranditionMarket`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tranditionMarket`.`board` (
  `bno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(999) NOT NULL,
  `reco` INT NULL,
  `check` INT NOT NULL,
  `content` VARCHAR(9999) NOT NULL,
  `bdate` DATETIME NOT NULL,
  `btype` VARCHAR(20) NOT NULL,
  `uno` INT NOT NULL,
  PRIMARY KEY (`bno`),
  INDEX `fk_board_user_idx` (`uno` ASC) VISIBLE,
  CONSTRAINT `fk_board_user`
    FOREIGN KEY (`uno`)
    REFERENCES `tranditionMarket`.`user` (`uno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tranditionMarket`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tranditionMarket`.`comment` (
  `cno` INT NOT NULL AUTO_INCREMENT,
  `ccontent` VARCHAR(999) NOT NULL,
  `cdate` DATETIME NOT NULL,
  `uno` INT NOT NULL,
  `bno` INT NOT NULL,
  INDEX `fk_comment_board_idx` (`bno` ASC) VISIBLE,
  INDEX `fk_comment_user_idx` (`uno` ASC) VISIBLE,
  PRIMARY KEY (`cno`),
  CONSTRAINT `fk_comment_user`
    FOREIGN KEY (`uno`)
    REFERENCES `tranditionMarket`.`user` (`uno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_board`
    FOREIGN KEY (`bno`)
    REFERENCES `tranditionMarket`.`board` (`bno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tranditionMarket`.`bookmark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tranditionMarket`.`bookmark` (
  `bmno` INT NOT NULL AUTO_INCREMENT,
  `mno` INT NOT NULL,
  `uno` INT NOT NULL,
  PRIMARY KEY (`bmno`),
  INDEX `fk_bookmark_user1_idx` (`uno` ASC) VISIBLE,
  CONSTRAINT `fk_bookmark_user`
    FOREIGN KEY (`uno`)
    REFERENCES `tranditionMarket`.`user` (`uno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_bookmark_market`
    FOREIGN KEY (`mno`)
    REFERENCES `tranditionMarket`.`market` (`mno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tranditionMarket`.`mimg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tranditionMarket`.`mimg` (
  `mino` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(999) NOT NULL,
  `mno` INT NOT NULL,
  PRIMARY KEY (`mino`),
  CONSTRAINT `fk_mimg_market`
    FOREIGN KEY (`mno`)
    REFERENCES `tranditionMarket`.`market` (`mno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tranditionMarket`.`banuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tranditionMarket`.`banuser` (
  `buno` INT NOT NULL AUTO_INCREMENT,
  `uno` INT NOT NULL,
  PRIMARY KEY (`buno`),
  INDEX `fk_banuser_user_idx` (`uno` ASC) VISIBLE,
  CONSTRAINT `fk_banuser_user`
    FOREIGN KEY (`uno`)
    REFERENCES `tranditionMarket`.`user` (`uno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
