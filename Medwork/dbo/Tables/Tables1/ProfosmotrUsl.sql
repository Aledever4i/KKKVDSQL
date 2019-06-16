CREATE TABLE [dbo].[ProfosmotrUsl] (
    [ID]          INT             NOT NULL,
    [MasterID]    INT             NULL,
    [code]        NVARCHAR (12)   NULL,
    [servicename] NVARCHAR (1024) NULL,
    [tablename]   NVARCHAR (50)   NULL,
    [ObjectId]    INT             NULL,
    [FormId]      INT             NULL,
    [Resource]    INT             NULL,
    [ord]         FLOAT (53)      NULL,
    [Kabinet]     NVARCHAR (100)  NULL,
    [Vrach]       NVARCHAR (100)  NULL,
    [Avtor]       NVARCHAR (100)  NULL,
    [EditDate]    DATETIME        NULL,
    CONSTRAINT [ProfosmotrUslPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProfosmotrUslToProfosmotr] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Profosmotr] ([ID]) ON DELETE CASCADE
);

