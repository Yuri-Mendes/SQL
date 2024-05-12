use AdventureWorks2017;

/* operadores aritméticos

+
-
*
/
% - módulo, resto da divisão

*/

select 1 + 3 as Resultado

select 3 * 2 as Resultado

select 10 - 1 as Resultado

select 45 / 5 as Resultado

select 45 % 5 as Resultado

select 12 % 4 as Resultado --sobra zero

select ((1+4)*(3*3))/5 as Resultado -- expressão

/*cálculo de horas de ausência de cada funcionário*/

select 
	p.FirstName,
	p.LastName,
	e.VacationHours,
	e.SickLeaveHours,
	e.VacationHours + SickLeaveHours as 'Horas Ausente'
from HumanResources.Employee e
join Person.Person p
on e.BusinessEntityID=p.BusinessEntityID
order by 'Horas Ausente' asc;

select * from HumanResources.Employee

/*subtração em uma instrução SELECT*/
SELECT Max(taxrate) maximo,
       Min(taxrate) minimo,
	   Max(taxrate) - Min(taxrate) AS 'Diferença na Taxa' 
FROM   sales.salestaxrate 
WHERE  stateprovinceid IS NOT NULL; 

/*
O exemplo a seguir recupera o número de identificação do produto, 
o nome, o preço de tabela e o novo preço de tabela de 
todas as bicicletas mountain bike na tabela Product. 
O novo preço de tabela é calculado usando o operador aritmético * 
para multiplicar ListPrice por 1.15.
*/

	SELECT  productid,        
			NAME,        
			listprice,        
			listprice * 1.15 AS Novo_preco 
			FROM   production.product 
			WHERE  NAME LIKE 'Mountain-%' 
	ORDER  BY productid ASC; 


/*
O exemplo a seguir usa o operador aritmético de divisão para 
calcular a meta de vendas mensal da equipe de vendas em Ciclos de 12 meses
*/

	SELECT  s.businessentityid AS SalesPersonID,        
			p.firstname,        
			p.lastname,        
			s.salesquota,        
			s.salesquota / 12    AS 'Meta Mensal' ,
			e.JobTitle
			FROM   sales.salesperson AS s        
				JOIN humanresources.employee AS e          
				ON s.businessentityid = e.businessentityid        
				JOIN person.person AS p          
				ON s.businessentityid = p.businessentityid
			where s.salesquota is not null;


/*
O exemplo a seguir divide o número 38 por 5. 
Isto resulta em 7 como a parte inteira do resultado = 7
e demonstra como o módulo retorna o resto de 3.
*/

	SELECT 38 / 5 AS Inteiro,        
	       38 % 5 AS Restante