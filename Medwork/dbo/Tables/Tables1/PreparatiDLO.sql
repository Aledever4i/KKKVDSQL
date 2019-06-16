CREATE TABLE [dbo].[PreparatiDLO] (
    [МНН]           NVARCHAR (255) NULL,
    [ТН]            NVARCHAR (255) NULL,
    [ЛФ]            NVARCHAR (255) NULL,
    [Дозировка]     NVARCHAR (255) NULL,
    [Производитель] NVARCHAR (255) NULL,
    [Цена]          FLOAT (53)     NULL,
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [RP]            NVARCHAR (255) NULL
);

