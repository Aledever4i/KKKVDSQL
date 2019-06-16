
CREATE Procedure Add2GoodsMoveFromIncomSpecification @iId int
As begin
	Declare @m int
	Set NoCount On

	if(Exists(Select 1 From IncomSpecification s, IncomeDoc i Where s.MasterId=i.id and s.id=@iId and i.Active=1))begin
		Set @m = (Select IsNull(Max(id)+1,0) From goodsmove)

		Insert Into GoodsMove
		Select 
			@m, pd.DeptId, i.id, 4, i.servicecode,  i.quant,  0,  pd.docdate
		From 
			IncomSpecification i, IncomeDoc pd
		Where 
  		i.MasterId=pd.id 
			and
			i.id=@iId
	end

end
