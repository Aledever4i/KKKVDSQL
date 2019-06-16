
CREATE FUNCTION [dbo].[fnMkbCodeFit](@NozAll nvarchar(4000), @TestingNoz nvarchar(8))
RETURNS INTEGER
BEGIN
	if @nozAll=''
		RETURN 1

	declare @result integer
	declare @nozol table(startnoz nvarchar(10), endnoz nvarchar(10))
	
	set @result = 0
	declare @i int
	set @i=0
	declare @j int
	set @j=0

	declare @noz varchar(50)
	set @noz=null

	declare @nozMax varchar(50)
	set @nozMax=null

	while @NozAll<>''
	begin
		set @i=@i+1
		set @j=PATINDEX('%,%', @NozAll)
  	if @j>0
    	begin
				set @noz=LTrim(SUBSTRING(@NozAll, 1, @j-1))
				set @nozAll=RTrim(Right(@NozAll, Len(@NozAll)-@j))
  	  end
	  else
  	  begin
				set @noz=LTrim(@nozAll)
				set @nozAll=null
	    end
    
	 	set @j=PATINDEX('%-%', @noz)
  	if @j>0
    	begin
    		set @nozMax=RTrim(Right(@noz, Len(@noz)-@j))
				set @noz=LTrim(SUBSTRING(@noz, 1, @j-1))
  	  end
	  else
  		begin
  			set @nozMax=null
	  	end

		insert into @nozol Values (@noz,@NozMax)
	end
--	set nocount off

	set @result = (select case when exists(select * from @nozol where startnoz is null or (@TestingNoz like startnoz+'%' and endnoz is null) or
																 				(@TestingNoz>=startnoz and (SUBSTRING(@TestingNoz, 1, Len(endnoz))<=endnoz))
																 				) then 1 else 0 end)
	RETURN @result
END
