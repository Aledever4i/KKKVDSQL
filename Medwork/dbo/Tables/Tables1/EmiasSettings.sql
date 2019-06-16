CREATE TABLE [dbo].[EmiasSettings] (
    [ID]             INT            NOT NULL,
    [ServiceName]    NVARCHAR (50)  NULL,
    [ServiceEnabled] BIT            NULL,
    [ServiceType]    NVARCHAR (50)  NULL,
    [ServiceURL]     NVARCHAR (300) NULL,
    [Method]         NVARCHAR (4)   NULL,
    [PostData]       NTEXT          NULL,
    [LinkedUsrID]    INT            NULL,
    [Auth1URL]       NVARCHAR (200) NULL,
    [Auth1Method]    NVARCHAR (4)   NULL,
    [Auth1PostData]  NTEXT          NULL,
    [Auth2URL]       NVARCHAR (200) NULL,
    [Auth2Method]    NVARCHAR (4)   NULL,
    [Auth2PostData]  NTEXT          NULL,
    CONSTRAINT [EmiasSettingsPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

