show view v_sample

REPLACE VIEW MDM.V_SAMPLE 
 (MKTNG_PGM_NBR   
 ,REGIS_PRSNA_ID   
 ,CNSMR_ACTN_TYPE_CODE   
 ,CNSMR_ACTN_NUM   
 ,LEGAL_ENT_NBR   
 ,CNSMR_ACTN_ID   
 ,INCTV_NBR   
 ,PROD_ITEM_NUM   
 ,ORDER_NUM   
 ,ORDER_STATUS   
 ,SHIPPED_DATE   
 ,COURIER_URL   
 ,TRACKING_NBR   
 ,INCTV_NAME
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
 )AS LOCKING ROW FOR ACCESS   
 SELECT   
 CA.MKTNG_PGM_NBR   
 ,CA.REGIS_PRSNA_ID   
 ,CA.CNSMR_ACTN_TYPE_CODE   
 ,CA.CNSMR_ACTN_NUM   
 ,CA.LEGAL_ENT_NBR   
 ,RQI.CNSMR_ACTN_ID   
 ,RQI.INCTV_NBR   
 ,RQI.PROD_ITEM_UPC   
 ,RQI.ORDER_NUM   
 ,RQI.ORDER_STATUS   
 ,RQI.SHIPPED_DATE   
 ,RQI.COURIER_URL   
 ,RQI.TRACKING_NUM 
 ,INC.INCTV_NAME
 ,NULL (INTEGER)   AS  SYS_TARGET_ID,   
 NULL (VARCHAR(25))  AS SYS_AUTH_ID,   
 NULL (VARCHAR(25))  AS SYS_SOURCE,   
 NULL (VARCHAR(70))  AS SYS_CREATED_BY,   
 NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE,   
 'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE,   
 NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY,   
 NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE,    
 NULL (VARCHAR(25))  AS SYS_NC_TYPE,   
 NULL (VARCHAR(10))  AS SYS_ERR_CODE,   
 NULL (VARCHAR(30))  AS SYS_ERR_SVRTY                                                              
 FROM REQSTD_INCTV RQI   
JOIN  CNSMR_ACTN CA   
 ON   RQI.CNSMR_ACTN_ID=CA.CNSMR_ACTN_ID
 LEFT JOIN MDM.INCTV INC
 ON RQI.INCTV_NBR=INC.INCTV_NBR
 WHERE CA.CNSMR_ACTN_TYPE_CODE IN ('RI','RC','RS');