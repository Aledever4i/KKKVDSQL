CREATE TABLE [dbo].[PovtorniyPriMNeyrohirurga] (
    [ID]                    INT           NOT NULL,
    [PatID]                 INT           NULL,
    [Data]                  DATETIME      NULL,
    [Vrach]                 NVARCHAR (50) NULL,
    [PredvaritelniyDiagnoz] NTEXT         NULL,
    [ObektivniyStatus]      NTEXT         NULL,
    [Soznanie]              INT           NULL,
    [Polozhenie]            INT           NULL,
    [Polozhenie2]           NVARCHAR (30) NULL,
    [Kozha]                 INT           NULL,
    [VirazhenieLitsa]       INT           NULL,
    [Zrachki]               NTEXT         NULL,
    [ObshemozgovieSimptomi] NTEXT         NULL,
    [OchagovieSimptomi]     NTEXT         NULL,
    [DopolnitelnieDannie]   NTEXT         NULL,
    CONSTRAINT [PovtorniyPriMNeyrohirurgaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMNeyrohirurgaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

