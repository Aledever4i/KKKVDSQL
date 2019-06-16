CREATE TABLE [dbo].[InstrDiag_Ophtalmolog_Perimetriya] (
    [ID]      INT           NOT NULL,
    [PatID]   INT           NULL,
    [Image1]  IMAGE         NULL,
    [Zaklych] NTEXT         NULL,
    [TOD]     NVARCHAR (20) NULL,
    [OOD]     NVARCHAR (5)  NULL,
    [TOS]     NVARCHAR (20) NULL,
    [OOS]     NVARCHAR (5)  NULL,
    CONSTRAINT [InstrDiag_Ophtalmolog_PerimetriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_Ophtalmolog_PerimetriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

