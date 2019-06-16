CREATE TABLE [dbo].[SpravkaVZheu] (
    [ID]        INT           NOT NULL,
    [PatID]     INT           NULL,
    [S]         DATETIME      NULL,
    [Po]        DATETIME      NULL,
    [FIOVracha] NVARCHAR (50) NULL,
    [Date]      DATETIME      NULL,
    CONSTRAINT [SpravkaVZheuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SpravkaVZheuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

