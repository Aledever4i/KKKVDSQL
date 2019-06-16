﻿CREATE TABLE [dbo].[DanniePoOperacii] (
    [ID]              INT           NOT NULL,
    [PatID]           INT           NULL,
    [D1]              NVARCHAR (3)  NULL,
    [D2]              NVARCHAR (3)  NULL,
    [D3]              NVARCHAR (3)  NULL,
    [D4]              NVARCHAR (3)  NULL,
    [OP1]             NVARCHAR (3)  NULL,
    [OP2]             NVARCHAR (3)  NULL,
    [OP3]             NVARCHAR (3)  NULL,
    [OP4]             NVARCHAR (3)  NULL,
    [EYE]             NVARCHAR (1)  NULL,
    [MEDKATU]         NVARCHAR (1)  NULL,
    [PP]              NVARCHAR (1)  NULL,
    [DatUsl]          DATETIME      NULL,
    [NXD]             NVARCHAR (6)  NULL,
    [KODUSL]          NVARCHAR (2)  NULL,
    [AMBST]           NVARCHAR (1)  NULL,
    [KODISPDL]        NVARCHAR (4)  NULL,
    [KODOPERD]        NVARCHAR (4)  NULL,
    [KODKATU]         NVARCHAR (1)  NULL,
    [OKACH]           NVARCHAR (1)  NULL,
    [WHYOK]           NVARCHAR (2)  NULL,
    [OK]              NVARCHAR (1)  NULL,
    [PRSNI]           NVARCHAR (3)  NULL,
    [DATVNOLK]        DATETIME      NULL,
    [VR]              NVARCHAR (4)  NULL,
    [VROLK]           NVARCHAR (4)  NULL,
    [KODOPERO]        NVARCHAR (4)  NULL,
    [STADGL]          NVARCHAR (2)  NULL,
    [TL]              NVARCHAR (3)  NULL,
    [DIOL]            FLOAT (53)    NULL,
    [PROT]            NVARCHAR (2)  NULL,
    [KODRISK]         NVARCHAR (3)  NULL,
    [KODANSIO]        NVARCHAR (3)  NULL,
    [KODBRIG]         NVARCHAR (2)  NULL,
    [SI]              NVARCHAR (4)  NULL,
    [SA]              NVARCHAR (4)  NULL,
    [KODANOP]         NVARCHAR (4)  NULL,
    [KODOPOS]         NVARCHAR (3)  NULL,
    [KODOPERV]        NVARCHAR (4)  NULL,
    [VIS2]            FLOAT (53)    NULL,
    [SPH2]            FLOAT (53)    NULL,
    [CYL2]            FLOAT (53)    NULL,
    [AX2]             FLOAT (53)    NULL,
    [VISK2]           FLOAT (53)    NULL,
    [TON]             FLOAT (53)    NULL,
    [PZ2]             FLOAT (53)    NULL,
    [SET]             NVARCHAR (2)  NULL,
    [TRN]             NVARCHAR (2)  NULL,
    [DNO]             NVARCHAR (2)  NULL,
    [ISOLK]           NVARCHAR (2)  NULL,
    [OSLPR]           NVARCHAR (3)  NULL,
    [OSLISH]          NVARCHAR (3)  NULL,
    [OSLSUR]          NVARCHAR (4)  NULL,
    [IMPODO]          INT           NULL,
    [IMDOPR]          INT           NULL,
    [POSLE]           NVARCHAR (2)  NULL,
    [PP1]             NVARCHAR (1)  NULL,
    [KORSIO]          FLOAT (53)    NULL,
    [KORSLO]          FLOAT (53)    NULL,
    [ELAZ]            INT           NULL,
    [SIGMAX]          FLOAT (53)    NULL,
    [SIGMIN]          FLOAT (53)    NULL,
    [MAXZON]          FLOAT (53)    NULL,
    [MINZON]          FLOAT (53)    NULL,
    [PZON]            FLOAT (53)    NULL,
    [IMDOPL]          INT           NULL,
    [IMPOPL]          INT           NULL,
    [MMKOD1]          NVARCHAR (1)  NULL,
    [MMKOD2]          NVARCHAR (1)  NULL,
    [MMKOD3]          NVARCHAR (1)  NULL,
    [MMVID1]          NVARCHAR (2)  NULL,
    [MMVID2]          NVARCHAR (2)  NULL,
    [MMVID3]          NVARCHAR (2)  NULL,
    [MM1]             INT           NULL,
    [MM2]             INT           NULL,
    [MM3]             INT           NULL,
    [UGGOR1]          INT           NULL,
    [UGVER1]          INT           NULL,
    [UGGOR2]          INT           NULL,
    [UGVER2]          INT           NULL,
    [NOMAMB]          NVARCHAR (8)  NULL,
    [DatOtch]         DATETIME      NULL,
    [KODRAZ]          NVARCHAR (2)  NULL,
    [KODREL]          NVARCHAR (13) NULL,
    [VZR]             INT           NULL,
    [POL]             NVARCHAR (1)  NULL,
    [PD1]             NVARCHAR (3)  NULL,
    [PD2]             NVARCHAR (3)  NULL,
    [PD3]             NVARCHAR (3)  NULL,
    [PD4]             NVARCHAR (3)  NULL,
    [POP1]            NVARCHAR (3)  NULL,
    [POP2]            NVARCHAR (3)  NULL,
    [POP3]            NVARCHAR (3)  NULL,
    [POP4]            NVARCHAR (3)  NULL,
    [KODAN]           NVARCHAR (4)  NULL,
    [KODANSII]        NVARCHAR (3)  NULL,
    [GPT]             NVARCHAR (1)  NULL,
    [Vich]            BIT           NULL,
    [RecNo]           INT           NULL,
    [FAM]             NVARCHAR (20) NULL,
    [RecNoOSL]        INT           NULL,
    [RecNoEKS]        INT           NULL,
    [RecNoKOSOG]      INT           NULL,
    [ExportTime]      DATETIME      NULL,
    [ExportTimeOSL]   DATETIME      NULL,
    [ExportTimeEKS]   DATETIME      NULL,
    [ExportTimeKOSOG] DATETIME      NULL,
    [ProtNum]         INT           NULL,
    [STimeOp]         DATETIME      NULL,
    [ETimeOp]         DATETIME      NULL,
    [SOPERS]          NVARCHAR (4)  NULL,
    [Prichina]        INT           NULL,
    [PlanFormId]      INT           NULL,
    CONSTRAINT [DanniePoOperaciiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DanniePoOperaciiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

