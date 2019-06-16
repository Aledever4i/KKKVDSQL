CREATE TABLE [dbo].[Quota_Log] (
    [UID]            UNIQUEIDENTIFIER NULL,
    [quota_id]       INT              NOT NULL,
    [lib_object_id]  INT              NOT NULL,
    [form_id]        INT              NOT NULL,
    [form_tablename] NVARCHAR (256)   NULL,
    [PatFormID]      INT              NULL,
    [quota_date]     DATETIME         NULL,
    [init_rest]      INT              NULL,
    [record_date]    DATETIME         NULL,
    [user_id]        INT              NULL,
    [active]         BIT              DEFAULT ((1)) NULL,
    CONSTRAINT [FK_Quota_Log_PatForm] FOREIGN KEY ([PatFormID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [Quota_Log_quota_id_Idx]
    ON [dbo].[Quota_Log]([quota_id] ASC);


GO
CREATE NONCLUSTERED INDEX [Quota_Log_quota_date_Idx]
    ON [dbo].[Quota_Log]([quota_date] ASC);

