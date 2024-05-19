--ATIVIDADE TABELA DE VENDAS - PRODUTOS E DESCONTOS

use AdventureWorks2017;
go

DROP TABLE VENDAS
DROP TABLE PRODUTOS

--CRIANDO TABELA
CREATE TABLE PRODUTOS
(
ID_ITEM integer identity(1,1) not null PRIMARY KEY,
COD_PROD int NOT NULL,
NOME_PRODUTO varchar(30) NOT NULL,
VALOR_UNIT decimal(10,2) NOT NULL,
);

CREATE TABLE VENDAS
(
ID integer identity(1,1) not null PRIMARY KEY,
ID_NF int NOT NULL,
COD_PROD int NOT NULL,
NOME_PRODUTO varchar(30) NOT NULL,
VALOR_UNIT decimal(10,2) NOT NULL,
QUANTIDADE int NOT NULL,
DESCONTO decimal(5,2) NOT NULL,
VALOR_NF AS QUANTIDADE * VALOR_UNIT - DESCONTO
);

/*ALTER TABLE VENDAS
ADD VALOR_UNIT decimal(10,2) NOT NULL;*/

--CONSULTANDO TABELAS
select * from PRODUTOS
select * from VENDAS

--POPULANDO TABELA PRODUTOS
insert into PRODUTOS values 
(1,'Hidratante',25.00),
(2,'Toalha',13.50),
(3,'Vassoura',15.00),
(4,'Balde',10.00),
(5,'Espelho',30.00)

insert into VENDAS (ID_NF, COD_PROD, NOME_PRODUTO, VALOR_UNIT, QUANTIDADE, DESCONTO) values
(1,1,'Hidratante',25.00,10,5),
(1,2,'Toalha',13.50,3,0),
(1,3,'Vassoura',15.00,2,0),
(1,4,'Balde',10.00,1,0),
(1,5,'Espelho',30.00,1,0)

insert into VENDAS (ID_NF, COD_PROD, NOME_PRODUTO, VALOR_UNIT, QUANTIDADE, DESCONTO) values
(2,3,'Vassoura',15.00,4,0),
(2,4,'Balde',10.00,5,0),
(2,5,'Espelho',30.00,7,0)

select ID_NF, COD_PROD, VALOR_UNIT from VENDAS where DESCONTO <> 0