
DECLARE @meuvalor DECIMAL(5,2); 
SET @meuvalor = 193.57; 

-- Or, using CAST  
SELECT Cast(@meuvalor AS VARBINARY(20)); --convertendo ao valor binário
SELECT Cast(Cast(@meuvalor AS VARBINARY(20)) AS DECIMAL(5,2));--retornando ao valor decimal

-- Or, using CONVERT  
SELECT CONVERT(VARBINARY(20), @meuvalor); --convertendo ao valor binário
SELECT CONVERT(DECIMAL(5, 2), CONVERT(VARBINARY(20), @meuvalor));--retornando ao valor decimal


-- Use CAST  
    use AdventureWorks2017

	select * from production.product

	SELECT Substring(NAME, 1, 30) AS ProductName,        
	listprice 
    FROM   production.product 
	WHERE  Cast(listprice AS INT) LIKE '3%';

-- Use CONVERT.   
	SELECT Substring(NAME, 1, 30) AS ProductName,        
	listprice 
	FROM   production.product 
    WHERE  CONVERT(INT, listprice) LIKE '3%';

--Formatando cast e arrendondando
--Usando CAST com operadores aritméticos
	SELECT Cast(Round(salesytd / commissionpct, 0) AS INT) AS formatado,        
					 (salesytd / commissionpct )  nao_format 
	FROM   sales.salesperson 
	WHERE  commissionpct <> 0

--Usando CAST para concatenar --erro
	SELECT  'A lista de preco é '+ listprice AS Lista_preco 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00

--Usando CAST para concatenar Distinct
	SELECT  distinct 'A lista de preco é '+ Cast(listprice AS VARCHAR(12)) AS Lista_preco 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00

--Usando CAST para concatenar Distinct (!Simulando erro)
	SELECT distinct  'A lista de preco é '+ listprice AS ListPrice 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00


--Usando CAST para produzir texto mais legível
	SELECT DISTINCT 
	p.NAME,
	Cast(p.NAME AS CHAR(10)) AS Nome_tratado,                 
		s.unitprice 
	FROM   sales.salesorderdetail AS s        
		JOIN production.product AS p          
		ON s.productid = p.productid 
	WHERE  p.NAME LIKE 'Long-Sleeve Logo Jersey, M';

--Usando CAST com a cláusula LIKE

	SELECT p.firstname,        
		   p.lastname,        
		   s.salesytd,        
		   s.businessentityid,        
		   Cast(Cast(s.salesytd AS INT) AS CHAR(30) )cast_1,        
		   Cast(s.salesytd AS CHAR(30)) as cast_2
	FROM   person.person AS p        
		JOIN sales.salesperson AS s          
		ON p.businessentityid = s.businessentityid 
		WHERE  Cast(Cast(s.salesytd AS INT) AS CHAR(20)) LIKE '2%';


--TRY Cast
SELECT   
    CASE WHEN TRY_CAST('TESTE' AS float) IS NULL   
    THEN 'Cast Falhou!'  
    ELSE 'Cast OK!'  
END AS Resultado; 
--TRY Cast
SELECT   
    CASE WHEN TRY_CAST(52 AS float) IS NULL   
    THEN 'Cast Falhou!'  
    ELSE 'Cast OK!'  
END AS Resultado; 


--TRY cast
SET DATEFORMAT dmy;  
SELECT TRY_CAST('12/31/2010' AS datetime) AS Resultado;  
GO

--TRY cast
SET DATEFORMAT dmy;  
SELECT TRY_CAST('05/12/2010' AS datetime) AS Resultado;  
GO  

--Simulando erro
select cast('12/31/2010' as datetime);
select try_cast('12/31/2010' as datetime);



--Exemplos Parse
--Retorna o resultado de uma expressão, convertida no tipo de dados solicitado no SQL Server
/*
string_value deve ser uma representação válida do tipo de dados solicitado, ou PARSE gera um erro.

data_type
Valor literal que representa o tipo de dados solicitado para o resultado.

culture
Cadeia de caracteres opcional que identifica a cultura na qual string_value é formatado.
*/

--Configuração Explicita de idioma
SELECT PARSE('Monday, 13 December 2010' AS datetime USING 'en-US') AS Resultado; 

SELECT PARSE('Segunda-feira, 13 Dezembro 2010' AS datetime USING 'pt-BR') AS Result; 

--Configuração implícita de idioma
SELECT PARSE('R$345,98' AS money USING 'pt-BR') AS Result; 

SELECT PARSE('$345.98' AS money USING 'en-US') AS Result; 

SET LANGUAGE 'English';  
SELECT PARSE('12/20/2010' AS datetime) AS Resultado;  

SET LANGUAGE 'Português';  
SELECT PARSE('20/12/2010' AS datetime) AS Resultado; 

--simula erro
SET LANGUAGE 'Português';  
SELECT PARSE('05/30/2010' AS datetime) AS Resultado;   

-- TRY_CONVERT
SELECT   
    CASE WHEN TRY_CONVERT(float,'TESTE') IS NULL   
    THEN 'Convert Falhou!'  
    ELSE 'Convert OK!'  
END AS Resultado; 

--TRY TRY_CONVERT
SELECT   
    CASE WHEN TRY_CONVERT(float,65) IS NULL   
    THEN 'TRY_CONVERT Falhou!'  
    ELSE 'TRY_CONVERT OK!'  
END AS Resultado; 


--TRY Convert
SET DATEFORMAT dmy;  
SELECT TRY_CONVERT(datetime, '12/31/2010' ) AS Resultado;  
GO

--TRY Convert
SET DATEFORMAT dmy;  
SELECT TRY_CONVERT(datetime,'05/12/2010') AS Resultado;  
GO  

--TRY PARSE
SELECT TRY_PARSE('Hello World!!!' AS datetime2 USING 'en-US') AS Result;

SELECT TRY_PARSE('10/05/2010' AS datetime USING 'en-US') AS Result;