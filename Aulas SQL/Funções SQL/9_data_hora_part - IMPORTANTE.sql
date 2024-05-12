	--FUNCAO DE DATA E HORA PARTES

	--RETORNA O DIA/Mes/Ano
	SELECT Getdate()data_hora,
	       Datename (day, Getdate()) DIA_N,
		   Datename (month, Getdate()) MES_N,
		   Datename (year, Getdate()) ANO_N

	--RETORNA O DIA/Mes/Ano
	SELECT Datepart (day, Getdate()) DIA_P,
		   Datepart (month, Getdate())MES_P,
		   Datepart (year, Getdate()) ANO_P

	--RETORNA O DIA/Mes/Ano
	SELECT Day(Getdate()) DIA,
	       Month (Getdate()) MES,
		   Year (Getdate()) ANO
	
	--RETONAR DATA HORA COM 7 ARGUMENTOS
	--ANO MES DIA HORA MINUTOS SEGUNDO MILESEGUNDOS 
	SELECT DATETIMEFROMPARTS (2017,11,30,3,45,59,1) HORA

--
use CRM;

--exemplo 1
select a.primeiro_nome,
       a.nascimento,
       MONTH(a.nascimento)mes,
	   YEAR(a.nascimento)ano,
	   DAY(a.nascimento) dia 
	   from cliente a

--exemplo 2
select MONTH(a.nascimento)mes,
	   YEAR(a.nascimento)ano,
	   count(*) qtd
	   from cliente a
group by MONTH(a.nascimento),YEAR(a.nascimento)
order by YEAR(a.nascimento) ASC,MONTH(a.nascimento) ASC


--OUTRO EXEMPLO
select CONCAT(MONTH(a.nascimento),'-',DATENAME(MONTH,a.nascimento))mes,
	   YEAR(a.nascimento)ano,
	   count(*) qtd
	   from cliente a
group by CONCAT(MONTH(a.nascimento),'-',DATENAME(MONTH,a.nascimento)),YEAR(a.nascimento)
order by YEAR(a.nascimento) ASC,1 ASC

--exemplo 3
select 
	   YEAR(a.nascimento)ano,
	   count(*) qtd
	   from cliente a
group by YEAR(a.nascimento)
order by YEAR(a.nascimento) ASC


--CORRIGINGO ERRO
--partes
select distinct concat(REPLICATE('0', 2 - len(Month(nascimento))),MONTH(nascimento)),
len(Month(nascimento)) contando_carac
from cliente

-- CORRECAO
select concat(REPLICATE('0', 2 - len(Month(nascimento))),MONTH(nascimento),'-',DATENAME(MONTH,a.nascimento))mes,
	   YEAR(a.nascimento)ano,
	   count(*) qtd
	   from cliente a
group by concat(REPLICATE('0', 2 - len(Month(nascimento))),MONTH(nascimento),'-',DATENAME(MONTH,a.nascimento)),
         YEAR(a.nascimento)
order by YEAR(a.nascimento) ASC,1 ASC


