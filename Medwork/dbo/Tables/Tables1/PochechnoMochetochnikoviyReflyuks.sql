CREATE TABLE [dbo].[PochechnoMochetochnikoviyReflyuks] (
    [ID]                                  INT      NOT NULL,
    [PatID]                               INT      NULL,
    [Data]                                DATETIME NULL,
    [NomerIssledovaniya]                  INT      NULL,
    [Vrach]                               INT      NULL,
    [Zaklyuchenie]                        INT      NULL,
    [PriUdovletvoritelnomNapolnenii]      INT      NULL,
    [PosleMiktsii]                        INT      NULL,
    [SlevaPriUdovletvoritelnomNapolnenii] INT      NULL,
    [SlevaPosleMiktsii]                   INT      NULL,
    [SlevaDo]                             INT      NULL,
    [StepenViraschennosti]                INT      NULL,
    [SpravaDo]                            INT      NULL,
    [SpravaPosle]                         INT      NULL,
    [SlevaPosle]                          INT      NULL,
    CONSTRAINT [PochechnoMochetochnikoviyReflyuksPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PochechnoMochetochnikoviyReflyuksToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

