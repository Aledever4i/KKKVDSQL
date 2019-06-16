CREATE TABLE [dbo].[RetseptForma107] (
    [ID]       INT          NOT NULL,
    [PatID]    INT          NULL,
    [TypeRec]  NVARCHAR (8) NULL,
    [DataRec]  DATETIME     NULL,
    [VrachID]  INT          NULL,
    [RpDeistv] INT          NULL,
    CONSTRAINT [RetseptForma107PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RetseptForma107ToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

