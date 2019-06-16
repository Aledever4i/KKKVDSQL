
CREATE FUNCTION UD_CountP
	(@deptID int,
	 @DoctorId int,
	 @cType int, -- что считать 	0 Итого по поликлинике
				--	1 Итого на дому
				--	2 На объекте
	 @chs int, -- член семьи 1 или -1
	 @ok int, -- основной контингент
	 @nk int, -- неконтингент
	 @str int, -- страховые

	 @isProf int, -- профилактика
	 @isZab int, -- заболевания
	 @age int,  -- -1 все, 0 дети, 1 подростки, 2 взрослые +дети и подростки
	 @Terr int, -- -1 все, 0 - Москва, 1 - Московская область
 	 @sdate datetime,
	 @edate datetime,
	 @isBud int
	 )
RETURNS int
AS
BEGIN
 DECLARE @res int
 set @res=(
  select 
    count(1) 
  from 
    UD_Patient u,
    usr us,
    dept d
  where 
    d.id=us.deptid and
    us.id=u.doctorid and
    (us.deptid=@deptid or @doctorId<>-1 or @deptId=-1) and
    (u.doctorid=@doctorId or @doctorId=-1) and
    ((@cType<>0) or (@cType=0 and u.isHome=0 and u.isObject=0)) and
    ((@cType<>1) or (@cType=1 and u.isHome=1 and u.isObject=0)) and
    ((@cType<>2) or (@cType=2 and u.isObject=1)) and
    ((@nk=-1) or (u.isList=1)) and

    ((@isZab=-1) or ((select count(1) from UI_Diag ud where ud.pid=u.id and upper(SUBSTRING(ud.code,1,1))<>'Z' )>0)) and
    ((@isProf=-1) or ((select count(1) from UI_Diag ud where ud.pid=u.id and upper(SUBSTRING(ud.code,1,1))='Z' )>0)) and


 (    @terr=-1 or 
     (@terr=0 and (select count(1) from patient p where p.id=u.patid and (p.c_T=77 or p.isMoscow=1 ))>0) or
     (@terr=1 and (select count(1) from patient p where p.id=u.patid and p.c_T=50)>0)
  ) and
 (    @age=-1 or 
     (@age=0 and (select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)<15) or
     (@age=1 and ((select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)>=15 and (select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)<18) ) or
     (@age=2 and (select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)>=18) or
     (@age=3 and (select DATEDIFF(year, p.birthdate, u.date) from patient p where p.id=u.patid)<18) 
  ) and
     u.date>@sdate and
     u.date-1<@edate
 )
 
RETURN @res
END

