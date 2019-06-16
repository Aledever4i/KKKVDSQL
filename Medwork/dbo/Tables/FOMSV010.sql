CREATE TABLE [dbo].[FOMSV010] (
    [RecId]   INT            IDENTITY (1, 1) NOT NULL,
    [IDSP]    INT            NOT NULL,
    [SPNAME]  VARCHAR (1000) NOT NULL,
    [DATEBEG] DATE           NOT NULL,
    [DATEEND] DATE           NULL,
    CONSTRAINT [PK_V010] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

