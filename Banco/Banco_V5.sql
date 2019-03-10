-- MySQL Script generated by MySQL Workbench
-- 02/21/18 20:26:58
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_votacao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_votacao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_votacao` DEFAULT CHARACTER SET utf8 ;
USE `db_votacao` ;

-- -----------------------------------------------------
-- Table `db_votacao`.`tbl_logging`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votacao`.`tbl_logging` (
  `id_logging` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(250) NOT NULL,
  `responsavel` VARCHAR(100) NOT NULL,
  `data_criacao` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_logging`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_votacao`.`tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votacao`.`tbl_usuario` (
  `id_usuario` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `senha` VARCHAR(30) NULL DEFAULT NULL,
  `imagem` VARCHAR(250) NULL DEFAULT NULL,
  `documento` VARCHAR(45) NULL DEFAULT NULL,
  `telefone` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_votacao`.`tbl_pesquisa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votacao`.`tbl_pesquisa` (
  `id_pesquisa` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tema` INT(11) NULL DEFAULT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `status` CHAR(1) NOT NULL,
  `descricao` TEXT NULL,
  `imagem` VARCHAR(250) NULL DEFAULT NULL,
  `chave` VARCHAR(32) NULL DEFAULT NULL,
  `contador` INT(11) NULL DEFAULT NULL,
  `id_usuario` INT(10) UNSIGNED NULL DEFAULT NULL,
  `data_criacao` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_pesquisa`),
  INDEX `id_usuario_idx` (`id_usuario` ASC),
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_votacao`.`tbl_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_votacao`.`tbl_pergunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votacao`.`tbl_pergunta` (
  `id_pergunta` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo` INT(11) NULL DEFAULT NULL,
  `pergunta` VARCHAR(45) NULL DEFAULT NULL,
  `id_pesquisa` INT(10) UNSIGNED NOT NULL,
  `status` INT(11) NULL DEFAULT NULL,
  `obrigatorio` INT NULL,
  PRIMARY KEY (`id_pergunta`),
  INDEX `id_pesquisa_idx` (`id_pesquisa` ASC),
  CONSTRAINT `id_pesquisa_pergunta`
    FOREIGN KEY (`id_pesquisa`)
    REFERENCES `db_votacao`.`tbl_pesquisa` (`id_pesquisa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_votacao`.`tbl_itens_pergunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votacao`.`tbl_itens_pergunta` (
  `id_itens_pergunta` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero` INT(11) NOT NULL,
  `imagem` VARCHAR(250) NULL DEFAULT NULL,
  `descricao` VARCHAR(250) NULL DEFAULT NULL,
  `id_pergunta` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_itens_pergunta`),
  INDEX `id_pergunta_idx` (`id_pergunta` ASC),
  CONSTRAINT `id_pergunta_itens`
    FOREIGN KEY (`id_pergunta`)
    REFERENCES `db_votacao`.`tbl_pergunta` (`id_pergunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_votacao`.`tbl_voto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votacao`.`tbl_voto` (
  `id_voto` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_pergunta` INT(10) UNSIGNED NOT NULL,
  `id_item_pergunta` INT(10) UNSIGNED NULL DEFAULT NULL,
  `escala` INT(10) UNSIGNED NULL DEFAULT NULL,
  `texto` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_voto`),
  INDEX `id_pergunta_idx` (`id_pergunta` ASC),
  INDEX `id_item_pergunta_idx` (`id_item_pergunta` ASC),
  CONSTRAINT `id_pergunta_voto`
    FOREIGN KEY (`id_pergunta`)
    REFERENCES `db_votacao`.`tbl_pergunta` (`id_pergunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_item_pergunta_voto`
    FOREIGN KEY (`id_item_pergunta`)
    REFERENCES `db_votacao`.`tbl_itens_pergunta` (`id_itens_pergunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
