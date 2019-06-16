
CREATE FUNCTION [dbo].[fnFakAddress](@PatientID INTEGER)
		RETURNS VARCHAR(100)
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
		@Adres nvarchar(200),
		@Other nvarchar(100)
	Declare @Res varchar(100)
	
	select @Region=AdresRegionFakt,
		@gorod=AdresGorodFakt,
		@raionReg=AdresRaionRegFakt,
		@typenaspunkt=vn.Socr,
		@naspunkt=AdresNasPunktFakt,
		@ul=AdresUlitsaFakt,
		@dom=RTrim(LTrim(AdresDomFakt)),
		@kor=RTrim(LTrim(AdresKorpusFakt)),
		@str=RTrim(LTrim(AdresStroenieFakt)),		
		@kv=RTrim(LTrim(AdresKvartiraFakt))
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
