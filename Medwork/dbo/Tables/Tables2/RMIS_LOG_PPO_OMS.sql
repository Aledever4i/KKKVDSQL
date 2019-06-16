CREATE TABLE [dbo].[RMIS_LOG_PPO_OMS] (
    [MasterID] INT             NULL,
    [EVENT]    NVARCHAR (20)   NULL,
    [FILE]     NVARCHAR (20)   NULL,
    [ROW]      INT             NULL,
    [TYPE]     NVARCHAR (30)   NULL,
    [MSG]      NVARCHAR (3000) NULL
);


GO
CREATE NONCLUSTERED INDEX [RMIS_IDX]
    ON [dbo].[RMIS_LOG_PPO_OMS]([MasterID] ASC, [FILE] ASC, [ROW] ASC);

