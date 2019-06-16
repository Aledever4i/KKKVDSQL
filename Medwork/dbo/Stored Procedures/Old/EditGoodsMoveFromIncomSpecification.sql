
CREATE Procedure EditGoodsMoveFromIncomSpecification @iId int
As begin
	Set NoCount On
	Delete From goodsmove Where DocId=@iId and Doctype=4
	Execute Add2GoodsMoveFromIncomSpecification @iId
end
