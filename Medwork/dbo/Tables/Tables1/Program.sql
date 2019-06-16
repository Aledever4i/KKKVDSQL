CREATE TABLE [dbo].[Program] (
    [ID]                    INT            NOT NULL,
    [MasterID]              INT            NULL,
    [Name]                  NVARCHAR (255) NULL,
    [Inherited]             BIT            NULL,
    [ParentProgramID]       NVARCHAR (16)  NULL,
    [Text]                  NTEXT          NULL,
    [sel1]                  NVARCHAR (1)   NULL,
    [IncludeCategories]     NTEXT          NULL,
    [sel2]                  NVARCHAR (1)   NULL,
    [ExcludeCategories]     NTEXT          NULL,
    [Skidka]                FLOAT (53)     NULL,
    [sel]                   NVARCHAR (1)   NULL,
    [Credit]                FLOAT (53)     NULL,
    [Balance]               FLOAT (53)     NULL,
    [Debet]                 FLOAT (53)     NULL,
    [Code]                  NVARCHAR (30)  NULL,
    [Contract]              NVARCHAR (50)  NULL,
    [EstIncludedCategories] BIT            NULL,
    [EstExcludedCategories] BIT            NULL,
    CONSTRAINT [ProgramPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProgramToinsurance] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[insurance] ([ID]) ON DELETE CASCADE
);

