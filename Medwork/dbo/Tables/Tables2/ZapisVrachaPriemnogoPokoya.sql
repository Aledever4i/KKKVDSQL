CREATE TABLE [dbo].[ZapisVrachaPriemnogoPokoya] (
    [ID]                    INT           NOT NULL,
    [PatID]                 INT           NULL,
    [Data]                  DATETIME      NULL,
    [Vrach]                 INT           NULL,
    [zapis]                 NTEXT         NULL,
    [DiagnozPriPostuplenii] NVARCHAR (80) NULL,
    CONSTRAINT [ZapisVrachaPriemnogoPokoyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ZapisVrachaPriemnogoPokoyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

