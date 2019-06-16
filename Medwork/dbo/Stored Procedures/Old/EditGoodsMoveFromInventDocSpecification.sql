
create procedure EditGoodsMoveFromInventDocSpecification
 @iId int
as
 begin
  SET NOCOUNT ON
  delete from goodsmove where DocId=@iId and Doctype=6
  execute Add2GoodsMoveFromInventDocSpecification @iId
 end

