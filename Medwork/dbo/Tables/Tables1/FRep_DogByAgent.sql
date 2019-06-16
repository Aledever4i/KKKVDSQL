CREATE TABLE [dbo].[FRep_DogByAgent] (
    [GUID]         UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]     INT              NULL,
    [ConnectionID] INT              NULL,
    [AgentName]    NVARCHAR (20)    NULL,
    [DolgName]     NVARCHAR (80)    NULL,
    [DogNum]       NVARCHAR (50)    NULL,
    [ProgramName]  NVARCHAR (150)   NULL,
    [PatName]      NVARCHAR (250)   NULL,
    [DogSum]       MONEY            NULL,
    [AgentPercent] FLOAT (53)       NULL,
    [Bonus]        MONEY            NULL,
    PRIMARY KEY NONCLUSTERED ([GUID] ASC)
);

