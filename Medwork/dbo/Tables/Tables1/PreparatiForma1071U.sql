CREATE TABLE [dbo].[PreparatiForma1071U] (
    [ID]              INT           NOT NULL,
    [MasterID]        INT           NULL,
    [Kolvo]           FLOAT (53)    NULL,
    [Obyem]           FLOAT (53)    NULL,
    [Kontsentratsiya] FLOAT (53)    NULL,
    [Doza]            FLOAT (53)    NULL,
    [Vremya]          DATETIME      NULL,
    [Preparat]        NVARCHAR (50) NULL,
    [Forma]           NVARCHAR (50) NULL,
    [SposobPriema]    NVARCHAR (50) NULL,
    [ed]              NVARCHAR (50) NULL,
    CONSTRAINT [PreparatiForma1071UPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PreparatiForma1071UToRetseptForma107] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[RetseptForma107] ([ID]) ON DELETE CASCADE
);

