-- MySQL Workbench Forward Engineering
-- Projeto de modelagem de banco de dados para clínica de fisioterapia

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trabalhoeqp8
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trabalhoeqp8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabalhoeqp8` DEFAULT CHARACTER SET utf8 ;
USE `trabalhoeqp8` ;

-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Paciente` (
  `id_paciente` INT NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `diagnostico_inicial` VARCHAR(45) NULL,
  `indicacao_tratamento` VARCHAR(45) NULL,
  `nome_completo` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Fisioterapeuta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Fisioterapeuta` (
  `id_fisioterapeuta` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  `nome_completo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fisioterapeuta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Avaliacao` (
  `id_avaliacao` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  `recomendacao` VARCHAR(45) NULL,
  `progresso_percentual` FLOAT NULL,
  `avaliacao` VARCHAR(45) NULL,
  `data_avaliacao` DATE NULL,
  `id_fisioterapeuta` INT NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  INDEX `fk_id_avaliacaopaciente_idx` (`id_paciente` ASC) VISIBLE,
  INDEX `fk_id_avaliacaofisioterapeuta_idx` (`id_fisioterapeuta` ASC) VISIBLE,
  CONSTRAINT `fk_id_avaliacaopaciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `trabalhoeqp8`.`Paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_avaliacaofisioterapeuta`
    FOREIGN KEY (`id_fisioterapeuta`)
    REFERENCES `trabalhoeqp8`.`Fisioterapeuta` (`id_fisioterapeuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Telefone` (
  `id_telefone` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  `eh_whatsapp` TINYINT NULL,
  `numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_telefone`, `id_paciente`),
  INDEX `fk_id_paciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_id_telefonepaciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `trabalhoeqp8`.`Paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Exame` (
  `id_exame` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  `data_exame` DATE NOT NULL,
  `imagem_resultado` VARCHAR(45) NULL,
  `tipo_exame` VARCHAR(45) NOT NULL,
  `laudo_resultado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_exame`, `id_paciente`),
  INDEX `fk_id_examepaciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_id_examepaciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `trabalhoeqp8`.`Paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Telefone_de_contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Telefone_de_contato` (
  `id_telefone` INT NOT NULL,
  `id_fisioterapeuta` INT NOT NULL,
  `eh_whatsapp` TINYINT NULL,
  `numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_telefone`, `id_fisioterapeuta`),
  INDEX `fk_id_telefonefisioterapeuta_idx` (`id_fisioterapeuta` ASC) VISIBLE,
  CONSTRAINT `fk_id_telefonefisioterapeuta`
    FOREIGN KEY (`id_fisioterapeuta`)
    REFERENCES `trabalhoeqp8`.`Fisioterapeuta` (`id_fisioterapeuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Plano_Saude`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Plano_Saude` (
  `id_plano` INT NOT NULL,
  `nome_plano` VARCHAR(45) NULL,
  PRIMARY KEY (`id_plano`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Procedimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Procedimento` (
  `id_procedimento` INT NOT NULL,
  `nome_procedimento` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `valor_particular` VARCHAR(45) NULL,
  `id_plano` INT NOT NULL,
  PRIMARY KEY (`id_procedimento`),
  INDEX `fk_id_procedimentoplano_idx` (`id_plano` ASC) VISIBLE,
  CONSTRAINT `fk_id_procedimentoplano`
    FOREIGN KEY (`id_plano`)
    REFERENCES `trabalhoeqp8`.`Plano_Saude` (`id_plano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Sessao` (
  `id_sessao` INT NOT NULL,
  `id_procedimento` INT NOT NULL,
  `data_sessao` DATETIME NOT NULL,
  `status_pagamento` VARCHAR(45) NULL,
  `modalidade_pagamento` VARCHAR(45) NULL,
  `valor_pago` FLOAT NULL,
  `id_fisioterapeuta` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`id_sessao`),
  INDEX `fk_id_sessaopaciente_idx` (`id_paciente` ASC) VISIBLE,
  INDEX `fk_id_sessaofisioterapeuta_idx` (`id_fisioterapeuta` ASC) VISIBLE,
  INDEX `fk_id_sessaoprocedimento_idx` (`id_procedimento` ASC) VISIBLE,
  CONSTRAINT `fk_id_sessaopaciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `trabalhoeqp8`.`Paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_sessaofisioterapeuta`
    FOREIGN KEY (`id_fisioterapeuta`)
    REFERENCES `trabalhoeqp8`.`Fisioterapeuta` (`id_fisioterapeuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_sessaoprocedimento`
    FOREIGN KEY (`id_procedimento`)
    REFERENCES `trabalhoeqp8`.`Procedimento` (`id_procedimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhoeqp8`.`Horario_Fisioterapeuta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhoeqp8`.`Horario_Fisioterapeuta` (
  `id_horario` INT NOT NULL,
  `id_fisioterapeuta` INT NOT NULL,
  `dia_semana` VARCHAR(45) NULL,
  `hora_inicio` TIME NULL,
  `hora_fim` TIME NULL,
  PRIMARY KEY (`id_horario`),
  INDEX `fk_id_horariofisioterapeuta_idx` (`id_fisioterapeuta` ASC) VISIBLE,
  CONSTRAINT `fk_id_horariofisioterapeuta`
    FOREIGN KEY (`id_fisioterapeuta`)
    REFERENCES `trabalhoeqp8`.`Fisioterapeuta` (`id_fisioterapeuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
