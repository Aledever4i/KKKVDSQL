


CREATE FUNCTION [fnPatAddress](@PatientID INTEGER)
		RETURNS VARCHAR(250)																					--[Лоев А.Д.]
BEGIN

	declare @Region nvarchar(100),
		@gorod nvarchar(100),
		@raionreg nvarchar(100),
		@naspunkt nvarchar(100),
		@typenaspunkt nvarchar(100),
		@ul nvarchar(100),
		@dom nvarchar(100),
		@kor nvarchar(100),
		@kv nvarchar(100),
		@str nvarchar(100),
		@Adres nvarchar(300),
		@Other nvarchar(100)
	Declare @Res varchar(250)
	
	select @Region=AdresRegion,
		@gorod=AdresGorod,
		@raionReg=AdresRaionReg,
		@typenaspunkt=vn.Socr,
		@naspunkt=AdresNasPunkt,
		@ul=AdresUlitsa,
		@dom=RTrim(LTrim(AdresDom)),
		@kor=RTrim(LTrim(AdresKorpus)),
		@str=RTrim(LTrim(AdresStroenie)),		
		@kv=RTrim(LTrim(AdresKvartira)),
		@Adres=Adres,
		@Other=AdresOther
	FROM
		Patient WITH (NOLOCK) left join vidnas vn on vn.code=NasPunkt
	WHERE
		ID = @PatientID
		
	if LTrim(RTrim(@gorod))=''
		set @gorod=null

	Set @Res=
	case when @gorod like 'Москва%' and @Region like 'Москва%' then '' else IsNull(RTrim(LTrim(@Region))+', ', '') end+
	IsNull(RTrim(LTrim(@raionReg))+', ', '')+
	IsNull(IsNull(RTrim(LTrim(@typenaspunkt))+' ','')+RTrim(LTrim(@gorod))+', ','')+
	IsNull(RTrim(LTrim(@naspunkt))+', ','')+
	IsNull(RTrim(LTrim(@ul))+', ','')+
	case when Len(IsNull(@dom,''))>0 then 'д. '+@dom+', ' else '' end+
	case when Len(IsNull(@kor,''))>0 then 'к. '+@kor+', ' else '' end+
	case when Len(IsNull(@str,''))>0 then 'стр. '+@str+', ' else '' end+
	case when Len(IsNull(@kv, ''))>0 then 'кв. '+@kv else '' end+
	case when Len(IsNull(@Other, ''))>0 then ', '+@Other else '' end
	
	set @Res=Replace(@Res,', ,',',')
	set @Res=Replace(@Res,', ,',',')
	set @Res=LTrim(RTrim(Replace(@Res,', ,',',')))
	
	if Len(@Res)>0
	begin
		if Right(@Res,1)=','
			set @Res=RTrim(Left(@Res,Len(@Res)-1))
	end

	if Len(@Res)>0
	begin
		if Left(@Res,1)=','
			set @Res=LTrim(Right(@Res,Len(@Res)-1))
	end
	
	if (Len(@Res)=Len(@Region))AND(Len(LTrim(RTrim(IsNull(@Adres,''))))<>0) 
		Set @Res=LTrim(RTrim(IsNull(@Adres,'')))
	
	if Len(@Res)=0 Set @Res=LTrim(RTrim(IsNull(@Adres,'')))
	
	if Len(@Res)=0 Set @Res='Не указан'
	
	Return (@Res)
END



