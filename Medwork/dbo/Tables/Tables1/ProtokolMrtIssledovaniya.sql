﻿CREATE TABLE [dbo].[ProtokolMrtIssledovaniya] (
    [ID]                                                                                       INT          NOT NULL,
    [PatID]                                                                                    INT          NULL,
    [VidIssledovaniyaKtPoStandartnoyProgrammeSTolshinoySreza]                                  INT          NULL,
    [NaSeriiTomogrammPolucheniIzobrazheniyaSubISupratentorialnihStrukturOtdelovGolovnogoMozga] INT          NULL,
    [DislokatsiiSredinnihStruktur]                                                             INT          NULL,
    [ZheludochkiMozga]                                                                         INT          NULL,
    [ZheludochkiMozga1]                                                                        INT          NULL,
    [PerednieRogaBokovihZheludochkovSprava]                                                    INT          NULL,
    [PerednieRogaBokovihZheludochkovSleva]                                                     INT          NULL,
    [TsentralnieOtdeliSleava]                                                                  INT          NULL,
    [TsentralnieOtdeliSprava]                                                                  INT          NULL,
    [IIIZheludochek]                                                                           INT          NULL,
    [IIIZheludochekCombo]                                                                      INT          NULL,
    [SubarahnoidalnayaShel]                                                                    NTEXT        NULL,
    [KonveksitalnieBorozdi]                                                                    NTEXT        NULL,
    [ZheludochkiMozga2]                                                                        INT          NULL,
    [OpredelyayutsyaZoniPatologicheskoyPlotnosti]                                              NVARCHAR (1) NULL,
    [ZoniPatologicheskoyPlotnosti]                                                             NTEXT        NULL,
    [NaSkanogrammeCherep]                                                                      INT          NULL,
    [NaSkanogrammeCherep1]                                                                     INT          NULL,
    [TuretskoeSedlo]                                                                           NTEXT        NULL,
    [Konturi]                                                                                  INT          NULL,
    [VRazmerahNeUvelicheno]                                                                    NVARCHAR (1) NULL,
    [ProdolniyRazmer]                                                                          INT          NULL,
    [Visota]                                                                                   INT          NULL,
    [Zaklyuchenie]                                                                             NTEXT        NULL,
    [Vrach]                                                                                    INT          NULL,
    [Image]                                                                                    IMAGE        NULL,
    [NomerIssledovaniya1]                                                                      INT          NULL,
    [DataProvedeniyaIssledovaniya]                                                             DATETIME     NULL,
    CONSTRAINT [ProtokolMrtIssledovaniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProtokolMrtIssledovaniyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
