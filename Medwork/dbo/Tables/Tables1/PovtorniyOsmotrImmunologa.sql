﻿CREATE TABLE [dbo].[PovtorniyOsmotrImmunologa] (
    [ID]                                                            INT           NOT NULL,
    [PatID]                                                         INT           NULL,
    [Zhalobi]                                                       NTEXT         NULL,
    [Anamnez]                                                       NTEXT         NULL,
    [Kozha1]                                                        NVARCHAR (50) NULL,
    [Kozha]                                                         NVARCHAR (50) NULL,
    [LU]                                                            NVARCHAR (50) NULL,
    [Sustavi]                                                       NVARCHAR (50) NULL,
    [Sustavi1]                                                      NVARCHAR (50) NULL,
    [Zev]                                                           NVARCHAR (50) NULL,
    [Mindalini]                                                     NVARCHAR (50) NULL,
    [Mindal]                                                        NVARCHAR (50) NULL,
    [Dihanie]                                                       NVARCHAR (50) NULL,
    [Hripi]                                                         NVARCHAR (50) NULL,
    [PritupleniePerkutornogoZvukaVOblasti]                          NVARCHAR (50) NULL,
    [ToniSerdtsa]                                                   NVARCHAR (50) NULL,
    [ToniSerdtsa1]                                                  NVARCHAR (50) NULL,
    [shumsist]                                                      NVARCHAR (50) NULL,
    [AktsentIITonaNaAorte]                                          NVARCHAR (1)  NULL,
    [ShumSistolicheskiyNaVerhushkeVoIIMezhrebereSprava]             NVARCHAR (1)  NULL,
    [DiastolicheskiyNaVerhushkeVTochkeBotkinaIIIIIVToniNaVerhushke] NVARCHAR (1)  NULL,
    [Puls]                                                          INT           NULL,
    [AdSidya1]                                                      INT           NULL,
    [AdSidya]                                                       INT           NULL,
    [AdLZha]                                                        INT           NULL,
    [AdLZha1]                                                       INT           NULL,
    [Napolneniya]                                                   NVARCHAR (50) NULL,
    [Napolneniya1]                                                  NVARCHAR (50) NULL,
    [Yazik]                                                         NVARCHAR (50) NULL,
    [Yazik1]                                                        NVARCHAR (50) NULL,
    [Yazik2]                                                        NVARCHAR (50) NULL,
    [Zhivot1]                                                       NVARCHAR (50) NULL,
    [Zhivot]                                                        NVARCHAR (50) NULL,
    [PriPalpatsiiBoleznennost]                                      NVARCHAR (1)  NULL,
    [PriPalpatsiiBoleznennost5]                                     NVARCHAR (1)  NULL,
    [PriPalpatsiiBoleznennost4]                                     NVARCHAR (50) NULL,
    [PriPalpatsiiBoleznennost1]                                     NVARCHAR (50) NULL,
    [DictCombo1]                                                    NVARCHAR (50) NULL,
    [PriPalpatsiiBoleznennost2]                                     NVARCHAR (50) NULL,
    [PriPalpatsiiBoleznennost3]                                     NVARCHAR (50) NULL,
    [MishechnayaZashita]                                            NVARCHAR (50) NULL,
    [Pechen]                                                        NVARCHAR (50) NULL,
    [OtKi]                                                          NVARCHAR (50) NULL,
    [VistupaetIzPodreberyaNa]                                       INT           NULL,
    [Kray]                                                          NVARCHAR (50) NULL,
    [Kray1]                                                         NVARCHAR (50) NULL,
    [Mocheispuskanie]                                               NVARCHAR (50) NULL,
    [Mocheispuskanie1]                                              NVARCHAR (50) NULL,
    [DopolnitelnieDannie]                                           NTEXT         NULL,
    [GruppaDNablyudeniyaD1D2D3]                                     NVARCHAR (50) NULL,
    [Srok]                                                          DATETIME      NULL,
    [BLNomer]                                                       INT           NULL,
    [AktivnoePoseshenie]                                            NVARCHAR (50) NULL,
    [PovtornayaYavka]                                               DATETIME      NULL,
    [EditBox1]                                                      NVARCHAR (50) NULL,
    [Combo1]                                                        NVARCHAR (50) NULL,
    [Combo2]                                                        NVARCHAR (50) NULL,
    [Combo3]                                                        NVARCHAR (50) NULL,
    [EditBox2]                                                      INT           NULL,
    [Combo4]                                                        NVARCHAR (50) NULL,
    [Memo1]                                                         NTEXT         NULL,
    [Vrach]                                                         INT           NULL,
    [Data]                                                          DATETIME      NULL,
    CONSTRAINT [PovtorniyOsmotrImmunologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyOsmotrImmunologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

