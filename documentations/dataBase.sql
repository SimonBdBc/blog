-- MySQL Script generated by MySQL Workbench
-- Wed Nov 15 15:06:43 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`categories` (
  `idcategories` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`articles` (
  `idarticles` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(245) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `created_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` DATETIME NULL,
  `published_date` DATETIME NULL,
  `status` INT NOT NULL DEFAULT 0,
  `users_id` INT NULL,
  `categories_id` INT NULL,
  PRIMARY KEY (`idarticles`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC),
  INDEX `fk_articles_users_idx` (`users_id` ASC),
  INDEX `fk_articles_categories1_idx` (`categories_id` ASC),
  CONSTRAINT `fk_articles_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `blog`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articles_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `blog`.`categories` (`idcategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`tags` (
  `idtags` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtags`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`comments` (
  `idcomments` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `current_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `publish_date` DATETIME NOT NULL,
  `status` VARCHAR(245) NOT NULL,
  `articles_id` INT NOT NULL,
  PRIMARY KEY (`idcomments`),
  UNIQUE INDEX `title_UNIQUE` (`email` ASC),
  INDEX `fk_comments_articles1_idx` (`articles_id` ASC),
  CONSTRAINT `fk_comments_articles1`
    FOREIGN KEY (`articles_id`)
    REFERENCES `blog`.`articles` (`idarticles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`articles_has_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`articles_has_tags` (
  `articles_id` INT NOT NULL,
  `tags_id` INT NOT NULL,
  PRIMARY KEY (`articles_id`, `tags_id`),
  INDEX `fk_articles_has_tags_tags1_idx` (`tags_id` ASC),
  INDEX `fk_articles_has_tags_articles1_idx` (`articles_id` ASC),
  CONSTRAINT `fk_articles_has_tags_articles1`
    FOREIGN KEY (`articles_id`)
    REFERENCES `blog`.`articles` (`idarticles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articles_has_tags_tags1`
    FOREIGN KEY (`tags_id`)
    REFERENCES `blog`.`tags` (`idtags`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;