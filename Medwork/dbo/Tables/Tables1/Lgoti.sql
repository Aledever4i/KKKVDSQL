CREATE TABLE [dbo].[Lgoti] (
    [ID]                  INT            NOT NULL,
    [MasterID]            INT            NULL,
    [KategoriyaLgotnosti] INT            NULL,
    [Ser]                 NVARCHAR (9)   NULL,
    [Num]                 NVARCHAR (10)  NULL,
    [Date]                DATETIME       NULL,
    [KemVidan]            NVARCHAR (50)  NULL,
    [Osnov]               NVARCHAR (50)  NULL,
    [EndDate]             DATETIME       NULL,
    [Diags]               NVARCHAR (100) NULL,
    [Status]              CHAR (1)       NULL,
    CONSTRAINT [LgotiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LgotiToPatient] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Patient] ([ID]) ON DELETE CASCADE
);

