--TENTATIVA ALTERAR NÍVEL DE COMPATIBILIDADE

USE AdventureWorks2017;  
GO  
SELECT compatibility_level  
FROM sys.databases WHERE name = 'AdventureWorks2017';  
GO  

ALTER DATABASE AdventureWorks2019  
SET COMPATIBILITY_LEVEL = 160;  
GO

SELECT SERVERPROPERTY('ProductVersion') AS Product_Version

--ASCII Exemplo
--
	select ASCII('SQL')
	select ASCII('S')
	select ASCII('Q')
	select ASCII('L')

/*O exemplo a seguir supõe um conjunto de caracteres ASCII e retorna o valor 
ASCII e o caractere CHAR para cada caractere na cadeia de 
caracteres da frase “TEste*/
	DECLARE @posicao INT,        
	@string   CHAR(5)
	-- Initialize the variables. 
	SET @posicao = 1; 
	SET @string = 'TEste'; 
		WHILE @posicao <= Datalength(@string)   
			BEGIN       
				SELECT Ascii(Substring(@string, @posicao, 1))cod_ascii,              
				Char(Ascii(Substring(@string, @posicao, 1)))       
				SET @posicao = @posicao + 1   
			END;

--select Ascii(Substring('Ola Mundo', 1, 1))
			
--LTRIM
--Retorna uma expressão de caractere depois de remover espaços em branco à esquerda

	DECLARE @string_to_trim VARCHAR(60); 
	SET @string_to_trim ='     Cinco espaços no inicio.'; 
	SELECT  'Texto sem espaço:'+Ltrim(@string_to_trim); 
	SELECT  'Texto Com espaço:'+@string_to_trim; 

	--SELECT LTrim(ProductDesc) AS Expr1 FROM ProductSales;

--STR

--Exemplo Retorna dados de caractere convertidos de dados numéricos.

SELECT  Str(123.45, 6, 1);
--Prova de conversao de numerico para caractere
SELECT 'Teste '+Str(123.45, 6, 1);
--sumila erro
SELECT 'Teste '+123.45;


/*Quando a expressão excede o comprimento especificado, a cadeia de 
caracteres retorna ** para o comprimento especificado*/

SELECT Str(123.45, 2, 2); 

--CONCAT
/*Retorna uma cadeia de caracteres que é o resultado da concatenação de dois ou mais valores*/
 
SELECT  Concat(CURRENT_USER, 
               ' Seu Saldo é R$', 
			   110.000, 
			   ' em ',
               day(getdate()),'/',
			   month(getdate()),'/',
			   year(getdate())) AS Resultado;

--Simulando erro com
SELECT CURRENT_USER+ 
               ' Seu Saldo é R$'+ 
			   11.00+
			   ' em '+
               day(getdate())+'/'+
			   month(getdate())+'/'+
			   year(getdate())AS Resultado;


--CONCAT_WS 
--Separa e retornar valores de cadeia de caracteres concatenados com o delimitador especificado ]
--no argumento da primeira função.
--Atenção ignora valores null 
USE crm;

SELECT CONCAT_WS('|',a.primeiro_nome,a.ultimo_nome,a.email,a.nascimento,a.sexo)
 from cliente a;

--exemplo
use curso
--select a.id_aluno,a.nome,b.id_disciplina,c.nome_disc,b.periodo from alunos a
--select CONCAT_WS('|',a.id_aluno,a.nome,b.id_disciplina,c.nome_disc,b.periodo) from alunos a
select CONCAT_WS('|',a.id_aluno,a.nome,
                  isnull(b.id_disciplina,''),
                  isnull(c.nome_disc,''),
                  isnull(b.periodo,'sem period')) from alunos a
left join matricula b
on a.id_aluno=b.id_aluno
left join disciplina c
on b.id_disciplina=c.id_disciplina;

--REPLACE
/*Substitui todas as ocorrências de um valor da cadeia de caracteres 
especificado por outro valor de cadeia de caracteres*/
--O exemplo a seguir substitui a cadeia de caracteres cde em abcdefghi por xxx.
	
	SELECT 'abcdefghicde' de,
		Replace('abcdefghicde', 'cde', 'xxx') para

--O exemplo a seguir substitui a cadeia de caracteres cde em teste por producao.
SELECT  'Isto é teste' de,
		Replace('Isto é teste', 'teste', 'producao')para;

--REPLACE NO SELECT
	use curso
	SELECT REGIAO,
		REPLACE(REGIAO,'Sul','South') 
		FROM regiao

--Exemplo de Update usando replace.

CREATE TABLE pessoas   
	(nome VARCHAR(30) 
	) 
--inserindo registros
	INSERT INTO pessoas VALUES ('José') 
	INSERT INTO pessoas VALUES ('André') 
	INSERT INTO pessoas VALUES('Helem') 
--verificando registros

select * from pessoas
--
UPDATE pessoas SET nome=replace(nome, 'é', 'e');

--REPLICATE
--Repete um valor da cadeia de caracteres um número especificado de vezes
/*O exemplo a seguir replica um caractere 0 quatro vezes na frente de um código 
de linha de produção no banco de dados*/
    use AdventureWorks2017
	SELECT name,
	       productline,
		   Replicate('0', 4) + productline AS 'Codigo' 
	FROM   Production.product 
	WHERE  productline = 'T' 
	ORDER  BY name

/*Usando REPLICATE e DATALENGTH
O exemplo a seguir preenche números à esquerda até um comprimento especificado, 
à medida que são convertidos de um tipo de dados numérico em caractere ou Unicode.*/



--LEFT
--Retorna a parte da esquerda de uma cadeia de caracteres com o número de caracteres especificado.

	use AdventureWorks2017
	SELECT  NAME,
			LEFT(NAME, 5)  as resultado
	FROM   production.product 
	ORDER  BY productid;

--UPPER
--Retorna uma expressão de caractere com dados de caractere em minúsculas convertidos em maiúsculas
	use curso
	SELECT estado, 
		   upper(estado) 
	from regiao

--SUBSTRING
--Retorna uma substring de caractere com dados de caractere dento do parâmetro informado
use AdventureWorks2017
	SELECT lastname nome,        
		   Substring(lastname, 1, 3)  lastname1,        
		   Substring(lastname, 4, 10) lastname2 
	FROM   person.person 
	ORDER  BY lastname; 

--REVERSE
--Retorna a ordem inversa de um valor da cadeia de caracteres.

	SELECT firstname,        
		   Reverse(firstname) AS Reverse 
		   FROM   person.person 
   WHERE  businessentityid < 5 
   ORDER  BY firstname

--LEN
--Retorna o número de caracteres da expressão da cadeia de caracteres especificada, 
--excluindo espaços em branco à direita
	SELECT  firstname,
			Len(firstname) AS Tamanho        	             
   FROM   sales.vindividualcustomer 
   WHERE  countryregionname = 'Australia'; 
   
--DATALENGTH
--Retorna o número de bytes usado para representar qualquer expressão
	SELECT  NAME,
			Datalength(NAME)as data       	    
	FROM   production.product 
	ORDER  BY NAME;

--Comparando Datalength com Len
SELECT  NAME,
		Datalength(NAME)as Datalength,
       Len(NAME)as len		    
	FROM   production.product 
	ORDER  BY NAME


use curso
--drop table t1
CREATE TABLE t1   
	(      c1 VARCHAR(3),      
			c2 CHAR(3),
			c3 NVARCHAR(3)  
	 );

INSERT INTO t1 VALUES      ('2','2','2') 
INSERT INTO t1 VALUES      ('37','37','37') 
INSERT INTO t1 VALUES      ('597','597','597') 

select * from t1
--drop table t1

SELECT c1,
       c2,
	   c3,
	   Datalength(c1)dtlc1,
	   Datalength(c2)dtlc2,
	   Datalength(c3)dtlc3
	   FROM   t1;

--RIGHT
--Retorna a parte da direita de uma cadeia de caracteres com o número de caracteres especificado
use curso
	SELECT a.estado,
		   RIGHT(estado, 5) AS 'Estado' 
	FROM   regiao a
	
--LOWER
--Retorna uma expressão de caractere depois de converter 
--para minúsculas os dados de caracteres em maiúsculas
--O exemplo a seguir usa a função LOWER, a função UPPER, 
--e aninha a função UPPER dentro da função LOWER selecionando 
--nomes de produtos com preços entre US$ 11 e US$ 20. 
--Este exemplo usa o banco de dados AdventureWorks2014

use AdventureWorks2017
	SELECT Substring(NAME, 1, 20)name,
		   Lower(Substring(NAME, 1, 20)) AS Lower,        
		   Upper(Substring(NAME, 1, 20)) AS Upper,        
		   Lower(Upper(Substring(NAME, 1, 20))) AS LowerUpper 
   FROM   production.product 
   WHERE  listprice BETWEEN 11.00 AND 20.00; 

--RTRIM
--Retorna uma cadeia de caracteres depois de truncar todos os espaços em branco à direita
--EXEMPLO SIMPLES
SELECT rtrim('Removendo espaços.   ');

--EXEMPLO 2
	DECLARE @string_to_trim VARCHAR(60); 
	SET @string_to_trim ='Deixamos 4 espacos apos final da sentença.    '; 
	SELECT @string_to_trim + ' proxima string.'; 
	SELECT Rtrim(@string_to_trim) + ' proxima string.'


