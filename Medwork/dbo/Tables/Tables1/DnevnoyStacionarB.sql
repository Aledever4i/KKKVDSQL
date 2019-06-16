CREATE TABLE [dbo].[DnevnoyStacionarB] (
    [ID]        INT            NOT NULL,
    [PatID]     INT            NULL,
    [DiagCode]  NVARCHAR (6)   NULL,
    [beg_date]  DATETIME       NULL,
    [end_date]  DATETIME       NULL,
    [UKL]       NVARCHAR (100) NULL,
    [LVN]       NVARCHAR (100) NULL,
    [KemNapr]   NVARCHAR (200) NULL,
    [NomNapr]   NVARCHAR (20)  NULL,
    [NomCardDS] INT            NULL,
    CONSTRAINT [DnevnoyStacionarBPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DnevnoyStacionarBToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

