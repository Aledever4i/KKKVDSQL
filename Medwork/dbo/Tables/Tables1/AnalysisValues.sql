CREATE TABLE [dbo].[AnalysisValues] (
    [ID]           INT            NOT NULL,
    [MasterID]     INT            NULL,
    [ParamName]    NVARCHAR (256) NULL,
    [Reference]    NVARCHAR (50)  NULL,
    [Postfix]      NVARCHAR (50)  NULL,
    [ParamValue]   NVARCHAR (50)  NULL,
    [Comment]      NTEXT          NULL,
    [ParamCaption] NVARCHAR (256) NULL,
    [Measure]      NVARCHAR (50)  NULL,
    [ItemType]     INT            NULL,
    CONSTRAINT [PK_AnalysisValues] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalysisValuesToAnalysisResult] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AnalysisResult] ([ID]) ON DELETE CASCADE
);

