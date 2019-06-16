﻿CREATE TABLE [dbo].[DupleksnoeSkanirovanieMagistralnihArteriyGoloviIVerhnihKonechnostey] (
    [ID]                             INT           NOT NULL,
    [PatID]                          INT           NULL,
    [Vrach2]                         INT           NULL,
    [zaklprav]                       NTEXT         NULL,
    [zakllev]                        NTEXT         NULL,
    [Data1]                          DATETIME      NULL,
    [DocTime]                        DATETIME      NULL,
    [KrovotokBRSTV]                  NVARCHAR (50) NULL,
    [KrovotokObshSonnaya]            NVARCHAR (50) NULL,
    [KrovotokOblBifurk]              NVARCHAR (50) NULL,
    [KrovotokUstyeVSA]               NVARCHAR (50) NULL,
    [KrovotokVnutrSonnaya]           NVARCHAR (50) NULL,
    [KrovotokNarSonnaya]             NVARCHAR (50) NULL,
    [KrovotokPodkl1otd]              NVARCHAR (50) NULL,
    [KrovotokPozv1otd]               NVARCHAR (50) NULL,
    [KrovotokPozv2otd]               NVARCHAR (50) NULL,
    [KrovotokPozv3otd]               NVARCHAR (50) NULL,
    [KrovotokPodkl2otd]              NVARCHAR (50) NULL,
    [KrovotokPodmish]                NVARCHAR (50) NULL,
    [KrovotokPlechev]                NVARCHAR (50) NULL,
    [Krovotokluchev]                 NVARCHAR (50) NULL,
    [Krovotokloktev]                 NVARCHAR (50) NULL,
    [Krovotokartkisti]               NVARCHAR (50) NULL,
    [IzmenenieStBrStv]               NVARCHAR (50) NULL,
    [IzmenenieStObshSonnaya]         NVARCHAR (50) NULL,
    [IzmenenieStOblbifurk]           NVARCHAR (50) NULL,
    [IzmenenieStUstyeVSA]            NVARCHAR (50) NULL,
    [IzmenenieStVnutrSonnaya]        NVARCHAR (50) NULL,
    [IzmenenieStNarSonnaya]          NVARCHAR (50) NULL,
    [IzmenenieStPodkl1otd]           NVARCHAR (50) NULL,
    [IzmenenieStPozv1otd]            NVARCHAR (50) NULL,
    [IzmenenieStPozv2otd]            NVARCHAR (50) NULL,
    [IzmenenieStPozv3otd]            NVARCHAR (50) NULL,
    [IzmenenieStPodkl2otd]           NVARCHAR (50) NULL,
    [IzmenenieStPodmish]             NVARCHAR (50) NULL,
    [IzmenenieStPlechevArt]          NVARCHAR (50) NULL,
    [IzmenenieStLuchevArt]           NVARCHAR (50) NULL,
    [IzmenenieStArtKisti]            NVARCHAR (50) NULL,
    [IzmenenieStloktev]              NVARCHAR (50) NULL,
    [StenozBrStv]                    FLOAT (53)    NULL,
    [StenozObshSonnaya]              FLOAT (53)    NULL,
    [StenozOblBifurkacii]            FLOAT (53)    NULL,
    [StenozUstyeVSA]                 FLOAT (53)    NULL,
    [StenozVnutrSonnaya]             FLOAT (53)    NULL,
    [StenozNarSonnaya]               FLOAT (53)    NULL,
    [StenozPodkl1otd]                FLOAT (53)    NULL,
    [StenozPozv1otd]                 FLOAT (53)    NULL,
    [StenozPozv2otd]                 FLOAT (53)    NULL,
    [StenozPozv3otd]                 FLOAT (53)    NULL,
    [StenozPodkl2otd]                FLOAT (53)    NULL,
    [StenozPodmish]                  FLOAT (53)    NULL,
    [StenozPlechevArter]             FLOAT (53)    NULL,
    [Stenozluchev]                   FLOAT (53)    NULL,
    [Stenozloktev]                   FLOAT (53)    NULL,
    [Stenozarterkisti]               FLOAT (53)    NULL,
    [NalichieIzvitostiBrStv]         NVARCHAR (50) NULL,
    [NalichieIzvitostiObshSonnaya]   NVARCHAR (50) NULL,
    [NalichieIzvitostiOblBifurk]     NVARCHAR (50) NULL,
    [NalichieIzvitostiUstyeVSA]      NVARCHAR (50) NULL,
    [NalichieIzvitostiVnutrSonnaya]  NVARCHAR (50) NULL,
    [NalichieIzvitostiNarSonnaya]    NVARCHAR (50) NULL,
    [NalichieIzvitostiPodkl1otd]     NVARCHAR (50) NULL,
    [NalichieIzvitostiPozv1otd]      NVARCHAR (50) NULL,
    [NalichieIzvitostiPozv2otd]      NVARCHAR (50) NULL,
    [NalichieIzvitostiPozv3otd]      NVARCHAR (50) NULL,
    [NalichieIzvitostiPodkl2otd]     NVARCHAR (50) NULL,
    [NalichieIzvitostiPodmish]       NVARCHAR (50) NULL,
    [NalichieIzvitostiPlechevArter]  NVARCHAR (50) NULL,
    [NalichieIzvitostiLuchev]        NVARCHAR (50) NULL,
    [NalichieIzvitostiLoktev]        NVARCHAR (50) NULL,
    [NalichieIzvitostiArterKisti]    NVARCHAR (50) NULL,
    [DoStenozBrStv]                  FLOAT (53)    NULL,
    [DoStenozObshSonnaya]            FLOAT (53)    NULL,
    [DoStenozOblBifurkacii]          FLOAT (53)    NULL,
    [DoStenozUstyeVSA]               FLOAT (53)    NULL,
    [DoStenozVnutrSonnaya]           FLOAT (53)    NULL,
    [DoStenozNarSonnaya]             FLOAT (53)    NULL,
    [DoStenozPodkl1otd]              FLOAT (53)    NULL,
    [DoStenozPozv1otd]               FLOAT (53)    NULL,
    [DoStenozPozv2otd]               FLOAT (53)    NULL,
    [DoStenozPozv3otd]               FLOAT (53)    NULL,
    [DoStenozPodkl2otd]              FLOAT (53)    NULL,
    [DoStenozPodmish]                FLOAT (53)    NULL,
    [DoStenozPlechevArter]           FLOAT (53)    NULL,
    [DoStenozluchev]                 FLOAT (53)    NULL,
    [DoStenozloktev]                 FLOAT (53)    NULL,
    [DoStenozarterkisti]             FLOAT (53)    NULL,
    [NaStenozBrStv]                  FLOAT (53)    NULL,
    [NaStenozObshSonnaya]            FLOAT (53)    NULL,
    [NaStenozOblBifurkacii]          FLOAT (53)    NULL,
    [NaStenozPozv2otd]               FLOAT (53)    NULL,
    [NaStenozPodkl2otd]              FLOAT (53)    NULL,
    [NaStenozluchev]                 FLOAT (53)    NULL,
    [NaStenozloktev]                 FLOAT (53)    NULL,
    [NaStenozarterkisti]             FLOAT (53)    NULL,
    [NaStenozPlechevArter]           FLOAT (53)    NULL,
    [NaStenozPodmish]                FLOAT (53)    NULL,
    [NaStenozPozv3otd]               FLOAT (53)    NULL,
    [NaStenozPozv1otd]               FLOAT (53)    NULL,
    [NaStenozNarSonnaya]             FLOAT (53)    NULL,
    [NaStenozPodkl1otd]              FLOAT (53)    NULL,
    [NaStenozVnutrSonnaya]           FLOAT (53)    NULL,
    [NaStenozUstyeVSA]               FLOAT (53)    NULL,
    [PosleStenozBrStv]               FLOAT (53)    NULL,
    [PosleStenozObshSonnaya]         FLOAT (53)    NULL,
    [PosleStenozOblBifurkacii]       FLOAT (53)    NULL,
    [PosleStenozPozv2otd]            FLOAT (53)    NULL,
    [PosleStenozPodkl2otd]           FLOAT (53)    NULL,
    [PosleStenozluchev]              FLOAT (53)    NULL,
    [PosleStenozloktev]              FLOAT (53)    NULL,
    [PosleStenozarterkisti]          FLOAT (53)    NULL,
    [PosleStenozPlechevArter]        FLOAT (53)    NULL,
    [PosleStenozPodmish]             FLOAT (53)    NULL,
    [PosleStenozPozv3otd]            FLOAT (53)    NULL,
    [PosleStenozPozv1otd]            FLOAT (53)    NULL,
    [PosleStenozNarSonnaya]          FLOAT (53)    NULL,
    [PosleStenozPodkl1otd]           FLOAT (53)    NULL,
    [PosleStenozVnutrSonnaya]        FLOAT (53)    NULL,
    [PosleStenozUstyeVSA]            FLOAT (53)    NULL,
    [DopolnitelnoBrStv]              NVARCHAR (50) NULL,
    [DopolnitelnoObshSonnaya]        NVARCHAR (50) NULL,
    [DopolnitelnoOblBifurk]          NVARCHAR (50) NULL,
    [DopolnitelnoUstyeVSA]           NVARCHAR (50) NULL,
    [DopolnitelnoPozv1otd]           NVARCHAR (50) NULL,
    [DopolnitelnoPodkl1otd]          NVARCHAR (50) NULL,
    [DopolnitelnoNarujnayaSonnaya]   NVARCHAR (50) NULL,
    [DopolnitelnoVnutrSonnaya]       NVARCHAR (50) NULL,
    [DopolnitelnoPodmish]            NVARCHAR (50) NULL,
    [DopolnitelnoPodkl2otd]          NVARCHAR (50) NULL,
    [DopolnitelnoPozv3otd]           NVARCHAR (50) NULL,
    [DopolnitelnoPozv2otd]           NVARCHAR (50) NULL,
    [DopolnitelnoArterKisti]         NVARCHAR (50) NULL,
    [DopolnitelnoLoktev]             NVARCHAR (50) NULL,
    [DopolnitelnoLuchev]             NVARCHAR (50) NULL,
    [DopolnitelnoPlechevArter]       NVARCHAR (50) NULL,
    [KrovotokBRSTV1]                 NVARCHAR (50) NULL,
    [KrovotokObshSonnaya1]           NVARCHAR (50) NULL,
    [KrovotokOblBifurk1]             NVARCHAR (50) NULL,
    [KrovotokUstyeVSA1]              NVARCHAR (50) NULL,
    [KrovotokVnutrSonnaya1]          NVARCHAR (50) NULL,
    [KrovotokNarSonnaya1]            NVARCHAR (50) NULL,
    [KrovotokPodkl1otd1]             NVARCHAR (50) NULL,
    [KrovotokPozv1otd1]              NVARCHAR (50) NULL,
    [KrovotokPozv2otd1]              NVARCHAR (50) NULL,
    [KrovotokPozv3otd1]              NVARCHAR (50) NULL,
    [KrovotokPodkl2otd1]             NVARCHAR (50) NULL,
    [KrovotokPodmish1]               NVARCHAR (50) NULL,
    [KrovotokPlechev1]               NVARCHAR (50) NULL,
    [Krovotokluchev1]                NVARCHAR (50) NULL,
    [Krovotokloktev1]                NVARCHAR (50) NULL,
    [Krovotokartkisti1]              NVARCHAR (50) NULL,
    [IzmenenieStBrStv1]              NVARCHAR (50) NULL,
    [IzmenenieStObshSonnaya1]        NVARCHAR (50) NULL,
    [IzmenenieStOblbifurk1]          NVARCHAR (50) NULL,
    [IzmenenieStUstyeVSA1]           NVARCHAR (50) NULL,
    [IzmenenieStVnutrSonnaya1]       NVARCHAR (50) NULL,
    [IzmenenieStNarSonnaya1]         NVARCHAR (50) NULL,
    [IzmenenieStPodkl1otd1]          NVARCHAR (50) NULL,
    [IzmenenieStPozv1otd1]           NVARCHAR (50) NULL,
    [IzmenenieStPozv2otd1]           NVARCHAR (50) NULL,
    [IzmenenieStPozv3otd1]           NVARCHAR (50) NULL,
    [IzmenenieStPodkl2otd1]          NVARCHAR (50) NULL,
    [IzmenenieStPodmish1]            NVARCHAR (50) NULL,
    [IzmenenieStPlechevArt1]         NVARCHAR (50) NULL,
    [IzmenenieStLuchevArt1]          NVARCHAR (50) NULL,
    [IzmenenieStArtKisti1]           NVARCHAR (50) NULL,
    [IzmenenieStloktev1]             NVARCHAR (50) NULL,
    [StenozBrStv1]                   FLOAT (53)    NULL,
    [StenozObshSonnaya1]             FLOAT (53)    NULL,
    [StenozOblBifurkacii1]           FLOAT (53)    NULL,
    [StenozUstyeVSA1]                FLOAT (53)    NULL,
    [StenozVnutrSonnaya1]            FLOAT (53)    NULL,
    [StenozNarSonnaya1]              FLOAT (53)    NULL,
    [StenozPodkl1otd1]               FLOAT (53)    NULL,
    [StenozPozv1otd1]                FLOAT (53)    NULL,
    [StenozPozv2otd1]                FLOAT (53)    NULL,
    [StenozPozv3otd1]                FLOAT (53)    NULL,
    [StenozPodkl2otd1]               FLOAT (53)    NULL,
    [StenozPodmish1]                 FLOAT (53)    NULL,
    [StenozPlechevArter1]            FLOAT (53)    NULL,
    [Stenozluchev1]                  FLOAT (53)    NULL,
    [Stenozloktev1]                  FLOAT (53)    NULL,
    [Stenozarterkisti1]              FLOAT (53)    NULL,
    [NalichieIzvitostiBrStv1]        NVARCHAR (50) NULL,
    [NalichieIzvitostiObshSonnaya1]  NVARCHAR (50) NULL,
    [NalichieIzvitostiOblBifurk1]    NVARCHAR (50) NULL,
    [NalichieIzvitostiUstyeVSA1]     NVARCHAR (50) NULL,
    [NalichieIzvitostiVnutrSonnaya1] NVARCHAR (50) NULL,
    [NalichieIzvitostiNarSonnaya1]   NVARCHAR (50) NULL,
    [NalichieIzvitostiPodkl1otd1]    NVARCHAR (50) NULL,
    [NalichieIzvitostiPozv1otd1]     NVARCHAR (50) NULL,
    [NalichieIzvitostiPozv2otd1]     NVARCHAR (50) NULL,
    [NalichieIzvitostiPozv3otd1]     NVARCHAR (50) NULL,
    [NalichieIzvitostiPodkl2otd1]    NVARCHAR (50) NULL,
    [NalichieIzvitostiPodmish1]      NVARCHAR (50) NULL,
    [NalichieIzvitostiPlechevArter1] NVARCHAR (50) NULL,
    [NalichieIzvitostiLuchev1]       NVARCHAR (50) NULL,
    [NalichieIzvitostiLoktev1]       NVARCHAR (50) NULL,
    [NalichieIzvitostiArterKisti1]   NVARCHAR (50) NULL,
    [DoStenozBrStv1]                 FLOAT (53)    NULL,
    [DoStenozObshSonnaya1]           FLOAT (53)    NULL,
    [DoStenozOblBifurkacii1]         FLOAT (53)    NULL,
    [DoStenozUstyeVSA1]              FLOAT (53)    NULL,
    [DoStenozVnutrSonnaya1]          FLOAT (53)    NULL,
    [DoStenozNarSonnaya1]            FLOAT (53)    NULL,
    [DoStenozPodkl1otd1]             FLOAT (53)    NULL,
    [DoStenozPozv1otd1]              FLOAT (53)    NULL,
    [DoStenozPozv2otd1]              FLOAT (53)    NULL,
    [DoStenozPozv3otd1]              FLOAT (53)    NULL,
    [DoStenozPodkl2otd1]             FLOAT (53)    NULL,
    [DoStenozPodmish1]               FLOAT (53)    NULL,
    [DoStenozPlechevArter1]          FLOAT (53)    NULL,
    [DoStenozluchev1]                FLOAT (53)    NULL,
    [DoStenozloktev1]                FLOAT (53)    NULL,
    [DoStenozarterkisti1]            FLOAT (53)    NULL,
    [NaStenozBrStv1]                 FLOAT (53)    NULL,
    [NaStenozObshSonnaya1]           FLOAT (53)    NULL,
    [NaStenozOblBifurkacii1]         FLOAT (53)    NULL,
    [NaStenozPozv2otd1]              FLOAT (53)    NULL,
    [NaStenozPodkl2otd1]             FLOAT (53)    NULL,
    [NaStenozluchev1]                FLOAT (53)    NULL,
    [NaStenozloktev1]                FLOAT (53)    NULL,
    [NaStenozarterkisti1]            FLOAT (53)    NULL,
    [NaStenozPlechevArter1]          FLOAT (53)    NULL,
    [NaStenozPodmish1]               FLOAT (53)    NULL,
    [NaStenozPozv3otd1]              FLOAT (53)    NULL,
    [NaStenozPozv1otd1]              FLOAT (53)    NULL,
    [NaStenozNarSonnaya1]            FLOAT (53)    NULL,
    [NaStenozPodkl1otd1]             FLOAT (53)    NULL,
    [NaStenozVnutrSonnaya1]          FLOAT (53)    NULL,
    [NaStenozUstyeVSA1]              FLOAT (53)    NULL,
    [PosleStenozBrStv1]              FLOAT (53)    NULL,
    [PosleStenozObshSonnaya1]        FLOAT (53)    NULL,
    [PosleStenozOblBifurkacii1]      FLOAT (53)    NULL,
    [PosleStenozPozv2otd1]           FLOAT (53)    NULL,
    [PosleStenozPodkl2otd1]          FLOAT (53)    NULL,
    [PosleStenozluchev1]             FLOAT (53)    NULL,
    [PosleStenozloktev1]             FLOAT (53)    NULL,
    [PosleStenozarterkisti1]         FLOAT (53)    NULL,
    [PosleStenozPlechevArter1]       FLOAT (53)    NULL,
    [PosleStenozPodmish1]            FLOAT (53)    NULL,
    [PosleStenozPozv3otd1]           FLOAT (53)    NULL,
    [PosleStenozPozv1otd1]           FLOAT (53)    NULL,
    [PosleStenozNarSonnaya1]         FLOAT (53)    NULL,
    [PosleStenozPodkl1otd1]          FLOAT (53)    NULL,
    [PosleStenozVnutrSonnaya1]       FLOAT (53)    NULL,
    [PosleStenozUstyeVSA1]           FLOAT (53)    NULL,
    [DopolnitelnoBrStv1]             NVARCHAR (50) NULL,
    [DopolnitelnoObshSonnaya1]       NVARCHAR (50) NULL,
    [DopolnitelnoOblBifurk1]         NVARCHAR (50) NULL,
    [DopolnitelnoUstyeVSA1]          NVARCHAR (50) NULL,
    [DopolnitelnoPozv1otd1]          NVARCHAR (50) NULL,
    [DopolnitelnoPodkl1otd1]         NVARCHAR (50) NULL,
    [DopolnitelnoNarujnayaSonnaya1]  NVARCHAR (50) NULL,
    [DopolnitelnoVnutrSonnaya1]      NVARCHAR (50) NULL,
    [DopolnitelnoPodmish1]           NVARCHAR (50) NULL,
    [DopolnitelnoPodkl2otd1]         NVARCHAR (50) NULL,
    [DopolnitelnoPozv3otd1]          NVARCHAR (50) NULL,
    [DopolnitelnoPozv2otd1]          NVARCHAR (50) NULL,
    [DopolnitelnoArterKisti1]        NVARCHAR (50) NULL,
    [DopolnitelnoLoktev1]            NVARCHAR (50) NULL,
    [DopolnitelnoLuchev1]            NVARCHAR (50) NULL,
    [DopolnitelnoPlechevArter1]      NVARCHAR (50) NULL,
    CONSTRAINT [DupleksnoeSkanirovanieMagistralnihArteriyGoloviIVerhnihKonechnosteyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DupleksnoeSkanirovanieMagistralnihArteriyGoloviIVerhnihKonechnosteyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

