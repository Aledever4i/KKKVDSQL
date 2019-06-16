CREATE TABLE [dbo].[FOMSServiceTypes] (
    [ID]       INT           IDENTITY (1, 1) NOT NULL,
    [CD_USL]   VARCHAR (10)  NOT NULL,
    [K_GR]     VARCHAR (1)   NULL,
    [N_GR]     VARCHAR (100) NULL,
    [K_PGR]    VARCHAR (10)  NULL,
    [N_PGR]    VARCHAR (100) NULL,
    [K_PRIZ]   VARCHAR (10)  NULL,
    [N_PRIZ]   VARCHAR (100) NULL,
    [NAME]     VARCHAR (255) NULL,
    [TRUD]     INT           NULL,
    [TERCODE]  VARCHAR (50)  NULL,
    [IsActive] BIT           CONSTRAINT [DF_FOMSServiceTypes_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FOMSServiceTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

