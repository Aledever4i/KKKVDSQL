CREATE TABLE [dbo].[BillService] (
    [ID]             INT            NOT NULL,
    [MasterID]       INT            NULL,
    [ServiceName]    NVARCHAR (600) NULL,
    [Service]        NVARCHAR (50)  NULL,
    [Quant]          INT            NULL,
    [Price]          MONEY          NULL,
    [Summa]          MONEY          NULL,
    [GUID]           NVARCHAR (32)  NULL,
    [Creator]        INT            NULL,
    [CreateDate]     DATETIME       NULL,
    [PaymentType]    INT            NULL,
    [PaymentCode]    INT            NULL,
    [ServiceMeasure] NVARCHAR (50)  NULL,
    [ServOrMat]      NVARCHAR (50)  NULL,
    [Comment]        NVARCHAR (255) NULL,
    [FakeService]    NVARCHAR (50)  NULL,
    [SkidkaV]        FLOAT (53)     NULL,
    [Resource]       INT            NULL,
    [Done]           BIT            NULL,
    [ParentId]       INT            NULL,
    [QuantReal]      INT            NULL,
    [CmdPositionID]  INT            NULL,
    [feepercent]     FLOAT (53)     NULL,
    [Cost]           MONEY          NULL,
    [Fee]            MONEY          NULL,
    [BasePrice]      MONEY          NULL,
    [kateg]          NVARCHAR (100) NULL,
    [ObjectId]       INT            NULL,
    [BezTseni]       NVARCHAR (1)   NULL,
    [PaymentID]      INT            NULL,
    [PatFormID]      INT            NULL,
    [Updatetime]     DATETIME       NULL,
    [PatStatus]      INT            NULL,
    [DATUSL]         DATETIME       NULL,
    [DATOTCH]        DATETIME       NULL,
    [KODOPER]        INT            NULL,
    [KODBRIG]        NVARCHAR (2)   NULL,
    [KODREL]         NVARCHAR (13)  NULL,
    [KODISP]         INT            NULL,
    [RecNoDiag]      INT            NULL,
    [RecNoOLK]       INT            NULL,
    [ExportTimeDiag] DATETIME       NULL,
    [ExportTimeOLK]  DATETIME       NULL,
    [EYE]            NVARCHAR (1)   NULL,
    [Medsestra]      INT            NULL,
    [Resource_napr]  INT            NULL,
    [Resource_zabor] INT            NULL,
    [Zabor]          NVARCHAR (1)   NULL,
    [Mazok]          NVARCHAR (1)   NULL,
    [Resource_mazok] INT            NULL,
    CONSTRAINT [BillServicePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BillServiceToBill] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Bill] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [BillServiceMasterIDIdx]
    ON [dbo].[BillService]([MasterID] ASC);


GO
CREATE NONCLUSTERED INDEX [BillServiceGUIDIdx]
    ON [dbo].[BillService]([GUID] ASC);


GO
CREATE NONCLUSTERED INDEX [BillServiceParentIDIdx]
    ON [dbo].[BillService]([ParentId] ASC);


GO
CREATE NONCLUSTERED INDEX [BillServicePaymentIDIdx]
    ON [dbo].[BillService]([PaymentID] ASC);


GO
CREATE NONCLUSTERED INDEX [BillServiceRecNoDiagIdx]
    ON [dbo].[BillService]([RecNoDiag] ASC)
    INCLUDE([ID]);


GO
CREATE NONCLUSTERED INDEX [BillServiceDatUslIdx]
    ON [dbo].[BillService]([DATUSL] ASC)
    INCLUDE([ID]);


GO
CREATE NONCLUSTERED INDEX [_dta20140413_index_BillService_7_1575220912__K3_K17_K18_K6_K9_K1_4_5_7_27_28]
    ON [dbo].[BillService]([MasterID] ASC, [PaymentType] ASC, [PaymentCode] ASC, [Quant] ASC, [GUID] ASC, [ID] ASC)
    INCLUDE([ServiceName], [Service], [Price], [ParentId], [QuantReal]);


GO
CREATE NONCLUSTERED INDEX [_dta20140413_index_BillService_7_1575220912__K9_K1_3_6_7_28_37]
    ON [dbo].[BillService]([GUID] ASC, [ID] ASC)
    INCLUDE([MasterID], [Quant], [Price], [QuantReal], [PaymentID]);


GO
CREATE NONCLUSTERED INDEX [BillServicePatFormIDIdx]
    ON [dbo].[BillService]([PatFormID] ASC);


GO
CREATE STATISTICS [_dta20140413_stat_1575220912_6_3]
    ON [dbo].[BillService]([Quant], [MasterID]);


GO
CREATE STATISTICS [_dta20140413_stat_1575220912_17_3_6]
    ON [dbo].[BillService]([PaymentType], [MasterID], [Quant]);


GO
CREATE STATISTICS [_dta20140413_stat_1575220912_9_3_17_18]
    ON [dbo].[BillService]([GUID], [MasterID], [PaymentType], [PaymentCode]);


GO
CREATE STATISTICS [_dta20140413_stat_1575220912_3_9_6_17]
    ON [dbo].[BillService]([MasterID], [GUID], [Quant], [PaymentType]);


GO
CREATE STATISTICS [_dta20140413_stat_1575220912_1_3_17_18_6]
    ON [dbo].[BillService]([ID], [MasterID], [PaymentType], [PaymentCode], [Quant]);


GO
CREATE STATISTICS [_dta20140413_stat_1575220912_18_3_6_17_9_1]
    ON [dbo].[BillService]([PaymentCode], [MasterID], [Quant], [PaymentType], [GUID], [ID]);


GO

CREATE Trigger [dbo].[BillService_Change]
On [dbo].[BillService]
After Insert, Update, Delete
AS begin
	set nocount on

	if (select count(*) from inserted i left join deleted d on i.ID=d.ID
			where d.ID is null and i.ParentId is not null)>0
		return
	
	declare @dtable table (ID int)
	
	insert into @dtable
	select d.ID
	from inserted i right join deleted d on i.ID=d.ID
	where (i.ID is null) or (i.ID is not null and (IsNull(i.Service,'')<>IsNull(d.Service,'') or IsNull(i.ServOrMat,'')<>IsNull(d.ServOrMat,'')))

	while @@ROWCOUNT>0
	begin			
		insert into @dtable
		select aps.ID from dbo.BillService aps, @dtable dt
			where
				dt.ID = aps.ParentId
				and aps.ID not in (select ID from @dtable)
	end
	
	delete from dbo.BillService
		where ParentId in
			(select ID
			from @dtable
			)
			
	declare @utable2 table(ID int, Quant int, QuantNew int)	
	
	insert into @utable2
	select aps.ID, d.Quant, i.Quant
	from inserted i, deleted d, dbo.BillService aps
	where i.ID=d.ID and i.Quant<>d.Quant
				and i.ID=aps.ParentId

	while @@ROWCOUNT>0
	begin
		insert into @utable2
		select aps.ID, aps.Quant, case when u.Quant=0 then aps.Quant else aps.Quant*u.QuantNew/u.Quant end
		from @utable2 u, dbo.BillService aps
		where u.ID=aps.ParentId	and aps.ID not in (select ID from @utable2)
	end	
	
	update dbo.BillService
	set Quant=u.QuantNew,
			Summa=Price*u.QuantNew,
			FakeService = null
	from @utable2 u
	where u.ID=BillService.ID
	
	declare @itable table (ID int identity (1,1), MasterID int, GUID nvarchar(32), Creator int, CreateDate datetime,
												 PaymentType int, PaymentCode int, ServiceName nvarchar(255), Service nvarchar(50), Quant int, 
												 ServOrMat nvarchar (50), Resource int, ParentId int, RParentId int, QuantReal int,
												 [feepercent] FLOAT, [Cost] MONEY, [Fee] MONEY, Kateg nvarchar(32),
												 BasePrice money, Price money, Summa money, BezTseni nvarchar(1), ObjectId int, FakeService int)
													
	declare @i int	
	set @i=0

  -- если i.FakeService = 1, то услуги из направления, в этом случае подуслуги здесь не вставлять
-- не вставлять вложенные, если LABSERV [#4733]
	insert into @itable
		(MasterID, GUID, Creator, CreateDate, PaymentType, PaymentCode, ServiceName, Service, Quant, 
			ServOrMat,Resource, ParentId, RParentId, QuantReal, [feepercent], [Cost], [Fee], Kateg, BasePrice, Price, Summa,
			BezTseni, ObjectId, FakeService)
	select i.MasterID, replace(NewId(),'-',''), i.Creator, i.CreateDate, i.PaymentType, i.PaymentCode, LEFT('  '+pss.ServiceName, 255),
					pss.Service, pss.Quant*i.Quant, pss.ServOrMat, 
					isNull(pss.KtoOkazyvaet, -- [#6287] во вложенных услугах может быть проставлено "кем оказывается" 
					isNull((select top 1 ps2.KtoOkazyvaet from PaidService ps2 where ps2.Code=pss.Service),i.Resource)
					),
					null, i.ID, i.QuantReal*pss.Quant,
					pss.[feepercent], pss.[Cost], pss.[Fee],K.Name, pss.Price, pss.Price, pss.Price*pss.Quant, pss.BezTseni, pss.ObjectID, null
	from inserted i left join deleted d on i.ID=d.ID
				left join dbo.PaidService ps on ps.Code = i.Service and i.ServOrMat='Услуга' and ps.NodeType <> 'LABSERV',
				dbo.PaidSubService pss left join Kategoriya K on K.ID=pss.Kateg
	where ((d.ID is null) or (d.ID is not null and (IsNull(i.Service,'')<>IsNull(d.Service,'') and  i.PaymentType<>1 and i.PaymentType<5)))
				and pss.MasterID=ps.ID and isnull(i.FakeService,0) <> 1

	while @@ROWCOUNT>0 and @i<10
	begin
		set @i=@i+1
		insert into @itable
			(MasterID, GUID, Creator, CreateDate, PaymentType, PaymentCode, ServiceName, Service, Quant, 
				ServOrMat,Resource, ParentId, QuantReal, [feepercent], [Cost], [Fee], Kateg, BezTseni, ObjectId, FakeService)
		select i.MasterID, replace(NewId(),'-',''), i.Creator, i.CreateDate, i.PaymentType, i.PaymentCode, replicate(' ',2*@i+2)+pss.ServiceName,
						pss.Service, pss.Quant*i.Quant, pss.ServOrMat, 
						isNull(pss.KtoOkazyvaet, -- [#6287] во вложенных услугах может быть проставлено "кем оказывается" 
						isNull((select top 1 ps2.KtoOkazyvaet from PaidService ps2 where ps2.Code=pss.Service),i.Resource)
						),
						i.ID, i.QuantReal*pss.Quant,
						pss.[feepercent], pss.[Cost], pss.[Fee], K.Name, pss.BezTseni, pss.ObjectID, null
		from @itable i left join dbo.PaidService ps on ps.Code = i.Service and i.ServOrMat='Услуга' and ps.NodeType <> 'LABSERV',
					dbo.PaidSubService pss left join Kategoriya K on K.ID=pss.Kateg
		where pss.MasterID=ps.ID and pss.Service not in (select Service from @itable where MasterID=i.MasterID and ParentId=i.ID)
	end
	
	
	-- поправить вложения типа LABSERV во временной табл @itable [#4733]
	declare @t table (ID int,ServiceName nvarchar(255),Service nvarchar(50),ServOrMat nvarchar(50),ObjectId int)

	insert into @t
	SELECT i.ID, pss.ServiceName,pss.Service,pss.ServOrMat,pss.ObjectID
	FROM @itable i
	LEFT JOIN dbo.PaidService ps on ps.Code = i.Service
	LEFT JOIN dbo.PaidSubService pss on pss.MasterID = ps.ID
	where ps.NodeType = 'LABSERV'

	IF (SELECT count(ID) from @t)>0
	BEGIN
		UPDATE    @itable
		SET ServiceName = t1.ServiceName
			,Service = t1.Service
			,ServOrMat = t1.ServOrMat
			,ObjectId = t1.ObjectId
		FROM @itable a
		INNER JOIN @t t1 ON a.ID = t1.ID
	END

	--прибитие цен у вложенных услуг, у которых есть цена в главной услуге
	update i set Price=0, BasePrice=0, Summa=0, FakeService = null
	from @itable i join dbo.BillService pi on pi.ID = i.RParentId and pi.Price>0

	declare @maxid int
	
	select @maxid=IsNull(max(ID),0) from BillService

	insert into BillService
		(ID, MasterID, GUID, Creator, CreateDate, PaymentType, PaymentCode, ServiceName, Service, Quant, 
			ServOrMat,Resource, ParentId, QuantReal, [feepercent], [Cost], [Fee], kateg, BasePrice, Price, Summa, BezTseni, ObjectId, FakeService)
		select ID+@maxid, MasterID, GUID, Creator, CreateDate, PaymentType, PaymentCode, ServiceName, Service, Quant, 
			ServOrMat,Resource, IsNull(RParentId,ParentId+@maxId), QuantReal, [feepercent], [Cost], [Fee], Kateg, BasePrice, Price, Summa,
			BezTseni, ObjectId, FakeService
		from @itable

	delete from @t

	insert into @t
  
	SELECT i.ID, pss.ServiceName,pss.Service,pss.ServOrMat,pss.ObjectID
	FROM inserted i
	LEFT JOIN dbo.PaidService ps on ps.Code = i.Service
	LEFT JOIN dbo.PaidSubService pss on pss.MasterID = ps.ID
	where ps.NodeType = 'LABSERV'

	IF (SELECT count(ID) from @t)>0
	BEGIN
  	UPDATE BillService
		SET ServiceName = t1.ServiceName
			,Service = t1.Service
			,ServOrMat = t1.ServOrMat
			,ObjectId = t1.ObjectId
		FROM BillService a
		INNER JOIN @t t1 ON a.ID = t1.ID
	END

end
