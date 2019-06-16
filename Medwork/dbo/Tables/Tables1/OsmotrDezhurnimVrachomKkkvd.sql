﻿CREATE TABLE [dbo].[OsmotrDezhurnimVrachomKkkvd] (
    [ID]                  INT            NOT NULL,
    [PatID]               INT            NULL,
    [Vrach]               INT            NULL,
    [DateBox1]            DATETIME       NULL,
    [Zhalobi5]            NTEXT          NULL,
    [Oshush11]            NVARCHAR (3)   NULL,
    [Oshush21]            NVARCHAR (6)   NULL,
    [Oshush31]            NVARCHAR (13)  NULL,
    [Oshush41]            NVARCHAR (11)  NULL,
    [SubOshusheniya1]     NTEXT          NULL,
    [KakNapr1]            NVARCHAR (50)  NULL,
    [KontFIO1]            NVARCHAR (300) NULL,
    [KontDs1]             NVARCHAR (50)  NULL,
    [KontGde1]            NVARCHAR (50)  NULL,
    [NaprCel1]            NVARCHAR (200) NULL,
    [NaprLPU1]            NVARCHAR (200) NULL,
    [NaprDs1]             NVARCHAR (50)  NULL,
    [Lechilsya]           NVARCHAR (3)   NULL,
    [LechilsyaGde]        NVARCHAR (30)  NULL,
    [LechilsyaKak]        NVARCHAR (50)  NULL,
    [LechilsyaEffekt]     NVARCHAR (20)  NULL,
    [Kvrachu]             NVARCHAR (50)  NULL,
    [ObostrenieProcessa]  NVARCHAR (50)  NULL,
    [BolnimSchitaetDate]  DATETIME       NULL,
    [EditBox1]            NVARCHAR (50)  NULL,
    [Zhalobi11]           NVARCHAR (15)  NULL,
    [Zhalobi21]           NVARCHAR (22)  NULL,
    [Zhalobi31]           NVARCHAR (29)  NULL,
    [Zhalobi41]           NVARCHAR (14)  NULL,
    [Zhalobi111]          NVARCHAR (15)  NULL,
    [Zhalobi211]          NVARCHAR (22)  NULL,
    [Zhalobi311]          NVARCHAR (29)  NULL,
    [Zhalobi411]          NVARCHAR (14)  NULL,
    [lokaliz11]           NVARCHAR (7)   NULL,
    [lokaliz21]           NVARCHAR (22)  NULL,
    [lokaliz111]          NVARCHAR (7)   NULL,
    [lokaliz211]          NVARCHAR (22)  NULL,
    [Sliz11]              NVARCHAR (11)  NULL,
    [Sliz21]              NVARCHAR (15)  NULL,
    [Sliz111]             NVARCHAR (11)  NULL,
    [Sliz211]             NVARCHAR (15)  NULL,
    [NaKozhe19]           NVARCHAR (25)  NULL,
    [NaKozhe21]           NVARCHAR (4)   NULL,
    [NaKozhe31]           NVARCHAR (3)   NULL,
    [NaKozhe41]           NVARCHAR (5)   NULL,
    [NaKozhe51]           NVARCHAR (6)   NULL,
    [NaKozhe61]           NVARCHAR (5)   NULL,
    [NaKozhe71]           NVARCHAR (7)   NULL,
    [NaKozhe81]           NVARCHAR (6)   NULL,
    [NaKozhe91]           NVARCHAR (25)  NULL,
    [NaKozhe101]          NVARCHAR (6)   NULL,
    [NaKozhe111]          NVARCHAR (5)   NULL,
    [NaKozhe121]          NVARCHAR (7)   NULL,
    [NaKozhe131]          NVARCHAR (5)   NULL,
    [NaKozhe141]          NVARCHAR (7)   NULL,
    [NaKozhe151]          NVARCHAR (6)   NULL,
    [NaKozhe161]          NVARCHAR (15)  NULL,
    [NaKozhe171]          NVARCHAR (7)   NULL,
    [NaKozhe181]          NVARCHAR (3)   NULL,
    [NaKozhe191]          NVARCHAR (25)  NULL,
    [NaKozhe211]          NVARCHAR (4)   NULL,
    [NaKozhe311]          NVARCHAR (3)   NULL,
    [NaKozhe411]          NVARCHAR (5)   NULL,
    [NaKozhe511]          NVARCHAR (6)   NULL,
    [NaKozhe611]          NVARCHAR (5)   NULL,
    [NaKozhe711]          NVARCHAR (7)   NULL,
    [NaKozhe811]          NVARCHAR (6)   NULL,
    [NaKozhe911]          NVARCHAR (25)  NULL,
    [NaKozhe1011]         NVARCHAR (6)   NULL,
    [NaKozhe1111]         NVARCHAR (5)   NULL,
    [NaKozhe1211]         NVARCHAR (7)   NULL,
    [NaKozhe1311]         NVARCHAR (5)   NULL,
    [NaKozhe1411]         NVARCHAR (7)   NULL,
    [NaKozhe1511]         NVARCHAR (6)   NULL,
    [NaKozhe1611]         NVARCHAR (15)  NULL,
    [NaKozhe1711]         NVARCHAR (7)   NULL,
    [NaKozhe1811]         NVARCHAR (3)   NULL,
    [skladok11]           NVARCHAR (19)  NULL,
    [skladok21]           NVARCHAR (22)  NULL,
    [skladok31]           NVARCHAR (20)  NULL,
    [skladok41]           NVARCHAR (39)  NULL,
    [skladok51]           NVARCHAR (16)  NULL,
    [skladok61]           NVARCHAR (25)  NULL,
    [skladok71]           NVARCHAR (16)  NULL,
    [skladok81]           NVARCHAR (20)  NULL,
    [skladok111]          NVARCHAR (19)  NULL,
    [skladok211]          NVARCHAR (22)  NULL,
    [skladok311]          NVARCHAR (20)  NULL,
    [skladok411]          NVARCHAR (39)  NULL,
    [skladok511]          NVARCHAR (16)  NULL,
    [skladok611]          NVARCHAR (25)  NULL,
    [skladok711]          NVARCHAR (16)  NULL,
    [skladok811]          NVARCHAR (20)  NULL,
    [PervProyavBolezn]    NTEXT          NULL,
    [EditBox2]            NVARCHAR (50)  NULL,
    [DateBox2]            DATETIME       NULL,
    [DateBox3]            DATETIME       NULL,
    [EditBox3]            NVARCHAR (50)  NULL,
    [tuberkulez]          NVARCHAR (12)  NULL,
    [GepOtr]              NVARCHAR (15)  NULL,
    [GepA]                NVARCHAR (10)  NULL,
    [GepB]                NVARCHAR (10)  NULL,
    [GepC]                NVARCHAR (10)  NULL,
    [TubUchetSnyat]       NVARCHAR (50)  NULL,
    [TubUchet]            NVARCHAR (3)   NULL,
    [TubKogda]            NVARCHAR (200) NULL,
    [GepKogda]            NVARCHAR (200) NULL,
    [GepUchet]            NVARCHAR (3)   NULL,
    [Ven]                 NVARCHAR (8)   NULL,
    [VenUchet]            NVARCHAR (3)   NULL,
    [VenKogda]            NVARCHAR (200) NULL,
    [VEnChem]             NVARCHAR (200) NULL,
    [NasledAnamnez]       NVARCHAR (11)  NULL,
    [NasledAnamnezText]   NVARCHAR (150) NULL,
    [Kurenie]             NVARCHAR (50)  NULL,
    [Alco]                NVARCHAR (50)  NULL,
    [Narco]               NVARCHAR (50)  NULL,
    [Donor]               NVARCHAR (3)   NULL,
    [DonorKogdaSdaval]    NVARCHAR (100) NULL,
    [KontInfBol]          NVARCHAR (200) NULL,
    [Travmi]              NVARCHAR (200) NULL,
    [Allergiya]           NVARCHAR (50)  NULL,
    [RadioGroup1]         NVARCHAR (50)  NULL,
    [EditBox4]            NVARCHAR (50)  NULL,
    [EditBox5]            NVARCHAR (50)  NULL,
    [EditBox6]            NVARCHAR (50)  NULL,
    [EditBox7]            NVARCHAR (50)  NULL,
    [Sostoyanie]          NVARCHAR (50)  NULL,
    [Polozhenie]          NVARCHAR (50)  NULL,
    [TonSerd]             NVARCHAR (50)  NULL,
    [Davlenie]            NVARCHAR (50)  NULL,
    [Puls]                NVARCHAR (50)  NULL,
    [Dihanie]             NVARCHAR (50)  NULL,
    [Oteki]               NVARCHAR (10)  NULL,
    [OtekiText]           NVARCHAR (200) NULL,
    [ProcRasp]            NVARCHAR (50)  NULL,
    [ProcSimetr]          NVARCHAR (50)  NULL,
    [ProcVospal]          NVARCHAR (50)  NULL,
    [LocKozh]             NVARCHAR (50)  NULL,
    [SlizOboloch]         NVARCHAR (50)  NULL,
    [Memo1]               NTEXT          NULL,
    [Limfo]               NVARCHAR (50)  NULL,
    [Proba]               NVARCHAR (50)  NULL,
    [PolimorfizmText]     NVARCHAR (50)  NULL,
    [Polimorfizm]         NVARCHAR (50)  NULL,
    [DiagDict]            NVARCHAR (50)  NULL,
    [DiagDop]             NTEXT          NULL,
    [Dermato]             NVARCHAR (50)  NULL,
    [Zhalobi]             NTEXT          NULL,
    [lokaliz1]            NVARCHAR (7)   NULL,
    [lokaliz2]            NVARCHAR (22)  NULL,
    [Sliz1]               NVARCHAR (11)  NULL,
    [Sliz2]               NVARCHAR (15)  NULL,
    [Zhalobi1]            NVARCHAR (15)  NULL,
    [Zhalobi2]            NVARCHAR (22)  NULL,
    [Zhalobi3]            NVARCHAR (29)  NULL,
    [Zhalobi4]            NVARCHAR (14)  NULL,
    [NaKozhe2]            NVARCHAR (4)   NULL,
    [NaKozhe3]            NVARCHAR (3)   NULL,
    [NaKozhe4]            NVARCHAR (5)   NULL,
    [NaKozhe5]            NVARCHAR (6)   NULL,
    [NaKozhe6]            NVARCHAR (5)   NULL,
    [NaKozhe7]            NVARCHAR (7)   NULL,
    [NaKozhe8]            NVARCHAR (6)   NULL,
    [NaKozhe9]            NVARCHAR (25)  NULL,
    [NaKozhe10]           NVARCHAR (6)   NULL,
    [NaKozhe11]           NVARCHAR (5)   NULL,
    [NaKozhe12]           NVARCHAR (7)   NULL,
    [NaKozhe13]           NVARCHAR (5)   NULL,
    [NaKozhe14]           NVARCHAR (7)   NULL,
    [NaKozhe15]           NVARCHAR (6)   NULL,
    [NaKozhe16]           NVARCHAR (15)  NULL,
    [NaKozhe17]           NVARCHAR (7)   NULL,
    [NaKozhe18]           NVARCHAR (3)   NULL,
    [skladok1]            NVARCHAR (19)  NULL,
    [skladok2]            NVARCHAR (22)  NULL,
    [skladok3]            NVARCHAR (20)  NULL,
    [skladok4]            NVARCHAR (39)  NULL,
    [skladok5]            NVARCHAR (16)  NULL,
    [skladok6]            NVARCHAR (25)  NULL,
    [skladok7]            NVARCHAR (16)  NULL,
    [skladok8]            NVARCHAR (20)  NULL,
    [Oshush1]             NVARCHAR (3)   NULL,
    [Oshush2]             NVARCHAR (6)   NULL,
    [Oshush3]             NVARCHAR (13)  NULL,
    [Oshush4]             NVARCHAR (11)  NULL,
    [SubOshusheniya]      NTEXT          NULL,
    [Zhalobi12]           NVARCHAR (15)  NULL,
    [DiagCode]            NVARCHAR (6)   NULL,
    [OtekiTEMP]           NVARCHAR (50)  NULL,
    [LimfouzliTEMP]       NVARCHAR (50)  NULL,
    [process1TEMP]        NVARCHAR (50)  NULL,
    [process2TEMP]        NVARCHAR (50)  NULL,
    [process4TEMP]        NVARCHAR (50)  NULL,
    [process3TEMP]        NVARCHAR (50)  NULL,
    [LechilsyaTEMP]       NVARCHAR (50)  NULL,
    [LNvidavalsyaTEMP]    NVARCHAR (50)  NULL,
    [LNestTEMP]           NVARCHAR (50)  NULL,
    [FluorografTEMP]      NVARCHAR (50)  NULL,
    [ObostrLechilsyaTEMP] NVARCHAR (50)  NULL,
    [tuberkulezTEMP]      NVARCHAR (20)  NULL,
    [TubUchetTEMP]        NVARCHAR (20)  NULL,
    [GepatitTEMP]         NVARCHAR (20)  NULL,
    [GepUchetTEMP]        NVARCHAR (20)  NULL,
    [VenTEMP]             NVARCHAR (20)  NULL,
    [VenUchetTEMP]        NVARCHAR (20)  NULL,
    [NasledAnamnezTEMP]   NVARCHAR (20)  NULL,
    [EditBox11]           NVARCHAR (50)  NULL,
    [EditBox21]           NVARCHAR (50)  NULL,
    [EditBox31]           NVARCHAR (50)  NULL,
    [nib_id]              NVARCHAR (50)  NULL,
    [ObrZaPomText]        NVARCHAR (50)  NULL,
    [ObrZaPom]            NVARCHAR (50)  NULL,
    CONSTRAINT [OsmotrDezhurnimVrachomKkkvdPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrDezhurnimVrachomKkkvdToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
