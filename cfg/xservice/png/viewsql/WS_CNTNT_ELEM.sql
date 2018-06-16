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
'ACTIVE'  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.CNTNT_ELEM B;