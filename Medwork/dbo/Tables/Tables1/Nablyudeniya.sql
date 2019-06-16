CREATE TABLE [dbo].[Nablyudeniya] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [Data]     DATETIME      NULL,
    [Memo1]    NTEXT         NULL,
    [Vrach]    NVARCHAR (50) NULL,
    CONSTRAINT [NablyudeniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

