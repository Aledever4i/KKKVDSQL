CREATE TABLE [dbo].[FOMSV012] (
    [RecId]    INT            IDENTITY (1, 1) NOT NULL,
    [IDIZ]     INT            NOT NULL,
    [IZNAME]   VARCHAR (1000) NOT NULL,
    [DL_USLOV] INT            NOT NULL,
    [DATEBEG]  DATE           NOT NULL,
    [DATEEND]  DATE           NULL,
    [IsActive] BIT            CONSTRAINT [DF_FOMSV012_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_V012] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

