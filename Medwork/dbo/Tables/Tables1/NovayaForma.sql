CREATE TABLE [dbo].[NovayaForma] (
    [DictCombo1] NVARCHAR (50) NULL,
    [DateBox1]   DATETIME      NULL,
    [Memo1]      NTEXT         NULL,
    [DictCombo2] NVARCHAR (50) NULL,
    [PatID]      INT           NULL,
    [ID]         INT           NULL,
    CONSTRAINT [NovayaFormaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

