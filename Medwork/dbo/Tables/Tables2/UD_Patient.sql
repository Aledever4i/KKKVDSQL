CREATE TABLE [dbo].[UD_Patient] (
    [id]          INT      NOT NULL,
    [date]        DATETIME NULL,
    [DoctorID]    INT      NULL,
    [PatId]       INT      NULL,
    [isList]      INT      NULL,
    [isHome]      INT      NULL,
    [isObject]    INT      NULL,
    [isOrgonize]  INT      NULL,
    [VisitTime]   DATETIME NULL,
    [FirstTime]   INT      NULL,
    [Creator]     INT      NULL,
    [CreateDate]  DATETIME NULL,
    [Updater]     INT      NULL,
    [UpdateDate]  DATETIME NULL,
    [VisitType]   INT      NULL,
    [Treatment]   INT      NULL,
    [VisitResult] INT      NULL,
    [isNotVisit]  INT      DEFAULT (0) NULL,
    [AttId]       INT      NULL,
    [Dog]         INT      NULL,
    [Org]         INT      NULL,
    CONSTRAINT [PK__UD_Patient__6510172C] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [UD_Patient_1_idx]
    ON [dbo].[UD_Patient]([date] ASC, [DoctorID] ASC);


GO
CREATE NONCLUSTERED INDEX [idxUD_Patient_DoctorID]
    ON [dbo].[UD_Patient]([DoctorID] ASC);


GO
CREATE NONCLUSTERED INDEX [idxUD_Patient_isHome_isObject]
    ON [dbo].[UD_Patient]([isHome] ASC, [isObject] ASC);


GO
CREATE NONCLUSTERED INDEX [idxUD_Patient_isObject]
    ON [dbo].[UD_Patient]([isObject] ASC);


GO
CREATE NONCLUSTERED INDEX [idxUD_Patient_isList]
    ON [dbo].[UD_Patient]([isList] ASC);


GO
CREATE NONCLUSTERED INDEX [idxUD_Patient_Date]
    ON [dbo].[UD_Patient]([date] ASC);


GO
CREATE NONCLUSTERED INDEX [idxUD_Patient_PatId]
    ON [dbo].[UD_Patient]([PatId] ASC);


GO
CREATE NONCLUSTERED INDEX [UD_PatientPatIDIdx]
    ON [dbo].[UD_Patient]([PatId] ASC);


GO
CREATE NONCLUSTERED INDEX [UD_PatientDateIdx]
    ON [dbo].[UD_Patient]([date] ASC);


GO

Create Trigger UD_Patient_BD
On UD_Patient
For Delete
AS begin
	Delete From UI_Diag Where UI_Diag.pid in (select d.id from deleted d)
	Delete From PatForm Where id in (Select id From StatisticheskiyDokument Where UniDocId in (Select d.id From Deleted d))
end
