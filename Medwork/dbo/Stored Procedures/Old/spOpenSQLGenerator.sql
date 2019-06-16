CREATE PROCEDURE spOpenSQLGenerator
AS
  EXEC spDropSysObject 'tmpSQLGenerator'

  CREATE TABLE tmpSQLGenerator (
    [ID] INTEGER IDENTITY (1, 1) NOT NULL,
    [SQL] TEXT
  CONSTRAINT tmpRaspisaniePrimKey PRIMARY KEY (ID))

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spOpenSQLGenerator] TO PUBLIC
    AS [dbo];

