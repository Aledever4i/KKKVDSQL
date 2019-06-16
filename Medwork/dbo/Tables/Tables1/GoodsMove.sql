CREATE TABLE [dbo].[GoodsMove] (
    [id]        INT           NOT NULL,
    [DepId]     INT           NULL,
    [DocId]     INT           NOT NULL,
    [DocType]   INT           NOT NULL,
    [GoodsCode] VARCHAR (150) NOT NULL,
    [Debet]     FLOAT (53)    NULL,
    [Credit]    FLOAT (53)    NULL,
    [DocDate]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

