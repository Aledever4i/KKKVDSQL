CREATE TABLE [dbo].[LN_ListNaznacheniy] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [SchemeName] NVARCHAR (50) NULL,
    [Vrach]      INT           NULL,
    CONSTRAINT [LN_ListNaznacheniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LN_ListNaznacheniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

