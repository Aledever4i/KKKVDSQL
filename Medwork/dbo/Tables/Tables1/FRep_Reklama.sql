CREATE TABLE [dbo].[FRep_Reklama] (
    [GUID]               UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]           INT              NULL,
    [ConnectionID]       INT              NULL,
    [PatID]              INT              NOT NULL,
    [PatGUID]            UNIQUEIDENTIFIER NOT NULL,
    [FirstName]          NVARCHAR (20)    NULL,
    [SecondName]         NVARCHAR (20)    NULL,
    [LastName]           NVARCHAR (20)    NULL,
    [Sex]                NVARCHAR (1)     NULL,
    [BirthDate]          DATETIME         NULL,
    [RegDate]            DATETIME         NULL,
    [CardNum]            NVARCHAR (50)    NULL,
    [MobTelefon]         NVARCHAR (50)    NULL,
    [IstochnikReklamy]   NVARCHAR (100)   NULL,
    [DeptName]           NVARCHAR (60)    NULL,
    [DeptID]             INT              NULL,
    [IstochnikReklamyID] INT              NULL,
    CONSTRAINT [FRep_ReklamaPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_ReklamaToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);

