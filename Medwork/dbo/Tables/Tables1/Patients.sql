CREATE TABLE [dbo].[Patients] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [LastName]  NVARCHAR (MAX) NULL,
    [FirstName] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Patients] PRIMARY KEY CLUSTERED ([ID] ASC)
);

