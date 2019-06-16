CREATE TABLE [dbo].[OMS_razdel] (
    [ID]   INT           NOT NULL,
    [Name] NVARCHAR (68) NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [ixPrimaryKey]
    ON [dbo].[OMS_razdel]([ID] ASC);

