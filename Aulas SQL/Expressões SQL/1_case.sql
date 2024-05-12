	--Exemplo Simples
	use curso

	DECLARE @data DATETIME 
	SET @data=getdate()+1
	SELECT @data,
		 CASE   WHEN @data = Getdate() THEN 'Hoje'          
				WHEN @data < Getdate() THEN 'Ontem'          
				WHEN @data > Getdate() THEN 'Amanhã' 
				else 'Não sei'       
				END dia 
	
	--Exemplo 1
	use AdventureWorks2017

	SELECT productnumber,
	       productline,         
	Categoria=CASE productline                     
				WHEN 'R' THEN 'Road'                     
				WHEN 'M' THEN 'Mountain'                     
				WHEN 'T' THEN 'Touring'                     
				WHEN 'S' THEN 'Other sale items'                     
				ELSE 'Not for sale' END,       
				NAME 
	FROM   production.product 
	--where ProductLine is not null --adicionei
	ORDER  BY productnumber;

	select * from Production.Product

--Exemplo 2
	SELECT productnumber,
	       productline,         
	    CASE                      
			WHEN productline='R' THEN 'Road'                     
			WHEN productline='M' THEN 'Mountain'                     
			WHEN productline='T' THEN 'Touring'                     
			WHEN productline='S' THEN 'Other sale items'                     
			ELSE 'Not for sale' END Categoria,       
			NAME 
	FROM   production.product
	--where ProductLine is not null --adicionei
	ORDER  BY productnumber;

--Exemplo

SELECT productnumber,        
	   NAME, 
	   listprice,       
	   CASE WHEN listprice = 0 THEN 'Não está a venda' 
	        WHEN listprice <=50 THEN 'Abaixo de $50'                          
			WHEN listprice >50  AND listprice <=250 THEN 'Entre $ 51 de $250' 
			WHEN listprice >250 AND listprice <=1000 THEN 'Entre que $251 de $1000' 
			ELSE 'Acima de $1000' END Range_preco,        
			'Produtos' AS Categoria 
	   FROM   production.product 
	   ORDER  BY productnumber

--Ordernando com Case When
SELECT businessentityid,        
       salariedflag 
	FROM   humanresources.employee 
	ORDER  BY CASE WHEN salariedflag = 1 THEN businessentityid END DESC,           
	          CASE WHEN salariedflag = 0 THEN businessentityid END ASC

--update com Case when
  BEGIN TRANSACTION

	UPDATE humanresources.employee 
	SET vacationhours = ( CASE WHEN ( ( vacationhours - 10.00 ) < 0 ) 
	   THEN  vacationhours + 40.00 
	   ELSE ( vacationhours + 20.00 ) END ) 
	   --realizando print dos campos atualizado
	   output deleted.businessentityid,        
	   deleted.vacationhours AS Antes,        
	   inserted.vacationhours AS Depois --tabela temporária
	   WHERE  salariedflag = 0;
   
   Rollback transaction;

--Fim Aula

