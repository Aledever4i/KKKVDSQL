CREATE TABLE [dbo].[PovtorniyPriMInfektsionista] (
    [ID]                           INT           NOT NULL,
    [PatID]                        INT           NULL,
    [Data]                         DATETIME      NULL,
    [Vrach]                        NVARCHAR (50) NULL,
    [PredvaritelniyDiagnoz]        NTEXT         NULL,
    [LokalniyStatus]               NTEXT         NULL,
    [Myagkiy]                      NVARCHAR (1)  NULL,
    [Vzdut]                        NVARCHAR (1)  NULL,
    [BoleznennostPriPalpatsii]     NVARCHAR (1)  NULL,
    [Zhivot]                       NVARCHAR (40) NULL,
    [Pechen]                       NVARCHAR (60) NULL,
    [Selezenka]                    NVARCHAR (50) NULL,
    [FiziologicheskieOtpravleniya] NTEXT         NULL,
    [DopolnitelnieDannie]          NTEXT         NULL,
    CONSTRAINT [PovtorniyPriMInfektsionistaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMInfektsionistaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

