CREATE TABLE [dbo].[PrihodRashod] (
    [ID]                      INT           NOT NULL,
    [MasterID]                INT           NULL,
    [NaimenovaniePoNakladnoy] NVARCHAR (50) NULL,
    [Priobreteno]             INT           NULL,
    [Izrashodovano]           INT           NULL,
    [EdIzmereniya]            NVARCHAR (20) NULL,
    CONSTRAINT [PrihodRashodPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PrihodRashodToNakladnaya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Nakladnaya] ([ID]) ON DELETE CASCADE
);

