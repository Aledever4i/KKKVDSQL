
CREATE Procedure [dbo].[GetCardNum](@id int, @date datetime)
AS
BEGIN
	set nocount on
	
	set @date=convert(datetime,convert(nvarchar,@date,102),102)
	declare @idin int,
				@CardNum nvarchar(50),
				@f int

	delete
	from GetCardNumTable
	where year(date)<>year(@date)
	
	update GetCardNumTable
	set canused=1
	where date<@date or id=@id
	
	update GetCardNumTable
	set canused=1
	from f066 full join TitulniyListF003U f003 on f003.id=f066.id
			right join GetCardNumTable t on IsNull(f066.id,f003.id)=t.id
	where t.canused=0 and ((IsNull(f066.id,f003.id) is null) or (IsNull(f066.CardNum,f003.CardNum)<>t.CardNum))
	
	delete from GetCardNumTable
	from f066 full join TitulniyListF003U f003 on f003.id=f066.id
			right join GetCardNumTable t on IsNull(f066.id,f003.id)=t.id
	where t.canused=0 and (IsNull(f066.CardNum,f003.CardNum) is not null)
	
	set @f=1
	while @f>0
	begin		
		
		set @idin=null
		
		select top 1 @idin=id, @CardNum=CardNum
		from GetCardNumTable
		where canused=1
		order by case when id=@id then 0 else 1 end
		
		if @idin is null
		begin
			select @CardNum=IsNull([count],0)+1 from CardNumByYear where [year]=year(@date)
			set @CardNum=IsNull(@CardNum,'1')
			if @CardNum='1'
			begin
				insert into CardNumByYear ([year],[count]) Values (year(@date),1)
			end
			else
			begin
				update CardNumByYear
				set [count]=[count]+1
				where [year]=year(@date)
			end
			set @CardNum=Right(cast(year(@date) as nvarchar),2)+'/'+REPLICATE('0',4-Len(@CardNum))+@CardNum --!!!!
			insert into GetCardNumTable Values (@id, @CardNum,0,@date)
		end
		else
		begin
			update GetCardNumTable
			set id=@id, date=@date, canused=0
			where id=@idin
		end
		
		set @f= (select count(*)
						from 
						(select id from f066 where CardNum=@CardNum
						union all
						(select id from TitulniyListF003U where CardNum=@CardNum)
						) as t
					)
		if @f>0
			delete from GetCardNumTable where id=@id
	end
	select @CardNum
END
