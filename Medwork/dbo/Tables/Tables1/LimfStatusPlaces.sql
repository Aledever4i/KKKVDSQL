CREATE TABLE [dbo].[LimfStatusPlaces] (
    [id]       INT          NOT NULL,
    [masterid] INT          NULL,
    [nodetype] VARCHAR (12) NULL,
    [name]     VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

