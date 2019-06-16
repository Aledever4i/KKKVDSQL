CREATE TABLE [dbo].[mysql_address] (
    [id]       INT          NOT NULL,
    [id_r]     INT          CONSTRAINT [DF__mysql_addr__id_r__464D2F98] DEFAULT (NULL) NULL,
    [id_c]     INT          CONSTRAINT [DF__mysql_addr__id_c__474153D1] DEFAULT (NULL) NULL,
    [id_d]     INT          CONSTRAINT [DF__mysql_addr__id_d__4835780A] DEFAULT (NULL) NULL,
    [id_s]     INT          CONSTRAINT [DF__mysql_addr__id_s__49299C43] DEFAULT (NULL) NULL,
    [house]    INT          CONSTRAINT [DF__mysql_add__house__4A1DC07C] DEFAULT (NULL) NULL,
    [building] VARCHAR (10) CONSTRAINT [DF__mysql_add__build__4B11E4B5] DEFAULT (NULL) NULL,
    [flat]     INT          CONSTRAINT [DF__mysql_addr__flat__4C0608EE] DEFAULT (NULL) NULL
);

