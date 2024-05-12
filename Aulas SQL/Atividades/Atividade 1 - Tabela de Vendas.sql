--ATIVIDADE TABELA DE VENDAS - PRODUTOS E DESCONTOS

use AdventureWorks2017;
go

--CRIANDO TABELA
CREATE TABLE VENDAS
(
ID_ITEM integer identity(1,1) not null PRIMARY KEY,
ID_NF integer,
COD_PROD int,
VALOR_UNIT decimal(10,2),
QUANTIDADE int,
DESCONTO decimal(5,2)
);

--DELETAR COLUNA
ALTER TABLE VENDAS DROP COLUMN COD_PROD;
--ALTERAR NOME DE UMA COLUNA
EXEC sp_rename 'VENDAS.ID_ITEM', 'COD_PROD', 'COLUMN';
--DELETAR COLUNA
DROP TABLE PRODUTOS
--DELETANDO LINHAS
delete from VENDAS where ID_ITEM > 5

--CONSULTANDO TABELAS
select * from VENDAS

--INSERINDO DADOS
/*
1-25.00
2-13.50
3-15.00
4-10.00
5-30.00
*/

--NF
insert into VENDAS (ID_NF, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO)
values
(2,3,15.00,null,null),
(2,4,10.00,null,null),
(2,5,30.00,null,null);