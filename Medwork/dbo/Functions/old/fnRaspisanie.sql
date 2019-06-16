
CREATE FUNCTION fnRaspisanie(@UsrID INT, @StartDate DateTime, @EndDate DateTime)
RETURNS @ResultTable TABLE (
  ID INT Primary Key,
  RID INT, 
  MasterID INT,
  Name VarChar(100),
  Date DateTime, 
  StartTime DateTime,
  EndTime DateTime,
  DeptID INT,
  Interval INT,
  Metka VARCHAR(100))
BEGIN

  DECLARE @DAY INTEGER  -- день недели
  DECLARE @DAYOFMONTH INTEGER  -- день месяца
  DECLARE @WEEK INTEGER  -- номер недели в месяце
  DECLARE @LASTWEEK INTEGER -- номер последней недели в текущем месяце
  DECLARE @Date DateTime
  DECLARE @ROFFSET INT 
  DECLARE @RMAX INT 
  
  SET @Date= @StartDate
  SELECT @ROFFSET = 0
  SELECT @RMAX = MAX(ID) FROM Raspisanie

  WHILE @Date<=@EndDate
  BEGIN
  
  SET @DAY=DatePart(dw,@Date)
  SET @DAYOFMONTH=DatePart(dd,@Date)
  SET @WEEK=DatePart(dd,@Date)/7+1
  SET @LASTWEEK=dbo.fnLastMonthDay(@Date)/7+1

  INSERT INTO @ResultTable (ID, RID, MasterID, Name, Date, StartTime, EndTime, DeptID, Interval, Metka)
  SELECT 
    r.ID+@ROffset, r.ID, MasterID, r.Name, @Date, StartTime, EndTime, DeptID, Interval,  
    d.Name as Metka 
  FROM Raspisanie r LEFT JOIN Dept d ON r.DeptID=d.ID
  WHERE
    (Actual=1) AND
    ((MasterID=@UsrID) or (@UsrID=0))
    and 
    StartDate<=@DATE
    and 
    EndDate>=@DATE
    and
    (CASE @DAY 
      WHEN 1 THEN D1
      WHEN 2 THEN D2
      WHEN 3 THEN D3 
      WHEN 4 THEN D4 
      WHEN 5 THEN D5 
      WHEN 6 THEN D6
      WHEN 7 THEN D7
    END)=1
    and
    (CASE WeekFilter
       WHEN -1 THEN @LastWeek
       WHEN 0 THEN @WEEK
       WHEN 1 THEN 1
       WHEN 2 THEN 2
       WHEN 3 THEN 3
       WHEN 4 THEN 4
       WHEN 5 THEN DATEDIFF(ww,StartDate,@DATE)%2*@WEEK
       WHEN 6 THEN (1-DATEDIFF(ww,StartDate,@DATE)%2)*@WEEK
       ELSE @WEEK
     END)=@WEEK 
     and
    (
    (WeekFilter<7) OR
    ((CASE WeekFilter
       WHEN 7 THEN 1
       WHEN 8 THEN 0
       ELSE -1
     END)=DATEPART(d,@Date)%2)
    )
  Set @Date=@Date+1
  Set @ROffset=@ROffset+@RMax
  END
  RETURN
END
