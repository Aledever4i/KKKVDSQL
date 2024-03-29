﻿CREATE TABLE [dbo].[RekomendatsiiPriVipiske] (
    [ID]                                                          INT           NOT NULL,
    [PatID]                                                       INT           NULL,
    [DispansernoeNablyudenieUUchastkovogoVrachaPoMestuZhitelstva] NVARCHAR (1)  NULL,
    [Dieta]                                                       NVARCHAR (1)  NULL,
    [Rezhim]                                                      NVARCHAR (1)  NULL,
    [OgranichenieFizicheskoyNagruzki]                             NVARCHAR (1)  NULL,
    [Fizioterapiya]                                               NVARCHAR (50) NULL,
    [SanatornoKurortnoeLechenie]                                  NVARCHAR (1)  NULL,
    [TrebuetsyaPovtornayaGospitalizatsiya]                        NVARCHAR (1)  NULL,
    [NeobhodimaKontrolnayaYavka]                                  NVARCHAR (1)  NULL,
    [ProtseduriPreparati]                                         NVARCHAR (1)  NULL,
    [Data]                                                        DATETIME      NULL,
    [Vrach]                                                       NVARCHAR (50) NULL,
    [Dispanserizaciya]                                            NVARCHAR (50) NULL,
    [Mozhno]                                                      NVARCHAR (50) NULL,
    [Nelzya]                                                      NVARCHAR (50) NULL,
    [Regim2]                                                      NVARCHAR (50) NULL,
    [Ogranichenie]                                                NVARCHAR (50) NULL,
    [Fizioterapiya2]                                              NVARCHAR (1)  NULL,
    [Lechenie]                                                    NVARCHAR (50) NULL,
    [Cherez]                                                      INT           NULL,
    [Cherez2]                                                     NVARCHAR (50) NULL,
    [Cherez1]                                                     INT           NULL,
    [Cherez3]                                                     NVARCHAR (50) NULL,
    [Rekomendatsii]                                               NTEXT         NULL,
    CONSTRAINT [RekomendatsiiPriVipiskePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RekomendatsiiPriVipiskeToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

