CREATE TABLE [dbo].[Rek1] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [Rezhim]   NVARCHAR (50) NULL,
    [Dieta]    NTEXT         NULL,
    CONSTRAINT [Rek1PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Rek1ToOsmotrTerapevta] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[OsmotrTerapevta] ([ID]) ON DELETE CASCADE
);

