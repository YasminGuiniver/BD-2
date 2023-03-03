--SUB CONSUTAS BD ESCOLA DE IDIOMAS 

USE dboEscolaDeIdiomas2

--1)CRIE UMA CONSULTA QUE RETORNE O NOME E O PREÇO DOS CURSOS QUE CUSTEM ABAIXO DO VALOR MÉDIO

SELECT valorCurso , nomeCurso FROM tbCurso
WHERE valorCurso < (SELECT AVG (valorCurso) FROM tbCurso)

--2)CRIAR UMA CONSULTA QUE RETORNE O NOME E O RG DO ALUNO MAIS NOVO

SELECT nomeAluno , rgAluno FROM tbAluno
WHERE dataNascAluno = (SELECT MIN (DATA) FROM tbAluno)

--3)CRIAR UMA CONSULTA QUE RETORNE O NOME E O RG DO ALUNO MAIS VELHO

SELECT nomeAluno, rgAluno FROM tbAluno
WHERE dataNascAluno = (SELECT MAX (DATA) FROM tbAluno)

--4)CRIAR UMA CONSULTA QUE RETORNE O NOME E O VALOR DO CURSO MAIS CARO

SELECT nomeCurso , valorCurso FROM tbCurso
WHERE valorCurso = (SELECT MAX (valorCurso) FROM tbCurso)

--5)CRIAR UMA CONSULTA QUE RETORNE O NOME DO ALUNO E O NOME DO CURSO, DO ALUNO QUE FEZ A ULTIMA MATRICULA

SELECT nomeAluno , nomeCurso , dataMatricula FROM tbMatricula
INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
INNER JOIN tbCurso ON tbMatricula.codCurso = tbCurso.codCurso
WHERE dataMatricula = (SELECT MAX (DATA))

--6)CRIAR UMA CONSULTA QUE RETORNE O NOME DO PRIMEIRO ALUNO A SER MATRICULADO NA ESCOLA DE IDIOMAS 

SELECT nomeAluno , dataMatricula FROM tbMatricula
INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
WHERE dataMatricula = (SELECT MIN (DATA))

--7)CRIAR UMA CONSULTA QUE RETORNE O NOME, RG E DATA DE NASCIMENTO DE TODOS OS ALUNOS QUE ESTEJAM MATRICULADOS NO CURSO DE INGLÊS

SELECT nomeAluno  rgAluno , dataNascAluno , nomeCurso FROM tbAluno
INNER JOIN tbCurso ON tbAluno.codCurso = tbCurso.codCurso
WHERE codCurso = '1'
