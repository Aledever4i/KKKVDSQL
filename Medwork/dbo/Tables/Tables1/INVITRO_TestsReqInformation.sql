CREATE TABLE [dbo].[INVITRO_TestsReqInformation] (
    [ID]              INT           NOT NULL,
    [InformationCode] NVARCHAR (6)  NULL,
    [test_code]       NVARCHAR (10) NULL,
    CONSTRAINT [INVITRO_TestsReqInformationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

