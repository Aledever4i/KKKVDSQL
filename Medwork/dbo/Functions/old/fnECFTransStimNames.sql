create function fnECFTransStimNames(@ECFTransID int)
returns nvarchar(1000)
as
begin
	declare @result nvarchar(1000)
	set @result = null
	select @result = isnull(@result + ', ','')+[StimMode]
	from ECFTransStim
	where masterid=@ECFTransID
	return @result
end
