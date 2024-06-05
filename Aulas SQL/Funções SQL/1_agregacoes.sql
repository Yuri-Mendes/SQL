--conhecendo as tabelas
use curso;
select top 5 * from senso
select top 5 * from uf
select * from regiao


--AVG Retorna a média dos valores em um grupo. Valores nulos são ignorados
select AVG(populacao) from senso;

--AVG MEDIA POR ESTADO

SELECT UF,AVG(POPULACAO) AS QTD FROM senso
GROUP BY UF
ORDER BY QTD DESC

--AVG POR REGIAO

SELECT B.regiao,AVG(a.POPULACAO) 
	FROM senso A
INNER JOIN regiao B
ON A.cod_uf=B.cod_uf
GROUP BY B.regiao
ORDER BY 2 desc


--MIN Retorna o valor mínimo na expressão. Pode ser seguido pela cláusula OVER
select MIN(populacao) from senso;

--MIN  POR ESTADO

SELECT UF,MIN(POPULACAO) 
	FROM senso
GROUP BY UF
ORDER BY 2

--MIN POR REGIAO

SELECT B.regiao, b.estado, a.cod_mun, a.nome_mun, MIN(POPULACAO) as QTD FROM senso A
INNER JOIN regiao B
ON A.cod_uf=B.cod_uf
GROUP BY B.regiao, b.estado, a.cod_mun, a.nome_mun
ORDER BY 5 asc

--MAX Retorna o valor máximo na expressão
select MAX(populacao) from senso

--MAX  POR ESTADO

SELECT UF,MAX(POPULACAO) FROM senso
GROUP BY UF
ORDER BY 2 DESC

--MAX POR REGIAO

SELECT B.regiao,MAX(a.POPULACAO)maximo FROM senso a
INNER JOIN regiao B
ON A.cod_uf=B.cod_uf
GROUP BY B.regiao
ORDER BY 2 DESC

--SUM Retorna a soma de todos os valores ou somente os valores DISTINCT na expressão. 
--SUM pode ser usado exclusivamente com colunas numéricas.Valores nulos são ignorados.

select SUM(populacao) from senso
--183989711
--183989711
--183989711

--SUM  POR ESTADO

SELECT UF,SUM(POPULACAO) FROM senso
GROUP BY UF
ORDER BY 2 DESC

--SUM POR REGIAO

SELECT B.regiao,SUM(a.POPULACAO) FROM senso a
INNER JOIN regiao B
ON A.cod_uf=B.cod_uf
GROUP BY B.regiao
ORDER BY 2 DESC

--COUNT Retorna o número de itens de um grupo

select COUNT(*) from senso

--Descobrindo qtd estados
select count(distinct uf) from senso;

--exemplo
select count(uf) from senso;


--COUNT POR ESTADO -- quantas cidades tem em cada estado

SELECT UF,COUNT(*) qtd FROM senso
GROUP BY UF
ORDER BY 2 DESC

--COUNT POR REGIAO

SELECT B.regiao,COUNT(*) FROM senso a
INNER JOIN regiao B
ON A.cod_uf=b.cod_uf
GROUP BY B.regiao
ORDER BY 2 DESC

--usando varias funçoes de agregacao

select avg(populacao)media_pop,
	   min(populacao)minimo_pop,
	   max(populacao)maximo_pop,
	   sum(populacao)total_pop,
	   COUNT(*) qtd_cidades
from senso;

--POR ESTADO

SELECT UF,
	   avg(populacao)media_pop,
	   min(populacao)minimo_pop,
	   max(populacao)maximo_pop,
	   sum(populacao)total_pop,
	   COUNT(*) qtd_cidades
FROM senso
GROUP BY UF
ORDER BY UF DESC

--POR REGIAO

SELECT B.regiao,
	   avg(populacao)media_pop,
	   min(populacao)minimo_pop,
	   max(populacao)maximo_pop,
	   sum(populacao)total_pop,
	   COUNT(*) qtd_cidades
 FROM senso a
INNER JOIN regiao B
ON A.cod_uf=B.cod_uf
GROUP BY B.regiao
ORDER BY 2;

use curso;
go

--STDEV Retorna o desvio padrão estatístico de todos os valores da expressão especificada

select STDEV(populacao)  from senso;

--STDEVP Retorna o desvio padrão estatístico para a população de todos os 
--valores na expressão especificada

select STDEVP(populacao)  from senso;

--GROUPING Indica se uma expressão de coluna especificada em uma lista 
--GROUP BY é agregada ou não. GROUPING retorna 1 para agregada ou 0 
--para não agregada no conjunto de resultados.

select uf,sum(populacao) as populacao,
GROUPING(uf) as grupo 
from senso
group by uf with rollup


--Projetando crescimento
--usando exemplo
SELECT a.nome_mun,
       a.populacao,
       a.populacao*1.05 projecao_Pop
from senso a


--por estado
SELECT a.uf,
       sum(a.populacao) populacao,
       sum(a.populacao)*1.05 projecao_Pop
from senso a
group by a.uf


--GROUPING_ID
/*
É uma função que calcula o nível de agrupamento. 
GROUPING_ID pode ser usada apenas na lista SELECT <select>, 
na cláusula HAVING ou ORDER BY, quando GROUP BY for especificada.
*/
select b.regiao,a.uf,sum(a.populacao) populacao,
GROUPING_ID(b.regiao,a.uf) as grupo 
from senso a
inner join regiao b
on a.cod_uf=b.cod_uf
group by rollup(b.regiao,a.uf);


--VAR Retorna a variância estatística de todos os valores da expressão especificada
SELECT VAR(POPULACAO) FROM senso;

SELECT UF,VAR(POPULACAO) FROM senso
GROUP BY UF


--VARP Retorna a variância estatística para o preenchimento 
--de todos os valores da expressão especificada.
SELECT VARP(POPULACAO) FROM senso

SELECT UF,VARP(POPULACAO) FROM senso
GROUP BY UF;

SELECT UF,VAR(POPULACAO) var,VARP(POPULACAO)varp FROM senso
GROUP BY UF


--exemplo com Grouping
use crm

SELECT codigo_pais,       
       count(*)        'Qtd',        
       Grouping(codigo_pais) AS 'Grouping' 
from cliente
GROUP  BY codigo_pais WITH rollup

--exemplo
SELECT a.nome_montadora,       
       count(*)        'Qtd',        
       Grouping(a.nome_montadora) AS 'Grouping' 
from montadora a
 inner join carro_montadora b
 on a.id_montadora=b.id_montadora
GROUP  BY a.nome_montadora WITH rollup

--exemplo
SELECT a.nome_montadora,b.nome_carro,       
       count(*)        'Qtd',        
       Grouping(a.nome_montadora) AS 'Grouping' 
from montadora a
 inner join carro_montadora b
 on a.id_montadora=b.id_montadora
 where a.nome_montadora in ('Toyota','Alfa Romeo')
GROUP  BY a.nome_montadora,b.nome_carro  WITH rollup;


--trazendo o nome cidade com maior populacao em cada estado -- UTILIZANDO SUBSELECT COM JOIN
use curso;

select a.* from   
(select cod_uf,MAX(populacao) as populacao from senso group by cod_uf) b
join senso a
on a.cod_uf=b.cod_uf
and a.populacao=b.populacao
order by a.populacao desc 

--
select a.* from   
(select cod_uf,MIN(populacao) as populacao from senso group by cod_uf) b
join senso a
on a.cod_uf=b.cod_uf
and a.populacao=b.populacao
order by a.populacao desc

--outro exemplo -- USANDO HAVING

SELECT a.cod_uf, a.nome_mun, a.populacao
FROM senso a
GROUP BY a.cod_uf, a.nome_mun, a.populacao
HAVING populacao = (SELECT MAX(populacao) FROM senso WHERE cod_uf = a.cod_uf)
ORDER BY a.populacao desc

SELECT a.cod_uf, a.nome_mun, a.populacao
FROM senso a
GROUP BY a.cod_uf, a.nome_mun, a.populacao
HAVING populacao = (SELECT min(populacao) FROM senso WHERE cod_uf = a.cod_uf)
ORDER BY a.populacao desc

select department_id,sum(salary)
from employees
group by department_id
having sum(salary) > 5000
order by department_id desc
