USE bdMtec

INSERT tbSegundoA(nomeAlunoA,statusA)
VALUES ('YASMIN', 'APROVADO')
	,('NICOLY' ,'APROVADO')
	,('BEATRIZ' ,'APROVADO')
	,('JO�O' ,'APROVADO')
	,('ANA' ,'APROVADO')
	,('MARIA' ,'APROVADO')
	,('KARINE' ,'APROVADO')
	,('PAULA' ,'REPROVADO')
	,('MATEUS' ,'APROVADO')
	,('DAVI' ,'APROVADO')

INSERT tbSegundoB(nomeAlunoB,statusB)
VALUES ('MARIA' ,'APROVADO')
	,('KARINE' ,'APROVADO')
	,('PAULA' ,'REPROVADO')
	,('MATEUS' ,'APROVADO')
	,('DAVI' ,'APROVADO')
	,('YASMIN', 'APROVADO')
	,('NICOLY' ,'APROVADO')
	,('BEATRIZ' ,'APROVADO')
	,('JO�O' ,'REPROVADO')
	,('ANA' ,'REPROVADO')

SELECT *FROM tbSegundoA
SELECT *FROM tbSegundoB