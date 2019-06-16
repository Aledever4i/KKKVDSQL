CREATE TABLE [dbo].[SubPersonalAccount] (
    [ID]        INT            NOT NULL,
    [AccountId] INT            NULL,
    [StartDate] DATETIME       NULL,
    [EndDate]   DATETIME       NULL,
    [Active]    BIT            NULL,
    [Comments]  NVARCHAR (100) NULL,
    [PatId]     INT            NULL,
    [MasterId]  INT            NULL,
    [ParentID]  INT            NULL,
    CONSTRAINT [SubPersonalAccountPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

