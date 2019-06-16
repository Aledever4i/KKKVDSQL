CREATE TABLE [dbo].[InfoTabloParams] (
    [ID]            INT            NOT NULL,
    [InfoTabloName] NVARCHAR (100) NULL,
    [UID]           INT            NULL,
    [Comment]       NVARCHAR (255) NULL,
    [SelRes]        NTEXT          NULL,
    [TimerInterval] INT            NULL,
    [fontscale]     INT            NULL,
    [ResForScreen]  INT            NULL,
    CONSTRAINT [InfoTabloParamsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

