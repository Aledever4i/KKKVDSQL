CREATE VIEW [dbo].[Diagnosis]
AS
select 
	[ID],
	[PatID],
	[MasterID],
	[Text],
	DiagCode as [CodeMkb10],
	[DiagType],
	[Data] as [SetDate],
	OffDate as [UnsetDate],
	Vrach as [SetDoctor],
	[UnsetDoctor],
	IsOff as [Unset],
	[DiagKind],
	[sourceId],
	[source],
	[first],
	[prof]
from ZaklDiag
