CREATE TABLE [dbo].[UchastnikOsmotra] (
    [ID]       INT           NOT NULL,
    [MasterID] INT           NULL,
    [Role]     NVARCHAR (50) NULL,
    [DeptID]   INT           NULL,
    [Resource] NVARCHAR (50) NULL,
    CONSTRAINT [UchastnikOsmotraPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UchastnikOsmotraToOsmotrVrachaPriemnogoOtdeleniya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[OsmotrVrachaPriemnogoOtdeleniya] ([ID]) ON DELETE CASCADE
);

