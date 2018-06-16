.logon $TDPID/$TDUSER,$TDPWD

.SET ERROROUT STDOUT ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.SET SESSION CHARSET 'UTF8' ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.GOTO $Step

.LABEL L1
REPLACE VIEW MDM.V_ADDRESS 			
	AS LOCKING ROW FOR ACCESS		
	NONSEQUENCED TRANSACTIONTIME		
	SELECT		
	AD.REGIS_PRSNA_ID		
	,AD.SUBSCRPTN_OPT_IND		
	,AD.CNSMR_CHCE_DATETM		
	,COALESCE(AD.ADDR_LINE_1_TXT,'') || COALESCE(AD.ADDR_LINE_2_TXT,'') || COALESCE(AD.CITY_NAME,'') || COALESCE(AD.POSTL_AREA_CODE,'') AS ADDR_LINE_1_TXT		
	,AD.ADDR_LINE_2_TXT		
	,AD.CITY_NAME		
	,AD.POSTL_AREA_CODE		
	,AD.CNTRY_CODE		
	,AD.CNTCT_POINT_CATEG_CODE		
	,AD.SUBSCRPTN_OPT_NBR		
	,AD.MKTNG_PGM_NBR		
	,AD.LEGAL_ENT_NBR		
	,SO.SUBSCRPTN_OPT_NAME		
	,SO.SUBSCRPTN_OPT_STMT_TXT		
	,NULL (INTEGER)   AS  SYS_TARGET_ID		
	,NULL (VARCHAR(25))  AS SYS_AUTH_ID		
	,NULL (VARCHAR(25))  AS SYS_SOURCE		
	,NULL (VARCHAR(70))  AS SYS_CREATED_BY		
	,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE		
	,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE		
	,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY		
	,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE		
	,NULL (VARCHAR(25))  AS SYS_NC_TYPE		
	,NULL (VARCHAR(10000))  AS SYS_ERR_CODE		
	,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY                                                           		
	FROM MDM.REGIS_PRSNA_POSTL_ADDR AD		
	LEFT JOIN		
	(SEL * FROM  MDM.SUBSCRPTN_OPT ) SO		
	ON		
	AD.MKTNG_PGM_NBR=SO.MKTNG_PGM_NBR		
	AND 		
	AD.LEGAL_ENT_NBR=SO.LEGAL_ENT_NBR		
	AND		
	AD.SUBSCRPTN_OPT_NBR=SO.SUBSCRPTN_OPT_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L1A
REPLACE VIEW MDM.CAMPAIGN AS LOCKING ROW FOR ACCESS SELECT * FROM ICRM_TBL.CAMPAIGN;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
.LABEL L2			
	
REPLACE VIEW MDM.V_CAMPAIGN
 AS  
 LOCKING ROW FOR ACCESS  
 SELECT  
  A.REGIS_PRSNA_ID
  ,A1.CAMPAIGN_ID   
    ,B.CAMPAIGN_NAME AS CAMPAIGN_NAME  
    ,A.MKTNG_PGM_NBR   
    ,D.COMM_CHNL_NAME AS CAMPAIGN_CHANNEL   
  ,A1.CAMPAIGN_RUN_DTTM AS CAMPAIGN_EXEC_DATE
 ,E.MKTNG_PGM_NAME AS MKTNG_PGM_DESC
 ,D.COMM_CHNL_NAME AS PROMOTION_EMAIL_ADDR_TXT 
 ,NULL (INTEGER)   AS  SYS_TARGET_ID  
  ,NULL (VARCHAR(25))  AS SYS_AUTH_ID  
  ,NULL (VARCHAR(25))  AS SYS_SOURCE  
  ,NULL (VARCHAR(70))  AS SYS_CREATED_BY  
  ,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE  
  ,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE  
  ,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY  
  ,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE  
  ,NULL (VARCHAR(25))  AS SYS_NC_TYPE  
  ,NULL (VARCHAR(10000))  AS SYS_ERR_CODE  
  ,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY     
  FROM  
   MDM.CAMPAIGN_CNSMR   A   
INNER JOIN MDM.CAMPAIGN_INST A1
ON A.CAMPAIGN_INST_ID=A1.CAMPAIGN_INST_ID
INNER JOIN MDM.CAMPAIGN B    
 ON A1.CAMPAIGN_ID = B.CAMPAIGN_ID 
INNER JOIN MDM.COMM_CHNL D
ON A1.COMM_CHNL_CODE=D.COMM_CHNL_CODE
AND D.COMM_CHNL_NAME NOT IN (SEL AV_DESCRIPTION FROM ATTRIBUTE_VALUES
 WHERE SYS_ENT_STATE='ACTIVE' AND ATTRIBUTE_TYPE_ID IN
 (SEL ATTRIBUTE_TYPE_ID 
 FROM ATTRIBUTE_TYPES
 WHERE ATTRIBUTE_TYPE='Ignore Channel Class')) 
 INNER JOIN MDM.MKTNG_PGM E  
 ON A.MKTNG_PGM_NBR=E.MKTNG_PGM_NBR;
	
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L3		
	ALTER TABLE MDM.RPT_LOAD_NBR
ADD WEBSITE_REGIS_NBR INTEGER;	
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;			
.LABEL L4			
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
  WHERE COUPN_STATUS_CODE = 'RM';
  
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;			
			
.LABEL L5				
			
REPLACE VIEW MDM.V_DATA_SRCE 			
  AS LOCKING ROW FOR ACCESS			
SELECT			
   DS.AGNCY_NBR   
  ,DS.AGNCY_NM   
  ,DS.AGNCY_DESC		
  ,WS.WEB_SITE_URL_TXT			
  ,RP.REGIS_PRSNA_ID			
  ,RP.MKTNG_PGM_NBR			
  ,RP.LEGAL_ENT_NBR			
  ,NULL (INTEGER)   AS  SYS_TARGET_ID			
  ,NULL (VARCHAR(25))  AS SYS_AUTH_ID			
  ,NULL (VARCHAR(25))  AS SYS_SOURCE			
  ,NULL (VARCHAR(70))  AS SYS_CREATED_BY			
  ,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE			
  ,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE			
  ,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY			
  ,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE			
  ,NULL (VARCHAR(25))  AS SYS_NC_TYPE			
  ,NULL (VARCHAR(10000))  AS SYS_ERR_CODE			
  ,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   			
  FROM MDM.REGIS_PRSNA RP			
  INNER JOIN			
  MDM.AGNCY DS 		
  ON			
  RP.SYS_TARGET_ID=DS.AGNCY_NBR			
  INNER JOIN			
  MDM.WEB_SITE WS			
  ON			
  DS.AGNCY_NBR= WS.AGNCY_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;  
 
.LABEL L6			
  REPLACE VIEW MDM.V_EMAIL 			
                AS LOCKING ROW FOR ACCESS 			
                NONSEQUENCED TRANSACTIONTIME			
                SELECT			
                EM.REGIS_PRSNA_ID			
                ,EM.SUBSCRPTN_OPT_IND			
                ,EM.CNSMR_CHCE_DATETM			
                ,EM.PREF_CNTCT_POINT_IND			
                ,EM.EMAIL_ADDR_TXT			
                ,EM.CNTCT_POINT_CATEG_CODE			
                ,EM.SUBSCRPTN_OPT_NBR			
                ,EM.MKTNG_PGM_NBR			
                ,EM.LEGAL_ENT_NBR			
                ,SO.SUBSCRPTN_OPT_NAME			
                ,SO.SUBSCRPTN_OPT_STMT_TXT			
                ,NULL (INTEGER)   AS  SYS_TARGET_ID			
                ,NULL (VARCHAR(25))  AS SYS_AUTH_ID			
                ,NULL (VARCHAR(25))  AS SYS_SOURCE			
                ,NULL (VARCHAR(70))  AS SYS_CREATED_BY			
                ,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE			
                ,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE			
                ,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY			
                ,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE			
                ,NULL (VARCHAR(25))  AS SYS_NC_TYPE			
                ,NULL (VARCHAR(10000))  AS SYS_ERR_CODE			
                ,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   			
                FROM MDM.REGIS_PRSNA_EMAIL_ADDR EM			
                LEFT JOIN         			
              (SEL * FROM  MDM.SUBSCRPTN_OPT )SO			
                ON			
                EM.MKTNG_PGM_NBR=SO.MKTNG_PGM_NBR			
                AND 			
                EM.LEGAL_ENT_NBR=SO.LEGAL_ENT_NBR			
                AND			
                EM.SUBSCRPTN_OPT_NBR=SO.SUBSCRPTN_OPT_NBR;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;					
.LABEL L7		
	REPLACE VIEW MDM.V_MATCHD_CNSMR_PRSNA_DTL		
AS			
LOCKING ROW FOR ACCESS			
SELECT			
 LEGAL_ENT_PRSNA_1.GVN_NAME			
,LEGAL_ENT_PRSNA_1.FAMLY_NAME			
,TRIM(LEGAL_ENT_PRSNA_1.FAMLY_NAME) ||','|| TRIM(LEGAL_ENT_PRSNA_1.GVN_NAME) as FULL_NAME     			
,LEGAL_ENT_PRSNA_1.MATCHD_CNSMR_PRSNA_ID			
,LEGAL_ENT_PRSNA_1.GENDR_IND			
,LEGAL_ENT_PRSNA_1.BRTH_DATE			
,COALESCE(TRIM(PRSNA_POSTL_ADDR_1.ADDR_LINE_1_TXT),'') ||    ' ' ||			
 COALESCE(TRIM(PRSNA_POSTL_ADDR_1.ADDR_LINE_2_TXT),'') ||  ' ' ||			
 COALESCE(TRIM(PRSNA_POSTL_ADDR_1.CITY_NAME),'') ||  ' ' ||			
 COALESCE(TRIM(PRSNA_POSTL_ADDR_1.POSTL_AREA_CODE),'') as FULL_ADDRESS			
          			
,LEGAL_ENT_PRSNA_1.LEGAL_ENT_NBR			
,NULL (INTEGER) 		AS  SYS_TARGET_ID	
,NULL (VARCHAR(25)) 	AS SYS_AUTH_ID		
,NULL (VARCHAR(25)) 	AS SYS_SOURCE		
,NULL (VARCHAR(70)) 	AS SYS_CREATED_BY		
,NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE		
,'ACTIVE'  (VARCHAR(25)) 	AS  SYS_ENT_STATE		
,NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY		
,NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE		
,NULL (VARCHAR(25)) 	AS SYS_NC_TYPE		
,NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE		
,NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   		
 FROM MDM.MATCHD_CNSMR_PRSNA LEGAL_ENT_PRSNA_1   			
 LEFT OUTER JOIN MDM.MATCHD_CNSMR_POSTL_ADDR PRSNA_POSTL_ADDR_1			
 ON LEGAL_ENT_PRSNA_1.MATCHD_CNSMR_PRSNA_ID = 			
 PRSNA_POSTL_ADDR_1.MATCHD_CNSMR_PRSNA_ID			
 AND LEGAL_ENT_PRSNA_1.LEGAL_ENT_NBR = PRSNA_POSTL_ADDR_1.LEGAL_ENT_NBR			
;			
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L8			
REPLACE VIEW MDM.V_PHONE 			
	AS LOCKING ROW FOR ACCESS		
	NONSEQUENCED TRANSACTIONTIME		
	SELECT		
	PH.REGIS_PRSNA_ID		
	,PH.SUBSCRPTN_OPT_IND		
	,PH.CNSMR_CHCE_DATETM		
	,PH.PREF_CNTCT_POINT_IND		
	,PH.FULL_PHONE_NUM		
	,PH.CNTCT_POINT_CATEG_CODE		
	,PH.SUBSCRPTN_OPT_NBR		
	,PH.MKTNG_PGM_NBR		
	,PH.LEGAL_ENT_NBR		
	,SO.SUBSCRPTN_OPT_NAME		
	,SO.SUBSCRPTN_OPT_STMT_TXT		
	,NULL (INTEGER)   AS  SYS_TARGET_ID		
	,NULL (VARCHAR(25))  AS SYS_AUTH_ID		
	,NULL (VARCHAR(25))  AS SYS_SOURCE		
	,NULL (VARCHAR(70))  AS SYS_CREATED_BY		
	,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE		
	,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE		
	,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY		
	,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE		
	,NULL (VARCHAR(25))  AS SYS_NC_TYPE		
	,NULL (VARCHAR(10000))  AS SYS_ERR_CODE		
	,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY 		
	FROM MDM.REGIS_PRSNA_PHONE PH		
	LEFT JOIN		
	(SEL * FROM  MDM.SUBSCRPTN_OPT ) SO		
	ON		
	PH.MKTNG_PGM_NBR=SO.MKTNG_PGM_NBR		
	AND 		
	PH.LEGAL_ENT_NBR=SO.LEGAL_ENT_NBR		
	AND		
	PH.SUBSCRPTN_OPT_NBR=SO.SUBSCRPTN_OPT_NBR;		
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;			
.LABEL L9			
	 REPLACE VIEW MDM.V_REGIS_PRSNA                  
AS                                           
LOCKING ROW FOR ACCESS                                        
SELECT
MATCHD_CNSMR_PRSNA_1.HSHLD_PRSNA_ID                                                
,REGIS_PRSNA_1.REGIS_PRSNA_ID                                        
,REGIS_PRSNA_1.MKTNG_PGM_NBR                                   
,REGIS_PRSNA_1.REGIS_CNSMR_ID_VAL                                            
,REGIS_PRSNA_1.GVN_NAME                                  
,REGIS_PRSNA_1.MID_NAME                                   
,REGIS_PRSNA_1.FAMLY_NAME                                              
,REGIS_PRSNA_1.FAMLY_NAME ||','|| REGIS_PRSNA_1.GVN_NAME AS FULL_NAME                                  
,REGIS_PRSNA_1.BRTH_DATE                                    
,REGIS_PRSNA_1.CNTRY_CODE AS CNTRY_NAME                                            
,REGIS_PRSNA_1.NATIONAL_ID_NBR                                    
,TRIM(REGIS_PRSNA_1.NAME_PREFX_TXT) AS NAME_PREFX_TXT                                          
,TRIM(REGIS_PRSNA_1.NAME_SUFFX_TXT) AS NAME_SUFFX_TXT                                         
,REGIS_PRSNA_1.CNSMR_USER_NAME                                               
,REGIS_PRSNA_1.GENDR_IND                                   
,REGIS_PRSNA_1.LEGAL_ENT_NBR                                         
,REGIS_PRSNA_1.LANG_CODE AS LANG_CODE                                 
,REGIS_PRSNA_1.LANG_CODE AS LANG_NAME                                               
,REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID                                                
,REGIS_PRSNA_1.DATA_ORIGIN_SRCE_NBR                                      
,REGIS_PRSNA_1.DATA_OP_SRCE_NAME                                           
,REGIS_PRSNA_1.PRSNA_STATUS_CODE                                             
,PRSNA_POSTL_ADDR_1.ADDR_LINE_1_TXT                                      
,PRSNA_POSTL_ADDR_1.ADDR_LINE_2_TXT                                      
,PRSNA_POSTL_ADDR_1.ADDR_LINE_3_TXT                                      
,PRSNA_POSTL_ADDR_1.STRET_NUM                                   
,PRSNA_POSTL_ADDR_1.STRET_NAME                                 
,PRSNA_POSTL_ADDR_1.APT_NUM                                       
,PRSNA_POSTL_ADDR_1.PO_BOX_NUM                                              
,PRSNA_POSTL_ADDR_1.CITY_NAME                                    
,PRSNA_POSTL_ADDR_1.TERR_CODE                                     
,PRSNA_POSTL_ADDR_1.TERR_CODE AS TERR_NAME                                    
,PRSNA_POSTL_ADDR_1.POSTL_AREA_CODE                                    
,PRSNA_POSTL_ADDR_1.WIN_KEY                                          
,COALESCE(PRSNA_POSTL_ADDR_1.ADDR_LINE_1_TXT,'') ||  ' ' ||                                           
COALESCE(PRSNA_POSTL_ADDR_1.ADDR_LINE_2_TXT,'') ||   ' ' ||                                           
COALESCE(PRSNA_POSTL_ADDR_1.CITY_NAME,'') ||  ' ' ||                                          
COALESCE(PRSNA_POSTL_ADDR_1.POSTL_AREA_CODE,'') AS FULL_ADDRESS                                    
,MKTNG_PGM_1.MKTNG_PGM_NAME                                               
,NULL (INTEGER)   AS  SYS_TARGET_ID                                   
,NULL (VARCHAR(25))  AS SYS_AUTH_ID                                               
,NULL (VARCHAR(25))  AS SYS_SOURCE                                 
,NULL (VARCHAR(70))  AS SYS_CREATED_BY                                        
,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE                                             
,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE                                   
,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY                                         
,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE                                                
,NULL (VARCHAR(25))  AS SYS_NC_TYPE                                               
,NULL (VARCHAR(10000))  AS SYS_ERR_CODE                                     
,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY                                           
,PRSNA_EMAIL_ADDR_1.EMAIL_ADDR_TXT AS EMAIL_ADDR_TXT_1                                     
,PRSNA_PHONE_1.PHONE_CNTRY_NBR AS PHONE_CNTRY_NBR_1                                         
,PRSNA_PHONE_1.PHONE_AREA_NBR  AS PHONE_AREA_NBR_1                                            
,PRSNA_PHONE_1.PHONE_EXCHG_NBR AS PHONE_EXCHG_NBR_1                                       
,PRSNA_PHONE_1.PHONE_LINE_NBR  AS PHONE_LINE_NBR_1                                                
,PRSNA_PHONE_1.PHONE_EXTSN_NUM AS PHONE_EXTSN_NUM_1                                     
,PRSNA_PHONE_1.FULL_PHONE_NUM  AS FULL_PHONE_NUM_1                                          
FROM MDM.REGIS_PRSNA REGIS_PRSNA_1                                      
LEFT OUTER JOIN MDM.REGIS_PRSNA_POSTL_ADDR PRSNA_POSTL_ADDR_1                                   
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_POSTL_ADDR_1.REGIS_PRSNA_ID                                       
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_POSTL_ADDR_1.MKTNG_PGM_NBR                                           
LEFT OUTER JOIN MDM.REGIS_PRSNA_PHONE PRSNA_PHONE_1                                            
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_PHONE_1.REGIS_PRSNA_ID                                    
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_PHONE_1.MKTNG_PGM_NBR                                        
LEFT OUTER JOIN MDM.REGIS_PRSNA_EMAIL_ADDR PRSNA_EMAIL_ADDR_1                                   
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_EMAIL_ADDR_1.REGIS_PRSNA_ID                                       
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_EMAIL_ADDR_1.MKTNG_PGM_NBR                                           
INNER JOIN MDM.MKTNG_PGM MKTNG_PGM_1                                          
ON REGIS_PRSNA_1.MKTNG_PGM_NBR = MKTNG_PGM_1.MKTNG_PGM_NBR
INNER JOIN MDM.MATCHD_CNSMR_PRSNA MATCHD_CNSMR_PRSNA_1
ON REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID=MATCHD_CNSMR_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
AND REGIS_PRSNA_1.LEGAL_ENT_NBR=MATCHD_CNSMR_PRSNA_1.LEGAL_ENT_NBR                               
QUALIFY RANK() OVER(PARTITION BY REGIS_PRSNA_1.REGIS_PRSNA_ID,REGIS_PRSNA_1.MKTNG_PGM_NBR                                                
ORDER BY REGIS_PRSNA_1.PRSNA_STATUS_CODE ASC,PRSNA_EMAIL_ADDR_1.PREF_CNTCT_POINT_IND DESC, PRSNA_PHONE_1.PREF_CNTCT_POINT_IND DESC,PRSNA_POSTL_ADDR_1.PREF_CNTCT_POINT_IND DESC,PRSNA_EMAIL_ADDR_1.EMAIL_ADDR_TXT DESC,PRSNA_PHONE_1.FULL_PHONE_NUM DESC,PRSNA_EMAIL_ADDR_1.SUBSCRPTN_OPT_NBR DESC,PRSNA_PHONE_1.SUBSCRPTN_OPT_NBR DESC,PRSNA_POSTL_ADDR_1.SUBSCRPTN_OPT_NBR DESC,PRSNA_EMAIL_ADDR_1.CNTCT_POINT_CATEG_CODE DESC,PRSNA_PHONE_1.CNTCT_POINT_CATEG_CODE DESC,PRSNA_POSTL_ADDR_1.CNTCT_POINT_CATEG_CODE DESC) = 1;
	
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;			
.LABEL L10		
REPLACE VIEW MDM.V_RPT_ADDR_QLTY			
	AS		
	LOCKING ROW FOR ACCESS		
	SELECT		
	A.MKTNG_PGM_NBR, 		
	A.LEGAL_ENT_NBR, 		
	ACTV_RGSTRTN_CNT, 		
	SUCCESS_PCT, 		
	LCLTY_FAIL_PCT, 		
	UNK_ADDR_PCT, 		
	MULTIPLE_ADDR_MATCH_PCT, 		
	CITY_TERR_FAIL_PCT, 		
	STREET_NAME_FAIL_PCT, 		
	HOUSE_NO_FAIL_PCT, 		
	STREET_COMPT_FAIL_PCT, 		
	MULTIPLE_STREET_ADDR_PCT, 		
	LEGAL_ENT_NAME,		
	MKTNG_PGM_NAME		
	FROM MDM.RPT_ADDR_QLTY A		
	JOIN MKTNG_PGM MP ON A.MKTNG_PGM_NBR=MP.MKTNG_PGM_NBR		
	JOIN LEGAL_ENT L ON A.LEGAL_ENT_NBR=L.LEGAL_ENT_NBR;		
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;			
.LABEL L11			
			
REPLACE VIEW MDM.V_RPT_DATA_NBR			
	AS		
	LOCKING ROW FOR ACCESS		
	SELECT 		
	A.LEGAL_ENT_NBR,		
	MTCHD_CNSMR_NBR,		
	HSHLD_NBR,		
	A.MKTNG_PGM_NBR,		
	STAGING_NBR,		
	ERROR_NBR,		
	ACTIVE_NBR,		
	DUPLICATE_NBR,		
	PHONE_OPT_IN, 		
	PHONE_OPT_OUT, 		
	EMAIL_OPT_IN, 		
	EMAIL_OPT_OUT, 		
	POSTAL_OPT_IN, 		
	POSTAL_OPT_OUT, 		
	SOCIAL_OPT_IN, 		
	SOCIAL_OPT_OUT,		
	LEGAL_ENT_NAME,		
	MKTNG_PGM_NAME		
	FROM MDM.RPT_DATA_NBR A		
	JOIN MKTNG_PGM MP ON A.MKTNG_PGM_NBR=MP.MKTNG_PGM_NBR		
	JOIN LEGAL_ENT L ON A.LEGAL_ENT_NBR=L.LEGAL_ENT_NBR;		
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;	
.LABEL L12 
	REPLACE VIEW MDM.V_RPT_LOAD_NBR  
AS   
LOCKING ROW FOR ACCESS   
SELECT    
A.LOAD_ID,   
B.SOURCE_ID,   
B.REQ_MAIL_ID,   
B.DATA_SOURCE,   
A.MKTNG_PGM_NBR,   
A.LEGAL_ENT_NBR,   
M.MKTNG_PGM_NAME,   
L.LEGAL_ENT_NAME,   
STAGING_NBR,   
C.STG_REJECT_CNT,   
C.STG_REJECT_DESC,   
ERROR_NBR,   
ACTIVE_NBR,   
DUPLICATE_NBR,   
WEBSITE_REGIS_NBR,
PHONE_OPT_IN,   
PHONE_OPT_OUT,   
EMAIL_OPT_IN,   
EMAIL_OPT_OUT,   
POSTAL_OPT_IN,   
POSTAL_OPT_OUT,   
SOCIAL_OPT_IN,   
SOCIAL_OPT_OUT,   
LOADSTATUS AS LOAD_SUCCESS,    
CAST(LOADSTARTTS AS DATE FORMAT 'mm/dd/yyyy') AS START_DATE,   
CAST(LOADENDTS AS DATE FORMAT 'mm/dd/yyyy') AS END_DATE   
FROM RPT_LOAD_NBR A   
LEFT OUTER JOIN (   
SELECT b.SOURCE_ID,   
b.DATA_SOURCE,   
b.REQ_MAIL_ID,   
a.LOAD_ID,   
LOADSTATUS,   
MIN(LOADSTARTTS) LOADSTARTTS,   
MAX(LOADENDTS) LOADENDTS   
FROM   
ETL_CTRL.LOAD_CONTROL a   
INNER JOIN ETL_CTRL.SOURCE_CONTROL b   
ON b.SOURCE_ID=a.SOURCE_ID   
AND LOADSTATUS='Success'   
GROUP BY 1,2,3,4,5   
) B   
ON A.LOAD_ID=B.LOAD_ID   
LEFT OUTER JOIN   
(SELECT LOAD_ID,   
 (CASE WHEN SOURCECNT = TARGETCNT   
   THEN 0
   ELSE  REJECTSCNT END)AS STG_REJECT_CNT,
FailedReason AS STG_REJECT_DESC   
FROM   
 ETL_CTRL.LOAD_CONTROL  
WHERE LOAD_TYPE='ETL'   
)C   
ON B.LOAD_ID=C.LOAD_ID   
LEFT OUTER JOIN MKTNG_PGM M   
ON M.MKTNG_PGM_NBR = A.MKTNG_PGM_NBR   
LEFT OUTER JOIN LEGAL_ENT L   
ON L.LEGAL_ENT_NBR = A.LEGAL_ENT_NBR   
;			
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L13
REPLACE VIEW MDM.V_RPT_PROFILE_CHANGES			
 AS			
 LOCKING ROW FOR ACCESS			
 SELECT 			
       LEGAL_ENT_NBR,			
      MKTNG_PGM_NBR,			
      USER_ID,			
      MONTH_START,			
      PROFILE_CHANGE_NBR			
 FROM			
 MDM.RPT_PROFILE_CHANGES;			
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L14
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
 
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L15
REPLACE VIEW MDM.V_SOCIAL			
	AS LOCKING ROW FOR ACCESS 		
	NONSEQUENCED TRANSACTIONTIME		
	SELECT		
	SOC.REGIS_PRSNA_ID		
	,SOC.SUBSCRPTN_OPT_IND		
	,SOC.CNSMR_CHCE_DATETM		
	,SOC.PREF_CNTCT_POINT_IND		
	,SOC.SOC_NET_STATUS_CODE 		
	,SOC.CNTCT_POINT_CATEG_CODE		
	,SOC.SUBSCRPTN_OPT_NBR		
	,SOC.MKTNG_PGM_NBR		
	,SOC.LEGAL_ENT_NBR		
	,SOC.SOCIAL_NETWK_ACCT_ID_VAL		
	,SO.SUBSCRPTN_OPT_NAME		
	,SO.SUBSCRPTN_OPT_STMT_TXT		
	,NULL (INTEGER)   AS  SYS_TARGET_ID		
	,NULL (VARCHAR(25))  AS SYS_AUTH_ID		
	,NULL (VARCHAR(25))  AS SYS_SOURCE		
	,NULL (VARCHAR(70))  AS SYS_CREATED_BY		
	,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE		
	,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE		
	,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY		
	,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE		
	,NULL (VARCHAR(25))  AS SYS_NC_TYPE		
	,NULL (VARCHAR(10000))  AS SYS_ERR_CODE		
	,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   		
	FROM MDM.REGIS_PRSNA_SOC_NET_ACCT SOC		
	LEFT JOIN		
	(SEL * FROM  MDM.SUBSCRPTN_OPT ) SO		
	ON		
	SOC.MKTNG_PGM_NBR=SO.MKTNG_PGM_NBR		
	AND 		
	SOC.LEGAL_ENT_NBR=SO.LEGAL_ENT_NBR		
	AND		
	SOC.SUBSCRPTN_OPT_NBR=SO.SUBSCRPTN_OPT_NBR;		
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L16 
	REPLACE VIEW MDM.V_SRC_EMAIL_DETAIL		
AS			
LOCKING ROW FOR ACCESS			
SELECT DISTINCT A.SOURCE_ID,			
A.REQ_MAIL_ID,			
A.AGN_CON_MAIL_ID,			
B.LOAD_ID			
FROM ETL_CTRL.SOURCE_CONTROL A			
INNER JOIN ETL_CTRL.LOAD_CONTROL B			
ON A.SOURCE_ID = B.SOURCE_ID			
AND B.LOAD_TYPE='ETL'			
AND B.LOAD_ID IN(SEL LOAD_ID FROM MDM.MDM_LOAD_CONTROL)			
INNER JOIN MDM.LOAD_INFO LI			
ON B.LOAD_ID = LI.LOAD_ID			
AND LI.PROCESS_NAME='Wrapper'			
AND LI.STATUS = 'Success';			
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L17 
REPLACE VIEW MDM.AGE_MIN_MAX			
AS			
LOCKING ROW FOR ACCESS			
SEL A.MINAGE MIN_AGE,B.MAXAGE MAX_AGE, A.COUNTRY FROM			
(SELECT			
CHI.AV_DESCRIPTION MINAGE, PAR.AV_SHORT_NAME COUNTRY, CHI.AV_CODE AGECODE			
FROM			
MDM.ATTRIBUTE_VALUES PAR, MDM.ATTRIBUTE_VALUES_HIERARCHY HI, MDM.ATTRIBUTE_VALUES CHI			
WHERE			
CHI.AV_CODE IN ('MIN') AND			
PAR.AV_ID = HI.AV_ID_PARENT AND			
HI.AV_ID_CHILD = CHI.AV_ID			
) A,			
(SELECT			
CHI.AV_DESCRIPTION MAXAGE, PAR.AV_SHORT_NAME COUNTRY, CHI.AV_CODE AGECODE			
FROM			
MDM.ATTRIBUTE_VALUES PAR, MDM.ATTRIBUTE_VALUES_HIERARCHY HI, MDM.ATTRIBUTE_VALUES CHI			
WHERE			
CHI.AV_CODE IN ('MAX') AND			
PAR.AV_ID = HI.AV_ID_PARENT AND			
HI.AV_ID_CHILD = CHI.AV_ID			
) B WHERE A.COUNTRY=B.COUNTRY;			
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L18 
REPLACE VIEW MDM.ERR_CODE_DETAILS			
AS			
LOCKING ROW FOR ACCESS			
SELECT LOAD_ID,			
MKTNG_PGM_NBR,			
SYS_ERR_CODE AS ERR_DESC,			
COUNT(DISTINCT REGIS_CNSMR_ID_VAL) ERROR_CODE_NBR			
FROM MDM.ERR_PRSNA_STG			
GROUP BY 1,2,3;			
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;	
.LABEL L19
REPLACE VIEW MDM.LOAD_INFO(                                                    			
                   LOAD_ID                                                                       			
                  ,PROCESS_NAME                                                                  			
                  ,PROCESS_START_TIME                                                            			
                  ,PROCESS_END_TIME                                                              			
                  ,ERROR_MSG_TXT                                                                 			
                  ,STATUS                                                                        			
                  ,BATCH_ID                                                                      			
                  ,NC_TYPE         			
                  ,CNTRY_NAME			
                  ,SYS_TARGET_ID                                                                 			
                  ,SYS_AUTH_ID                                                                   			
                  ,SYS_SOURCE                                                                    			
                  ,SYS_CREATED_BY                                                                			
                  ,SYS_CREATION_DATE                                                             			
                  ,SYS_ENT_STATE                                                                 			
                  ,SYS_LAST_MODIFIED_BY                                                          			
                  ,SYS_LAST_MODIFIED_DATE                                                        			
                  ,SYS_NC_TYPE                                                                   			
                  ,SYS_ERR_CODE                                                                  			
                  ,SYS_ERR_SVRTY                                                                 			
                 ) AS LOCKING ROW FOR ACCESS SELECT                                              			
                   LOAD_ID                                                                       			
                  ,PROCESS_NAME                                                                  			
                  ,PROCESS_START_TIME                                                            			
                  ,PROCESS_END_TIME                                                              			
                  ,ERROR_MSG_TXT                                                                 			
                  ,STATUS                                                                        			
                  ,BATCH_ID                                                                      			
                  ,NC_TYPE             			
                  ,CNTRY_NAME			
                  ,SYS_TARGET_ID                                                                 			
                  ,SYS_AUTH_ID                                                                   			
                  ,SYS_SOURCE                                                                    			
                  ,SYS_CREATED_BY                                                                			
                  ,SYS_CREATION_DATE                                                             			
                  ,SYS_ENT_STATE                                                                 			
                  ,SYS_LAST_MODIFIED_BY                                                          			
                  ,SYS_LAST_MODIFIED_DATE                                                        			
                  ,SYS_NC_TYPE                                                                   			
                  ,SYS_ERR_CODE                                                                  			
                  ,SYS_ERR_SVRTY                                                                 			
                 FROM MDM.LOAD_INFO2;			
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;			
			
.LABEL L20		
			
REPLACE VIEW MDM.TRILLIUM_OUTPUT_DUP (                                              			
  MKTNG_PGM_NBR                                                                 			
 ,REGIS_CNSMR_ID_VAL                                                            			
 ,DR_ALIAS_CONTACT                                                              			
 ,DR_FIRST_NAME                                                                 			
 ,DR_MIDDLE_NAME                                                                			
 ,DR_LAST_NAME                                                                  			
 ,DR_MRMRS                                                                      			
 ,DR_NAME_GENER                                                                 			
 ,DR_NAME_SUFFIX                                                                			
 ,DR_NAME_GENDER                                                                			
 ,DR_COUNTRY_NAME                                                               			
 ,DR_REGION_NAME                                                                			
 ,DR_CITY_NAME                                                                  			
 ,DR_POSTAL_CODE                                                                			
 ,DR_STREET_NAME                                                                			
 ,DR_HOUSE_NUMBER1                                                              			
 ,DR_HOUSE_NUMBER2                                                              			
 ,DR_POBOX_NUMBER                                                               			
 ,DR_ADDRESS                                                                    			
 ,DR_ADDRESS2                                                                   			
 ,DR_ADDRESS3                                                                   			
 ,CLEANSED_PHONE_1                                                              			
 ,CLEANSED_EMAIL_1                                                              			
 ,PR_REV_GROUP                                                                  			
 ,GOUT_MATCH_LEVEL                                                              			
 ,WINDOW_KEY_01                                                                 			
 ,REFERENCE_HOUSEHOLD_ID                                                        			
 ,REFERENCE_LEGALENTITYKEY                                                      			
 ,REFERENCE_REGISTRATIONKEY                                                     			
 ,LEGAL_ENT_NBR                                                                 			
 ,BRTH_DATE                                                                     			
 ,LANG_CODE                                                                     			
 ,CNSMR_USER_NAME                                                               			
 ,STATUS                                                                        			
 ,FULL_NAME                                                                     			
 ,DPEND_NAME                                                                    			
 ,PET_NAME                                                                      			
 ,PR_NAME_FORM_01                                                               			
 ,DR_ALIAS_ACCOUNT                                                              			
 ,REFERENCE_MATCHED_LEV1_PATTERN                                                			
 ,REFERENCE_MATCHED_LEV2_PATTERN                                                			
 ,DR_BUSINESS_NAME                                                              			
 ,EMAIL_IND       			
 ,REGIS_DATE			
 ,RECORD_IND			
 ,RECENT_IND			
  ,DUP_REGIS_PRSNA_ID			
 ,SYS_TARGET_ID                                                                 			
 ,SYS_AUTH_ID                                                                   			
 ,SYS_SOURCE                                                                    			
 ,SYS_CREATED_BY                                                                			
 ,SYS_CREATION_DATE                                                             			
 ,SYS_ENT_STATE                                                                 			
 ,SYS_LAST_MODIFIED_BY                                                          			
 ,SYS_LAST_MODIFIED_DATE                                                        			
 ,SYS_NC_TYPE                                                                   			
 ,SYS_ERR_CODE                                                                  			
 ,SYS_ERR_SVRTY                                                                 			
) AS LOCKING ROW FOR ACCESS SELECT                                              			
  MKTNG_PGM_NBR                                                                 			
 ,REGIS_CNSMR_ID_VAL                                                            			
 ,DR_ALIAS_CONTACT                                                              			
 ,DR_FIRST_NAME                                                                 			
 ,DR_MIDDLE_NAME                                                                			
 ,DR_LAST_NAME                                                                  			
 ,DR_MRMRS                                                                      			
 ,DR_NAME_GENER                                                                 			
 ,DR_NAME_SUFFIX                                                                			
 ,DR_NAME_GENDER                                                                			
 ,DR_COUNTRY_NAME                                                               			
 ,DR_REGION_NAME                                                                			
 ,DR_CITY_NAME                                                                  			
 ,DR_POSTAL_CODE                                                                			
 ,DR_STREET_NAME                                                                			
 ,DR_HOUSE_NUMBER1                                                              			
 ,DR_HOUSE_NUMBER2                                                              			
 ,DR_POBOX_NUMBER                                                               			
 ,DR_ADDRESS                                                                    			
 ,DR_ADDRESS2                                                                   			
 ,DR_ADDRESS3                                                                   			
 ,CLEANSED_PHONE_1                                                              			
 ,CLEANSED_EMAIL_1                                                              			
 ,PR_REV_GROUP                                                                  			
 ,GOUT_MATCH_LEVEL                                                              			
 ,WINDOW_KEY_01                                                                 			
 ,REFERENCE_HOUSEHOLD_ID                                                        			
 ,REFERENCE_LEGALENTITYKEY                                                      			
 ,REFERENCE_REGISTRATIONKEY                                                     			
 ,LEGAL_ENT_NBR                                                                 			
 ,BRTH_DATE                                                                     			
 ,LANG_CODE                                                                     			
 ,CNSMR_USER_NAME                                                               			
 ,STATUS                                                                        			
 ,FULL_NAME                                                                     			
 ,DPEND_NAME                                                                    			
 ,PET_NAME                                                                      			
 ,PR_NAME_FORM_01                                                               			
 ,DR_ALIAS_ACCOUNT                                                              			
 ,REFERENCE_MATCHED_LEV1_PATTERN                                                			
 ,REFERENCE_MATCHED_LEV2_PATTERN                                                			
 ,DR_BUSINESS_NAME                                                              			
 ,EMAIL_IND     			
 ,REGIS_DATE			
 ,RECORD_IND			
 ,RECENT_IND 			
 ,DUP_REGIS_PRSNA_ID			
 ,SYS_TARGET_ID                                                                 			
 ,SYS_AUTH_ID                                                                   			
 ,SYS_SOURCE                                                                    			
 ,SYS_CREATED_BY                                                                			
 ,SYS_CREATION_DATE                                                             			
 ,SYS_ENT_STATE                                                                 			
 ,SYS_LAST_MODIFIED_BY                                                          			
 ,SYS_LAST_MODIFIED_DATE                                                        			
 ,SYS_NC_TYPE                                                                   			
 ,SYS_ERR_CODE                                                                  			
 ,SYS_ERR_SVRTY                                                                 			
FROM MDM.TRILLIUM_OUTPUT_DUP1;			
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L21         

REPLACE VIEW MDM.V_MATCHD_CNSMR_PRSNA
AS
LOCKING ROW FOR ACCESS
SELECT 
REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
,MATCHD_CNSMR_PRSNA_1.HSHLD_PRSNA_ID 
,REGIS_PRSNA_1.REGIS_PRSNA_ID 
,REGIS_PRSNA_1.MKTNG_PGM_NBR  
,REGIS_PRSNA_1.REGIS_CNSMR_ID_VAL
,REGIS_PRSNA_1.GVN_NAME
,REGIS_PRSNA_1.MID_NAME
,REGIS_PRSNA_1.FAMLY_NAME
,REGIS_PRSNA_1.FAMLY_NAME ||','|| REGIS_PRSNA_1.GVN_NAME AS FULL_NAME
,REGIS_PRSNA_1.BRTH_DATE
,REGIS_PRSNA_1.CNTRY_CODE AS CNTRY_NAME
,REGIS_PRSNA_1.NATIONAL_ID_NBR
,REGIS_PRSNA_1.PRSNA_STATUS_CODE
,TRIM(REGIS_PRSNA_1.NAME_PREFX_TXT) AS NAME_PREFX_TXT
,TRIM(REGIS_PRSNA_1.NAME_SUFFX_TXT) AS NAME_SUFFX_TXT
,REGIS_PRSNA_1.CNSMR_USER_NAME
,REGIS_PRSNA_1.GENDR_IND
,REGIS_PRSNA_1.LEGAL_ENT_NBR
,REGIS_PRSNA_1.LANG_CODE AS LANG_CODE
,REGIS_PRSNA_1.LANG_CODE AS LANG_NAME
,REGIS_PRSNA_1.DATA_ORIGIN_SRCE_NBR 
,PRSNA_POSTL_ADDR_1.ADDR_LINE_1_TXT
,PRSNA_POSTL_ADDR_1.ADDR_LINE_2_TXT
,PRSNA_POSTL_ADDR_1.ADDR_LINE_3_TXT
,PRSNA_POSTL_ADDR_1.STRET_NUM
,PRSNA_POSTL_ADDR_1.STRET_NAME
,PRSNA_POSTL_ADDR_1.APT_NUM
,PRSNA_POSTL_ADDR_1.PO_BOX_NUM
,PRSNA_POSTL_ADDR_1.CITY_NAME
,PRSNA_POSTL_ADDR_1.TERR_CODE
,PRSNA_POSTL_ADDR_1.TERR_CODE AS TERR_NAME
,PRSNA_POSTL_ADDR_1.POSTL_AREA_CODE
,PRSNA_POSTL_ADDR_1.WIN_KEY
,COALESCE(PRSNA_POSTL_ADDR_1.ADDR_LINE_1_TXT,'') ||  ' ' ||
COALESCE(PRSNA_POSTL_ADDR_1.ADDR_LINE_2_TXT,'') ||   ' ' ||
COALESCE(PRSNA_POSTL_ADDR_1.CITY_NAME,'') ||  ' ' ||
COALESCE(PRSNA_POSTL_ADDR_1.POSTL_AREA_CODE,'') AS FULL_ADDRESS
,MKTNG_PGM_1.MKTNG_PGM_NAME
,NULL (INTEGER)   AS  SYS_TARGET_ID
,NULL (VARCHAR(25))  AS SYS_AUTH_ID
,NULL (VARCHAR(25))  AS SYS_SOURCE
,NULL (VARCHAR(70))  AS SYS_CREATED_BY
,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE
,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25))  AS SYS_NC_TYPE
,NULL (VARCHAR(10000))  AS SYS_ERR_CODE
,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
,NULL (VARCHAR(200))  AS EMAIL_ADDR_TXT_1 
,NULL (SMALLINT) AS PHONE_CNTRY_NBR_1
,NULL (SMALLINT) AS PHONE_AREA_NBR_1
,NULL (SMALLINT) AS PHONE_EXCHG_NBR_1
,NULL  (BIGINT) AS PHONE_LINE_NBR_1
,NULL (VARCHAR(20)) AS PHONE_EXTSN_NUM_1
,NULL  (VARCHAR(20))  AS FULL_PHONE_NUM_1
,PRSNA_POSTL_ADDR_1.SUBSCRPTN_OPT_NBR AS SUBSCRPTN_OPT_NBR
,PRSNA_POSTL_ADDR_1.SUBSCRPTN_OPT_IND AS SUBSCRPTN_OPT_IND
,PRSNA_POSTL_ADDR_1.CNSMR_CHCE_DATETM  AS CNSMR_CHCE_DATETM
,'A'  CNTCT_POINT_TYPE_CODE
,'ADDRESS'  CNTCT_POINT_TYPE
,PRSNA_POSTL_ADDR_1.CNTCT_POINT_CATEG_CODE  AS CNTCT_POINT_CATEG_CODE
,CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_NAME  AS CNTCT_POINT_CATEG_NAME
,SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NAME
FROM REGIS_PRSNA REGIS_PRSNA_1
JOIN REGIS_PRSNA_POSTL_ADDR PRSNA_POSTL_ADDR_1
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_POSTL_ADDR_1.REGIS_PRSNA_ID
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_POSTL_ADDR_1.MKTNG_PGM_NBR
JOIN MKTNG_PGM MKTNG_PGM_1
ON REGIS_PRSNA_1.MKTNG_PGM_NBR = MKTNG_PGM_1.MKTNG_PGM_NBR
JOIN SUBSCRPTN_OPT SUBSCRPTN_OPT_1
ON PRSNA_POSTL_ADDR_1.SUBSCRPTN_OPT_NBR=SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NBR
AND PRSNA_POSTL_ADDR_1.MKTNG_PGM_NBR = SUBSCRPTN_OPT_1.MKTNG_PGM_NBR
JOIN CNTCT_POINT_CATEG CNTCT_POINT_CATEG_1
ON PRSNA_POSTL_ADDR_1.CNTCT_POINT_CATEG_CODE=CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_CODE
JOIN MATCHD_CNSMR_PRSNA MATCHD_CNSMR_PRSNA_1
ON REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID=MATCHD_CNSMR_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
AND REGIS_PRSNA_1.LEGAL_ENT_NBR=MATCHD_CNSMR_PRSNA_1.LEGAL_ENT_NBR
UNION ALL
SELECT 
REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
,MATCHD_CNSMR_PRSNA_1.HSHLD_PRSNA_ID 
,REGIS_PRSNA_1.REGIS_PRSNA_ID 
,REGIS_PRSNA_1.MKTNG_PGM_NBR  
,REGIS_PRSNA_1.REGIS_CNSMR_ID_VAL
,REGIS_PRSNA_1.GVN_NAME
,REGIS_PRSNA_1.MID_NAME
,REGIS_PRSNA_1.FAMLY_NAME
,REGIS_PRSNA_1.FAMLY_NAME ||','|| REGIS_PRSNA_1.GVN_NAME AS FULL_NAME
,REGIS_PRSNA_1.BRTH_DATE
,REGIS_PRSNA_1.CNTRY_CODE AS CNTRY_NAME
,REGIS_PRSNA_1.NATIONAL_ID_NBR
,REGIS_PRSNA_1.PRSNA_STATUS_CODE
,TRIM(REGIS_PRSNA_1.NAME_PREFX_TXT) AS NAME_PREFX_TXT
,TRIM(REGIS_PRSNA_1.NAME_SUFFX_TXT) AS NAME_SUFFX_TXT
,REGIS_PRSNA_1.CNSMR_USER_NAME
,REGIS_PRSNA_1.GENDR_IND
,REGIS_PRSNA_1.LEGAL_ENT_NBR
,REGIS_PRSNA_1.LANG_CODE AS LANG_CODE
,REGIS_PRSNA_1.LANG_CODE AS LANG_NAME
,REGIS_PRSNA_1.DATA_ORIGIN_SRCE_NBR 
, NULL (VARCHAR(500) ) AS ADDR_LINE_1_TXT
,NULL  (VARCHAR(500) )AS ADDR_LINE_2_TXT
,NULL  (VARCHAR(500) )AS ADDR_LINE_3_TXT
,NULL (VARCHAR(20))AS STRET_NUM
,NULL ( VARCHAR(100) )AS STRET_NAME
,NULL (VARCHAR(20) )AS APT_NUM
,NULL (VARCHAR(20) )AS PO_BOX_NUM
,NULL ( VARCHAR(100) )AS CITY_NAME
,NULL ( CHAR(8) )AS TERR_CODE
,NULL ( VARCHAR(100))AS  TERR_NAME
,NULL (VARCHAR(20)) AS POSTL_AREA_CODE
,NULL ( VARCHAR(100) )AS WIN_KEY
,NULL  (VARCHAR(10000))  AS FULL_ADDRESS
,MKTNG_PGM_1.MKTNG_PGM_NAME
,NULL (INTEGER)   AS  SYS_TARGET_ID
,NULL (VARCHAR(25))  AS SYS_AUTH_ID
,NULL (VARCHAR(25))  AS SYS_SOURCE
,NULL (VARCHAR(70))  AS SYS_CREATED_BY
,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE
,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25))  AS SYS_NC_TYPE
,NULL (VARCHAR(10000))  AS SYS_ERR_CODE
,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
,NULL (VARCHAR(200))  AS EMAIL_ADDR_TXT_1 
,PRSNA_PHONE_1.PHONE_CNTRY_NBR AS PHONE_CNTRY_NBR_1
,PRSNA_PHONE_1.PHONE_AREA_NBR  AS PHONE_AREA_NBR_1
,PRSNA_PHONE_1.PHONE_EXCHG_NBR AS PHONE_EXCHG_NBR_1
,PRSNA_PHONE_1.PHONE_LINE_NBR  AS PHONE_LINE_NBR_1
,PRSNA_PHONE_1.PHONE_EXTSN_NUM AS PHONE_EXTSN_NUM_1
,PRSNA_PHONE_1.FULL_PHONE_NUM  AS FULL_PHONE_NUM_1
,PRSNA_PHONE_1.SUBSCRPTN_OPT_NBR AS SUBSCRPTN_OPT_NBR
,PRSNA_PHONE_1.SUBSCRPTN_OPT_IND AS SUBSCRPTN_OPT_IND
,PRSNA_PHONE_1.CNSMR_CHCE_DATETM  AS CNSMR_CHCE_DATETM
,'P'  CNTCT_POINT_TYPE_CODE
,'PHONE'  CNTCT_POINT_TYPE
,PRSNA_PHONE_1.CNTCT_POINT_CATEG_CODE  AS CNTCT_POINT_CATEG_CODE
,CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_NAME  AS CNTCT_POINT_CATEG_NAME
,SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NAME
FROM REGIS_PRSNA REGIS_PRSNA_1
JOIN REGIS_PRSNA_PHONE PRSNA_PHONE_1
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_PHONE_1.REGIS_PRSNA_ID
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_PHONE_1.MKTNG_PGM_NBR
JOIN MKTNG_PGM MKTNG_PGM_1
ON REGIS_PRSNA_1.MKTNG_PGM_NBR = MKTNG_PGM_1.MKTNG_PGM_NBR
JOIN SUBSCRPTN_OPT SUBSCRPTN_OPT_1
ON PRSNA_PHONE_1.SUBSCRPTN_OPT_NBR=SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NBR
AND PRSNA_PHONE_1.MKTNG_PGM_NBR = SUBSCRPTN_OPT_1.MKTNG_PGM_NBR
JOIN CNTCT_POINT_CATEG CNTCT_POINT_CATEG_1
ON PRSNA_PHONE_1.CNTCT_POINT_CATEG_CODE=CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_CODE
JOIN MATCHD_CNSMR_PRSNA MATCHD_CNSMR_PRSNA_1
ON REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID=MATCHD_CNSMR_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
AND REGIS_PRSNA_1.LEGAL_ENT_NBR=MATCHD_CNSMR_PRSNA_1.LEGAL_ENT_NBR
UNION ALL
SELECT 
REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
,MATCHD_CNSMR_PRSNA_1.HSHLD_PRSNA_ID 
,REGIS_PRSNA_1.REGIS_PRSNA_ID 
,REGIS_PRSNA_1.MKTNG_PGM_NBR  
,REGIS_PRSNA_1.REGIS_CNSMR_ID_VAL
,REGIS_PRSNA_1.GVN_NAME
,REGIS_PRSNA_1.MID_NAME
,REGIS_PRSNA_1.FAMLY_NAME
,REGIS_PRSNA_1.FAMLY_NAME ||','|| REGIS_PRSNA_1.GVN_NAME AS FULL_NAME
,REGIS_PRSNA_1.BRTH_DATE
,REGIS_PRSNA_1.CNTRY_CODE AS CNTRY_NAME
,REGIS_PRSNA_1.NATIONAL_ID_NBR
,REGIS_PRSNA_1.PRSNA_STATUS_CODE
,TRIM(REGIS_PRSNA_1.NAME_PREFX_TXT) AS NAME_PREFX_TXT
,TRIM(REGIS_PRSNA_1.NAME_SUFFX_TXT) AS NAME_SUFFX_TXT
,REGIS_PRSNA_1.CNSMR_USER_NAME
,REGIS_PRSNA_1.GENDR_IND
,REGIS_PRSNA_1.LEGAL_ENT_NBR
,REGIS_PRSNA_1.LANG_CODE AS LANG_CODE
,REGIS_PRSNA_1.LANG_CODE AS LANG_NAME
,REGIS_PRSNA_1.DATA_ORIGIN_SRCE_NBR 
, NULL (VARCHAR(500) ) AS ADDR_LINE_1_TXT
,NULL  (VARCHAR(500) )AS ADDR_LINE_2_TXT
,NULL  (VARCHAR(500) )AS ADDR_LINE_3_TXT
,NULL (VARCHAR(20))AS STRET_NUM
,NULL ( VARCHAR(100) )AS STRET_NAME
,NULL (VARCHAR(20) )AS APT_NUM
,NULL (VARCHAR(20) )AS PO_BOX_NUM
,NULL ( VARCHAR(100) )AS CITY_NAME
,NULL ( CHAR(8) )AS TERR_CODE
,NULL ( VARCHAR(100))AS  TERR_NAME
,NULL (VARCHAR(20)) AS POSTL_AREA_CODE
,NULL ( VARCHAR(100) )AS WIN_KEY
,NULL  (VARCHAR(10000))  AS FULL_ADDRESS
,MKTNG_PGM_1.MKTNG_PGM_NAME
,NULL (INTEGER)   AS  SYS_TARGET_ID
,NULL (VARCHAR(25))  AS SYS_AUTH_ID
,NULL (VARCHAR(25))  AS SYS_SOURCE
,NULL (VARCHAR(70))  AS SYS_CREATED_BY
,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE
,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25))  AS SYS_NC_TYPE
,NULL (VARCHAR(10000))  AS SYS_ERR_CODE
,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
,PRSNA_EMAIL_ADDR_1.EMAIL_ADDR_TXT AS EMAIL_ADDR_TXT_1 
,NULL (SMALLINT) AS PHONE_CNTRY_NBR_1
,NULL (SMALLINT) AS PHONE_AREA_NBR_1
,NULL (SMALLINT) AS PHONE_EXCHG_NBR_1
,NULL  (BIGINT) AS PHONE_LINE_NBR_1
,NULL (VARCHAR(20)) AS PHONE_EXTSN_NUM_1
,NULL  (VARCHAR(20))  AS FULL_PHONE_NUM_1
,PRSNA_EMAIL_ADDR_1.SUBSCRPTN_OPT_NBR AS SUBSCRPTN_OPT_NBR
,PRSNA_EMAIL_ADDR_1.SUBSCRPTN_OPT_IND AS SUBSCRPTN_OPT_IND
,PRSNA_EMAIL_ADDR_1.CNSMR_CHCE_DATETM  AS CNSMR_CHCE_DATETM
,'E'  CNTCT_POINT_TYPE_CODE
,'EMAIL'  CNTCT_POINT_TYPE
,PRSNA_EMAIL_ADDR_1.CNTCT_POINT_CATEG_CODE  AS CNTCT_POINT_CATEG_CODE
,CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_NAME  AS CNTCT_POINT_CATEG_NAME
,SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NAME
FROM REGIS_PRSNA REGIS_PRSNA_1
JOIN REGIS_PRSNA_EMAIL_ADDR PRSNA_EMAIL_ADDR_1
ON REGIS_PRSNA_1.REGIS_PRSNA_ID = PRSNA_EMAIL_ADDR_1.REGIS_PRSNA_ID
AND REGIS_PRSNA_1.MKTNG_PGM_NBR = PRSNA_EMAIL_ADDR_1.MKTNG_PGM_NBR
JOIN MKTNG_PGM MKTNG_PGM_1
ON REGIS_PRSNA_1.MKTNG_PGM_NBR = MKTNG_PGM_1.MKTNG_PGM_NBR
JOIN SUBSCRPTN_OPT SUBSCRPTN_OPT_1
ON PRSNA_EMAIL_ADDR_1.SUBSCRPTN_OPT_NBR=SUBSCRPTN_OPT_1.SUBSCRPTN_OPT_NBR
AND PRSNA_EMAIL_ADDR_1.MKTNG_PGM_NBR = SUBSCRPTN_OPT_1.MKTNG_PGM_NBR
JOIN CNTCT_POINT_CATEG CNTCT_POINT_CATEG_1
ON PRSNA_EMAIL_ADDR_1.CNTCT_POINT_CATEG_CODE=CNTCT_POINT_CATEG_1.CNTCT_POINT_CATEG_CODE
JOIN MATCHD_CNSMR_PRSNA MATCHD_CNSMR_PRSNA_1
ON REGIS_PRSNA_1.MATCHD_CNSMR_PRSNA_ID=MATCHD_CNSMR_PRSNA_1.MATCHD_CNSMR_PRSNA_ID
AND REGIS_PRSNA_1.LEGAL_ENT_NBR=MATCHD_CNSMR_PRSNA_1.LEGAL_ENT_NBR;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABLE L22
REPLACE VIEW MDM.V_UNMATCHED_NOT_FND_OPT
	(
	PE_OPTOUT_ID,
	GVN_NAME_OPT,
	MID_NAME_OPT,
	FAMLY_NAME_OPT,
	FULL_PHONE_NUM_OPT,
	EMAIL_ADDR_TXT_OPT,
	ADDRESS_OPT,
	LEGAL_ENT_NBR,
	MATCH_FLG,
	NATIONAL_ID_NBR
	)
	AS
	LOCKING ROW FOR ACCESS	
	SELECT 
		PE_OPTOUT_ID,
		GVN_NAME AS GVN_NAME_OPT,
		MID_NAME AS MID_NAME_OPT,
		FAMLY_NAME AS FAMLY_NAME_OPT,
		FULL_PHONE_NUM AS FULL_PHONE_NUM_OPT,
		EMAIL_ADDR_TXT AS EMAIL_ADDR_TXT_OPT,
		coalesce(ADDR_LINE_1_TXT,'')||' '||coalesce(ADDR_LINE_2_TXT,'')||' '||coalesce(ADDR_LINE_3_TXT,'')||' '||coalesce(CITY_NAME,'')||' '||coalesce(TERR_NAME,'')||' '||coalesce(CNTRY_NAME,'')||' '||coalesce(POSTL_AREA_CODE,'') AS ADDRESS_OPT ,
		LEGAL_ENT_NBR,
		MATCH_FLG,
		NATIONAL_ID_NBR
	FROM MDM.OPT_OUT_NOT_FOUND WHERE MATCH_FLG = 'N' ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABLE L23
REPLACE VIEW MDM.V_MATCHED_NOT_FND_OPT
	(
	PE_OPTOUT_ID,
	GVN_NAME_OPT,
	MID_NAME_OPT,
	FAMLY_NAME_OPT,
	FULL_PHONE_NUM_OPT,
	EMAIL_ADDR_TXT_OPT,
	ADDRESS_OPT,
	LEGAL_ENT_NBR,
	MATCH_FLG,
	NATIONAL_ID_NBR,
	REGIS_PRSNA_ID,
	GVN_NAME_REG,
	FAMLY_NAME_REG
	)
	AS	
	LOCKING ROW FOR ACCESS	
	SELECT 
		OONF.PE_OPTOUT_ID,
		OONF.GVN_NAME AS GVN_NAME_OPT,
		OONF.MID_NAME AS MID_NAME_OPT,
		OONF.FAMLY_NAME AS FAMLY_NAME_OPT,
		OONF.FULL_PHONE_NUM AS FULL_PHONE_NUM_OPT,
		OONF.EMAIL_ADDR_TXT AS EMAIL_ADDR_TXT_OPT,
		coalesce(OONF.ADDR_LINE_1_TXT,'')||' '||coalesce(OONF.ADDR_LINE_2_TXT,'')||' '||coalesce(OONF.ADDR_LINE_3_TXT,'')||' '||coalesce(OONF.CITY_NAME,'')||' '||coalesce(OONF.TERR_NAME,'')||' '||coalesce(OONF.CNTRY_NAME,'')||' '||coalesce(OONF.POSTL_AREA_CODE,'') AS ADDRESS_OPT,
		OONF.LEGAL_ENT_NBR ,
		OONF.MATCH_FLG ,
		OONF.NATIONAL_ID_NBR,
		RP.REGIS_PRSNA_ID,
		RP.GVN_NAME,
		RP.FAMLY_NAME
	FROM MDM.OPT_OUT_NOT_FOUND OONF 
	JOIN MDM.OPT_OUT_NOT_FOUND_XREF XREF ON OONF.PE_OPTOUT_ID=XREF.PE_OPTOUT_ID 
	JOIN MDM.REGIS_PRSNA RP ON RP.MKTNG_PGM_NBR IN (SELECT MKTNG_PGM_NBR FROM MDM.MKTNG_PGM WHERE LEGAL_ENT_NBR=OONF.LEGAL_ENT_NBR ) AND RP.REGIS_PRSNA_ID=XREF.REGIS_PRSNA_ID;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L24
REPLACE VIEW MDM.CAMPAIGN AS LOCKING ROW FOR ACCESS SELECT * FROM ICRM_TBL.CAMPAIGN;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L25
 REPLACE VIEW MDM.V_PE_OPT_OUT (
	REGIS_PRSNA_ID,
    OPT_TYPE_CODE,
    MKTNG_PGM_NBR,
    LEGAL_ENT_NBR,
    DATA_SRCE_NBR,
    SUBSCRPTN_OPT_NBR,
    GVN_NAME ,
    MID_NAME,
    FAMLY_NAME, 
    EMAIL_ADDR_TEXT ,
    FULL_PHONE_NUM ,
    SRC_ADDR_LINE_1_TXT ,
    SRC_ADDR_LINE_2_TXT ,
    SRC_ADDR_LINE_3_TXT ,
    SRC_CITY_NAME ,
    SRC_TERR_NAME ,
    SRC_POSTAL_AREA_CODE ,
    SRC_CNTRY_NAME ,
    ADDR_LINE_1_TXT ,
    ADDR_LINE_2_TXT ,
    ADDR_LINE_3_TXT ,
    CITY_NAME ,
    TERR_NAME ,
    POSTL_AREA_CODE ,
    CNTRY_NAME ,
    OPT_IND ,
    OPT_TIME ,
    OPT_REASN_TXT ,
    LAST_ACTIVITY_TM ,
    NATIONAL_ID_NBR ,
    CHANNEL_IND ,
    OPT_LEVEL_IND, 
    PE_OPTOUT_ID ,
    POSTL_ADDR_ID ,
    LOG_SOURCE_ID ,
    LOG_UPDATE_USER, 
    LOG_LOAD_ID ,
    STATUS_FLG,
	SYS_TARGET_ID,
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
) AS LOCKING ROW FOR ACCESS SELECT
	REGIS_PRSNA_ID,
    OPT_TYPE_CODE,
    MKTNG_PGM_NBR,
    LEGAL_ENT_NBR,
    DATA_SRCE_NBR,
    SUBSCRIPTION_NBR,
    FIRST_NAME ,
    MID_NAME,
    LAST_NAME ,
    EMAIL_ADDR_TEXT ,
    CONTACT_PHONE_NBR, 
    SRC_ADDR_LINE_1_TXT ,
    SRC_ADDR_LINE_2_TXT ,
    SRC_ADDR_LINE_3_TXT ,
    SRC_CITY_NAME ,
    SRC_STATE ,
    SRC_ZIP ,
    SRC_CNTRY_NAME ,
    ADDR_LINE_1_TXT ,
    ADDR_LINE_2_TXT ,
    ADDR_LINE_3_TXT ,
    CITY_NAME ,
    TERR_NAME ,
    POSTL_AREA_CODE ,
    CNTRY_NAME ,
    OPT_IND ,
    OPT_TIME ,
    OPT_REASN_TXT ,
    LAST_ACTIVITY_TM ,
    NATIONAL_ID_NBR ,
    CHANNEL_IND ,
    OPT_LEVEL_IND, 
    PE_OPTOUT_ID ,
    POSTL_ADDR_ID ,
    LOG_SOURCE_ID ,
    LOG_UPDATE_USER, 
    LOG_LOAD_ID ,
    STATUS_FLG,
	SYS_TARGET_ID,
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
FROM MDM.PE_OPT_OUT; 
 
 
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L26
 REPLACE VIEW MDM.WS_CAMPAIGN_SGMNT_CNSMR
(	
 MKTNG_PGM_NBR,
  REGIS_PRSNA_ID,
 REGIS_CNSMR_ID_VAL,
 DATA_SRCE_NBR ,
 CAMPAIGN_LEAD_KEY,
 SYS_TARGET_ID,
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
AS
LOCKING ROW FOR ACCESS 
SELECT
B.MKTNG_PGM_NBR, 
B.REGIS_PRSNA_ID,
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.CAMPAIGN_LEAD_KEY,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY
FROM MDM.CAMPAIGN_CNSMR A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID;


 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L27
 
 REPLACE	VIEW MDM.WS_OPT_STATUS
(
 MKTNG_PGM_NBR,
 REGIS_PRSNA_ID,
 REGIS_CNSMR_ID_VAL,
 DATA_SRCE_NBR,
 SUBSCRPTN_OPT_NBR, 
 SUBSCRPTN_OPT_IND, 
 CNTCT_POINT_CATEG_CODE,
 CNSMR_CHCE_DATETM,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS LOCKING ROW FOR ACCESS  
SELECT 
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID,
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.SUBSCRPTN_OPT_NBR, 
A.SUBSCRPTN_OPT_IND, 
A.CNTCT_POINT_CATEG_CODE,
A.CNSMR_CHCE_DATETM,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.REGIS_PRSNA_EMAIL_ADDR A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
WHERE A.SUBSCRPTN_OPT_NBR IS NOT NULL
UNION ALL
SEL
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID, 
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.SUBSCRPTN_OPT_NBR, 
A.SUBSCRPTN_OPT_IND, 
A.CNTCT_POINT_CATEG_CODE,
A.CNSMR_CHCE_DATETM,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY  
FROM MDM.REGIS_PRSNA_POSTL_ADDR A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
WHERE A.SUBSCRPTN_OPT_NBR IS NOT NULL
UNION ALL
SEL
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID, 
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.SUBSCRPTN_OPT_NBR, 
A.SUBSCRPTN_OPT_IND, 
A.CNTCT_POINT_CATEG_CODE,
A.CNSMR_CHCE_DATETM ,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY 
FROM MDM.REGIS_PRSNA_PHONE A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
WHERE A.SUBSCRPTN_OPT_NBR IS NOT NULL
UNION ALL
SEL
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID, 
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.SUBSCRPTN_OPT_NBR, 
A.SUBSCRPTN_OPT_IND, 
A.CNTCT_POINT_CATEG_CODE,
A.CNSMR_CHCE_DATETM,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY  
FROM MDM.REGIS_PRSNA_SOC_NET_ACCT A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
WHERE A.SUBSCRPTN_OPT_NBR IS NOT NULL
;
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  
   
 .LABEL L28
 
REPLACE	VIEW  MDM.WS_MATCHD_CNSMR_PRSNA_TRT 
(MKTNG_PGM_NBR, 
REGIS_PRSNA_ID,
 REGIS_CNSMR_ID_VAL,
 DATA_SRCE_NBR,
 MATCHD_CNSMR_PRSNA_ID, 
 TRT_NAME,
 MATCHD_PRSNA_TRT_TXT,
 MATCHD_PRSNA_TRT_DATE,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS   
SELECT 
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID, 
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.MATCHD_CNSMR_PRSNA_ID, 
C.TRT_NAME,
A.MATCHD_PRSNA_TRT_TXT,
A.MATCHD_PRSNA_TRT_DATE,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.MATCHD_CNSMR_PRSNA_TRT A
INNER JOIN MDM.REGIS_PRSNA B
ON A.LEGAL_ENT_NBR=B.LEGAL_ENT_NBR
AND A.MATCHD_CNSMR_PRSNA_ID=B.MATCHD_CNSMR_PRSNA_ID
INNER JOIN MDM.TRT C
ON A.TRT_NBR=C.TRT_NBR;

   .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
   
   .LABEL L35
  REPLACE VIEW MDM.PROD_FAMLY (
PROD_FAMLY_ID 
,PROD_FAMLY_NAME 
,LOG_SOURCE_ID
,LOG_UPDATE_USER
,LOG_LOAD_ID
) AS LOCKING ROW FOR ACCESS SELECT
PROD_FAMLY_ID 
,PROD_FAMLY_NAME 
,LOG_SOURCE_ID
,LOG_UPDATE_USER
,LOG_LOAD_ID
FROM iCRM_TBL.PROD_FAMLY;
  
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
   
   
   
 .LABEL L29
 
REPLACE VIEW  MDM.WS_PROD_ITEM_HIER_ASSOC
(
 SECTOR_CODE           ,   
 SECTOR_NAME,
 SUB_SECTOR_CODE               ,
 SUB_SECTOR_NAME,
 CATEG_CODE                    ,
 CATEG_NAME,
 SEG_CODE                      ,
 SEG_NAME,
 SUB_BRAND_CODE                ,
 SUB_BRAND_NAME,
 BRAND_CODE                    ,
 BRAND_NAME,
 ITEM_VERS_CODE                ,
 GLOBAL_FORM_CODE              ,
 PROD_ITEM_UPC                 ,
 PROD_ITEM_NAME ,
 PROD_FAMLY_ID,
 PROD_FAMLY_NAME ,
 BRAND_FAMLY_ID,
 BRAND_FAMLY_NAME,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS LOCKING ROW FOR ACCESS
SELECT
A.SECTOR_CODE           ,   
G.SECTOR_NAME,
A.SUB_SECTOR_CODE               ,
D.SUB_SECTOR_NAME,
A.CATEG_CODE                    ,
B.CATEG_NAME,
A.SEG_CODE                      ,
C.SEG_NAME,
A.SUB_BRAND_CODE                ,
F.SUB_BRAND_NAME,
A.BRAND_CODE                    ,
E.BRAND_NAME,
A.ITEM_VERS_CODE                ,
A.GLOBAL_FORM_CODE              ,
A.PROD_ITEM_UPC                 ,
H.PROD_ITEM_NAME,
I.PROD_FAMLY_ID,
I.PROD_FAMLY_NAME ,
J.BRAND_FAMLY_ID,
J.BRAND_FAMLY_NAME,
NULL (INTEGER)   AS  SYS_TARGET_ID,
NULL (VARCHAR(1000))  AS SYS_AUTH_ID,
NULL (VARCHAR(256))  AS SYS_SOURCE,
NULL (VARCHAR(70))  AS SYS_CREATED_BY,
NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE,
NULL  (VARCHAR(25))  AS  SYS_ENT_STATE,
NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25))  AS SYS_NC_TYPE,
NULL (VARCHAR(10000))  AS SYS_ERR_CODE,
NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
FROM 
MDM.PROD_ITEM_HIER_ASSOC A
LEFT JOIN MDM.CATEG B
ON A.CATEG_CODE=B.CATEG_CODE
LEFT JOIN MDM.SEG C
ON A.SEG_CODE=C.SEG_CODE
LEFT JOIN MDM.SUB_SECTOR D
ON A.SUB_SECTOR_CODE=D.SUB_SECTOR_CODE
LEFT JOIN MDM.BRAND E
ON A.BRAND_CODE=E.BRAND_CODE
LEFT JOIN MDM.SUB_BRAND F
ON A.SUB_BRAND_CODE=F.SUB_BRAND_CODE
LEFT JOIN MDM.SECTOR G
ON A.SECTOR_CODE=G.SECTOR_CODE
LEFT JOIN MDM.PROD_ITEM H
ON A.PROD_ITEM_UPC=H.PROD_ITEM_UPC 
LEFT JOIN MDM.PROD_FAMLY I
ON A.PROD_FAMLY_ID=I.PROD_FAMLY_ID 
LEFT JOIN MDM.BRAND_FAMLY J
ON A.BRAND_FAMLY_ID=J.BRAND_FAMLY_ID 
;


.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
   
   .LABEL L30
   REPLACE	VIEW  MDM.WS_CNTNT_ELEM 
(MKTNG_PGM_NBR, 
 CNTNT_ELEM_ID,
 CNTNT_NAME,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS   
SELECT 
B.MKTNG_PGM_NBR, 
B.CNTNT_ELEM_ID,
B.CNTNT_NAME,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.CNTNT_ELEM B;

     .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
	 
	 .LABEL L31
	 REPLACE	VIEW  MDM.WS_INCTV 
(MKTNG_PGM_NBR, 
 INCTV_NBR,
 INCTV_NAME,
 INCTV_START_DATE,
 INCTV_END_DATE,
 BRAND_CODE,
 /* START :new columns added by POOJAK for R6 JOLT */
	   INCTV_DESC,
	  INCTV_VAL_AMT,
	  INCTV_VAL_PCT,
	  INCTV_EXPRN_DATETM,
	  INCTV_EXPRN_DAY_CNT,
	  INCTV_CRTN_DATE,
	  INCTV_STATUS_CODE,
	  INCTV_TYPE_CODE,	
	ALT_SYS_INCTV_ID,	  
	COUPN_TYPE_CODE, 
	BUNDLE_PACK_IND ,
	PREMARKET_OFFER_IND,
	EXT_INCTV_CD,
	COUPN_EXT_CD,
	INCTV_UOM_CD,
	TGT_DST_QTY, 
	CLRNG_HS_CD,
	EXTRN_COUPN_DATA_SRCE_NBR,	
	COUPN_UNIQUE_IND,
	BRAND_NAME,
/*END :new columns added by POOJAK for R6 JOLT */
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS   
SELECT 
B.MKTNG_PGM_NBR, 
B.INCTV_NBR,
B.INCTV_NAME,
B.INCTV_START_DATE,
B.INCTV_END_DATE,
C.BRAND_CODE,
/*START :new columns added by POOJAK for R6 JOLT */
	   INCTV_DESC,
	  INCTV_VAL_AMT,
	  INCTV_VAL_PCT,
	  INCTV_EXPRN_DATETM,
	  INCTV_EXPRN_DAY_CNT,
	  INCTV_CRTN_DATE,
	  INCTV_STATUS_CODE,
	  INCTV_TYPE_CODE,	
	ALT_SYS_INCTV_ID,	  
	COUPN_TYPE_CODE, 
	BUNDLE_PACK_IND ,
	PREMARKET_OFFER_IND,
	EXT_INCTV_CD,
	COUPN_EXT_CD,
	INCTV_UOM_CD,
	TGT_DST_QTY, 
	CLRNG_HS_CD,
	EXTRN_COUPN_DATA_SRCE_NBR,	
	COUPN_UNIQUE_IND,
	C.BRAND_NAME,
/*END :new columns added by POOJAK for R6 JOLT */
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.INCTV B
LEFT JOIN MDM.BRAND C
ON B.BRAND_NAME=C.BRAND_NAME;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
	   
.LABEL L32

REPLACE VIEW MDM.WS_MATCHD_CNSMR_OPT_STATUS
( 
 LEGAL_ENT_NBR,
MKTNG_PGM_NBR,
EMAIL_ADDR_TXT,  
 CNTCT_POINT_CATEG_CODE,
SUBSCRPTN_OPT_NBR ,
SUBSCRPTN_OPT_IND,
CNSMR_CHCE_DATETM,
UNIVERSAL_OPT_OUT_IND,
UNIVERSAL_OPT_OUT_DATE,
SYS_TARGET_ID,
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
AS
LOCKING ROW FOR ACCESS 
SELECT
A.LEGAL_ENT_NBR,
A.MKTNG_PGM_NBR,
A.EMAIL_ADDR_TXT,  
 A.CNTCT_POINT_CATEG_CODE,
A.SUBSCRPTN_OPT_NBR ,
A.SUBSCRPTN_OPT_IND,
A.CNSMR_CHCE_DATETM,
CASE WHEN B.EMAIL_ADDR_TEXT IS NOT NULL
THEN 'Y' ELSE 'N' END AS UNIVERSAL_OPT_OUT_IND,
OPT_TIME AS UNIVERSAL_OPT_OUT_DATE,
NULL (INTEGER)   AS  SYS_TARGET_ID,
NULL (VARCHAR(1000))  AS SYS_AUTH_ID,
NULL (VARCHAR(256))  AS SYS_SOURCE,
NULL (VARCHAR(70))  AS SYS_CREATED_BY,
NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE,
NULL  (VARCHAR(25))  AS  SYS_ENT_STATE,
NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25))  AS SYS_NC_TYPE,
NULL (VARCHAR(10000))  AS SYS_ERR_CODE,
NULL (VARCHAR(30))  AS SYS_ERR_SVRTY
FROM MDM.REGIS_PRSNA_EMAIL_ADDR A
LEFT JOIN (SEL 
LEGAL_ENT_NBR,EMAIL_ADDR_TEXT,MAX(OPT_TIME) OPT_TIME
FROM MDM.OPT_OUT_DIRECTIVE    
WHERE MKTNG_PGM_NBR=9999
AND SUBSCRIPTION_NBR=9999
AND CHANNEL_IND='ALL'
AND OPT_IND='O'
AND COALESCE(TRIM(EMAIL_ADDR_TEXT),'')<>''
GROUP BY 1,2) B
ON A.LEGAL_ENT_NBR=B.LEGAL_ENT_NBR
AND A.EMAIL_ADDR_TXT=B.EMAIL_ADDR_TEXT
WHERE COALESCE(TRIM(A.EMAIL_ADDR_TXT),'')<>''
QUALIFY RANK() OVER (PARTITION BY  A.MKTNG_PGM_NBR,
A.EMAIL_ADDR_TXT,  
 A.CNTCT_POINT_CATEG_CODE,
A.SUBSCRPTN_OPT_NBR 
ORDER BY A.CNSMR_CHCE_DATETM DESC,A.SYS_LAST_MODIFIED_DATE DESC)=1;   

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

     .LABEL L33

 REPLACE VIEW  MDM.WS_MKTNG_PGM_CNTRY 
(MKTNG_PGM_NBR, 
 MKTNG_PGM_NAME,
 LEGAL_ENT_NBR,
 LEGAL_ENT_NAME,
 CNTRY_CODE,
 CNTRY_NAME,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS   
SELECT 
A.MKTNG_PGM_NBR, 
A.MKTNG_PGM_NAME,
 B.LEGAL_ENT_NBR,
 B.LEGAL_ENT_NAME,
 C.CNTRY_CODE,
 C.CNTRY_NAME,
NULL (INTEGER)   AS  SYS_TARGET_ID,
NULL (VARCHAR(1000))  AS SYS_AUTH_ID,
NULL (VARCHAR(256))  AS SYS_SOURCE,
NULL (VARCHAR(70))  AS SYS_CREATED_BY,
NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE,
NULL (VARCHAR(25))  AS  SYS_ENT_STATE,
NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25))  AS SYS_NC_TYPE,
NULL (VARCHAR(10000))  AS SYS_ERR_CODE,
NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
FROM MDM.MKTNG_PGM A
LEFT JOIN MDM.LEGAL_ENT B
ON A.LEGAL_ENT_NBR=B.LEGAL_ENT_NBR
LEFT JOIN MDM.CNTRY C
ON A.LEGAL_ENT_NBR=C.LEGAL_ENT_NBR;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;



.LABEL L34
REPLACE VIEW  MDM.WS_MKTNG_PGM_SCORE_SGMNT 
(
MKTNG_PGM_NBR,
MKTNG_PGM_NAME ,
MKTNG_PGM_SHORT_NAME ,
MKTNG_PGM_DESC ,
MKTNG_PGM_STATUS ,
MKTNG_PGM_BUSN_NAME ,
LEGAL_ENT_NBR ,
CNSMR_SCORE_NBR ,
CNSMR_SCORE_NAME,
CNSMR_SCORE_DESC,  
WEBSITE_SGMNT_IND,
SYS_TARGET_ID,
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
                  ) AS 
SEL         
MKTNG_PGM_NBR,
MKTNG_PGM_NAME ,
MKTNG_PGM_SHORT_NAME ,
MKTNG_PGM_DESC ,
MKTNG_PGM_STATUS ,
MKTNG_PGM_BUSN_NAME ,
B.LEGAL_ENT_NBR ,
A.CNSMR_SCORE_NBR ,
CNSMR_SCORE_NAME,
CNSMR_SCORE_DESC,  
WEBSITE_SGMNT_IND,
NULL (INTEGER)                               AS  SYS_TARGET_ID,
NULL (VARCHAR(1000))                AS SYS_AUTH_ID,
NULL (VARCHAR(256))   AS SYS_SOURCE,
NULL (VARCHAR(70))     AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) AS SYS_CREATION_DATE,
NULL  (VARCHAR(25))    AS  SYS_ENT_STATE,
NULL (VARCHAR(70))     AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25))     AS SYS_NC_TYPE,
NULL (VARCHAR(10000))              AS SYS_ERR_CODE,
NULL (VARCHAR(30))     AS SYS_ERR_SVRTY
FROM 
CNSMR_SCORE_REF A 
LEFT JOIN 
MTCHD_CNSMR_SCR_DMN_MAP B 
ON A.CNSMR_SCORE_NBR = B.CNSMR_SCORE_NBR
LEFT JOIN MKTNG_PGM C 
ON B.LEGAL_ENT_NBR = C.LEGAL_ENT_NBR
WHERE WEBSITE_SGMNT_IND='Y';


.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L35

REPLACE VIEW MDM.V_GDPR_Review
(GDPR_CASE_ID
,GVN_NAME
,MID_NAME
,FAMLY_NAME
,FULL_NAME
,ADDR_LINE_1_TXT
,ADDR_LINE_2_TXT
,ADDR_LINE_3_TXT
,TERR_NAME
,CITY_NAME
,MKTNG_PGM_NBR
,CNTRY_CODE
,GDPR_CASE_OWNR_CNTCT_NBR
,GDPR_RQST_TYPE_CD
,POSTL_AREA_CODE
,GDPR_RQST_CRTN_DATETM         
,EMAIL_ADDR_TXT
,GDPR_RQST_STATUS_CD
,FULL_PHONE_NUM
,DATA_SRCE_NBR
,NAME_SUFFX_TXT 
,REGIS_CNSMR_ID_VAL
,NATIONAL_ID_NBR
,SR_NBR
,GDPR_RQST_FULFLMT_DATETM
,GDPR_RQST_IDNTY_VFYD_DATETM
,GDPR_RQST_TYPE_NAME
,GDPR_RQST_STATUS_NAME
,CNTRY_NAME
,MKTNG_PGM_DESC
  ,A.SYS_TARGET_ID,   
  SYS_AUTH_ID,   
  SYS_SOURCE,   
  SYS_CREATED_BY,   
  SYS_CREATION_DATE,   
  SYS_ENT_STATE,   
  SYS_LAST_MODIFIED_BY,   
  SYS_LAST_MODIFIED_DATE,   
  SYS_NC_TYPE,   
  SYS_ERR_CODE,   
  SYS_ERR_SVRTY,
 TEMPORAL_TIME
  )
AS 

LOCKING ROW FOR ACCESS  SEL
A.GDPR_CASE_ID
,A.GVN_NAME
,A.MID_NAME
,A.FAMLY_NAME
,A.FULL_NAME
,A.ADDR_LINE_1_TXT
,A.ADDR_LINE_2_TXT
,A.ADDR_LINE_3_TXT
,A.TERR_NAME
,A.CITY_NAME
,A.MKTNG_PGM_NBR
,A.CNTRY_CODE
,A.GDPR_CASE_OWNR_CNTCT_NBR
,A.GDPR_RQST_TYPE_CD
,A.POSTL_AREA_CODE
,A.GDPR_RQST_CRTN_DATETM         
,A.EMAIL_ADDR_TXT
,A.GDPR_RQST_STATUS_CD
,A.FULL_PHONE_NUM
,A.DATA_SRCE_NBR
,A.NAME_SUFFX_TXT 
,A.REGIS_CNSMR_ID_VAL
,A.NATIONAL_ID_NBR
,F.SR_NBR
,A.GDPR_RQST_FULFLMT_DATETM
,A.GDPR_RQST_IDNTY_VFYD_DATETM
,C.GDPR_RQST_TYPE_NAME
,B.GDPR_RQST_STATUS_NAME
,D.CNTRY_NAME
,E.MKTNG_PGM_DESC
  ,A.SYS_TARGET_ID,   
  A.SYS_AUTH_ID,   
  A.SYS_SOURCE,   
  A.SYS_CREATED_BY,   
  A.SYS_CREATION_DATE,   
  A.SYS_ENT_STATE,   
  A.SYS_LAST_MODIFIED_BY,   
  A.SYS_LAST_MODIFIED_DATE,   
  A.SYS_NC_TYPE,   
  A.SYS_ERR_CODE,   
  A.SYS_ERR_SVRTY ,
  A.TEMPORAL_TIME
FROM icrm_tbl.GDPR_RQST A LEFT OUTER JOIN icrm_tbl.GDPR_RQST_STATUS B
ON A.GDPR_RQST_STATUS_CD= B.GDPR_RQST_STATUS_CD
 LEFT OUTER JOIN icrm_tbl.GDPR_RQST_TYPE  C
ON A.GDPR_RQST_TYPE_CD= C.GDPR_RQST_TYPE_CD
LEFT OUTER JOIN icrm_tbl.CNTRY D
ON A.CNTRY_CODE= D.CNTRY_CODE
LEFT OUTER JOIN icrm_tbl.MKTNG_PGM E
ON A.MKTNG_PGM_NBR= E.MKTNG_PGM_NBR
LEFT OUTER JOIN icrm_tbl.CNTCT F
ON A.GDPR_CASE_OWNR_CNTCT_NBR= F.CNTCT_NBR
WHERE A.GDPR_RQST_STATUS_CD<>'CP';


.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


  .LABEL L36
  
  REPLACE VIEW MDM.V_UNMATCHED_NOT_FND_OPT_RPRT
	(
	PE_OPTOUT_ID,
	GVN_NAME_OPT,
	MID_NAME_OPT,
	FAMLY_NAME_OPT,
	FULL_PHONE_NUM_OPT,
	EMAIL_ADDR_TXT_OPT,
	ADDRESS_OPT,
	ADDRESS_OPT1,
	LEGAL_ENT_NBR,
	MATCH_FLG,
	NATIONAL_ID_NBR
	)
	AS
		LOCKING ROW FOR ACCESS	
	SELECT 
		OPT_OUT_DRCTV_ID  AS PE_OPTOUT_ID,
		FIRST_NAME AS GVN_NAME_OPT,
		' ' AS MID_NAME_OPT,
		LAST_NAME AS FAMLY_NAME_OPT,
		CONTACT_PHONE_NBR AS FULL_PHONE_NUM_OPT,
		EMAIL_ADDR_TEXT AS EMAIL_ADDR_TXT_OPT,
		coalesce(ADDR_LINE_1_TXT,'')||' '||coalesce(ADDR_LINE_2_TXT,'')||' '||coalesce(ADDR_LINE_3_TXT,'')||' '||coalesce(CITY_NAME,'')||' '||coalesce(TERR_NAME,'')||' '||coalesce(CNTRY_NAME,'')||' '||coalesce(POSTL_AREA_CODE,'') AS ADDRESS_OPT ,
		coalesce(ADDR_LINE_1_TXT,'')||'^'||coalesce(ADDR_LINE_2_TXT,'')||'^'||coalesce(ADDR_LINE_3_TXT,'') AS ADDRESS_OPT1 ,
		LEGAL_ENT_NBR,
		' ' AS MATCH_FLG,
		NATIONAL_ID_NBR
	FROM MDM.OPT_OUT_DIRECTIVE  
	WHERE OPT_OUT_DRCTV_ID NOT IN (SELECT OPT_OUT_DRCTV_ID FROM MDM.REGIS_PRSNA_OPT_HIST);
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  
  
  .LABEL L37
REPLACE VIEW MDM.V_GDPR_EDIT_REGIS
AS LOCKING ROW FOR ACCESS

SELECT   DISTINCT GDPR_SRCH_RSLT.GDPR_SRCH_TYPE_CODE,
GDPR_RQST.GDPR_CASE_ID,
GDPR_SRCH_RSLT.MKTNG_PGM_NBR,
GDPR_SRCH_RSLT.REGIS_PRSNA_ID,
GDPR_RQST_TYPE.GDPR_RQST_TYPE_NAME,
GDPR_RQST_STATUS.GDPR_RQST_STATUS_NAME,
GDPR_RQST.GVN_NAME,
GDPR_RQST.MID_NAME,
GDPR_RQST.FAMLY_NAME,
GDPR_RQST.NAME_SUFFX_TXT,
GDPR_RQST.FULL_NAME,
MKTNG_PGM.MKTNG_PGM_DESC,
GDPR_RQST.REGIS_CNSMR_ID_VAL,
GDPR_RQST.DATA_SRCE_NBR, 
 GDPR_RQST.NATIONAL_ID_NBR,
GDPR_RQST.EMAIL_ADDR_TXT,
GDPR_RQST.FULL_PHONE_NUM,
Coalesce(GDPR_RQST.ADDR_LINE_1_TXT,'')||' '||
Coalesce(GDPR_RQST.ADDR_LINE_2_TXT,'')||' '||
Coalesce(GDPR_RQST.ADDR_LINE_3_TXT,'')||' '||
Coalesce(GDPR_RQST.CITY_NAME,'')||' '||
Coalesce(GDPR_RQST.TERR_NAME,'')||' '||
Coalesce(GDPR_RQST.CNTRY_CODE,'')||' '||
Coalesce(GDPR_RQST.POSTL_AREA_CODE,'') 
 AS FULLADDRESS ,
GDPR_RQST.GDPR_RQST_FULFLMT_DATETM,
GDPR_RQST.GDPR_RQST_CRTN_DATETM, 
 GDPR_RQST.GDPR_RQST_IDNTY_VFYD_DATETM
,NULL (INTEGER)   AS  SYS_TARGET_ID
,NULL (VARCHAR(25))  AS SYS_AUTH_ID
,NULL (VARCHAR(25))  AS SYS_SOURCE
,NULL (VARCHAR(70))  AS SYS_CREATED_BY
,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE
,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25))  AS SYS_NC_TYPE
,NULL (VARCHAR(10000))  AS SYS_ERR_CODE
,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY  
 FROM    GDPR_RQST
LEFT JOIN
GDPR_RQST_TYPE ON
GDPR_RQST.GDPR_RQST_TYPE_CD=GDPR_RQST_TYPE.GDPR_RQST_TYPE_CD 
 LEFT JOIN
GDPR_RQST_STATUS ON 
 GDPR_RQST.GDPR_RQST_STATUS_CD=GDPR_RQST_STATUS.GDPR_RQST_STATUS_CD 
 LEFT JOIN 
 MKTNG_PGM ON 
 GDPR_RQST.MKTNG_PGM_NBR=MKTNG_PGM.MKTNG_PGM_NBR 
 LEFT JOIN
GDPR_SRCH_RSLT ON 
 GDPR_RQST.GDPR_CASE_ID= GDPR_SRCH_RSLT.GDPR_CASE_ID 
 AND GDPR_SRCH_RSLT.PROC_IND='Y';
	
	.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L38	
	REPLACE VIEW MDM.GDPR_RQST_STG 
AS LOCKING ROW FOR ACCESS
SELECT
                
 GRS.GDPR_CASE_ID
,GRS.GDPR_RQST_TYPE_CD
,GRS.GDPR_RQST_STATUS_CD
,GRS.GVN_NAME
,GRS.FAMLY_NAME
,GRS.MKTNG_PGM_NBR
,GRS.REGIS_CNSMR_ID_VAL
,GRS.NATIONAL_ID_NBR
,GRS.EMAIL_ADDR_TXT
,GRS.FULL_PHONE_NUM
,GRS.ADDR_LINE_1_TXT_ORIG
,GRS.ADDR_LINE_2_TXT_ORIG
,GRS.ADDR_LINE_3_TXT_ORIG
,GRS.CITY_NAME_ORIG
,GRS.TERR_NAME_ORIG
,GRS.CNTRY_CODE_ORIG
,GRS.POSTL_AREA_CODE_ORIG
,GRS.ADDR_LINE_1_TXT
,GRS.ADDR_LINE_2_TXT
,GRS.ADDR_LINE_3_TXT
,GRS.CITY_NAME
,GRS.TERR_NAME
,GRS.POSTL_AREA_CODE
,GRS.CNTRY_CODE
,GRS.GDPR_RQST_FULFLMT_DATETM
,GRS.GDPR_RQST_CRTN_DATETM
,GRS.GDPR_RQST_IDNTY_VFYD_DATETM,
GRS.SYS_SOURCE AS LOAD_ID,
GRS.SYS_CREATION_DATE AS LOAD_TS,
CN.LEGAL_ENT_NBR
,GRS.WIN_KEY
,GRS.GL_ACCURACY
,GRS.GL_MATCH_FLG
,GRS.GL_LATITUDE
,GRS.GL_LONGITUDE
,GRS.DR_CLEANSE_LVL
,GRS.VALID_CNTCT_POINT_IND
,GRS.PR_REV_GROUP
,GRS.PR_GEOCODE_FAIL
FROM ICRM_STAGE_TBL.GDPR_RQST_STG GRS
LEFT JOIN iCRM_TBL.CNTRY CN
ON GRS.CNTRY_CODE=CN.CNTRY_CODE;


.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L39

REPLACE VIEW MDM.GDPR_BRODCAST_HIST_V
(EXTRACT_ID
,GDPR_CASE_ID
,GDPR_CASE_RQST_TYPE
,CNTRY_CODE
,SUPPLIER_QUAD
,SENT_TIMESTAMP
,SYS_LAST_MODIFIED_DATE
,LOAD_ID
,GDPR_RQST_STATUS_CD
)
AS 
LOCKING ROW FOR ACCESS  SEL
GBH.EXTRACT_ID
,GBH.GDPR_CASE_ID
,GBH.GDPR_CASE_RQST_TYPE
,GBH.CNTRY_CODE
,GBH.SUPPLIER_QUAD
,GBH.SENT_TIMESTAMP
,GBH.SYS_LAST_MODIFIED_DATE
,GBH.LOAD_ID
,GBH.GDPR_RQST_STATUS_CD	
FROM iCRM_STAGE_TBL.GDPR_BRODCAST_HIST GBH;


.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L40

REPLACE VIEW  MDM.WS_PROD_ITEM_HIER_ASSOC
(
 SECTOR_CODE           ,   
 SECTOR_NAME,
 SUB_SECTOR_CODE               ,
 SUB_SECTOR_NAME,
 CATEG_CODE                    ,
 CATEG_NAME,
 SEG_CODE                      ,
 SEG_NAME,
 SUB_BRAND_CODE                ,
 SUB_BRAND_NAME,
 BRAND_CODE                    ,
 BRAND_NAME,
 ITEM_VERS_CODE                ,
 GLOBAL_FORM_CODE              ,
 PROD_ITEM_UPC                 ,
 PROD_ITEM_NAME ,
 PROD_FAMLY_ID,
 PROD_FAMLY_NAME ,
 BRAND_FAMLY_ID,
 BRAND_FAMLY_NAME,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS LOCKING ROW FOR ACCESS
SELECT
A.SECTOR_CODE           ,   
G.SECTOR_NAME,
A.SUB_SECTOR_CODE               ,
D.SUB_SECTOR_NAME,
A.CATEG_CODE                    ,
B.CATEG_NAME,
A.SEG_CODE                      ,
C.SEG_NAME,
A.SUB_BRAND_CODE                ,
F.SUB_BRAND_NAME,
A.BRAND_CODE                    ,
E.BRAND_NAME,
A.ITEM_VERS_CODE                ,
A.GLOBAL_FORM_CODE              ,
A.PROD_ITEM_UPC                 ,
H.PROD_ITEM_NAME,
I.PROD_FAMLY_ID,
I.PROD_FAMLY_NAME ,
J.BRAND_FAMLY_ID,
J.BRAND_FAMLY_NAME,
NULL (INTEGER)   AS  SYS_TARGET_ID,
NULL (VARCHAR(1000))  AS SYS_AUTH_ID,
NULL (VARCHAR(256))  AS SYS_SOURCE,
NULL (VARCHAR(70))  AS SYS_CREATED_BY,
NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE,
NULL  (VARCHAR(25))  AS  SYS_ENT_STATE,
NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25))  AS SYS_NC_TYPE,
NULL (VARCHAR(10000))  AS SYS_ERR_CODE,
NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
FROM 
MDM.PROD_ITEM_HIER_ASSOC A
LEFT OUTER JOIN MDM.CATEG B
ON A.CATEG_CODE=B.CATEG_CODE
LEFT OUTER JOIN MDM.SEG C
ON A.SEG_CODE=C.SEG_CODE
LEFT OUTER JOIN MDM.SUB_SECTOR D
ON A.SUB_SECTOR_CODE=D.SUB_SECTOR_CODE
LEFT OUTER JOIN MDM.BRAND E
ON A.BRAND_CODE=E.BRAND_CODE
LEFT OUTER JOIN MDM.SUB_BRAND F
ON A.SUB_BRAND_CODE=F.SUB_BRAND_CODE
LEFT OUTER JOIN MDM.SECTOR G
ON A.SECTOR_CODE=G.SECTOR_CODE
LEFT OUTER JOIN MDM.PROD_ITEM H
ON A.PROD_ITEM_UPC=H.PROD_ITEM_UPC 
LEFT OUTER JOIN MDM.PROD_FAMLY I
ON A.PROD_FAMLY_ID=I.PROD_FAMLY_ID 
LEFT OUTER JOIN MDM.BRAND_FAMLY J
ON A.BRAND_FAMLY_ID=J.BRAND_FAMLY_ID ;


.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L41

REPLACE VIEW MDM.WS_CAMPAIGN_EMAIL
( 
 CAMPAIGN_LEAD_KEY,
EMAIL_ADDR_TXT,
SYS_TARGET_ID,
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
AS
LOCKING ROW FOR ACCESS 
SELECT
TEMP.CAMPAIGN_LEAD_KEY,
A.EMAIL_ADDR_TXT,
NULL (INTEGER)   AS  SYS_TARGET_ID,
NULL (VARCHAR(1000))  AS SYS_AUTH_ID,   
NULL (VARCHAR(256))  AS SYS_SOURCE,
NULL (VARCHAR(70))  AS SYS_CREATED_BY,
NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE,
NULL  (VARCHAR(25))  AS  SYS_ENT_STATE,
NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25))  AS SYS_NC_TYPE,
NULL (VARCHAR(10000))  AS SYS_ERR_CODE,
NULL (VARCHAR(30))  AS SYS_ERR_SVRTY
FROM     MDM.CAMPAIGN_CNSMR TEMP
    INNER JOIN MDM.CAMPAIGN_INST C
        ON TEMP.CAMPAIGN_INST_ID=C.CAMPAIGN_INST_ID
    INNER JOIN  (NONSEQUENCED TRANSACTIONTIME
    SEL MKTNG_PGM_NBR,REGIS_PRSNA_ID,TEMPORAL_TIME,EMAIL_ADDR_TXT
    FROM    ICRM_TBL.REGIS_PRSNA_EMAIL_ADDR A
        WHERE   A.SUBSCRPTN_OPT_IND IS NOT NULL) A
        ON TEMP.MKTNG_PGM_NBR = A.MKTNG_PGM_NBR
        AND TEMP.REGIS_PRSNA_ID = A.REGIS_PRSNA_ID
    WHERE    C.CAMPAIGN_INST_START_DTTM BETWEEN Begin(TEMPORAL_TIME) 
        AND End(TEMPORAL_TIME)
        
       QUALIFY   Row_Number() Over (
    PARTITION BY TEMP.CAMPAIGN_LEAD_KEY 
    ORDER BY TEMPORAL_TIME DESC)=1;


.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L48
/* CHG0098824:[ENH CHG] Campaign Dashboard/Visibility */
REPLACE VIEW MDM.WS_CAMPAIGN_JOBS  
(CAMPAIGN_NAME
,MKTNG_PGM_NBR
,MKTNG_PGM_NAME
,COUNTRY
,VENDOR_NAME
,CAMPAIGN_URL
,EMAIL_DEPLOYMENT_DATE
,EMAIL_DEPLOYMENT_TIME
,START_DTTM
,END_DTTM
,NEXT_SCHEDULED_RUN_DTTM
,LEAD_GENERATION_CNT
,AUTOMATED_IND
,STATUS
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
SYS_ERR_SVRTY ) 
AS
SELECT DISTINCT
CAMPAIGN_NAME
,MKTNG_PGM_NBR
,MKTNG_PGM_NAME
,COUNTRY
,VENDOR_NAME
,CAMPAIGN_URL
,CAST(EMAIL_DEPLOYMENT_DATE AS DATE)
,CAST(EMAIL_DEPLOYMENT_TIME AS TIME)
,START_DTTM
,END_DTTM
,NEXT_SCHEDULED_RUN_DTTM
,LEAD_GENERATION_CNT
,AUTOMATED_IND
,STATUS
,NULL (INTEGER)              AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) AS SYS_AUTH_ID,
NULL (VARCHAR(256))   AS SYS_SOURCE,
NULL (VARCHAR(70))    AS SYS_CREATED_BY,
NULL (TIMESTAMP(0))   AS SYS_CREATION_DATE,
'ACTIVE'  (VARCHAR(25))       AS  SYS_ENT_STATE,
NULL (VARCHAR(70))    AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0))   AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25))    AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) AS SYS_ERR_CODE,
NULL (VARCHAR(30))    AS SYS_ERR_SVRTY   
FROM 
TRM_VIEWS_DB.RB_CAMPAIGN_JOBS;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;