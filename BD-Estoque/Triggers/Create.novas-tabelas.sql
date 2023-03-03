CREATE DATABASE bdEstoque

USE bdEstoque

--TABELAS SEM CHAVE ESTRANGEIRA
CREATE TABLE tbCliente(
codCliente INT PRIMARY KEY IDENTITY(1,1)
,nomeCliente VARCHAR(70) NOT NULL
,cpfCliente VARCHAR(15) NOT NULL
,emailCliente VARCHAR (90)
,sexoCliente VARCHAR (2)
,dataNascimentoCliente SMALLDATETIME NOT NULL
)

CREATE TABLE tbFabricante(
codFabricante INT PRIMARY KEY IDENTITY (1,1)
,nomeFabricante VARCHAR (90)
)

CREATE TABLE tbFornecedor(
codFornecedor INT PRIMARY KEY IDENTITY (1,1)
,nomeFornecedor VARCHAR (90)
,contatoFornecedor VARCHAR (30)
)

--TABELAS COM CHAVE ESTRANGEIRA
CREATE TABLE tbVenda(
codVenda INT PRIMARY KEY IDENTITY (1,1)
,dataVenda DATE
,valorTotalVenda MONEY
,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbProduto(
codProduto INT PRIMARY KEY IDENTITY (1,1)
,descricaoProduto VARCHAR (90)
,valorProduto MONEY
,quantidadeProduto INT 
,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
)

CREATE TABLE tbItensVenda(
codItensVenda INT PRIMARY KEY IDENTITY(1,1)
,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
,codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente)
,quantidadeItensVenda INT
,subTotalItensVenda MONEY
)

CREATE TABLE tbEntradaProduto (
 codEntrada INT PRIMARY KEY IDENTITY (1,1)
 ,dataEntrada DATETIME NOT NULL
 ,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
 ,quantidadeEntrada INT NOT NULL
)

CREATE TABLE tbSaidaProduto (
 codSaida INT PRIMARY KEY IDENTITY (1,1)
 ,dataSaida DATETIME NOT NULL
 ,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
 ,qunatidadeSaida INT NOT NULL
)