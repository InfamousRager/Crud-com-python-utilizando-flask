-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Dez-2019 às 18:38
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testepythonflask`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('a3a59e0fd3c3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `profissao` varchar(30) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `data_nascimento`, `profissao`, `sexo`) VALUES
(15, 'Hans Hermann Hoppe', 'hanshoppe@mail.com', '1949-09-02 00:00:00', 'Economista', 'M'),
(17, 'Eiichiro Oda', 'eiichirooda@gmail.com', '1975-01-01 00:00:00', 'Mangaká', 'M'),
(20, 'Murray Newton Rothbard', 'Rothbard@mail.com', '1926-03-02 00:00:00', 'Economista', 'M'),
(21, 'Claude Frédéric Bastiat ', 'Bastiat@mail.com', '1801-06-29 00:00:00', 'Economista', 'M'),
(22, 'Ludwig von Mises', 'Mises@email.com', '1881-09-29 00:00:00', 'Economista', 'M'),
(23, 'Friedrich August von Hayek', 'Hayek@mail.com', '1899-05-08 00:00:00', 'Economista', 'M'),
(24, 'Baran bo Odar', 'Baran@mail.com', '1978-04-18 00:00:00', 'Diretor', 'M'),
(25, 'Rami Saíd Malek', 'Elliot@protonmail.com', '1981-05-12 00:00:00', 'Ator', 'M');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
