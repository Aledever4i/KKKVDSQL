CREATE TABLE [dbo].[CardLocation] (
    [ID]              INT            NOT NULL,
    [MasterID]        INT            NULL,
    [Location]        NVARCHAR (100) NULL,
    [SDate]           DATETIME       NULL,
    [CurrentLocation] BIT            NULL,
    CONSTRAINT [CardLocationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CardLocationToPatient] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Patient] ([ID]) ON DELETE CASCADE
);

