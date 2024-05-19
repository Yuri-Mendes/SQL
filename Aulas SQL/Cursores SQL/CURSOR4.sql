--drop table tabela_clientes
--go
USE curso;
GO
create table tabela_clientes(
id_cliente int not null primary key,
nome_cliente varchar(200),
cpf_cliente varchar(20)
)
go
--delete from tabela_clientes
insert into tabela_clientes values
(1,'Fabio', NULL),
(2,'Jorge', 21325658454),
(3,'Jack', NULL),
(4,'Peter', 34132567878)
--go

--select * from tabela_clientes
--go

DECLARE
@id_cliente int,
@nome_cliente VARCHAR(200),
@cpf_cliente VARCHAR(20)


--Declarando o cursor
DECLARE nome_do_cursor CURSOR FOR

--dados que o cursor ira trabalhar
SELECT
       id_cliente,nome_cliente, cpf_cliente
FROM   tabela_clientes

--abre o cursor
OPEN nome_do_cursor

--posicionar o ponteiro do cursor na primeira linha do resultado do select acima
FETCH NEXT FROM nome_do_cursor

--insere nas variaveis os valores da primeira linha do resultado armazenado no cursor
INTO @id_cliente,@nome_cliente, @cpf_cliente

--Esse parte diz "Enquanto tiver linha no cursor, faça:"
WHILE @@FETCH_STATUS = 0

--Nessa parte você insere o bloco de instruções que ira trabalhar no seu cursor.

--Se CPF for igual a nulo
BEGIN
IF (@cpf_cliente is NULL)
--Inserir no final do nome da pessoa o texto "Atualizar CPF"
	BEGIN
--UPDATE tabela_clientes SET nome_cliente = @nome_cliente + ' Atualizar CPF' where cpf_cliente is  null
	UPDATE tabela_clientes SET cpf_cliente = 'Atualizar CPF'
    where cpf_cliente is  null
	and id_cliente=@id_cliente
	END
FETCH NEXT FROM nome_do_cursor
INTO @id_cliente,@nome_cliente, @cpf_cliente
END

--Para fechar o cursos você precisar inserir os seguinte comandos
CLOSE nome_do_cursor
DEALLOCATE nome_do_cursor

--FIM

--select * from tabela_clientes
