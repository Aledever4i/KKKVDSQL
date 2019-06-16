
Create Procedure spCategoriesNomenclature(@storage int)
As begin
	Declare @s1 varchar(100),@s2 varchar(100),@sql varchar(2000)
	if @storage>-1 begin
		Set @s1='Where ((Storage='+Cast(@storage as varchar)+' and NodeType=''NODE'')or(Storage is Null and NodeType=''FOLDER''))'
		Set @s2='and(Storage='+Cast(@storage as varchar)+' and NodeType=''NODE'')'
	end else begin
		Set @s1=''
		Set @s2=''
	end 				
	Set @sql='
		Select 
			[Id],
			[FullName],
			CurrentRest,
			RestRate,
			Parent,
			Storage,
			case
				when parent is null then ''FOLDER''
				else ''NODE''
			end [NodeType]
		From(
			Select
				case
					when NodeType=''FOLDER'' and Parent is Null then 
					(Select IsNull(Sum(Rest),0) From  		
					(Select [Id],[Parent],
						case
							when NodeType=''FOLDER'' and Parent is not Null then 
								IsNull((Select Sum(N.Rest) From Material N Where(N.Parent=N1.[id]) ===LOCAL_WHERE=== ),0)
							else Rest
						end [Rest]
					From Material N1
					)[yTemp]
					Where yTemp.Parent=xTemp.Id
					)
					else Rest
				end [CurrentRest],	
				[Id],[FullName],RestRate,Parent,NodeType,Storage
			From(
				Select 
				[Id],[FullName],RestRate,Parent,NodeType,Storage,
				case
					when NodeType=''FOLDER'' and Parent is not Null then 
						IsNull((Select Sum(N.Rest) From Material N 
							Where (N.Parent=Nom.[id]) ===LOCAL_WHERE=== ),0)
					else Rest
				end [Rest]
			From 
				Material Nom
			===WHERE===
			)[xTemp]
			Group By
				[Id],[FullName],RestRate,Parent,NodeType,Rest,Storage
		)[x2Temp]
		Where 
			NodeType<>''NODE'''
	Set @sql=Replace(Replace(@sql,'===LOCAL_WHERE===',@s2),'===WHERE===',@s1)
	Exec(@sql)
end
