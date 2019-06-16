CREATE TABLE [dbo].[DocumentTemplates] (
    [ID]              INT             NOT NULL,
    [DefaultTemplate] BIT             NOT NULL,
    [Author]          INT             NOT NULL,
    [AuthorName]      NVARCHAR (50)   NOT NULL,
    [FormGUID]        NVARCHAR (32)   NOT NULL,
    [FormPath]        NVARCHAR (1024) NOT NULL,
    [TemplateName]    NVARCHAR (50)   NOT NULL,
    [Data]            NTEXT           NULL,
    CONSTRAINT [PKDocumentTemplatesID] PRIMARY KEY CLUSTERED ([ID] ASC)
);

