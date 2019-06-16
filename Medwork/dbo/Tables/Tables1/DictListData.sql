CREATE TABLE [dbo].[DictListData] (
    [PatId]    INT          NOT NULL,
    [MasterId] INT          NOT NULL,
    [CtrlId]   VARCHAR (50) NOT NULL,
    [dlKey]    VARCHAR (50) NOT NULL
);


GO
CREATE CLUSTERED INDEX [idx_DictListData]
    ON [dbo].[DictListData]([PatId] ASC, [MasterId] ASC, [CtrlId] ASC);

