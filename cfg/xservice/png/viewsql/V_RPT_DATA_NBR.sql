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