CREATE TABLE [dbo].[VacPass] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [OwnerName]  NVARCHAR (50) NULL,
    [DocDate]    DATETIME      NULL,
    [AnimalSpec] NVARCHAR (50) NULL,
    [AnimalName] NVARCHAR (50) NULL,
    [Msg]        NTEXT         NULL,
    [DocNum]     NVARCHAR (50) NULL,
    [Org]        NVARCHAR (50) NULL,
    [AnimalID]   INT           NULL,
    CONSTRAINT [VacPassPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VacPassToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

