CREATE TABLE [dbo].[DiagnozPoMkb10] (
    [ID]                          INT           NOT NULL,
    [PatID]                       INT           NULL,
    [MasterID]                    INT           NULL,
    [DataPostanovkiDiagnoza]      DATETIME      NULL,
    [KodPoMkb10]                  NVARCHAR (10) NULL,
    [DiagnozPoMkb10]              NVARCHAR (80) NULL,
    [Tip]                         INT           NULL,
    [Stadiya]                     INT           NULL,
    [DataPodtverzhdeniyaDiagnoza] DATETIME      NULL,
    [Vrach]                       INT           NULL,
    CONSTRAINT [DiagnozPoMkb10PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DiagnozPoMkb10ToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

