CREATE TABLE [dbo].[AnalysisComments] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [Subject]  NVARCHAR (50) NULL,
    [Comment]  NTEXT         NULL,
    [Code]     NVARCHAR (50) NULL,
    CONSTRAINT [AnalysisCommentsToAnalysisResult] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AnalysisResult] ([ID]) ON DELETE CASCADE
);

