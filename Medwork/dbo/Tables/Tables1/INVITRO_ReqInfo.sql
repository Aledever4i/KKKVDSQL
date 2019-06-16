CREATE TABLE [dbo].[INVITRO_ReqInfo] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [Value]    NVARCHAR (255) NULL,
    [Code]     NVARCHAR (6)   NULL,
    CONSTRAINT [INVITRO_ReqInfoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [INVITRO_ReqInfoToINVITRO_Requisition] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[INVITRO_Requisition] ([ID]) ON DELETE CASCADE
);

