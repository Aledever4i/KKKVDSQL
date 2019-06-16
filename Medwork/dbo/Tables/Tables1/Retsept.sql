CREATE TABLE [dbo].[Retsept] (
    [ID]              INT           NOT NULL,
    [PatID]           INT           NULL,
    [Data]            DATETIME      NULL,
    [NomRetc]         INT           NULL,
    [Vrach]           INT           NULL,
    [FormPrintSelect] NVARCHAR (50) NULL,
    [Index]           NVARCHAR (50) NULL,
    CONSTRAINT [RetseptPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RetseptToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

