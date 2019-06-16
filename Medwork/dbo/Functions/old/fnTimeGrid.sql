
--генерация ячеек приема на услугу в линейном виде с отображением занятости
--@SID - услуга
--@Date - дата

--       ID - номер ячейки, StartTime - начальное время ячейки, EndTime - конечное время ячейки
--       UsrID - номер врача (пользователя)
--       NapCount - число направлений на данную ячейку
--       PatCount - число записанных пациентов на данную ячейку
--       NapID - номер первого направления
--       PatID - номер пациента

CREATE FUNCTION fnTimeGrid(@SID INT, @Date DateTime)
RETURNS @ResultTable TABLE (
  ID INT IDENTITY (1,1) PRIMARY KEY, CellID INT,  StartTime DATETIME,  EndTime DATETIME, 
  UsrID INT, NapCount INT, PatCount INT, NapID INT, PatID INT)

BEGIN

  INSERT INTO @ResultTable (CellID,StartTime, EndTime, UsrID, NapCount, PatCount, NapID, PatID)
  SELECT 
    c.ID, 
    DATEADD(mi,co.Offset,c.StartTime), 
    DATEADD(mi,co.Offset,c.EndTime), 
    r.MasterID,
   (SELECT COUNT(ID) FROM Napravlenie n
    WHERE
     DATEADD(mi,co.Offset,c.StartTime)<=n.VremyaPriema 
     and n.VremyaPriema<DATEADD(mi,co.Offset,c.EndTime) 
     and n.Vrach=u.id
     and n.DataPriema=@Date) as NapCount,

   (SELECT COUNT(PatID) FROM Napravlenie n
    WHERE
     DATEADD(mi,co.Offset,c.StartTime)<=n.VremyaPriema 
     and n.VremyaPriema<DATEADD(mi,co.Offset,c.EndTime) 
     and n.Vrach=u.id
     and n.DataPriema=@Date) as PatCount,

   (SELECT TOP 1 ID FROM Napravlenie n
    WHERE
     DATEADD(mi,co.Offset,c.StartTime)<=n.VremyaPriema 
     and n.VremyaPriema<DATEADD(mi,co.Offset,c.EndTime) 
     and n.Vrach=u.id
     and n.DataPriema=@Date) as NapID,

   (SELECT TOP 1 PatID FROM Napravlenie n
    WHERE
     DATEADD(mi,co.Offset,c.StartTime)<=n.VremyaPriema 
     and n.VremyaPriema<DATEADD(mi,co.Offset,c.EndTime) 
     and n.Vrach=u.id
     and n.DataPriema=@Date) as PatID
  FROM 
    dbo.fnCell(@SID, @DATE) c, 
    dbo.fnRaspisanie(0,@DATE) r, 
    usr u, 
    usrgroup ug, 
    service,     
    dbo.fnCellOffset(@SID, @DATE) co
  WHERE
    r.StartTime<=DATEADD(mi,co.Offset,c.StartTime)
    and DATEADD(mi,co.Offset,c.EndTime)<=r.EndTime 
    and r.masterid=u.id
    and ug.groupid=u.groupid
    and service.usergroupid=ug.groupid
    and (service.id=@SID)
    and u.id=co.usrid
    and u.deptid=service.deptid
  RETURN
END
