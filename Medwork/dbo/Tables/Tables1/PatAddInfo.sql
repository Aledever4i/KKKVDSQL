CREATE TABLE [dbo].[PatAddInfo] (
    [ID]           INT            NOT NULL,
    [PatID]        INT            NULL,
    [Defensor]     NVARCHAR (100) NULL,
    [DefensorInfo] NTEXT          NULL,
    [BirthDate]    DATETIME       NULL,
    CONSTRAINT [PatAddInfoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PatAddInfoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

