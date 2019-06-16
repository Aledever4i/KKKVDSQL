CREATE TABLE [dbo].[DnevnoyStacionar] (
    [ID]        INT            NOT NULL,
    [PatID]     INT            NULL,
    [DiagCode]  NVARCHAR (6)   NULL,
    [beg_date]  DATETIME       NULL,
    [end_date]  DATETIME       NULL,
    [UKL]       NVARCHAR (100) NULL,
    [KemNapr]   NVARCHAR (200) NULL,
    [NomNapr]   NVARCHAR (20)  NULL,
    [NomCardDS] INT            NULL,
    [LVN]       NVARCHAR (100) NULL,
    CONSTRAINT [DnevnoyStacionarPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DnevnoyStacionarToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

