CREATE TABLE [dbo].[LpuDiagnoses] (
    [ID]       INT            NOT NULL,
    [Code]     NVARCHAR (20)  NULL,
    [DiagName] NVARCHAR (255) NULL,
    [mkb10]    VARCHAR (8)    NULL,
    [MasterID] INT            NULL,
    [NodeType] NVARCHAR (12)  NULL,
    [parent]   INT            NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

