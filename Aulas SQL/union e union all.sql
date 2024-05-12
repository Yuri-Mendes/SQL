use curso;

	--SIMULANDO ERRO UNION
	SELECT 1,1
	UNION 
	SELECT 'A',2

	-- CORRETO
	SELECT '1',1
	UNION 
	SELECT 'A',2

--exemplo

	SELECT '1',1
	UNION 
	SELECT '1',1


--EXEMPLO USANDO UNION
	USE AdventureWorks2017;
	SELECT CITY
	FROM   PERSON.ADDRESS
	WHERE AddressID<15000

	UNION 

	SELECT city  
	FROM   PERSON.ADDRESS
	WHERE AddressID>=15000
	ORDER BY City;


----EXEMPLO USANDO UNION ALL -- TRAZ TODOS ATÉ DUPLICADOS

	SELECT CITY
	FROM   PERSON.ADDRESS
	WHERE AddressID<15000

	UNION ALL

	SELECT city  
	FROM   PERSON.ADDRESS
	WHERE AddressID>=15000
	ORDER BY City;

--EXEMPLO COM UNION
   USE CRM;
	SELECT cidade,        
		   codigo_pais 
	FROM   CLIENTE 
		WHERE  codigo_pais = 'US' 
		
	UNION
	 
	SELECT cidade,        
		   codigo_pais 
	FROM   CLIENTE 
		WHERE  codigo_pais = 'BR' 
	ORDER  BY cidade;

--EXEMPLO COM UNION ALL
	SELECT cidade,        
		   codigo_pais 
	FROM   CLIENTE 
		WHERE  codigo_pais = 'US' 
		
	UNION ALL
	 
   SELECT  cidade,        
		   codigo_pais 
	FROM   CLIENTE 
		WHERE  codigo_pais = 'BR' 
	ORDER  BY cidade