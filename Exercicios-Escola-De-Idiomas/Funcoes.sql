--FUNCTIONS

USE dboEscolaDeIdiomas

--1)Crie uma função que informada uma data da matrícula , retorne o dia da semana.
CREATE FUNCTION fc_diaDaSemana (@Data DATE)
 RETURNS VARCHAR(40)
AS
	BEGIN
		DECLARE @diaSemana VARCHAR(40)
		DECLARE @dia INT
		SET @dia = DATEPART(dw,@DATA)

		IF @dia=1
			BEGIN 
				SET @diaSemana='DOMINGO'
			END
		IF @dia=2
			BEGIN
				SET @diaSemana='SEGUNDA-FEIRA'
			END
		IF @dia=3
			BEGIN
				SET @diaSemana='TERÇA-FEIRA'
			END
		IF @dia=4
			BEGIN
				SET @diaSemana='QUARTA-FEIRA'
			END
		IF @dia=5
			BEGIN
				SET @diaSemana='QUINTA-FEIRA'
			END
		IF @dia=6
			BEGIN
				SET @diaSemana='SEXTA-FEIRA'
			END
		IF @dia=7
			BEGIN
				SET @diaSemana='SABADO'
			END

		RETURN @diaSemana
	END

	SELECT
	dataMatricula as 'DATA DA MATRICULA'
	,DiaDaSemana=dbo.fc_diaDaSemana(dataMatricula)
	FROM tbMatricula
-------------------------------------------------------------------
ALTER FUNCTION fc_tipoCarga (@carga VARCHAR)
	RETURNS VARCHAR (50)
AS
	BEGIN
		DECLARE @qtdeHorario VARCHAR (50)
		DECLARE @texto VARCHAR (60)
		SET @qtdeHorario = (SELECT cargaHorariaCurso FROM tbCurso WHERE cargaHorariaCurso = @carga)

		IF @qtdeHorario < 1000
			BEGIN
				SET @texto = 'CURSO EXTENSO'
			END
		ELSE
			BEGIN
				SET @texto = 'CURSO RÁPIDO'
			END
		RETURN @texto
	END

	SELECT cargaHorariaCurso as 'CARGA HORARIA'
	,TipoCarga = dbo.fc_tipoCarga (cargaHorariaCurso)
	FROM tbCurso
---------------------------------------------NÃO FUNCIONOU PRECISO ACHAR O ERRO-----------------
