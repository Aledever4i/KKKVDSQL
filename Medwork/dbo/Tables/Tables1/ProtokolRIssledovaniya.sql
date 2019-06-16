CREATE TABLE [dbo].[ProtokolRIssledovaniya] (
    [ID]                INT           NOT NULL,
    [PatID]             INT           NULL,
    [Opisanie]          NTEXT         NULL,
    [VidIssledovaniya]  NVARCHAR (60) NULL,
    [EedMzv]            FLOAT (53)    NULL,
    [Zaklyuchenie]      NTEXT         NULL,
    [Data]              DATETIME      NULL,
    [Vrach]             INT           NULL,
    [Image]             IMAGE         NULL,
    [VidIssledovaniya1] NVARCHAR (50) NULL,
    CONSTRAINT [ProtokolRIssledovaniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProtokolRIssledovaniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

