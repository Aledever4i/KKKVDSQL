CREATE TABLE [dbo].[DiagnoziPoMkb10] (
    [ID]                          INT           NOT NULL,
    [PatID]                       INT           NULL,
    [MasterID]                    INT           NULL,
    [DataPostanovkiDiagnoza]      DATETIME      NULL,
    [KodPoMkb10]                  NVARCHAR (10) NULL,
    [DiagnozPoMkb10]              INT           NULL,
    [Tip]                         INT           NULL,
    [Stadiya]                     INT           NULL,
    [DataPodtverzhdeniyaDiagnoza] DATETIME      NULL,
    [Vrach]                       INT           NULL,
    CONSTRAINT [DiagnoziPoMkb10PrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

