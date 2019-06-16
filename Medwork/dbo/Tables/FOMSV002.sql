CREATE TABLE [dbo].[FOMSV002] (
    [RecId]    INT            IDENTITY (1, 1) NOT NULL,
    [IDPR]     INT            NOT NULL,
    [PRNAME]   VARCHAR (1000) NOT NULL,
    [DATEBEG]  DATE           NOT NULL,
    [DATEEND]  DATE           NULL,
    [IsActive] BIT            CONSTRAINT [DF_FOMSV002_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_V002] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

