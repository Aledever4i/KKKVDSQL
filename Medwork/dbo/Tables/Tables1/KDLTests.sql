CREATE TABLE [dbo].[KDLTests] (
    [ID]        INT             NOT NULL,
    [Code]      NVARCHAR (20)   NULL,
    [Name]      NVARCHAR (1500) NULL,
    [isProfile] BIT             NULL,
    CONSTRAINT [KDLTestsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [KDLTestsCodeIdx]
    ON [dbo].[KDLTests]([Code] ASC);

