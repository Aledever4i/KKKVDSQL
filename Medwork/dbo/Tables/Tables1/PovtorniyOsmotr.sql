CREATE TABLE [dbo].[PovtorniyOsmotr] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [Data]             DATETIME      NULL,
    [Vrach]            NVARCHAR (50) NULL,
    [mesto]            NVARCHAR (50) NULL,
    [Zhalobi]          NVARCHAR (50) NULL,
    [ObsheeSostoyanie] NVARCHAR (50) NULL,
    [Temperatura]      FLOAT (53)    NULL,
    [Puls]             INT           NULL,
    [AD sist]          INT           NULL,
    [ADdiast]          INT           NULL,
    [Obektivno]        NTEXT         NULL,
    [Lechenie]         NTEXT         NULL,
    [Obsledovanie]     NTEXT         NULL,
    [Konsultatsiya]    NTEXT         NULL,
    [Diagnoz]          NVARCHAR (50) NULL,
    [BolnichniyListS]  DATETIME      NULL,
    [BolnichniyListPo] DATETIME      NULL,
    CONSTRAINT [PovtorniyOsmotrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyOsmotrToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

