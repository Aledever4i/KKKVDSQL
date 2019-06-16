CREATE TABLE [dbo].[Pisha] (
    [ID]              INT           NOT NULL,
    [PatID]           INT           NULL,
    [MasterID]        INT           NULL,
    [Data]            DATETIME      NULL,
    [VidReaktsii]     NVARCHAR (50) NULL,
    [NaKakieProdukti] NVARCHAR (50) NULL,
    CONSTRAINT [PishaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PishaToOsmotrAllergologa] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[OsmotrAllergologa] ([ID]) ON DELETE CASCADE
);

