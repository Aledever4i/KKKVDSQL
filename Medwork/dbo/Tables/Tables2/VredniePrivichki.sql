CREATE TABLE [dbo].[VredniePrivichki] (
    [ID]                     INT           NOT NULL,
    [PatID]                  INT           NULL,
    [Kurenie]                NVARCHAR (50) NULL,
    [Alcogol]                NVARCHAR (50) NULL,
    [UpotreblenieNarkotikov] NVARCHAR (50) NULL,
    [SmokeYears]             INT           NULL,
    [SmokePerDay]            INT           NULL,
    CONSTRAINT [VredniePrivichkiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VredniePrivichkiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

