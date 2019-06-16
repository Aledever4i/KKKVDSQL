CREATE TABLE [dbo].[ZapisDnevnekaKuratsiiZhivotnogo] (
    [ID]                    INT            NOT NULL,
    [PatID]                 INT            NULL,
    [MasterID]              INT            NULL,
    [Vrach3]                INT            NULL,
    [LechenieVStatsionare1] NVARCHAR (4)   NULL,
    [Data1]                 DATETIME       NULL,
    [DanOsmPerv]            NTEXT          NULL,
    [Obsheesost1]           NVARCHAR (50)  NULL,
    [Temper1]               FLOAT (53)     NULL,
    [sist1]                 INT            NULL,
    [diast1]                INT            NULL,
    [Puls]                  INT            NULL,
    [Ves3]                  FLOAT (53)     NULL,
    [snk]                   INT            NULL,
    [CHDD1]                 INT            NULL,
    [zhalobi1]              NVARCHAR (255) NULL,
    [Jalobi]                NTEXT          NULL,
    [DinamikaSost]          NVARCHAR (50)  NULL,
    [DocTime]               DATETIME       NULL,
    CONSTRAINT [ZapisDnevnekaKuratsiiZhivotnogoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ZapisDnevnekaKuratsiiZhivotnogoToDnevnikKuratsiiZhivotnogo] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[DnevnikKuratsiiZhivotnogo] ([ID]) ON DELETE CASCADE
);

