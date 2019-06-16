
CREATE FUNCTION UD_CountFirstConfition
	(@diag varchar(100),
	 @fcType int,
	 @sdate datetime, 
	 @edate datetime,
      @isBud int,
	 @org int,
 	 @sector int,
          @terr int,
 	 @age int)
 RETURNS int
 AS
 BEGIN
  DECLARE @res int
  set @res=(
   select 
    count(1) 
   from
   UI_Diag ui, 
    UD_Patient ud,
    Attachment a
   where 
    upper(ui.code)=upper(@diag) and
    ui.isNotRegister=1 and
    ud.id=ui.pid and
    --ud.date>@sdate and [26122006]
    ud.date>=@sdate and 
    ud.date-1<@edate and 
    (ui.FirstCandition=@fcType or @fctype=-1
		) and
  ui.isFirst=1 and    
   ( 
	(@isBud=-1) or
	(@isBud=1 and a.atttype=1) or
	(@isBud=2 and a.atttype=2)
    ) and
    (@sector=-1 or @sector=(select aa.sector from Attachment aa where aa.id=ui.attid)) and
    (    @terr=-1 or 
        (@terr=0 and (select count(1) from patient p where p.id=ud.patid and (p.c_T=77 or p.isMoscow=1 ))>0) or
        (@terr=1 and (select count(1) from patient p where p.id=ud.patid and p.c_T=50)>0)
     ) and
    (    @age=-1 or 
        (@age=0 and (select DATEDIFF(year, p.birthdate, ud.date) from patient p where p.id=ud.patid)<15) or
        (@age=1 and ((select DATEDIFF(year, p.birthdate, ud.date) from patient p where p.id=ud.patid)>=15 and (select DATEDIFF(year, p.birthdate, ud.date) from patient p where p.id=ud.patid)<18) ) or
        (@age=2 and (select DATEDIFF(year, p.birthdate, ud.date) from patient p where p.id=ud.patid)>=18)
     )
 )
  
 RETURN @res
 END
 
