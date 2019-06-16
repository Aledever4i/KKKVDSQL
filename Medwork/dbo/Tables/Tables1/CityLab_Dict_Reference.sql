CREATE TABLE [dbo].[CityLab_Dict_Reference] (
    [id]        INT          NULL,
    [masterid]  INT          NULL,
    [dict_name] VARCHAR (50) NULL,
    [ref_name]  VARCHAR (50) NULL,
    [ref]       INT          NULL
);


GO
CREATE NONCLUSTERED INDEX [CityLab_Dict_ReferenceIdx]
    ON [dbo].[CityLab_Dict_Reference]([dict_name] ASC, [ref_name] ASC)
    INCLUDE([masterid], [ref]);

