CREATE TABLE [dbo].[RashodRengen] (
    [ID]         INT            NOT NULL,
    [MasterID]   INT            NULL,
    [FotoNum]    INT            NULL,
    [Foto]       NVARCHAR (150) NULL,
    [Proektsiya] NVARCHAR (150) NULL,
    [Дата]       DATETIME       NULL,
    [Oper]       INT            NULL,
    [Автор]      INT            NULL,
    [Format]     INT            NULL,
    [Count]      INT            NULL,
    CONSTRAINT [RashodRengenPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

