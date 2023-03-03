USE bdEstoque

--ATIVIDADE DOS SLIDES

--ESSA É A PRIMEIRA - TA OK
CREATE TRIGGER tgAtualizaQuant ON tbItensVenda FOR INSERT
AS
	DECLARE @quantidadeItensVenda INT , @codProduto INT
	SELECT @quantidadeItensVenda = quantidadeItensVenda , @codProduto = codProduto FROM tbItensVenda

	UPDATE tbProduto
	SET quantidadeProduto = quantidadeProduto - @quantidadeItensVenda
	WHERE codProduto = @codProduto

	PRINT ('Quantidade de produtos atualizada' +CONVERT(VARCHAR(10) ,  @quantidadeItensVenda))
-----------------------------------------------------------------------------------------------------------------------
	INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda)
	VALUES (2,1,100,1500)
	SELECT * FROM tbProduto
-------------------------------------------------------------------------------------------------------------------------

--ESSA É A 2 - TA OK
CREATE TRIGGER tgMaisProduto ON tbEntradaProduto FOR INSERT
AS
	DECLARE @quantidadeEntrada INT , @codProduto INT
	SELECT @quantidadeEntrada = quantEntrada , @codProduto = codProduto FROM tbEntradaProduto

	UPDATE tbProduto 
	SET quantidadeProduto = quantidadeProduto + @quantidadeEntrada
	WHERE codProduto = @codProduto

	PRINT ('Quantidade de produtos atualizada' +CONVERT(VARCHAR(10) ,  @quantidadeEntrada))
---------------------------------------------------------------------------------------------------------------------
	INSERT INTO tbEntradaProduto (dataEntrada , codProduto , quantEntrada)
	VALUES (08/09/2022 , 1 , 100)
	SELECT * FROM tbProduto
-------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tbVenda
SELECT * FROM tbItensVenda
--ESSA É A 3 E NÃO TA OK
CREATE TRIGGER tbSaida ON tbIntensVenda FOR INSERT 
AS 
	DECLARE @codVenda INT , @codProduto INT , @quantidadeItensVenda
	SELECT @codVenda = codVenda ,@codProduto = codProduto , @quantidadeItensVenda = quantidadeItensVenda  FROM tbItensVenda
	
	INSERT INTO tbSaidaProduto (dataSaida , codProduto , qunatidadeSaida)
	VALUES 