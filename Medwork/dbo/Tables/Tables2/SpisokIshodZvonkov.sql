CREATE TABLE [dbo].[SpisokIshodZvonkov] (
    [Category]    NVARCHAR (50)  NULL,
    [ID]          INT            NOT NULL,
    [Дата]        DATETIME       NULL,
    [Телефон]     NVARCHAR (20)  NULL,
    [Время]       DATETIME       NULL,
    [Цель звонка] NVARCHAR (50)  NULL,
    [Выполнено]   INT            NULL,
    [Автор]       INT            NULL,
    [Примечание]  NTEXT          NULL,
    [PatId]       INT            NULL,
    [Кому]        NVARCHAR (100) NULL,
    [Napravlenie] INT            NULL,
    [ContactsRg]  NVARCHAR (50)  NULL,
    [DomTelEd]    NVARCHAR (50)  NULL,
    [RabTelEd]    NVARCHAR (50)  NULL,
    [MobTelEd]    NVARCHAR (50)  NULL,
    [SkypeEd]     NVARCHAR (50)  NULL,
    [CallType]    NVARCHAR (50)  NULL,
    CONSTRAINT [SpisokIshodZvonkovPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idxSpisokIshodZvonkovVipolneno]
    ON [dbo].[SpisokIshodZvonkov]([Выполнено] ASC)
    INCLUDE([Дата], [Автор], [Телефон]);

