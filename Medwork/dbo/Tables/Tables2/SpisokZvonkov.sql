CREATE TABLE [dbo].[SpisokZvonkov] (
    [ID]               INT              NOT NULL,
    [Дата]             DATETIME         NULL,
    [Примечание]       NTEXT            NULL,
    [Автор]            INT              NULL,
    [Время]            DATETIME         NULL,
    [Category]         NVARCHAR (50)    NULL,
    [Источник рекламы] NVARCHAR (100)   NULL,
    [Цель звонка]      NVARCHAR (100)   NULL,
    [Кто звонил]       NVARCHAR (60)    NULL,
    [Повод обращения]  NVARCHAR (50)    NULL,
    [PatId]            INT              NULL,
    [LastName]         NVARCHAR (50)    NULL,
    [FirstName]        NVARCHAR (50)    NULL,
    [SecondName]       NVARCHAR (50)    NULL,
    [Phone]            NVARCHAR (50)    NULL,
    [CardNum]          NVARCHAR (50)    NULL,
    [DeptId]           INT              NULL,
    [Specalist]        NVARCHAR (50)    NULL,
    [Kateg]            NVARCHAR (50)    NULL,
    [IstochnikReklamy] INT              NULL,
    [DataPriema]       DATETIME         NULL,
    [Resource]         INT              NULL,
    [VremyaPriema]     DATETIME         NULL,
    [Duration]         INT              NULL,
    [ShowInSchedule]   BIT              NULL,
    [SourceName]       NVARCHAR (50)    NULL,
    [SourceOrgName]    NVARCHAR (200)   NULL,
    [ResourceName]     NVARCHAR (20)    NULL,
    [Primechanie]      NTEXT            NULL,
    [Data]             DATETIME         NULL,
    [Vremya]           DATETIME         NULL,
    [Phonetype]        NVARCHAR (50)    NULL,
    [AuthorGUID]       UNIQUEIDENTIFIER NULL,
    [DeletedBy]        NVARCHAR (20)    NULL,
    [AppointmentId]    INT              NULL,
    CONSTRAINT [SpisokZvonkovPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idxSpisokZvonkovinShedule]
    ON [dbo].[SpisokZvonkov]([ShowInSchedule] ASC, [DataPriema] ASC)
    INCLUDE([Resource], [VremyaPriema], [Duration]);

