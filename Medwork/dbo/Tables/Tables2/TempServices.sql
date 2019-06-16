CREATE TABLE [dbo].[TempServices] (
    [ID]          INT            NOT NULL,
    [spid]        INT            NOT NULL,
    [GUID]        NVARCHAR (32)  NULL,
    [Creator]     INT            NULL,
    [CreateDate]  DATETIME       NULL,
    [PaymentType] INT            NULL,
    [PaymentCode] INT            NULL,
    [ServiceName] NVARCHAR (255) NULL,
    [Service]     NVARCHAR (50)  NULL,
    [Quant]       INT            NULL,
    [Price]       MONEY          NULL,
    [Summa]       MONEY          NULL,
    [Resource]    INT            NULL
);

