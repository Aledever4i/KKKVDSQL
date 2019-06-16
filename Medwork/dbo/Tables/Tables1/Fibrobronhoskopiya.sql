﻿CREATE TABLE [dbo].[Fibrobronhoskopiya] (
    [ID]                                             INT           NOT NULL,
    [PatID]                                          INT           NULL,
    [NomerIssledovaniya]                             INT           NULL,
    [DataIssledovanie]                               DATETIME      NULL,
    [Vrach]                                          INT           NULL,
    [FibrobronhoskopiyaMAPremedikatsiya]             INT           NULL,
    [PosleSootPodgotovkiTubusFibrobronhoskopa]       INT           NULL,
    [ProsvetTrahei]                                  INT           NULL,
    [ProsvetTrahei1]                                 INT           NULL,
    [Karina]                                         INT           NULL,
    [Karina1]                                        INT           NULL,
    [Endobronhit]                                    NVARCHAR (1)  NULL,
    [Slizistaya]                                     INT           NULL,
    [Lokalizatsiya]                                  INT           NULL,
    [Skladchatost]                                   INT           NULL,
    [SosudistiyRisunok]                              INT           NULL,
    [Sekretsiya]                                     INT           NULL,
    [Sekret]                                         INT           NULL,
    [ElastichnostStenokBronhov]                      INT           NULL,
    [MezhbronhialnieShpori]                          INT           NULL,
    [KalibrUstevBronhov]                             INT           NULL,
    [KalibrUstevBronhov1]                            INT           NULL,
    [DihatelnieDvizheniya]                           INT           NULL,
    [PilevoyBronhitPnevmokoniozi]                    NVARCHAR (1)  NULL,
    [SlizistayaObolochka]                            INT           NULL,
    [RezkoVibuhayushieHryashevieKoltsa]              NVARCHAR (1)  NULL,
    [UmerennoVibuhayushieHryashevieKoltsa]           NVARCHAR (1)  NULL,
    [VpadiniMezhhryashevihProstranstv]               NVARCHAR (1)  NULL,
    [UchastkiPilevoyPigmentatsiiSlizistoyObolochki]  INT           NULL,
    [VivodnieProtokiBronhialnihZhelez]               INT           NULL,
    [VivodnieProtokiBronhialnihZhelez1]              INT           NULL,
    [UstyaEtihBronhovRasshireni]                     INT           NULL,
    [Sekret1]                                        INT           NULL,
    [ElastichnostStenokBronhov1]                     INT           NULL,
    [ShporiRasplastaniIstoncheni]                    NVARCHAR (1)  NULL,
    [SosudistiyRisunok1]                             INT           NULL,
    [SkladchatostSlizistoy]                          INT           NULL,
    [Opuhol]                                         INT           NULL,
    [SlizistayaObolochkaOpuxol]                      INT           NULL,
    [VProsvete]                                      INT           NULL,
    [VProsvete1]                                     INT           NULL,
    [Ustya]                                          NVARCHAR (30) NULL,
    [Ustya1]                                         INT           NULL,
    [Ustya2]                                         INT           NULL,
    [Opredelyaetsya]                                 INT           NULL,
    [Poverhnost]                                     INT           NULL,
    [Obturatsiya]                                    INT           NULL,
    [ObrazovaniePokrito]                             INT           NULL,
    [PorazhenniyUchastokPokrit]                      INT           NULL,
    [Krovotochit]                                    INT           NULL,
    [PriPalpatsiiBiopsiynimiShiptsami]               INT           NULL,
    [OpredelyaetsyaSindromMertvogoUstya]             NVARCHAR (1)  NULL,
    [StenkiPorazhennihOtdelovNepodvizhni]            NVARCHAR (1)  NULL,
    [Forma]                                          INT           NULL,
    [UchastkiPilevoyPigmentatsiiSlizistoyObolochki2] INT           NULL,
    [Endobronhit1]                                   INT           NULL,
    [PilevoyBronhitPnevmokonioziZakluchenie]         NVARCHAR (1)  NULL,
    [OpuholZakluchenie]                              INT           NULL,
    [TsitologicheskieGistologicheskieAnalizi]        NVARCHAR (1)  NULL,
    [VpervieViyavlenniyBolnoy]                       NVARCHAR (1)  NULL,
    [DopolnitelnieDannie]                            NTEXT         NULL,
    [Image]                                          IMAGE         NULL,
    [DannieVivodimieNaPechat]                        NTEXT         NULL,
    [Zaklyuchenie]                                   NTEXT         NULL,
    CONSTRAINT [FibrobronhoskopiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FibrobronhoskopiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
