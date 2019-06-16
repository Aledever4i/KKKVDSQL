CREATE TABLE [dbo].[Rinotsitogramma] (
    [ID]                          INT      NOT NULL,
    [PatID]                       INT      NULL,
    [NomerAnaliza]                INT      NULL,
    [DataProvedeniyaAnaliza]      DATETIME NULL,
    [SegmnentoyadernieNeytrofili] INT      NULL,
    [Limfotsiti]                  INT      NULL,
    [Eozinofili]                  INT      NULL,
    [Vrach]                       INT      NULL,
    CONSTRAINT [RinotsitogrammaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RinotsitogrammaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

