-- PARTE 1
----------
-- JUNÇÕES
----------
 
-- JUNÇÃO INTERNA
SELECT e.last_name, d.department_name
FROM   employees e INNER JOIN departments d
ON     e.department_id=d.department_id;

-- Junção Externa a Esquerda
SELECT e.last_name, d.department_name
FROM   employees e LEFT OUTER JOIN departments d
ON     e.department_id=d.department_id;

--Junção Externa a Direita
SELECT e.last_name, d.department_name
FROM   employees e RIGHT OUTER JOIN departments d
ON     e.department_id=d.department_id;


--Junção Externa Integ
SELECT e.last_name, d.department_name
FROM   employees e FULL OUTER JOIN departments d
ON     e.department_id=d.department_id;

-- Produto Cartesiano
SELECT sobrenome, nome
FROM empregado
CROSS JOIN departamento;

----------------
-- SUBCONSULTAS
----------------
SELECT last_name, job_id, commission_pct
FROM   employees
WHERE  job_id =  
                (SELECT job_id
                 FROM   employees
                 WHERE  employee_id = 150)
AND    commission_pct >
                (SELECT commission_pct
                 FROM   employees
                 WHERE  employee_id = 170);


SELECT  first_name, department_id
FROM   employees
WHERE  salary IN
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'SA_MAN')
AND    job_id <> 'SA_MAN';

-------------------------
-- OPERADORES DE CONJUNTO
-------------------------
--UNIÃO
SELECT employee_id, job_id
FROM   employees
UNION
SELECT employee_id, job_id
FROM   job_history;

--UNIÃO TOTAL
SELECT employee_id, job_id
FROM   employees
UNION ALL
SELECT employee_id, job_id
FROM   job_history;

-- INTERSECÇÃO
SELECT employee_id, job_id
FROM   employees
INTERSECT
SELECT employee_id, job_id
FROM   job_history;

-- SUBTRAÇÃO
SELECT employee_id, job_id
FROM   employees
MINUS
SELECT employee_id, job_id
FROM   job_history;

-------------------------
-- DML
-------------------------
-- INSERT
INSERT INTO locations (location_id, city)
VALUES (3400, 'Lisbon');

INSERT INTO locations
VALUES (3500, null, null, 'Hamburg', null, null);

-- UPDATE
UPDATE employees
SET    department_id = 30
WHERE  employee_id = 127;

-- DELETE
DELETE FROM departments
WHERE       department_id=270;


-- PARTE 2
-----------------------------------------------------------------
--Instruções DML – Data Manipulation Language – EXEMPLOS (AVANÇADO) 
--INSERT
-----------------------------------------------------------------
/*Para evitar a criação de uma visão para executar uma inserção 
é possível utilizar uma subconsulta no lugar do nome da tabela. */

drop table EMPLOYEES_RETIRED;
 CREATE TABLE EMPLOYEES_RETIRED 
   (	EMPLOYEE_ID NUMBER(6), 
	FIRST_NAME VARCHAR2(20), 
	LAST_NAME VARCHAR2(25), 
	EMAIL VARCHAR2(25), 
	PHONE_NUMBER VARCHAR2(20), 
	HIRE_DATE DATE, 
	RETIRED_DATE DATE, 
	JOB_ID VARCHAR2(10), 
	SALARY NUMBER(8,2), 
	COMMISSION_PCT NUMBER(2,2)
  ) ;
  
INSERT INTO EMPLOYEES_RETIRED 
   (employee_id, first_name, last_name, email, 
    phone_number, hire_date, retired_date, job_id, 
    salary, commission_pct)
SELECT employee_id, first_name, last_name, email, 
       phone_number, hire_date, sysdate, job_id, 
       salary, commission_pct
FROM employees
WHERE employee_id=110;
-----------------------------------------------------------------
--Instruções DML – Data Manipulation Language – EXEMPLOS (AVANÇADO) 
--UPDATE
/* Transfira para o mesmo departamento do funcionário 130 
todos os funcionários que tem o mesmo cargo do funcionário de código 114 */

UPDATE  employees
SET     department_id  =  (SELECT department_id
                           FROM employees
                           WHERE employee_id = 130)
WHERE   job_id         =  (SELECT job_id
                           FROM employees
                           WHERE employee_id = 114);

-----------------------------------------------------------------
--Instruções DML – Data Manipulation Language
--DELETE
/* Delete todos os funcionário do departamento chamado Retail Sales */
DELETE FROM employees
WHERE  department_id =
                (SELECT department_id
                 FROM   departments
                 WHERE  department_name  = 'Retail Sales');

-----------------------------------------------------------------
drop table SAL_HIST_DEPT;
 CREATE TABLE SAL_HIST_DEPT 
   (	EMP_ID NUMBER(6), 
	HIREDATE DATE NOT NULL,
	SALARY NUMBER(8,2)
   ) ;

drop table MGR_HIST_DEPT ;
  CREATE TABLE MGR_HIST_DEPT 
   (	EMPID NUMBER(6), 
	MANAGER NUMBER(6), 
	SAL NUMBER(8,2)''
   );
   
--INSERT Incondicional: ALL clausula_inserção 
/* Nesse exemplo serão inseridos nas tabelas sal_hist_dept e mgr_hist_dept 
as informações dos funcionários que trabalham no departamento cujo código é igual a 90. */

INSERT  ALL 
INTO sal_hist_dept VALUES(EMP_ID,HIREDATE,SALARY) 
INTO mgr_hist_dept VALUES(EMP_ID,MANAGER,SALARY)
SELECT employee_id EMP_ID, 
--       hire_date   HIREDATE,
       salary, 
       manager_id  MANAGER 
FROM  employees   
WHERE department_id = 90 ; 
-----------------------------------------------------------------
--INSERT Condicional: clasula_insercao_condicional 

/*Nesse exemplo serão inseridos:
Na tabela sal_hist_dept os funcionários que têm o salário menor que 20000.
Na tabela mgr_hist_dept os funcionários que se reportam para um funcionário superior na hierarquia. 
Todos os funcionários selecionados trabalham no departamento cujo código é igual a 90.
*/

INSERT 
  WHEN SALARY < 20000 THEN
    INTO sal_hist_dept VALUES(EMP_ID,HIREDATE,SALARY) 
  WHEN MANAGER IS NULL   THEN 
    INTO mgr_hist_dept VALUES(EMP_ID,MANAGER,SALARY)
    SELECT employee_id EMP_ID, 
           hire_date   HIREDATE,
           salary, 
           manager_id   MANAGER 
    FROM  employees   
    WHERE department_id = 90 ;    

-----------------------------------------------------------------
--INSERT Condicional: FIRST
drop table highest_sal;
create table highest_sal
	(deptid number(4),
	sal number(8,2));

drop table hiredate_hist_00;
create table hiredate_hist_00
	(deptid number(4),
	hiredate date);

drop table hiredate_hist_99;
create table hiredate_hist_99
	(deptid number(4),
	hiredate date);

drop table hiredate_hist;
create table hiredate_hist
	(deptid number(4),
	hiredate date);

INSERT FIRST
  WHEN SUM_SALARY  > 25000 THEN
    INTO highest_sal VALUES(DEPT_ID, SUM_SALARY)
  WHEN HIREDATE like ('%00%') THEN
    INTO hiredate_hist_00 VALUES(DEPT_ID, HIREDATE)
  WHEN HIREDATE like ('%99%') THEN
    INTO hiredate_hist_99 VALUES(DEPT_ID, HIREDATE)
  ELSE
    INTO hiredate_hist VALUES(DEPT_ID, HIREDATE)
  SELECT department_id  DEPT_ID, 
         SUM(salary)    SUM_SALARY,
         MAX(hire_date) HIREDATE
  FROM   employees
  group by department_id;

/*
10	4400	17/09/87 -3
40	6500	07/06/94 -3
	7000	24/05/99 -2
70	10000	07/06/94 -3
20	19000	17/08/97 -3 
110	20300	07/06/94 -3
30	24900	10/08/99 -2
60	28800	07/02/99 -1
100	51600	07/12/99 -1
90	58000	13/01/93 -1
50	156400	08/03/00 -1
80	304500	21/04/00 -1
*/
select  * from highest_sal;
select * from hiredate_hist_00;
select * from hiredate_hist_99;
select * from hiredate_hist;
-----------------------------------------------------------------
--INSERT de Criação de Pivô – Exemplo 

drop table sales_informations;
create  table sales_informations
	(emp_id number(5),
	last_name varchar(50) not null,
	week_id number(2),
	week_day varchar(10));

drop TABLE SALES_DATA;
CREATE TABLE SALES_DATA
	(employee_id 	NUMBER(6),
	last_name  VARCHAR(50),
	WEEK_ID	NUMBER(2),
	MONDAY	NUMBER(8,2),
	TUESDAY	NUMBER(8,2),
	WEDNESDAY	NUMBER(8,2),
	THURSDAY	NUMBER(8,2),
	FRIDAY	NUMBER(8,2));

/* Nesse exemplo será realizada uma transformação de forma que 
cada linha de uma tabela será convertia em várias outras linhas. */

INSERT INTO SALES_DATA 
VALUES (176,'Meg', 6, 2000,3000,4000,5000,6000);
commit;

INSERT ALL
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, MONDAY)
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, TUESDAY)
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, WEDNESDAY)
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, THURSDAY)
  INTO sales_informations 
  VALUES (emp_id, last_name, week_id, FRIDAY)
  SELECT employee_id emp_id, 
         last_name ,
         week_id,
         MONDAY,
         TUESDAY,
         WEDNESDAY, 
         THURSDAY,
         FRIDAY 
  FROM sales_data;
-----------------------------------------------------------------
--Instrução Exemplo 
/*Caso a linha exista será executada uma atualização senão será executada uma inserção caso a linha seja nova. */

create table catalog1 
	(id number(3), 
	item varchar2 (20), 
	price number(6));

insert into catalog1 values(1, 'laptop', 800);
insert into catalog1 values(2, 'iphone', 500);
insert into catalog1 values(3, 'camera', 700);
commit;
 
create table catalog2 
(id number(3), 
item varchar2 (20), 
price number(6));

insert into catalog2 values(1, 'laptop', 899);
insert into catalog2 values(2, 'iphone', 599);
insert into catalog2 values(5, 'video camera', 799);
commit;

select * from catalog1;
select * from catalog2;

/* Essa instrução irá inserir na tabela CATALOG1 a linha (5, 'video camera', 799)
e ira atualizar os preços dos proudtos 1 e 2  par 899 e 599 respectivamente */
MERGE 
INTO catalog1 s1 
USING catalog2 s2 
ON (s1.id = s2.id) 
WHEN MATCHED THEN 
   UPDATE SET s1.price = s2.price  
WHEN NOT MATCHED THEN 
   INSERT (id, item, price) 
   values (s2.id, s2.item, s2.price);

select * from catalog1;

commit;
-----------------------------------------------------------------
--AGRUPAMENTO ROLLUP-Exemplo 
/* No exemplo  serão exibidos os totais de salários agrupados por cargos 
dentro dos respectivos departamentos, os subtotais dos salários por departamento  
e o total geral para todos os departamentos que têm o código maior ou igual que 50. */

SELECT   department_id dept, job_id job, 
         SUM(salary) sum_salary 
FROM     employees  
WHERE    department_id >= 50
GROUP BY ROLLUP(department_id, job_id); 
-----------------------------------------------------------------
--AGRUPAMENTO CUBE-Exemplo  
/*No exemplo serão exibidos os totais de salários agrupados por cargos dentro 
dos respectivos departamentos, os subtotais dos salários por departamento, 
o total por cargo independente dos departamentos, o total por departamentos 
independente dos cargos e o total geral para todos os departamentos 
que tem o código igual ou maior que 50. */

SELECT   department_id, job_id job, SUM(salary) sum_salary
FROM     employees  
WHERE    department_id >= 50
GROUP BY CUBE(department_id, job_id);
-----------------------------------------------------------------
--Função GROUPING-Exemplo
/* ATENÇÃO:
 Essa função retorna:
 ===> 1 para indicar que a linha pertence a um determinado grupo 
 ===> 0 para indicar que a linha não pertence do grupo.  */
 
SELECT   department_id dept, 
         job_id job, 
         SUM(salary) sum_salary,
         GROUPING(department_id) group_department,
         GROUPING(job_id) group_job
FROM     employees  
WHERE    department_id >= 50
GROUP BY CUBE(department_id, job_id);  


SELECT   department_id dept, 
         job_id job, 
         SUM(salary) sum_salary,
         CASE 
            WHEN GROUPING(department_id)=0 THEN 'OK'
         END group_department,
         CASE 
            WHEN GROUPING(job_id)=0 THEN 'OK'
         END  group_job
FROM     employees  
WHERE    department_id >= 50
GROUP BY CUBE(department_id, job_id);  
-----------------------------------------------------------------
--Consultas Hierárquicas-Exemplos -- CHEFE - PK / SUBORDINADO - FK
--ANTES UM SELF JOIN..
SELECT sup.last_name    sup,
       sup.job_id       job_supuerior,
       sub.last_name    sub,
       sub.job_id       job_sobordinado
FROM employees sup
JOIN employees sub 
ON(sup.employee_id = sub.manager_id);

--Arvore de hierarquia  percorrida de baixo para cima:
SELECT employee_id, last_name, job_id, manager_id
FROM   employees
START  WITH  last_name = 'Kochhar'
CONNECT BY PRIOR employee_id = manager_id ;

--�?rvore  percorrida de cima para baixo:
SELECT  last_name||' Responde para '|| 
PRIOR   last_name "�?rvore de Cima para Baixo", 
LEVEL   "Nível"
FROM    employees
START   WITH employee_id = 100
CONNECT BY PRIOR employee_id = manager_id;
-----------------------------------------------------------------
--CL�?USULA WITH – Exemplo 
/* A cláusula WITH tem por característica facilitar a leitura da consulta, 
apenas uma cláusula por vez é avaliada mesmo se ela aparecer inúmeras vezes na consulta.

Nesse exemplo a consulta irá selecionar o nome do departamento e o total de salários dos departamentos 
quando o somatório de salários dos departamentos é maior que a média do somatório dos salários dos departamentos */

SELECT    d.department_name, SUM(e.salary) dept_total
FROM      employees e INNER JOIN departments d 
ON        e.department_id = d.department_id
GROUP BY  d.department_name
HAVING    SUM(e.salary)>(SELECT AVG(dept_total)
                         FROM (SELECT d.department_name, SUM(e.salary) dept_total
                               FROM employees e JOIN departments d 
                               ON e.department_id = d.department_id
                          GROUP BY d.department_name ))
ORDER BY department_name;
-----------------------------------------------------------------
--CL�?USULA WITH – Exemplo
/* Nesse exemplo será utilizada a cláusula WITH  para produzir o mesmo resultado do comando SELECT anterior*/

WITH 
    dept_costs AS( SELECT d.department_name, SUM(e.salary) dept_total -- SOMATÓRIOS DOS SALARIOS POR DEPTO
                   FROM  employees e JOIN departments d 
                   ON e.department_id = d.department_id
                   GROUP BY  d.department_name),  
    avg_cost AS (SELECT AVG(dept_total)AS dept_avg ----MÉDIA DOS SOMATÓRIOS DOS SALARIOS POR DEPTO
                 FROM dept_costs)
SELECT  *
FROM   dept_costs
WHERE  dept_total >( SELECT dept_avg
                     FROM   avg_cost )
ORDER BY department_name;
-----------------------------------------------------------------
--Particionamento por faixa de valores (Range Partitioning) – Exemplo 
/* Exemplo de criação de tabela particionada por faixa de valores 
onde serão criadas quatro partições conforme o ano de realização dos pedidos*/

CREATE TABLE PEDIDOS_RANGE
(NR_PEDIDO   NUMBER           NOT NULL,
 DATA_PEDIDO      DATE        NOT NULL,
 COMENTARIOS      VARCHAR2(500))
PARTITION BY RANGE (DATA_PEDIDO)
(PARTITION PEDIDOS_P1 VALUES LESS THAN
 (TO_DATE('01/01/2014', 'DD/MM/YYYY')) TABLESPACE users,
 PARTITION PEDIDOS_P2 VALUES LESS THAN
 (TO_DATE('01/01/2015', 'DD/MM/YYYY')) TABLESPACE users,
 PARTITION PEDIDOS_P3 VALUES LESS THAN
 (TO_DATE('01/01/2016', 'DD/MM/YYYY')) TABLESPACE users,
 PARTITION PEDIDOS_P4 VALUES LESS THAN
 (TO_DATE('01/01/2019', 'DD/MM/YYYY')) TABLESPACE users); 

-----------------------------------------------------------------
--Particionamento Hash  (Hash Partitioning) – Exemplo 
/* Exemplo de criação de tabela particionada por Hash em que os dados 
serão divididos em quatro partições com base no número dos pedidos */

CREATE TABLE PEDIDOS_HASH
(NR_PEDIDO    NUMBER NOT NULL,
 DATA_PEDIDO  DATE   NOT NULL,
 COMENTARIOS  VARCHAR2(500))
PARTITION BY HASH (NR_PEDIDO)
(PARTITION PEDIDOS_P1 TABLESPACE users,
 PARTITION PEDIDOS_P2 TABLESPACE users,
 PARTITION PEDIDOS_P3 TABLESPACE users,
 PARTITION PEDIDOS_P4 TABLESPACE users);
-----------------------------------------------------------------
--Particionamento por lista de valores (List Partitioning) – Exemplo 
/* É indicado para valores discretos, cujos intervalos não são naturais. 
Exemplo de criação de tabela particionada por lista de valores onde os 
dados serão divididos em cinco partições que representam as  regiões do Brasil */

CREATE TABLE CONTAS (
nr_identidade  NUMBER,
nr_conta       NUMBER,
cod_cliente    NUMBER,
nr_filial      NUMBER,
regiao         VARCHAR(2),
status         VARCHAR(1)
)
PARTITION BY LIST (regiao)
(PARTITION contas_norte
  VALUES ('AC','AP','AM','PA','RO','RR','TO') TABLESPACE users,
 PARTITION contas_nordeste    
  VALUES ('AL','BA','CE','MA','PB','PI','PE','RN','SE') TABLESPACE users,
 PARTITION contas_centrooeste 
   VALUES ('DF','GO','MT','MS') TABLESPACE users,
 PARTITION contas_sul         
   VALUES ('RS','SC','PR') TABLESPACE users,
 PARTITION contas_sudeste     
   VALUES ('SP','RJ','MG','ES') TABLESPACE users);
-----------------------------------------------------------------




