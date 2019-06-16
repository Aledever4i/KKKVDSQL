CREATE TABLE [dbo].[InfomatParams] (
    [ID]                  INT            NOT NULL,
    [InfomatName]         NVARCHAR (100) NULL,
    [UID]                 INT            NULL,
    [TimeIntervalType]    INT            NULL,
    [Comment]             NVARCHAR (255) NULL,
    [SelRes]              NTEXT          NULL,
    [AddressUsrID]        NVARCHAR (250) NULL,
    [isSendMessage]       NVARCHAR (1)   NULL,
    [MsgIntervalCheck]    INT            NULL,
    [MsgDaysKeeping]      INT            NULL,
    [PeriodLoadFreeCells] INT            NULL,
    CONSTRAINT [InfomatParamsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

