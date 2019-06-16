
-- находит ID attachment действующего на указанную дату полиса ОМС пациента
CREATE FUNCTION [dbo].[fnPatOmsAttOnDate](@pat int, @d datetime)
RETURNS INT
BEGIN
declare @omsAtt integer

Select top 1
@omsAtt=a.id
From 
	((attachment a left join organisations o on a.[off] = o.code)
	left join contracts c on c.id = a.Dog)
	left join InsuranceProgram i on i.id=a.AttProgram
Where 	
	(a.END_DATE is Null or a.END_DATE>=convert(datetime,convert(nvarchar,@d,102),102))
	and
	(a.BEG_DATE is Null or a.BEG_DATE<=@d)
  	and
  	AttType=1
  	and
  	a.masterid = @pat

RETURN @omsAtt
END

