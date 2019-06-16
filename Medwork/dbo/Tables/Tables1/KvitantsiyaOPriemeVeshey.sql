CREATE TABLE [dbo].[KvitantsiyaOPriemeVeshey] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [beg_date] DATETIME      NULL,
    [DeptId]   NVARCHAR (50) NULL,
    [end_date] DATETIME      NULL,
    [Num]      NVARCHAR (50) NULL,
    CONSTRAINT [KvitantsiyaOPriemeVesheyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KvitantsiyaOPriemeVesheyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

