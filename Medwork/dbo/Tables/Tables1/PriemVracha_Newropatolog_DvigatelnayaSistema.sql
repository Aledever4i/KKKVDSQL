﻿CREATE TABLE [dbo].[PriemVracha_Newropatolog_DvigatelnayaSistema] (
    [ID]                                INT           NOT NULL,
    [PatID]                             INT           NULL,
    [ProbaBarreV]                       NVARCHAR (50) NULL,
    [ProbaBarreN]                       NVARCHAR (50) NULL,
    [ProbaSProtivoUderj]                NVARCHAR (50) NULL,
    [PronacionnFenomen]                 NVARCHAR (50) NULL,
    [SimptomRotirStopBogolepova]        NVARCHAR (50) NULL,
    [ObjemDvijeniiVKonechnostah]        NVARCHAR (50) NULL,
    [GemiMonoTetraParaParezSpravaVRyke] NTEXT         NULL,
    [GemiMonoTetraParaParezSlevaVNoge]  NTEXT         NULL,
    [GemiMonoTetraParaParezSpravaVNoge] NTEXT         NULL,
    [Gemiparez]                         NVARCHAR (1)  NULL,
    [Monoparez]                         NVARCHAR (1)  NULL,
    [Tetraparez]                        NVARCHAR (1)  NULL,
    [Paraparez]                         NVARCHAR (1)  NULL,
    [GemiMonoTetraParaParezSlevaVRyke]  NVARCHAR (50) NULL,
    [Spasticheskiy]                     NVARCHAR (1)  NULL,
    [Plasticheskiy]                     NVARCHAR (1)  NULL,
    [Memo1]                             NTEXT         NULL,
    [Povishen]                          NVARCHAR (1)  NULL,
    [Snizhen]                           NVARCHAR (1)  NULL,
    [NeIzmenen]                         NVARCHAR (1)  NULL,
    [slevasnighpov]                     NVARCHAR (50) NULL,
    [Bitseps]                           NVARCHAR (1)  NULL,
    [Tritseps]                          NVARCHAR (1)  NULL,
    [Kolenniy]                          NVARCHAR (1)  NULL,
    [Ahillov]                           NVARCHAR (1)  NULL,
    [Ahillov1]                          NVARCHAR (1)  NULL,
    [Kolenniy1]                         NVARCHAR (1)  NULL,
    [spravasnighpov]                    NVARCHAR (50) NULL,
    [Tritseps1]                         NVARCHAR (1)  NULL,
    [Bitseps1]                          NVARCHAR (1)  NULL,
    [SlevaSuxRefl]                      NVARCHAR (1)  NULL,
    [SpravaSuxRefl]                     NVARCHAR (1)  NULL,
    [NeIzmenen1]                        NVARCHAR (1)  NULL,
    [Podborodok]                        NVARCHAR (1)  NULL,
    [YagodMish]                         NVARCHAR (1)  NULL,
    [KolenChash]                        NVARCHAR (1)  NULL,
    [Stopa]                             NVARCHAR (1)  NULL,
    [Podborodok1]                       NVARCHAR (1)  NULL,
    [YagodMish1]                        NVARCHAR (1)  NULL,
    [KolenChash1]                       NVARCHAR (1)  NULL,
    [Stopa1]                            NVARCHAR (1)  NULL,
    [SlevaKlonus]                       NVARCHAR (1)  NULL,
    [SpravaKlonus]                      NVARCHAR (1)  NULL,
    [PeriosRefleksiSleva]               NVARCHAR (50) NULL,
    [PeriosRefleksiSprava]              NVARCHAR (50) NULL,
    [SpravaPeriosRefl]                  NVARCHAR (1)  NULL,
    [SlevaPeriosRefl]                   NVARCHAR (1)  NULL,
    [PoverxnostnieRefleksi]             NVARCHAR (50) NULL,
    [PovRefleksiIzmeneniNeizmeneni]     NVARCHAR (50) NULL,
    [PatalogRazgib]                     NVARCHAR (50) NULL,
    [PatalogSgib]                       NVARCHAR (50) NULL,
    [ZashitnieRefleksi]                 NVARCHAR (50) NULL,
    [TremorPokoi]                       NTEXT         NULL,
    [TremorDvijenie]                    NTEXT         NULL,
    [TremorChastota]                    NVARCHAR (50) NULL,
    [PatologSinkinezii]                 NVARCHAR (50) NULL,
    [Fibrilacii]                        NTEXT         NULL,
    [Gipotrafia]                        NTEXT         NULL,
    [Giperfrofia]                       NTEXT         NULL,
    [Fascikylacii]                      NVARCHAR (50) NULL,
    [Memo2]                             NTEXT         NULL,
    [PovRefleksibrushnie]               NVARCHAR (50) NULL,
    [PovRefleksikremacterniy]           NVARCHAR (50) NULL,
    [PovRefleksipodoshvennie]           NVARCHAR (50) NULL,
    [ReflexJukovskogo]                  NVARCHAR (50) NULL,
    [ReflexSheffera]                    NVARCHAR (50) NULL,
    [ReflexOppengeina]                  NVARCHAR (50) NULL,
    [ReflexGordona]                     NVARCHAR (50) NULL,
    [ReflexBabinskogo]                  NVARCHAR (50) NULL,
    [ReflexYakoconaLaska]               NVARCHAR (50) NULL,
    [ReflexRossolino]                   NVARCHAR (50) NULL,
    [ReflexBehterevaI]                  NVARCHAR (50) NULL,
    [ReflexBehterevaII]                 NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_Newropatolog_DvigatelnayaSistemaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Newropatolog_DvigatelnayaSistemaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
