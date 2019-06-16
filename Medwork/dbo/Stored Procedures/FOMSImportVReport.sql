CREATE PROCEDURE dbo.FOMSImportVReport
    @Xml xml
AS
BEGIN
    EXEC dbo.FOMSReportVClear

    DECLARE
        @ZapXml xml = NULL,
        @SLXml xml = NULL,
        @OXml xml = NULL,
        @FOMS_V_ZAP_ID int = NULL,
        @FOMS_V_SL_ID int = NULL

    DECLARE zap_cursor CURSOR FOR   
	SELECT
		a.query('(ZAP)')
		FROM @Xml.nodes('FLK_P') AS zl(a)
    OPEN zap_cursor  

    FETCH NEXT FROM zap_cursor INTO @ZapXml
    WHILE @@FETCH_STATUS = 0  
    BEGIN
        INSERT INTO dbo.FOMS_V_ZAP (
            N_ZAP
            )
            SELECT
                a.value('N_ZAP[1]', 'varchar(36)') AS N_ZAP
                FROM @ZapXml.nodes('ZAP') AS zap(a)
        
        SET @FOMS_V_ZAP_ID = SCOPE_IDENTITY()

        DECLARE sl_cursor CURSOR FOR   
	    SELECT
		    a.query('(SL)')
		    FROM @ZapXml.nodes('ZAP') AS sl(a)
        OPEN sl_cursor  

        FETCH NEXT FROM sl_cursor INTO @SLXml
        WHILE @@FETCH_STATUS = 0  
        BEGIN
            INSERT INTO dbo.FOMS_V_SL (
                FOMS_V_ZAP_ID,
                SL_ID,
                IDCASE,
                NHISTORY,
                [CARD],
                SMO,
                SMO_FOND
                )
                SELECT
                    @FOMS_V_ZAP_ID,
                    a.value('SL_ID[1]', 'varchar(36)') AS SL_ID,
                    a.value('IDCASE[1]', 'varchar(36)') AS IDCASE,
                    a.value('NHISTORY[1]', 'varchar(36)') AS NHISTORY,
                    a.value('CARD[1]', 'varchar(36)') AS [CARD],
                    a.value('SMO[1]', 'varchar(36)') AS SMO,
                    a.value('SMO_FOND[1]', 'varchar(36)') AS SMO_FOND
                    FROM @SLXml.nodes('SL') AS sl(a)

            SET @FOMS_V_SL_ID = SCOPE_IDENTITY()

            DECLARE o_cursor CURSOR FOR   
	        SELECT
		        a.query('(OTKAZ)')
		        FROM @SLXml.nodes('SL') AS otkaz(a)
            OPEN o_cursor  

            FETCH NEXT FROM o_cursor INTO @OXml
            WHILE @@FETCH_STATUS = 0  
            BEGIN
                INSERT INTO dbo.FOMS_V_OTKAZ (
                    FOMS_V_SL_ID,
                    I_TYPE,
                    COMMENT
                    )
                    SELECT
                        @FOMS_V_SL_ID,
                        a.value('I_TYPE[1]', 'varchar(36)') AS I_TYPE,
                        a.value('COMMENT[1]', 'varchar(250)') AS COMMENT
                        FROM @OXml.nodes('OTKAZ') AS o(a)

                FETCH NEXT FROM o_cursor INTO @OXml
            END

            CLOSE o_cursor
            DEALLOCATE o_cursor

            FETCH NEXT FROM sl_cursor INTO @SLXml
        END

        CLOSE sl_cursor
        DEALLOCATE sl_cursor


        FETCH NEXT FROM zap_cursor INTO @ZapXml
    END

    CLOSE zap_cursor
    DEALLOCATE zap_cursor
END