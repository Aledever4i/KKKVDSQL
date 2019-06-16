CREATE TABLE [dbo].[Limfouzli] (
    [ID]                             INT           NOT NULL,
    [PatID]                          INT           NULL,
    [MasterID]                       INT           NULL,
    [DictCombo1]                     NVARCHAR (50) NULL,
    [Uvelicheni]                     NVARCHAR (1)  NULL,
    [Boleznenni]                     NVARCHAR (1)  NULL,
    [Neelastichni]                   NVARCHAR (1)  NULL,
    [SpayaniSOkruzhayushimiTkanyami] NVARCHAR (1)  NULL,
    CONSTRAINT [LimfouzliPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LimfouzliToPovtorniyPriMTerapevta] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PovtorniyPriMTerapevta] ([ID]) ON DELETE CASCADE
);

