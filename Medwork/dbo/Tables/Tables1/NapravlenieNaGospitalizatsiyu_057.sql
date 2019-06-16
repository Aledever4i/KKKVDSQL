CREATE TABLE [dbo].[NapravlenieNaGospitalizatsiyu_057] (
    [ID]           INT           NOT NULL,
    [PatID]        INT           NULL,
    [NapravDate]   DATETIME      NULL,
    [NapravTime]   DATETIME      NULL,
    [Ekstrenno]    NVARCHAR (1)  NULL,
    [Doctor]       INT           NULL,
    [Obosnovanie]  NTEXT         NULL,
    [OsnDiag]      NTEXT         NULL,
    [OsnDiagCode]  NVARCHAR (8)  NULL,
    [Hospital]     INT           NULL,
    [Goal]         NVARCHAR (50) NULL,
    [KodLgoti]     INT           NULL,
    [SopDiag]      NTEXT         NULL,
    [SopDiagCode]  NVARCHAR (8)  NULL,
    [NumNapravl]   NVARCHAR (24) NULL,
    [PlanDate]     DATETIME      NULL,
    [KProfileName] NVARCHAR (50) NULL,
    [KProfileKod]  INT           NULL,
    CONSTRAINT [NapravlenieNaGospitalizatsiyu_057PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [NapravlenieNaGospitalizatsiyu_057ToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

