CREATE TABLE [dbo].[PaymentByCard] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [parent]      INT            NULL,
    [PaymentID]   INT            NULL,
    [PatID]       INT            NULL,
    [BillID]      INT            NULL,
    [Prinyal]     INT            NULL,
    [Cash]        INT            NULL,
    [Summa]       MONEY          NULL,
    [CompName]    NVARCHAR (50)  NULL,
    [WinUser]     NVARCHAR (50)  NULL,
    [TermNum]     NVARCHAR (50)  NULL,
    [MerchantTSN] NVARCHAR (50)  NULL,
    [TransState]  INT            NULL,
    [opType]      NVARCHAR (10)  NULL,
    [opDateTime]  DATETIME       NULL,
    [opErrCode]   NVARCHAR (50)  NULL,
    [opExtraData] NVARCHAR (MAX) NULL,
    [Cheque]      NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

