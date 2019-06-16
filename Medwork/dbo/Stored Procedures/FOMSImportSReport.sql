CREATE PROCEDURE dbo.FOMSImportSReport
    @Xml xml
AS
BEGIN
    EXEC dbo.FOMSReportSClear

    DECLARE
        @SLXml xml = NULL,
        @RlXml xml = NULL,
        @UslXml xml = NULL,
        @FOMS_S_SL_ID int = NULL,
        @FOMS_S_USL_ID int = NULL

    DECLARE sl_cursor CURSOR FOR
	    SELECT
		    a.query('(SL)')
		    FROM @Xml.nodes('ZL_LIST') AS zl(a)
    OPEN sl_cursor

    FETCH NEXT FROM sl_cursor INTO @SLXml
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO dbo.FOMS_S_SL (
            SL_ID,
            IDCASE,
            NSNDHOSP,
            REN,
            SOFA,
            PARENT,
            D_TYPE,
            FROM_FIRM,
            DS1_M
            )
            SELECT
                a.value('SL_ID[1]', 'varchar(36)') AS SL_ID,
                a.value('IDCASE[1]', 'varchar(36)') AS IDCASE,
                a.value('NSNDHOSP[1]', 'varchar(10)') AS NSNDHOSP,
                a.value('REN[1]', 'int') AS REN,
                a.value('SOFA[1]', 'varchar(10)') AS SOFA,
                a.value('PARENT[1]', 'int') AS PARENT,
                a.value('D_TYPE[1]', 'varchar(3)') AS D_TYPE,
                a.value('FROM_FIRM[1]', 'varchar(3)') AS FROM_FIRM,
                CAST((SELECT ', ' + a.value('(.)[1]', 'varchar(250)') FROM @SLXml.nodes('SL/DS1_M') as p(a) FOR XML PATH(''), TYPE) AS VARCHAR(MAX))
                FROM @SLXml.nodes('SL') AS p(a)

        SET @FOMS_S_SL_ID = SCOPE_IDENTITY()

        DECLARE usl_cursor CURSOR FOR
	    SELECT
		    a.query('(USL)')
		    FROM @SLXml.nodes('SL') AS zl(a)
        OPEN usl_cursor

        FETCH NEXT FROM usl_cursor INTO @UslXml
        WHILE @@FETCH_STATUS = 0
        BEGIN
            INSERT INTO dbo.FOMS_S_USL (
                FOMS_S_SL_ID,
                IDSERV,
                PR_USL
                )
                SELECT
                    @FOMS_S_SL_ID,
                    a.value('IDSERV[1]', 'varchar(36)') AS IDSERV,
                    a.value('PR_USL[1]','varchar(40)') AS PR_USL
                    FROM @UslXml.nodes('SL') AS sl(a)

            SET @FOMS_S_USL_ID = SCOPE_IDENTITY()

            DECLARE rl_cursor CURSOR FOR
	        SELECT
		        a.query('(RL)')
		        FROM @UslXml.nodes('SL') AS zl(a)
            OPEN rl_cursor

            FETCH NEXT FROM rl_cursor INTO @RlXml
            WHILE @@FETCH_STATUS = 0
            BEGIN
                INSERT INTO dbo.FOMS_S_RL (
                    FOMS_S_USL_ID,
                    IDRL,
                    NAME_MNN,
                    ID_ATX,
                    ID_MI,
                    KOL_MI
                    ) 
                    SELECT
                        @FOMS_S_USL_ID,
                        a.value('IDRL[1]', 'varchar(36)') AS IDRL,
                        a.value('NAME_MNN[1]', 'varchar(40)') AS NAME_MNN,
                        a.value('ID_ATX[1]', 'varchar(40)') AS ID_ATX,
                        a.value('ID_MI[1]', 'varchar(40)') AS ID_MI,
                        a.value('KOL_MI[1]', 'int') AS KOL_MI
                        FROM @RlXml.nodes('RL') AS rl(a)

                FETCH NEXT FROM rl_cursor INTO @RlXml
            END

            CLOSE rl_cursor
            DEALLOCATE rl_cursor

            FETCH NEXT FROM usl_cursor INTO @UslXml
        END

        CLOSE usl_cursor
        DEALLOCATE usl_cursor

        FETCH NEXT FROM sl_cursor INTO @SLXml
    END

    CLOSE sl_cursor
    DEALLOCATE sl_cursor
END