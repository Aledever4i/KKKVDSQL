
create FUNCTION [dbo].[fnServicePaid2](@ServiceGUID nvarchar(32), @Summa money)
RETURNS nvarchar(39)
BEGIN
	declare @s nvarchar(39)
	set @s=dbo.fnServicePaid(@ServiceGUID, @Summa)
	if(@s='оплачено')
		set @s='услуга оплачена'
  else if(@s='нет счета')
		set @s='на услугу не выписан счёт'
  else if(@s='частично')
		set @s='услуга оплачена частично'
  else if(@s='превышение')
		set @s='превышено количество, указанное в счёте'
  else if(@s='предв.смета')
		set @s='предварительная смета ещё не утверждена'
	else if(@s='не оплачено')
		set @s='услуга не оплачена'
	return @s
END
