CREATE TABLE [dbo].[LN_DniDlyaPerioda] (
    [ID]       INT NOT NULL,
    [MasterID] INT NULL,
    [DayNo]    INT NULL,
    CONSTRAINT [LN_DniDlyaPeriodaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LN_DniDlyaPeriodaToLN_Naznacheniya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LN_Naznacheniya] ([ID]) ON DELETE CASCADE
);

