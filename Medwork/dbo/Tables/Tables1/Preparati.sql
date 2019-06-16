CREATE TABLE [dbo].[Preparati] (
    [MasterID]        INT           NULL,
    [SposobPriema]    NVARCHAR (50) NULL,
    [Forma]           NVARCHAR (50) NULL,
    [Kolvo]           FLOAT (53)    NULL,
    [Obyem]           FLOAT (53)    NULL,
    [Kontsentratsiya] FLOAT (53)    NULL,
    [Doza]            FLOAT (53)    NULL,
    [Vremya]          DATETIME      NULL,
    [Preparat]        NVARCHAR (50) NULL,
    [ID]              INT           NULL,
    [Ed]              NVARCHAR (50) NULL,
    CONSTRAINT [PreparatiToRetseptForma148] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[RetseptForma148] ([ID]) ON DELETE CASCADE
);

