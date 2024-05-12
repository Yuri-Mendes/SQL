--RANK EXEMPLO 2 1
/*As funções de classificação retornam um valor de classificação 
para cada linha em uma partição. Dependendo da função usada, 
algumas linhas podem receber o mesmo valor que outras. 
As funções de classificação são não determinísticas
*/
use curso

select * from uf

select rank() OVER (ORDER BY estado ASC) AS rank_uf ,
       estado 
from uf

--RANK EXEMPLO 2
select rank() OVER (ORDER BY estado ASC) AS rank_uf ,
	   regiao,
	   estado  
from regiao;

--RANK EXEMPLO 3
select rank() OVER (ORDER BY regiao ASC) AS rank_uf ,
       regiao,
	   estado
from regiao;

--NTILE
/*Distribui as linhas de uma partição ordenada em um número de grupos especificado. 
Os grupos são numerados, iniciando em um. Para cada linha, 
NTILE retorna o número do grupo ao qual a linha pertence.
*/
select NTILE(3) OVER (ORDER BY regiao ASC) AS NTILE_uf ,
regiao,estado  
from regiao

--DENSE_RANK
/*Retorna a classificação de linhas dentro da partição de um conjunto de resultados, 
sem qualquer lacuna na classificação. A classificação de uma linha é um mais 
o número de classificações distintas que vêm antes da linha em questão.
*/
select DENSE_RANK() OVER (ORDER BY regiao ASC) AS DENSE_RANK_uf ,
	  regiao,
	  estado
from regiao

select DENSE_RANK() OVER (ORDER BY estado ASC) AS DENSE_RANK_uf ,
regiao,estado
regiao_uf  from regiao

--ROW_NUMBER
/*Retorna o número sequencial de uma linha em uma partição de um conjunto de resultados, 
iniciando em 1 para a primeira linha de cada partição.
*/
select ROW_NUMBER() OVER (ORDER BY estado ASC) AS ROW_NUMBER_uf ,
	  regiao,
	  estado
from regiao;

--combinando valores 1
select ROW_NUMBER() OVER (ORDER BY regiao ASC) AS ROW_NUMBER_uf ,
       DENSE_RANK() OVER (ORDER BY regiao ASC) AS DENSE_RANK_uf ,
	   NTILE(6) OVER (ORDER BY regiao ASC) AS NTILE_uf ,
	   rank() OVER (ORDER BY regiao ASC) AS rank_uf ,
       regiao,
	   estado
regiao_uf 
from regiao
order by 5,6

--combinando valores 1
select ROW_NUMBER() OVER (ORDER BY estado ASC) AS ROW_NUMBER_uf ,
       DENSE_RANK() OVER (ORDER BY estado ASC) AS DENSE_RANK_uf ,
	   NTILE(5) OVER (ORDER BY estado ASC) AS NTILE_uf ,
	   rank() OVER (ORDER BY estado ASC) AS rank_uf ,
regiao,estado
regiao_uf 
from regiao
order by 4,6

--simulando classificacao de campeonato
--drop table campeonato
create table campeonato
(
 nometime varchar(30)not null,
 pontos int not null
 );
 --populando tabela
insert into campeonato values ('Atlético-GO','22');
insert into campeonato values ('Chapecoense','28');
insert into campeonato values ('Ponte Preta','28');
insert into campeonato values ('Grêmio','43');
insert into campeonato values ('Cruzeiro','37');
insert into campeonato values ('Santos','41');
insert into campeonato values ('Palmeiras','40');
insert into campeonato values ('Corinthians','53');
insert into campeonato values ('Flamengo','38');
insert into campeonato values ('Botafogo','37');
insert into campeonato values ('Atlético-PR','34');
insert into campeonato values ('Vasco','31');
insert into campeonato values ('Atlético-MG','31');
insert into campeonato values ('Sport','29');
insert into campeonato values ('Avaí','29');
insert into campeonato values ('Bahia','27');
insert into campeonato values ('Fluminense','31');
insert into campeonato values ('São Paulo','27');
insert into campeonato values ('Coritiba','27');
insert into campeonato values ('Vitória','26');


--select * from campeonato

--Classificacao do campeonato
	select rank() OVER (ORDER BY pontos desc) AS classif ,
		    nometime,
			pontos 
	from campeonato;

--delete campeonato --teste delete dos dados da tabela