
CREATE PROCEDURE spLockDate (@SID INT, @DATE DATETIME)
AS
DECLARE @MAXID INT
SELECT @MAXID = ISNULL(MAX(ID),0)+1 FROM Napravlenie

INSERT INTO Napravlenie (ID, PatID, VremyaPriema, DataPriema, Vrach)
SELECT TOP 30 PERCENT 
  ID+@MAXID as ID,
  NULL as PatID, 
  StartTime as VremyaPriema, 
  @DATE as DataPriema,
  UsrID as Vrach
FROM
  dbo.fnTimeGrid(@SID, @DATE)
WHERE
  NapCount=0
ORDER BY StartTime Desc
