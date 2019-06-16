CREATE TABLE [dbo].[FOMSResultIllPoll] (
    [ID]          INT           NOT NULL,
    [COD]         INT           NOT NULL,
    [Descr]       VARCHAR (100) NOT NULL,
    [IsClose]     BIT           CONSTRAINT [DF_FOMSResultIllPoll_IsClose] DEFAULT ((0)) NOT NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_FOMSResultIllPoll_InsertStamp] DEFAULT (getdate()) NOT NULL
);

