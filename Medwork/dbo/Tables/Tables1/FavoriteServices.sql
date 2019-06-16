CREATE TABLE [dbo].[FavoriteServices] (
    [ID]          INT            NOT NULL,
    [MasterID]    INT            NULL,
    [Code]        NVARCHAR (20)  NULL,
    [Checked]     BIT            NULL,
    [Quant]       INT            NULL,
    [SortField]   INT            NULL,
    [ServiceName] NVARCHAR (255) NULL,
    [Price]       MONEY          NULL,
    CONSTRAINT [FavoriteServicesPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FavoriteServicesToFavoriteServicesDict] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[FavoriteServicesDict] ([ID]) ON DELETE CASCADE
);

