CREATE TABLE [dbo].[PSS_DniDlyaPerioda] (
    [ID]       INT NOT NULL,
    [MasterID] INT NULL,
    [DayNo]    INT NULL,
    CONSTRAINT [PSS_DniDlyaPeriodaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PSS_DniDlyaPeriodaToPaidSubService] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PaidSubService] ([ID]) ON DELETE CASCADE
);

