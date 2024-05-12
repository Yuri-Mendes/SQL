--criando de teste
create table cadastro
(
 nome varchar(50) not null,
 docto varchar(20) not null
 );

--INICIA TRANSAÇÃO
BEGIN TRANSACTION ;

--INSERE REGISTROS
INSERT INTO cadastro VALUES      ('Andre', '12341244');
INSERT INTO cadastro VALUES      ('Joao',  '12341248');
INSERT INTO cadastro VALUES      ('Pedro', '12341246');

--SELECT DOS REGISTRO INSERIDOS
SELECT * FROM   cadastro ;

--RETORNA O TABELA NAO ESTADO ANTERIOR DO BEGIN TRANSACTION
ROLLBACK ;

--EFETIVA AS INFORMACOES NA TABELAS DO BANCO DE DADOS
COMMIT TRANSACTION;

--SELECT DOS REGISTRO INSERIDOS
SELECT * FROM   cadastro ;
