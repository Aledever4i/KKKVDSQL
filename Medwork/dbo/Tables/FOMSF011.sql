CREATE TABLE [dbo].[FOMSF011] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [IDDoc]        INT           NULL,
    [DocName]      VARCHAR (300) NULL,
    [DocSer]       VARCHAR (20)  NULL,
    [DocNum]       VARCHAR (20)  NULL,
    [IsActive]     BIT           NULL,
    [order]        INT           NULL,
    [DATEBEG]      DATE          NULL,
    [DATEEND]      DATE          NULL,
    [DocNameShort] VARCHAR (100) NULL
);

