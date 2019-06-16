CREATE TABLE [dbo].[INVITRO_ReqInformationDict] (
    [ID]      INT           NOT NULL,
    [Code]    NVARCHAR (10) NULL,
    [Measure] NVARCHAR (50) NULL,
    [Name]    NVARCHAR (50) NULL,
    CONSTRAINT [INVITRO_ReqInformationDictPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

