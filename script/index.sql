.logon 10.36.32.8/sysdba,;

CREATE INDEX  LYLTY_TRANX_SI (LYLTY_ACCT_NUM, LYLTY_PGM_NBR, MKTNG_PGM_NBR) on  ICRM_TBL.LYLTY_TRANX;