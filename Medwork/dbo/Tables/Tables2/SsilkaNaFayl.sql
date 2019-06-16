CREATE TABLE [dbo].[SsilkaNaFayl] (
    [ID]       INT            NOT NULL,
    [PatID]    INT            NULL,
    [FilePath] NVARCHAR (255) NULL,
    [DocName]  NVARCHAR (50)  NULL,
    [Notes]    NTEXT          NULL,
    CONSTRAINT [SsilkaNaFaylPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SsilkaNaFaylToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

