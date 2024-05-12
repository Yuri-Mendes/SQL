/* operadores de comparação
= IGUAL
> MAIOR QUE
< MENOR QUE
>= MAIOR OU IGUAL
<= MENOR OU IGUAL
<> DIFERENTE DE
*/

--setando o banco de dados
    use curso;

--Usando operador = 
	SELECT * FROM   senso 
	WHERE  uf ='SP';

/*
comentarios
comentarios
*/

-- mesmo exemplo testando Collate 
-- link https://docs.microsoft.com/pt-br/sql/t-sql/statements/windows-collation-name-transact-sql?view=sql-server-2017

	SELECT * FROM   senso 
	WHERE  uf ='sp';
    
	SELECT * FROM   senso 
	WHERE  nome_mun ='Águas de Lindóia';

	SELECT * FROM   senso 
	WHERE  nome_mun ='Aguas de Lindoia';

--Outro exemplo operador = 
	SELECT * FROM   senso 
	WHERE nome_mun = 'Dourado'      
	AND uf = 'SP' 

--Usando operador > 
	SELECT * FROM   senso 
	WHERE  populacao > 100000 
--Usando operador > 
	SELECT * FROM   senso 
	WHERE  populacao > 1000000

--Usando operador < 
	SELECT * FROM   senso 
	WHERE  populacao < 10000 
--Usando operador < 
	SELECT * FROM   senso 
	WHERE  populacao < 50000;

--Usando operador <= 
	SELECT * FROM   senso 
	WHERE  populacao <= 10000; 
--Usando operador <= 
	SELECT * FROM   senso 
	WHERE  populacao <= 50000

--Usando operador <> 
	SELECT * FROM   senso 
	WHERE  uf <> 'SP'        
	AND uf <> 'SC'

--Combinando operadores 
	SELECT * FROM   senso 
	WHERE  populacao <= 100000        
		AND populacao >= 50000        
		AND uf = 'SP'        
		AND nome_mun <> 'Vinhedo';
