CREATE TABLE [dbo].[ProtokolOperatsii] (
    [ID]           INT            NOT NULL,
    [PatID]        INT            NULL,
    [OpNumber]     INT            NULL,
    [OpName]       NVARCHAR (255) NULL,
    [StartDate]    DATETIME       NULL,
    [StartTime]    DATETIME       NULL,
    [FinishDate]   DATETIME       NULL,
    [FinishTime]   DATETIME       NULL,
    [ProtocolText] NTEXT          NULL,
    [Duration]     MONEY          NULL,
    CONSTRAINT [ProtokolOperatsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProtokolOperatsiiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

