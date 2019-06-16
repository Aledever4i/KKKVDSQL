CREATE VIEW ResourcesFoldersView
AS
select ID, ID as FolderID, Name, 0 as Type from Dept where DeptTypeID <> 2
union
select -ID, ID as FolderID, NameSpeciality as Name, 1 as Type from Specialitie
