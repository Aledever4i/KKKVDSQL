create function fnECFEmbrFateStages(@ECFEmbr int, @action int, @recdate datetime)
returns nvarchar(1000)
as
begin
	declare @result nvarchar(1000)
	set @result = null
	select @result = isnull(@result + ', ','') + [stage] from dbo.fnECFEmbrFates(@ECFEmbr)
	where (@action is null or @action=action) 
	and (@recdate is null or @recdate=recdate)
	return @result
end
