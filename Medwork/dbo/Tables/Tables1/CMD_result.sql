CREATE TABLE [dbo].[CMD_result] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [res_text] NTEXT         NULL,
    [OrderNum] NVARCHAR (50) NULL,
    CONSTRAINT [CMD_resultPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CMD_resultToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

