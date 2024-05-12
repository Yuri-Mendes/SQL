--DIFERENCA EM DIAS
SELECT Datediff (day, '2015-03-12', '2017-07-13')

--DIFERENCA EM MESES
SELECT Datediff (month, '2015-03-12', '2017-07-13')

--DIFERENCA EM Anos
SELECT Datediff (year, '2015-03-12', '2017-07-13')
 
--Atraves deste comando podemo descobrir ha quantos dias/meses ou anos temos de  vida. 
--DIFERENCA EM DIA
SELECT Datediff (day, '1991-11-17', Getdate())

--DIFERENCA EM MESES
SELECT Datediff (month, '1991-11-17', Getdate()) 

--DIFERENCA EM Anos
SELECT Datediff (year, '1991-11-17', Getdate())

--EXEMPLO
USE CRM

	SELECT a.id_cliente,
		   a.nascimento,
		   getdate() hoje,
		   Datediff (day,a.nascimento,getdate()) dif_dia,
		   Datediff (month,a.nascimento,getdate()) dif_mes,
		   Datediff (YEAR,a.nascimento,getdate()) dif_anos
    FROM cliente A 
	where a.nascimento>'1980-01-01';


	--teste com sua data de nascimento
	declare @meu_aniversario as datetime;
	set @meu_aniversario='1991-17-11';

	select Datediff (day,@meu_aniversario,getdate()) dif_dia,
		   Datediff (month,@meu_aniversario,getdate()) dif_mes,
		   Datediff (YEAR,@meu_aniversario,getdate()) dif_anos