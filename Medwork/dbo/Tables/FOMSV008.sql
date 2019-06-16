CREATE TABLE [dbo].[FOMSV008] (
    [RecId]    INT            IDENTITY (1, 1) NOT NULL,
    [IDVMP]    INT            NOT NULL,
    [VMPNAME]  VARCHAR (1000) NOT NULL,
    [DATEBEG]  DATE           NOT NULL,
    [DATEEND]  DATE           NULL,
    [MasterId] INT            NULL,
    CONSTRAINT [PK_V008] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

