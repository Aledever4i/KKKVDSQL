
CREATE FUNCTION [dbo].[PaidServicesForProgram](
	@ProgramId int)
RETURNS @t TABLE (
		[ID] [int] NOT NULL,
		[Code] [nvarchar](20),
		[ServiceName] [nvarchar](255),
		[BasePrice] [float],
		[Price] [float],
		[MasterID] [int],
		[NodeType] [nvarchar](12),
		[Komment] nvarchar(200),
		[Duration] [int],
		[feepercent] [float],
		[Fee] [money],
		[MaxCount] [int],
		[TotalCount] [int]
		)
AS
begin

	declare @skidka float,
			@round int,
			@VseUslugi nvarchar(1),
			@PriceType int

	select @skidka=skidka, @round=[round], @VseUslugi=VseUslugi, @PriceType=PriceType
	from InsuranceProgram where id=@ProgramId

	declare @t2 table(
		[ID] [int] NOT NULL,
		[Code] [nvarchar](20),
		[ServiceName] [nvarchar](255),
		[BasePrice] [float],
		[Price] [float],
		[MasterID] [int],
		[NodeType] [nvarchar](12),
		[Komment] nvarchar(200),
		[Duration] [int],
		[feepercent] [float],
		[Fee] [money]
		)

	insert into @t2
			select [ID], [Code], [ServiceName],	[BasePrice], 
								Round(case @PriceType
											when 1 then Price1
											when 2 then Price2
											when 3 then Price3
											when 4 then Price4
											when 5 then Price5
											when 6 then Price6
											when 7 then Price7
											when 8 then Price8
											when 9 then Price9
											else [BasePrice] end
												*(1-IsNull(@skidka,0)/100),IsNull(@round,2)),
							[MasterID],[NodeType],
		[Komment],[Duration], --[2008.09.29]
		[feepercent], [Fee]
			from paidservice
	update @t2 set NodeType='FOLDER' where id in (select MasterId from @t2)
	update @t2 set NodeType='NODE' where IsNull(NodeType,'')<>'FOLDER'

	if @VseUslugi='+'
		insert into @t
			select *, Null, Null
			from @t2

	declare @ServiceId int,
			@Price float,
			@DefaultPrice nvarchar(1),
			@MaxCount int,
			@TotalCount int,
			@Comment nvarchar(50),
			@feepercent float,
			@Fee money

	if @VseUslugi='+'
		update @t
			set Price=case when AddS_DefaultPrice='+' then Price else AddS_Price end,
			MaxCount=IsNull(AddS_MaxCount,MaxCount), TotalCount=IsNull(AddS_TotalCount,TotalCount)
		from (select DefaultPrice AddS_DefaultPrice, ServiceId AddS_ServiceId, MasterId AddS_MasterId, MaxCount AddS_MaxCount, TotalCount AddS_TotalCount, Price AddS_Price from AddServices) AddS
		where id=AddS_ServiceId and AddS_MasterId=@ProgramId and NodeType='FOLDER'
	else
		insert into @t
		select t2.[ID], t2.[Code], t2.[ServiceName],	t2.[BasePrice],
				case when AddS.DefaultPrice='+' then t2.Price else AddS.Price end,
				t2.[MasterID],t2.[NodeType],t2.[Komment],t2.[Duration], AddS.[feepercent], AddS.[Fee], AddS.MaxCount, AddS.TotalCount
		from @t2 t2, AddServices AddS
		where t2.id=AddS.ServiceId and AddS.MasterId=@ProgramId and NodeType='FOLDER'

	declare @count int
	set @count=1
	if @VseUslugi<>'+'
		while @count>0 
		begin
			insert into @t
			select distinct t2.*, null, null -- это вышестоящие папки в иерархии, у них ограничения не имеют смысла
			from @t2 t2, @t t
			where t2.MasterId=t.id
				and t2.id not in (select id from @t)
			set @count=@@ROWCOUNT
		end
	
		
	declare AddServ cursor for
	select ServiceId, AddS.Price, DefaultPrice, MaxCount, TotalCount, AddS.Comment, AddS.feepercent, AddS.Fee
	from AddServices AddS, @t2 t2
	where AddS.MasterId=@ProgramId and t2.id=AddS.ServiceId
				and NodeType<>'FOLDER'


	open AddServ

	FETCH NEXT FROM AddServ
	into @ServiceId, @Price, @DefaultPrice,	@MaxCount, @TotalCount, @Comment, @feepercent, @Fee


	WHILE @@FETCH_STATUS = 0
	BEGIN
		select @count=count(*) from @t where id=@ServiceId
		if @count>0
			update @t
			set Price=case when @DefaultPrice='+' then Price else @Price end,
				MaxCount=IsNull(@MaxCount,0), TotalCount=IsNull(@TotalCount,0), 
				Komment=cast(NullIf(isNull('['+NullIf(@Comment,'')+'] ','')+isNull(Komment,''),'') as nvarchar(200)),
				feepercent=@feepercent, Fee=@Fee
			where id=@ServiceId
		else
			insert into @t
			select [ID], [Code], [ServiceName],	[BasePrice],
					case when @DefaultPrice='+' then Price else @Price end,
					[MasterID],[NodeType],cast(NullIf(isNull('['+NullIf(@Comment,'')+'] ','')+isNull(Komment,''),'') as nvarchar(200)),
					[Duration], @feepercent, @Fee, @MaxCount, @TotalCount
			from @t2
			where id=@ServiceId
		FETCH NEXT FROM AddServ
		into @ServiceId, @Price, @DefaultPrice,	@MaxCount, @TotalCount,@Comment, @feepercent, @Fee
	END
	
	set @count=1
	if @VseUslugi<>'+'
		while @count>0 
		begin
			insert into @t
			select distinct t2.*, null, null -- это вышестоящие папки в иерархии, у них ограничения не имеют смысла
			from @t2 t2, @t t
			where t2.id=t.MasterId
				and t2.id not in (select id from @t)
			set @count=@@ROWCOUNT
		end
	
	CLOSE AddServ
	DEALLOCATE AddServ

	set @count=1
	if @VseUslugi='+'
		while @count>0 
		begin
				update t	set t.MaxCount=isnull(t.MaxCount,p.MaxCount), t.TotalCount=isnull(t.TotalCount,p.TotalCount)
				from @t t  inner join @t p on  p.id = t.masterId
				where (t.MaxCount is null and p.MaxCount is not null) or (t.TotalCount is null and p.TotalCount is not null)
			set @count=@@ROWCOUNT
		end

	delete from @t
		where id in (select ServiceId from DeleteServices where MasterId=@ProgramId)

	set @count=1
	while @count>0 
	begin
		delete from @t
		where MasterID not in (select Id from @t) and NodeType='FOLDER' -- #6477 Удаление папок, подчиненных уже удаленным
--		where id not in (select MasterId from @t) and NodeType='FOLDER' 
		set @count=@@ROWCOUNT
	end

	set @count=1
	while @count>0 
	begin
		delete from @t
		where MasterId not in (select Id from @t) and NodeType='NODE'
		set @count=@@ROWCOUNT
	end

	return
end
