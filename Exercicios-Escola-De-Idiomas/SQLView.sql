USE dboEscolaDeIdiomas2

--1)CRIAR A VIEW E APRESENTAR DE ACORDO COM A MEDIA DE VALOR
CREATE VIEW vwPrecoBaixo AS
	SELECT codCurso , nomeCurso , cargaHorariaCurso , valorCurso 
	FROM tbCurso
	WHERE valorCurso < 300

	SELECT * FROM vwPrecoBaixo

--2)ORDERNAR POR ORDEM ALFABETICA
	SELECT * FROM vwPrecoBaixo
	SELECT cargaHorariaCurso FROM tbCurso
	GROUP BY cargaHorariaCurso


--3)QUANTIDADE DE ALUNOS POR CURSO
CREATE VIEW vwQtdeAlunoCurso AS 
	SELECT COUNT(nomeAluno) AS QuantidadeAluno, nomeCurso, nomeTurma FROM tbAluno

	INNER JOIN  tbMatricula on tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN  tbTurma on tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN  tbCurso on tbCurso.codCurso = tbTurma.codCurso

	GROUP BY nomeCurso, nomeTurma

SELECT * FROM vwQtdeAlunoCurso

--4)USANDO A VIEW APRESENTE A TURMA COM MAIOR NUMEROS DE ALUNOS

	SELECT MAX(QuantidadeAluno) FROM vwQtdeAlunoCurso
	SELECT nomeCurso FROM vwQtdeAlunoCurso
	WHERE QuantidadeAluno = 3
	

--5) QUNATIDADE DE TURMAS VIEW
CREATE VIEW vwQtdeTurma AS
	SELECT COUNT (tbTurma.codCurso) AS Quantidade , nomeCurso FROM tbTurma
		INNER JOIN tbCurso ON tbTurma.codCurso =  tbCurso.codCurso
		GROUP BY nomeCurso

SELECT * FROM vwQtdeTurma

--6)APRESENTANDO O COM MENOR NUMERO 

	SELECT MIN(Quantidade) FROM vwQtdeTurma
	SELECT nomeCurso FROM vwQtdeTurma 
	WHERE Quantidade = 1 
		



	

