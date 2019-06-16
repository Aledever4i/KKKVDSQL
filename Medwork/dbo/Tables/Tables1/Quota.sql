CREATE TABLE [dbo].[Quota] (
    [ID]            INT            NOT NULL,
    [Name_Quota]    NVARCHAR (200) NULL,
    [qty]           INT            NULL,
    [DateS]         SMALLDATETIME  NULL,
    [DateE]         SMALLDATETIME  NULL,
    [Period]        INT            NULL,
    [lib_object_id] INT            NULL,
    [resource]      INT            NULL,
    [dept]          INT            NULL,
    [user_id]       INT            NULL,
    [user_dept]     INT            NULL,
    [atttype]       INT            NULL,
    [severity]      INT            NULL,
    [available]     BIT            NULL,
    CONSTRAINT [QuotaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

