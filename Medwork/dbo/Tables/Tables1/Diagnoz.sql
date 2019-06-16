CREATE TABLE [dbo].[Diagnoz] (
    [ID]             INT           NOT NULL,
    [PatID]          INT           NULL,
    [MasterID]       INT           NULL,
    [DiagnozPoMkb10] NVARCHAR (80) NULL,
    [KodPoMkb10]     NVARCHAR (10) NULL,
    CONSTRAINT [DiagnozPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DiagnozToNevrologicheskoeIssledovanie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[NevrologicheskoeIssledovanie] ([ID]) ON DELETE CASCADE
);

