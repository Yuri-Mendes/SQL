--criacao de view 
use AdventureWorks2017;
CREATE VIEW v_data_contratacao 
AS   
	SELECT p.firstname,          
		   p.lastname,          
		   e.businessentityid,          
		   e.hiredate   
		   FROM   humanresources.employee e          
		   JOIN person.person AS p            
ON e.businessentityid = p.businessentityid;

--select na view

select * from v_data_contratacao
where year(hiredate)='2009';

--Alterando view

Alter VIEW v_data_contratacao 
AS   
	SELECT p.firstname primeiranome,          
		   p.lastname ultimoNome, 
		   p.MiddleName nome_meio, --Campo adicionado         
		   e.businessentityid id,          
		   e.hiredate admissao  
		   FROM   humanresources.employee e          
		   JOIN person.person AS p            
ON e.businessentityid = p.businessentityid;

--select na view

select * from v_data_contratacao
where year(admissao)='2009';

--View com dados Particionados.
--Criação de view com dados de varias tabelas usando UNION ALL

--Create the tables and insert the values. 
use curso
CREATE TABLE fornecedores1              
(              
id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 1 AND 150),             
fornec CHAR(50)              
)
CREATE TABLE fornecedores2              
( 
 id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 151 AND 300),          
 fornec    CHAR(50) )

CREATE TABLE fornecedores3             
(
  id_fornec INT PRIMARY KEY CHECK(id_fornec BETWEEN 301 AND 450),       
  fornec char(50)
 )
CREATE TABLE fornecedores4              
(             
  id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 451 AND 600),             
  fornec    CHAR(50)              
) 

--inserindo valores  
 INSERT  fornecedores1 VALUES  ('1','CaliforniaCorp') 
 INSERT  fornecedores1 VALUES  ('5', 'BraziliaLtd')
  
 INSERT  fornecedores2 VALUES  ('231','FarEast')
 INSERT  fornecedores2 VALUES  ('280','NZ') 

 INSERT  fornecedores3 VALUES  ('321','EuroGroup') 
 INSERT  fornecedores3 VALUES  ('442','UKArchip') 
  
 INSERT  fornecedores4 VALUES  ('475','India') 
 INSERT  fornecedores4 VALUES  ('521','Afrique') 

--simular erro
 INSERT  fornecedores4 VALUES  ('10','India') 
 INSERT  fornecedores4 VALUES  ('25','Afrique') 

 --criando view
 CREATE VIEW v_fornec_geral  
	as
	SELECT id_fornec,fornec FROM  fornecedores1 
	UNION ALL 
	SELECT id_fornec,fornec FROM fornecedores2 
	UNION ALL 
	SELECT id_fornec,fornec FROM fornecedores3 
	UNION ALL 
	SELECT id_fornec,fornec FROM  fornecedores4 

--Select na view v_fornec_geral

select * from v_fornec_geral

--Alterando a View
alter VIEW v_fornec_geral  
	as
	SELECT 'f1' origem,id_fornec,fornec FROM  fornecedores1 
	UNION ALL 
	SELECT 'f2',id_fornec,fornec FROM fornecedores2 
	UNION ALL 
	SELECT 'f3',id_fornec,fornec FROM fornecedores3 
	UNION ALL 
	SELECT 'f4',id_fornec,fornec FROM  fornecedores4 



--Select na view v_fornec_geral

 INSERT  fornecedores4 VALUES  ('476','Argentine') ;
 INSERT  fornecedores4 VALUES  ('522','Venezuela') ;

select * from v_fornec_geral
--where origem='f2';
