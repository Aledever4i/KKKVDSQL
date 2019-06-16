
CREATE PROCEDURE UD_SaveWorkHome
	@Did int,
	@whDate datetime,
	@WorkHome int
AS begin
	declare @id int
	set @id=(select count(1) from WorkHome where did=@did and whDate=@whDate)
	if (@id=0) and (@WorkHome<>0) begin
		insert into WorkHome (did, whDate, WorkHome)
		values (@did, @whDate, @WorkHome)
  end else begin
  	if @WorkHome<>0
   		update WorkHome 
   		set WorkHome=@WorkHome
			where did=@did and whDate=@whDate
		else
			Delete WorkHome 
			where did=@did and whDate=@whDate
	end
end
