CREATE TABLE [dbo].[ParameterValueForm] (
    [ID]      INT           NOT NULL,
    [PatID]   INT           NULL,
    [DocDate] DATETIME      NULL,
    [DocName] NVARCHAR (50) NULL,
    [DocTime] DATETIME      NULL,
    CONSTRAINT [ParameterValueFormPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ParameterValueFormToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

