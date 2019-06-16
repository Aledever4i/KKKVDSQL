CREATE TABLE [dbo].[mwUserRoles] (
    [UserId] INT          NOT NULL,
    [RoleId] VARCHAR (32) NOT NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [mwUserRoles_UserIdx]
    ON [dbo].[mwUserRoles]([UserId] ASC);

