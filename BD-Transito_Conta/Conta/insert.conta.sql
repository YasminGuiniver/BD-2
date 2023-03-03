USE bdConta

INSERT INTO tbCliente(nomeCliente , cpfCliente)
VALUES ('Nicoly' , '1')

SELECT * FROM tbCliente

SET IDENTITY_INSERT tbConta ON
INSERT INTO tbConta (numConta , saldoConta , codCliente)
VALUES ('123456' , '100' , '1')

SELECT * FROM tbConta