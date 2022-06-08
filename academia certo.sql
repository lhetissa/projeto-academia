-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Nov-2021 às 00:37
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `academia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_professores`
--

CREATE TABLE `aluno_professores` (
  `aluno_cpf` varchar(255) NOT NULL,
  `professores_cpf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_treinos`
--

CREATE TABLE `aluno_treinos` (
  `alunos_cpf` varchar(255) NOT NULL,
  `treinos_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor_treinos`
--

CREATE TABLE `professor_treinos` (
  `professores_cpf` varchar(255) NOT NULL,
  `treinos_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `treino`
--

CREATE TABLE `treino` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `exercicios` varchar(255) DEFAULT NULL,
  `grupo_muscular` varchar(255) DEFAULT NULL,
  `tipo_treino` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `UK_3wpes15e0anbfaa4do0pey97k` (`email`);

--
-- Índices para tabela `aluno_professores`
--
ALTER TABLE `aluno_professores`
  ADD KEY `FK48jrp6ghva38ep13u0cqh9pyb` (`professores_cpf`),
  ADD KEY `FKsxl1t6md3ecpvmfevh3fy3wk0` (`aluno_cpf`);

--
-- Índices para tabela `aluno_treinos`
--
ALTER TABLE `aluno_treinos`
  ADD KEY `FKexj1ittkmelpurx028ydxmh1e` (`treinos_id`),
  ADD KEY `FKls3a2y5k0njm57yr7r3mplfv5` (`alunos_cpf`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `UK_qjm28ojevoom770jyieljec3e` (`email`);

--
-- Índices para tabela `professor_treinos`
--
ALTER TABLE `professor_treinos`
  ADD KEY `FKpr6v1oyu537ltsjrm5g4h2axj` (`treinos_id`),
  ADD KEY `FKp8yi9hmljr3xepvth6au8vthc` (`professores_cpf`);

--
-- Índices para tabela `treino`
--
ALTER TABLE `treino`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno_professores`
--
ALTER TABLE `aluno_professores`
  ADD CONSTRAINT `FK48jrp6ghva38ep13u0cqh9pyb` FOREIGN KEY (`professores_cpf`) REFERENCES `professor` (`cpf`),
  ADD CONSTRAINT `FKsxl1t6md3ecpvmfevh3fy3wk0` FOREIGN KEY (`aluno_cpf`) REFERENCES `aluno` (`cpf`);

--
-- Limitadores para a tabela `aluno_treinos`
--
ALTER TABLE `aluno_treinos`
  ADD CONSTRAINT `FKexj1ittkmelpurx028ydxmh1e` FOREIGN KEY (`treinos_id`) REFERENCES `treino` (`id`),
  ADD CONSTRAINT `FKls3a2y5k0njm57yr7r3mplfv5` FOREIGN KEY (`alunos_cpf`) REFERENCES `aluno` (`cpf`);

--
-- Limitadores para a tabela `professor_treinos`
--
ALTER TABLE `professor_treinos`
  ADD CONSTRAINT `FKp8yi9hmljr3xepvth6au8vthc` FOREIGN KEY (`professores_cpf`) REFERENCES `professor` (`cpf`),
  ADD CONSTRAINT `FKpr6v1oyu537ltsjrm5g4h2axj` FOREIGN KEY (`treinos_id`) REFERENCES `treino` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
