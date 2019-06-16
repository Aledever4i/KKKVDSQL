CREATE TABLE [dbo].[l] (
    [ID]                             INT           NOT NULL,
    [PatID]                          INT           NULL,
    [MasterID]                       INT           NULL,
    [GruppiLimfouzlov]               NVARCHAR (50) NULL,
    [Uvelicheni]                     NVARCHAR (1)  NULL,
    [Boleznenni]                     NVARCHAR (1)  NULL,
    [Neelastichni]                   NVARCHAR (1)  NULL,
    [SpayaniSOkruzhayushimiTkanyami] NVARCHAR (1)  NULL,
    CONSTRAINT [lPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [lToDannieObshegoObsledovaniya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[DannieObshegoObsledovaniya] ([ID]) ON DELETE CASCADE
);

