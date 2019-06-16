CREATE TABLE [dbo].[SvedeniyaOSpetsificheskoyImmunoterapii] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [DateBox1] DATETIME      NULL,
    [Vrach]    NVARCHAR (50) NULL,
    [Diagnoz]  NVARCHAR (50) NULL,
    [Allergen] NVARCHAR (50) NULL,
    CONSTRAINT [SvedeniyaOSpetsificheskoyImmunoterapiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SvedeniyaOSpetsificheskoyImmunoterapiiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

