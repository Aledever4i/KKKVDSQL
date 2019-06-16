/*
Скрипт развертывания для MedworkData

Этот код был создан программным средством.
Изменения, внесенные в этот файл, могут привести к неверному выполнению кода и будут потеряны
в случае его повторного формирования.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MedworkData"
:setvar DefaultFilePrefix "MedworkData"
:setvar DefaultDataPath "c:\Program Files\Microsoft SQL Server\MSSQL10_50.MW\MSSQL\DATA\"
:setvar DefaultLogPath "c:\Program Files\Microsoft SQL Server\MSSQL10_50.MW\MSSQL\DATA\"

GO
:on error exit
GO
/*
Проверьте режим SQLCMD и отключите выполнение скрипта, если режим SQLCMD не поддерживается.
Чтобы повторно включить скрипт после включения режима SQLCMD выполните следующую инструкцию:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Для успешного выполнения этого скрипта должен быть включен режим SQLCMD.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
Удаляется столбец [dbo].[REESTR_temp_updating].[IDCASE], возможна потеря данных.
*/

IF EXISTS (select top 1 1 from [dbo].[REESTR_temp_updating])
    RAISERROR (N'Обнаружены строки. Обновление схемы завершено из-за возможной потери данных.', 16, 127) WITH NOWAIT

GO
PRINT N'Выполняется удаление [dbo].[ScheduleBlock]...';


GO
DROP TRIGGER [dbo].[ScheduleBlock];


GO
PRINT N'Выполняется удаление [dbo].[DF_FOMSReports_IsImport]...';


GO
ALTER TABLE [dbo].[FOMSReports] DROP CONSTRAINT [DF_FOMSReports_IsImport];


GO
PRINT N'Выполняется создание [Administrators]...';


GO
CREATE USER [Administrators] FOR LOGIN [BUILTIN\Администраторы];


GO
REVOKE CONNECT TO [Administrators];


GO
PRINT N'Выполняется создание <Без имени>...';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'Administrators';


GO
PRINT N'Выполняется изменение [BUILTIN\Administrators]...';


GO
ALTER AUTHORIZATION
    ON SCHEMA::[BUILTIN\Administrators]
    TO [Administrators];


GO
PRINT N'Выполняется изменение [kkkvd]...';


GO
ALTER AUTHORIZATION
    ON SCHEMA::[kkkvd]
    TO [Administrators];


GO
PRINT N'Выполняется изменение [dbo].[REESTR_temp_updating]...';


GO
ALTER TABLE [dbo].[REESTR_temp_updating] DROP COLUMN [IDCASE];


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_KSG_KPG]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_KSG_KPG] (
    [Id]      INT          IDENTITY (1, 1) NOT NULL,
    [SlId]    INT          NOT NULL,
    [N_KSG]   VARCHAR (36) NULL,
    [VER_KSG] INT          NULL,
    [KSG_PG]  INT          NULL,
    [N_KPG]   VARCHAR (20) NULL,
    [KOEF_Z]  DECIMAL (18) NULL,
    [KOEF_UP] DECIMAL (18) NULL,
    [BZTSZ]   DECIMAL (18) NULL,
    [KOEF_D]  DECIMAL (18) NULL,
    [KOEF_U]  DECIMAL (18) NULL,
    [DKK1]    VARCHAR (20) NULL,
    [DKK2]    VARCHAR (20) NULL,
    [SL_K]    INT          NULL,
    [IT_SL]   VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_PACIENT]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_PACIENT] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [ZapId]    INT           NOT NULL,
    [ID_PAC]   VARCHAR (36)  NULL,
    [VPOLIS]   INT           NULL,
    [SPOLIS]   VARCHAR (10)  NULL,
    [NPOLIS]   VARCHAR (20)  NULL,
    [ST_OKATO] VARCHAR (5)   NULL,
    [SMO]      VARCHAR (5)   NULL,
    [SMO_OGRN] VARCHAR (15)  NULL,
    [SMO_OK]   VARCHAR (5)   NULL,
    [SMO_NAM]  VARCHAR (100) NULL,
    [INV]      VARCHAR (10)  NULL,
    [MSE]      VARCHAR (10)  NULL,
    [NOVOR]    VARCHAR (9)   NULL,
    [VNOV_D]   INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_SANK]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_SANK] (
    [Id]     INT           NOT NULL,
    [SlId]   INT           NOT NULL,
    [S_CODE] VARCHAR (36)  NULL,
    [S_SUM]  DECIMAL (18)  NULL,
    [S_TIP]  INT           NULL,
    [S_OSN]  INT           NULL,
    [S_COM]  VARCHAR (250) NULL,
    [S_IST]  INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_SCHET]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_SCHET] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [ZlId]      INT          NOT NULL,
    [CODE]      INT          NULL,
    [CODE_MO]   VARCHAR (6)  NULL,
    [YEAR]      INT          NULL,
    [MONTH]     INT          NULL,
    [NSCHET]    VARCHAR (15) NULL,
    [DSCHET]    DATE         NULL,
    [PLAT]      VARCHAR (5)  NULL,
    [SUMMAV]    DECIMAL (18) NULL,
    [COMENTS]   DECIMAL (18) NULL,
    [SUMMAP]    DECIMAL (18) NULL,
    [SANK_MEK]  DECIMAL (18) NULL,
    [SANK_MEE]  DECIMAL (18) NULL,
    [SANK_EKMP] DECIMAL (18) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_SL]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_SL] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [ZapId]     INT           NOT NULL,
    [SL_ID]     VARCHAR (36)  NULL,
    [LPU_1]     VARCHAR (8)   NULL,
    [PODR]      INT           NULL,
    [PROFIL]    INT           NULL,
    [PROFIL_K]  INT           NULL,
    [DET]       INT           NULL,
    [P_CEL]     VARCHAR (20)  NULL,
    [NHISTORY]  VARCHAR (50)  NULL,
    [P_PER]     INT           NULL,
    [DATE_1]    DATE          NULL,
    [DATE_2]    DATE          NULL,
    [KD]        VARCHAR (20)  NULL,
    [DS0]       VARCHAR (10)  NULL,
    [DS1]       VARCHAR (10)  NULL,
    [DS2]       VARCHAR (10)  NULL,
    [DS3]       VARCHAR (10)  NULL,
    [DN]        VARCHAR (20)  NULL,
    [CODE_MES1] VARCHAR (20)  NULL,
    [CODE_MES2] VARCHAR (20)  NULL,
    [REAB]      VARCHAR (20)  NULL,
    [PRVS]      INT           NULL,
    [VERS_SPEC] VARCHAR (4)   NULL,
    [IDDOKT]    VARCHAR (25)  NULL,
    [ED_COL]    DECIMAL (18)  NULL,
    [TARIF]     DECIMAL (18)  NULL,
    [SUM_M]     DECIMAL (18)  NULL,
    [COMENTSL]  VARCHAR (250) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_USL]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_USL] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [SlId]     INT           NOT NULL,
    [IDSERV]   VARCHAR (36)  NULL,
    [LPU]      VARCHAR (6)   NULL,
    [LPU_1]    VARCHAR (8)   NULL,
    [PODR]     INT           NULL,
    [PROFIL]   INT           NULL,
    [VID_VME]  VARCHAR (15)  NULL,
    [DET]      INT           NULL,
    [DATE_IN]  DATE          NULL,
    [DATE_OUT] DATE          NULL,
    [DS]       VARCHAR (10)  NULL,
    [CODE_USL] VARCHAR (20)  NULL,
    [KOL_USL]  DECIMAL (18)  NULL,
    [TARIF]    DECIMAL (18)  NULL,
    [SUMV_USL] DECIMAL (18)  NULL,
    [PRVS]     INT           NULL,
    [CODE_MD]  VARCHAR (20)  NULL,
    [NPL]      VARCHAR (20)  NULL,
    [COMENTU]  VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_Z_SL]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_Z_SL] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [ZapId]    INT          NOT NULL,
    [IDCASE]   INT          NULL,
    [USL_OK]   INT          NULL,
    [VIDPOM]   INT          NULL,
    [FOR_POM]  INT          NULL,
    [NPR_MO]   VARCHAR (6)  NULL,
    [NPR_DATE] DATE         NULL,
    [LPU]      VARCHAR (6)  NULL,
    [DATE_Z_1] DATE         NULL,
    [DATE_Z_2] DATE         NULL,
    [KD_Z]     VARCHAR (10) NULL,
    [VNOV_M]   INT          NULL,
    [RSLT]     INT          NULL,
    [ISHOD]    INT          NULL,
    [OS_SLUCH] INT          NULL,
    [VB_P]     VARCHAR (10) NULL,
    [IDSP]     INT          NULL,
    [SUMV]     DECIMAL (18) NULL,
    [OPLATA]   DECIMAL (18) NULL,
    [SUMP]     DECIMAL (18) NULL,
    [SANK_IT]  DECIMAL (18) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_ZAP]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_ZAP] (
    [Id]     INT IDENTITY (1, 1) NOT NULL,
    [ZlId]   INT NOT NULL,
    [N_ZAP]  INT NULL,
    [PR_NOV] INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_ZGLV]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_ZGLV] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [ZlId]     INT          NOT NULL,
    [VERSION]  VARCHAR (3)  NULL,
    [DATA]     DATE         NULL,
    [FILENAME] VARCHAR (20) NULL,
    [SD_Z]     INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_H_ZL_LIST]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_H_ZL_LIST] (
    [Id]         INT  IDENTITY (1, 1) NOT NULL,
    [InsertDate] DATE NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_IMPORT]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_IMPORT] (
    [Id]         INT  IDENTITY (1, 1) NOT NULL,
    [UsrId]      INT  NOT NULL,
    [H]          XML  NULL,
    [S]          XML  NULL,
    [L]          XML  NULL,
    [V]          XML  NULL,
    [InsertDate] DATE NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_L_PERS]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_L_PERS] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [FOMS_L_PERS_LIST_ID] INT            NULL,
    [ID_PAC]              VARCHAR (36)   NULL,
    [FAM]                 VARCHAR (40)   NULL,
    [IM]                  VARCHAR (40)   NULL,
    [OT]                  VARCHAR (40)   NULL,
    [W]                   INT            NULL,
    [DR]                  DATE           NULL,
    [DOST]                VARCHAR (1000) NULL,
    [TEL]                 VARCHAR (20)   NULL,
    [FAM_P]               VARCHAR (40)   NULL,
    [IM_P]                VARCHAR (40)   NULL,
    [OT_P]                VARCHAR (40)   NULL,
    [W_P]                 VARCHAR (40)   NULL,
    [DR_P]                DATE           NULL,
    [DOST_P]              VARCHAR (1000) NULL,
    [MR]                  VARCHAR (100)  NULL,
    [DOCTYPE]             VARCHAR (2)    NULL,
    [DOCSER]              VARCHAR (10)   NULL,
    [DOCNUM]              VARCHAR (20)   NULL,
    [SNILS]               VARCHAR (14)   NULL,
    [OKATOG]              VARCHAR (11)   NULL,
    [OKATOP]              VARCHAR (11)   NULL,
    [COMENTP]             VARCHAR (250)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_L_PERS_LIST]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_L_PERS_LIST] (
    [Id]       INT IDENTITY (1, 1) NOT NULL,
    [ImportId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_L_ZGLV]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_L_ZGLV] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [Version]   VARCHAR (3)  NULL,
    [Data]      DATE         NULL,
    [FileName]  VARCHAR (20) NULL,
    [FileName1] VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_Result_ill_st]...';


GO
CREATE TABLE [dbo].[FOMS_Result_ill_st] (
    [Cod]  INT         NULL,
    [Name] VARCHAR (1) NULL
);


GO
PRINT N'Выполняется создание [dbo].[FOMS_S_RL]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_S_RL] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [FOMS_S_USL_ID] INT          NOT NULL,
    [IDRL]          VARCHAR (36) NULL,
    [NAME_MNN]      VARCHAR (40) NULL,
    [ID_ATX]        VARCHAR (40) NULL,
    [ID_MI]         VARCHAR (40) NULL,
    [KOL_MI]        INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_S_SCHET]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_S_SCHET] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_S_SL]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_S_SL] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [SL_ID]     VARCHAR (36)  NULL,
    [IDCASE]    VARCHAR (36)  NULL,
    [NSNDHOSP]  VARCHAR (10)  NULL,
    [REN]       INT           NULL,
    [SOFA]      VARCHAR (10)  NULL,
    [PARENT]    INT           NULL,
    [D_TYPE]    VARCHAR (3)   NULL,
    [FROM_FIRM] VARCHAR (3)   NULL,
    [DS1_M]     VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_S_USL]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_S_USL] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [FOMS_S_SL_ID] INT          NOT NULL,
    [IDSERV]       VARCHAR (36) NULL,
    [PR_USL]       VARCHAR (40) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_S_ZGLV]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_S_ZGLV] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_V_FLK_P]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_V_FLK_P] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_V_OTKAZ]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_V_OTKAZ] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [FOMS_V_SL_ID] INT           NOT NULL,
    [I_TYPE]       VARCHAR (36)  NULL,
    [COMMENT]      VARCHAR (250) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_V_SCHET]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_V_SCHET] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_V_SL]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_V_SL] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [FOMS_V_ZAP_ID] INT          NOT NULL,
    [SL_ID]         VARCHAR (36) NULL,
    [IDCASE]        VARCHAR (36) NULL,
    [NHISTORY]      VARCHAR (36) NULL,
    [CARD]          VARCHAR (36) NULL,
    [SMO]           VARCHAR (36) NULL,
    [SMO_FOND]      VARCHAR (36) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMS_V_ZAP]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMS_V_ZAP] (
    [Id]    INT          IDENTITY (1, 1) NOT NULL,
    [N_ZAP] VARCHAR (36) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSReportsImport]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMSReportsImport] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSRequestsImport]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE TABLE [dbo].[FOMSRequestsImport] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_ZL_LIST]...';


GO
ALTER TABLE [dbo].[FOMS_H_ZL_LIST]
    ADD DEFAULT GETDATE() FOR [InsertDate];


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_IMPORT]...';


GO
ALTER TABLE [dbo].[FOMS_IMPORT]
    ADD DEFAULT GETDATE() FOR [InsertDate];


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMSReports]...';


GO
ALTER TABLE [dbo].[FOMSReports]
    ADD DEFAULT (0) FOR [IsImport];


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_KSG_KPG]...';


GO
ALTER TABLE [dbo].[FOMS_H_KSG_KPG] WITH NOCHECK
    ADD FOREIGN KEY ([SlId]) REFERENCES [dbo].[FOMS_H_SL] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_PACIENT]...';


GO
ALTER TABLE [dbo].[FOMS_H_PACIENT] WITH NOCHECK
    ADD FOREIGN KEY ([ZapId]) REFERENCES [dbo].[FOMS_H_ZAP] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_SANK]...';


GO
ALTER TABLE [dbo].[FOMS_H_SANK] WITH NOCHECK
    ADD FOREIGN KEY ([SlId]) REFERENCES [dbo].[FOMS_H_SL] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_SCHET]...';


GO
ALTER TABLE [dbo].[FOMS_H_SCHET] WITH NOCHECK
    ADD FOREIGN KEY ([ZlId]) REFERENCES [dbo].[FOMS_H_ZL_LIST] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_SL]...';


GO
ALTER TABLE [dbo].[FOMS_H_SL] WITH NOCHECK
    ADD FOREIGN KEY ([ZapId]) REFERENCES [dbo].[FOMS_H_ZAP] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_USL]...';


GO
ALTER TABLE [dbo].[FOMS_H_USL] WITH NOCHECK
    ADD FOREIGN KEY ([SlId]) REFERENCES [dbo].[FOMS_H_SL] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_Z_SL]...';


GO
ALTER TABLE [dbo].[FOMS_H_Z_SL] WITH NOCHECK
    ADD FOREIGN KEY ([ZapId]) REFERENCES [dbo].[FOMS_H_ZAP] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_ZAP]...';


GO
ALTER TABLE [dbo].[FOMS_H_ZAP] WITH NOCHECK
    ADD FOREIGN KEY ([ZlId]) REFERENCES [dbo].[FOMS_H_ZL_LIST] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_H_ZGLV]...';


GO
ALTER TABLE [dbo].[FOMS_H_ZGLV] WITH NOCHECK
    ADD FOREIGN KEY ([ZlId]) REFERENCES [dbo].[FOMS_H_ZL_LIST] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_IMPORT]...';


GO
ALTER TABLE [dbo].[FOMS_IMPORT] WITH NOCHECK
    ADD FOREIGN KEY ([UsrId]) REFERENCES [dbo].[Usr] ([ID]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_L_PERS]...';


GO
ALTER TABLE [dbo].[FOMS_L_PERS] WITH NOCHECK
    ADD FOREIGN KEY ([FOMS_L_PERS_LIST_ID]) REFERENCES [dbo].[FOMS_L_PERS_LIST] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_L_PERS_LIST]...';


GO
ALTER TABLE [dbo].[FOMS_L_PERS_LIST] WITH NOCHECK
    ADD FOREIGN KEY ([ImportId]) REFERENCES [dbo].[FOMS_IMPORT] ([Id]);


GO
PRINT N'Выполняется создание ограничение без названия для [dbo].[FOMS_S_RL]...';


GO
ALTER TABLE [dbo].[FOMS_S_RL] WITH NOCHECK
    ADD FOREIGN KEY ([FOMS_S_USL_ID]) REFERENCES [dbo].[FOMS_S_USL] ([Id]);


GO
PRINT N'Выполняется изменение [dbo].[UD_CountFirstConfition]...';


GO

ALTER FUNCTION UD_CountFirstConfition
	(@diag varchar(100),
	 @fcType int,
	 @sdate datetime, 
	 @edate datetime,
      @isBud int,
	 @org int,
 	 @sector int,
          @terr int,
 	 @age int)
 RETURNS int
 AS
 BEGIN
  DECLARE @res int
  set @res=(
   select 
    count(1) 
   from
   UI_Diag ui, 
    UD_Patient ud,
    Attachment a
   where 
    upper(ui.code)=upper(@diag) and
    ui.isNotRegister=1 and
    ud.id=ui.pid and
    --ud.date>@sdate and [26122006]
    ud.date>=@sdate and 
    ud.date-1<@edate and 
    (ui.FirstCandition=@fcType or @fctype=-1
		) and
  ui.isFirst=1 and    
   ( 
	(@isBud=-1) or
	(@isBud=1 and a.atttype=1) or
	(@isBud=2 and a.atttype=2)
    ) and
    (@sector=-1 or @sector=(select aa.sector from Attachment aa where aa.id=ui.attid)) and
    (    @terr=-1 or 
        (@terr=0 and (select count(1) from patient p where p.id=ud.patid and (p.c_T=77 or p.isMoscow=1 ))>0) or
        (@terr=1 and (select count(1) from patient p where p.id=ud.patid and p.c_T=50)>0)
     ) and
    (    @age=-1 or 
        (@age=0 and (select DATEDIFF(year, p.birthdate, ud.date) from patient p where p.id=ud.patid)<15) or
        (@age=1 and ((select DATEDIFF(year, p.birthdate, ud.date) from patient p where p.id=ud.patid)>=15 and (select DATEDIFF(year, p.birthdate, ud.date) from patient p where p.id=ud.patid)<18) ) or
        (@age=2 and (select DATEDIFF(year, p.birthdate, ud.date) from patient p where p.id=ud.patid)>=18)
     )
 )
  
 RETURN @res
 END
GO
PRINT N'Выполняется изменение [dbo].[UD_CountP]...';


GO

ALTER FUNCTION UD_CountP
	(@deptID int,
	 @DoctorId int,
	 @cType int, -- что считать 	0 Итого по поликлинике
				--	1 Итого на дому
				--	2 На объекте
	 @chs int, -- член семьи 1 или -1
	 @ok int, -- основной контингент
	 @nk int, -- неконтингент
	 @str int, -- страховые

	 @isProf int, -- профилактика
	 @isZab int, -- заболевания
	 @age int,  -- -1 все, 0 дети, 1 подростки, 2 взрослые +дети и подростки
	 @Terr int, -- -1 все, 0 - Москва, 1 - Московская область
 	 @sdate datetime,
	 @edate datetime,
	 @isBud int
	 )
RETURNS int
AS
BEGIN
 DECLARE @res int
 set @res=(
  select 
    count(1) 
  from 
    UD_Patient u,
    usr us,
    dept d
  where 
    d.id=us.deptid and
    us.id=u.doctorid and
    (us.deptid=@deptid or @doctorId<>-1 or @deptId=-1) and
    (u.doctorid=@doctorId or @doctorId=-1) and
    ((@cType<>0) or (@cType=0 and u.isHome=0 and u.isObject=0)) and
    ((@cType<>1) or (@cType=1 and u.isHome=1 and u.isObject=0)) and
    ((@cType<>2) or (@cType=2 and u.isObject=1)) and
    ((@nk=-1) or (u.isList=1)) and

    ((@isZab=-1) or ((select count(1) from UI_Diag ud where ud.pid=u.id and upper(SUBSTRING(ud.code,1,1))<>'Z' )>0)) and
    ((@isProf=-1) or ((select count(1) from UI_Diag ud where ud.pid=u.id and upper(SUBSTRING(ud.code,1,1))='Z' )>0)) and


 (    @terr=-1 or 
     (@terr=0 and (select count(1) from patient p where p.id=u.patid and (p.c_T=77 or p.isMoscow=1 ))>0) or
     (@terr=1 and (select count(1) from patient p where p.id=u.patid and p.c_T=50)>0)
  ) and
 (    @age=-1 or 
     (@age=0 and (select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)<15) or
     (@age=1 and ((select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)>=15 and (select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)<18) ) or
     (@age=2 and (select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)>=18) or
     (@age=3 and (select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)<18) 
  ) and
     u.date>@sdate and
     u.date-1<@edate
 )
 
RETURN @res
END
GO
PRINT N'Выполняется изменение [dbo].[DirectionToChistovodnoeAdd]...';


GO
ALTER PROCEDURE [dbo].[DirectionToChistovodnoeAdd]
	@DestinationId int,
	@DestinationDate datetime,
	@DestinationTakeDate datetime,
	@DoctorId int,
	@PatientId int,
	@PaymentTypeId int,
	@MkbId int,
	@DiagnosisId int,
	@EditorId int
AS
BEGIN
	INSERT INTO dbo.DirectionToChistovodnoe
	(
		DestinationId, 
		DestinationDate,
		DestinationTakeDate,
		DoctorId,
		PaymentTypeId,
		DiagnosisId,
		MkbId
	)
	VALUES
	(
			@DestinationId,
			@DestinationDate,
			@DestinationTakeDate,
			@DoctorId,
			@PaymentTypeId,
			@DiagnosisId,
			@MkbId
	)
END
GO
PRINT N'Выполняется изменение [dbo].[FOMSImportReport]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
ALTER PROCEDURE dbo.FOMSImportReport
    @H xml = NULL,
    @L xml = NULL,
    @S xml = NULL,
    @V xml = NULL,
    @UserId int
AS
BEGIN
    DECLARE @ZlId int

    INSERT INTO dbo.FOMS_IMPORT (H, L, S, V, UsrId) VALUES (@H, @L, @S, @V, @UserId)

    SET @ZlId = SCOPE_IDENTITY()
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется изменение [dbo].[SP_FinDocDet]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO


ALTER PROCEDURE dbo.SP_FinDocDet  @OperationType int, @DocID int
AS
declare @AccountID int

	if (@OperationType = 0) or (@OperationType = 2)
	begin
		select 
			P.DataOplati [Дата],
			case	when P.Summa > 0 then 'Оплата по счету' 
				when P.Summa < 0 then 'Возврат денег из кассы' 
			end [Документ],
			case 	when @OperationType = 0 then P.ID
				when @OperationType = 2 then B.NomerScheta
			end [№ документа],
			P.Summa [Сумма операции],
			U.Name [Оператор]
		from Payment P (nolock)
			left join Bill B (nolock) on (P.NomerScheta = B.ID)
			left join Usr U (nolock) on (P.Prinyal = U.ID)
		where B.NomerScheta = @DocID
	return
	end
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется изменение [dbo].[spLockDate]...';


GO

ALTER PROCEDURE spLockDate (@SID INT, @DATE DATETIME)
AS
DECLARE @MAXID INT
SELECT @MAXID = ISNULL(MAX(ID),0)+1 FROM Napravlenie

INSERT INTO Napravlenie (ID, PatID, VremyaPriema, DataPriema, Vrach)
SELECT TOP 30 PERCENT 
  ID+@MAXID as ID,
  NULL as PatID, 
  StartTime as VremyaPriema, 
  @DATE as DataPriema,
  UsrID as Vrach
FROM
  dbo.fnTimeGrid(@SID, @DATE)
WHERE
  NapCount=0
ORDER BY StartTime Desc
GO
PRINT N'Выполняется создание [dbo].[FOMSReportHClear]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE dbo.FOMSReportHClear
AS
BEGIN
    DELETE FROM dbo.FOMS_H_KSG_KPG
    DELETE FROM dbo.FOMS_H_USL
    DELETE FROM dbo.FOMS_H_SANK
    DELETE FROM dbo.FOMS_H_SL
    DELETE FROM dbo.FOMS_H_Z_SL
    DELETE FROM dbo.FOMS_H_PACIENT
    DELETE FROM dbo.FOMS_H_ZAP
    DELETE FROM dbo.FOMS_H_SCHET
    DELETE FROM dbo.FOMS_H_ZL_LIST
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSReportLClear]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE dbo.FOMSReportLClear
AS
BEGIN
    DELETE FROM dbo.FOMS_L_PERS
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSReportSClear]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE dbo.FOMSReportSClear
AS
BEGIN
    DELETE FROM dbo.FOMS_S_RL
    DELETE FROM dbo.FOMS_S_USL
    DELETE FROM dbo.FOMS_S_SL
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSReportVClear]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE dbo.FOMSReportVClear
AS
BEGIN
    DELETE FROM dbo.FOMS_V_OTKAZ
    DELETE FROM dbo.FOMS_V_SL
    DELETE FROM dbo.FOMS_V_ZAP
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSImportHReport]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE dbo.FOMSImportHReport
    @Xml xml
AS
BEGIN
    EXEC dbo.FOMSReportHClear

    DECLARE 
        @ZapXml xml = NULL,
        @SLXml xml = NULL,
        @USLXml xml = NULL,
        @ZapId int = NULL,
        @SLId int = NULL

    INSERT INTO dbo.FOMS_H_SCHET (
        CODE,
        CODE_MO,
        [YEAR],
        [MONTH],
        NSCHET,
        DSCHET,
        PLAT,
        SUMMAV,
        COMENTS,
        SUMMAP,
        SANK_MEK,
        SANK_MEE,
        SANK_EKMP
        )
        SELECT
	        a.value('CODE[1]', 'int') AS CODE,
	        a.value('CODE_MO[1]', 'varchar(6)') AS CODE_MO,
	        a.value('YEAR[1]', 'int') AS [YEAR],
	        a.value('MONTH[1]', 'int') AS [MONTH],
	        a.value('NSCHET[1]', 'varchar(15)') AS NSCHET,
	        a.value('DSCHET[1]', 'date') AS DSCHET,
	        a.value('PLAT[1]', 'varchar(5)') AS PLAT,
	        a.value('SUMMAV[1]', 'decimal') AS SUMMAV,
	        a.value('COMENTS[1]', 'varchar(250)') AS COMENTS,
	        a.value('SUMMAP[1]', 'decimal') AS SUMMAP,
	        a.value('SANK_MEK[1]', 'decimal') AS SANK_MEK,
	        a.value('SANK_MEE[1]', 'decimal') AS SANK_MEE,
	        a.value('SANK_EKMP[1]', 'decimal') AS SANK_EKMP
	        FROM @Xml.nodes('ZL_LIST/SCHET') AS zl(a)

    DECLARE zap_cursor CURSOR FOR   
	    SELECT
		    a.query('(ZAP)')
		    FROM @Xml.nodes('ZL_LIST') AS zl(a)
    OPEN zap_cursor  

    FETCH NEXT FROM zap_cursor INTO @ZapXml
    WHILE @@FETCH_STATUS = 0  
    BEGIN
	    SET @SLXml = NULL
        SET @ZapId = NULL

        INSERT INTO dbo.FOMS_H_ZAP (
            N_ZAP,
            PR_NOV
            )
	        SELECT
		        a.value('N_ZAP[1]', 'int') AS N_ZAP,
		        a.value('PR_NOV[1]', 'int') AS PR_NOV
		        FROM @ZapXml.nodes('ZAP') AS zap(a)

        SET @ZapId = SCOPE_IDENTITY()

        INSERT INTO dbo.FOMS_H_PACIENT (
            ZapId,
            ID_PAC,
            VPOLIS,
            SPOLIS,
            NPOLIS,
            ST_OKATO,
            SMO,
            SMO_OGRN,
            SMO_OK,
            SMO_NAM,
            INV,
            MSE,
            NOVOR,
            VNOV_D
            )
	        SELECT
                @ZapId,
		        a.value('ID_PAC[1]', 'varchar(36)') AS ID_PAC,
		        a.value('VPOLIS[1]', 'int') AS VPOLIS,
		        a.value('SPOLIS[1]', 'varchar(10)') AS SPOLIS,
		        a.value('NPOLIS[1]', 'varchar(20)') AS NPOLIS,
		        a.value('ST_OKATO[1]', 'varchar(5)') AS ST_OKATO,
		        a.value('SMO[1]', 'varchar(5)') AS SMO,
		        a.value('SMO_OGRN[1]', 'varchar(15)') AS SMO_OGRN,
		        a.value('SMO_OK[1]', 'varchar(5)') AS SMO_OK,
		        a.value('SMO_NAM[1]', 'varchar(100)') AS SMO_NAM,
		        a.value('INV[1]', 'varchar(10)') AS INV, -- определить тип
		        a.value('MSE[1]', 'varchar(10)') AS MSE, -- определить тип
		        a.value('NOVOR[1]', 'varchar(9)') AS NOVOR,
		        a.value('VNOV_D[1]', 'int') AS VNOV_D
		        FROM @ZapXml.nodes('ZAP/PACIENT') AS p(a)

        INSERT INTO dbo.FOMS_H_Z_SL (
            ZapId,
            IDCASE,
            USL_OK,
            VIDPOM,
            FOR_POM,
            NPR_MO,
            NPR_DATE,
            LPU,
            DATE_Z_1,
            DATE_Z_2,
            KD_Z,
            VNOV_M,
            RSLT,
            ISHOD,
            OS_SLUCH,
            VB_P,
            IDSP,
            SUMV,
            OPLATA,
            SUMP,
            SANK_IT
            )
	        SELECT
                @ZapId,
		        a.value('IDCASE[1]', 'int') AS IDCASE,
		        a.value('USL_OK[1]', 'int') AS USL_OK,
		        a.value('VIDPOM[1]', 'int') AS VIDPOM,
		        a.value('FOR_POM[1]', 'int') AS FOR_POM,
		        a.value('NPR_MO[1]', 'varchar(6)') AS NPR_MO,
		        a.value('NPR_DATE[1]', 'date') AS NPR_DATE,
		        a.value('LPU[1]', 'varchar(6)') AS LPU,
		        a.value('DATE_Z_1[1]', 'date') AS DATE_Z_1,
		        a.value('DATE_Z_2[1]', 'date') AS DATE_Z_2,
		        a.value('KD_Z[1]', 'varchar(10)') AS KD_Z, -- определить тип
		        a.value('VNOV_M[1]', 'int') AS VNOV_M,
		        a.value('RSLT[1]', 'int') AS RSLT,
		        a.value('ISHOD[1]', 'int') AS ISHOD,
		        a.value('OS_SLUCH[1]', 'int') AS OS_SLUCH,
		        a.value('VB_P[1]', 'varchar(10)') AS VB_P, -- определить тип
		        a.value('IDSP[1]', 'int') AS IDSP,
		        a.value('SUMV[1]', 'decimal') AS SUMV,
		        a.value('OPLATA[1]', 'decimal') AS OPLATA,
		        a.value('SUMP[1]', 'decimal') AS SUMP,
		        a.value('SANK_IT[1]', 'decimal') AS SANK_IT
		        FROM @ZapXml.nodes('ZAP/Z_SL') AS zsl(a)

	    DECLARE sl_cursor CURSOR FOR
		    SELECT
			    a.query('(SL)')
			    FROM @ZapXml.nodes('ZAP/Z_SL') AS z(a)
			
	    OPEN sl_cursor
	    FETCH NEXT FROM sl_cursor INTO @SLXml
	    WHILE @@FETCH_STATUS = 0  
	    BEGIN
            SET @SLId = NULL

            INSERT INTO dbo.FOMS_H_SL (
                ZapId,
                SL_ID,
                LPU_1,
                PODR,
                PROFIL,
                PROFIL_K,
                DET,
                P_CEL,
                NHISTORY,
                P_PER,
                DATE_1,
                DATE_2,
                KD,
                DS0,
                DS1,
                DS2,
                DS3,
                DN,
                CODE_MES1,
                CODE_MES2,
                REAB,
                PRVS,
                VERS_SPEC,
                IDDOKT,
                ED_COL,
                TARIF,
                SUM_M,
                COMENTSL
                )
		        SELECT
                    @ZapId,
			        a.value('SL_ID[1]', 'varchar(36)') AS SL_ID,
			        a.value('LPU_1[1]', 'varchar(8)') AS LPU_1,
			        a.value('PODR[1]', 'int') AS PODR,
			        a.value('PROFIL[1]', 'int') AS PROFIL,
			        a.value('PROFIL_K[1]', 'int') AS PROFIL_K, -- определить тип
			        a.value('DET[1]', 'int') AS DET,
			        a.value('P_CEL[1]', 'varchar(20)') AS P_CEL, -- определить тип
			        a.value('NHISTORY[1]', 'varchar(50)') AS NHISTORY,
			        a.value('P_PER[1]', 'int') AS P_PER, -- определить тип
			        a.value('DATE_1[1]', 'date') AS DATE_1,
			        a.value('DATE_2[1]', 'date') AS DATE_2,
			        a.value('KD[1]', 'varchar(20)') AS KD, -- определить тип
			        a.value('DS0[1]', 'varchar(10)') AS DS0,
			        a.value('DS1[1]', 'varchar(10)') AS DS1,
			        a.value('DS2[1]', 'varchar(10)') AS DS2,
			        a.value('DS3[1]', 'varchar(10)') AS DS3,
			        a.value('DN[1]', 'varchar(20)') AS DN, -- определить тип
			        a.value('CODE_MES1[1]', 'varchar(20)') AS CODE_MES1,
			        a.value('CODE_MES2[1]', 'varchar(20)') AS CODE_MES2,
			        a.value('REAB[1]', 'varchar(20)') AS REAB, -- определить тип
			        a.value('PRVS[1]', 'int') AS PRVS,
			        a.value('VERS_SPEC[1]', 'varchar(4)') AS VERS_SPEC,
			        a.value('IDDOKT[1]', 'varchar(25)') AS IDDOKT,
			        a.value('ED_COL[1]', 'decimal') AS ED_COL,
			        a.value('TARIF[1]', 'decimal') AS TARIF,
			        a.value('SUM_M[1]', 'decimal') AS SUM_M,
			        a.value('COMENTSL[1]', 'varchar(250)') AS COMENTSL
			        FROM @SLXml.nodes('SL') AS sl(a)

            SET @SLId = SCOPE_IDENTITY()

            INSERT INTO dbo.FOMS_H_KSG_KPG (
                SlId,
                N_KSG,
                VER_KSG,
                KSG_PG,
                N_KPG,
                KOEF_Z,
                KOEF_UP,
                BZTSZ,
                KOEF_D,
                KOEF_U,
                DKK1,
                DKK2,
                SL_K,
                IT_SL
                )
		        SELECT
                    @SLId,
			        a.value('N_KSG[1]', 'varchar(36)') AS N_KSG,
			        a.value('VER_KSG[1]', 'int') AS VER_KSG, -- определить тип
			        a.value('KSG_PG[1]', 'int') AS KSG_PG, -- определить тип
			        a.value('N_KPG[1]', 'varchar(20)') AS N_KPG, -- определить тип
			        a.value('KOEF_Z[1]', 'decimal') AS KOEF_Z, -- определить тип
			        a.value('KOEF_UP[1]', 'decimal') AS KOEF_UP, -- определить тип
			        a.value('BZTSZ[1]', 'decimal') AS BZTSZ, -- определить тип
			        a.value('KOEF_D[1]', 'decimal') AS KOEF_D, -- определить тип
			        a.value('KOEF_U[1]', 'decimal') AS KOEF_U, -- определить тип
			        a.value('DKK1[1]', 'varchar(20)') AS DKK1, -- определить тип
			        a.value('DKK2[1]', 'varchar(20)') AS DKK2, -- определить тип
			        a.value('SL_K[1]', 'int') AS SL_K, -- определить тип
			        a.value('IT_SL[1]', 'varchar(20)') AS IT_SL -- определить тип
			        FROM @SLXml.nodes('SL/KSG_KPG') AS ksg(a)

            INSERT INTO dbo.FOMS_H_SANK (
                SlId,
                S_CODE,
                S_SUM,
                S_TIP,
                S_OSN,
                S_COM,
                S_IST
                )
		        SELECT
                    @SLId,
			        a.value('S_CODE[1]', 'varchar(36)') AS S_CODE,
			        a.value('S_SUM[1]', 'decimal') AS S_SUM,
			        a.value('S_TIP[1]', 'int') AS S_TIP,
			        a.value('S_OSN[1]', 'int') AS S_OSN,
			        a.value('S_COM[1]', 'varchar(250)') AS S_COM,
			        a.value('S_IST[1]', 'int') AS S_IST
			        FROM @SLXml.nodes('SL/SANK') AS sank(a)
	
            INSERT INTO dbo.FOMS_H_USL (
                SlId,
                IDSERV,
                LPU,
                LPU_1,
                PODR,
                PROFIL,
                VID_VME,
                DET,
                DATE_IN,
                DATE_OUT,
                DS,
                CODE_USL,
                KOL_USL,
                TARIF,
                SUMV_USL,
                PRVS,
                CODE_MD,
                NPL,
                COMENTU
                )
		        SELECT
                    @SLId,
			        a.value('IDSERV[1]', 'varchar(36)') AS IDSERV,
			        a.value('LPU[1]', 'varchar(6)') AS LPU,
			        a.value('LPU_1[1]', 'varchar(8)') AS LPU_1,
			        a.value('PODR[1]', 'int') AS PODR,
			        a.value('PROFIL[1]', 'int') AS PROFIL,
			        a.value('VID_VME[1]', 'varchar(15)') AS VID_VME,
			        a.value('DET[1]', 'int') AS DET,
			        a.value('DATE_IN[1]', 'date') AS DATE_IN,
			        a.value('DATE_OUT[1]', 'date') AS DATE_OUT,
			        a.value('DS[1]', 'varchar(10)') AS DS,
			        a.value('CODE_USL[1]', 'varchar(20)') AS CODE_USL,
			        a.value('KOL_USL[1]', 'decimal') AS KOL_USL,
			        a.value('TARIF[1]', 'decimal') AS TARIF,
			        a.value('SUMV_USL[1]', 'decimal') AS SUMV_USL,
			        a.value('PRVS[1]', 'int') AS PRVS,
			        a.value('CODE_MD[1]', 'varchar(20)') AS CODE_MD,
			        a.value('NPL[1]', 'varchar(20)') AS NPL, -- определить тип
			        a.value('COMENTU[1]', 'varchar(100)') AS COMENTU
			        FROM @SLXml.nodes('SL/USL') AS u(a)

		    FETCH NEXT FROM sl_cursor INTO @SLXml
	    END

	    CLOSE sl_cursor
	    DEALLOCATE sl_cursor
		
	    FETCH NEXT FROM zap_cursor INTO @ZapXml
    END

    CLOSE zap_cursor
    DEALLOCATE zap_cursor
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSImportLReport]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE dbo.FOMSImportLReport
    @Xml xml
AS
BEGIN
    EXEC dbo.FOMSReportLClear

    DECLARE @PersXml xml = NULL

    DECLARE l_cursor CURSOR FOR
	    SELECT
		    a.query('(PERS)')
		    FROM @Xml.nodes('PERS_LIST') AS zl(a)
    OPEN l_cursor

    FETCH NEXT FROM l_cursor INTO @PersXml
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO dbo.FOMS_L_PERS (
            ID_PAC,
            FAM,
            IM,
            OT,
            W,
            DR,
            DOST,
            TEL,
            FAM_P,
            IM_P,
            OT_P,
            W_P,
            DR_P,
            DOST_P,
            MR,
            DOCTYPE,
            DOCSER,
            DOCNUM,
            SNILS,
            OKATOG,
            OKATOP,
            COMENTP
            )
            SELECT
                a.value('ID_PAC[1]', 'varchar(36)') AS ID_PAC,
                a.value('FAM[1]', 'varchar(40)') AS FAM,
                a.value('IM[1]', 'varchar(40)') AS IM,
                a.value('OT[1]', 'varchar(40)') AS OT,
                a.value('W[1]', 'int') AS W,
                a.value('DR[1]', 'date') AS DR,
                CAST((SELECT ', ' + a.value('(.)[1]', 'varchar(36)') FROM @PersXml.nodes('PERS/DOST') as p(a) FOR XML PATH(''), TYPE) AS VARCHAR(100)),
                a.value('TEL[1]', 'varchar(20)') AS TEL,
                a.value('FAM_P[1]', 'varchar(40)') AS FAM_P,
                a.value('IM_P[1]', 'varchar(40)') AS IM_P,
                a.value('OT_P[1]', 'varchar(40)') AS OT_P,
                a.value('W_P[1]', 'varchar(40)') AS W_P,
                a.value('DR_P[1]', 'date') AS DR_P,
                CAST((SELECT ', ' + a.value('(.)[1]', 'varchar(36)') FROM @PersXml.nodes('PERS/DOST_P') as p(a) FOR XML PATH(''), TYPE) AS VARCHAR(100)),
                a.value('MR[1]', 'varchar(100)') AS MR,
                a.value('DOCTYPE[1]', 'varchar(2)') AS DOCTYPE,
                a.value('DOCSER[1]', 'varchar(10)') AS DOCSER,
                a.value('DOCNUM[1]', 'varchar(20)') AS DOCNUM,
                a.value('SNILS[1]', 'varchar(14)') AS SNILS,
                a.value('OKATOG[1]', 'varchar(11)') AS OKATOG,
                a.value('OKATOP[1]', 'varchar(11)') AS OKATOP,
                a.value('COMENTP[1]', 'varchar(250)') AS COMENTP
                FROM @PersXml.nodes('PERS') AS p(a)
        
        FETCH NEXT FROM l_cursor INTO @PersXml
    END

    CLOSE l_cursor
    DEALLOCATE l_cursor
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSImportSReport]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE dbo.FOMSImportSReport
    @Xml xml
AS
BEGIN
    EXEC dbo.FOMSReportSClear

    DECLARE
        @SLXml xml = NULL,
        @RlXml xml = NULL,
        @UslXml xml = NULL,
        @FOMS_S_SL_ID int = NULL,
        @FOMS_S_USL_ID int = NULL

    DECLARE sl_cursor CURSOR FOR
	    SELECT
		    a.query('(SL)')
		    FROM @Xml.nodes('ZL_LIST') AS zl(a)
    OPEN sl_cursor

    FETCH NEXT FROM sl_cursor INTO @SLXml
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO dbo.FOMS_S_SL (
            SL_ID,
            IDCASE,
            NSNDHOSP,
            REN,
            SOFA,
            PARENT,
            D_TYPE,
            FROM_FIRM,
            DS1_M
            )
            SELECT
                a.value('SL_ID[1]', 'varchar(36)') AS SL_ID,
                a.value('IDCASE[1]', 'varchar(36)') AS IDCASE,
                a.value('NSNDHOSP[1]', 'varchar(10)') AS NSNDHOSP,
                a.value('REN[1]', 'int') AS REN,
                a.value('SOFA[1]', 'varchar(10)') AS SOFA,
                a.value('PARENT[1]', 'int') AS PARENT,
                a.value('D_TYPE[1]', 'varchar(3)') AS D_TYPE,
                a.value('FROM_FIRM[1]', 'varchar(3)') AS FROM_FIRM,
                CAST((SELECT ', ' + a.value('(.)[1]', 'varchar(250)') FROM @SLXml.nodes('SL/DS1_M') as p(a) FOR XML PATH(''), TYPE) AS VARCHAR(MAX))
                FROM @SLXml.nodes('SL') AS p(a)

        SET @FOMS_S_SL_ID = SCOPE_IDENTITY()

        DECLARE usl_cursor CURSOR FOR
	    SELECT
		    a.query('(USL)')
		    FROM @SLXml.nodes('SL') AS zl(a)
        OPEN usl_cursor

        FETCH NEXT FROM usl_cursor INTO @UslXml
        WHILE @@FETCH_STATUS = 0
        BEGIN
            INSERT INTO dbo.FOMS_S_USL (
                FOMS_S_SL_ID,
                IDSERV,
                PR_USL
                )
                SELECT
                    @FOMS_S_SL_ID,
                    a.value('IDSERV[1]', 'varchar(36)') AS IDSERV,
                    a.value('PR_USL[1]','varchar(40)') AS PR_USL
                    FROM @UslXml.nodes('SL') AS sl(a)

            SET @FOMS_S_USL_ID = SCOPE_IDENTITY()

            DECLARE rl_cursor CURSOR FOR
	        SELECT
		        a.query('(RL)')
		        FROM @UslXml.nodes('SL') AS zl(a)
            OPEN rl_cursor

            FETCH NEXT FROM rl_cursor INTO @RlXml
            WHILE @@FETCH_STATUS = 0
            BEGIN
                INSERT INTO dbo.FOMS_S_RL (
                    FOMS_S_USL_ID,
                    IDRL,
                    NAME_MNN,
                    ID_ATX,
                    ID_MI,
                    KOL_MI
                    ) 
                    SELECT
                        @FOMS_S_USL_ID,
                        a.value('IDRL[1]', 'varchar(36)') AS IDRL,
                        a.value('NAME_MNN[1]', 'varchar(40)') AS NAME_MNN,
                        a.value('ID_ATX[1]', 'varchar(40)') AS ID_ATX,
                        a.value('ID_MI[1]', 'varchar(40)') AS ID_MI,
                        a.value('KOL_MI[1]', 'int') AS KOL_MI
                        FROM @RlXml.nodes('RL') AS rl(a)

                FETCH NEXT FROM rl_cursor INTO @RlXml
            END

            CLOSE rl_cursor
            DEALLOCATE rl_cursor

            FETCH NEXT FROM usl_cursor INTO @UslXml
        END

        CLOSE usl_cursor
        DEALLOCATE usl_cursor

        FETCH NEXT FROM sl_cursor INTO @SLXml
    END

    CLOSE sl_cursor
    DEALLOCATE sl_cursor
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Выполняется создание [dbo].[FOMSImportVReport]...';


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE dbo.FOMSImportVReport
    @Xml xml
AS
BEGIN
    EXEC dbo.FOMSReportVClear

    DECLARE
        @ZapXml xml = NULL,
        @SLXml xml = NULL,
        @OXml xml = NULL,
        @FOMS_V_ZAP_ID int = NULL,
        @FOMS_V_SL_ID int = NULL

    DECLARE zap_cursor CURSOR FOR   
	SELECT
		a.query('(ZAP)')
		FROM @Xml.nodes('FLK_P') AS zl(a)
    OPEN zap_cursor  

    FETCH NEXT FROM zap_cursor INTO @ZapXml
    WHILE @@FETCH_STATUS = 0  
    BEGIN
        INSERT INTO dbo.FOMS_V_ZAP (
            N_ZAP
            )
            SELECT
                a.value('N_ZAP[1]', 'varchar(36)') AS N_ZAP
                FROM @ZapXml.nodes('ZAP') AS zap(a)
        
        SET @FOMS_V_ZAP_ID = SCOPE_IDENTITY()

        DECLARE sl_cursor CURSOR FOR   
	    SELECT
		    a.query('(SL)')
		    FROM @ZapXml.nodes('ZAP') AS sl(a)
        OPEN sl_cursor  

        FETCH NEXT FROM sl_cursor INTO @SLXml
        WHILE @@FETCH_STATUS = 0  
        BEGIN
            INSERT INTO dbo.FOMS_V_SL (
                FOMS_V_ZAP_ID,
                SL_ID,
                IDCASE,
                NHISTORY,
                [CARD],
                SMO,
                SMO_FOND
                )
                SELECT
                    @FOMS_V_ZAP_ID,
                    a.value('SL_ID[1]', 'varchar(36)') AS SL_ID,
                    a.value('IDCASE[1]', 'varchar(36)') AS IDCASE,
                    a.value('NHISTORY[1]', 'varchar(36)') AS NHISTORY,
                    a.value('CARD[1]', 'varchar(36)') AS [CARD],
                    a.value('SMO[1]', 'varchar(36)') AS SMO,
                    a.value('SMO_FOND[1]', 'varchar(36)') AS SMO_FOND
                    FROM @SLXml.nodes('SL') AS sl(a)

            SET @FOMS_V_SL_ID = SCOPE_IDENTITY()

            DECLARE o_cursor CURSOR FOR   
	        SELECT
		        a.query('(OTKAZ)')
		        FROM @SLXml.nodes('SL') AS otkaz(a)
            OPEN o_cursor  

            FETCH NEXT FROM o_cursor INTO @OXml
            WHILE @@FETCH_STATUS = 0  
            BEGIN
                INSERT INTO dbo.FOMS_V_OTKAZ (
                    FOMS_V_SL_ID,
                    I_TYPE,
                    COMMENT
                    )
                    SELECT
                        @FOMS_V_SL_ID,
                        a.value('I_TYPE[1]', 'varchar(36)') AS I_TYPE,
                        a.value('COMMENT[1]', 'varchar(250)') AS COMMENT
                        FROM @OXml.nodes('OTKAZ') AS o(a)

                FETCH NEXT FROM o_cursor INTO @OXml
            END

            CLOSE o_cursor
            DEALLOCATE o_cursor

            FETCH NEXT FROM sl_cursor INTO @SLXml
        END

        CLOSE sl_cursor
        DEALLOCATE sl_cursor


        FETCH NEXT FROM zap_cursor INTO @ZapXml
    END

    CLOSE zap_cursor
    DEALLOCATE zap_cursor
END
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Существующие данные проверяются относительно вновь созданных ограничений';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.FOMS_H_KSG_KPG'), OBJECT_ID(N'dbo.FOMS_H_PACIENT'), OBJECT_ID(N'dbo.FOMS_H_SANK'), OBJECT_ID(N'dbo.FOMS_H_SCHET'), OBJECT_ID(N'dbo.FOMS_H_SL'), OBJECT_ID(N'dbo.FOMS_H_USL'), OBJECT_ID(N'dbo.FOMS_H_Z_SL'), OBJECT_ID(N'dbo.FOMS_H_ZAP'), OBJECT_ID(N'dbo.FOMS_H_ZGLV'), OBJECT_ID(N'dbo.FOMS_IMPORT'), OBJECT_ID(N'dbo.FOMS_L_PERS'), OBJECT_ID(N'dbo.FOMS_L_PERS_LIST'), OBJECT_ID(N'dbo.FOMS_S_RL'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Проверка ограничения: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Ошибка при проверке ограничения:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'Произошла ошибка при проверке ограничений', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Обновление завершено.';


GO
