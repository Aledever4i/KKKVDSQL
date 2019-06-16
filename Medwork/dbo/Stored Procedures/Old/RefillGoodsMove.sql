
create procedure RefillGoodsMove as
begin

declare
 @i int

  SET NOCOUNT ON

delete from goodsmove
execute CheckRegItems
update IncomSpecification set id=id
update OutDocSpecification set id=id

  DECLARE tmp_cursor2 CURSOR FOR
    select s.id from inventDocSpecification s, InventDoc i where s.masterid=i.id order by i.docdate
  OPEN tmp_cursor2
  FETCH NEXT FROM tmp_cursor2 INTO @i
  WHILE @@FETCH_STATUS = 0 
    BEGIN 
     update inventdocspecification set id=id where id=@i
     FETCH NEXT FROM tmp_cursor2 INTO @i
    END

  close  tmp_cursor2
  DEALLOCATE tmp_cursor2

end

