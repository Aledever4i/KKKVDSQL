CREATE PROCEDURE pdv_PatientImport 
   @CardNum varchar(200), 
   @StartDate DateTime,
   @EndDate DateTime,
   @ProgramName varchar(200),
   @LastName varchar(200),
   @FirstName varchar(200),
   @MiddleName varchar(200),
   @BirthDate DateTime,
   @Address varchar(300),
   @notes varchar(300),
   @line int
AS 
Begin
 SET NOCOUNT ON
 Declare 
  @PatId int,
  @Program int,
  @Insurance int,
  @RegProg int,
  @Credit float,
  @Debet float,
  @Skidka float
 set @PatId=isnull((select ID from patient where FirstName=@FirstName and LastName=@LastName and SecondName=@MiddleName and BirthDate=@BirthDate), -1)
 if (@PatId=-1) Begin
  set @PatId=(select max(Id)+1 from Patient)
  insert into 
    Patient (ID, NIB, LastName, FirstName, SecondName, BirthDate, Adres, Primechanie, RegDate)  
    Values (@PatId, @PatId, @LastName, @FirstName, @MiddleName, @BirthDate, @Address, @notes, GetDate())
 end
 set @Program=isnull((select Id from Program where Name=@ProgramName),-1)
 set @Insurance=isnull((select MasterId from Program where Name=@ProgramName),-1)
 set @Credit=(select Credit from Program where Name=@ProgramName)
 set @Debet=(select Debet from Program where Name=@ProgramName)
 set @Skidka=(select Skidka from Program where Name=@ProgramName)
 if @Program<>-1 begin
  set @RegProg=isNull((Select id from regProgram where PatId=@PatId and ProgramCode=@Program and CardNo=@CardNum and StartDate=@StartDate and EndDate=@EndDate), -1)
  if @RegProg=-1 begin
   set @RegProg=isnull((select max(Id)+1 from RegProgram),1)
   insert into RegProgram 
    (ID, PatId, ProgramName, AddDate, AddPerson, Skidka, Credit, Debet, PayType, ProgramCode, Insurance, StartDate, EndDate, CardNo) values
    (@RegProg, @PatId, @ProgramName, GetDate(), 1, @Skidka, @Credit, @Debet, 'Программа', @Program, @Insurance, @StartDate, @EndDate, @CardNum)
  end
 end 
 else
  print 'Ошибка! Не найдена программа "'+@ProgramName+'". Строка '+Cast(@line as varchar(5))
end

