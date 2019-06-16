CREATE TABLE [dbo].[EhooftalmografiyaVMetodSkanirovaniya] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [KodZakluchenie1]  NVARCHAR (3)  NULL,
    [KodZakluchenie2]  NVARCHAR (3)  NULL,
    [KodZakluchenie3]  NVARCHAR (3)  NULL,
    [KodZakluchenie4]  NVARCHAR (3)  NULL,
    [KodZakluchenie5]  NVARCHAR (3)  NULL,
    [TextZakluchenie1] NVARCHAR (50) NULL,
    [TextZakluchenie2] NVARCHAR (50) NULL,
    [TextZakluchenie3] NVARCHAR (50) NULL,
    [TextZakluchenie4] NVARCHAR (50) NULL,
    [TextZakluchenie5] NVARCHAR (50) NULL,
    [Zakluchenie]      NTEXT         NULL,
    CONSTRAINT [EhooftalmografiyaVMetodSkanirovaniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EhooftalmografiyaVMetodSkanirovaniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

