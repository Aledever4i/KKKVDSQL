
Create Procedure CreateBills 
	@DocDate DateTime, 
	@StartDate DateTime, 
	@EndDate DateTime,
	@Use_ud int,
	@Use_n int,
	@Use_n_ignore_done int,
	@Use_b int,
	@FilterProg int
As begin
	Set NOCOUNT ON

	Declare @OrgId int, @DogId int,
					@r int, @rbuf int

	Declare BillCursor Cursor For
		Select o.code [OrgId], c.Id [Dogid]
		From organisations o, Contracts c
		--[OMM_27122006]
		--Where c.[OFF]=o.Code and o.Orgtype=2
		Where c.MasterID=o.id and o.Orgtype=2

	set @r=-2
	
	Open BillCursor

	FETCH NEXT From BillCursor Into @OrgId, @DogId

	While	(@@FETCH_STATUS = 0) begin
  		Exec @rbuf=CreateBill @DocDate, @StartDate, @EndDate, @OrgId, @DogId, null, null, @Use_ud, @Use_n, @Use_n_ignore_done, @Use_b, @FilterProg --[КАЕ_20071127]
  		if @rbuf>@r
  			set @r=@rbuf
	 		FETCH NEXT From BillCursor Into @OrgId, @DogId
	end
	Close BillCursor
	DealLocate BillCursor
	return @r
end

-----------------------------------------------------------------------------------------------------------------------
