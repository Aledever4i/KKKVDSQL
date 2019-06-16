CREATE TABLE [dbo].[UchastnikOperatsii] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [OpRole]   NVARCHAR (50) NULL,
    [Resource] INT           NULL,
    CONSTRAINT [UchastnikOperatsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

