CREATE TABLE [dbo].[Narkotiki] (
    [ID]              INT           NOT NULL,
    [PatID]           INT           NULL,
    [MasterID]        INT           NULL,
    [Data]            DATETIME      NULL,
    [Kolvo]           FLOAT (53)    NULL,
    [Obyem]           FLOAT (53)    NULL,
    [Kontsentratsiya] FLOAT (53)    NULL,
    [Doza]            FLOAT (53)    NULL,
    [Vremya]          DATETIME      NULL,
    [Preparat]        NVARCHAR (50) NULL,
    [Forma]           NVARCHAR (50) NULL,
    [SposobPriema]    NVARCHAR (50) NULL,
    [ed]              NVARCHAR (50) NULL,
    [Vrach1]          INT           NULL,
    CONSTRAINT [NarkotikiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

