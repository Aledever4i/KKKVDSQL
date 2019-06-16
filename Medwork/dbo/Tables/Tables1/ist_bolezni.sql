CREATE TABLE [dbo].[ist_bolezni] (
    [ID]      INT           NOT NULL,
    [PatID]   INT           NULL,
    [n_ib]    NVARCHAR (50) NULL,
    [DateIn]  DATETIME      NULL,
    [DateOut] DATETIME      NULL,
    CONSTRAINT [ist_bolezniPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ist_bolezniToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

