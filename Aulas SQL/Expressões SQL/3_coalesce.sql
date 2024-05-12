
--exemplos
SELECT COALESCE(NULL, NULL, 'Terceiro Valor', 'Quarto valor');
SELECT COALESCE(NULL, NULL, NULL, NULL);

use curso

--drop table tab_salario;
CREATE TABLE tab_salario  
(  
    matricula     int   identity,  
    salario_hora  decimal   NULL,  
    salario       decimal   NULL,  
    comissao      decimal   NULL,  
    vendas        int   NULL  
); 
 
INSERT tab_salario (salario_hora, salario, comissao, vendas)  
VALUES  
    (10.00, NULL, NULL, NULL),  
    (20.00, NULL, NULL, NULL),  
    (30.00, NULL, NULL, NULL),  
    (40.00, NULL, NULL, NULL),  
    (NULL, 10000.00, NULL, NULL),  
    (NULL, 20000.00, NULL, NULL),  
    (NULL, 30000.00, NULL, NULL),  
    (NULL, 40000.00, NULL, NULL),  
    (NULL, NULL, 15000, 3),  
    (NULL, NULL, 25000, 2),  
    (NULL, NULL, 20000, 6),  
    (NULL, NULL, 14000, 4);  

SELECT matricula,
       salario_hora, salario, comissao, vendas,
      CAST(COALESCE(salario_hora * 40 * 52,salario,comissao * vendas) AS money) AS 'Total Salario'   
FROM tab_salario 
ORDER BY matricula;
GO  