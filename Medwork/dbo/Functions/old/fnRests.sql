
CREATE Function [dbo].[fnRests](@storage int)
Returns @Result Table(
	[Id]	int primary key,
	[FullName]	varchar(100),
	RestRate int,
	Parent int,
	Producer varchar(100),
	NodeType varchar(10),
	Unit	varchar(50),
	Form	varchar(50),
	Type	varchar(50),
	Kind	varchar(50),
	Rest	Money,
	Price	float,	
	[Sum]	float,
	GroupName varchar(100))
As begin
	if (@storage>-1) begin
		Insert Into @Result		
		Select 
			[Id],[FullName],IsNull(RestRate,0) RestRate,Parent,Producer,NodeType,Unit,Form,Type,Kind,Rest,
			Round(Cast(IsNull(case
				when NodeType='NODE' then Price 
				else 
					case
						when Rest<>0 then Price/Rest
						else 0
					end
			end,0) as Money),2) [Price],
			Cast(IsNull(case
				when NodeType='NODE' then [Rest]*[Price]
				else [Price]
			end,0) as Float) [Sum],
			GroupName
		From(
		Select 
			[Id],[FullName],RestRate,Parent,Producer,NodeType,
			case
				when Unit is Null then ''
				else (Select Unit From UnitForm Where [id]=[Nom].Unit)
			end [Unit],
			case
				when Form is Null then ''
				else (Select Form From FactoryForm Where [id]=[Nom].Form)
			end [Form],
			case
				when Type is Null then ''
				else (Select TypeMaterial From TypeMaterial Where [id]=[Nom].Type)
			end [Type],
			case
				when Kind is Null then ''
				else (Select KindMaterial From KindMaterial Where [id]=[Nom].Kind)
			end [Kind],
			case
				when NodeType='NODE' then 
					Round(Cast(IsNull((
						Select isnull(nullif(SO.PriceWithNDS,0),SO.PurchasingPrice*(1+IsNULL(TaxRate/100,0)))  --[14.03.2007]
						From StorageOperations SO 
						Where SO.[ID]=Nom.OperationId),0) as Money),2)
				else 
                        (Select Round(Cast(Sum(N.Rest*isnull(nullif(SO.PriceWithNDS,0),SO.PurchasingPrice*(1+IsNULL(TaxRate/100,0)))) as money),2) --[14.03.2007]
						From Material N Inner Join StorageOperations SO On N.OperationId=SO.[ID]
						Where N.Parent=Nom.[id] and (N.Storage=@storage and N.NodeType='NODE'))
			end [Price],
			case
				when NodeType='FOLDER' then 				
					IsNull((
						Select Sum(N.Rest) 
						From Material N 
						Where N.Parent=Nom.[id] and (Storage=@storage and NodeType='NODE')),0)
				else Rest
			end [Rest],
			case
				when NodeType='FOLDER' then FullName 	
				else 
					(Select FullName 
					From Material N
					Where N.[Id]=Nom.Parent
					)
			end [GroupName]
		From Material Nom
		Where 
			(Parent is not Null)
			and
			((Storage=@storage and NodeType='NODE' and Rest<>0)or(Storage is Null and NodeType='FOLDER'))
		)[Temp]
		Order By
			[FullName]
	end else begin
		Insert Into @Result
		Select 
			[Id],[FullName],RestRate,Parent,Producer,NodeType,Unit,Form,Type,Kind,Rest,
			Round(Cast(IsNull(case
				when NodeType='NODE' then Price 
				else 
					case
						when Rest<>0 then Price/Rest
						else 0
					end
			end,0) as Money),2) [Price],
			Round(Cast(IsNull(case
				when NodeType='NODE' then [Rest]*[Price]
				else [Price]
			end,0) as Money),2) [Sum],
			GroupName
		From(
		Select 
			[Id],[FullName],RestRate,Parent,Producer,NodeType,
			case
				when Unit is Null then ''
				else (Select Unit From UnitForm Where [id]=[Nom].Unit)
			end [Unit],
			case
				when Form is Null then ''
				else (Select Form From FactoryForm Where [id]=[Nom].Form)
			end [Form],
			case
				when Type is Null then ''
				else (Select TypeMaterial From TypeMaterial Where [id]=[Nom].Type)
			end [Type],
			case
				when Kind is Null then ''
				else (Select KindMaterial From KindMaterial Where [id]=[Nom].Kind)
			end [Kind],
			case
				when NodeType='NODE' then 
					Round(Cast(IsNull((
                        Select isnull(nullif(SO.PriceWithNDS,0),SO.PurchasingPrice*(1+IsNULL(TaxRate/100,0)))  --[14.03.2007]						               
						From StorageOperations SO 
						Where SO.[ID]=Nom.OperationId),0) as Money),2)
				else 
						(Select Round(Cast(Sum(N.Rest*isnull(nullif(SO.PriceWithNDS,0),SO.PurchasingPrice*(1+IsNULL(TaxRate/100,0)))) as money),2) --[14.03.2007]
						From Material N Inner Join StorageOperations SO On N.OperationId=SO.[ID]
						Where N.Parent=Nom.[id] and (N.Storage>=0 and N.NodeType='NODE'))
			end [Price],
			case
				when NodeType='FOLDER' then 				
					IsNull((
						Select Sum(N.Rest) 
						From Material N 
						Where N.Parent=Nom.[id] and (Storage>=0 and NodeType='NODE')),0)
				else Rest
			end [Rest],
			case
				when NodeType='FOLDER' then FullName 	
				else 
					(Select FullName 
					From Material N
					Where N.[Id]=Nom.Parent
					)
			end [GroupName]
		From Material Nom
		Where 
			(Parent is not Null)
			and
			((Storage>=0 and NodeType='NODE' and Rest<>0)or(Storage is Null and NodeType='FOLDER'))
		)[Temp]
		Order By
			[FullName]
	end
	Return
end

