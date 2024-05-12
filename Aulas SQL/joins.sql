use curso;
--drop table alunos
--CRIACAO DE TABELA ALUNOS
--drop table alunos
--drop table disciplina
--drop table matricula
create table alunos
(
 id_aluno int identity(1,1),
 nome varchar(20) not null
 );
 --drop table disciplina
create table disciplina
(
 id_disciplina int identity(1,1),
 nome_disc varchar(20)
 );
 --drop table matricula
 create table matricula
 (
  id_aluno int,
  id_disciplina int,
  periodo varchar(10)
  );

  --ALTERANDO TABELA CAMPO ID_ALUNO PARA NAO PERMITIR NOT NULL
  ALTER TABLE MATRICULA ALTER COLUMN id_aluno INT NOT NULL;
  --ALTERANDO TABELA 
  ALTER TABLE MATRICULA ALTER COLUMN id_disciplina INT NOT NULL;

  --CRIANDO CHAVE PRIMARIA COMPOSTA
  ALTER TABLE MATRICULA ADD CONSTRAINT PK_1 PRIMARY KEY (ID_ALUNO,id_disciplina);
 --ADICIONANDO CHAVE PRIMARIA TABELA DISCIPLINA
  ALTER TABLE DISCIPLINA ADD CONSTRAINT PK2 PRIMARY KEY (id_disciplina);
  --ADICIONANDO CHAVE PRIMARIA TABELA ALUNOS
  ALTER TABLE ALUNOS ADD CONSTRAINT PK1 PRIMARY KEY (ID_ALUNO);
  
  --ADICIONANDO CHAVE ESTRANGEIRA NA TABELA MATRICULA CAMPO ID_ALUNO
  ALTER TABLE MATRICULA 
  ADD CONSTRAINT FK_MAT1 FOREIGN KEY  (ID_ALUNO) REFERENCES ALUNOS(ID_ALUNO);

  --ADICIONANDO CHAVE ESTRANGEIRA NA TABELA MATRICULA CAMPO ID_ALUNO
  ALTER TABLE MATRICULA 
  ADD CONSTRAINT FK_MAT2 FOREIGN KEY  (id_disciplina) REFERENCES DISCIPLINA(id_disciplina);

  
  --INSERINDO REGISTRO ALUNOS
  insert into alunos values ('Joao'),('Maria'),('Pedro'),('Tiago'),('Henrique');

  SELECT * FROM alunos;

  --INSERINDO REGISTRO DISCIPLINAS
  insert into disciplina values 
  ('Fisica'),('Quimica'),('Matematica'),('Banco de Dados'),('Programacao');
  
  SELECT * FROM disciplina;

  --INSERINDO MATRICULAS DE ALUNOS
  insert into matricula values ('1002','1','Noturno');
  insert into matricula values ('1002','2','Vespertino');
  insert into matricula values ('1002','3','Matutino');

  insert into matricula values ('2','3','Noturno');
  insert into matricula values ('2','4','Noturno');

  insert into matricula values ('3','1','Noturno');
  insert into matricula values ('3','3','Noturno');
  insert into matricula values ('3','4','Noturno');

  insert into matricula values ('5','1','Matutino');
  insert into matricula values ('5','2','Vespertino');
  insert into matricula values ('5','4','Noturno');

  select * from matricula
  SELECT * FROM disciplina;
  SELECT * FROM alunos;

--simulando erros
  insert into matricula values ('1','1','Noturno');

  insert into matricula values ('6','6','Noturno');

  insert into matricula values ('5','4','Noturno');

  --ALUNO CODIG 4 NAO TEM MATRICULA
  --DISCIPLINA 5 NAO TEM ALUNOS

  --INNER JOIN

  select a.id_aluno,
		 a.nome,
		 c.id_disciplina,
         c.nome_disc,
		 b.periodo
  from alunos a
  inner join matricula b 
  on a.id_aluno=b.id_aluno
  inner join disciplina c
  on b.id_disciplina=c.id_disciplina;
  --on b.id_disciplina=b.id_aluno;

  --LEFT JOIN

  select a.id_aluno,
		 a.nome,
		 c.id_disciplina,
         c.nome_disc,
		 b.periodo
  from alunos a
  left join matricula b 
  on a.id_aluno=b.id_aluno
  left join disciplina c
  on b.id_disciplina=c.id_disciplina
  --where b.id_disciplina is not null -- condição para não aparecer os nulos
  
  select * from matricula
  SELECT * FROM disciplina
  SELECT * FROM alunos

 --RIGHT JOIN
  select a.id_aluno,
		 a.nome,
		 c.id_disciplina,
         c.nome_disc,
		 b.periodo
  from alunos a
  right join matricula b 
  on a.id_aluno=b.id_aluno
  right join disciplina c
  on b.id_disciplina=c.id_disciplina
  order by a.id_aluno asc;

  --FULL JOIN
  select a.id_aluno,
		 a.nome,
		 c.id_disciplina,
         c.nome_disc,
		 b.periodo
  from alunos a
  full join matricula b 
  on a.id_aluno=b.id_aluno
  full join disciplina c
  on b.id_disciplina=c.id_disciplina;

--INNER JOIN
--Testando seus conhecimentos
use crm;

SELECT a.id_cliente, 
       a.primeiro_nome,
	   a.codigo_pais,
	   b.ano,
	   c.nome_carro,
	   d.nome_montadora
	   from cliente a
	   inner join carro_cliente b
	   on a.id_cliente=b.id_cliente
	   inner join  carro_montadora c
	   on b.id_carro=c.id_carro
	   inner join montadora d
	   on c.id_montadora=d.id_montadora

--INNER JOIN
use AdventureWorks2017;

select a.BusinessEntityID,
       a.FirstName,
	   a.LastName,
	   b.JobTitle,
	   a.PersonType
from Person.Person a 
inner join HumanResources.Employee b
on a.BusinessEntityID=b.BusinessEntityID;

--verficando dados tabela person
select * from Person.Person


--Rigth Join
select a.BusinessEntityID,a.FirstName,a.LastName,b.JobTitle, a.PersonType
from Person.Person a 
Right join HumanResources.Employee b
on a.BusinessEntityID=b.BusinessEntityID;

--left Join
select a.BusinessEntityID,a.FirstName,a.LastName,b.JobTitle, a.PersonType
from Person.Person a 
left join HumanResources.Employee b
on a.BusinessEntityID=b.BusinessEntityID

--FULL JOIN
select a.BusinessEntityID,a.FirstName,a.LastName,b.JobTitle, a.PersonType
from Person.Person a 
FULL join HumanResources.Employee b
on a.BusinessEntityID=b.BusinessEntityID
