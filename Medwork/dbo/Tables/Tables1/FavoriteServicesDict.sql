CREATE TABLE [dbo].[FavoriteServicesDict] (
    [ID]          INT           NOT NULL,
    [NameDict]    NVARCHAR (50) NULL,
    [PeriodStart] DATETIME      NULL,
    [PeriodEnd]   DATETIME      NULL,
    CONSTRAINT [FavoriteServicesDictPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

