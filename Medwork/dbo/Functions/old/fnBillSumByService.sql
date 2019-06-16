CREATE function fnBillSumByService (@ServiceGUID nvarchar(32))
returns money
begin
	return isnull((select sum(summa)
		from billservice bs
		where masterid=dbo.fnBillIDByService(@ServiceGUID)
		),0)
end
