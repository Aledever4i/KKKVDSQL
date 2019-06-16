CREATE TABLE [dbo].[PreparatyRLS] (
    [ID]                INT            NOT NULL,
    [Text]              NVARCHAR (255) NULL,
    [Doza]              REAL           NULL,
    [Kontsentratsiya]   REAL           NULL,
    [Forma]             INT            NULL,
    [SposobPriema]      INT            NULL,
    [Naimenovanie]      NVARCHAR (50)  NULL,
    [EditBox1]          REAL           NULL,
    [Obyem]             REAL           NULL,
    [Rem]               NVARCHAR (254) NULL,
    [LatName]           NVARCHAR (100) NULL,
    [StockCode]         NVARCHAR (100) NULL,
    [Description1]      NVARCHAR (250) NULL,
    [Description2]      NVARCHAR (250) NULL,
    [ProductGroup]      NVARCHAR (10)  NULL,
    [Packing Code]      NVARCHAR (10)  NULL,
    [Medical unit]      NVARCHAR (10)  NULL,
    [Convertion factor] FLOAT (53)     NULL
);

