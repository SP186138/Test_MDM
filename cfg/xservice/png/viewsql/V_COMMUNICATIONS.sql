REPLACE VIEW MDM.v_communications
AS
LOCKING ROW FOR ACCESS
SELECT cl.REGIS_PRSNA_ID,
cl.HSHLD_PRSNA_ID,
cl.MATCHD_CNSMR_PRSNA_ID,
cl.Communication_Id,
c.Name AS Communication_Name,
c.Description AS Channel_Instance_Name,
chh.Channel_Class_Id,
cc.Name AS Channel_Name,
chh.Channel_Instance_Id,
--ci.Name AS Channel_Instance_Name,
cl.Selection_Dttm AS Contact_Dttm,
lk.Lead_Key_Id
,NULL (INTEGER) AS SYS_TARGET_ID
,NULL (VARCHAR(25)) AS SYS_AUTH_ID
,NULL (VARCHAR(25)) AS SYS_SOURCE
,NULL (VARCHAR(70)) AS SYS_CREATED_BY
,NULL (TIMESTAMP(0)) AS SYS_CREATION_DATE
,'ACTIVE' (VARCHAR(25)) AS SYS_ENT_STATE
,NULL (VARCHAR(70)) AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0)) AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25)) AS SYS_NC_TYPE
,NULL (VARCHAR(10000)) AS SYS_ERR_CODE
,NULL (VARCHAR(30)) AS SYS_ERR_SVRTY 
FROM TRM_LEAD_DB.LH_CURRENT_LEAD cl
LEFT JOIN LH_CONTACT_HISTORY ch
ON cl.Communication_Id = ch.Communication_Id AND
cl.Comm_Plan_Id = ch.Comm_Plan_Id AND
cl.REGIS_PRSNA_ID = ch.REGIS_PRSNA_ID AND
cl.HSHLD_PRSNA_ID = ch.HSHLD_PRSNA_ID AND
cl.MATCHD_CNSMR_PRSNA_ID = ch.MATCHD_CNSMR_PRSNA_ID AND
cl.Selection_Dttm = ch.Selection_Dttm AND
cl.Selection_Group_Ord = ch.Selection_Group_Ord AND
cl.Step_Id = ch.Step_Id AND
cl.Step_Dttm = ch.Step_Dttm AND
cl.Message_Id = ch.Message_Id
JOIN TRM_LEAD_DB.LH_LEAD_KEY_HISTORY lk
ON cl.Communication_Id = lk.Communication_Id AND
cl.Comm_Plan_Id = lk.Comm_Plan_Id AND
cl.REGIS_PRSNA_ID = lk.REGIS_PRSNA_ID AND
cl.HSHLD_PRSNA_ID = lk.HSHLD_PRSNA_ID AND
cl.MATCHD_CNSMR_PRSNA_ID = lk.MATCHD_CNSMR_PRSNA_ID AND
cl.Selection_Dttm = lk.Selection_Dttm AND
cl.Selection_Group_Ord = lk.Selection_Group_Ord AND
cl.Step_Id = lk.Step_Id AND
cl.Step_Dttm = lk.Step_Dttm AND
cl.Message_Id = lk.Message_Id
JOIN TRM_LEAD_DB.LH_CHANNEL_HISTORY chh
ON cl.Communication_Id = chh.Communication_Id AND
cl.Comm_Plan_Id = chh.Comm_Plan_Id AND
cl.REGIS_PRSNA_ID = chh.REGIS_PRSNA_ID AND
cl.HSHLD_PRSNA_ID = chh.HSHLD_PRSNA_ID AND
cl.MATCHD_CNSMR_PRSNA_ID = chh.MATCHD_CNSMR_PRSNA_ID AND
cl.Selection_Dttm = chh.Selection_Dttm AND
cl.Selection_Group_Ord = chh.Selection_Group_Ord AND
cl.Step_Id = chh.Step_Id AND
cl.Step_Dttm = chh.Step_Dttm AND
cl.Message_Id = chh.Message_Id
JOIN TRM_META_DB.CM_COMMUNICATION c
ON chh.Communication_Id = c.Communication_Id
LEFT JOIN TRM_META_DB.CM_CHANNEL_CLASS cc
ON chh.Channel_Class_Id = cc.Channel_Class_Id
LEFT JOIN TRM_META_DB.CM_CHANNEL_INSTANCE ci
ON chh.Channel_Instance_Id = ci.Channel_Instance_Id;