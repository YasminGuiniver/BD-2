CREATE DATABASE bdTransito

USE bdTransito

--TABELAS SEM CHAVE ESTRANGEIRA
CREATE TABLE tbMotorista(
 idMotorista INT PRIMARY KEY IDENTITY (1,1)
 ,nomeMotorista VARCHAR (80) NOT NULL
 ,dataNascimentoMotorista DATETIME NOT NULL
 ,cpfMotorista VARCHAR (14) NOT NULL
 ,CNHMotorista VARCHAR (10) NOT NULL
 ,pontuaçãoAcumulada INT NOT NULL
)

--TABELAS COM CHAVE ESTRANGEIRA
CREATE TABLE tbVeiculo(
 idVeiculo INT PRIMARY KEY IDENTITY (1,1)
 ,modeloVeiculo VARCHAR (80) NOT NULL
 ,placa VARCHAR (10) NOT NULL
 ,renavam VARCHAR (15)
 ,anoVeiculo DATE NOT NULL
 ,idMotorista INT FOREIGN KEY REFERENCES tbMotorista (idMotorista)
)

CREATE TABLE tbMultas (
 idMulta INT PRIMARY KEY IDENTITY (1,1)
 ,dataMulta DATETIME NOT NULL
 ,pontosMulta INT
 ,idVeiculo INT FOREIGN KEY REFERENCES tbVeiculo (idVeiculo)
 )