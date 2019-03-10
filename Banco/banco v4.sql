-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.19 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela db_votacao.tbl_itens_pergunta
CREATE TABLE IF NOT EXISTS `tbl_itens_pergunta` (
  `id_itens_pergunta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `imagem` varchar(250) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `id_pergunta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_itens_pergunta`),
  KEY `id_pergunta_idx` (`id_pergunta`),
  CONSTRAINT `id_pergunta_itens` FOREIGN KEY (`id_pergunta`) REFERENCES `tbl_pergunta` (`id_pergunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_votacao.tbl_logging
CREATE TABLE IF NOT EXISTS `tbl_logging` (
  `id_logging` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(250) NOT NULL,
  `responsavel` varchar(100) NOT NULL,
  `data_criacao` time DEFAULT NULL,
  PRIMARY KEY (`id_logging`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_votacao.tbl_pergunta
CREATE TABLE IF NOT EXISTS `tbl_pergunta` (
  `id_pergunta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `pergunta` varchar(45) DEFAULT NULL,
  `id_pesquisa` int(10) unsigned NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pergunta`),
  KEY `id_pesquisa_idx` (`id_pesquisa`),
  CONSTRAINT `id_pesquisa_pergunta` FOREIGN KEY (`id_pesquisa`) REFERENCES `tbl_pesquisa` (`id_pesquisa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_votacao.tbl_pesquisa
CREATE TABLE IF NOT EXISTS `tbl_pesquisa` (
  `id_pesquisa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tema` int(11) DEFAULT NULL,
  `titulo` varchar(100) NOT NULL,
  `status` char(1) NOT NULL,
  `descricao` text,
  `imagem` varchar(250) DEFAULT NULL,
  `chave` varchar(32) DEFAULT NULL,
  `contador` int(11) DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  PRIMARY KEY (`id_pesquisa`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_votacao.tbl_usuario
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  `imagem` varchar(250) DEFAULT NULL,
  `documento` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela db_votacao.tbl_voto
CREATE TABLE IF NOT EXISTS `tbl_voto` (
  `id_voto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pergunta` int(10) unsigned NOT NULL,
  `id_item_pergunta` int(10) unsigned DEFAULT NULL,
  `escala` int(10) unsigned DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_voto`),
  KEY `id_pergunta_idx` (`id_pergunta`),
  KEY `id_item_pergunta_idx` (`id_item_pergunta`),
  CONSTRAINT `id_item_pergunta_voto` FOREIGN KEY (`id_item_pergunta`) REFERENCES `tbl_itens_pergunta` (`id_itens_pergunta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_pergunta_voto` FOREIGN KEY (`id_pergunta`) REFERENCES `tbl_pergunta` (`id_pergunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
