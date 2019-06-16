CREATE TABLE [dbo].[RMIS_LP] (
    [ID]       INT            NOT NULL,
    [MasterID] INT            NULL,
    [MCOD]     NVARCHAR (15)  NULL,
    [MNAME]    NVARCHAR (254) NULL,
    [CHD]      DATETIME       NULL,
    CONSTRAINT [RMIS_LPPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

