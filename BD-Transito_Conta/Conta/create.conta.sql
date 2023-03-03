CREATE DATABASE bdConta

USE bdConta


CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente VARCHAR (50) NOT NULL
	,cpfCliente VARCHAR (14) NOT NULL
)

CREATE TABLE tbConta(
	 numConta INT PRIMARY KEY IDENTITY (1,1)
	,saldoConta SMALLMONEY NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbDeposito(
	codDeposito INT PRIMARY KEY IDENTITY(1,1)
	,valorDeposito MONEY NOT NULL
	,numConta INT FOREIGN KEY REFERENCES tbConta(numConta)
	,dataDeposito DATE NOT NULL
	,horaDeposito TIME NOT NULL
)

CREATE TABLE  tbSaque(
	codSaque INT PRIMARY KEY IDENTITY(1,1)
	,valorSaque MONEY NOT NULL
	,numConta INT FOREIGN KEY REFERENCES tbConta(numConta)
	,dataSaque DATE NOT NULL
	,horaSaque TIME NOT NULL
)