CREATE TABLE [dbo].[AnalysisResult] (
    [ID]              INT            NOT NULL,
    [MasterID]        INT            NULL,
    [DoneUser]        INT            NULL,
    [Creator]         INT            NULL,
    [CreateDate]      DATETIME       NULL,
    [DoneDate]        DATETIME       NULL,
    [Laboratory]      INT            NULL,
    [ServOrMat]       NVARCHAR (50)  NULL,
    [GUID]            NVARCHAR (32)  NULL,
    [AnalysisKind]    INT            NULL,
    [ResultType]      INT            NULL,
    [Code]            NVARCHAR (50)  NULL,
    [AnalysisName]    NVARCHAR (256) NULL,
    [ResultText]      NTEXT          NULL,
    [Measure]         NVARCHAR (50)  NULL,
    [ReferenceText]   NTEXT          NULL,
    [ResultDict]      NVARCHAR (50)  NULL,
    [DateTime]        DATETIME       NULL,
    [AnalysisCaption] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_AnalysisResult] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnalysisResultToAnalysis] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Analysis] ([ID]) ON DELETE CASCADE
);

