CREATE TABLE [dbo].[RequisitionNumber] (
    [Date] SMALLDATETIME NOT NULL,
    [id]   INT           IDENTITY (1, 1) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [DateRequisitionNumberIdx]
    ON [dbo].[RequisitionNumber]([Date] ASC);

