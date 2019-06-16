
CREATE FUNCTION [dbo].[fnBonus](@PatID INTEGER, @BillID INTEGER, @Date DATETIME)
RETURNS FLOAT
BEGIN
	declare @bonus FLOAT
	declare @used FLOAT

	select @bonus=sum(isNull(p.Summa,0) * (a.BonusPercent/100))
	from bill b
	join Attachment a on b.PaymentCode=a.ID
	join Payment p on p.NomerScheta=b.ID
	where not NullIf(a.BonusPercent,0) is null
	and b.PatID=@PatID
	and IsNull(p.DocNumber,'')<>''
	and IsNull(p.PayType,0)<>4
	and (@BillID is null or b.ID=@BillID)
	and (@Date is null or @Date>=p.DataOplati)

	if @BillID is null 
	select @used=sum(Summa)
	from payment
	where PayType=4

	RETURN(select cast(isNull(@bonus,0)-isNull(@used,0) as decimal(10,2)))
END
