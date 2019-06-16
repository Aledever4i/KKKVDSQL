CREATE TABLE [dbo].[UDP_Bill] (
    [DocNum]    INT        NULL,
    [DocDate]   DATETIME   NULL,
    [Doc2Num]   INT        NULL,
    [Doc2Date]  DATETIME   NULL,
    [EndDate]   DATETIME   NULL,
    [StartDate] DATETIME   NULL,
    [Firm]      INT        NULL,
    [Dog]       INT        NULL,
    [ID]        INT        NOT NULL,
    [Discont]   FLOAT (53) NULL,
    [byAct]     MONEY      NULL,
    [Summ]      MONEY      NULL,
    [PreSumm]   MONEY      NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

CREATE TRIGGER UDP_Bill_AttachDelete ON UDP_Bill
 FOR DELETE AS
 DELETE _MedworkDocAttachments
 FROM 
 DELETED d
 where 
 _MedworkDocAttachments.PatFormID is null
 and _MedworkDocAttachments.LinkedTable = 'UDP_Bill'
 and d.ID = _MedworkDocAttachments.LinkedTableID
