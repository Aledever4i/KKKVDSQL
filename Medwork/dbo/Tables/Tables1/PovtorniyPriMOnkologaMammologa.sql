CREATE TABLE [dbo].[PovtorniyPriMOnkologaMammologa] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [Data]                   DATETIME   NULL,
    [Vrach]                  INT        NULL,
    [PredvaritelniyDiagnoz]  NTEXT      NULL,
    [ObsheeSostoyanie]       INT        NULL,
    [TemperaturaTela]        FLOAT (53) NULL,
    [VolosistayaChastGolovi] NTEXT      NULL,
    [DopolnitelnieDannie]    NTEXT      NULL,
    CONSTRAINT [PovtorniyPriMOnkologaMammologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMOnkologaMammologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

