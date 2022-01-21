-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 21-Jan-2022 às 09:08
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teste_historico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_servidor`
--

DROP TABLE IF EXISTS `dados_servidor`;
CREATE TABLE IF NOT EXISTS `dados_servidor` (
  `id_dados_servidor` int(11) NOT NULL AUTO_INCREMENT,
  `endereco_ip` varchar(20) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `navegador` varchar(150) NOT NULL,
  `sistema_operativo` varchar(150) NOT NULL,
  `host` varchar(50) NOT NULL,
  `data_rastreio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dados_servidor`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `dados_servidor`
--

INSERT INTO `dados_servidor` (`id_dados_servidor`, `endereco_ip`, `uri`, `navegador`, `sistema_operativo`, `host`, `data_rastreio`) VALUES
(1, '::1', '/operacoes/registar.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', '\"Windows\"', 'localhost:8000', '2022-01-20 21:50:34'),
(2, '::1', '/operacoes/registar.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', '\"Windows\"', 'localhost:8000', '2022-01-20 21:51:36'),
(3, '::1', '/operacoes/registar.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', '\"Windows\"', 'localhost:8000', '2022-01-20 21:52:53'),
(4, '::1', '/operacoes/registar.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', '\"Windows\"', 'localhost:8000', '2022-01-20 21:53:29'),
(5, '::1', '/operacoes/registar.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', '\"Windows\"', 'localhost:8000', '2022-01-20 21:53:43'),
(6, '::1', '/operacoes/editar.php?id=3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', '\"Windows\"', 'localhost:8000', '2022-01-20 21:55:00'),
(7, '::1', '/operacoes/eliminar.php?id=5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', '\"Windows\"', 'localhost:8000', '2022-01-20 21:55:46'),
(8, '::1', '/operacoes/eliminar.php?id=4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', '\"Windows\"', 'localhost:8000', '2022-01-20 21:55:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico_operacao`
--

DROP TABLE IF EXISTS `historico_operacao`;
CREATE TABLE IF NOT EXISTS `historico_operacao` (
  `id_historico` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_dados_servidor` int(11) NOT NULL,
  `operacao` varchar(50) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `data_operacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `codigo` varchar(20) DEFAULT NULL,
  `item` varchar(60) NOT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `fk_usuario` (`id_usuario`),
  KEY `fk_dados_servidor` (`id_dados_servidor`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `historico_operacao`
--

INSERT INTO `historico_operacao` (`id_historico`, `id_usuario`, `id_dados_servidor`, `operacao`, `descricao`, `data_operacao`, `codigo`, `item`) VALUES
(1, 1, 1, 'Registar Item', 'O item \'Computador\' foi Registado pelo Usuario \'administrador\'', '2022-01-20 21:50:34', 'HST20220120225034', 'Computador'),
(2, 1, 2, 'Registar Item', 'O item \'Impressora\' foi Registado pelo Usuario \'administrador\'', '2022-01-20 21:51:36', 'HST20220120225136', 'Impressora'),
(3, 1, 3, 'Registar Item', 'O item \'Pendrive\' foi Registado pelo Usuario \'administrador\'', '2022-01-20 21:52:53', 'HST20220120225253', 'Pendrive'),
(4, 1, 4, 'Registar Item', 'O item \'Cabo USB\' foi Registado pelo Usuario \'administrador\'', '2022-01-20 21:53:29', 'HST20220120225329', 'Cabo USB'),
(5, 1, 5, 'Registar Item', 'O item \'Mouse\' foi Registado pelo Usuario \'administrador\'', '2022-01-20 21:53:43', 'HST20220120225343', 'Mouse'),
(6, 1, 6, 'Editar Item', 'O item \'Pendrive\' foi Editado pelo Usuario \'administrador\'', '2022-01-20 21:55:00', 'HST20220120225500', 'Pendrive'),
(7, 3, 7, 'Eliminar Item', 'O item \'Mouse\' foi Eliminado pelo Usuario \'anamaria\'', '2022-01-20 21:55:46', 'HST20220120225546', 'Mouse'),
(8, 1, 8, 'Eliminar Item', 'O item \'Cabo USB\' foi Eliminado pelo Usuario \'administrador\'', '2022-01-20 21:55:51', 'HST20220120225550', 'Cabo USB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `nome_item` varchar(80) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_item`),
  UNIQUE KEY `nome_item` (`nome_item`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`id_item`, `nome_item`, `codigo`) VALUES
(1, 'Computador', 'ITEM-001'),
(2, 'Impressora', 'ITEM-002'),
(3, 'Pendrive', 'ITEM-003');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(80) NOT NULL,
  `palavra_passe` varchar(80) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nome_usuario` (`nome_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome_usuario`, `palavra_passe`) VALUES
(1, 'administrador', 'usu$rio001!'),
(2, 'manuel.jose', 'usu$rio002!'),
(3, 'anamaria', 'usu$rio003!'),
(4, 'joqim.jf', 'usu$rio004!');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `view_dados_historico`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `view_dados_historico`;
CREATE TABLE IF NOT EXISTS `view_dados_historico` (
`id_historico` int(11)
,`data_operacao` timestamp
,`operacao` varchar(50)
,`descricao` varchar(200)
,`item` varchar(60)
,`codigo` varchar(20)
,`id_dados_servidor` int(11)
,`data_rastreio` timestamp
,`endereco_ip` varchar(20)
,`uri` varchar(255)
,`navegador` varchar(150)
,`sistema_operativo` varchar(150)
,`host` varchar(50)
,`id_usuario` int(11)
,`nome_usuario` varchar(80)
,`palavra_passe` varchar(80)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `view_dados_historico`
--
DROP TABLE IF EXISTS `view_dados_historico`;

DROP VIEW IF EXISTS `view_dados_historico`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dados_historico`  AS  select `historico_operacao`.`id_historico` AS `id_historico`,`historico_operacao`.`data_operacao` AS `data_operacao`,`historico_operacao`.`operacao` AS `operacao`,`historico_operacao`.`descricao` AS `descricao`,`historico_operacao`.`item` AS `item`,`historico_operacao`.`codigo` AS `codigo`,`dados_servidor`.`id_dados_servidor` AS `id_dados_servidor`,`dados_servidor`.`data_rastreio` AS `data_rastreio`,`dados_servidor`.`endereco_ip` AS `endereco_ip`,`dados_servidor`.`uri` AS `uri`,`dados_servidor`.`navegador` AS `navegador`,`dados_servidor`.`sistema_operativo` AS `sistema_operativo`,`dados_servidor`.`host` AS `host`,`usuario`.`id_usuario` AS `id_usuario`,`usuario`.`nome_usuario` AS `nome_usuario`,`usuario`.`palavra_passe` AS `palavra_passe` from ((`historico_operacao` join `dados_servidor` on((`dados_servidor`.`id_dados_servidor` = `historico_operacao`.`id_dados_servidor`))) join `usuario` on((`usuario`.`id_usuario` = `historico_operacao`.`id_usuario`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
