CREATE TABLE [dbo].[EfiRog] (
    [ID]            INT           NOT NULL,
    [PatID]         INT           NULL,
    [OD]            FLOAT (53)    NULL,
    [OD1]           FLOAT (53)    NULL,
    [Prim]          NTEXT         NULL,
    [ZakluchenieOD] NVARCHAR (50) NULL,
    [ZakluchenieOS] NVARCHAR (50) NULL,
    CONSTRAINT [EfiRogPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EfiRogToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

