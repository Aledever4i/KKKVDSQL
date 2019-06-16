CREATE TABLE [dbo].[IM_Messages] (
    [ID]                   INT            NOT NULL,
    [FolderID]             INT            NULL,
    [UserID]               INT            NULL,
    [Caption]              NVARCHAR (64)  NULL,
    [Text]                 NTEXT          NULL,
    [Created]              DATETIME       NULL,
    [AttachmentID]         INT            NULL,
    [Link]                 NVARCHAR (255) NULL,
    [isOpened]             BIT            NULL,
    [Parameters]           NVARCHAR (255) NULL,
    [Type]                 INT            NULL,
    [FromID]               INT            NULL,
    [FromValue]            NVARCHAR (50)  NULL,
    [mark_as_read_for_all] INT            NULL
);


GO
CREATE TRIGGER IM_Messages_on_delete ON dbo.IM_Messages FOR DELETE AS begin delete IM_Messages where FolderID in (select id from deleted where type>0) delete IM_Attachments where id in (select AttachmentID from deleted where type=0) end