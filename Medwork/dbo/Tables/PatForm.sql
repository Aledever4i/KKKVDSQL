CREATE TABLE [dbo].[PatForm] (
    [PatID]       INT           CONSTRAINT [DF__PatForm__PatID__4460231C] DEFAULT (0) NULL,
    [FormID]      SMALLINT      CONSTRAINT [DF__PatForm__FormID__45544755] DEFAULT (0) NULL,
    [FormNo]      SMALLINT      CONSTRAINT [DF__PatForm__FormNo__46486B8E] DEFAULT (0) NOT NULL,
    [AuthorID]    SMALLINT      CONSTRAINT [DF__PatForm__AuthorI__473C8FC7] DEFAULT (0) NULL,
    [CreateTime]  DATETIME      NULL,
    [UpdateTime]  DATETIME      NULL,
    [Security]    SMALLINT      CONSTRAINT [DF__PatForm__Securit__4830B400] DEFAULT (0) NULL,
    [ID]          INT           NOT NULL,
    [ParentID]    INT           NULL,
    [DisplayName] VARCHAR (255) NULL,
    [Notes]       VARCHAR (255) NULL,
    [CreatorId]   INT           NULL,
    [Canceled]    BIT           DEFAULT ((0)) NOT NULL,
    [LockedByID]  INT           NULL,
    [NodeType]    NVARCHAR (20) NULL,
    [LibGUID]     NVARCHAR (32) NULL,
    [GUID]        NVARCHAR (32) NULL,
    [FormGUID]    NVARCHAR (32) NULL,
    [FormDate]    DATETIME      NULL,
    [StatTalon]   INT           NULL,
    CONSTRAINT [aaaaaPatForm_PK] PRIMARY KEY NONCLUSTERED ([ID] ASC),
    CONSTRAINT [PatForm_FK00] FOREIGN KEY ([PatID]) REFERENCES [dbo].[Patient] ([ID])
);


GO
CREATE CLUSTERED INDEX [_dta20140413_index_PatForm_c_7_1077787097__K8_K13]
    ON [dbo].[PatForm]([ID] ASC, [Canceled] ASC);


GO
CREATE NONCLUSTERED INDEX [PatFormToPatient]
    ON [dbo].[PatForm]([PatID] ASC);


GO
CREATE NONCLUSTERED INDEX [UpdateTime]
    ON [dbo].[PatForm]([UpdateTime] ASC);


GO
CREATE NONCLUSTERED INDEX [UserID]
    ON [dbo].[PatForm]([AuthorID] ASC);


GO
CREATE NONCLUSTERED INDEX [idxPatFormCreateTime]
    ON [dbo].[PatForm]([CreateTime] ASC);


GO
CREATE NONCLUSTERED INDEX [FormId]
    ON [dbo].[PatForm]([FormID] ASC);


GO
CREATE STATISTICS [_dta20140413_stat_1077787097_8_13]
    ON [dbo].[PatForm]([ID], [Canceled]);


GO

CREATE TRIGGER [dbo].[tg_patform_after_delete]
ON [dbo].[PatForm]
AFTER DELETE
AS
BEGIN
 set nocount on
 declare @z int
 select @z=count(1) from dbo.PatForm where ParentID IN (select ID from deleted)
 if @z>0
  begin
   RAISERROR ('Can`t delete item without deleting children.', 16, 10)
   ROLLBACK TRANSACTION
  end
 else
 begin
  UPDATE dbo.BillService SET PatFormID = NULL
  where PatFormID in (select ID from DELETED)
  UPDATE dbo.AppointmentService SET PatFormId = NULL
  where PatFormId in (select ID from DELETED)
 end  
END


