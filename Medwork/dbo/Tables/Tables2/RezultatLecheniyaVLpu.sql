CREATE TABLE [dbo].[RezultatLecheniyaVLpu] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [DateBox1]   DATETIME      NULL,
    [DictCombo1] NVARCHAR (50) NULL,
    [DictCombo2] NVARCHAR (50) NULL,
    [Memo1]      NTEXT         NULL,
    CONSTRAINT [RezultatLecheniyaVLpuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

