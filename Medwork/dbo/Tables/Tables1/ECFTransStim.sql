CREATE TABLE [dbo].[ECFTransStim] (
    [ID]          INT           NOT NULL,
    [MasterID]    INT           NULL,
    [StimMode]    NVARCHAR (50) NULL,
    [StimDose]    NVARCHAR (15) NULL,
    [StimPattern] NVARCHAR (50) NULL,
    CONSTRAINT [ECFTransStimPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ECFTransStimToECFTrans] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ECFTrans] ([Id]) ON DELETE CASCADE
);

