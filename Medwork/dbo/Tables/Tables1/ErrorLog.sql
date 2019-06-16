CREATE TABLE [dbo].[ErrorLog] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Descr]       VARCHAR (MAX) NOT NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_ErrorLog_InsertStamp] DEFAULT (getdate()) NOT NULL
);

