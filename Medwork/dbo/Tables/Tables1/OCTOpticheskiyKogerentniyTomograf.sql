CREATE TABLE [dbo].[OCTOpticheskiyKogerentniyTomograf] (
    [ID]     INT   NOT NULL,
    [PatID]  INT   NULL,
    [Image1] IMAGE NULL,
    [Memo1]  NTEXT NULL,
    [Vrach2] INT   NULL,
    CONSTRAINT [OCTOpticheskiyKogerentniyTomografPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OCTOpticheskiyKogerentniyTomografToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

