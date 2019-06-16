CREATE TABLE [dbo].[UI_Service] (
    [id]          INT            NOT NULL,
    [pid]         INT            NULL,
    [code]        VARCHAR (50)   NULL,
    [Count]       INT            CONSTRAINT [DF_UI_Service_Count] DEFAULT (1) NOT NULL,
    [name]        NVARCHAR (255) NULL,
    [price]       FLOAT (53)     NULL,
    [isOMS]       BIT            NULL,
    [uet]         FLOAT (53)     NULL,
    [Creator]     INT            NULL,
    [CreateDate]  DATETIME       NULL,
    [Updater]     INT            NULL,
    [UpdateDate]  DATETIME       NULL,
    [GUID]        NVARCHAR (50)  NULL,
    [PaymentType] INT            NULL,
    [PaymentCode] INT            NULL,
    [ServiceType] INT            NULL,
    [Complex]     INT            NULL,
    CONSTRAINT [PK_UI_Service] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ui_serviceGUIDIdx]
    ON [dbo].[UI_Service]([GUID] ASC);


GO
CREATE NONCLUSTERED INDEX [ui_servicePidCodeIdx]
    ON [dbo].[UI_Service]([pid] ASC, [code] ASC);


GO
CREATE NONCLUSTERED INDEX [idxService_isOms_pid_code]
    ON [dbo].[UI_Service]([isOMS] ASC, [pid] ASC, [code] ASC);

