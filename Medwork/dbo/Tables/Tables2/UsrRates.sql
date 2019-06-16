CREATE TABLE [dbo].[UsrRates] (
    [ID]                     INT      NOT NULL,
    [MasterID]               INT      NULL,
    [StartDate]              DATETIME NULL,
    [chFixedRate]            BIT      NULL,
    [chPlataZaVyhod]         BIT      NULL,
    [chPlataZaOkazanieUslug] BIT      NULL,
    [edFixedRate]            MONEY    NULL,
    [edPlataZaVyhod]         MONEY    NULL,
    CONSTRAINT [UsrRatesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UsrRatesToUsr] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Usr] ([ID]) ON DELETE CASCADE
);

