﻿CREATE TABLE [dbo].[IndividProgReabil] (
    [ID]                                  INT           NOT NULL,
    [PatID]                               INT           NULL,
    [OtyagAnamnez]                        NVARCHAR (50) NULL,
    [OtyagAnamn]                          NTEXT         NULL,
    [ADsist]                              INT           NULL,
    [Dislipidemiya]                       NTEXT         NULL,
    [Rost]                                INT           NULL,
    [Ves]                                 FLOAT (53)    NULL,
    [IMT]                                 INT           NULL,
    [Kurenie]                             INT           NULL,
    [Let]                                 INT           NULL,
    [UpotrebAlkag]                        NTEXT         NULL,
    [UpotrNark]                           NTEXT         NULL,
    [Gipodin]                             NVARCHAR (50) NULL,
    [NarTolerKGluk]                       NTEXT         NULL,
    [No]                                  NVARCHAR (1)  NULL,
    [FamAnamCerdZab]                      NTEXT         NULL,
    [Da]                                  NVARCHAR (1)  NULL,
    [Da2]                                 NVARCHAR (1)  NULL,
    [No3]                                 NVARCHAR (1)  NULL,
    [Da3]                                 NVARCHAR (1)  NULL,
    [No4]                                 NVARCHAR (1)  NULL,
    [Da4]                                 NVARCHAR (1)  NULL,
    [No5]                                 NVARCHAR (1)  NULL,
    [Da5]                                 NVARCHAR (1)  NULL,
    [HronStressSit]                       NTEXT         NULL,
    [DozFizNagruz]                        NVARCHAR (1)  NULL,
    [Gipolipid]                           NVARCHAR (1)  NULL,
    [Nizkokalor]                          NVARCHAR (1)  NULL,
    [SOgranicheniemSoli]                  NVARCHAR (1)  NULL,
    [Nizkouglevod]                        NVARCHAR (1)  NULL,
    [Prohie]                              NVARCHAR (50) NULL,
    [IndividZanyat]                       NVARCHAR (1)  NULL,
    [Trenazheri]                          NVARCHAR (1)  NULL,
    [Basseyn]                             NVARCHAR (1)  NULL,
    [ZaklInst]                            NTEXT         NULL,
    [FizioterLeh]                         NTEXT         NULL,
    [Testirovanie]                        NVARCHAR (1)  NULL,
    [Psihokorrekt]                        NVARCHAR (1)  NULL,
    [KodirNarkoman]                       NVARCHAR (1)  NULL,
    [Psihokor]                            NTEXT         NULL,
    [ADdiast]                             INT           NULL,
    [Data]                                DATETIME      NULL,
    [Vrach]                               INT           NULL,
    [AlkogolUpotreblyaet]                 NVARCHAR (1)  NULL,
    [NarkomaniyaUpotreblyal]              NVARCHAR (1)  NULL,
    [HronicheskayaStressovayaSituatsiya2] NVARCHAR (1)  NULL,
    [NarushenieTolerantnostiKGlyukoze]    NVARCHAR (1)  NULL,
    [Dislipidemiya2]                      NVARCHAR (1)  NULL,
    CONSTRAINT [IndividProgReabilPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IndividProgReabilToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

