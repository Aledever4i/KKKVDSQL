
CREATE VIEW v_quota_log
AS
SELECT UID, quota_id, lib_object_id, form_id, form_tablename, patformid, quota_date, init_rest, record_date, user_id
FROM quota_log L
LEFT JOIN PatForm P with (nolock) ON (ISNULL(L.PatFormID, 0) = P.ID)
WHERE (L.active=1) AND (ISNULL(P.Canceled,0)=0)
