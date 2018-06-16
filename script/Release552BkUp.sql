CREATE TABLE user_work.REGIS_PRSNA_R552  AS 
(SEL * FROM ICRM_TBL.REGIS_PRSNA WHERE REGIS_PRSNA_ID IN
(SEL REGIS_PRSNA_ID  
FROM MDM.REGIS_PRSNA
WHERE CNTRY_CODE IN ('LAT','CAN','ARG','CHL','MEX'))) WITH DATA
PRIMARY INDEX REGIS_PRSNA_NUPI ( REGIS_PRSNA_ID ,MKTNG_PGM_NBR )
PARTITION BY MKTNG_PGM_NBR 
INDEX CNSMRIdx ( LEGAL_ENT_NBR ,MATCHD_CNSMR_PRSNA_ID ,PRSNA_STATUS_CODE )
INDEX REGIS_PRSNA_NUSI_1 ( FAMLY_NAME )
INDEX REGIS_PRSNA_NUSI_2 ( NATIONAL_ID_NBR )
INDEX REGIS_PRSNA_NUSI_3 ( LYLTY_ACCT_NUM )
INDEX REGIS_PRSNA_NUSI_4 ( REGIS_CNSMR_ID_VAL );


CREATE TABLE user_work.REGIS_PRSNA_POSTL_ADDR_R552  AS 
(SEL * FROM ICRM_TBL.REGIS_PRSNA_POSTL_ADDR WHERE MKTNG_PGM_NBR IN (SEL MKTNG_PGM_NBR FROM MKTNG_PGM WHERE LEGAL_ENT_NBR IN (23))) WITH DATA
PRIMARY INDEX REGIS_PRSNA_POSTL_ADDR_NUPI ( REGIS_PRSNA_ID ,MKTNG_PGM_NBR )
PARTITION BY MKTNG_PGM_NBR ;