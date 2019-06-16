CREATE TABLE [dbo].[LN_DobavlenieDati] (
    [ID]       INT      NOT NULL,
    [MasterID] INT      NULL,
    [Date]     DATETIME NULL,
    CONSTRAINT [LN_DobavlenieDatiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LN_DobavlenieDatiToLN_Naznacheniya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LN_Naznacheniya] ([ID]) ON DELETE CASCADE
);

