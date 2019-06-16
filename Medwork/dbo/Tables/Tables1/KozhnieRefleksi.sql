CREATE TABLE [dbo].[KozhnieRefleksi] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [data]     NTEXT         NULL,
    [Refleks]  NVARCHAR (50) NULL,
    CONSTRAINT [KozhnieRefleksiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KozhnieRefleksiToNevrologicheskoeIssledovanie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[NevrologicheskoeIssledovanie] ([ID]) ON DELETE CASCADE
);

