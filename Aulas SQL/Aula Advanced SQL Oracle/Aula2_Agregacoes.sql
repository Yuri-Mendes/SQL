Aula2_Agregacoes
--maiores salários por sobrenome
SELECT last_name, MAX(salary) 
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;

--top 10 maiores salários por sobrenome
SELECT last_name, MAX(salary) 
FROM employees
GROUP BY last_name
ORDER BY 2 DESC
FETCH FIRST 10 rows only;

SELECT last_name, salary,
rank() over(order by employee_id, salary, rownum desc) rank_salary
FROM employees
order by rank_salary;

--rowid --identificador dos dados no bd oracle
--AO CRIAR UMA TABELA NUNCA COMECE COM NÚMERO

--indice

CREATE TABLE ABD27
(CODIGO NUMBER (5) 
    CONSTRAINT ABD_27_PK PRIMARY KEY,
EMAIL VARCHAR(50)
    CONSTRAINT ABD_27_UK UNIQUE);

INSERT INTO ABD27 VALUES (1, 'A');
INSERT INTO ABD27 VALUES (1, 'B');
INSERT INTO ABD27 VALUES (2, 'B');

SELECT INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'ABD27';


SELECT * 
FROM EMPLOYEES
WHERE employee_id = 100;

SELECT * 
FROM EMPLOYEES
WHERE last_name like 'A%'
or last_name like 'B%'
or last_name like 'K%'
or last_name like 'Z%';

-----------------------------------

SELECT last_name, department_name
from EMPLOYEES e join departments d
on e.department_id = d.department_id
where e.department_id in (10,60,90)
and salary > 5000;

create index emp_dept_id_idx
on employees(department_id);

select table_name, NUM_ROWS
from user_tables
where table_name='employees';

select last_name, salary+(salary*nvl(commission_pct,0))ann_sal
from employees
where salary+(salary*nvl(comission_pct,0))>17000;

