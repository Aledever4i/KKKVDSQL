CREATE TABLE [dbo].[CrossMKBToReports] (
    [CODE]   INT NULL,
    [DiagID] INT NULL
);


GO
CREATE NONCLUSTERED INDEX [ByDiagID]
    ON [dbo].[CrossMKBToReports]([DiagID] ASC);

