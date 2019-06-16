
create PROCEDURE [dbo].[spNomenclature]
@storage INT, @WithoutZeroRest BIT
AS
begin
select *
from (	
	Select
		id,[FullName],EnabledLevel,RestRate,Parent,NodeType,Unit,Form,Type,Kind,
		TradeName,WorldName,Pack,Dosage,Prod,QuantPerPlace,Fraction,Comment,Note,Storage,RetailPrice,
		case
			when NodeType='FOLDER' and Parent is Null then 
				(Select IsNull(Sum(Rest),0) From  		
					(Select id,[Parent],
						case
						when NodeType='FOLDER' and Parent is not Null then
						IsNull((Select Sum(N.Rest) From Material N Where(N.Parent=N1.[id])
															and ((@storage=-1) or (Storage=@storage and NodeType='NODE'))
										 ),0)
						else Rest
						end [Rest]
					From Material N1
					)[yTemp]
					Where yTemp.Parent=xTemp.id
				)
		else Rest
		end [CurrentRest],
		Nacenka,
		CalcPriceMethod,
		OperationID,
		NomRetailPrice,
		NomNacenka,
		Provider,
		Series,
		CreateDate
	From(
		Select 
			Nom.Id,[FullName],EnabledLevel,RestRate,Parent,NodeType,Unit,Form,Type,Kind,Nom.Storage,
            Round(cast(op.RetailPrice as money),2) as [RetailPrice],
			IsNull([TradeName],'')		[TradeName],
			IsNull([WorldName],'')		[WorldName],
			IsNull([Pack],'')		[Pack],
			IsNull([Dosage],'') [Dosage],
			IsNull([Producer],'')[Prod],
			IsNull([QuantPerPlace],'')[QuantPerPlace],
			IsNull([Fraction],'')[Fraction],
			IsNull(Cast(Nom.Comment as varchar),'')	[Comment],
			IsNull(Cast([Note]as varchar),'')[Note],
			case
			when NodeType='FOLDER' and Parent is not Null then 
				IsNull((Select Sum(N.Rest) From Material N 
								Where (N.Parent=Nom.[id]) 
											and ((@storage=-1) or (Storage=@storage and NodeType='NODE'))
								 ),0)
			else Rest
			end [Rest],
			NacenkaPN as Nacenka,
			CalcPriceMethod as CalcPriceMethod,
			Round(cast(Nom.RetailPrice as money),2) as NomRetailPrice,
			Round(cast(Nom.Nacenka as money),2) as NomNacenka,
			OperationID,
			d.Provider,
			Nom.Series,
			Nom.CreateDate
		From 
			Material Nom 
			left join StorageOperations op on Nom.OperationID=op.id
			left join StorageDocument d on op.MasterID=d.id
		where
			@storage=-1 or
			((Nom.Storage=@storage and NodeType='NODE')or(Nom.Storage is Null and NodeType='FOLDER'))

		) [xTemp]
		Group By
		id,[FullName],EnabledLevel,RestRate,Parent,NodeType,Unit,Form,Type,Kind,Rest,
		TradeName,WorldName,Pack,Dosage,Prod,QuantPerPlace,Fraction,Comment,Note,xTemp.Storage,RetailPrice,Nacenka,CalcPriceMethod,OperationID,NomRetailPrice,NomNacenka,Provider,
		Series,CreateDate
) as a
where (@WithoutZeroRest<>0 and CurrentRest>0) or (@WithoutZeroRest=0 and not (CurrentRest=0	 and NodeType='NODE'))
order by FullName
end
