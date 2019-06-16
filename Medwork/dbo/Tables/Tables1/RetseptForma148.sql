CREATE TABLE [dbo].[RetseptForma148] (
    [ID]                    INT           NOT NULL,
    [PatID]                 INT           NULL,
    [DataVipiskiRetsepta]   DATETIME      NULL,
    [RetseptDeystvitelenDo] DATETIME      NULL,
    [Doctor]                NVARCHAR (50) NULL,
    [VidOplati]             NVARCHAR (50) NULL,
    [Rp]                    NTEXT         NULL,
    [opl]                   NVARCHAR (50) NULL,
    CONSTRAINT [RetseptForma148PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RetseptForma148ToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

