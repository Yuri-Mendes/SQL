
--OPERADOR WHERE
use crm;
go	
	SELECT * FROM   
	cliente 
	WHERE  codigo_pais = 'BR';


--OPERADOR AND
	SELECT a.primeiro_nome,
	       a.ultimo_nome,
		   a.nascimento,
		   a.sexo,
		   a.etnia 
    from cliente a
	WHERE sexo='Female'
	and etnia='Eskimo';


--OPERADOR BETWEEN
	SELECT  a.primeiro_nome,
	        a.ultimo_nome,
			a.nascimento 
    from cliente a
	WHERE a.sexo='female'
	and a.nascimento between '1980-01-01' and '1990-12-31';

--OPERADOR IN
	SELECT a.primeiro_nome,
	       a.ultimo_nome,
		   a.id_profissao
    FROM CLIENTE a
	where a.id_profissao in ('91','191','151');

--OPERADOR NOT IN
	SELECT
	       a.primeiro_nome,
	       a.ultimo_nome,
		   a.id_profissao,
		   a.etnia
	 FROM CLIENTE a
	where a.id_profissao not in ('91','191')
	and a.etnia in ('Eskimo','Lumbee');


--LIKE LOCALIZA VALORES QUE CONTENHAM "OR" EM QUALQUER LUGAR

	SELECT a.primeiro_nome,
	       a.ultimo_nome
   FROM   clientea
		WHERE  a.primeiro_nome LIKE '%or%'; 

--LIKE Encontra quaisquer valores que tenham "r" na segunda posição	
	SELECT a.primeiro_nome,
	       a.ultimo_nome
	 FROM   clientea
		WHERE  a.primeiro_nome LIKE '_r%'; 

--LIKE Localiza valores que começam com "a" e possuem pelo menos 3 caracteres de comprimento
	SELECT a.primeiro_nome,
	       a.ultimo_nome 
    FROM   cliente a
		WHERE  a.primeiro_nome LIKE 'A_%_%';

--LIKE Localiza valores que começam com "a" e termina com "o"
	SELECT a.primeiro_nome,
	       a.ultimo_nome 
   FROM   cliente a
		WHERE  a.primeiro_nome LIKE 'a%o'; 

--LIKE Localiza valores que começam com "a"	
	SELECT  a.primeiro_nome,
	       a.ultimo_nome  
	FROM   clientea
		WHERE  a.primeiro_nome NOT LIKE 'a%';



--OPERADOR LIKE CORINGA []

	SELECT 	primeiro_nome,ultimo_nome
			FROM   cliente
			WHERE  primeiro_nome LIKE '[CS]he%';


		SELECT 	primeiro_nome,ultimo_nome
			FROM   cliente
			WHERE  primeiro_nome LIKE 'he[CS]%';


	SELECT 	primeiro_nome,ultimo_nome
			FROM   cliente
			WHERE  primeiro_nome LIKE 'Lui[ZS]%';
    
	
--OPERADOR NOT

USE curso;
		SELECT * FROM SENSO
			WHERE  NOME_MUN LIKE 'A%'        
			AND UF = 'SP'        
			AND NOT POPULACAO >10000;


--OPERADOR OR
		SELECT * FROM SENSO
		WHERE  POPULACAO < 50000        
		AND ( UF = 'AM' OR UF = 'PR' );

use AdventureWorks2017

--OPERADOR IS NULL
		SELECT  lastname,        
				firstname,        
				MiddleName 
		FROM   person.person 
		WHERE  MiddleName IS NULL; 

--OPERADOR IS not NULL
		SELECT  lastname,        
				firstname,        
				MiddleName 
		FROM   person.person 
		WHERE  MiddleName IS not NULL; 

--OPERADOR EXISTS

SELECT a.FirstName, a.LastName  
FROM Person.Person AS a  
WHERE EXISTS  
(SELECT *   
    FROM HumanResources.Employee AS b  
    WHERE a.BusinessEntityID = b.BusinessEntityID  
    AND a.LastName = 'Johnson');  
 	
--MESMO EXEMPLO UTILIZANDO IN
SELECT a.FirstName, a.LastName  
FROM Person.Person AS a  
WHERE a.LastName IN  
(SELECT a.LastName  
    FROM HumanResources.Employee AS b  
    WHERE a.BusinessEntityID = b.BusinessEntityID  
    AND a.LastName = 'Johnson'); 

--O exemplo a seguir mostra duas consultas para localizar lojas cujo nome seja igual ao de um fornecedor.
-- A primeira consulta usa EXISTS e a segunda usa =``ANY.
use AdventureWorks2017;

SELECT DISTINCT s.Name  
FROM Sales.Store AS s   
WHERE EXISTS  
(SELECT *  
    FROM Purchasing.Vendor AS v  
    WHERE s.Name = v.Name) ; 

--MESMO EXEMPLO UTILIZANDO ANY

SELECT DISTINCT s.Name  
FROM Sales.Store AS s   
WHERE s.Name = ANY  
(SELECT v.Name  
    FROM Purchasing.Vendor AS v ) ; 
	 
--OPERADOR IS NOT NULL
		SELECT  lastname,        
				firstname,        
				MiddleName 
		FROM   person.Person
		WHERE  MiddleName IS NOT NULL; 

use CURSO
--OPERADOR HAVING 
	SELECT  a.uf,
	        Count(a.cod_mun) as qtd_cidades
		   FROM   SENSO a
		   GROUP  BY  a.uf HAVING  Count(a.cod_mun) > 100
		   order by 2 desc;

	SELECT  a.uf,
	        Count(a.cod_mun) as qtd_cidades
		   FROM   SENSO a
		   GROUP  BY  a.uf HAVING  Count(a.cod_mun) < 100
		   order by 2 desc;


--OPERADOR HAVING 
		SELECT  a.uf ,       
				sum(a.populacao) as populacao
		FROM   senso a       
		GROUP  BY a.uf HAVING sum(a.populacao) < 1000000
		order by 2 desc; 

		SELECT  a.uf ,       
				sum(a.populacao) as populacao
		FROM   senso a       
		GROUP  BY a.uf HAVING sum(a.populacao) > 1000000
		order by 2 desc; 