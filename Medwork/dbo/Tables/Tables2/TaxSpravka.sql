CREATE TABLE [dbo].[TaxSpravka] (
    [ID]         INT      NOT NULL,
    [InsertDate] DATETIME NULL,
    [AuthorID]   INT      NULL,
    [Num]        INT      NULL,
    [DateStart]  DATETIME NULL,
    [DateEnd]    DATETIME NULL,
    [PatID]      INT      NULL,
    CONSTRAINT [TaxSpravkaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

CREATE TRIGGER TaxSpravka_AttachDelete ON TaxSpravka
 FOR DELETE AS
 DELETE _MedworkDocAttachments
 FROM 
 DELETED d
 where 
 _MedworkDocAttachments.PatFormID is null
 and _MedworkDocAttachments.LinkedTable = 'TaxSpravka'
 and d.ID = _MedworkDocAttachments.LinkedTableID
