CREATE TABLE [dbo].[DopolnitelnieDannie] (
    [ID]                               INT           NOT NULL,
    [PatID]                            INT           NULL,
    [KolichestvoChlenovSemi]           INT           NULL,
    [KolichestvoDetey]                 INT           NULL,
    [MatOtets]                         NVARCHAR (1)  NULL,
    [DrugieChleniSemi]                 NVARCHAR (50) NULL,
    [NuzhdaetsyaVPomoshiSotsRabotnika] NVARCHAR (1)  NULL,
    [OkazaniePomoshiSotsRabotnikom]    NVARCHAR (1)  NULL,
    [NalichieVoennihTravmZabolevaniy]  NVARCHAR (1)  NULL,
    [Voennietravmi]                    NVARCHAR (50) NULL,
    [Data]                             DATETIME      NULL,
    [Avtor]                            NVARCHAR (50) NULL,
    [MasterID]                         INT           NULL,
    [VPomoshiSotsRabotnika]            NVARCHAR (50) NULL,
    [PomoshSotsRabotnikom]             NVARCHAR (50) NULL,
    CONSTRAINT [DopolnitelnieDanniePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DopolnitelnieDannieToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

