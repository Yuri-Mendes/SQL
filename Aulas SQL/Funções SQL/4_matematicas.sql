--ABS
--Uma função matemática que retorna o valor absoluto (positivo) 
--da expressão numérica especificada.

SELECT Abs(-1.0),        
       Abs(0.0),        
	   Abs(1.0),
	   Abs(-9.0),
	   Abs(9.0),
	   abs(-5.4),
	   abs(5.4);

--RAND
--Retorna um valor float pseudoaleatório de 0 a 1, exclusivo.


SELECT Rand(), 
       Rand(), 
	   Rand()

--exenplo

DECLARE @cont smallint;
SET @cont = 1;
WHILE @cont < 5
   BEGIN
      SELECT RAND() RANDOMICO
      SET @cont = @cont + 1
   END;

--ROUND
--Retorna um valor numérico, arredondado, para o comprimento ou precisão especificados.

SELECT Round(123.9994, 3), --0,1,2,3,4<    
       Round(123.9995, 3) --5,6,7,8,9 >


SELECT Round(123.9994, 2), --0,1,2,3,4<    
       Round(123.9995, 2); --5,6,7,8,9 >

--exemplo 2

SELECT Round(123.4545, 2); 
SELECT Round(123.45,-2);
SELECT Round(193.45,-2);

--exemplo 3
SELECT Round(150.75, 0);
SELECT Round(150.75, 0, 1); 

--EXEMPLO FUNÇÃO POWER PONTENCIA -- ELEVADO AO QUADRADO, AO CUBO...
SELECT POWER(2,2);
SELECT POWER(2,3);

--OUTRO
DECLARE @VALOR INT=3,
        @POTENCIA INT=4;

SELECT POWER(@VALOR,@POTENCIA)

-- EXEMPLO SQRT RAIZ QUADRADA
SELECT SQRT(16)

