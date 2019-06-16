CREATE TABLE [dbo].[FOMSV015] (
    [RecId]    INT           IDENTITY (1, 1) NOT NULL,
    [ID]       INT           NOT NULL,
    [CODE]     INT           NULL,
    [NAME]     VARCHAR (MAX) NULL,
    [HIGH]     INT           NULL,
    [OKSO]     INT           NULL,
    [DATEBEG]  DATE          NOT NULL,
    [DATEEND]  DATE          NULL,
    [IsActive] BIT           CONSTRAINT [DF_FOMSV015_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_V015] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

