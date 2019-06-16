CREATE TABLE [dbo].[RMISRegister] (
    [ID]           INT            NOT NULL,
    [edSourceName] NVARCHAR (100) NULL,
    [cbPRGM]       NVARCHAR (10)  NULL,
    [edPath]       NVARCHAR (255) NULL,
    [DateE]        DATETIME       NULL,
    [DateS]        DATETIME       NULL,
    [edGUID]       NVARCHAR (36)  NULL,
    [CreateDate]   DATETIME       NULL,
    [Author]       INT            NULL,
    CONSTRAINT [RMISRegisterPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

