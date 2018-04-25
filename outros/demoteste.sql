-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 09-Mar-2018 às 00:46
-- Versão do servidor: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demoteste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `convidado`
--

CREATE TABLE `convidado` (
  `rg` varchar(255) NOT NULL,
  `nome_convidado` varchar(255) NOT NULL,
  `evento_codigo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento`
--

CREATE TABLE `evento` (
  `codigo` bigint(20) NOT NULL,
  `data` varchar(255) DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `local` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `evento`
--

INSERT INTO `evento` (`codigo`, `data`, `horario`, `local`, `nome`) VALUES
(1, '2018-01-10', '22:00', 'Clube Social', 'Show'),
(2, '2018-01-17', '10:00', 'Praça', 'Churrasco '),
(3, '2018-01-17', '10:00', 'Praça', 'Churrasco '),
(4, '2018-11-05', '20:00', 'Pelotas', 'Teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento_convidados`
--

CREATE TABLE `evento_convidados` (
  `evento_codigo` bigint(20) NOT NULL,
  `convidados_rg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `role`
--

CREATE TABLE `role` (
  `nome_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `login` varchar(255) NOT NULL,
  `nome_completo` varchar(255) DEFAULT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_roles`
--

CREATE TABLE `usuarios_roles` (
  `usuario_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `convidado`
--
ALTER TABLE `convidado`
  ADD PRIMARY KEY (`rg`),
  ADD KEY `FK4tlkcowf3oxi1u8wmjd9bhes4` (`evento_codigo`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `evento_convidados`
--
ALTER TABLE `evento_convidados`
  ADD UNIQUE KEY `UK_op0pjrxw8cj92659adfppnwip` (`convidados_rg`),
  ADD KEY `FKswhoyqcqepjsh6xjfhrqpclsl` (`evento_codigo`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`nome_role`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`login`);

--
-- Indexes for table `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD KEY `FKefntoswg8cckktsk0ha1wpm0i` (`role_id`),
  ADD KEY `FKebiaxjbamgu326glxo1fbysuh` (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `convidado`
--
ALTER TABLE `convidado`
  ADD CONSTRAINT `FK4tlkcowf3oxi1u8wmjd9bhes4` FOREIGN KEY (`evento_codigo`) REFERENCES `evento` (`codigo`);

--
-- Limitadores para a tabela `evento_convidados`
--
ALTER TABLE `evento_convidados`
  ADD CONSTRAINT `FKbt8rk0e47tw21vfm4r1m1yftn` FOREIGN KEY (`convidados_rg`) REFERENCES `convidado` (`rg`),
  ADD CONSTRAINT `FKswhoyqcqepjsh6xjfhrqpclsl` FOREIGN KEY (`evento_codigo`) REFERENCES `evento` (`codigo`);

--
-- Limitadores para a tabela `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `FKebiaxjbamgu326glxo1fbysuh` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`login`),
  ADD CONSTRAINT `FKefntoswg8cckktsk0ha1wpm0i` FOREIGN KEY (`role_id`) REFERENCES `role` (`nome_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
