CREATE TABLE [dbo].[FOMSUrgency] (
    [ID]          INT           NOT NULL,
    [Descr]       VARCHAR (100) NOT NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_FOMSUrgency_InsertStamp] DEFAULT (getdate()) NOT NULL
);

