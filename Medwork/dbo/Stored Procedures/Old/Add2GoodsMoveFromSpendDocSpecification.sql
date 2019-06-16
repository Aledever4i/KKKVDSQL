
CREATE Procedure Add2GoodsMoveFromSpendDocSpecification @iId int
As begin
  
	Declare @m int
	Set NoCount On

	if (exists (select 1 from SpendDocSpecification s, SpendDoc i where s.MasterId=i.id and s.id=@iId and i.Active=1)) begin
		set @m = (select max(id)+1 from goodsmove)
		if (@m is null) set @m=0

		insert into GoodsMove
		select 
			@m, pd.DeptId, i.id, 5, i.servicecode, 0, i.quant, pd.docdate
		from 
			SpendDocSpecification i, SpendDoc pd
		where 
			i.MasterId=pd.id 
			and
			i.id=@iId
	end
end
