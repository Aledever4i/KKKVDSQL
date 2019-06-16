CREATE TABLE [dbo].[KeratotopografiyaRogovitsi] (
    [ID]                   INT           NOT NULL,
    [PatID]                INT           NULL,
    [Keratotopograf_Image] IMAGE         NULL,
    [Osobennosti]          NTEXT         NULL,
    [zakluchenie_OS]       NVARCHAR (15) NULL,
    [zakluchenie_OD]       NVARCHAR (15) NULL,
    CONSTRAINT [KeratotopografiyaRogovitsiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KeratotopografiyaRogovitsiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

