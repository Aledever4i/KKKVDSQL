CREATE TABLE [dbo].[Attachment] (
    [ID]                                  INT            NOT NULL,
    [MasterID]                            INT            NULL,
    [POLICY]                              NVARCHAR (100) NULL,
    [SECTOR]                              INT            NULL,
    [AttProgram]                          INT            NULL,
    [BEG_DATE]                            DATETIME       NULL,
    [END_DATE]                            DATETIME       NULL,
    [OFF]                                 INT            NULL,
    [AttType]                             INT            NULL,
    [CATEG]                               INT            NULL,
    [Dog]                                 INT            NULL,
    [Polyce_date]                         DATETIME       NULL,
    [Polyce_company]                      NVARCHAR (50)  NULL,
    [Prichina]                            INT            NULL,
    [ParentCardNum]                       NVARCHAR (50)  NULL,
    [ParentFullName]                      NVARCHAR (100) NULL,
    [ChildComment]                        NVARCHAR (50)  NULL,
    [SelectedPat]                         INT            NULL,
    [PlanEND_DATE]                        DATETIME       NULL,
    [DogNum]                              NVARCHAR (50)  NULL,
    [Docdate]                             DATETIME       NULL,
    [DogSum]                              MONEY          NULL,
    [DogFirstPaid]                        MONEY          NULL,
    [LetDate]                             DATETIME       NULL,
    [LetNum]                              NVARCHAR (50)  NULL,
    [LetDate2]                            DATETIME       NULL,
    [LetNum2]                             NVARCHAR (50)  NULL,
    [LetDate3]                            DATETIME       NULL,
    [LetNum3]                             NVARCHAR (50)  NULL,
    [LetResult]                           NVARCHAR (250) NULL,
    [ProgrammiDlyaKonkretnoyOrganizatsii] NVARCHAR (1)   NULL,
    [BonusPercent]                        FLOAT (53)     NULL,
    [Updatetime]                          DATETIME       NULL,
    [TFOMS]                               NVARCHAR (10)  NULL,
    [AgentPercent]                        FLOAT (53)     NULL,
    [AgentCombo]                          INT            NULL,
    CONSTRAINT [AttachmentPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AttachmentToPatient] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Patient] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Attachment_InsuranceProgram] FOREIGN KEY ([AttProgram]) REFERENCES [dbo].[InsuranceProgram] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [idxAttachment_Categ_AttType]
    ON [dbo].[Attachment]([CATEG] ASC, [AttType] ASC);


GO
CREATE NONCLUSTERED INDEX [idxAttachment_AttType]
    ON [dbo].[Attachment]([AttType] ASC);


GO
CREATE NONCLUSTERED INDEX [idxMasterIdAttType]
    ON [dbo].[Attachment]([MasterID] ASC, [AttType] ASC, [BEG_DATE] ASC, [END_DATE] ASC);


GO
CREATE NONCLUSTERED INDEX [idxAttachment_UpdateTime]
    ON [dbo].[Attachment]([Updatetime] ASC);


GO
CREATE NONCLUSTERED INDEX [idxAttachmentSelectedPat]
    ON [dbo].[Attachment]([SelectedPat] ASC);


GO
CREATE NONCLUSTERED INDEX [idxMasterIdAttProgram]
    ON [dbo].[Attachment]([MasterID] ASC, [AttProgram] ASC);


GO

CREATE TRIGGER [dbo].[CHANGEATTACHMENT_TRACKING] 
ON [dbo].[Attachment] 
AFTER UPDATE
AS
set nocount on
UPDATE Patient
SET DateOfLastChange  =  GETDATE(), b_karta_aktualna=0 
	WHERE ID IN (SELECT i.MASTERID FROM INSERTED i left join deleted a on a.id=i.id where (IsNull(a.Policy,'')<>IsNull(i.Policy,'')
		or IsNull(a.[off],-1)<>IsNull(i.[off],-1)	or IsNull(a.beg_date,GetDate())<>IsNull(i.beg_date,GetDate())
		or IsNull(a.end_date,GetDate())<>IsNull(i.end_date,GetDate())	or IsNull(a.AttProgram,-1)<>IsNull(i.AttProgram,-1)))

GO

Create Trigger Attachment_ChangeCardLocation
On Attachment
After Insert, Update
AS begin
	set nocount on
	declare @t table (id int identity(1,1), Patid int, Location nvarchar(100), SDate datetime)
	insert into @t
		(Patid, Location, SDate)
		select i.MasterId, dbo.fnPatCardLocation(i.MasterId), p.SectionSDate
		from inserted i, patient p
		where p.id=i.MasterId and dbo.fnPatCardLocation(i.MasterId) is not null
		
	declare @CurrDate datetime
	set @CurrDate=convert(datetime,convert(nvarchar,GetDate(),102),102)
	delete from CardLocation where id in
		(
		select CardLocation.id
		from CardLocation, @t as t, CardLocation cl2
		where
			t.PatId=CardLocation.MasterId
			and (CardLocation.CurrentLocation<>1 or CardLocation.CurrentLocation is null)
			and IsNull(t.SDate, @CurrDate)<=CardLocation.SDate
			and t.Location=CardLocation.Location
			and cl2.MasterId=CardLocation.MasterId
			and cl2.SDate<CardLocation.Sdate
		)
	delete from CardLocation where id in
		(
		select CardLocation.id
		from CardLocation, @t as t
		where
			t.PatId=CardLocation.MasterId
			and (CardLocation.CurrentLocation<>1 or CardLocation.CurrentLocation is null)
			and IsNull(t.SDate, @CurrDate)<=CardLocation.SDate
			and t.Location<>CardLocation.Location
		)
	update CardLocation
		set SDate= null
		from @t as t
		where
			t.PatId=CardLocation.MasterId
			and CardLocation.CurrentLocation=1
			and t.SDate<=CardLocation.SDate
			and t.Location=CardLocation.Location
	update CardLocation
		set SDate= IsNull(IsNull(t.Sdate, CardLocation.SDate), @CurrDate)
		from @t as t
		where
			t.PatId=CardLocation.MasterId
			and t.Location=CardLocation.Location
			and CardLocation.SDate=
			(
				select max(SDate)
				from CardLocation cl2
				where cl2.MasterId=CardLocation.MasterId
			)
	delete from @t
		where id in
		(
			select t.id
			from @t as t, CardLocation
			where t.PatId=CardLocation.MasterId and t.Location=CardLocation.Location and CardLocation.SDate=
			(
				select max(SDate)
				from CardLocation cl2
				where cl2.MasterId=CardLocation.MasterId
			)
		)
	insert into CardLocation
		(id, MasterId, Location, SDate)
		select id+IsNull((select max(id) from CardLocation),1), Patid, Location, IsNull(SDate,@CurrDate)
		from @t

end

GO

CREATE TRIGGER [dbo].[Attachment_AttachDelete] ON [dbo].[Attachment]
FOR DELETE AS
Begin
	set nocount on
	declare @c int
	select @c=Count(*)
	from deleted d, Napravlenie n
	where d.id=n.PaymentCode
	if @c<=0 
		select @c=Count(*) from deleted d, bill b
		where d.id=b.PaymentCode
	if @c<=0 
		select @c=Count(*) from deleted d, ui_service u
		where d.id=u.PaymentCode
	if @c>0
	begin
		raiserror('INFORMATION: Нельзя удалить прикрепление по которому были созданы направления на прием, счет(договор) или статистические документы',16,1)
		rollback transaction
	end
	else
		DELETE _MedworkDocAttachments
		FROM DELETED d
		where _MedworkDocAttachments.PatFormID is null
		and _MedworkDocAttachments.LinkedTable = 'Attachment'
		and d.ID = _MedworkDocAttachments.LinkedTableID
End

