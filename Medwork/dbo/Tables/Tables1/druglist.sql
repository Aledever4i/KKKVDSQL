CREATE TABLE [dbo].[druglist] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [Название]      VARCHAR (255) NULL,
    [Название лат.] VARCHAR (255) NULL,
    [Code]          INT           NULL,
    [Code ATX]      VARCHAR (8)   NULL,
    [Reference]     VARCHAR (13)  NOT NULL,
    CONSTRAINT [PK_druglist2] PRIMARY KEY CLUSTERED ([ID] ASC)
);

