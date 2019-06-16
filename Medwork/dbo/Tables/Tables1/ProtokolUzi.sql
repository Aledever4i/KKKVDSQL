CREATE TABLE [dbo].[ProtokolUzi] (
    [ID]               INT            NOT NULL,
    [PatID]            INT            NULL,
    [Snimok]           IMAGE          NULL,
    [Primechanie]      NTEXT          NULL,
    [Opisanie]         NTEXT          NULL,
    [Zaklyuchenie]     NTEXT          NULL,
    [VidIssledovaniya] NVARCHAR (100) NULL,
    [Date]             DATETIME       NULL,
    [Vrach]            INT            NULL,
    CONSTRAINT [ProtokolUziPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProtokolUziToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

