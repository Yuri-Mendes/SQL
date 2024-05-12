--CHOOSE
--Retorna o item ao índice especificado de uma lista de valores no SQL Server.
--Exemplo 1

SELECT Choose (2, 'Gerente', 'Diretor', 'Desenvolvedor', 'Tester') AS Escolhido 

--Exemplo 2
Use AdventureWorks2017

SELECT productcategoryid, --name,     
Choose (productcategoryid, 'A', 'B', 'C', 'D', 'E') AS Expressao 
FROM   production.productcategory; 

select * from production.productcategory

--select distinct productcategoryid  FROM   production.productcategory; 
--exemplo 3

 SELECT jobtitle,        
        hiredate,
		Month(hiredate)mes,        
		Choose(Month(hiredate), 'Winter', 'Winter', 'Spring', 'Spring', 
		                        'Spring','Summer', 'Summer','Summer', 
								'Autumn', 'Autumn', 'Autumn','Winter') AS Quarter_Hired 
		FROM   humanresources.employee 
		WHERE  Year(hiredate) > 2005 
		ORDER  BY Year(hiredate);

select * from humanresources.employee

--IIF
--Retorna um de dois valores, dependendo de a expressão booliana 
--ser avaliada como true ou false no SQL Server 
--Exemplo 1
 DECLARE @a INT = 45,          
		 @b INT = 40  
		 SELECT IIF (@a > @b, 'TRUE', 'FALSE') AS Resultado

DECLARE  @a INT = 45,          
		 @b INT = 40;   
		 SELECT IIF (@a > @b, 'Maior', 'Menor') AS Resultado;

DECLARE  @a INT = 45,          
		 @b INT = 40;   
		 SELECT IIF (@a < @b, 'Menor', 'Maior') AS Resultado;


--EXEMPLO 2
--IIF com constantes NULL
--O resultado dessa instrução é um erro
SELECT IIF (45 > 30, NULL, NULL) AS Result;

SELECT IIF (45 > 30, 'Menor', 'Maior') AS Result;-- correto

--EXEMPLO 3
/*IIF com parâmetros NULL
O retorno NULL.*/
	DECLARE @P INT = NULL,         
			@S INT = NULL; 
	SELECT  IIF (45 > 30, @p, @s) AS Result
