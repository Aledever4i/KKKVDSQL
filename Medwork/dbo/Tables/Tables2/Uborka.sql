CREATE TABLE [dbo].[Uborka] (
    [ID]         INT            NOT NULL,
    [Дата]       DATETIME       NULL,
    [Время]      DATETIME       NULL,
    [Сотрудник]  NVARCHAR (200) NULL,
    [Вид работы] NVARCHAR (100) NULL,
    [Kabinet]    NVARCHAR (50)  NULL,
    CONSTRAINT [UborkaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

