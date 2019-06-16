CREATE TABLE [dbo].[PovtorniyPriMProktologa] (
    [ID]                          INT           NOT NULL,
    [PatID]                       INT           NULL,
    [Data]                        DATETIME      NULL,
    [Vrach]                       NVARCHAR (50) NULL,
    [PredvaritelniyDiagnoz]       NTEXT         NULL,
    [Zhalobi1]                    NTEXT         NULL,
    [ObektivniyStatus]            NTEXT         NULL,
    [KozhniePokrovi]              NVARCHAR (60) NULL,
    [Myagkiy]                     NVARCHAR (1)  NULL,
    [Vzdut]                       NVARCHAR (1)  NULL,
    [BoleznennostPriPalpatsii]    NVARCHAR (1)  NULL,
    [Zhivot]                      NVARCHAR (40) NULL,
    [Pechen]                      NVARCHAR (60) NULL,
    [Videleniya1]                 NVARCHAR (1)  NULL,
    [PryamayaKishka1]             NVARCHAR (50) NULL,
    [BoleznennostPriPalpatsiiPK1] NVARCHAR (1)  NULL,
    [GemorroidalnieUzli1]         NVARCHAR (1)  NULL,
    [Stenki1]                     NVARCHAR (50) NULL,
    [DopolnitelnieDannie1]        NTEXT         NULL,
    CONSTRAINT [PovtorniyPriMProktologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMProktologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

