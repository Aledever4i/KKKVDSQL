﻿CREATE TABLE [dbo].[Ehokg] (
    [ID]                              INT           NOT NULL,
    [PatID]                           INT           NULL,
    [NomerIssledovaniya]              INT           NULL,
    [DataIssledovanie]                DATETIME      NULL,
    [Chss]                            INT           NULL,
    [Ritm]                            INT           NULL,
    [PraviyZheludochek]               FLOAT (53)    NULL,
    [LevoePredserdie]                 FLOAT (53)    NULL,
    [PravoePredserdie]                FLOAT (53)    NULL,
    [Perikard]                        NVARCHAR (70) NULL,
    [Kdr]                             FLOAT (53)    NULL,
    [Kdo]                             FLOAT (53)    NULL,
    [Ksr]                             FLOAT (53)    NULL,
    [Kso]                             FLOAT (53)    NULL,
    [UdarniyObem]                     FLOAT (53)    NULL,
    [MinutniyObem]                    FLOAT (53)    NULL,
    [FraktsiyaVibrosa]                FLOAT (53)    NULL,
    [FraktsiyaUkorochena]             FLOAT (53)    NULL,
    [MassaLzh]                        INT           NULL,
    [IndeksMlzhSPoverhnTela]          FLOAT (53)    NULL,
    [DiastolicheskayaTolshina]        FLOAT (53)    NULL,
    [AmplitudaDvizheniya]             FLOAT (53)    NULL,
    [Zoni]                            NVARCHAR (50) NULL,
    [Gipokinezii]                     NVARCHAR (1)  NULL,
    [Akinezii]                        NVARCHAR (1)  NULL,
    [Diskinezii]                      NVARCHAR (1)  NULL,
    [DiastolicheskayaFunktsiya]       INT           NULL,
    [Chss1]                           INT           NULL,
    [Ritm1]                           INT           NULL,
    [PraviyZheludochek1]              FLOAT (53)    NULL,
    [LevoePredserdie1]                FLOAT (53)    NULL,
    [PravoePredserdie1]               FLOAT (53)    NULL,
    [Perikard1]                       NVARCHAR (70) NULL,
    [Kdr1]                            FLOAT (53)    NULL,
    [Kdo1]                            FLOAT (53)    NULL,
    [Ksr1]                            FLOAT (53)    NULL,
    [Kso1]                            FLOAT (53)    NULL,
    [UdarniyObem1]                    FLOAT (53)    NULL,
    [MinutniyObem1]                   FLOAT (53)    NULL,
    [FraktsiyaVibrosa1]               FLOAT (53)    NULL,
    [FraktsiyaUkorochena1]            FLOAT (53)    NULL,
    [MassaLzh1]                       INT           NULL,
    [IndeksMlzhSPoverhnTela1]         FLOAT (53)    NULL,
    [DiastolicheskayaTolshina1]       FLOAT (53)    NULL,
    [AmplitudaDvizheniya1]            FLOAT (53)    NULL,
    [Zoni1]                           NVARCHAR (50) NULL,
    [Gipokinezii1]                    NVARCHAR (1)  NULL,
    [Akinezii1]                       NVARCHAR (1)  NULL,
    [Diskinezii1]                     NVARCHAR (1)  NULL,
    [DiastolicheskayaFunktsiya1]      INT           NULL,
    [DiastolicheskayaTolshina2]       FLOAT (53)    NULL,
    [DvizhenieStvorok]                INT           NULL,
    [ProtivofazaEst]                  NVARCHAR (1)  NULL,
    [IzmenenieStvorok]                INT           NULL,
    [PodklapannieSrasheniya]          NVARCHAR (1)  NULL,
    [SpaykiPoKomissuram]              NVARCHAR (1)  NULL,
    [Kaltsinoz]                       INT           NULL,
    [Regurgitatsiya]                  INT           NULL,
    [PloshadOtverstiya]               FLOAT (53)    NULL,
    [GradientDavleniyaVKlapane]       INT           NULL,
    [Osobennosti]                     NTEXT         NULL,
    [DiametrNaUrovneKlapana]          FLOAT (53)    NULL,
    [RashozhdenieStvorok]             FLOAT (53)    NULL,
    [IzmenenieStvorokAK]              INT           NULL,
    [SpaykiPoKomissuramAK]            NVARCHAR (1)  NULL,
    [PodklapannieSrasheniyaAK]        NVARCHAR (1)  NULL,
    [KaltsinozAK]                     INT           NULL,
    [RegurgitatsiyaAK]                INT           NULL,
    [GradientDavleniyaVKlapaneAK]     INT           NULL,
    [SkorostKrovotoka]                FLOAT (53)    NULL,
    [OsobennostiAK]                   NTEXT         NULL,
    [PorazhenieStvorok]               NVARCHAR (1)  NULL,
    [DiametrVoshodyashegoOtdelaAorti] FLOAT (53)    NULL,
    [PorazhenieStvorokTK]             NVARCHAR (1)  NULL,
    [RegurgitatsiyaTK]                INT           NULL,
    [GradientDavleniyaVKlapaneTK]     INT           NULL,
    [SkorostKrovotokaTK]              FLOAT (53)    NULL,
    [OsobennostiTK]                   NTEXT         NULL,
    [PorazhenieStvorokKLS]            NVARCHAR (1)  NULL,
    [RegurgitatsiyaKLS]               INT           NULL,
    [GradientDavleniyaVKlapaneKLS]    INT           NULL,
    [SkorostKrovotokaKLS]             FLOAT (53)    NULL,
    [OsobennostiKLS]                  NTEXT         NULL,
    [Zaklyuchenie]                    NTEXT         NULL,
    [RekomendovannoEhoKsVDinamike1]   NVARCHAR (1)  NULL,
    [Vrach]                           INT           NULL,
    CONSTRAINT [EhokgPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [EhokgToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

