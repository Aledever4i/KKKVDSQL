
CREATE FUNCTION [dbo].[fnServiceDMSStat](@Guid nvarchar(32))
RETURNS VARCHAR(20)
BEGIN
	declare @SumSchet money,
		@SumOplat money,
		@billNum INT

	set @billNum = (select top 1 masterid from UDP_BillSpec (nolock) where guid = @Guid)

	if isnull(@billNum,0) > 0
	begin
		set @SumSchet = (select isnull(Summ,0) from UDP_Bill (nolock) where id = @billNum)
		set @SumOplat = (select Sum(isnull(Summa,0)) from UD_Payment where Schet = @billNum)
	end

	return(select 
    case 	
			when (ISNULL(@billNum,0) = 0) then 'Не создан'
			when ((ISNULL(@SumOplat,0) <> 0) and (ISNULL(@SumOplat,0) = ISNULL(@SumSchet,0))) then 'Оплачен'
			when ((ISNULL(@SumOplat,0) <> 0) and (ISNULL(@SumOplat,0) > ISNULL(@SumSchet,0))) then 'Переплачен'
			when ((ISNULL(@SumOplat,0) <> 0) and (ISNULL(@SumOplat,0) < ISNULL(@SumSchet,0))) then 'Оплачен частично'
			when ISNULL(@SumOplat,0) = 0 then 'Не оплачен'
		end)
END
