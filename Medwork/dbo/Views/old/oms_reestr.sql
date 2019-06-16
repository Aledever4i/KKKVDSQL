create view oms_reestr
as
select ID, 1000000+MasterID as ParentID, Name, Code, Price, '' as NodeType from oms_service
where hidden is null
union
select 1000000+ID, Null as ParentID, Name, ID, Null as Price, 'FOLDER' as NodeType from oms_razdel
where not name='Другое'
