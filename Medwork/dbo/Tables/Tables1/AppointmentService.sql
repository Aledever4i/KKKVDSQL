CREATE TABLE [dbo].[AppointmentService] (
    [ID]             INT            NOT NULL,
    [MasterID]       INT            NULL,
    [GUID]           NVARCHAR (32)  NULL,
    [Creator]        INT            NULL,
    [CreateDate]     DATETIME       NULL,
    [PaymentType]    INT            NULL,
    [PaymentCode]    INT            NULL,
    [ServiceName]    NVARCHAR (255) NULL,
    [Service]        NVARCHAR (50)  NULL,
    [Quant]          INT            NULL,
    [Price]          MONEY          NULL,
    [Summa]          MONEY          NULL,
    [MatCB]          NVARCHAR (50)  NULL,
    [ServOrMat]      NVARCHAR (50)  NULL,
    [ServiceMeasure] NVARCHAR (50)  NULL,
    [Comment]        NVARCHAR (255) NULL,
    [FakeService]    NVARCHAR (50)  NULL,
    [Done]           BIT            NULL,
    [Resource]       INT            NULL,
    [SkidkaV]        FLOAT (53)     NULL,
    [ParentId]       INT            NULL,
    [BillID]         INT            NULL,
    [Date]           DATETIME       NULL,
    [Duration]       INT            NULL,
    [feepercent]     FLOAT (53)     NULL,
    [Cost]           MONEY          NULL,
    [Fee]            MONEY          NULL,
    [BasePrice]      MONEY          NULL,
    [kateg]          NVARCHAR (100) NULL,
    [cmdpositionid]  INT            NULL,
    [ObjectId]       INT            NULL,
    [PatFormId]      INT            NULL,
    [BezTseni]       NVARCHAR (1)   NULL,
    [KtoNaznachil]   INT            NULL,
    [SpecimenTypeID] NVARCHAR (50)  NULL,
    CONSTRAINT [AppointmentServicePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AppointmentServiceToNapravlenie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Napravlenie] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [AppointmentServiceMasterIDIdx]
    ON [dbo].[AppointmentService]([MasterID] ASC);


GO
CREATE NONCLUSTERED INDEX [AppointmentServiceGUIDIdx]
    ON [dbo].[AppointmentService]([GUID] ASC);


GO
CREATE NONCLUSTERED INDEX [_dta20140413_index_AppointmentService_7_1635745130__K3_K1_10_18]
    ON [dbo].[AppointmentService]([GUID] ASC, [ID] ASC)
    INCLUDE([Quant], [Done]);


GO
CREATE NONCLUSTERED INDEX [AppointmentServicePatFormIDIdx]
    ON [dbo].[AppointmentService]([PatFormId] ASC);


GO
CREATE NONCLUSTERED INDEX [AppointmentService_PaymentCode_Idx]
    ON [dbo].[AppointmentService]([PaymentCode] ASC);


GO
CREATE NONCLUSTERED INDEX [AppointmentService_Date_Idx]
    ON [dbo].[AppointmentService]([Date] ASC);


GO

Create Trigger [dbo].[AppointmentService_Change]
On [dbo].[AppointmentService]
After Insert, Update, Delete
AS begin
	set nocount on

	if (select count(*) from inserted i left join deleted d on i.id=d.id
			where d.id is null and i.ParentId is not null)>0
		return
		
--	if (select count(*) from inserted i left join deleted d on i.id=d.id
--			where d.id is null and i.GUID in (select GUID from BillService))>0
	if (select count(*) from inserted i left join deleted d on i.id=d.id
		inner join billservice bs on i.guid=bs.guid where d.id is null)>0
		return
		
	declare @dtable table (id int)
	
	insert into @dtable
	select d.id
	from inserted i right join deleted d on i.id=d.id
	where (i.id is null) or (i.id is not null and (IsNull(i.Service,'')<>IsNull(d.Service,'') or IsNull(i.ServOrMat,'')<>IsNull(d.ServOrMat,'')))
	
	while @@ROWCOUNT>0
	begin			
		insert into @dtable
		select aps.id from AppointmentService aps, @dtable dt
			where dt.id=aps.ParentId and aps.id not in (select id from @dtable)
	end
	
	delete from AppointmentService
		where ParentId in
			(select id
			from @dtable
			)
			
	declare @utable2 table(id int, Quant int, QuantNew int)	
	
	insert into @utable2
	select aps.id, d.Quant, i.Quant
	from inserted i, deleted d, AppointmentService aps
	where i.id=d.id and i.Quant<>d.Quant
				and i.id=aps.ParentId

	while @@ROWCOUNT>0
	begin
		insert into @utable2
		select aps.id, aps.Quant, case when u.Quant=0 then aps.Quant else aps.Quant*u.QuantNew/u.Quant end
		from @utable2 u, AppointmentService aps
		where u.id=aps.ParentId	and aps.id not in (select id from @utable2)
	end	
	
	update AppointmentService
	set Quant=u.QuantNew
	from @utable2 u
	where u.id=AppointmentService.Id
	
	declare @itable table (ID int identity (1,1), MasterID int, GUID nvarchar(32), Creator int, CreateDate datetime,
												 PaymentType int, PaymentCode int, ServiceName nvarchar(255), Service nvarchar(50), Quant int,
													ServOrMat nvarchar (50),Done bit, Resource int, ParentId int, RParentId int,
													[feepercent] FLOAT, [Cost] MONEY, [Fee] MONEY, Kateg nvarchar(32), BasePrice money, Price money, Summa money,
													BezTseni nvarchar(1), ObjectId int)
													
	declare @i int	
	set @i=0
													
-- не вставлять вложенные, если LABSERV [#4733]
	insert into @itable
		(MasterID, GUID, Creator, CreateDate, PaymentType, PaymentCode, ServiceName, Service, Quant, 
			ServOrMat,Done,Resource, ParentId, RParentId, [feepercent], [Cost], [Fee], Kateg, BasePrice, Price, Summa, BezTseni, ObjectId)
	select i.MasterId, replace(NewId(),'-',''), i.Creator, i.CreateDate, i.PaymentType, i.PaymentCode, LEFT('  '+pss.ServiceName, 255),
					pss.Service, pss.Quant*i.Quant, pss.ServOrMat, i.Done,
					isNull(pss.KtoOkazyvaet, -- [#6287] во вложенных услугах может быть проставлено "кем оказывается" 
					isNull((select top 1 ps2.KtoOkazyvaet from PaidService ps2 where ps2.Code=pss.Service),i.Resource)
					), 
					null, i.id,
					pss.[feepercent], pss.[Cost], pss.[Fee], K.Name, pss.Price, pss.Price, pss.Price*pss.Quant, pss.BezTseni, pss.ObjectId
	from inserted i left join deleted d on i.id=d.id
				left join paidservice ps on ps.code=i.Service and i.ServOrMat='Услуга' and ps.nodetype<>'LABSERV',
				paidsubservice pss left join Kategoriya K on K.id=pss.Kateg
	where ((d.id is null) or (d.id is not null and (IsNull(i.Service,'')<>IsNull(d.Service,'') and i.PaymentType<>1 and i.PaymentType<5)))
				and pss.MasterId=ps.id
	
	while @@ROWCOUNT>0 and @i<10
	begin
		set @i=@i+1
		insert into @itable
			(MasterID, GUID, Creator, CreateDate, PaymentType, PaymentCode, ServiceName, Service, Quant, 
				ServOrMat,Done,Resource, ParentId, [feepercent], [Cost], [Fee], Kateg, BezTseni, ObjectId)
		select i.MasterId, replace(NewId(),'-',''), i.Creator, i.CreateDate, i.PaymentType, i.PaymentCode, replicate(' ',2*@i+2)+pss.ServiceName,
						pss.Service, pss.Quant*i.Quant, pss.ServOrMat, i.Done, 
						isNull(pss.KtoOkazyvaet, -- [#6287] во вложенных услугах может быть проставлено "кем оказывается" 
						isNull((select top 1 ps2.KtoOkazyvaet from PaidService ps2 where ps2.Code=pss.Service),i.Resource)
						), 
						i.id, pss.[feepercent], pss.[Cost], pss.[Fee], K.name, pss.Kateg,
						pss.BezTseni
		from @itable i left join paidservice ps on ps.code=i.Service and i.ServOrMat='Услуга' and ps.nodetype<>'LABSERV',
					paidsubservice pss left join Kategoriya k on  k.id=pss.Kateg
		where pss.MasterId=ps.id and pss.Service not in (select Service from @itable where MasterId=i.MasterId and ParentId=i.Id)
	end

-- поправить вложения типа LABSERV во временной табл @itable [#4733]
	declare @t table (ID int,ServiceName nvarchar(255),Service nvarchar(50),ServOrMat nvarchar(50),ObjectId int)

	insert into @t

	SELECT i.ID, pss.ServiceName,pss.Service,pss.ServOrMat,pss.ObjectId
	FROM @itable i
	LEFT JOIN paidservice ps on ps.code=i.service
	LEFT JOIN paidsubservice pss on pss.masterid=ps.id
	where ps.nodetype='LABSERV'

	IF (SELECT count(id) from @t)>0
	BEGIN
		UPDATE @itable
		SET ServiceName = t1.ServiceName
			,Service = t1.Service
			,ServOrMat = t1.ServOrMat
			,ObjectId = t1.ObjectId
		FROM @itable a
		INNER JOIN @t t1 ON a.id = t1.id
	END

				
	declare @maxid int
	
	select @maxid=IsNull(max(id),0) from AppointmentService
	
	--прибитие цен у вложенных услуг, у которых есть цена в главной услуге
	update @itable set Price=0, BasePrice=0, Summa=0
	from @itable i join Appointmentservice pi on pi.id=i.RparentID and pi.Price>0

	insert into AppointmentService
		(ID, MasterID, GUID, Creator, CreateDate, PaymentType, PaymentCode, ServiceName, Service, Quant,
			ServOrMat,Done,Resource, ParentId, [feepercent], [Cost], [Fee], Kateg, BasePrice, Price, Summa, BezTseni, ObjectId)
		select ID+@maxid, MasterID, GUID, Creator, CreateDate, PaymentType, PaymentCode, ServiceName, Service, Quant,
			ServOrMat,Done,Resource, IsNull(RParentId,ParentId+@maxId), [feepercent], [Cost], [Fee], Kateg, 
			BasePrice, Price, Summa, BezTseni, ObjectId
		from @itable i


-- Поправить корневой LABSERV [#4733]
--declare @t table (ID int,ServiceName nvarchar(255),Service nvarchar(50),ServOrMat nvarchar(50),ServiceMeasure nvarchar(50),Duration int,ObjectId int)
	delete from @t

	insert into @t

	SELECT i.ID, pss.ServiceName,pss.Service,pss.ServOrMat,pss.ObjectId
	FROM inserted i
	LEFT JOIN paidservice ps on ps.code=i.service
	LEFT JOIN paidsubservice pss on pss.masterid=ps.id
	where ps.nodetype='LABSERV'

	IF (SELECT count(id) from @t)>0
	BEGIN
		UPDATE    appointmentService
		SET ServiceName = t1.ServiceName
			,Service = t1.Service
			,ServOrMat = t1.ServOrMat
			,ObjectId = t1.ObjectId
		FROM appointmentService a
		INNER JOIN @t t1 ON a.id = t1.id
	END

		
	declare @utable table(id int, Done bit, Resource int, OldResource int)
	
	insert into @utable
	select aps.id, i.Done, case when i.Resource=d.Resource then i.Resource when i.Done=1 then IsNull(aps.Resource,i.Resource) end, aps.Resource
	from inserted i, deleted d, AppointmentService aps
	where i.id=d.id and i.Done<>d.Done
				and i.id=aps.ParentId

	while @@ROWCOUNT>0
	begin
		insert into @utable
		select aps.id, u.Done, case when u.Resource=u.OldResource then u.Resource when u.Done=1 then IsNull(aps.Resource,u.Resource) end,
						case when u.Resource=u.OldResource then u.OldResource end
		from @utable u, AppointmentService aps
		where u.Done<>aps.Done
				and u.id=aps.ParentId	and aps.id not in (select id from @utable)
	end	
	
	update AppointmentService
	set Done=u.Done--, Resource=case when u.Done=1 then IsNull(AppointmentService.Resource, u.Resource) else AppointmentService.Resource end
	from @utable u
	where u.id=AppointmentService.Id

end


GO

CREATE TRIGGER [dbo].[AppointmentService_Change_ToBillService] 
ON [dbo].[AppointmentService] 
After Insert, Update, DELETE
AS
begin
	set nocount on
	
--	update BillService
--	set QuantReal=IsNull(QuantReal,0)
--				+(select IsNull(sum(i.Quant),0) from inserted i where i.Guid=BillService.Guid and i.Done=1)
--				-(select IsNull(sum(d.Quant),0) from deleted d where d.Guid=BillService.Guid and d.Done=1)
--	where Guid in (select GUID from inserted union select GUID from deleted)
	
	declare @guid nvarchar(32)
	declare @change integer
	declare @rec integer
	set @guid=isNull((select top 1 GUID from (select GUID from inserted union all select GUID from deleted) t order by GUID),'')
	while @guid<>''
	begin
		set @change=isNull((select sum(isNull(Quant,0)) from AppointmentService where guid=@guid and Done=1),0)
					-isNull((select sum(isNull(QuantReal,0)) from BillService where guid=@guid),0)
		while @change<>0
		begin
			set @rec=(case when @change>0 then 
				(isNull((select top 1 ID from BillService where guid=@guid and isNull(QuantReal,0)<Quant order by id),
					(select top 1 ID from BillService where guid=@guid order by id)))
				when @change<0 then
				(coalesce((select top 1 ID from BillService where guid=@guid and isNull(QuantReal,0)>Quant order by id desc),
					(select top 1 ID from BillService where guid=@guid and QuantReal=Quant and isNull(QuantReal,0)>0 order by id desc),
					(select top 1 ID from BillService where guid=@guid and isNull(QuantReal,0)>0 order by id desc)))
				else -1 end)
			update BillService
			set QuantReal=IsNull(QuantReal,0)
				+(case when @change<0 then -1 else 1 end) where id=isNull(@rec,-1)
			set @change=@change+(case when isNull(@rec,-1)=-1 then -@change 
				when @change<0 then 1 else -1 end)
		end
		set @guid=isNull((select top 1 GUID from (select GUID from inserted union all select GUID from deleted) t where GUID>@guid order by GUID),'')
	end
end
