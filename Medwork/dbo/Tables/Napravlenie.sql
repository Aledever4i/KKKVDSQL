CREATE TABLE [dbo].[Napravlenie] (
    [ID]               INT            NOT NULL,
    [PatID]            INT            NULL,
    [DataNapravleniya] DATETIME       NULL,
    [DataPriema]       DATETIME       NULL,
    [VremyaPriema]     DATETIME       NULL,
    [Prishel]          BIT            NULL,
    [Registrator]      INT            NULL,
    [Primechanie]      NTEXT          NULL,
    [TselVizita]       NVARCHAR (50)  NULL,
    [Zapisan]          INT            NULL,
    [LastUpdated]      NVARCHAR (50)  NULL,
    [MestoPriema]      NVARCHAR (50)  NULL,
    [TipPriema]        NVARCHAR (50)  NULL,
    [AddCall]          BIT            NULL,
    [AddCallInterval]  INT            NULL,
    [Duration]         INT            NULL,
    [Reserved]         BIT            NULL,
    [NapravlenieNomer] INT            NULL,
    [Resource]         INT            NULL,
    [Title]            NVARCHAR (50)  NULL,
    [PaymentType]      INT            NULL,
    [PaymentCode]      INT            NULL,
    [Vrach]            INT            NULL,
    [Kabinet]          NVARCHAR (100) NULL,
    [Color]            INT            NULL,
    [ColorTemp]        INT            NULL,
    [DiagCode]         NVARCHAR (7)   NULL,
    [PriceType]        INT            NULL,
    [AttProgram]       INT            NULL,
    [Type]             INT            NULL,
    [Waiting]          BIT            NULL,
    [DurationTemp]     INT            NULL,
    [HighlightColor]   INT            NULL,
    [DeptID]           INT            NULL,
    [ZapisMedihostID]  INT            NULL,
    [NomerZuba]        NVARCHAR (50)  NULL,
    [PrimechanieDiag]  NVARCHAR (100) NULL,
    [OsmotrFormID]     INT            NULL,
    [FinanceSourceId]  INT            NULL,
    [NaprNum]          INT            NULL,
    [NaprDate]         DATETIME       NULL,
    [MOnapr]           INT            NULL,
    [IsNapr]           NVARCHAR (50)  NULL,
    [TestEditBox]      NVARCHAR (50)  NULL,
    CONSTRAINT [PK_Napravlenie] PRIMARY KEY NONCLUSTERED ([ID] ASC),
    CONSTRAINT [NapravlenieToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE CLUSTERED INDEX [Napravlenie_DataVremya]
    ON [dbo].[Napravlenie]([DataPriema] DESC, [VremyaPriema] DESC, [PatID] ASC);


GO
CREATE NONCLUSTERED INDEX [NapravlenieDateIdx]
    ON [dbo].[Napravlenie]([DataPriema] ASC);


GO
CREATE NONCLUSTERED INDEX [NapravleniePatIDIdx]
    ON [dbo].[Napravlenie]([PatID] ASC);


GO
CREATE NONCLUSTERED INDEX [idxNapravlenie_DataPriema]
    ON [dbo].[Napravlenie]([DataPriema] ASC);


GO

Create Trigger tgNapravlenie_InsertUpdate
	On Napravlenie
	For Update, Insert
	AS
begin
	set nocount on
	--Было
	update Napravlenie
	set 
	  Vrach = 0
	where 
	  Vrach is NULL and 
	  ID in (select ID from inserted)

	--Добавление новых записей в таблицу вызовов на дом
	Insert Into VizovNaDom
		select ISNULL(((select max(id) from VizovNaDom)+(select count(*) from inserted as b where b.id>=a.id)),1) as id,
			Null as MasterID, Patient.CardNum as CardNum, a.TselVizita as Povod,
			a.TipPriema as CallType, a.DataPriema as MakeDate, Null as CallHour,
			Null as Diagnoz, a.Resource as RunDoctor, Null as DoneHelp, DatePart(hour, a.VremyaPriema) as RunHour,
			a.DataNapravleniya as Дата, DateDiff(year,Patient.BirthDate,GetDate()) as Age, a.Registrator as Автор,
			CAST(ISNULL(Patient.AdresGorod,'')+ISNULL(', р-н. '+Patient.AdresRaion,'')+ISNULL(', '+Patient.AdresUlitsa,'')+
				ISNULL(', д. '+Patient.Adres,'')+ISNULL(', корп. '+Patient.AdresKorpus,'')+
				ISNULL(', кв. '+Patient.AdresKvartira,'') as nvarchar(100)) as PatAddress,
			PatId as PatId,
			CAST(ISNULL('дом. '+Patient.DomTelefon,'')+
				ISNULL(' моб. '+Patient.MobTelefon,'')+
				ISNULL(' раб. '+Patient.RabTelefon,'') as nvarchar(50)) as PatPhone,
			Patient.LastName as LastName, Patient.FirstName as FirstName,
			Patient.SecondName as SecondName,
			a.id as IdNapr
		from inserted a, Patient
		where Patient.id=a.PatId and a.MestoPriema='на дому' and (a.id not in (select IdNapr from VizovNaDom where IdNapr is not null))
	--Обновление старых вызовов на дом
	Update VizovNaDom
		set 	Povod=a.TselVizita, MakeDate=a.DataPriema, RunDoctor=a.Resource,
			RunHour=DatePart(hour, a.VremyaPriema), Автор=a.Registrator,
			Дата=a.DataNapravleniya, CallType=a.TipPriema
		from inserted a, Patient
		where Patient.id=a.PatId and a.MestoPriema='на дому' and a.id=VizovNaDom.IdNapr

	--Удаление, тех у кого сменилось место приёма
		delete VizovNaDom Where IdNapr in (select id from inserted where MestoPriema<>'на дому')
end

GO

-- триггер доработан, что бы писал врача поставившего диагноз или автора, если врач не указан 4268
Create Trigger Napravlenie_InsertDiag
On Napravlenie
After Insert, Update
AS begin
	declare 	@SourceId int, 
	@date DateTime,
	@DoctorID int,
	@PatId int,
	@Diag nvarchar(7),
	@UserId int

	select top 1 @SourceId=i.id, @date=i.DataNapravleniya, @PatId=i.PatId, @Diag=i.DiagCode, @DoctorId=i.Resource, @UserId=p.AuthorId
	from inserted i left join patform p on i.id=p.id

	if @DoctorId = 0
		SET @DoctorId = @UserId
	
	if IsNull(@Diag,'')<>''
		exec AddZaklDiag 'Napravlenie',	@SourceId, @date,	@DoctorId, @PatId, 0,	0, @Diag,	@UserId
end

