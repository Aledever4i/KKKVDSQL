CREATE PROCEDURE dbo.FOMSImportLReport
    @Xml xml
AS
BEGIN
    EXEC dbo.FOMSReportLClear

    DECLARE @PersXml xml = NULL

    DECLARE l_cursor CURSOR FOR
	    SELECT
		    a.query('(PERS)')
		    FROM @Xml.nodes('PERS_LIST') AS zl(a)
    OPEN l_cursor

    FETCH NEXT FROM l_cursor INTO @PersXml
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO dbo.FOMS_L_PERS (
            ID_PAC,
            FAM,
            IM,
            OT,
            W,
            DR,
            DOST,
            TEL,
            FAM_P,
            IM_P,
            OT_P,
            W_P,
            DR_P,
            DOST_P,
            MR,
            DOCTYPE,
            DOCSER,
            DOCNUM,
            SNILS,
            OKATOG,
            OKATOP,
            COMENTP
            )
            SELECT
                a.value('ID_PAC[1]', 'varchar(36)') AS ID_PAC,
                a.value('FAM[1]', 'varchar(40)') AS FAM,
                a.value('IM[1]', 'varchar(40)') AS IM,
                a.value('OT[1]', 'varchar(40)') AS OT,
                a.value('W[1]', 'int') AS W,
                a.value('DR[1]', 'date') AS DR,
                CAST((SELECT ', ' + a.value('(.)[1]', 'varchar(36)') FROM @PersXml.nodes('PERS/DOST') as p(a) FOR XML PATH(''), TYPE) AS VARCHAR(100)),
                a.value('TEL[1]', 'varchar(20)') AS TEL,
                a.value('FAM_P[1]', 'varchar(40)') AS FAM_P,
                a.value('IM_P[1]', 'varchar(40)') AS IM_P,
                a.value('OT_P[1]', 'varchar(40)') AS OT_P,
                a.value('W_P[1]', 'varchar(40)') AS W_P,
                a.value('DR_P[1]', 'date') AS DR_P,
                CAST((SELECT ', ' + a.value('(.)[1]', 'varchar(36)') FROM @PersXml.nodes('PERS/DOST_P') as p(a) FOR XML PATH(''), TYPE) AS VARCHAR(100)),
                a.value('MR[1]', 'varchar(100)') AS MR,
                a.value('DOCTYPE[1]', 'varchar(2)') AS DOCTYPE,
                a.value('DOCSER[1]', 'varchar(10)') AS DOCSER,
                a.value('DOCNUM[1]', 'varchar(20)') AS DOCNUM,
                a.value('SNILS[1]', 'varchar(14)') AS SNILS,
                a.value('OKATOG[1]', 'varchar(11)') AS OKATOG,
                a.value('OKATOP[1]', 'varchar(11)') AS OKATOP,
                a.value('COMENTP[1]', 'varchar(250)') AS COMENTP
                FROM @PersXml.nodes('PERS') AS p(a)
        
        FETCH NEXT FROM l_cursor INTO @PersXml
    END

    CLOSE l_cursor
    DEALLOCATE l_cursor
END