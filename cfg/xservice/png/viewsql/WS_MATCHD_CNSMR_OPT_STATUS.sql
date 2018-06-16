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