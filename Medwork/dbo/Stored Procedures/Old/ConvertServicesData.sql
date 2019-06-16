
CREATE PROCEDURE ConvertServicesData;1 
	(@Source Nvarchar(16),  -- название источника 'ui', 'bill' или 'appointment'
	@SourceID int, -- идентификатор экземпляра источника
	@Target Nvarchar(16), -- название цели 'ui', 'bill' или 'appointment'
	@TargetID int, -- идентификатор экземпляра цели
	@Clear bit,-- очищать ли существующий экземпляр	
	@PatID int,-- id пациента для направления и счёта
	@UserID int, -- id пользователя для направления и счёта
	@DocDate datetime, -- ключевые данные единого док.та/ дата для создания формы счёта/направления
	@PaymentType int, -- ключевые данные единого док.та
	@paymentCode int, -- ключевые данные единого док.та
	@AttProgram int,
	@Diag int -- диагноз для создания единого док.та
	)
As begin

	declare @ParentID int
	set @ParentID=(select top 1 ParentID from PatForm with (nolock) where ID=@SourceID) --[1731]
	declare @PriceType int
	-- для обработки ошибок
	exec spSetVariable 'ConvertServicesDataOutput','-1'
	-- создание списка услуг
	

	if (lower(@target)='ui' and @targetID <= 0) return 1
	declare @result table(
		[id] int IDENTITY(1,1),
		[ServiceName] [nvarchar] (255) COLLATE Cyrillic_General_CI_AS NULL ,
		[Service] [nvarchar] (50) COLLATE Cyrillic_General_CI_AS NULL ,
		[Quant] [int] NULL ,
		[Price] [float] NULL ,
		[BasePrice] [float] NULL ,		
		[Summa] [float] NULL ,
		[GUID] [nvarchar] (32) COLLATE Cyrillic_General_CI_AS NULL ,
		[Creator] [int] NULL ,
		[CreateDate] [datetime] NULL ,
		[PaymentType] [int] NULL ,
		[PaymentCode] [int] NULL,
		[ServiceMeasure] [nvarchar] (50) NULL,
		[Comment] [nvarchar] (255) NULL,
		[Resource] [int] NULL,
		[Done] BIT,
		[SkidkaV] [float] NULL,
		ParentId int NULL,
		OldId int,
		[feepercent] FLOAT,
		[Cost] MONEY,
		[Fee] MONEY,
		ServOrMat nvarchar(50),
		cmdpositionid int,
		Kateg nvarchar(100),
		BezTseni nvarchar(1),
		ObjectId int,
		DATUSL datetime
	)

	if lower(@source) = 'bill'
	begin
		INSERT INTO @result 
		select 
			[ServiceName] ,
			[Service],
			case when (lower(@target)='appointment' ) then
					Quant-QuantReal					
				else [Quant] end [Quant],
			[Price],
			[BasePrice],			
			[Summa],
			[GUID],
			[Creator],
			[CreateDate],
			[PaymentType],
			[PaymentCode],
			[ServiceMeasure],
			[Comment],
			[Resource],
			0 [Done],
			[SkidkaV],
			ParentId,
			id,
			[feepercent],
			[Cost],
			[Fee],
			ServOrMat,
			cmdpositionid,
			Kateg,
			BezTseni,
			ObjectId,
			DATUSL
		from billService with (nolock)
		where MasterId = @Sourceid
					and (Quant>QuantReal or (lower(@target)<>'appointment' ))
		order by id
		
		update @result set ParentId=(select r.id from (select id, OldId from @result) r where r.OldId=ParentId)

		if @PaymentCode is null	set @PaymentCode = (select top 1 PaymentCode from bill where id = @SourceID)
		if @PaymentType is null set @PaymentType = (select top 1 PaymentType from bill where id = @SourceID)
		if @DocDate is null set @DocDate = (select top 1 DataScheta from bill where id = @SourceID)
		set @PriceType=(select top 1 PriceType from bill with (nolock) where id = @SourceID)
	end

	if lower(@source) = 'appointment'
	begin
		INSERT INTO @result 
		select  -- [MVA20111004]  begin
			min([ServiceName])    [ServiceName],
			min([Service])        [Service],
			sum (Quant)           [Quant],
			min([Price])          [Price],
			min([BasePrice])      [BasePrice],			
			sum (Summa)           [Summa],
			[GUID],
			min([Creator])        [Creator],
			min([CreateDate])     [CreateDate],
		  min([PaymentType])    [PaymentType],
			min([PaymentCode])    [PaymentCode],			
			min([ServiceMeasure]) [ServiceMeasure],
			min([Comment])        [Comment],
			min([Resource])       [Resource],
			ISNULL(NULLIF(0,(select count([Done]) from AppointmentService with (nolock) where GUID = AppointmentService.GUID and [Done] = 0)), 1) Done,
			min([SkidkaV])        [SkidkaV],
			min(ParentId)         [ParentId],
			min(Id)								[OldId],
			min([feepercent])     [feepercent],
			min([Cost])           [Cost],
			min([Fee])            [Fee],
			min([ServOrMat])      [ServOrMat],
			min([cmdpositionid])  [cmdpositionid],
			min([Kateg])          [Kateg],
			min([BezTseni])       [BezTseni],
			min([ObjectId])       [ObjectId],
			min([Date])           [DATUSL]
		from appointmentService AppS with (nolock)
		where MasterId = @Sourceid
    GROUP by GUID  -- [MVA20111004]  end
		order by min(id)
		
		update @result set ParentId=(select r.id from (select id, OldId from @result) r where r.OldId=ParentId)

		if @PaymentCode is null	set @PaymentCode = (select top 1 PaymentCode from napravlenie with (nolock) where id = @SourceID)
		if @PaymentType is null set @PaymentType = (select top 1 PaymentType from napravlenie with (nolock) where id = @SourceID)
		if @DocDate is null set @DocDate = (select top 1 DataNapravleniya from napravlenie with (nolock) where id = @SourceID)
		set @PriceType=(select top 1 PriceType from napravlenie with (nolock) where id = @SourceID)
	end

	if lower(@source) = 'ui'
	begin
		INSERT INTO @result 
		select 
			[name] ,
			[code],
			1,
			[Price],
			[Price],			
			[Price],
			[GUID],
			[Creator],
			[CreateDate],
			@PaymentType,
			@PaymentCode,
			Null as [ServiceMeasure],
			Null as [Comment],
			(select top 1 p.DoctorId from ud_patient p, ui_diag d where d.pid=p.id and d.id=UI_Service.pid) [Resource],
			1 [Done],
			0 [SkidkaV],
			null,
			null,
			null,
			null,
			null,
			'Услуга',
			null,
			null,
			null,
			null,
			null
		from UI_Service with (nolock)
		where PId = @Sourceid AND
			CreateDate = convert(datetime,convert(nvarchar,@docdate,102),102)			
		order by id	
	end
	
	if @AttProgram is null set @AttProgram = IsNull((select top 1 AttProgram from attachment with (nolock) where id = @PaymentCode),0)
	
	set @PriceType=IsNull(@PriceType,0)
---------------------------------------------------
-- список услуг создан, можно заполнять документы
--------------------------------------------------

	if (lower(@target)='ui' ) -- у единого док-та нет привязки к экземпляру документа, поэтому обрабатываем отдельно.
	begin
		insert into UI_Service
		(
			[id] ,
			[pid],
			[code],
			[name],
			[price],
			[isOMS],
			[uet] ,
			[Creator],
			[CreateDate],
			[Updater] ,
			[UpdateDate],
			[GUID]
		)
		select 
			isnull((select top 1 id from ui_service with (nolock) order by id desc),0)+1,
			@targetid [pid],
			[Service],
			[ServiceName] ,
			[summa],
			0 [isoms],
			null,
			[Creator],
			[CreateDate],
			[Creator],
			[CreateDate],
			[guid]
			 
		from @result
		where parentid is null
		exec spSetVariable 'ConvertServicesDataOutput','0' 
		return
	end


	if (lower(@target)='bill')  begin
		if (@targetID <= 0)
		begin
			set @targetID = (select top 1 id from patform order by id desc)+1
			insert into Patform (id,ParentID,PatID,FormId,AuthorID,CreateTime,UpdateTime)
			values (@targetID,@ParentID,@PatID,
				2445, --  <-------------------------------------- ID формы счёта
				@UserID,@docDate,@docDate)							
			insert into bill (id,PatID)
			values (@targetID,@PatID)				
		end
		if @Clear > 0 
		begin
			delete from billservice where Masterid = @targetID
		end
		insert into billService
		(
			[id] ,
			[Masterid],
			[ServiceName] ,
			[Service],
			[Quant],
			[Price],
			[BasePrice],			
			[Summa],
			[GUID],
			[Creator],
			[CreateDate],
			[PaymentType],
			[PaymentCode],
			[ServiceMeasure],
			[Comment],
			[Resource],
			[SkidkaV],
			ParentId,
			QuantReal,
			[feepercent],
			[Cost],
			[Fee],
			ServOrMat,
			cmdpositionid,
			Kateg,
			BezTseni,
			ObjectId,
			DATUSL
		)
		select 
			[id]+ isnull((select top 1 id from billservice with (nolock) order by id desc),0),
			@targetid,
			[ServiceName] ,
			[Service],
			[Quant],
			[Price],
			[BasePrice],			
			[Summa],
			[GUID],
			[Creator],
			[CreateDate],
			[PaymentType],
			[PaymentCode],
			[ServiceMeasure],
			[Comment],
			[Resource],
			[SkidkaV],
			ParentId+isnull((select top 1 id from billservice with (nolock) order by id desc),0),
			(select IsNull(sum(aps.Quant),0) from appointmentService aps with (nolock) where r.Guid=aps.Guid and aps.Done=1) QuantReal,
			[feepercent],
			[Cost],
			[Fee],
			ServOrMat,
			cmdpositionid,
			Kateg,
			BezTseni,
			ObjectId,
			DATUSL
		from @result r
		where Guid not in (select Guid from billService with (nolock) where GUID is not null)

		declare @num int
		declare @sum float
		declare @discount int,			
					  @i int
					  
		set @i=1
		while @i>0
		begin
		execute @num=spTableOrderNum Bill
		select @i=count(*) from Bill with (nolock) where NomerScheta=cast(@num as nvarchar)
		end

		
		set @sum = (select sum (summa) from billService with (nolock) where MasterID = @targetID)
		set @discount= 0
		update bill 
		set 
			PaymentType=@PaymentType,
			PaymentCode=@PaymentCode,
			AttProgram=@AttProgram,
			DataScheta=convert(datetime,convert(nvarchar,@docdate,102),102),
			NomerScheta=@num,
			Itogo = @sum,
			SchetVipisal = @userid,
			skidkaV = @discount,
			summaSuchetomskidki = round(@sum*(-@discount/100+1),2),
			itogoKOplate = round(@sum*(-@discount/100+1),2),
			PriceType=@PriceType
		where 
			id = @TargetID	
		update patform
			set DisplayName='Счет (договор) №'+cast(@num as nvarchar)+' от '+convert(nvarchar, @docDate, 104),
				Notes='Схема расчета: '+convert(nvarchar,IsNull((select Top 1 name from fn_PayMethods(@PatID, @docDate) where payType=@PaymentType and Id=@PaymentCode),''))+'; к оплате: '+convert(nvarchar,@sum)+'р.'
		where
			id = @TargetID
			
		if lower(@source) = 'appointment'
			update appointmentservice
			set BillId=@TargetID
			where MasterId=@SourceId AND
  				GUID in (select GUID from billService with (nolock) where MasterId = @targetid and GUID is not null)			
	end
	

	if (lower(@target)='appointment' ) 
	begin
		if (@targetID <= 0)
		begin
			set @targetID =((select top 1 id from patform order by id desc) + 1)
			insert into Patform (id,ParentID,PatID,FormId,AuthorID,CreateTime,UpdateTime)
			values (@targetID,@ParentID,@PatID,
				1935,--<---------------------------------------- ID формы направления
				@UserID,@docDate,@docDate)							
			
			insert into Napravlenie (id,PatID)
			values (@targetID,@PatID)				
		end
		if @Clear > 0 
		begin
			delete from appointmentservice where Masterid = @targetID
		end
		insert into appointmentService
		(
			[id] ,
			[Masterid],
			[ServiceName] ,
			[Service],
			[Quant],
			[Price],
			[BasePrice],			
			[Summa],
			[GUID],
			[Creator],
			[CreateDate],
			[PaymentType],
			[PaymentCode],
			[ServiceMeasure],
			[Comment],
			[Resource],
			[Done],
			[SkidkaV],
			ParentId,
			BillId,
			[feepercent],
			[Cost],
			[Fee],
			ServOrMat,
			cmdpositionid,
			Kateg,
			BezTseni,
			ObjectId,
			[Date]
		)
		select 
			[id]+isnull((select top 1 id from appointmentservice with (nolock) order by id desc),0),
			@targetid,
			[ServiceName],
			[Service],
			[Quant],
			[Price],
			[BasePrice],			
			[Summa],
			[GUID],
			[Creator],
			[CreateDate],
			[PaymentType],
			[PaymentCode],
			[ServiceMeasure],
			[Comment],
			[Resource],
			[Done],
			[SkidkaV],
			ParentId+isnull((select top 1 id from appointmentservice with (nolock) order by id desc),0),
			case when lower(@source) = 'bill' then @SourceId end BillId,
			[feepercent],
			[Cost],
			[Fee],
			ServOrMat,
			cmdpositionid,
			Kateg,
			BezTseni,
			ObjectId,
			DATUSL
		from @result

		update Napravlenie 
		set 
			PaymentType=@PaymentType,
			PaymentCode=@PaymentCode,
			AttProgram=@AttProgram,
			DataNapravleniya=convert(datetime,convert(nvarchar,@docdate,102),102),
			DataPriema=convert(datetime,convert(nvarchar,GetDate(),102),102),
			Zapisan=3162,
			TselVizita='Консультация',
			TipPriema='Первичный',
			Registrator=@UserID,
			PriceType=@PriceType
			
		where 
			id = @TargetID		
	
		update patform
			set DisplayName='Направление №'+cast(@TargetID as nvarchar)+' на ' + convert(nvarchar, @docDate, 104)
		where
			id = @TargetID
		
	end


	
	exec spSetVariable 'ConvertServicesDataOutput',@targetID;
	return

END

