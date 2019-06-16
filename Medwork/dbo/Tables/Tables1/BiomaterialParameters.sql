CREATE TABLE [dbo].[BiomaterialParameters] (
    [ID]        INT           NOT NULL,
    [MasterID]  INT           NULL,
    [Parameter] NVARCHAR (50) NULL,
    [Comment]   NTEXT         NULL,
    [Code]      NVARCHAR (50) NULL,
    CONSTRAINT [BiomaterialParametersPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [BiomaterialParametersToAnalysisKind] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AnalysisKind] ([ID]) ON DELETE CASCADE
);

