--Manipulando Temp table
--CRUD com temp table
use curso
--crianddo tabela temporaria 
  CREATE TABLE #minhatemporaria   
  (      
    campo1 VARCHAR(80) NOT NULL,      
	campo2 MONEY NOT NULL  
  ) 

--inserindo dados na tabela temporaria 
INSERT INTO #minhatemporaria VALUES      ('Real', 1000) 
INSERT INTO #minhatemporaria VALUES      ('Dolar',3000) 

--Selecionando dados na tabela temporaria 
SELECT * FROM   #minhatemporaria 

--exemplo 2
SELECT campo1, campo2 FROM   #minhatemporaria 

--criando tabela temporaria através de um select
 SELECT * INTO   #minhatemporaria2 FROM   #minhatemporaria; 

--Selecionando dados na tabela temporaria 
SELECT * FROM   #minhatemporaria2 


--Atualizando tabela temporaria 
UPDATE #minhatemporaria    SET   campo1='Libra'
 WHERE campo1= 'Real'

--verificando update
 SELECT * FROM #minhatemporaria
 
 SELECT * FROM   #minhatemporaria2 
 

--DELETANDO registros
DELETE  FROM   #minhatemporaria

--Dropando a tabela temporaria 
DROP TABLE #minhatemporaria 
DROP TABLE #minhatemporaria2

 
--criando tabela temporario com select
use curso
select nome_mun into #sensoTemp from senso

--verifcando dados
select * from #sensoTemp

drop table #sensoTemp;

--criando um tabelas objeto permamente no banco de dados atraves de um select

select * into senso_bk1 from senso;

--verifcando
select * from senso_bk1;

