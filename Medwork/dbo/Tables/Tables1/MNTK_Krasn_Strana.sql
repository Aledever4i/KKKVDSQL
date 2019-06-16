CREATE TABLE [dbo].[MNTK_Krasn_Strana] (
    [ID]        INT           NOT NULL,
    [KOD]       NVARCHAR (3)  NULL,
    [NAMESHORT] NVARCHAR (50) NULL,
    [NAMEFULL]  NVARCHAR (70) NULL,
    [ALFA_1]    NVARCHAR (2)  NULL,
    [ALFA_2]    NVARCHAR (3)  NULL,
    [FLAG1]     NVARCHAR (1)  NULL,
    CONSTRAINT [MNTK_Krasn_StranaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

