CREATE TABLE [dbo].[mwUserGrpRoles] (
    [GroupId] INT          NOT NULL,
    [RoleId]  VARCHAR (32) NOT NULL,
    PRIMARY KEY CLUSTERED ([GroupId] ASC, [RoleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [mwUserGrpRoles_UserIdx]
    ON [dbo].[mwUserGrpRoles]([GroupId] ASC);

