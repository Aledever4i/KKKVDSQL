CREATE TABLE [dbo].[BMIS_preRecord] (
    [ID]                       INT            NOT NULL,
    [CreateTime]               DATETIME       NULL,
    [CreatedBy]                INT            NULL,
    [UpdateTime]               DATETIME       NULL,
    [UpdatedBy]                INT            NULL,
    [ImportFlag]               INT            NULL,
    [RecNo]                    INT            NULL,
    [DBFFile]                  NVARCHAR (50)  NULL,
    [DBFFolder]                NVARCHAR (50)  NULL,
    [PatID]                    INT            NULL,
    [LastName]                 NVARCHAR (20)  NULL,
    [FirstName]                NVARCHAR (20)  NULL,
    [SecondName]               NVARCHAR (20)  NULL,
    [BirthDate]                DATETIME       NULL,
    [Age]                      NVARCHAR (10)  NULL,
    [Sex]                      NVARCHAR (1)   NULL,
    [Region]                   NVARCHAR (50)  NULL,
    [Email]                    NVARCHAR (100) NULL,
    [Phone]                    NVARCHAR (50)  NULL,
    [PrerecordSource]          NVARCHAR (50)  NULL,
    [Place]                    NVARCHAR (15)  NULL,
    [DataPriema]               DATETIME       NULL,
    [VremyaPriema]             DATETIME       NULL,
    [Duration]                 INT            NULL,
    [Resource]                 INT            NULL,
    [Complaints]               NVARCHAR (50)  NULL,
    [Category]                 NVARCHAR (50)  NULL,
    [InitialReceptionDoctor]   INT            NULL,
    [Prinyat]                  BIT            NULL,
    [InitialReceptionDatetime] DATETIME       NULL,
    [PayKind]                  INT            NULL,
    [ExternalExaminationOD]    NTEXT          NULL,
    [ExternalExaminationOS]    NTEXT          NULL,
    [ConjunctivaOD]            NVARCHAR (50)  NULL,
    [RogovicaOD]               NVARCHAR (50)  NULL,
    [PerednyayaKameraOD]       NVARCHAR (50)  NULL,
    [RdujkaOD]                 NVARCHAR (50)  NULL,
    [HrustalikOD]              NVARCHAR (50)  NULL,
    [SteklovidnoeTeloOD]       NVARCHAR (50)  NULL,
    [DZNOD]                    NVARCHAR (50)  NULL,
    [MakulyarnayaOblastOD]     NVARCHAR (50)  NULL,
    [SetchatkaOD]              NVARCHAR (50)  NULL,
    [ConjunctivaOS]            NVARCHAR (50)  NULL,
    [RogovicaOS]               NVARCHAR (50)  NULL,
    [PerednyayaKameraOS]       NVARCHAR (50)  NULL,
    [RdujkaOS]                 NVARCHAR (50)  NULL,
    [HrustalikOS]              NVARCHAR (50)  NULL,
    [SteklovidnoeTeloOS]       NVARCHAR (50)  NULL,
    [DZNOS]                    NVARCHAR (50)  NULL,
    [MakulyarnayaOblastOS]     NVARCHAR (50)  NULL,
    [SetchatkaOS]              NVARCHAR (50)  NULL,
    [DiagOD]                   NVARCHAR (50)  NULL,
    [DiagOS]                   NVARCHAR (50)  NULL,
    [DeptID]                   INT            NULL,
    [Doctor]                   NVARCHAR (50)  NULL,
    [Notes]                    NTEXT          NULL,
    [TipPriema]                NVARCHAR (50)  NULL,
    [DiagODCode]               INT            NULL,
    [DiagOSCode]               INT            NULL,
    [IstochnikReklamy]         INT            NULL,
    [Canceled]                 BIT            NULL,
    CONSTRAINT [BMIS_preRecordPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idxBMIS_preRecordDataPriema]
    ON [dbo].[BMIS_preRecord]([DataPriema] ASC);


GO
CREATE NONCLUSTERED INDEX [idxBMIS_preRecordPatient]
    ON [dbo].[BMIS_preRecord]([LastName] ASC, [FirstName] ASC, [SecondName] ASC);


GO
CREATE NONCLUSTERED INDEX [idxBMIS_preRecordImport]
    ON [dbo].[BMIS_preRecord]([ImportFlag] ASC);


GO
CREATE TRIGGER BMIS_preRecord_AttachDelete ON BMIS_preRecord
 FOR DELETE AS
 DELETE _MedworkDocAttachments
 FROM 
 DELETED d
 where 
 _MedworkDocAttachments.PatFormID is null
 and _MedworkDocAttachments.LinkedTable = 'BMIS_preRecord'
 and d.ID = _MedworkDocAttachments.LinkedTableID
