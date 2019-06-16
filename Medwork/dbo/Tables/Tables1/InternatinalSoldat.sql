CREATE TABLE [dbo].[InternatinalSoldat] (
    [ID]                       INT            NOT NULL,
    [MasterID]                 INT            NULL,
    [PatId]                    NVARCHAR (50)  NULL,
    [CardNum]                  INT            NULL,
    [LastName]                 NVARCHAR (50)  NULL,
    [FirstName]                NVARCHAR (50)  NULL,
    [SecondName]               NVARCHAR (50)  NULL,
    [BirthDate]                DATETIME       NULL,
    [VisitCount]               NVARCHAR (100) NULL,
    [LastVisit]                DATETIME       NULL,
    [Anketirovanie]            NVARCHAR (3)   NULL,
    [Testirovanie]             NVARCHAR (3)   NULL,
    [MedikamentoznoeLechenie]  NVARCHAR (3)   NULL,
    [Diagnoz]                  NVARCHAR (100) NULL,
    [Дата]                     DATETIME       NULL,
    [Автор]                    INT            NULL,
    [ProvedennieMeropriyatiya] NTEXT          NULL,
    CONSTRAINT [InternatinalSoldatPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

