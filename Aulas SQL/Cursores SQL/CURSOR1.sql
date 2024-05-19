	USE CURSO
	--DECLARA VARIAVEL
	DECLARE @MinhaVariavel VARCHAR(100),
	        @id_aluno int
	--DECLARA O CURSOR 
	DECLARE meu_cursor 
	CURSOR local FOR SELECT id_aluno,NOME FROM ALUNOS 
	--ABRINDO O CURSOR
	open meu_cursor
	-- Lendo a próxima linha
	FETCH next FROM meu_cursor INTO @id_aluno,@MinhaVariavel 
	-- Percorrendo linhas do cursor (enquanto houverem)
	WHILE(@@FETCH_STATUS = 0) 
		begin 
		print cast(@id_aluno as varchar(10))+'-'+@MinhaVariavel+' FETCH_STATUS-> '+cast(@@FETCH_STATUS as varchar(10))
	-- Lendo a próxima linha
		FETCH next FROM meu_cursor INTO @id_aluno,@MinhaVariavel 
	end
	print 'FETCH_STATUS-> '+cast(@@FETCH_STATUS as varchar(10))
	-- Fechando Cursor para leitura
	close meu_cursor
	-- Finalizado o cursor
	deallocate meu_cursor



