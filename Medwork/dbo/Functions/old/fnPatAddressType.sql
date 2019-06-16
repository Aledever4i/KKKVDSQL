CREATE FUNCTION [fnPatAddressType]
(
	@PatientID INTEGER,
	@typeadress nvarchar(20)
)
RETURNS VARCHAR(250)
as
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
		@Adresindeks nvarchar(10),
		@Other nvarchar(100)
	Declare @Res varchar(250)
	
	select top 1 @Region=a.AdresRegion,
		@gorod=a.AdresGorod,
		@raionReg=a.AdresRaionReg,
		@typenaspunkt=vn.Socr,
		@ul=a.AdresUlitsa,
		@dom=RTrim(LTrim(a.AdresDom)),
		@kor=RTrim(LTrim(a.AdresKorpus)),
		@str=RTrim(LTrim(a.AdresStroenie)),		
		@kv=RTrim(LTrim(a.AdresKvartira)),
		@Adresindeks=a.Adresindeks,
		@Other=a.AdresOther
	FROM
		AdditionalAddress a 
		left join Patient p WITH (NOLOCK) on a.MasterID=p.id 
		left join vidnas vn on vn.code=isnull(p.NasPunkt,0)
	WHERE
		a.MasterID = @PatientID and (@typeadress='' or isnull(a.addresstype,'')=@typeadress) --@typeadress='' or 
	ORDER BY a.id desc
			
	if LTrim(RTrim(@gorod))=''
		set @gorod=null

	Set @Res=
	IsNull(RTrim(LTrim(@Adresindeks))+', ', '')+
	case when @gorod like 'Москва%' and @Region like 'Москва%' then '' else IsNull(RTrim(LTrim(@Region))+', ', '') end+
	IsNull(RTrim(LTrim(@raionReg))+', ', '')+
	IsNull(IsNull(RTrim(LTrim(@typenaspunkt))+' ','')+RTrim(LTrim(@gorod))+', ','')+
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
	
	if Len(@Res)=0 Set @Res='Не указан'	
	Return (@Res)
END
