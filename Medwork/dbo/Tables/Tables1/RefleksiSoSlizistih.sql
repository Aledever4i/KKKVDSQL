CREATE TABLE [dbo].[RefleksiSoSlizistih] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [data]     NTEXT         NULL,
    [Refleks]  NVARCHAR (50) NULL,
    CONSTRAINT [RefleksiSoSlizistihPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RefleksiSoSlizistihToNevrologicheskoeIssledovanie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[NevrologicheskoeIssledovanie] ([ID]) ON DELETE CASCADE
);

