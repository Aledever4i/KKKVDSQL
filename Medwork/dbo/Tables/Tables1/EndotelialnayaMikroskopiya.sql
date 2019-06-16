CREATE TABLE [dbo].[EndotelialnayaMikroskopiya] (
    [ID]            INT   NOT NULL,
    [PatID]         INT   NULL,
    [VCentreOD]     INT   NULL,
    [NaPeriferiiOD] INT   NULL,
    [VCentreOS]     INT   NULL,
    [NaPeriferiOS]  INT   NULL,
    [Prim]          NTEXT NULL,
    CONSTRAINT [EndotelialnayaMikroskopiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EndotelialnayaMikroskopiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

