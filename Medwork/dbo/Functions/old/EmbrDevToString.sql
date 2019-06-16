create function [dbo].[EmbrDevToString](@OFateID int, @DayNumber int)
returns varchar(255)
as
begin
	declare @ver int
	declare @s varchar(255)
	declare @StageName varchar(255)
	declare @EstimFactorName varchar(255)
	declare @DevQuant int
	declare @DevEstimName varchar(255)
	declare @ActionName varchar(255)
	declare @fertilizEstim varchar(255)
	declare @ooEstim varchar(255)
	--declare @OperName varchar(255)
	
	set @ver=(select StructureVersion from OFate where ID=@OFateID)
	
	IF @ver=1
	BEGIN
	select
		@StageName=s.Text, 
		@ActionName=a.Text2,
		@ooEstim=d.OoEstim,--oe.Text,
		@fertilizEstim=d.DevEstimCommon,--fe.Text,
		@DevQuant=coalesce(d.DevQuant, d.PronucleusCount),
		@DevEstimName=isnull(case when isnull(d.DevEstimBl,'')<>'' then d.devestimBl else
				case when isnull(d.DevEstim,'')<>'' then d.devestim else d.fertilizEstim end
			end,''),--de.Text,
		@EstimFactorName=d.EstimFactor--fre.Text
		--,@OperName=(select top 1 [name] from Usr where id=d.OperId)
	from EmbrionDevelopment d
		left join dict s on (s.code=d.Stage and s.MasterID=(select id from dict where [column]='EmbryoStage'))
		left join dict a on (a.code=d.Action and a.MasterID=(select id from dict where [column]='EmbryoAction'))
		left join dict oe on (oe.code=d.OoEstim and oe.MasterID=(select id from dict where [column]='_OStat1Descr'))
		left join dict fe on (fe.code=d.FertilizEstim and fe.MasterID=(select id from dict where [column]='_OStat2Descr'))
		left join dict de on (de.code=d.DevEstim and de.MasterID=(select id from dict where [column]='_OStat3Descr'))
		left join dict fre on (fre.code=d.EstimFactor and fre.MasterID=(select id from dict where [column]='_OStat4Descr'))
	where d.MasterID=@OFateID and d.DayNumber=@DayNumber

	set @s=--@StageName
		isnull(@ActionName+' (','')
		+rtrim(ltrim(isnull(@ooEstim,'')))

	if @StageName='бластоциста'
		set @s=@s+rtrim(ltrim(isnull(' '+@DevEstimName+' '+isnull(cast(@DevQuant as varchar(10)),''),'')))
	else
		set @s=@s+rtrim(ltrim(isnull(' '+isnull(cast(@DevQuant as varchar(10)),'')+' '+@DevEstimName,'')))
	--set @s=rtrim(ltrim(@s))
	set @s=@s+rtrim(ltrim(
		+isnull(' '+@EstimFactorName,'')
		+isnull(' '+@fertilizEstim,'')))

	if(@ActionName is not null)
		set @s=@s+')'
	--if @DayNumber=0
	--begin
	--	set @s=rtrim(ltrim(@s))+isnull('; '+@OperName,'')
	--end
	if @DayNumber=6 and @s=''
	begin
		select
			@s=a.Text2
		from
			EmbrionDevelopment d
			left join dict a on (a.code=d.Action and a.MasterID=(select id from dict where [column]='EmbryoAction'))
		where
			d.MasterID=@OFateID and d.DayNumber<@DayNumber and a.Text2 in ('ET','Cryo')
	end

	END
	ELSE
	BEGIN

	set @s=(SELECT (case @DayNumber when 0 then
	(OStat1Id+'; '+
    OStat5Id) --[_0],
-- 1 --
	when 1 then
  (  (case when _1Die=1 then 'X (' when _1Cryo=1 then 'Cryo (' when _1Trans=1 then 'ET (' else '' end)+
	(case when _1Qty>0 then cast(_1Qty as NVARCHAR(2)) else '' end)+
    (_1OStat2Id)+'; '+
    (_1OStat5Id)+
	(case when _1Die=1 or _1Cryo=1 or _1Trans=1 then ')' else '' end)) --[_1],
-- 2 --
	when 2 then
	((case when _1Die=1 or _1Cryo=1 or _1Trans=1 then '' else (
    (case when _2Die=1 then 'X (' when _2Cryo=1 then 'Cryo (' when _2Trans=1 then 'ET (' else '' end)+
    (case when _2Qty>0 then cast(_2Qty as NVARCHAR(2)) else '' end)+
    (_2OStat3Id)+'; '+
    (_2OStat4Id)+'; '+
    (_2OStat5Id)+
	(case when _2Die=1 or _2Cryo=1 or _2Trans=1 then ')' else '' end)) end)) --[_2],
-- 3 --
	when 3 then
	((case when _1Die=1 or _1Cryo=1 or _1Trans=1 or _2Die=1 or _2Cryo=1 or _2Trans=1 then '' else (
    (case when _3Die=1 then 'X (' when _3Cryo=1 then 'Cryo (' when _3Trans=1 then 'ET (' else '' end)+
    (case when _3Qty>0 then cast(_3Qty as NVARCHAR(2)) else '' end)+
    (_3OStat3Id)+'; '+
    (_3OStat4Id)+'; '+
    (_3OStat5Id)+
	(case when _3Die=1 or _3Cryo=1 or _3Trans=1 then ')' else '' end)) end)) --[_3],
-- 4 --
	when 4 then
	((case when _1Die=1 or _1Cryo=1 or _1Trans=1 or _2Die=1 or _2Cryo=1 or _2Trans=1 or _3Die=1 or _3Cryo=1 or _3Trans=1 then '' else (
    (case when _4Die=1 then 'X (' when _4Cryo=1 then 'Cryo (' when _4Trans=1 then 'ET (' else '' end)+
    (case when _4Qty>0 then cast(_4Qty as NVARCHAR(2)) else '' end)+
    (_4OStat3Id)+'; '+
    (_4OStat4Id)+'; '+
    (_4OStat5Id)+
	(case when _4Die=1 or _4Cryo=1 or _4Trans=1 then ')' else '' end)) end)) --[_4],
-- 5 --
	when 5 then
	((case when _1Die=1 or _1Cryo=1 or _1Trans=1 or _2Die=1 or _2Cryo=1 or _2Trans=1 or _3Die=1 or _3Cryo=1 or _3Trans=1 or _4Die=1 or _4Cryo=1 or _4Trans=1 then '' else (
    (case when _5Die=1 then 'X (' when _5Cryo=1 then 'Cryo (' when _5Trans=1 then 'ET (' else '' end)+
    (case when _5Qty>0 then cast(_5Qty as NVARCHAR(2)) else '' end)+
    (_5OStat3Id)+'; '+
    (_5OStat4Id)+'; '+
    (_5OStat5Id)+
	(case when _5Die=1 or _5Cryo=1 or _5Trans=1 then ')' else '' end)) end)) --[_5],
-- 6 --
	when 6 then
	((case when _1Die=1 or _1Cryo=1 or _1Trans=1 or _2Die=1 or _2Cryo=1 or _2Trans=1 or _3Die=1 or _3Cryo=1 or _3Trans=1 or _4Die=1 or _4Cryo=1 or _4Trans=1 or _5Die=1 or _5Cryo=1 or _5Trans=1 then '' else (
    (case when _6Die=1 then 'X (' when _6Cryo=1 then 'Cryo (' when _6Trans=1 then 'ET (' else '' end)+
    (case when _6Qty>0 then cast(_6Qty as NVARCHAR(2)) else '' end)+
    (_6OStat3Id)+'; '+
    (_6OStat4Id)+'; '+
    (_6OStat5Id)+
	(case when _6Die=1 or _6Cryo=1 or _6Trans=1 then ')' else '' end)) end)) --[_6],
	else '' end) s
  FROM OFate
WHERE ID=@OFateID)

	END
	
	return @s
end
