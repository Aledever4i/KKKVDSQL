CREATE TABLE [dbo].[HarakterZreniya] (
    [ID]    INT           NOT NULL,
    [PatID] INT           NULL,
    [NK]    NVARCHAR (25) NULL,
    [MK]    NVARCHAR (25) NULL,
    [PK]    NVARCHAR (25) NULL,
    [Prim]  NTEXT         NULL,
    CONSTRAINT [HarakterZreniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [HarakterZreniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

