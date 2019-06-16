CREATE TABLE [dbo].[LN_OtmenNieDati] (
    [ID]       INT      NOT NULL,
    [MasterID] INT      NULL,
    [Date]     DATETIME NULL,
    CONSTRAINT [LN_OtmenNieDatiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LN_OtmenNieDatiToLN_Naznacheniya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LN_Naznacheniya] ([ID]) ON DELETE CASCADE
);

