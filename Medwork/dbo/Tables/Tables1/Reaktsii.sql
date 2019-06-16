CREATE TABLE [dbo].[Reaktsii] (
    [ID]           INT           NOT NULL,
    [PatID]        INT           NULL,
    [MasterID]     INT           NULL,
    [NaChtoImenno] NVARCHAR (50) NULL,
    [Preparat]     NVARCHAR (50) NULL,
    [Data]         DATETIME      NULL,
    [VidReaktsii]  NVARCHAR (50) NULL,
    CONSTRAINT [ReaktsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ReaktsiiToOsmotrAllergologa] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[OsmotrAllergologa] ([ID]) ON DELETE CASCADE
);

