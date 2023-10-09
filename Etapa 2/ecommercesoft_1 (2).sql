-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Set-2023 às 02:26
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecommercesoft`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `idAvaliacao` int(11) NOT NULL,
  `codPedido` int(11) NOT NULL,
  `estrelas` int(11) NOT NULL,
  `data` date NOT NULL,
  `texto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `avaliacao`
--

INSERT INTO `avaliacao` (`idAvaliacao`, `codPedido`, `estrelas`, `data`, `texto`) VALUES
(8, 9, 5, '2023-08-31', 'Não curti :('),
(9, 10, 5, '2023-08-31', 'Show de Bola!!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` int(11) NOT NULL,
  `Id Endereço` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `Id Endereço`, `usuario`) VALUES
(1234567891, 1, 'Manoel Gomes'),
(1234567892, 2, 'Rodrigo Góes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comprar`
--

CREATE TABLE `comprar` (
  `codPedido` int(11) NOT NULL,
  `cpfCliente` int(11) NOT NULL,
  `codRastreio` int(11) NOT NULL,
  `codProduto` int(11) NOT NULL,
  `valor` float NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `comprar`
--

INSERT INTO `comprar` (`codPedido`, `cpfCliente`, `codRastreio`, `codProduto`, `valor`, `quantidade`, `data`) VALUES
(9, 1234567891, 6, 7, 500, 1, '2023-08-31'),
(10, 1234567892, 7, 6, 2000, 1, '2023-08-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `Id` int(11) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Bairro` varchar(100) NOT NULL,
  `Rua` varchar(100) NOT NULL,
  `Número` int(11) NOT NULL,
  `CEP` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`Id`, `Estado`, `Cidade`, `Bairro`, `Rua`, `Número`, `CEP`) VALUES
(1, 'São Paulo', 'Campinas', 'Cambui', 'Rua Thudosbango Tchudosbago', 1, '13065040'),
(2, 'São Paulo', 'Horto City', 'Amanda 1', 'Rua road', 2, '13065041');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador`
--

CREATE TABLE `entregador` (
  `codEntregador` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `entregador`
--

INSERT INTO `entregador` (`codEntregador`, `nome`) VALUES
(1, 'Jorge Santos'),
(2, 'Josefino Pinto'),
(3, 'Flavio Chuseo'),
(4, 'Emanuel Garga'),
(5, 'BlinBlin Boy');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregar`
--

CREATE TABLE `entregar` (
  `codRastreio` int(11) NOT NULL,
  `codEntregador` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `entregar`
--

INSERT INTO `entregar` (`codRastreio`, `codEntregador`, `data`) VALUES
(6, 5, '2023-08-09'),
(7, 4, '2023-08-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `idEstoque` int(11) NOT NULL,
  `codProduto` int(11) NOT NULL,
  `setor` varchar(50) NOT NULL,
  `capacidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`idEstoque`, `codProduto`, `setor`, `capacidade`) VALUES
(6, 6, 'Eletrônicos ', 15000),
(7, 7, 'Eletrônicos', 10000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `cnpj` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`cnpj`) VALUES
('1932576523334'),
('2132136543534');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codProduto` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `estoque` int(11) NOT NULL,
  `avaliacao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codProduto`, `idCategoria`, `nome`, `estoque`, `avaliacao`) VALUES
(6, 1, 'Celular Poggers Motorola', 1000, '5'),
(7, 3, 'Monitor Noggers 15\' 30hz', 10000, '0,1');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`idAvaliacao`),
  ADD KEY `fk codPedido` (`codPedido`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `FK id Endereco` (`Id Endereço`);

--
-- Índices para tabela `comprar`
--
ALTER TABLE `comprar`
  ADD PRIMARY KEY (`codPedido`),
  ADD KEY `fk cpf` (`cpfCliente`),
  ADD KEY `fk codRastreio` (`codRastreio`),
  ADD KEY `fk codProduto` (`codProduto`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `entregador`
--
ALTER TABLE `entregador`
  ADD PRIMARY KEY (`codEntregador`);

--
-- Índices para tabela `entregar`
--
ALTER TABLE `entregar`
  ADD PRIMARY KEY (`codRastreio`),
  ADD KEY `fk codEntregador` (`codEntregador`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`idEstoque`),
  ADD KEY `fk codProduto estoque` (`codProduto`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`cnpj`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codProduto`),
  ADD KEY `fk idCategoria` (`idCategoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cpf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234567893;

--
-- AUTO_INCREMENT de tabela `comprar`
--
ALTER TABLE `comprar`
  MODIFY `codPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `entregador`
--
ALTER TABLE `entregador`
  MODIFY `codEntregador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `entregar`
--
ALTER TABLE `entregar`
  MODIFY `codRastreio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `idEstoque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk codPedido` FOREIGN KEY (`codPedido`) REFERENCES `comprar` (`codPedido`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK id Endereco` FOREIGN KEY (`Id Endereço`) REFERENCES `endereco` (`Id`);

--
-- Limitadores para a tabela `comprar`
--
ALTER TABLE `comprar`
  ADD CONSTRAINT `fk codProduto` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`),
  ADD CONSTRAINT `fk codRastreio` FOREIGN KEY (`codRastreio`) REFERENCES `entregar` (`codRastreio`),
  ADD CONSTRAINT `fk cpf` FOREIGN KEY (`cpfCliente`) REFERENCES `cliente` (`cpf`);

--
-- Limitadores para a tabela `entregar`
--
ALTER TABLE `entregar`
  ADD CONSTRAINT `fk codEntregador` FOREIGN KEY (`codEntregador`) REFERENCES `entregador` (`codEntregador`);

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk codProduto estoque` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
