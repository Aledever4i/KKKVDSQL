﻿CREATE TABLE [dbo].[Chist_temp2] (
    [Код]                                                    BIGINT         NOT NULL,
    [Номер направления 3234,,,,, ВСЕГО должно быть 9 знаков] NVARCHAR (255) NULL,
    [Дата направления]                                       DATETIME2 (7)  NULL,
    [Форма оказания помощи 1 - план  2 - неотложная]         NTEXT          NULL,
    [Код МО направившей пациента (писать название МО)]       NVARCHAR (255) NULL,
    [Дата факт госпитализации]                               DATETIME2 (7)  NULL,
    [Время факт госпитализации]                              DATETIME2 (7)  NULL,
    [Тип полиса, 1 - старый, 2 - врем св, 3- ЕНП]            NTEXT          NULL,
    [Серия полиса]                                           NVARCHAR (255) NULL,
    [Номер полиса]                                           NVARCHAR (255) NULL,
    [Код СМО 25011 ВСА 25016 СВМ]                            NTEXT          NULL,
    [Код диагноза МКБ приемного отделения]                   NVARCHAR (255) NULL,
    [Профиль койки]                                          NTEXT          NULL,
    [Код отделения]                                          NTEXT          NULL,
    [№ истории болезни]                                      NVARCHAR (255) NULL,
    [Тип госпитализации 2]                                   NTEXT          NULL,
    [Код территории страх-я ОКАТО]                           NTEXT          NULL,
    [FAM]                                                    NVARCHAR (255) NULL,
    [IMYA]                                                   NVARCHAR (255) NULL,
    [OTCH]                                                   NVARCHAR (255) NULL,
    [Пол 1 м 2 ж]                                            NTEXT          NULL,
    [Дата рождения]                                          DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Код] ASC)
);

