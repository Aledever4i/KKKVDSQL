CREATE TABLE [dbo].[KampimetriyaTsentralnaya] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [Skotoma_OD] NVARCHAR (50) NULL,
    [Skotoma_OS] NVARCHAR (50) NULL,
    CONSTRAINT [KampimetriyaTsentralnayaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KampimetriyaTsentralnayaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

