CREATE FUNCTION fnBillServicesCost(@BillID INTEGER,@IncSister INTEGER)
RETURNS FLOAT
BEGIN
	return isnull(
	(select sum(costs) from (select quantreal*(isnull(cost,0)+IsNull((select top 1 psrv1.PaySister from PaidService psrv1 where psrv1.Code=bs.Service)*@IncSister,0)) as costs
		from billservice bs
		where masterid=@BillID
		) as q),0)
END
