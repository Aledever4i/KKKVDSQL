CREATE TABLE [dbo].[SuhozhilnieINadkosnichnieRefleksi] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [Refleks]  NVARCHAR (50) NULL,
    [data]     NTEXT         NULL,
    CONSTRAINT [SuhozhilnieINadkosnichnieRefleksiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SuhozhilnieINadkosnichnieRefleksiToNevrologicheskoeIssledovanie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[NevrologicheskoeIssledovanie] ([ID]) ON DELETE CASCADE
);

