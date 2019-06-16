
--генерация смещений времени для врачей, даты и услуги
--@SID - услуга
--@Date - дата


CREATE FUNCTION fnCellOffset(@SID INT, @Date DateTime)
RETURNS @ResultTable TABLE (
  UsrID INT primary key,  Offset INT)
BEGIN
  
  INSERT INTO @ResultTable
  SELECT 
    u.ID,       
    dbo.fnMinutes(MIN(r.starttime)-s.starttime)-
   (dbo.fnMinutes(MIN(r.starttime)-s.starttime)/s.Interval+1)*s.Interval as Rest
  FROM
    service s, 
    usrgroup ug, 
    usr u, 
    dbo.fnRaspisanie(0,@DATE) r
  WHERE
    s.usergroupid=ug.groupid and
    u.groupid = ug.groupid and 
    r.masterid = u.id and
    s.ID=@SID
  GROUP BY u.ID, s.StartTime, s.Interval

  RETURN
END
