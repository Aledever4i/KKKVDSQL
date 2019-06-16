CREATE TABLE [dbo].[RMISRems] (
    [MasterID] INT            NULL,
    [Tbl]      NVARCHAR (2)   NULL,
    [Row]      INT            NULL,
    [REMS]     NVARCHAR (MAX) NULL
);


GO
CREATE NONCLUSTERED INDEX [RMISRems_IDX]
    ON [dbo].[RMISRems]([MasterID] ASC, [Tbl] ASC, [Row] ASC);

