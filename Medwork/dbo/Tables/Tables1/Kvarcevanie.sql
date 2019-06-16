CREATE TABLE [dbo].[Kvarcevanie] (
    [ID]        INT            NOT NULL,
    [Дата]      DATETIME       NULL,
    [Время]     DATETIME       NULL,
    [Сотрудник] NVARCHAR (200) NULL,
    [Кабинет]   NVARCHAR (50)  NULL,
    CONSTRAINT [KvarcevaniePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

