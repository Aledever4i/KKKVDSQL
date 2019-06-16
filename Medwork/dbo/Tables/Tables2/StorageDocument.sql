CREATE TABLE [dbo].[StorageDocument] (
    [ID]              INT            NOT NULL,
    [Author]          INT            NULL,
    [CreateDate]      DATETIME       NULL,
    [Storage]         INT            NULL,
    [Provider]        NVARCHAR (100) NULL,
    [Num]             NVARCHAR (20)  NULL,
    [Comment]         NTEXT          NULL,
    [StorageDate]     DATETIME       NULL,
    [StorageTime]     DATETIME       NULL,
    [StoragePerson]   NVARCHAR (100) NULL,
    [Organistion]     NVARCHAR (100) NULL,
    [OperationType]   INT            NULL,
    [Confirmation]    BIT            NULL,
    [OutStorage]      INT            NULL,
    [AccountCategory] NVARCHAR (50)  NULL,
    [Pay]             NVARCHAR (1)   NULL,
    [NakladRashod]    MONEY          NULL,
    [FinansKateg]     INT            NULL,
    [Receiveperson]   INT            NULL,
    [Provizor]        INT            NULL,
    [Checking]        INT            NULL,
    CONSTRAINT [StorageDocumentPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
--*********************************************************************************
--	Тригер на удаление документов StorageDocument.
--	Если документ подтвержден то отказ в удалении.
--	Приудалении не подтвержденного документа удаляются из таблицы StorageOperations
--	записи поле MasterID которых соответствуют полю ID таблицы StorageDocument.
--
--	Назаркин Д.А. 11,07,2007
--	(для использованияв модуле Аптека)
--*********************************************************************************

CREATE TRIGGER [TDEL_StorageDocument] ON [dbo].[StorageDocument] 
FOR DELETE 
AS
	declare @RecStatus int, -- Статус документа (0-не подтвержденный 1-подтвержденный)
		@DocID int -- Идетификатор удаляемого документа

	set @RecStatus = (select Confirmation from deleted)


	if @RecStatus <> 0 
	begin
		raiserror 50001 'Нельзя удалять подтвержденный документ.'
		rollback tran
		return
	end	

	
	set @DocID = (select ID from Deleted)
	delete StorageOperations
		where MasterID = @DocID





GO
--************************************************************************
--	Автоматическое формирование документов в таблице StorageOperations
--
--	Назаркин Д.А.
--	11,07,2007
-- (модуль Аптека)
--************************************************************************
-- 2008.09.25 Петров Л. Исправление неотображающегося имени товара
-- 

CREATE TRIGGER [dbo].[TINS_StorageDocument] ON [dbo].[StorageDocument] 
FOR INSERT 
AS
	declare @OperationType int, -- Тип операции
	 @DocID int, -- ИД для заполнения в StorageOperations поля MasterID
	 @AuthorID int, -- Идентификатор автора документа
	 @SOID int, -- Идентификатор для StorageOperations
	 @Article int, -- Идентификатор товара
	 @Quantity money, -- Количество товара
	 @StorageID int, -- Идентификатор склада
	 @CreateDate datetime, -- Дата создания документа
	 @Price money
	
	set @DocID  = (select Id from inserted)
	set @OperationType = (select OperationType from inserted)
	set @AuthorID = (select Author from inserted)
	set @SOID = (select ISNULL(Max(Id)+1,1) From StorageOperations) 
	set @StorageID = (select Storage from inserted)
	set @CreateDate = (select CreateDate from inserted)

		if @OperationType = 10 -- Формирование инвентаризационного документа
			begin
			declare 	@Rest int,
				@Status_Cursor int,
				@Price1 money

				declare UPD Insensitive Cursor For
					select M.ID ,ISNULL(SUM(M.Rest),0),(select PurchasingPrice from StorageOperations p where p.id=m.OperationID) as Price
						from Material M (nolock)
						left join Material M1 (nolock) on (M.Parent = M1.ID)
					where M.NodeType <> 'FOLDER' and M.Storage = @StorageID
					 Group By M.ID, M.OperationID

				open UPD
				set @Status_Cursor=0
				while (@Status_Cursor=0)
				begin
					Fetch Next From UPD into @Article,@Quantity,@Price
					declare @MatName1 varchar(255)
					set @MatName1=(select top 1 fullname from material where id=@Article)
					select @Status_Cursor=@@Fetch_Status
					IF @@Fetch_Status = 0  	
					begin
						set @SOID = (select ISNULL(Max(Id)+1,1) From StorageOperations)
						insert into StorageOperations (ID,MasterID,Article, Quantity,Author,CreateDate,MaterialStr,PurchasingPrice)
						select @SOID,@DocID,@Article,@Quantity,@AuthorID,@CreateDate,@MatName1,@Price
					end 
				end
				Close UPD 
				Deallocate UPD
			return
			end

GO

CREATE TRIGGER TUPD_StorageDocument 
   ON  dbo.StorageDocument for UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare 		@OperationType int, -- вид операции
			@DocID int, -- идентификатор документа
			@ISConfirm int, -- статус документа (1 - подтверждент)
			@Article int, -- идентификатор материала
			@RealRest int -- реальные остатки после инвентаризации

	set @OperationType = (select OperationType from inserted)
	set @DocID = (select Id from inserted)
	set @IsConfirm = (select Confirmation from inserted)

	if (@OperationType = 10) and (@IsConfirm = 1) -- подтверждение сличительной ведомости
	begin
		declare 	
		@Status_Cursor int

				declare UPD Insensitive Cursor For
					select Article,ISNULL(RealRest,0) from StorageOperations where MasterID = @DocID
				open UPD
				set @Status_Cursor=0
				while (@Status_Cursor=0)
				begin
					Fetch Next From UPD into @Article,@RealRest
					select @Status_Cursor=@@Fetch_Status
					IF @@Fetch_Status = 0  	
					begin
						Update Material
							set Rest = @RealRest
						where ID = @Article
					end 
				end
				Close UPD 
				Deallocate UPD
		return
	end

	if (@OperationType = 7) and (@IsConfirm = 1) -- подтверждение возврата поставщику
	begin
				begin tran TUPD_StorageDocument_Confirm
				declare UPD Insensitive Cursor For
					select Article,ISNULL(Quantity,0) from StorageOperations where MasterID = @DocID
				open UPD
				set @Status_Cursor=0
				while (@Status_Cursor=0)
				begin
					Fetch Next From UPD into @Article,@RealRest
					select @Status_Cursor=@@Fetch_Status
					IF @@Fetch_Status = 0  	
					begin
						Update Material
							set Rest = Rest - @RealRest
						where ID = @Article
						if (select count(*) from Material where Rest<0 and ID = @Article)>0
						begin
							rollback tran
							Close UPD 
							Deallocate UPD			
							declare @errmsg nvarchar(500)
							set @errmsg='Документ не может быть подтверждён:'+Char(10)+Char(13)+'Текущий остаток на складе меньше нужного количества ('+
								(select FullName from Material where id= @Article)+').'+Char(10)+Char(13)+'Действие отменено.'
							raiserror (@errmsg,16,1)
							return
						end
					end 
				end
				Close UPD 
				Deallocate UPD			
				commit tran TUPD_StorageDocument_Confirm
		return
	end

END



