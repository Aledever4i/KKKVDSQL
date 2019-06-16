
CREATE FUNCTION [dbo].[fnMakeSeriesByMaterialType] (@MatType int, @MatCount int, @MatStorage int)
RETURNS @t TABLE (
		[MaterialID] [int],
		[CountPackTaking] [int]
		)
AS
BEGIN
  declare MatCursor Cursor For
    select ID as [MaterialID], 
         Rest as [CountPackTaking]
	from material 
	where Parent = @MatType 
      and Storage = @MatStorage
      and Rest is not null 
    order by CreateDate
  
  open MatCursor
  declare @MID int, @Rest int, @Quantity int
  set @Quantity = 0
  Fetch Next From MatCursor into @MID, @Rest --выбираем первую строчку
  
  WHILE (@MatCount <> 0) and (@@Fetch_Status=0)
  Begin --while begin
    if @MatCount > @Rest set @Quantity = @Rest else set @Quantity = @MatCount

    set @MatCount = @MatCount - @Quantity 
    
    if @Quantity > 0 insert into @t ([MaterialID],[CountPackTaking]) values (@MID, @Quantity)
  
    Fetch Next From MatCursor into @MID, @Rest --выбираем следующую строчку
  End --while end
  
  Close MatCursor
  Deallocate MatCursor
  
  Return
END

