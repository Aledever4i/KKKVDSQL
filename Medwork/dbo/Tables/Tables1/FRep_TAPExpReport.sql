﻿CREATE TABLE [dbo].[FRep_TAPExpReport] (
    [GUID]                      UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ReportID]                  INT              NULL,
    [ConnectionID]              INT              NULL,
    [Валидность]                NVARCHAR (10)    NULL,
    [Номер ТАП]                 NVARCHAR (10)    NULL,
    [Дата приема]               NVARCHAR (20)    NULL,
    [Номер полиса]              NVARCHAR (100)   NULL,
    [Номер пациента]            NVARCHAR (10)    NULL,
    [Фамилия пациента]          NVARCHAR (20)    NULL,
    [Имя пациента]              NVARCHAR (20)    NULL,
    [Пол]                       NVARCHAR (10)    NULL,
    [ДУЛ]                       NVARCHAR (100)   NULL,
    [Адрес регистрации]         NVARCHAR (250)   NULL,
    [ФИО регистратора пациента] NVARCHAR (100)   NULL,
    [ФИО регистратора]          NVARCHAR (100)   NULL,
    [Код специалиста]           NVARCHAR (10)    NULL,
    [Фамилия специалиста]       NVARCHAR (20)    NULL,
    [Имя специалиста]           NVARCHAR (20)    NULL,
    [Пол специалиста]           NVARCHAR (10)    NULL,
    [ДР специалиста]            NVARCHAR (20)    NULL,
    [Отделение врача]           NVARCHAR (60)    NULL,
    [Должность]                 NVARCHAR (80)    NULL,
    [Специальность]             NVARCHAR (60)    NULL,
    [Вид оплаты]                NVARCHAR (255)   NULL,
    [Основной диагноз]          NVARCHAR (10)    NULL,
    [Ошибка в услуге ТАП]       NVARCHAR (10)    NULL,
    CONSTRAINT [FRep_TAPExpReportPrimKey] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FRep_TAPExpReportToConsolidatedReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[ConsolidatedReport] ([ID]) ON DELETE CASCADE
);
