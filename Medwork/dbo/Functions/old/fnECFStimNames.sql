create function fnECFStimNames(@ECFStimID int)
returns nvarchar(1000)
as
begin
	declare @result nvarchar(1000)
	set @result = null
	select @result = isnull(@result + ', ','')
		+(select top 1 Text from (
			select * from dbo.fnDict('_StimModeDescr') union select * from dbo.fnDict('_StimMode1Descr')
		) as d where d.id = StimModeId)
	from ECFStimProto 
	where masterid=@ECFStimID
	return @result
end
