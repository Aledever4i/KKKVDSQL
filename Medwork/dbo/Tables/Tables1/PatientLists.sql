CREATE TABLE [dbo].[PatientLists] (
    [id]         INT            NOT NULL,
    [name]       NVARCHAR (50)  NULL,
    [MasterID]   INT            NULL,
    [ListDate]   DATETIME       NULL,
    [Org]        INT            NULL,
    [FromPerson] NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

