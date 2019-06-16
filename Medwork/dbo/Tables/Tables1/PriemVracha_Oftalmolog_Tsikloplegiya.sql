CREATE TABLE [dbo].[PriemVracha_Oftalmolog_Tsikloplegiya] (
    [ID]        INT           NOT NULL,
    [PatID]     INT           NULL,
    [Data]      DATETIME      NULL,
    [Vrach]     NVARCHAR (50) NULL,
    [Sfera]     INT           NULL,
    [Tsilindr]  INT           NULL,
    [Os]        INT           NULL,
    [Sfera1]    INT           NULL,
    [Tsilindr1] INT           NULL,
    [Os1]       INT           NULL,
    CONSTRAINT [PriemVracha_Oftalmolog_TsikloplegiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Oftalmolog_TsikloplegiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

