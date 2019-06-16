CREATE TABLE [dbo].[DnevnikKuratsiiZhivotnogo] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [DnevnikKuratsiiZhivotnogoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DnevnikKuratsiiZhivotnogoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

