CREATE TABLE [dbo].[FOMSF014] (
    [RecId]   INT            IDENTITY (1, 1) NOT NULL,
    [Kod]     INT            NOT NULL,
    [IDVID]   INT            NULL,
    [Naim]    VARCHAR (1000) NOT NULL,
    [Osn]     VARCHAR (1000) NOT NULL,
    [Komment] VARCHAR (1000) NOT NULL,
    [KodPG]   VARCHAR (1000) NULL,
    [DATEBEG] DATE           NOT NULL,
    [DATEEND] DATE           NULL,
    CONSTRAINT [PK_F014] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

