CREATE TABLE [dbo].[FOMSV009] (
    [RecId]      INT            IDENTITY (1, 1) NOT NULL,
    [IDRMP]      INT            NOT NULL,
    [RMPNAME]    VARCHAR (1000) NOT NULL,
    [DL_USLOV]   INT            NOT NULL,
    [DATEBEG]    DATE           NOT NULL,
    [DATEEND]    DATE           NULL,
    [IsActive]   BIT            CONSTRAINT [DF_FOMSV009_IsActive] DEFAULT ((0)) NOT NULL,
    [TalonDescr] VARCHAR (MAX)  NULL,
    CONSTRAINT [PK_V009] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

