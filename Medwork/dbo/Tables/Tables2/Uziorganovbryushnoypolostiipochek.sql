﻿CREATE TABLE [dbo].[Uziorganovbryushnoypolostiipochek] (
    [ID]                                INT           NOT NULL,
    [PatID]                             INT           NULL,
    [KKR]                               FLOAT (53)    NULL,
    [Kvr]                               FLOAT (53)    NULL,
    [VorotnayaVena]                     FLOAT (53)    NULL,
    [StrukturaParenhimi]                NVARCHAR (15) NULL,
    [Vnutripechenochnieprotoki]         NVARCHAR (15) NULL,
    [exogennost]                        NVARCHAR (50) NULL,
    [Razmeri]                           NVARCHAR (15) NULL,
    [ZaklyucheniePechen]                NTEXT         NULL,
    [Stenki]                            FLOAT (53)    NULL,
    [holedoh]                           FLOAT (53)    NULL,
    [RazmeriJelchniyPuzir]              FLOAT (53)    NULL,
    [RazmeriJelchniyPuzir1]             FLOAT (53)    NULL,
    [RazmeriJelchniyPuzir2]             FLOAT (53)    NULL,
    [NeUtolsheni]                       NVARCHAR (12) NULL,
    [soderjimoe]                        NVARCHAR (50) NULL,
    [NeSoderzhit]                       NVARCHAR (12) NULL,
    [ZaklyuchenieJelchniyPuzir]         NTEXT         NULL,
    [Hvost]                             FLOAT (53)    NULL,
    [Telo]                              FLOAT (53)    NULL,
    [Golovka]                           FLOAT (53)    NULL,
    [NeChetkie]                         NVARCHAR (12) NULL,
    [Nerashiren]                        NVARCHAR (12) NULL,
    [ZaklyucheniePodjeludochnayajeleza] NTEXT         NULL,
    [Structura]                         NTEXT         NULL,
    [RazmeriSelezenka]                  FLOAT (53)    NULL,
    [RazmeriSelezenka1]                 FLOAT (53)    NULL,
    [RazmeriSelezenka2]                 FLOAT (53)    NULL,
    [ZaklyuchenieSelezenka]             NTEXT         NULL,
    [NechetkieSelezenka]                NVARCHAR (12) NULL,
    [srtucturaselezenka]                NVARCHAR (20) NULL,
    [nerashirena]                       NVARCHAR (14) NULL,
    [RazmeriPockiP]                     FLOAT (53)    NULL,
    [RazmeriPockiP1]                    FLOAT (53)    NULL,
    [RazmeriPockiP2]                    FLOAT (53)    NULL,
    [NeSoderzhitPochkiP]                NVARCHAR (12) NULL,
    [ZaklyucheniePochkiP]               NTEXT         NULL,
    [PodvizhnaPriDihanii]               NVARCHAR (50) NULL,
    [NeSmeshena]                        NVARCHAR (12) NULL,
    [Parenhima]                         FLOAT (53)    NULL,
    [NeIzmenen]                         NVARCHAR (12) NULL,
    [CHLS]                              NVARCHAR (15) NULL,
    [RazmeriPockiL]                     FLOAT (53)    NULL,
    [RazmeriPockiL1]                    FLOAT (53)    NULL,
    [RazmeriPockiL2]                    FLOAT (53)    NULL,
    [PodvizhnaPriDihaniiL]              NVARCHAR (50) NULL,
    [NeSmeshenaL]                       NVARCHAR (12) NULL,
    [NeIzmenenL]                        NVARCHAR (12) NULL,
    [NeSoderzhitPochkiL]                NVARCHAR (12) NULL,
    [ParenhimaL]                        FLOAT (53)    NULL,
    [CHLSL]                             NVARCHAR (15) NULL,
    [ZaklyucheniePochkiP1]              NTEXT         NULL,
    [Zaklyuchenie]                      NTEXT         NULL,
    [Vrach1]                            NVARCHAR (50) NULL,
    [Data2]                             DATETIME      NULL,
    [OpNumber]                          INT           NULL,
    [IssledovaniePecheniProvodilos]     BIT           NULL,
    [IssledovanieJP]                    BIT           NULL,
    [IssledovaniePJel]                  BIT           NULL,
    [IssledovanieSel]                   BIT           NULL,
    [IssledovaniePochkiPrav]            BIT           NULL,
    [IssledovaniePochkiLev]             BIT           NULL,
    CONSTRAINT [UziorganovbryushnoypolostiipochekPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UziorganovbryushnoypolostiipochekToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

