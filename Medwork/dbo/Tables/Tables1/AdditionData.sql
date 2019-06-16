CREATE TABLE [dbo].[AdditionData] (
    [ID]          INT           NOT NULL,
    [MasterID]    INT           NULL,
    [Theme]       NVARCHAR (50) NULL,
    [Information] NTEXT         NULL,
    [Date]        DATETIME      NULL,
    [Author]      INT           NULL,
    CONSTRAINT [AdditionDataPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AdditionDataToPatient] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Patient] ([ID]) ON DELETE CASCADE
);

