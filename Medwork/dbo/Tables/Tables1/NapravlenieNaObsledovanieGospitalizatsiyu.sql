CREATE TABLE [dbo].[NapravlenieNaObsledovanieGospitalizatsiyu] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [DateBox1]   DATETIME      NULL,
    [DictCombo1] NVARCHAR (50) NULL,
    [Diagnoz]    NVARCHAR (50) NULL,
    [Memo1]      NTEXT         NULL,
    CONSTRAINT [NapravlenieNaObsledovanieGospitalizatsiyuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [NapravlenieNaObsledovanieGospitalizatsiyuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

