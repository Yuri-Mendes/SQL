--Adicionando 90 dias
	SELECT getdate() agora,
		   Dateadd (day, 90, Getdate()) 
--Adicionando 2 meses
	SELECT getdate() agora,
	       Dateadd (month, 2, Getdate()) 
--Adicionando 3 anos
	SELECT getdate() agora,
		   Dateadd (year, 3, Getdate())

--Exemplo
use curso
--drop table contas
create table contas
(
 id_cont int identity(1,1) not null primary key,
 data_conta date not null,
 dias int,
 data_vencimento date ,
 valor decimal(10,2),
 situacao char(1) default('A')
 );
 --inserindo dados
  insert into contas (data_conta,dias,valor) values ('2018-05-24',10,25.75);

  insert into contas (data_conta,dias,valor) values ('2018-05-24',30,40.75);

  insert into contas (data_conta,dias,valor) values ('2018-05-24',60,30.75);


  --exemplo

  select id_cont,data_conta,dias,data_vencimento,valor from contas;

-- trazendo o valor na consulta
    select id_cont,
	       data_conta,
		   dias,
		   Dateadd(day,dias,data_conta) vencto,
		   valor from contas;

--realizando update 
 update contas set data_vencimento = Dateadd(day,dias,data_conta)
 where data_vencimento is null;

-- verificando
select * from contas