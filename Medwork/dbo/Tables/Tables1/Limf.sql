CREATE TABLE [dbo].[Limf] (
    [ID]                             INT           NOT NULL,
    [PatID]                          INT           NULL,
    [MasterID]                       INT           NULL,
    [DictCombo1]                     NVARCHAR (50) NULL,
    [Uvelicheni]                     NVARCHAR (1)  NULL,
    [Boleznenni]                     NVARCHAR (1)  NULL,
    [Neelastichni]                   NVARCHAR (1)  NULL,
    [SpayaniSOkruzhayushimiTkanyami] NVARCHAR (1)  NULL,
    CONSTRAINT [LimfPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LimfToPervichniyPriMTerapevta] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PervichniyPriMTerapevta] ([ID]) ON DELETE CASCADE
);

