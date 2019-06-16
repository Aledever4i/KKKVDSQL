CREATE TABLE [dbo].[PovtorniyPriMHirurga] (
    [ID]                          INT           NOT NULL,
    [PatID]                       INT           NULL,
    [Data]                        DATETIME      NULL,
    [Vrach]                       NVARCHAR (50) NULL,
    [PredvaritelniyDiagnoz]       NTEXT         NULL,
    [ObektivniyStatus]            NTEXT         NULL,
    [KozhniePokrovi]              NVARCHAR (60) NULL,
    [Myagkiy]                     NVARCHAR (1)  NULL,
    [Vzdut]                       NVARCHAR (1)  NULL,
    [BoleznennostPriPalpatsii]    NVARCHAR (1)  NULL,
    [Zhivot]                      NVARCHAR (40) NULL,
    [Pechen]                      NVARCHAR (60) NULL,
    [LimfaticheskieUzli]          NTEXT         NULL,
    [PryamayaKishka1]             NVARCHAR (50) NULL,
    [Videleniya1]                 NVARCHAR (1)  NULL,
    [BoleznennostPriPalpatsiiPK1] NVARCHAR (1)  NULL,
    [Stenki1]                     NVARCHAR (50) NULL,
    [DopolnitelnieDannie1]        NTEXT         NULL,
    CONSTRAINT [PovtorniyPriMHirurgaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMHirurgaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

