--TOP
--recuperando top 10 campeonato
use curso
go

SELECT TOP 5 * FROM campeonato
order by pontos desc;


--trazento top 10 montadoras x carros

use crm
go

select top 10 a.nome_montadora,count(b.id_carro) as qtd_carro
from montadora a
inner join carro_montadora b
on a.id_montadora=b.id_montadora
group by a.nome_montadora
order by  qtd_carro desc;

--recuperando 10 cidades mais populosas Brasil
use curso
go

select top 10 * from senso
order by populacao desc

select top 10 *,rank() over(order by populacao desc) as posicao 
from senso
order by populacao desc

