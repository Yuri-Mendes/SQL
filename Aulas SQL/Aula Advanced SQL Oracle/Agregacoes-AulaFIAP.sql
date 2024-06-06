
select salary
from employees;

select department_id, sum(salary)
from employees
group by department_id
order by department_id desc;

select job_id,sum(salary)
from employees
group by job_id
order by 1;

select department_id,job_id, sum(salary)
from employees
group by rollup (department_id, job_id)
order by 1,2 desc;

select department_id,job_id, sum(salary)
from employees
group by cube (department_id, job_id)
order by 1,2 desc;

select department_id,job_id, sum(salary)
from employees
group by cube (department_id, job_id)
order by 1,2 desc;

SELECT department_id, MAX(salary) 
FROM employees
GROUP BY department_id
ORDER BY 2 DESC;

select department_id, salary from employees
order by salary desc

