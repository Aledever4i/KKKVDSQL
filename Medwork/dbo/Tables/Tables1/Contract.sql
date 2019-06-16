CREATE TABLE [dbo].[Contract] (
    [ID]           INT            NOT NULL,
    [MasterID]     INT            NULL,
    [NodeType]     NVARCHAR (12)  NULL,
    [Dogovor]      NVARCHAR (50)  NULL,
    [DataDogovora] DATETIME       NULL,
    [DoneDate]     DATETIME       NULL,
    [Text]         IMAGE          NULL,
    [ContractName] NVARCHAR (256) NULL,
    [OFF]          INT            NULL,
    CONSTRAINT [ContractPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ContractToinsurance] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[insurance] ([ID]) ON DELETE CASCADE
);

