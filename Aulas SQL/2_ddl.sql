--DDL CRIANDO TABELA
use curso;
GO

CREATE TABLE colaborador   
(      
		matricula INT IDENTITY(1,1) not null,
	    nome      VARCHAR(50) NOT NULL,      
		sobrenome VARCHAR(50) NOT NULL,      
		endereco  VARCHAR(50),      
		cidade    VARCHAR(50),      
		pais      VARCHAR(25),      
		data_nasc DATE not null check(data_nasc<getdate()),
		data_cadastro datetime default getdate(),
		situacao char(1) default('A')
		);

--DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA
CREATE TABLE salario   
(      
	matricula INT PRIMARY KEY NOT NULL,      
	salario   DECIMAL(10, 2) NOT NULL check (salario>0)
    FOREIGN KEY(matricula) REFERENCES colaborador(matricula)
  ) ;


--CORRINGO ERRO PRA CRIAR A TABELA SALARIO
--DDL PARA ADICIONAR CHAVE PRIMARIA NA TAB colaborador
  ALTER TABLE colaborador ADD PRIMARY KEY (MATRICULA);


--DDL CRIACAO DE TABELA COM CHAVE PRIMARIA
CREATE TABLE audit_salario   
	(  
		transacao int identity(1,1)NOT NULL PRIMARY KEY,    
		matricula  INT NOT NULL,      
		data_trans DATETIME NOT NULL,      
		sal_antigo DECIMAL(10, 2),      
		sal_novo   DECIMAL(10, 2), 
		Usuario    varchar(20)not null   
		);

 -- ADD CHAVE ESTRANGEIRA

ALTER TABLE audit_salario
ADD FOREIGN KEY (matricula) REFERENCES colaborador(matricula); 

--TENTANDO EXCLUIR A TABELAS COLABORADOR 
DROP TABLE colaborador; -- para poder excluir a tabela principal, primeiro excluir as tabelas que tem chave estrangeira relacionadas com ela.

--DDL CRIACAO DE INDEX
 CREATE INDEX ix_func1 ON colaborador(data_nasc);
 CREATE INDEX ix_func2 ON colaborador(cidade,pais);

 --Adicionando novo campo na tabela 
 ALTER TABLE colaborador ADD genero CHAR(1); 
 
 --Renomeando campo da tabela
 --EXEC sp_rename 'TABELA_ORIGEM.CAMPO_ORIG', 'Campo_orig', 'COLUMN'

EXEC Sp_rename 'colaborador.ender', 'endereço', 'COLUMN' 

select * from colaborador

--Alterando tipo da coluna
ALTER TABLE colaborador ALTER COLUMN endereço VARCHAR(30);
   
--Excluindo campo da coluna
ALTER TABLE colaborador DROP COLUMN genero; 

--Excluindo chave estrangeira
ALTER TABLE salario
DROP CONSTRAINT FK__salario__salario__160F4887; 
   
--Renomeando Tabela
--EXEC sp_rename   'Nome Antigo', 'Nome Novo'
EXEC Sp_rename   'colaborador','FUNC';

EXEC sp_rename   'FUNC','colaborador';

--DDL CRIACAO DE DATABASE
CREATE DATABASE TESTE;

--Excluindo database

DROP DATABASE TESTE; 

--Excluindo table
DROP TABLE SALARIO;



--CRIACAO DE VIEW
CREATE VIEW v_colaborador
	AS
	SELECT * FROM colaborador;

--ALTER VIEW
	ALTER VIEW v_colaborador
	AS 
	SELECT matricula,NOME FROM colaborador 

--Excluindo VIEW
DROP VIEW v_colaborador; 

--Excluindo index
DROP index ix_func1 ON colaborador;

--CRIANDO INDEX
CREATE INDEX IX_FUNC1 ON colaborador (NOME)

--Excluindo procedure
DROP PROCEDURE proc_salario; 

--Excluindo Função
DROP function func_salario;

--Excluindo Trigger
DROP trigger trig_func_salario;

--DDL TRUNCATE
SELECT * into senso_bk from senso;
-- verifcando dados;
select * from senso_bk;
 
--realizando truncate
TRUNCATE TABLE	 senso_bk;

--DDL TRUNCATE VERIFICANDO

--FAZENDO BK EM TABELA TEMPORARIA
SELECT * INTO #BK_SENSO2 FROM SENSO;
--VERIFCANDO REGISTRO TABELA TEMPORARIA
SELECT * FROM #BK_SENSO2;

--ANALISE DE REGISTROS ANTES DO TRUNCATE
SELECT Count(*) AS AntesTruncateCount 
FROM   #BK_SENSO2; 

--DDL TRUNCATE APAGAR DADOS DA TABELA
TRUNCATE TABLE SENSO;
 
--VERIFICANDO TABELAS APOS TRUNCATE
SELECT Count(*) AS DepoisTruncateCount 
FROM   SENSO; 

--POPULANDO A TABELA COM DADOS DA TABELA TEMPORARIA
 insert into SENSO
 select * from #BK_SENSO2
--verifanco registro 
 select * from SENSO;