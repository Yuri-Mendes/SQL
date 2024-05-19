--CRIANDO TABELA PARA CURSOR
--drop table contapagparc
create table contapagparc
(
 num_doc  int ,
 dtvenc  date,
 parcela  int
 );
--verificando estrutura
select  num_doc,dtvenc from contapagparc
select *  from contapagparc


insert into contapagparc values ('1',getdate()+30,'')
insert into contapagparc values ('1',getdate()+45,'')
insert into contapagparc values ('1',getdate()+60,'')

insert into contapagparc values ('2',getdate()+15,'')
insert into contapagparc values ('2',getdate()+20,'')
insert into contapagparc values ('2',getdate()+25,'')

--select * from contapagparc

DECLARE @num_doc AS INT 
DECLARE @dtvenc AS DATE 
DECLARE @cont AS INT =0 
DECLARE @num_doc_aux AS INT 

DECLARE cursorparc CURSOR FOR 
  SELECT num_doc, 
         dtvenc 
  FROM   contapagparc 
  ORDER  BY num_doc, 
            dtvenc ASC 

OPEN cursorparc 

FETCH next FROM cursorparc INTO @num_doc, @dtvenc 

WHILE @@FETCH_STATUS = 0 
  --status fecth  
  -- 0 Instrucao bem sucedida 
  -- 1 instrucao falhou  
  -- 2 a linha buscado nao existe 
  BEGIN 
      IF @num_doc_aux <> @num_doc 
        BEGIN 
            SET @cont=1; 
            SET @num_doc_aux= @num_doc; 
        END 
      ELSE 
        BEGIN 
            SET @cont=@cont + 1 
            SET @num_doc_aux= @num_doc; 
        END 

      --atualizazao 
      UPDATE contapagparc 
      SET    parcela = @cont 
      WHERE  num_doc = @num_doc 
             AND dtvenc = @dtvenc; 

      FETCH next FROM cursorparc INTO @num_doc, @dtvenc 
  END 

CLOSE cursorparc 

DEALLOCATE cursorparc 

--select * from contapagparc