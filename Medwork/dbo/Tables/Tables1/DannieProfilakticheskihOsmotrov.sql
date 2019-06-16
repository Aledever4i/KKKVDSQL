CREATE TABLE [dbo].[DannieProfilakticheskihOsmotrov] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [DannieProfilakticheskihOsmotrovPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DannieProfilakticheskihOsmotrovToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

