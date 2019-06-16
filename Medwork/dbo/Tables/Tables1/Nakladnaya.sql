CREATE TABLE [dbo].[Nakladnaya] (
    [ID]       INT      NOT NULL,
    [MasterID] INT      NULL,
    [Data]     DATETIME NULL,
    [Avtor]    INT      NULL,
    CONSTRAINT [NakladnayaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

