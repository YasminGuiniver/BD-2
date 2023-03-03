USE bdTransito

INSERT INTO tbMotorista (nomeMotorista,dataNascimentoMotorista,cpfMotorista ,CNHMotorista,pontuaçãoAcumulada )
VALUES ('Yasmin' , '26/11/2005', '123.456.789-00' , '8909087772' , '0')
       ,('Nicoly', '10/08/2005' ,'098.765.543-12' , '0987237908' , '0')

	   SELECT * FROM tbMotorista

INSERT INTO tbVeiculo (modeloVeiculo,placa,renavam,anoVeiculo,idMotorista)
VALUES ('BMW 7' , 'BMI-9876' , '123.765-09', '2019' , '1')
       ,('Ferrari' , 'QWE-0979' , '234.675-98' , '2020' , '2')

	   SELECT * FROM tbVeiculo

	   SELECT * FROM tbMultas