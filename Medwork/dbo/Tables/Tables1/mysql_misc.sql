CREATE TABLE [dbo].[mysql_misc] (
    [id]        INT           NOT NULL,
    [id_doc]    INT           CONSTRAINT [DF__mysql_mis__id_do__324636EB] DEFAULT (NULL) NULL,
    [phone]     BIGINT        CONSTRAINT [DF__mysql_mis__phone__333A5B24] DEFAULT (NULL) NULL,
    [percent]   INT           CONSTRAINT [DF__mysql_mis__perce__342E7F5D] DEFAULT (NULL) NULL,
    [workplace] VARCHAR (255) CONSTRAINT [DF__mysql_mis__workp__3522A396] DEFAULT (NULL) NULL
);

