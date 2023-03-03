USE bdConfeitaria

--ESSA TA PEGANDO
--A)
CREATE PROCEDURE spCategoria
	@nomeCategoria VARCHAR (80)
AS
	INSERT INTO tbCategoriaProduto (nomeCategoriaProduto)
	VALUES (@nomeCategoria)
	PRINT ('Inserido com sucesso!')

EXEC spCategoria 'Bolo Festa'
EXEC spCategoria 'Bolo Simples'
EXEC spCategoria 'Torta'
EXEC spCategoria 'Salgado'

SELECT * FROM tbCategoriaProduto
---------------------------------------------------------------------------
--B)
CREATE PROCEDURE spInsert_Produto
	@nomeProduto VARCHAR (80)
	,@precoKiloProduto SMALLMONEY
	,@codCategoriaProduto INT
AS
	IF EXISTS (SELECT nomeProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
		BEGIN
			PRINT ('Não é possivel cadastrar, pois o ' +@nomeProduto+ 'já existe')
	END
	ELSE 
		BEGIN 
			SET IDENTITY_INSERT  tbProduto ON;
			INSERT tbProduto (nomeProduto , precoKiloProduto , codProduto)
			VALUES (@nomeProduto , @precoKiloProduto , @codCategoriaProduto)
			DECLARE @codProduto INT =(SELECT MAX (codProduto) FROM tbProduto)
			PRINT ('Produto com o código ' +CONVERT(VARCHAR(8), @codProduto)+' cadastrado com sucesso!')
	END

EXEC spInsert_Produto 'Bolo Floresta Negra' ,'42.00', '1';
EXEC spInsert_Produto 'Bolo Prestigio ','43.00', '1';
EXEC spInsert_Produto 'Bolo Nutella', '44.00', '1';
EXEC spInsert_Produto 'Bolo Formigueiro' ,'17.00', '2';
EXEC spInsert_Produto 'Bolo de Cenoura' ,'19.00', '2';
EXEC spInsert_Produto 'Torta de Palmito' ,'45.00', '3';
EXEC spInsert_Produto 'Torta de Frango e Catupiry', '47.00', '3'
EXEC spInsert_Produto 'Torta de Escarola' ,'44.00', '3';
EXEC spInsert_Produto 'Coxinha de Frango', '25.00', '4';
EXEC spInsert_Produto 'Esfiha Carne' ,'27.00', '4';
EXEC spInsert_Produto 'Folheado de Queijo' ,'31.00', '4';
EXEC spInsert_Produto 'Risoles Misto' ,'29.00', '1';

SELECT * FROM tbProduto	
--------------------------------------------------------------------------------------------
--ESSA TA PEGANDO
--C)
CREATE PROCEDURE spCliente_Cadastro
	@nomeCliente VARCHAR(60) ,@dataNascimentoCliente DATETIME , @ruaCliente VARCHAR(30), @numCasaCliente VARCHAR(10)
	,@cepCliente VARCHAR(15), @bairroCliente VARCHAR(15), @cidadeCliente VARCHAR(15), @estadoCliente CHAR(2)
	,@cpfCliente CHAR(14), @sexoCliente VARCHAR(1)
AS
	IF EXISTS (SELECT  cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
	BEGIN
		PRINT ('Cliente cpf '+@cpfCliente+'já cadastrado')
	END
	Else IF NOT (@bairroCliente LIKE 'Guainases' or @bairroCliente LIKE 'Itaquera')
		PRINT ('Não foi possível cadastrar o cliente '+@nomeCliente+' pois o bairro '+@bairroCliente+' não é atendido pela confeitaria')
	ELSE
	BEGIN
		INSERT INTO tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
		VALUES
		 (@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente)
		 PRINT ('O cliente '+@nomeCliente+' foi cadastrado com sucesso')
	END
	EXEC spCliente_Cadastro 'Samira Fatah', '05/05/1990', 'Rua Aguapeí', '1000', '08090000','Guainases','SP', 'SP', '945.946.860-87', 'F'
	EXEC spCliente_Cadastro 'Ceila Nogueira', '06/06/1992', 'Rua Andes', '234', '08456090','Guainases','SP', 'SP', '871.715.600-90', 'F'
	EXEC spCliente_Cadastro 'Paulo Cesar Siqueira', '04/04/1984', 'Rua Castelo do Piauí', '232', '08109000','Itaquera','SP', 'SP', '134.140.310-60', 'M'
	EXEC spCliente_Cadastro 'Rodrigo Favaroni', '09/04/1991', 'Rua Sansão Castelo Branco', '10', '08431090','Guainases','SP', 'SP', '914.371.000-07', 'M'
	EXEC spCliente_Cadastro 'Flávia Regina Brito', '22/04/1992', 'Rua Mariano Moro', '300', '08200123','Jaragua','SP', 'SP', '965.887.784-88', 'F'
	SELECT * FROM tbCliente
------------------------------------------------------------------------------------------------------
--ESSA TA PEGANDO
--D)
ALTER PROCEDURE spEncomendas
	 @cpfCliente CHAR(14)
	,@valorTotalEncomenda SMALLMONEY	
	,@dataEntregaEncomenda DATETIME
AS
	IF NOT EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
		BEGIN
	PRINT ('Não foi possível fazer a encomenda pois o cliente com o CPF: '+@cpfCliente+' não está cadastrado')
		END
	ELSE IF (@dataEntregaEncomenda < GETDATE())
		BEGIN
			PRINT ('Não é possível fazer uma encomenda em uma data anterior à data atual')
			END
	ELSE
		BEGIN
			DECLARE @codCliente INT
			,@nomeCliente VARCHAR(50)
			SELECT @codCliente=codCliente , @nomeCliente=nomeCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente
			INSERT INTO tbEncomenda (dataEncomenda, codCliente, valorTotalEntrega, dataEntregaEncomenda) 
			VALUES (GETDATE(), @codCliente, @valorTotalEncomenda, @dataEntregaEncomenda)
			DECLARE @codEncomenda INT
			SELECT @codEncomenda = MAX(codEncomenda) FROM tbEncomenda 
			PRINT('Encomenda '+ CONVERT(VARCHAR(6), @codEncomenda) +' para o cliente '+ @nomeCliente +' feita com sucesso')
		END
    EXEC spEncomendas '945.946.860-878', 450, '25/08/2022'
	--TESTE PARA VER SE O IF PEGA DO CLIENTE PEGA
	EXEC spEncomendas '945.946.860-111', 450, '24/02/2022'
	--TESTE PARA VER SE O IF DA DATA PEGA
	EXEC spEncomendas '945.946.860-878' , 250, '15/08/2022'

	SELECT * FROM tbEncomenda
---------------------------------------------------------------------------------------------
--ESSA ESTA PEGANDO
--E)
CREATE PROCEDURE spIntensEncomendaS
	@codEncomenda INT
	,@codProduto INT
	,@quantKilos CHAR(8)
	,@subTotal SMALLMONEY
AS
	INSERT INTO tbIntensEncomenda(codEncomenda, codProduto, quantidadeKilos, subTotal)
	VALUES ( @codEncomenda, @codProduto, @quantKilos, @subtotal)

	DECLARE @codIteEncomenda INT = (SELECT MAX(codIntensEncomenda) FROM tbIntensEncomenda)

	EXEC spIntensEncomendaS   '1', '1', '2.5', '105.00';
	EXEC spIntensEncomendaS   '1', '2', '2.6', '70.00';
	EXEC spIntensEncomendaS   '1', '3', '6', '150.00';
	EXEC spIntensEncomendaS   '1', '4', '4.3', '125.00';
	EXEC spIntensEncomendaS   '2', '1', '8', '200.00';
	EXEC spIntensEncomendaS   '1', '2', '3.2', '100.00';
	EXEC spIntensEncomendaS   '1', '3', '2', '50.00';
	EXEC spIntensEncomendaS   '2', '4', '3.5', '150.00';
	EXEC spIntensEncomendaS   '2', '1', '2.2', '100.00';
	EXEC spIntensEncomendaS   '2', '2', '3.4', '150.00';

	SELECT * FROM tbIntensEncomenda
----------------------------------------------------------------------------
--ESSA ESTÁ PEGANDO 
--H)
CREATE  PROCEDURE spExcluir_Item
	@codEncomenda INT, @codProduto INT
AS
	DECLARE @precoProduto SMALLMONEY = (SELECT subTotal FROM tbIntensEncomenda WHERE codProduto = @codProduto)
	DECLARE @dataEntregaEncomenda SMALLDATETIME = (SELECT dataEntregaEncomenda FROM tbEncomenda WHERE codEncomenda = @codEncomenda)
	IF (@dataEntregaEncomenda < GETDATE( ))
		BEGIN
			DELETE FROM tbIntensEncomenda
			WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto
			PRINT ('PRODUTO COM OCOD '+CONVERT(VARCHAR(12),@codProduto)+' REMOVIDO COM SUCESSO')
			UPDATE tbEncomenda
			SET valorTotalEntrega = valorTotalEntrega - @precoProduto
			WHERE codEncomenda LIKE @codEncomenda 
		END
EXEC spExcluir_Item '1', '1'

SELECT * FROM tbIntensEncomenda
-----------------------------------------------------------------------------------------
--ESSA TA PEGANDO +/-
--G)
CREATE PROCEDURE spExcluirCliente
	@cpfCliente CHAR(15)
	,@nomeCliente VARCHAR(60)
AS
	DECLARE @codCliente INT = (SELECT codCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
	SELECT @nomeCliente = nomeCliente FROM  tbCliente WHERE  codCliente LIKE @cpfCliente

	IF EXISTS (SELECT codCliente FROM tbEncomenda WHERE codCliente LIKE @codCliente)
	BEGIN
			PRINT('Não foi possivel remover o cliente '+@nomeCliente+ ', pois o cliente possui encomendas a serem realizadas')
		END
	ELSE
	BEGIN
			DELETE  FROM tbCliente
			WHERE cpfCliente  = @cpfCliente
			PRINT ('O Cliente ' +@nomeCliente+ ' removido com sucesso!')
	END 
	
	EXEC spExcluirCliente '871.715.600-90' ,'Ceila Nogueira'

	--TESTE PARA VER SE O IF PEG
	EXEC spExcluirCliente '134.140.310-60' ,'Samira Fatah'

	SELECT * FROM tbCliente
	SELECT * FROM tbEncomenda


--ESSAS NÃO ESTÃO PRONTAS
-- F)ALTERAR:
--1-O preço dos produtos da categoria “Bolo festa” sofreram um aumento de 10%
-- 2- O preço dos produtos categoria “Bolo simples” estão em promoção e terão um desconto de 20%;
-- 3- O preço dos produtos categoria “Torta” aumentaram 25%
-- 4- O preço dos produtos categoria “Salgado”, com exceção da esfiha de carne, sofreram um
-- aumento de 20%