USE bdTransito

--CRIAR UMA TRIGGER QUE AO O VEICULO LEVAR UMA MULTA OS PONTOS DA MULTA SEJAM ATUALIZADOS NA TABELA DO
--MOTORISTA NO CAMPO PONTUA��OACUMULADA. CASO O MOTORISTA ALCANSE 20 PONTOS INFORMAR VIA MENSAGEM QUE O
--MESMO PODERA TER SUA HABILITA��O SUSPENSA

ALTER TRIGGER tgAtualiza ON tbMultas FOR INSERT
AS
	DECLARE @pontosMultas INT , @idVeiculo INT 
	SELECT @pontosMultas = pontosMulta , @idVeiculo = idVeiculo FROM tbMultas

	IF (SELECT pontua��oAcumulada >= 20 FROM tbMotorista)
		BEGIN 
		PRINT ('Voc� pode ter sua CNH suspensa')
	END
	UPDATE tbMotorista
	SET pontua��oAcumulada = pontua��oAcumulada + @pontosMultas
	

---------------------------------------------------------------
--TESTE INSERT
	INSERT INTO tbMultas(dataMulta , pontosMulta , idVeiculo)
	VALUES ('15/09/2022' , '10' , '3')
	SELECT * FROM tbMotorista
--TESTE DO IF 
	INSERT INTO tbMultas (dataMulta , pontosMulta , idVeiculo)
	VALUES (09/09/2022 , 21 , 2) 