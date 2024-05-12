use crm;
go

--exemplo subquerys
	select a.id_cliente,
		   a.primeiro_nome,
		   a.ultimo_nome,
		   a.sexo 
		   from  cliente a
	 where a.id_cliente in (select b.id_cliente from carro_cliente b where b.ano='2010');

--exemplo subquerys

	select a.id_cliente,
		   a.primeiro_nome,
		   a.ultimo_nome,
		   a.sexo 
		   from cliente a
	 where a.id_cliente in (select b.id_cliente from carro_cliente b where b.ano='2005'
	  and b.id_carro in (select c.id_carro from carro_montadora c where c.id_montadora=2));

--exemplo subquery 

	select a.id_cliente,
		   a.primeiro_nome,
		   a.ultimo_nome,
		   a.sexo,
		   (select b.nome_carro 
				   from carro_montadora b
				   inner join carro_cliente c
				   on b.id_carro=c.id_carro
				   and a.id_cliente=c.id_cliente) as nome_carro
			from cliente a;
	
-- retornando o nome do carro com subselect
	select a.id_cliente,
		   a.primeiro_nome,
		   a.ultimo_nome,
		   a.sexo,
		   (select b.nome_carro 
				   from carro_montadora b
				   inner join carro_cliente c
				   on b.id_carro=c.id_carro
				   and a.id_cliente=c.id_cliente) as nome_carro
			from cliente a;

	-- retornando pais com subselect

	select a.id_cliente,
		   a.primeiro_nome,
		   a.ultimo_nome,
		   a.codigo_pais,
		   (select b.nome_pais from pais b where a.codigo_pais=b.codigo_pais) as nome_pais
		   from cliente a

	--trazendo o pais e o idioma com subselect,nome_pais

		select a.id_cliente,
		   a.primeiro_nome,
		   a.ultimo_nome,
		   a.codigo_pais,
		   (select b.nome_pais from pais b where a.codigo_pais=b.codigo_pais) as nome_pais,
		   (select top 1 b.idioma from idiomas b where a.id_cliente=b.id_cliente) as idioma
		   from cliente a;
			
--subselect com funções de agregação
	select a.id_montadora,a.nome_carro,
	(select AVG(b.ano) from carro_cliente b where a.id_carro=b.id_carro) media_ano,
	(select MIN(b.ano) from carro_cliente b where a.id_carro=b.id_carro) mais_antigo,
	(select MAX(b.ano) from carro_cliente b where a.id_carro=b.id_carro) mais_novo,
	(select count(*) from carro_cliente b where a.id_carro=b.id_carro) qtd
	from 
	carro_montadora a;

	--criando cenario para fazer update com subselect
	alter table carro_montadora add  qtd int;

	--verificando informacao da da tabels

	use crm;
	go

	select * from carro_montadora; -- parou aqui

	--criado update para contar qtd de carros que os clientes possuem modelo

	begin transaction
	  update carro_montadora set qtd=(select count(*) as qtd from carro_cliente b
	  inner join  carro_montadora c on
	  c.id_carro=b.id_carro
	  and carro_montadora.id_carro=b.id_carro
	  group by b.id_carro);

	 -- correto commit
	 commit;

	 -- erro Rollback

	 Rollback


--drop coluna
	alter table carro_montadora drop COLUMN  qtd;


-- exemplo delete com subselect
begin transaction 


delete  carro_cliente
where id_cliente in (select id_cliente from cliente where codigo_pais='BR');


Rollback;



 select * from carro_cliente;