
CREATE FUNCTION [dbo].[fnServicePaid](@ServiceGUID nvarchar(32), @Summa money)
RETURNS nvarchar(32)
BEGIN
	declare @BillID int
	declare @BillPaid money
	declare @BillBalance money
	declare @BillSum money
	declare @BillItogo money	
	declare @bsPrice money
	declare @bsID int
	declare @PaymentID int
	declare @Draft bit
	declare @Quant int
	declare @BillCanceled int --	#4300
	declare @PaymentCanceled int --	#4300

--	select top 1 @BillID=masterid,@bsID=id,@PaymentID=PaymentID,@Quant=Quant-QuantReal,@bsPrice=Price from billservice bs where bs.guid=@ServiceGUID
--	#4300
 	select top 1 @BillID=masterid,@bsID=bs.id,@PaymentID=PaymentID,@Quant=Quant-QuantReal,@bsPrice=Price,@BillCanceled=p.Canceled,@PaymentCanceled=pp.Canceled
	from billservice bs WITH (NOLOCK)
	left join bill b on b.id = bs.masterid
	left join patform p WITH (NOLOCK) on b.id=p.id
	left join patform pp WITH (NOLOCK) on bs.paymentid=pp.id
	where bs.guid=@ServiceGUID --and p.Canceled <> 1 and pp.Canceled <> 1
		
	if exists (select top 1 id from billservice WITH (NOLOCK) where masterid=@BillID and PaymentID is not null)
	begin
		if @Quant*@bsPrice<@Summa
			return 'превышение'
		else if @Draft = 1
			return 'предв.смета'
		else if (@PaymentID is null) or ((@bsPrice>0) and ((select isnull((select sum(Summa) from PaymentService WITH (NOLOCK) -- Оплаты считаются по новой таблице
		                                                 where ServiceID = (select top 1 ID from BillService WITH (NOLOCK) where GUID=@ServiceGUID)),
                                                    (select isnull(summa,0) from Payment WITH (NOLOCK) where id=@PaymentID)))<=0)) -- Оплаты считаются по старому для обратной совместимости
						or (@BillCanceled=1) or (@PaymentCanceled=1)
			return 'не оплачено'
		else
			return 'оплачено'
	end
	else
	begin
		select @BillItogo = Itogo,@BillSum = ItogoKOplate,@BillPaid = ISNULL(dbo.fnBillPayed(ID),0)
			,@Draft=Draft
		from bill WITH (NOLOCK) where id = @BillID
		set @BillBalance = @BillPaid - (select IsNull(case when Itogo<>0 then sum(bs.price*bs.QuantReal)*(cast(ItogoKOplate as float)/Itogo)end,0)
				from Bill b WITH (NOLOCK) left join billservice bs WITH (NOLOCK) on b.id=bs.masterid where b.ID = @BillID
				group by b.id, ItogoKOplate, Itogo, NomerScheta, DataScheta)

		RETURN (select 
			case
    		when (@BillID is null) then 'нет счета'
    		when (@BillCanceled=1) then 'счет аннулир.'
				when ISNULL(@Draft,0) = 1 then 'предв.смета'
    		when ((@BillPaid >= @BillSum) or (@BillBalance>=@Summa*IsNull(case when @BillItogo<>0 then (@BillSum/@BillItogo)end,0))) then 'оплачено'
	    	when (@BillPaid > 0) and (@BillBalance > 0 or @Summa = 0) then 'частично'
			else 'не оплачено'
		end)
	end
	return ''
END
