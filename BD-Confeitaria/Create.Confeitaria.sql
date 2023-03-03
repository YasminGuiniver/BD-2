CREATE DATABASE bdConfeitaria1

USE bdConfeitaria1

CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (80) NOT NULL
	,dataNascimentoCliente DATETIME NOT NULL
	,ruaCliente VARCHAR (100) NOT NULL
	,numCasaCliente VARCHAR (12) NOT NULL
	,cepCliente CHAR (8) NOT NULL
	,bairroCliente VARCHAR (50) NOT NULL
	,cidadeCliente VARCHAR (50) NOT NULL
	,estadoCliente VARCHAR (50) NOT NULL
	,cpfCliente VARCHAR (50) NOT NULL 
	,sexoCliente VARCHAR (1) NOT NULL
)

CREATE TABLE tbCategoriaProduto(
	codCategoriaProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeCategoriaProduto VARCHAR (100) NOT NULL
)

CREATE TABLE tbProduto (
	codProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeProduto VARCHAR (80) NOT NULL
	,precoKiloProduto DECIMAL NOT NULL
	,codCategoriaProduto INT FOREIGN KEY REFERENCES tbCategoriaProduto (codCategoriaProduto)
)

CREATE TABLE tbEncomenda (
	codEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,dataEncomenda DATETIME NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente)
	,valorTotalEntrega SMALLMONEY NOT NULL
	,dataEntregaEncomenda DATETIME NOT NULL
)

CREATE TABLE tbIntensEncomenda (
	codIntensEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,codEncomenda INT FOREIGN KEY REFERENCES tbEncomenda (codEncomenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
	,quantidadeKilos CHAR (8) NOT NULL
	,subTotal SMALLMONEY NOT NULL
)