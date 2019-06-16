CREATE TABLE [dbo].[UslugiProfosmotra] (
    [ID]             INT            NOT NULL,
    [PatID]          INT            NULL,
    [MasterID]       INT            NULL,
    [Zaklyuchenie]   NVARCHAR (100) NULL,
    [Kommentrariy]   NTEXT          NULL,
    [ObjectID]       INT            NULL,
    [Vrach]          INT            NULL,
    [Kabinet]        NVARCHAR (50)  NULL,
    [LinkedResource] INT            NULL,
    [Data]           DATETIME       NULL,
    [ServiceName]    NVARCHAR (255) NULL,
    [Service]        NVARCHAR (20)  NULL,
    [TableName]      NVARCHAR (100) NULL,
    [AnyText]        BIT            NULL,
    [KtoNaznachil]   INT            NULL,
    [Done]           BIT            NULL,
    [ObjectFormId]   INT            NULL,
    [Recommendation] NTEXT          NULL,
    CONSTRAINT [UslugiProfosmotraPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UslugiProfosmotraToProgrammaProfosmotra] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ProgrammaProfosmotra] ([ID]) ON DELETE CASCADE
);

