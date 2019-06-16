CREATE TABLE [dbo].[PatAgents] (
    [ID]           INT          NOT NULL,
    [PatID]        INT          NULL,
    [AgentUserID]  INT          NULL,
    [AgentPercent] FLOAT (53)   NULL,
    [DataS]        DATETIME     NULL,
    [DataPo]       DATETIME     NULL,
    [Annulirovan]  NVARCHAR (1) NULL,
    [AuthorID]     INT          NULL,
    [AgentDef]     NVARCHAR (1) NULL,
    CONSTRAINT [PatAgentsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

