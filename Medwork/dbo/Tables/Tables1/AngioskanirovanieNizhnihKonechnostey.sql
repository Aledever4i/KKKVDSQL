﻿CREATE TABLE [dbo].[AngioskanirovanieNizhnihKonechnostey] (
    [ID]                                                     INT           NOT NULL,
    [PatID]                                                  INT           NULL,
    [DataIssledivania]                                       DATETIME      NULL,
    [Prav_PBV_HarakterTromboza]                              NVARCHAR (20) NULL,
    [Prav_PBV_Trombirovana]                                  NVARCHAR (16) NULL,
    [Prav_OBV_HarakterTromboza]                              NVARCHAR (20) NULL,
    [Prav_OBV_Trombirovana]                                  NVARCHAR (16) NULL,
    [Prav_PV_HarakterTromboza]                               NVARCHAR (20) NULL,
    [Prav_PV_Trombirovana]                                   NVARCHAR (16) NULL,
    [Prav_GBV_HarakterTromboza]                              NVARCHAR (20) NULL,
    [Prav_GBV_Trombirovana]                                  NVARCHAR (16) NULL,
    [Prav_GVG_MG_Trombirovana]                               NVARCHAR (16) NULL,
    [Prav_GVG_MG_HarakterTromboza]                           NVARCHAR (20) NULL,
    [Prav_GVG_LG_Trombirovana]                               NVARCHAR (16) NULL,
    [Prav_GVG_LG_HarakterTromboza]                           NVARCHAR (20) NULL,
    [Prav_GVG_KVM_Trombirovana]                              NVARCHAR (16) NULL,
    [Prav_GVG_KVM_HarakterTromboza]                          NVARCHAR (20) NULL,
    [Prav_GVG_ZBBV_Trombirovana]                             NVARCHAR (16) NULL,
    [Prav_GVG_ZBBV_HarakterTromboza]                         NVARCHAR (20) NULL,
    [Prav_SFS_Sost]                                          NVARCHAR (16) NULL,
    [Prav_SFS_Ektazi]                                        NVARCHAR (1)  NULL,
    [Prav_SFS_EktaziyaVOblastiUstevogoOtverstiyaObv]         NVARCHAR (1)  NULL,
    [Prav_SFS_EktaziyaSegmentaBpvPodOstalnimKlapanom]        NVARCHAR (1)  NULL,
    [Prav_SFS_EktaziyaSegmentaBpvPodPreostialnimKlapanom]    NVARCHAR (1)  NULL,
    [Prav_BPV_Trombirovana]                                  NVARCHAR (16) NULL,
    [Prav_BPV_HarakterTromboza]                              NVARCHAR (20) NULL,
    [Prav_BPV_Reflux]                                        NVARCHAR (20) NULL,
    [Prav_BPV_NaBedre]                                       NVARCHAR (8)  NULL,
    [Prav_NPV_Stopi]                                         NVARCHAR (1)  NULL,
    [Prav_NPV_Goleni]                                        NVARCHAR (1)  NULL,
    [Prav_NPV_Lodizhki]                                      NVARCHAR (1)  NULL,
    [Prav_NPV_KolennogoSustava]                              NVARCHAR (1)  NULL,
    [Prav_NPV_Bedra]                                         NVARCHAR (1)  NULL,
    [Prav_NPV_Yagodits]                                      NVARCHAR (1)  NULL,
    [Prav_RPBPV_PoverhnostnayaBolshayaPodkozhnayaVena]       NVARCHAR (1)  NULL,
    [Prav_RPBPV_PerednyayaDobavochnayaPodkozhnayaVena]       NVARCHAR (1)  NULL,
    [Prav_RPBPV_ZadnyayaDobavochnayaBolshayaPodkozhnayaVena] NVARCHAR (1)  NULL,
    [Prav_RPBPV_PerednyayaOkruzhayushayaBedroVena]           NVARCHAR (1)  NULL,
    [Prav_RPBPV_ZadnyayaOkruzhayushayaBedroVena]             NVARCHAR (1)  NULL,
    [Prav_RPBPV_MezhsafennayaIsVenaI]                        NVARCHAR (1)  NULL,
    [Prav_MPV_Trombirovana]                                  NVARCHAR (16) NULL,
    [Prav_MPV_HarakterTromboza]                              NVARCHAR (20) NULL,
    [Prav_MPV_Reflux]                                        NVARCHAR (20) NULL,
    [Prav_Sps_Sotoyatelno]                                   NVARCHAR (20) NULL,
    [Prav_ReflyuksLVS]                                       NVARCHAR (20) NULL,
    [Lev_PBV_HarakterTromboza]                               NVARCHAR (20) NULL,
    [Lev_PBV_Trombirovana]                                   NVARCHAR (16) NULL,
    [Lev_OBV_HarakterTromboza]                               NVARCHAR (20) NULL,
    [Lev_OBV_Trombirovana]                                   NVARCHAR (16) NULL,
    [Lev_PV_HarakterTromboza]                                NVARCHAR (20) NULL,
    [Lev_PV_Trombirovana]                                    NVARCHAR (16) NULL,
    [Lev_GBV_HarakterTromboza]                               NVARCHAR (20) NULL,
    [Lev_GBV_Trombirovana]                                   NVARCHAR (16) NULL,
    [Lev_GVG_MG_Trombirovana]                                NVARCHAR (16) NULL,
    [Lev_GVG_MG_HarakterTromboza]                            NVARCHAR (20) NULL,
    [Lev_GVG_LG_Trombirovana]                                NVARCHAR (16) NULL,
    [Lev_GVG_LG_HarakterTromboza]                            NVARCHAR (20) NULL,
    [Lev_GVG_KVM_Trombirovana]                               NVARCHAR (16) NULL,
    [Lev_GVG_KVM_HarakterTromboza]                           NVARCHAR (20) NULL,
    [Lev_GVG_ZBBV_Trombirovana]                              NVARCHAR (16) NULL,
    [Lev_GVG_ZBBV_HarakterTromboza]                          NVARCHAR (20) NULL,
    [Lev_SFS_Sost]                                           NVARCHAR (16) NULL,
    [Lev_SFS_Ektazi]                                         NVARCHAR (1)  NULL,
    [Lev_SFS_EktaziyaVOblastiUstevogoOtverstiyaObv]          NVARCHAR (1)  NULL,
    [Lev_SFS_EktaziyaSegmentaBpvPodOstalnimKlapanom]         NVARCHAR (1)  NULL,
    [Lev_SFS_EktaziyaSegmentaBpvPodPreostialnimKlapanom]     NVARCHAR (1)  NULL,
    [Lev_BPV_Trombirovana]                                   NVARCHAR (16) NULL,
    [Lev_BPV_HarakterTromboza]                               NVARCHAR (20) NULL,
    [Lev_BPV_Reflux]                                         NVARCHAR (20) NULL,
    [Lev_BPV_NaBedre]                                        NVARCHAR (8)  NULL,
    [Lev_NPV_Stopi]                                          NVARCHAR (1)  NULL,
    [Lev_NPV_Goleni]                                         NVARCHAR (1)  NULL,
    [Lev_NPV_Lodizhki]                                       NVARCHAR (1)  NULL,
    [Lev_NPV_KolennogoSustava]                               NVARCHAR (1)  NULL,
    [Lev_NPV_Bedra]                                          NVARCHAR (1)  NULL,
    [Lev_NPV_Yagodits]                                       NVARCHAR (1)  NULL,
    [Lev_RPBPV_PoverhnostnayaBolshayaPodkozhnayaVena]        NVARCHAR (1)  NULL,
    [Lev_RPBPV_PerednyayaDobavochnayaPodkozhnayaVena]        NVARCHAR (1)  NULL,
    [Lev_RPBPV_ZadnyayaDobavochnayaBolshayaPodkozhnayaVena]  NVARCHAR (1)  NULL,
    [Lev_RPBPV_PerednyayaOkruzhayushayaBedroVena]            NVARCHAR (1)  NULL,
    [Lev_RPBPV_ZadnyayaOkruzhayushayaBedroVena]              NVARCHAR (1)  NULL,
    [Lev_RPBPV_MezhsafennayaIsVenaI]                         NVARCHAR (1)  NULL,
    [Lev_MPV_Trombirovana]                                   NVARCHAR (16) NULL,
    [Lev_MPV_HarakterTromboza]                               NVARCHAR (20) NULL,
    [Lev_MPV_Reflux]                                         NVARCHAR (20) NULL,
    [Lev_Sps_Sotoyatelno]                                    NVARCHAR (20) NULL,
    [Lev_ReflyuksLVS]                                        NVARCHAR (20) NULL,
    [Zakluchenie]                                            NTEXT         NULL,
    [Vrach]                                                  NVARCHAR (50) NULL,
    CONSTRAINT [AngioskanirovanieNizhnihKonechnosteyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AngioskanirovanieNizhnihKonechnosteyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

