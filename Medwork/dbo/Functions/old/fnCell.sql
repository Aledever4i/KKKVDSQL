
--генерация ячеек приема на услугу
--@StartDate - начальная дата
--@EndDate - конечная дата
--@StartTime - начальное время
--@EndTime - конечное время
--@Interval - интервал


CREATE FUNCTION fnCell(@StartDate DateTime, @EndDate DateTime, @StartTime DateTime, @EndTime DateTime, @Interval Int, @CellCount Int)
RETURNS @ResultTable TABLE (
  ID INT Primary Key,  
  Date DATETIME,
  StartTime DATETIME,  
  EndTime DATETIME,
  CellID Int)
BEGIN

  DECLARE @CELLNUM INT
  DECLARE @DATE DATETIME
  DECLARE @SCHEDULED BIT
  DECLARE @NDAYS INT
  DECLARE @OFFSET INT

  IF (@INTERVAL>0)
  BEGIN
    SET @OFFSET = 0
    SET @DATE = @StartDate
    SET @CELLNUM = @CellCount
    IF @CELLNUM<=0
    BEGIN
      SELECT @CELLNUM=DATEDIFF(mi,@StartTime,@EndTime)/@Interval 
    END
      
    WHILE @DATE<=@EndDate
    BEGIN
    INSERT INTO @ResultTable (ID, Date, StartTime, EndTime, CellID)
    SELECT 
      n.ID+@OFFSET as ID, 
      @Date,
      DATEADD(mi,@INTERVAL*n.ID,@STARTTIME) as StartTime,
      DATEADD(mi,@INTERVAL*(n.ID+1),@STARTTIME) as StartTime,
      n.ID
    FROM 
      Number n
    WHERE 
     (n.ID<=@CELLNUM)
    SET @DATE=@DATE+1
    SET @OFFSET = @OFFSET+@CELLNUM+1
    END
  END
  RETURN
END
