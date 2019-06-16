
CREATE Procedure EditGoodsMoveFromSpendDocSpecification @iId int
As begin
  Set NoCount On
  Delete From goodsmove Where DocId=@iId and Doctype=5
  Execute Add2GoodsMoveFromSpendDocSpecification @iId
end
