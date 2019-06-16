CREATE TABLE [dbo].[IncNosology] (
    [ID]              INT            NOT NULL,
    [FirstDiagnosis]  NVARCHAR (100) NULL,
    [SecondDiagnosis] NVARCHAR (100) NULL,
    [Action]          INT            NULL,
    CONSTRAINT [IncNosologyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

