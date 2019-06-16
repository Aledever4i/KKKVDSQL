CREATE TABLE [dbo].[DIRReductionPaymentTypes] (
    [RecId]       INT           IDENTITY (1, 1) NOT NULL,
    [Descr]       VARCHAR (MAX) NOT NULL,
    [InsertStamp] DATETIME      CONSTRAINT [DF_ReductionPaymentTypes_InsertStamp] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ReductionPaymentTypes] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

