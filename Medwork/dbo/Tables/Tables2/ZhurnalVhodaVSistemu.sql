CREATE TABLE [dbo].[ZhurnalVhodaVSistemu] (
    [ID]         INT      IDENTITY (1, 1) NOT NULL,
    [DataVremya] DATETIME NOT NULL,
    [UserID]     INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

