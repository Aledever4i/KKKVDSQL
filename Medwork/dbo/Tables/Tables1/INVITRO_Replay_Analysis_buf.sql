CREATE TABLE [dbo].[INVITRO_Replay_Analysis_buf] (
    [ID]               INT           NOT NULL,
    [MasterID]         INT           NULL,
    [TestMethodCode]   NVARCHAR (17) NULL,
    [AnaName]          NVARCHAR (35) NULL,
    [Value]            NVARCHAR (15) NULL,
    [Unit]             NVARCHAR (10) NULL,
    [RefMin]           NVARCHAR (15) NULL,
    [RefMark]          BIT           NULL,
    [RefMax]           NVARCHAR (15) NULL,
    [AnalysisDateTime] DATETIME      NULL,
    [LaboratoryID]     NVARCHAR (12) NULL,
    CONSTRAINT [INVITRO_Replay_Analysis_bufPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [INVITRO_Replay_Analysis_bufToINVITRO_Replay_buf] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[INVITRO_Replay_buf] ([ID]) ON DELETE CASCADE
);

