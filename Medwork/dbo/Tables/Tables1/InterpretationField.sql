CREATE TABLE [dbo].[InterpretationField] (
    [ID]                 INT            NOT NULL,
    [MasterID]           INT            NULL,
    [FieldName]          NVARCHAR (50)  NULL,
    [Condition]          NVARCHAR (10)  NULL,
    [FieldValue]         NVARCHAR (50)  NULL,
    [InterpretationText] NTEXT          NULL,
    [Caption]            NVARCHAR (255) NULL,
    [SystemName]         NVARCHAR (50)  NULL,
    [SortOrder]          INT            NULL,
    CONSTRAINT [InterpretationFieldPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InterpretationFieldToInterpretation] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Interpretation] ([ID]) ON DELETE CASCADE
);

