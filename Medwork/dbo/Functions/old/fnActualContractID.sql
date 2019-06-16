
Create Function [dbo].[fnActualContractID] (@ContractID int, @date datetime)
Returns int
BEGIN
	declare @Result int
	set @Result = @ContractID
	declare @StopList table (DogID int)
	while exists (select top 1 nextdog from Contracts where ID = @Result 
					and not (@Date>=Beg_Date and @Date<=End_Date)
					and nextdog not in (select DogID from @StopList) 
					and nextdog is not null)
	begin
		set @Result = (select top 1 nextdog from Contracts where ID = @Result 
					and not (@Date>=Beg_Date and @Date<=End_Date)
					and nextdog not in (select DogID from @StopList))
		insert into @StopList values (@Result)
	end
	Return @Result
END

