USE bdMtec

MERGE tbTerceiro destino
	USING tbSegundoA origem 
	ON origem.idRMSegundo = destino.idRMTerceiro 

	 WHEN NOT MATCHED THEN

 INSERT	
	VALUES (origem.idRMSegundo, origem.nomeAlunoA, origem.statusA);
		 
