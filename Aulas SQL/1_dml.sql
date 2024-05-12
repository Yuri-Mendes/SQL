--DML  CRIACAO DA TABELA PARA EXERCICIOS
USE CURSO;
GO

CREATE TABLE FUNCIONARIOS
(
  ID int identity(1,1) NOT NULL PRIMARY KEY,
  NOME VARCHAR(50) NOT NULL,
  SALARIO DECIMAL(10,2),
  SETOR VARCHAR(30)
  );    
  
/* DROP TABLE FUNCIONARIOS */

--DML SELECT
--EXEMPLO SELECT
SELECT * FROM   funcionarios;
--EXEMPLO SELECT
	SELECT nome NOME, setor DEPTO
	FROM   funcionarios; 

--EXEMPLO SELECT
	SELECT nome,setor as depto
	FROM   funcionarios;

--DML INSERT
	INSERT INTO funcionarios VALUES  ('Joao',1000,''), ('Jose',2000,''),('Alexandre',3000,'') ; -- SEM MENCIONAR AS COLUNAS, SÓ TABELA

	INSERT INTO funcionarios 
	VALUES  
	('Yuri',15000,'TI'), 
	('Rogério',20000,'COMERCIAL'),
	('Júlia',10000,'MARKETING') ;

--OU
	INSERT INTO funcionarios (nome,salario) VALUES ('Pedro',1000);


--simulando erro
   INSERT INTO funcionarios (nome,salario) VALUES ('Pedro','zaerre');

--simulando erro

  INSERT INTO funcionarios (salario) VALUES (2500);

--DML UPDATE
	UPDATE funcionarios SET    salario = '1500' 
	WHERE  id = '1';

--OU Aumento de 50% sobre Salário atual.
	UPDATE funcionarios SET    salario = salario*1.5 
	WHERE  id = '1'; 

--exemplo update com mais de um campo
	UPDATE funcionarios SET    salario = salario*1.5, setor='TI'
	WHERE  id <> '1'; 

--DML DELETE
	DELETE funcionarios 
	where id in (7,8,9);



