--EXEMPLO 1 WHILE
DECLARE @cont int
SET @cont=10 
WHILE (select  getdate()-@cont) <=getdate()	   
       BEGIN
         Print  getdate()-@cont
		 SET @cont=@cont-1
	   IF (getdate()-@cont)>=getdate()	   
	     
           BREAK

       ELSE
          CONTINUE
        END;

--WHILE TABUADA
DECLARE @CONT INT, 
        @TAB INT
SET @CONT = 0
SET @TAB = 3
 
WHILE(@CONT<=10)
BEGIN  
    PRINT CAST(@CONT as nvarchar) + N' X ' + CAST(@TAB as nvarchar) + N' = ' + CAST(@CONT*@TAB as nvarchar)
	SET @CONT = @CONT + 1
END;


--Mostrar  numero par ou impar em intervalo

DECLARE @val1 INT,  
        @val2 INT,
		@mod INT
SET @val1 = 1
SET @val2 = 10
 
WHILE(@val1<=@val2)
BEGIN  
    SET @mod=@val1%2
	if @mod=0
		BEGIN
			Print 'O Numero '+cast(@val1 as nchar(2))+' é par'
			SET @val1 = @val1 + 1
		END
	else
		BEGIN 
			Print  'O Numero '+cast(@val1 as nchar(2))+' é impar' 
			SET @val1 = @val1 + 1
		END	
END	
		
		