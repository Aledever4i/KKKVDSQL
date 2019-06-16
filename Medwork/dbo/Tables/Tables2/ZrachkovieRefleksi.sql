CREATE TABLE [dbo].[ZrachkovieRefleksi] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [data]     NTEXT         NULL,
    [Refleks]  NVARCHAR (50) NULL,
    CONSTRAINT [ZrachkovieRefleksiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ZrachkovieRefleksiToNevrologicheskoeIssledovanie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[NevrologicheskoeIssledovanie] ([ID]) ON DELETE CASCADE
);

