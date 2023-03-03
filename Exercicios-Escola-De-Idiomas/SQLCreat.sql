--CREATE

CREATE DATABASE dboEscolaDeIdiomas

USE dboEscolaDeIdiomas

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR (80) NOT NULL
	,cpfAluno VARCHAR (14)
	,dataNascAluno CHAR (10)
	,rgAluno CHAR (12)
	,naturalidadeAluno VARCHAR (80) NOT NULL
)
-------------------------------------------------------
CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY (1,1)
	,nomeCurso VARCHAR (80) NOT NULL
	,cargaHorariaCurso VARCHAR (30)
	,valorCurso INT NOT NULL
)
--------------------------------------------------------
CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY (1,1)
	,nomeTurma VARCHAR (80) NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso (codCurso)
	,horarioTurma VARCHAR (25) NOT NULL
)
------------------------------------------------------------
CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula DATETIME
	,codAluno INT FOREIGN KEY REFERENCES tbAluno (codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma (codTurma)
)
--------------------------------------------------------------
