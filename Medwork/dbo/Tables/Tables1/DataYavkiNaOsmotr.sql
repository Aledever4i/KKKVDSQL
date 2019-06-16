CREATE TABLE [dbo].[DataYavkiNaOsmotr] (
    [ID]        INT      NOT NULL,
    [PatID]     INT      NULL,
    [MasterID]  INT      NULL,
    [Naznachen] DATETIME NULL,
    [Yavilsya]  DATETIME NULL,
    CONSTRAINT [DataYavkiNaOsmotrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DataYavkiNaOsmotrToKontrolnayaKartaOnkoBolnogo] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[KontrolnayaKartaOnkoBolnogo] ([ID]) ON DELETE CASCADE
);

