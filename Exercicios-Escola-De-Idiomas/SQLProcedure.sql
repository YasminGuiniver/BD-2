--FAZENDO PROCEDURE

USE dboEscolaDeIdiomas

--1-)CRIAR UMA STORED PROCEDURE "BUSCA_ALUNO" QUE RECEBA O CODIGO DO ALUNO E RETORNE SEU NOME
--E DATA DE NASCIMENTO

CREATE PROCEDURE spBuscaAluno

	@codAluno VARCHAR (10)
AS 
	SELECT nomeAluno , dataNascAluno FROM tbAluno WHERE codAluno LIKE @codAluno

EXEC spBuscaAluno '1';

--2-)CIAR UMA STORED PROCEDURE "INSERE_ALUNOS" QUE INSIRA UM REGISTRO NA TABELA ALUNOS
CREATE PROCEDURE spInserirDdaos
	@nomeAluno VARCHAR (80)
	,@dataNascAluno CHAR (10)
	, @cpfAluno VARCHAR (18)
	, @rgAluno CHAR (12)
	,@naturalidadeAluno VARCHAR (80)
AS
	INSERT INTO tbAluno (nomeAluno , dataNascAluno , rgAluno , cofAluno ,naturalidadeAluno)
	VALUES (@nomeAluno ,@dataNascAluno, @cpfAluno , @rgAluno ,@naturalidadeAluno)
	DECLARE @codAluno INT = (SELECT MAX (codAluno) FROM tbAluno)
	PRINT ('cadastro realizado com sucesso!' +@nomeAluno+ 'esse aluno foi cadastrado com o codigo' +CONVERT(VARCHAR(5) , @codAluno) )

EXEC spInserirDdaos 'Yasmin' ,'2000-03-10',  '54.909.878-0' ,'123.456.789.00' , 'SP'

--3-)CRIAR UMA STORED PROCEDURE "AUMENTA_PRE�O" QUE, DADO O NOME DO CURSO E UM PERCENTUAL,
--AUMENTE O VALOR DO CURSO COM A PORCENTAGEM INFORMADA 

CREATE PROCEDURE spAumentaPreco
	@nomeCurso VARCHAR (80)
	,@porcentual DECIMAl
AS
BEGIN
	DECLARE @Valor DECIMAL (10,5);
		SET @valor = (1 + (@porcentual / 100));
UPDATE tbCurso
	SET valorCurso = @Valor
END 
	PRINT ('o novo valor � de: '+@Valor)

EXEC spAumentaPreco 'Espanhol' ,'18';

--4-)CRIAR UMA STORED PROCEDURE "EXIBE_TURMA" QUE, DADO O NOME DA TURMA EXIBA TODAS AS INFORA��ES
--DELA
CREATE PROCEDURE spExibe_turma
	@nomeTurma VARCHAR (80)
AS
	SELECT * FROM tbTurma

EXEC spExibe_turma '1A';

--5-)CRIAR UMA STORED PROCEDURE "EXIBE_ALUNOSTURMA" QUE, DADO O NOME DA TURMA EXIBA OS SEUS
--ALUNOS

CREATE PROCEDURE spExibe_AlunosTurma
	@nomeTurma VARCHAR (80)
	,@nomeAluno VARCHAR (80)
AS
	BEGIN
	DECLARE @cod INT = (SELECT codTurma AS 'Codigo da turma' , codAluno AS 'codigo do aluno'
		INNER JOIN tbMatricula on tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno)
		PRINT ('A tumra ' +CONVERT VARCHAR (8) , @cod+ ' tem os alunos: ' +@nomeAluno)
EXEC spExibe_AlunosTurma '1A' ,'Yasmin'

--6-)CRIAR UMA STORED PROCEDURE PARA INSERIR ALUNOS, VERIFICANDO PELO CPF SE O ALUNO EXISTE OU N�O,
--E INFORMAR ESSA CONDI��O VIA MNESAGEM

CREATE PROCEDURE spInserirVerificandoTESTE7
	@nomeAluno VARCHAR (80)
	,@dataNascAluno CHAR (10)
	, @cpfAluno VARCHAR (18)
	, @rgAluno CHAR (12)
	,@naturalidadeAluno VARCHAR (80)

AS
	IF EXISTS (SELECT cofAluno FROM tbAluno WHERE cofAluno LIKE @cpfAluno)
			BEGIN
				PRINT ('N�o � possiv�l cadastrar esse aluno, pois o CPF ' +@cpfAluno+ ' ja est� cadastrado')
	END
	ELSE 
		BEGIN
			INSERT INTO tbAluno (nomeAluno , dataNascAluno , cofAluno , rgAluno ,naturalidadeAluno)
				VALUES (@nomeAluno ,@dataNascAluno, @cpfAluno , @rgAluno ,@naturalidadeAluno)
			DECLARE @codAluno INT = (SELECT MAX (codAluno) FROM tbAluno)
			PRINT ('Aluno (a) ' +@nomeAluno+ ' cadastrado com sucesso ' +CONVERT(VARCHAR(6) , @codAluno))
	END

EXEC spInserirVerificandoTESTE7 'Aline Melo' , '2001-10-08 ' , '88.365.012-35' , '777.444.111-33' ,'RJ'

--7-)CRIAR UMA STORED PROCEDURE QUE RECEBA O NOME DO CURSO E O NOME DO ALUNO E O MATRICULE O MESMO NO CURSO PRETENDIDO
CREATE PROCEDURE spMatricula
	@nomeCurso VARCHAR (80)
	,@nomeAluno VARCHAR (80)
	,@dataMatricula DATETIME
AS 
	BEGIN
		INSERT INTO tbTurma (nomeCurso , codCurso , dataMatricula)
			VALUES (@nomeCurso , @nomeAluno , @dataMatricula)
		PRINT ('O aluno (A) '+@nomeAluno+ ' foi matriculado no curso' +@nomeCurso+ ' com sucesso')
	
EXEC spMatricula 'Espanhol', 'Yasmin', '2022_08_17'