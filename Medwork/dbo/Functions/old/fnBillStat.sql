
CREATE FUNCTION [dbo].[fnBillStat](@BillID INT)
RETURNS VARCHAR(20)
BEGIN
declare @SumSchet money,
	@SumOplat money,
	@Anullir BIT,
	@Draft BIT

set @SumSchet = (select ItogoKOplate from Bill (nolock) where ID = @BillID)
set @SumOplat = (select Sum(Summa) from Payment pm (nolock)
				 left join patform pf (nolock) on pm.id=pf.id
				 where pm.NomerScheta = @BillID and IsNull(DocNumber,'')<>'' and pf.Canceled=0)
set @Anullir = (case when (select canceled from patform where id=@billid)=1 
	or (select Void from Bill (nolock) where ID = @BillID)='+' then 1 else 0 end)
set @Draft = (select Draft from Bill (nolock) where ID = @BillID)

return(select 
    	case 	
			when ISNULL(@Anullir,0) = 1 then 'Аннулирован'
			when ISNULL(@Draft,0) = 1 then 'Предв. смета'
			when ((ISNULL(@SumOplat,0) <> 0) and (ISNULL(@SumOplat,0) - ISNULL(@SumSchet,0)) = 0) then 'Оплачен'
			when ((ISNULL(@SumOplat,0) <> 0) and (ISNULL(@SumOplat,0) - ISNULL(@SumSchet,0)) > 0) then 'Переплачен'
			when ((ISNULL(@SumOplat,0) <> 0) and (ISNULL(@SumOplat,0) - ISNULL(@SumSchet,0)) < 0) then 'Оплачен частично'
			when ISNULL(@SumOplat,0) = 0 then 'Не оплачен'
	end)
END
