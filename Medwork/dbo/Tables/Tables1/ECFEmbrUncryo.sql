CREATE TABLE [dbo].[ECFEmbrUncryo] (
    [ID]          INT           NOT NULL,
    [PatID]       INT           NULL,
    [ExecDate]    DATETIME      NULL,
    [CancelTrans] NVARCHAR (50) NULL,
    [DocNum]      NVARCHAR (20) NULL,
    [EmbrLeft]    INT           NULL,
    [LeftStage]   NVARCHAR (50) NULL,
    [CryoDate]    DATETIME      NULL,
    CONSTRAINT [ECFEmbrUncryoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ECFEmbrUncryoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

