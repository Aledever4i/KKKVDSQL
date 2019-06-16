CREATE TABLE [dbo].[RMU] (
    [ID]     INT            NOT NULL,
    [Раздел] NVARCHAR (20)  NULL,
    [Code]   NVARCHAR (20)  NULL,
    [Name]   NVARCHAR (100) NULL,
    [Uetvr]  FLOAT (53)     NULL,
    [Uetms]  FLOAT (53)     NULL,
    CONSTRAINT [PK_RMU] PRIMARY KEY CLUSTERED ([ID] ASC)
);

