USE bdConta
 
--a)

CREATE TRIGGER tgSaldoDeposito ON tbDeposito FOR INSERT 
AS
DECLARE @valorDeposito MONEY, @dataDeposito DATE,  @horaDeposito TIME, @numConta INT 

SELECT @valorDeposito = valorDeposito, @dataDeposito = dataDeposito,
@horaDeposito = horaDeposito, @numConta = numConta FROM inserted 

UPDATE tbConta
SET saldoConta = saldoConta + @valorDeposito
WHERE numConta = @numConta

PRINT('Saldo da conta foi atualizado com sucesso!' +CONVERT(VARCHAR(10), @valorDeposito))

INSERT tbDeposito(valorDeposito, dataDeposito, horaDeposito, numConta)
VALUES ('50', '01/05/2021', '09:00:00', '123456')

SELECT * FROM tbConta
SELECT * FROM tbDeposito

--b)
CREATE TRIGGER tgSaldoSaque ON tbSaque FOR INSERT
AS
 DECLARE @valorSaque MONEY, @dataSaque DATE, @horaSaque TIME, @numConta INT
SELECT @valorSaque = valorSaque, @dataSaque = dataSaque,
@horaSaque = horaSaque, @numConta = numConta FROM INSERTED

UPDATE tbConta
SET saldoConta = saldoConta - @valorSaque
WHERE numConta = @numConta

PRINT('Saldo da conta foi atualizado com sucesso!' +CONVERT(VARCHAR(10), @valorSaque))

INSERT tbSaque(valorSaque, dataSaque, horaSaque, numConta)
VALUES (90, '12/11/2021', '20:00:00', '123456')

SELECT * FROM tbConta
SELECT * FROM tbSaque
