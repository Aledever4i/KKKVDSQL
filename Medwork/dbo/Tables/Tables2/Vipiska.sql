CREATE TABLE [dbo].[Vipiska] (
    [ID]                                 INT           NOT NULL,
    [PatID]                              INT           NULL,
    [Data]                               DATETIME      NULL,
    [Vrach]                              NVARCHAR (50) NULL,
    [Vibila]                             NVARCHAR (50) NULL,
    [Vibila1]                            NVARCHAR (50) NULL,
    [SostoyaniePriVipiskePerevode]       NTEXT         NULL,
    [VidanListokNetrudosposobnostiNomer] INT           NULL,
    [S]                                  DATETIME      NULL,
    [Po]                                 DATETIME      NULL,
    [Novorozhdenniy]                     NVARCHAR (50) NULL,
    [Vipisan1]                           DATETIME      NULL,
    [Umer]                               NVARCHAR (1)  NULL,
    [Vipisan]                            NVARCHAR (1)  NULL,
    [umer1]                              DATETIME      NULL,
    [Mertvorozhdenniy]                   DATETIME      NULL,
    [PerevedenV]                         NVARCHAR (50) NULL,
    [Kogda]                              DATETIME      NULL,
    CONSTRAINT [VipiskaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VipiskaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

