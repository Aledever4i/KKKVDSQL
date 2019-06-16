CREATE TABLE [dbo].[AnaliziGlyukozi] (
    [ID]            INT        NOT NULL,
    [PatID]         INT        NULL,
    [MasterID]      INT        NULL,
    [Kolichestvo]   FLOAT (53) NULL,
    [UdelniyVes]    FLOAT (53) NULL,
    [ProcentSahara] FLOAT (53) NULL,
    CONSTRAINT [AnaliziGlyukoziPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnaliziGlyukoziToAnalizMochiNaGlyukozuP] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AnalizMochiNaGlyukozuP] ([ID]) ON DELETE CASCADE
);

