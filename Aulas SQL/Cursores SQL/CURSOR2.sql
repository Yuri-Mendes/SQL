--Preparando base para cursor para UPDATE
--drop table clifor
use curso
 select a.BusinessEntityID codpessoa,
	    a.FirstName nome,
		a.LastName sobrenome,
		cast('' as varchar(100)) nomecompleto
        into clifor
  from AdventureWorks2017.person.person a
--verifcando dados carregado sem nome completo
select * from clifor

--Inicio cursor (Declara Variavies)
DECLARE @codpessoa   INT, 
        @primeironome VARCHAR(50), 
        @sobrenome    VARCHAR(50), 
        @nomecompleto VARCHAR(100) 
-- Cursor para percorrer os registros 
DECLARE cursor1 CURSOR FOR 
  SELECT codpessoa, 
         nome, 
         sobrenome 
  FROM   clifor 

--Abrindo Cursor 
OPEN cursor1 

-- Lendo a próxima linha 
FETCH next FROM cursor1 INTO @codpessoa, @primeironome, @sobrenome 

-- Percorrendo linhas do cursor (enquanto houverem) 
WHILE @@FETCH_STATUS = 0 
  BEGIN 
      -- Executando as rotinas desejadas manipulando o registro 
      UPDATE clifor 
      SET    nomecompleto =@primeironome+' '+@sobrenome 
      WHERE  codpessoa = @codpessoa 

      -- Lendo a próxima linha 
      FETCH next FROM cursor1 INTO @codpessoa, @primeironome, @sobrenome 
  END 

-- Fechando Cursor para leitura 
CLOSE cursor1 

-- Finalizado o cursor 
DEALLOCATE cursor1 

--verficando dados
--select * from clifor
--criando chave primaria para otimizar consulta/update
--índice na tabela, faz o cursor rodar mais rápido
ALTER TABLE clifor
ADD CONSTRAINT PK_id1 PRIMARY KEY (codpessoa);
