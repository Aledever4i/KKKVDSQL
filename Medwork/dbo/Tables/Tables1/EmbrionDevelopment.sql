CREATE TABLE [dbo].[EmbrionDevelopment] (
    [ID]              INT           NOT NULL,
    [MasterID]        INT           NULL,
    [Stage]           INT           NULL,
    [EstimFactor]     NVARCHAR (50) NULL,
    [DevQuant]        INT           NULL,
    [DevEstim]        NVARCHAR (50) NULL,
    [Action]          INT           NULL,
    [FertilizEstim]   NVARCHAR (50) NULL,
    [OoEstim]         NVARCHAR (50) NULL,
    [Img]             IMAGE         NULL,
    [DayNumber]       INT           NULL,
    [RecDate]         DATETIME      NULL,
    [PronucleusCount] INT           NULL,
    [EQual]           NVARCHAR (50) NULL,
    [BQual1]          NVARCHAR (50) NULL,
    [BQual2]          NVARCHAR (50) NULL,
    [OperId]          INT           NULL,
    [DevEstimCommon]  NVARCHAR (50) NULL,
    [DevEstimBl]      NVARCHAR (50) NULL,
    CONSTRAINT [EmbrionDevelopmentPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EmbrionDevelopmentToOfate] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[OFate] ([Id]) ON DELETE CASCADE
);

