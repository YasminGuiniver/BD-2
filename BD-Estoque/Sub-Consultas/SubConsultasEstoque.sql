--SUBCONSULTAS BD ESTOQUE 

USE bdEstoque

--1)CRIAR UMA CONSULTA QUE RETORNE O C�DIGO DO PRODUTO, O NOME DO FABRIACANTE SOMENTE DAQUELES PRODUTOS QUE CUSTAM IGUAL AO VALOR MAIS ALTO

SELECT codProtudo , nomeFabricante , valorProduto FROM tbProduto 
INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
WHERE valorProduto = (SELECT MAX (valorProduto) FROM tbProduto)

--2)CRIAR UMA CONSULTA QUE RETORNE O NOME DO PRODUTO E O NOME DO FABRICANTE E VALOR SOMENTE DOS PRODUTOS QUE CUSTEM ACIMA DO VALOR M�DIO DOS PRODUTOS EM ESTOQUE

SELECT nomeProduto , valorProduto , nomeFabricante FROM tbProduto
INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
WHERE valorProduto > (SELECT AVG (valorProduto FROM tbProduto)

--3)CRIAR UMA CONSULTA QUE RETORNE O NOME DOS CLIENTES QUE TIVERAM VENDAS COM VALOR ACIMA DO VALOR M�DIO DAS VENDAS 

SELECT valorVenda , nomeCliente FROM tbVenda 
INNER JOIN tbCliente ON tbVenda.codCliente = tbCliente.codCliente
WHERE valorVenda > (SELECT AVG (valorVenda) FROM tbVenda)

--4)CRIAR UMA CPNSULTA QUE RETORNE O NOME E O PRE�O MAIS CAROS (ok)

SELECT descricaoProduto, valorProduto FROM tbProduto 
WHERE valorProduto = (SELECT MAX (valorProduto) FROM tbProduto)
-----------------------------------------------------------------------------------

--5)CRIAR UMA CONSULTA QUE RETORNE O NOME E O PRE�O DO PRODUTO MAIS BARATO (ok)


SELECT descricaoProduto, valorProduto FROM tbProduto 
WHERE valorProduto = (SELECT MIN (valorProduto) FROM tbProduto)
------------------------------------------------------------------------------------



