
/**************************************************************************************************************************
	Подсчитываем предпологаемое кол-во по каждому препарату для заказа поставщику.
	Назаркин Д.А.
***************************************************************************************************************************/
CREATE PROCEDURE dbo.SP_ZakazPoItogam 	@DataStart smalldatetime,@DataStop smalldatetime,@StorageID int,@DocID int,@AuthorID int
 AS
begin

declare 	@Status_Cursor int,
			@a int,@b int,@c int,@d int,@e int,
			@ArticleID int,
			@MatName varchar (50),
			@SkladName varchar(50),
			@SOID int,
			@CreateDate datetime


				declare UPD Insensitive Cursor For
					select ID,FullName from Material (nolock) where Parent is NULL
				open UPD
				set @Status_Cursor=0
				while (@Status_Cursor=0)
				begin
					Fetch Next From UPD into @ArticleID,@MatName
					select @Status_Cursor=@@Fetch_Status
					IF @@Fetch_Status = 0  	
					begin
						set @e = (select ISNULL(M1.RestRate,0)  -- неснижаемый остаток
											from Material M
											left join Material M1 on (M.Parent = M1.ID)
										 where M.ID = @ArticleID)
										 
						set @a =ISNULL((select SUM(SO.Quantity) from StorageDocument SD (nolock) --Приход за период
									left join StorageOperations SO (nolock) on (SD.ID = SO.MasterID)
									left join Material M (nolock) on (SO.Article = M.ID)
								where	(SD.OperationType in (1,4)) and	
										(SO.Article = @articleid or M.Parent = @articleid) and	
										(Confirmation = 1) and 
										(SD.Storage = @StorageID) and 
										(SD.CreateDate between @DataStart and @DataStop)),0)

						set @b =ISNULL((select SUM(SO.Quantity) from StorageDocument SD (nolock) --Расход за период
									left join StorageOperations SO (nolock) on (SD.ID = SO.MasterID)
									left join Material M (nolock) on (SO.Article = M.ID)
								where	(SD.OperationType in (2,3,5,7))  and 
										(SO.Article = @articleid or M.Parent = @articleid )	and 
										(Confirmation = 1) and
										(SD.Storage = @StorageID) and 
										(SD.CreateDate between @DataStart and @DataStop)),0)
						set @d = ISNULL((select SUM(SO.Quantity)  -- Остаток на начало периода
									from StorageDocument SD (nolock)
									left join StorageOperations SO (nolock) on (SD.ID = SO.MasterID)
									left join Material M (nolock) on (SO.Article = M.ID)
									where	(SD.OperationType in (1,4)) and	
										(SO.Article = @articleid or M.Parent = @articleid) and	
										(Confirmation = 1) and 
										(SD.Storage = @StorageID) and 
										(SD.CreateDate < @DataStart )),0) -
								ISNULL((select SUM(SO.Quantity) from StorageDocument SD (nolock)
									left join StorageOperations SO (nolock) on (SD.ID = SO.MasterID)
									left join Material M (nolock) on (SO.Article = M.ID)
								where	(SD.OperationType in (2,3,5,7))  and 
										(SO.Article = @articleid or M.Parent = @articleid )	and 
										(Confirmation = 1) and
										(SD.Storage = @StorageID) and 
										(SD.CreateDate < @DataStart)),0)								
						
						set @c = @d+(@a - @b) -- Остаток на конец периода
						
						if @b > (@c + @e)
						begin
							set @SOID = (select ISNULL(Max(Id)+1,1) From StorageOperations)
							set @CreateDate = (select CreateDate from StorageDocument where ID = @DocID)
							
							insert into StorageOperations (ID,MasterID,Article, Quantity,Author,CreateDate)
							select @SOID,@DocID,@ArticleID,@b-(@c+@e),@AuthorID,cast(GetDate() as smalldatetime)--@CreateDate
						end
					end 
				end
				Close UPD 
				Deallocate UPD
end
