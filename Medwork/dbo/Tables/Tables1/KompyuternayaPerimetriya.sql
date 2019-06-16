CREATE TABLE [dbo].[KompyuternayaPerimetriya] (
    [ID]           INT          NOT NULL,
    [PatID]        INT          NULL,
    [ODTaskcount]  INT          NULL,
    [OStaskcount]  INT          NULL,
    [ODcurcount]   INT          NULL,
    [OScurcount]   INT          NULL,
    [Perimetria]   IMAGE        NULL,
    [ODpercent]    INT          NULL,
    [OSpercent]    INT          NULL,
    [ODTaskcount1] INT          NULL,
    [OStaskcount1] INT          NULL,
    [ODcurcount1]  INT          NULL,
    [OScurcount1]  INT          NULL,
    [Osobennosti]  NTEXT        NULL,
    [RecNo]        INT          NULL,
    [ExportTime]   DATETIME     NULL,
    [PZOD]         NVARCHAR (1) NULL,
    [PZOS]         NVARCHAR (1) NULL,
    CONSTRAINT [KompyuternayaPerimetriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KompyuternayaPerimetriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

