CREATE TABLE [dbo].[Vaktsini] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [MasterID]         INT           NULL,
    [Preparat]         NVARCHAR (50) NULL,
    [HarakterReaktsii] NVARCHAR (50) NULL,
    [Data]             DATETIME      NULL,
    CONSTRAINT [VaktsiniPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VaktsiniToOsmotrAllergologa] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[OsmotrAllergologa] ([ID]) ON DELETE CASCADE
);

