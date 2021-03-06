REPLACE VIEW MDM.V_COUPON_REDEEMED (                                                                                         
  MKTNG_PGM_NBR         
  ,REGIS_PRSNA_ID         
  ,CNSMR_ACTN_TYPE_CODE   
  ,CNSMR_ACTN_NUM   
  ,LEGAL_ENT_NBR   
  ,CNSMR_ACTN_ID   
  ,COUPN_SERL_NUM   
  ,RDMPT_DATETM   
  ,COUPN_STATUS_CODE   
  ,STORE_NAME   
  ,REDEMPTN_VALUE   
  ,INCTV_NBR   
  ,SYS_TARGET_ID,   
  SYS_AUTH_ID,   
  SYS_SOURCE,   
  SYS_CREATED_BY,   
  SYS_CREATION_DATE,   
  SYS_ENT_STATE,   
  SYS_LAST_MODIFIED_BY,   
  SYS_LAST_MODIFIED_DATE,   
  SYS_NC_TYPE,   
  SYS_ERR_CODE,   
  SYS_ERR_SVRTY   
  )   
  AS LOCKING ROW FOR ACCESS    
  SELECT   
  CA.MKTNG_PGM_NBR   
  ,CA.REGIS_PRSNA_ID   
  ,CA.CNSMR_ACTN_TYPE_CODE   
  ,CA.CNSMR_ACTN_NUM   
  ,CA.LEGAL_ENT_NBR   
  ,RDM.CNSMR_ACTN_ID   
  ,RDM.COUPN_SERL_NUM   
  ,RDM.RDMPT_DATETM   
  ,RDM.COUPN_STATUS_CODE   
  ,RDM.ALT_STORE_NAME   
  ,RDM.REDEMPTN_VALUE   
  ,RDM.INCTV_NBR   
  ,NULL (INTEGER)   AS  SYS_TARGET_ID,   
  NULL (VARCHAR(25))  AS SYS_AUTH_ID,   
  NULL (VARCHAR(25))  AS SYS_SOURCE,   
  NULL (VARCHAR(70))  AS SYS_CREATED_BY,   
  NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE,   
  'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE,   
  NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY,   
  NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE,    
  NULL (VARCHAR(25))  AS SYS_NC_TYPE,   
  NULL (VARCHAR(10000))  AS SYS_ERR_CODE,   
  NULL (VARCHAR(30))  AS SYS_ERR_SVRTY                                                            
  FROM MDM.COUPN_INSTN_REDEMPTN RDM   
 JOIN  MDM.CNSMR_ACTN CA   
  ON   RDM.CNSMR_ACTN_ID=CA.CNSMR_ACTN_ID   
 AND RDM.MKTNG_PGM_NBR=CA. MKTNG_PGM_NBR
 AND RDM.LEGAL_ENT_NBR=CA. LEGAL_ENT_NBR
  WHERE COUPN_STATUS_CODE = 'RM'    
;