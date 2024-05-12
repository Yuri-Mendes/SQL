use AdventureWorks2017;

/* operadores aritm�ticos

+
-
*
/
% - m�dulo, resto da divis�o

*/

select 1 + 3 as Resultado

select 3 * 2 as Resultado

select 10 - 1 as Resultado

select 45 / 5 as Resultado

select 45 % 5 as Resultado

select 12 % 4 as Resultado --sobra zero

select ((1+4)*(3*3))/5 as Resultado -- express�o

/*c�lculo de horas de aus�ncia de cada funcion�rio*/

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

/*subtra��o em uma instru��o SELECT*/
SELECT�Max(taxrate) maximo,
       Min(taxrate) minimo,
	   Max(taxrate)�-�Min(taxrate)�AS�'Diferen�a na Taxa'�
FROM���sales.salestaxrate�
WHERE��stateprovinceid�IS�NOT�NULL;�

/*
O exemplo a seguir recupera o n�mero de identifica��o do produto, 
o nome, o pre�o de tabela e o novo pre�o de tabela de 
todas as bicicletas mountain bike na tabela�Product.�
O novo pre�o de tabela � calculado usando o operador aritm�tico�*�
para multiplicar�ListPrice�por�1.15.
*/

	SELECT� productid,��������
			NAME,��������
			listprice,��������
			listprice�*�1.15�AS�Novo_preco�
			FROM���production.product�
			WHERE��NAME�LIKE�'Mountain-%'�
	ORDER��BY�productid�ASC;�


/*
O exemplo a seguir usa o operador aritm�tico de divis�o para 
calcular a meta de vendas mensal da equipe de vendas em Ciclos de 12 meses
*/

	SELECT� s.businessentityid�AS�SalesPersonID,��������
			p.firstname,��������
			p.lastname,��������
			s.salesquota,��������
			s.salesquota�/�12����AS�'Meta Mensal'�,
			e.JobTitle
			FROM���sales.salesperson�AS�s��������
				JOIN�humanresources.employee�AS�e����������
				ON�s.businessentityid�=�e.businessentityid��������
				JOIN�person.person�AS�p����������
				ON�s.businessentityid�=�p.businessentityid
			where s.salesquota is not null;


/*
O exemplo a seguir divide o n�mero 38 por 5. 
Isto resulta em 7 como a parte inteira do resultado = 7
e demonstra como o m�dulo retorna o resto de 3.
*/

	SELECT�38�/�5�AS�Inteiro,��������
	       38�%�5�AS�Restante