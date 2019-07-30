-- MySQL Workbench Synchronization
-- Generated: 2019-07-30 11:33
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: avelez

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `msa_misaliados`.`msa_independientes` (
  `IdIndependientes` INT(11) NOT NULL AUTO_INCREMENT,
  `TipoDocumento` INT(11) NOT NULL,
  `NumeroDocumento` VARCHAR(15) NOT NULL,
  `Nombres` TINYTEXT NOT NULL,
  `Apellidos` TINYTEXT NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  `Oficio` TINYTEXT NOT NULL,
  `IngresosMensualesAproximados` VARCHAR(45) NOT NULL,
  `TipoTelefono` INT(11) NOT NULL,
  `Telefono` VARCHAR(20) NOT NULL,
  `Correo` TINYTEXT NOT NULL,
  `Sexo` INT(11) NOT NULL,
  `Aprobado` BIT(1) NOT NULL,
  PRIMARY KEY (`IdIndependientes`),
  UNIQUE INDEX `IdIndependientes_UNIQUE` (`IdIndependientes` ASC) ,
  INDEX `TipoTelefono_idx` (`TipoTelefono` ASC),
  CONSTRAINT `TipoDocumento`
    FOREIGN KEY (`TipoDocumento`)
    REFERENCES `msa_misaliados`.`msa_datos_maestros` (`IdDatoMaestro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TipoTelefono`
    FOREIGN KEY (`TipoTelefono`)
    REFERENCES `msa_misaliados`.`msa_datos_maestros` (`IdDatoMaestro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `msa_misaliados`.`msa_maestros` (
  `IdMaestro` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` TINYTEXT NULL DEFAULT NULL,
  `Estado` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`IdMaestro`),
  UNIQUE INDEX `IdMaestro_UNIQUE` (`IdMaestro` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `msa_misaliados`.`msa_datos_maestros` (
  `IdDatoMaestro` INT(11) NOT NULL AUTO_INCREMENT,
  `IdMaestro` INT(11) NOT NULL,
  `NombreDato` TINYTEXT NOT NULL,
  PRIMARY KEY (`IdDatoMaestro`),
  UNIQUE INDEX `IdDatoMaestro_UNIQUE` (`IdDatoMaestro` ASC),
  INDEX `IdMaestro_idx` (`IdMaestro` ASC),
  CONSTRAINT `IdMaestro`
    FOREIGN KEY (`IdMaestro`)
    REFERENCES `msa_misaliados`.`msa_maestros` (`IdMaestro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
