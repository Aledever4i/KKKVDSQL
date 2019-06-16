CREATE TABLE [dbo].[FOMSTYPPREB] (
    [ID]          INT           NOT NULL,
    [CODE]        INT           NOT NULL,
    [Descr]       VARCHAR (200) NOT NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_FOMSTYPPREB_InsertStamp] DEFAULT (getdate()) NOT NULL
);

