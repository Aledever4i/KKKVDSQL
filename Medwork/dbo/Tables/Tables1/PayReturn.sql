CREATE TABLE [dbo].[PayReturn] (
    [ID]           INT        NOT NULL,
    [PatID]        INT        NULL,
    [Summa]        FLOAT (53) NULL,
    [Prinyal]      INT        NULL,
    [DataVozvrata] DATETIME   NULL,
    [NomerScheta]  INT        NULL,
    CONSTRAINT [PayReturnPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PayReturnToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

