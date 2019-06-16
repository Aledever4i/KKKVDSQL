﻿CREATE TABLE [dbo].[UziShitovidnoyZhelezi] (
    [ID]                            INT            NOT NULL,
    [PatID]                         INT            NULL,
    [Razmeri]                       INT            NULL,
    [Uvelichena]                    NVARCHAR (50)  NULL,
    [Umenshena2]                    INT            NULL,
    [NeskolkoUvelichena]            INT            NULL,
    [PravayaDolya]                  FLOAT (53)     NULL,
    [PravayaDolya1]                 FLOAT (53)     NULL,
    [PravayaDolya2]                 FLOAT (53)     NULL,
    [LevayaDolya]                   FLOAT (53)     NULL,
    [LevayaDolya1]                  FLOAT (53)     NULL,
    [LevayaDolya2]                  FLOAT (53)     NULL,
    [Peresheek]                     FLOAT (53)     NULL,
    [Peresheek1]                    FLOAT (53)     NULL,
    [Peresheek2]                    FLOAT (53)     NULL,
    [Obem]                          FLOAT (53)     NULL,
    [Konturi]                       INT            NULL,
    [NeChetkie]                     NVARCHAR (1)   NULL,
    [Struktura]                     INT            NULL,
    [NeodnorodnayaZaSchet]          INT            NULL,
    [DiametrVklyucheniy]            INT            NULL,
    [EhoPlotnost]                   INT            NULL,
    [DopolnitelnieVklyucheniya]     INT            NULL,
    [DopolnitelnieDannieUzi]        NTEXT          NULL,
    [Vrach]                         INT            NULL,
    [NomerIssledovaniya]            INT            NULL,
    [Data]                          DATETIME       NULL,
    [Zaklyuchenie]                  NVARCHAR (MAX) NULL,
    [DopolnitelnieObrazovaniya]     NVARCHAR (1)   NULL,
    [Lotsiruetsya]                  INT            NULL,
    [Razmeri1]                      FLOAT (53)     NULL,
    [Razmeri2]                      FLOAT (53)     NULL,
    [Razmeri3]                      FLOAT (53)     NULL,
    [Forma]                         INT            NULL,
    [Konturi1]                      INT            NULL,
    [Chetkost]                      INT            NULL,
    [EhoStruktura]                  INT            NULL,
    [EhoPlotnostDO]                 INT            NULL,
    [BezOtrazheniyaUltrazvuka]      NVARCHAR (1)   NULL,
    [SUsileniemZaDorzalnoyStenkoy]  NVARCHAR (1)   NULL,
    [Razmeri4]                      FLOAT (53)     NULL,
    [Razmeri5]                      FLOAT (53)     NULL,
    [Razmeri6]                      FLOAT (53)     NULL,
    [Kaltsinati]                    NVARCHAR (1)   NULL,
    [UchastkiLineynogoFibroza]      NVARCHAR (1)   NULL,
    [UchastkiKistoznoyDegeneratsii] NVARCHAR (1)   NULL,
    [EhonegativniyObodok]           NVARCHAR (1)   NULL,
    [AkusticheskayaTen]             NVARCHAR (1)   NULL,
    [DannieNaPechat]                NTEXT          NULL,
    [DopolnitelnieObrazovaniya1]    INT            NULL,
    [EhogaficheskiePriznaki]        INT            NULL,
    [DopolnitelnieObrazovaniya2]    NTEXT          NULL,
    [VaskulyarizatsiyaZhelezi]      NVARCHAR (50)  NULL,
    CONSTRAINT [UziShitovidnoyZheleziPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UziShitovidnoyZheleziToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
