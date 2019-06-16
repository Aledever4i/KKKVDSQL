CREATE TABLE [dbo].[PovtorniyPriMTorakalnogoHirurga] (
    [ID]                    INT           NOT NULL,
    [PatID]                 INT           NULL,
    [Data]                  DATETIME      NULL,
    [Vrach]                 NVARCHAR (50) NULL,
    [PredvaritelniyDiagnoz] NTEXT         NULL,
    [KozhniePokrovi]        NVARCHAR (60) NULL,
    [LimfaticheskieUzli]    NTEXT         NULL,
    [GrudnayaKletka]        NTEXT         NULL,
    [DopolnitelnieDannie]   NTEXT         NULL,
    [ObektivniyStatus]      NTEXT         NULL,
    CONSTRAINT [PovtorniyPriMTorakalnogoHirurgaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMTorakalnogoHirurgaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

