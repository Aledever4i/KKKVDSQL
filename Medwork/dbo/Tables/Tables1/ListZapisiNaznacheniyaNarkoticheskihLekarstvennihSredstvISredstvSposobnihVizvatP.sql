CREATE TABLE [dbo].[ListZapisiNaznacheniyaNarkoticheskihLekarstvennihSredstvISredstvSposobnihVizvatP] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [ListZapisiNaznacheniyaNarkoticheskihLekarstvennihSredstvISredstvSposobnihVizvatPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ListZapisiNaznacheniyaNarkoticheskihLekarstvennihSredstvISredstvSposobnihVizvatPToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

