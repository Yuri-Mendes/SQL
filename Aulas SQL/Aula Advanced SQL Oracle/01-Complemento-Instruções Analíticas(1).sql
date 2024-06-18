SELECT manager_id, last_name, hire_date, salary, 
       round (AVG(salary) OVER (PARTITION BY manager_id ORDER BY hire_date 
       ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)) AS c_mavg 
FROM employees
--where manager_id = 103
ORDER BY manager_id, hire_date, salary;


SELECT last_name, salary,
       COUNT(*) OVER (ORDER BY salary
       RANGE BETWEEN 50 PRECEDING AND 150 FOLLOWING) AS mov_count
FROM employees
ORDER BY 3;


SELECT manager_id, last_name, salary, SUM(salary) 
       OVER (PARTITION BY manager_id ORDER BY salary 
       RANGE UNBOUNDED PRECEDING) l_csum 
FROM employees 
--where manager_id = 103
ORDER BY manager_id, last_name, salary, l_csum;
 
