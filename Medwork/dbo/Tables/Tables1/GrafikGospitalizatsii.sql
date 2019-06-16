CREATE TABLE [dbo].[GrafikGospitalizatsii] (
    [ID]         INT            NOT NULL,
    [PLANMODE]   INT            NULL,
    [PATNO]      INT            NULL,
    [IN_DATE]    DATETIME       NULL,
    [DEPID]      INT            NULL,
    [EYE]        NVARCHAR (2)   NULL,
    [LASTNAME]   NVARCHAR (30)  NULL,
    [FIRSTNAME]  NVARCHAR (30)  NULL,
    [SECONDNAME] NVARCHAR (30)  NULL,
    [PAYMENT]    INT            NULL,
    [AGE]        INT            NULL,
    [VRACH]      INT            NULL,
    [SRVTYPE]    INT            NULL,
    [KODOPER]    INT            NULL,
    [PRIM]       NVARCHAR (100) NULL,
    [CORPUS]     INT            NULL,
    [RECNO]      INT            NULL,
    [CLOSED]     BIT            NULL,
    [REG]        NVARCHAR (50)  NULL
);


GO
CREATE NONCLUSTERED INDEX [GrafikGospitalizatsii_PlanMode_Idx]
    ON [dbo].[GrafikGospitalizatsii]([PLANMODE] ASC);


GO
CREATE NONCLUSTERED INDEX [GrafikGospitalizatsii_In_Date_Idx]
    ON [dbo].[GrafikGospitalizatsii]([IN_DATE] ASC);


GO
CREATE NONCLUSTERED INDEX [GrafikGospitalizatsii_DepID_Idx]
    ON [dbo].[GrafikGospitalizatsii]([DEPID] ASC);


GO
CREATE NONCLUSTERED INDEX [GrafikGospitalizatsii_closed_Idx]
    ON [dbo].[GrafikGospitalizatsii]([CLOSED] ASC);

