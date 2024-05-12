--criando o problema 
SELECT 100 / 0 

--Tratando 
use curso

create table teste2
(
  val1 int,
  val2 int
);

--Populando tabela teste2
insert into teste2 values (100,0),(100,25),(1,0),(5,2)

--verificando dados
select * from teste2

--Expressao com erro
select val1,
       val2,
	   val1/val2 expressao
from teste2

--Expressao tratando erros
select 
		val1,
		val2,
		isnull(val1/nullif(val2,0),0) expressao1,
		isnull(cast(val1 as decimal(5,2))/cast(nullif(val2,0) as decimal(5,2)),0) expressao2
from teste2;


--Comparando Case Nullif
--Retorna um valor nulo se as duas expressões especificadas forem iguais.

use AdventureWorks2017
	SELECT productid,        
		   makeflag,        
		   finishedgoodsflag,        
		   NULLIF(makeflag, finishedgoodsflag)AS 'Null se igual' 
		   FROM   production.product 
		   WHERE  productid < 10; 
		 
--exemplo 
--ISNULL
use curso

--select distinct a.id_aluno,a.nome,b.periodo 
select distinct a.id_aluno,a.nome,isnull(b.periodo,'Vazio') as periodo
from alunos a
left join matricula b
on a.id_aluno=b.id_aluno;
