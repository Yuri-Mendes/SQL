USE curso 

DECLARE @id_aluno  INT, 
        @nome      VARCHAR(30), 
        @nome_disc VARCHAR(30), 
        @periodo   VARCHAR(10) 
--DECLARANDO PRIMEIRO CURSOR 
DECLARE c_alunos CURSOR FOR 
  SELECT id_aluno, 
         nome 
  FROM   alunos 

OPEN c_alunos 

FETCH next FROM c_alunos INTO @id_aluno, @nome 

--REPETICAO PRIMEIRO CURSOR 
WHILE @@FETCH_STATUS = 0 
  BEGIN 
      PRINT 'Nome do Aluno: ' + @nome; 

      PRINT 'Disciplinas:'; 

      --DECLARANDO SEGUNDO CURSOR
      DECLARE c_disciplina CURSOR FOR 
        SELECT b.nome_disc, 
               a.periodo 
        FROM   matricula a 
               INNER JOIN disciplina b 
                       ON a.id_disciplina = b.id_disciplina 
        WHERE  a.id_aluno = @id_aluno 

      OPEN c_disciplina 

      FETCH next FROM c_disciplina INTO @nome_disc, @periodo 

      --REPETICAO SEGUNDO CURSOR 
      WHILE @@FETCH_STATUS = 0 
        BEGIN 
            PRINT @nome_disc; 

            FETCH next FROM c_disciplina INTO @nome_disc, @periodo 
        --FECHANDO REPETICAO SEGUNDO CURSOR 
        END 

      --FECHANDO DESALOC SEGUNDO CURSOR 
      CLOSE c_disciplina 

      DEALLOCATE c_disciplina 

      PRINT '---------------:'; 
	  --LENDO PROXIMO REGISTRO CURSOR 1
      FETCH next FROM c_alunos INTO @id_aluno, @nome 
  --FECHANDO REPETICAO PRIMEIRO CURSOR 
  END 

--FECHANDO DESALOC SEGUNDO CURSOR 
CLOSE c_alunos 

DEALLOCATE c_alunos 