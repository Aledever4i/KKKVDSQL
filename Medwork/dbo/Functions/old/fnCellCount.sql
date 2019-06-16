CREATE FUNCTION fnCellCount(@SID INT, @Date DateTime)
RETURNS INT
BEGIN
  DECLARE @V INT

  SELECT 
    @V=SUM(
    CASE
      WHEN ISNULL(s.Interval,0)>0 
      THEN (DatePart(hh,r.EndTime-r.StartTime)*60+DatePart(mi,r.EndTime-r.StartTime))/s.Interval
      ELSE NULL
    END)
  FROM 
    dbo.fnRaspisanie(0,@DATE) r, 
    usr u, 
    usrgroup ug, 
    service s
  WHERE
    r.masterid=u.id
    and ug.groupid=u.groupid
    and s.usergroupid=ug.groupid
    and (s.id=@SID)
    and u.deptid=s.deptid

  RETURN @V
END
