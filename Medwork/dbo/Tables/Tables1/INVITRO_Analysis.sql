CREATE TABLE [dbo].[INVITRO_Analysis] (
    [ID]             INT            NOT NULL,
    [MasterID]       INT            NULL,
    [TestMethodCode] NVARCHAR (50)  NULL,
    [PriorityCode]   NVARCHAR (2)   NULL,
    [ContainerCode]  NVARCHAR (7)   NULL,
    [TestName]       NVARCHAR (30)  NULL,
    [Comment]        NVARCHAR (100) NULL,
    CONSTRAINT [INVITRO_AnalysisPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [INVITRO_AnalysisToINVITRO_Requisition] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[INVITRO_Requisition] ([ID]) ON DELETE CASCADE
);

