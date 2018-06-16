@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: MERGE <COUNTRY>  
REM 
REM 
REM 
REM   Comments: AREA for modification in script is mentioned below
REM 
REM 
REM 
REM
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 5.1                  04/08/2014           TERADATA                        RELEASE 5.1
REM                                                                           REMOVE S1580
REM ******************************************************************************************

REM  Check for the parameters
IF (%1)==() GOTO err_param

set CNTRY=%1

call .\etlenv.cmd


REM -------------------------------------------------------------------------------------
REM  Timestamp Generator, do not delete
set cur_yyyy=%date:~10,4%
set cur_mm=%date:~4,2%
set cur_dd=%date:~7,2%
set cur_hh=%time:~0,2%
if %cur_hh% lss 10 (set cur_hh=0%time:~1,1%)
set cur_nn=%time:~3,2%
set cur_ss=%time:~6,2%
set cur_ms=%time:~9,2%
set LOAD_DTTM_START=%cur_yyyy%-%cur_mm%-%cur_dd% %cur_hh%:%cur_nn%:%cur_ss%
set timestamp=%cur_yyyy%%cur_mm%%cur_dd%_%cur_hh%%cur_nn%%cur_ss%%cur_ms%

REM -------------------------------------------------------------------------------------
set step=S000
IF EXIST %temp_dir%\MERGE.%CNTRY% for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\MERGE.%CNTRY%`) do set step=%%a
GOTO %step%

REM *************************************************
REM  CREATE CONTROL RECORDS FOR COUNTRY LOAD ID'S
REM *************************************************
:S000
echo S000 > %temp_dir%\MERGE.%CNTRY%
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\CREATE_LOAD_INFO_RECORD.btq  > %script_path%\CREATE_LOAD_INFO_RECORD.%CNTRY%
call %exec_dir%\run_sql_merge CREATE_LOAD_INFO_RECORD.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\CREATE_LOAD_INFO_RECORD.%CNTRY%


REM *************************************************
REM  DEDUP PROCESS
REM *************************************************
:S100
echo S100 > %temp_dir%\MERGE.%CNTRY%
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\CNSMR_EDW_DEDUP.btq  > %script_path%\CNSMR_EDW_DEDUP.%CNTRY%
call %exec_dir%\run_sql_merge CNSMR_EDW_DEDUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\CNSMR_EDW_DEDUP.%CNTRY%

REM *************************************************
REM  MOVE DATA INTO EDW TABLES
REM *************************************************
:S200
echo S200 > %temp_dir%\MERGE.%CNTRY%
REM  REGIS_PRSNA
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA.btq  > %script_path%\REGIS_PRSNA.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA.%CNTRY%

:S300
echo S300 > %temp_dir%\MERGE.%CNTRY%
REM HSHLD_PRSNA
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\HSHLD_PRSNA.btq  > %script_path%\HSHLD_PRSNA.%CNTRY%
call %exec_dir%\run_sql_merge HSHLD_PRSNA.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\HSHLD_PRSNA.%CNTRY%

:S400
echo S400 > %temp_dir%\MERGE.%CNTRY%
REM MATCHD_CNSMR_PRSNA
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\MATCHD_CNSMR_PRSNA.btq  > %script_path%\MATCHD_CNSMR_PRSNA.%CNTRY%
call %exec_dir%\run_sql_merge MATCHD_CNSMR_PRSNA.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\MATCHD_CNSMR_PRSNA.%CNTRY%

:S500
echo S500 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_POSTL_ADDR
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_POSTL_ADDR.btq  > %script_path%\REGIS_PRSNA_POSTL_ADDR.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_POSTL_ADDR.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_POSTL_ADDR.%CNTRY%

:S600
echo S600 > %temp_dir%\MERGE.%CNTRY%
REM PRSNA_EMAIL_ADDR
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_EMAIL_ADDR.btq  > %script_path%\REGIS_PRSNA_EMAIL_ADDR.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_EMAIL_ADDR.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_EMAIL_ADDR.%CNTRY%

:S700
echo S700 > %temp_dir%\MERGE.%CNTRY%
REM PRSNA_TRT
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\PRSNA_TRT.btq  > %script_path%\PRSNA_TRT.%CNTRY%
call %exec_dir%\run_sql_merge PRSNA_TRT.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_TRT.%CNTRY%

:S800
echo S800 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_PHONE
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_PHONE.btq  > %script_path%\REGIS_PRSNA_PHONE.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_PHONE.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_PHONE.%CNTRY%

:S900
echo S900 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_SOC_NET_ACCT
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_SOC_NET_ACCT.btq  > %script_path%\REGIS_PRSNA_SOC_NET_ACCT.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_SOC_NET_ACCT.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_SOC_NET_ACCT.%CNTRY%

:S1000
echo S1000 > %temp_dir%\MERGE.%CNTRY%
REM MATCHD_CNSMR_POSTL_ADDR
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\MATCHD_CNSMR_POSTL_ADDR.btq  > %script_path%\MATCHD_CNSMR_POSTL_ADDR.%CNTRY%
call %exec_dir%\run_sql_merge MATCHD_CNSMR_POSTL_ADDR.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\MATCHD_CNSMR_POSTL_ADDR.%CNTRY%

:S1100
echo S1100 > %temp_dir%\MERGE.%CNTRY%
REM CNSMR_AFFLTN
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\CNSMR_AFFLTN.btq  > %script_path%\CNSMR_AFFLTN.%CNTRY%
call %exec_dir%\run_sql_merge CNSMR_AFFLTN.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\CNSMR_AFFLTN.%CNTRY%

:S1200
echo S1200 > %temp_dir%\MERGE.%CNTRY%
REM DPEND
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\DPEND.btq  > %script_path%\DPEND.%CNTRY%
call %exec_dir%\run_sql_merge DPEND.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DPEND.%CNTRY%

:S1300
echo S1300 > %temp_dir%\MERGE.%CNTRY%
REM DPEND_TRT
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\DPEND_TRT.btq  > %script_path%\DPEND_TRT.%CNTRY%
call %exec_dir%\run_sql_merge DPEND_TRT.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DPEND_TRT.%CNTRY%

:S1400
echo S1400 > %temp_dir%\MERGE.%CNTRY%
REM PET
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\PET.btq  > %script_path%\PET.%CNTRY%
call %exec_dir%\run_sql_merge PET.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PET.%CNTRY%

:S1500
echo S1500 > %temp_dir%\MERGE.%CNTRY%
REM PET_TRT
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\PET_TRT.btq  > %script_path%\PET_TRT.%CNTRY%
call %exec_dir%\run_sql_merge PET_TRT.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PET_TRT.%CNTRY%

REM *************************************************
REM  I2 OPT OUT PROCESS
REM *************************************************
:S1510
echo S1510 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_OPTOUT
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_OPTOUT.btq  > %script_path%\REGIS_PRSNA_OPTOUT.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_OPTOUT.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_OPTOUT.%CNTRY%

:S1520
echo S1520 > %temp_dir%\MERGE.%CNTRY%
REM MATCHD_CNSMR_PRSNA_OPTOUT
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\MATCHD_CNSMR_PRSNA_OPTOUT.btq  > %script_path%\MATCHD_CNSMR_PRSNA_OPTOUT.%CNTRY%
call %exec_dir%\run_sql_merge MATCHD_CNSMR_PRSNA_OPTOUT.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\MATCHD_CNSMR_PRSNA_OPTOUT.%CNTRY%

:S1550
echo S1550 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_OPT_OUT_HIST_UPD
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_OPT_OUT_HIST_UPD.btq  > %script_path%\REGIS_PRSNA_OPT_OUT_HIST_UPD.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_OPT_OUT_HIST_UPD.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_OPT_OUT_HIST_UPD.%CNTRY%

REM *************************************************
REM  DUPLICATE RECORD PROCESSING
REM *************************************************
:S1600
echo S1600 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_DUP.btq  > %script_path%\REGIS_PRSNA_DUP.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_DUP.%CNTRY%


:S1610
echo S1610 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_EMAIL_ADDR_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_EMAIL_ADDR_DUP.btq  > %script_path%\REGIS_PRSNA_EMAIL_ADDR_DUP.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_EMAIL_ADDR_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_EMAIL_ADDR_DUP.%CNTRY%

:S1620
echo S1620 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_PHONE_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_PHONE_DUP.btq  > %script_path%\REGIS_PRSNA_PHONE_DUP.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_PHONE_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_PHONE_DUP.%CNTRY%

:S1630
echo S1630 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_POSTL_ADDR_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_POSTL_ADDR_DUP.btq  > %script_path%\REGIS_PRSNA_POSTL_ADDR_DUP.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_POSTL_ADDR_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_POSTL_ADDR_DUP.%CNTRY%

:S1640
echo S1640 > %temp_dir%\MERGE.%CNTRY%
REM REGIS_PRSNA_SOC_NET_ACCT_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\REGIS_PRSNA_SOC_NET_ACCT_DUP.btq  > %script_path%\REGIS_PRSNA_SOC_NET_ACCT_DUP.%CNTRY%
call %exec_dir%\run_sql_merge REGIS_PRSNA_SOC_NET_ACCT_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\REGIS_PRSNA_SOC_NET_ACCT_DUP.%CNTRY%


:S1650
echo S1650 > %temp_dir%\MERGE.%CNTRY%
REM DPEND_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\DPEND_DUP.btq  > %script_path%\DPEND_DUP.%CNTRY%
call %exec_dir%\run_sql_merge DPEND_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DPEND_DUP.%CNTRY%

:S1660
echo S1660 > %temp_dir%\MERGE.%CNTRY%
REM DPEND_TRT_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\DPEND_TRT_DUP.btq  > %script_path%\DPEND_TRT_DUP.%CNTRY%
call %exec_dir%\run_sql_merge DPEND_TRT_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DPEND_TRT_DUP.%CNTRY%

:S1670
echo S1670 > %temp_dir%\MERGE.%CNTRY%
REM PET_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\PET_DUP.btq  > %script_path%\PET_DUP.%CNTRY%
call %exec_dir%\run_sql_merge PET_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PET_DUP.%CNTRY%


:S1680
echo S1680 > %temp_dir%\MERGE.%CNTRY%
REM PET_TRT_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\PET_TRT_DUP.btq  > %script_path%\PET_TRT_DUP.%CNTRY%
call %exec_dir%\run_sql_merge PET_TRT_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PET_TRT_DUP.%CNTRY%


:S1690
echo S1690 > %temp_dir%\MERGE.%CNTRY%
REM PRSNA_TRT_DUP.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\PRSNA_TRT_DUP.btq  > %script_path%\PRSNA_TRT_DUP.%CNTRY%
call %exec_dir%\run_sql_merge PRSNA_TRT_DUP.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\PRSNA_TRT_DUP.%CNTRY%

REM *************************************************
REM  DEDUP BY MATCHED CONSUMER
REM *************************************************
:S1700
echo S1700 > %temp_dir%\MERGE.%CNTRY%
REM DEDUP_MATCHD_CNSMR.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\DEDUP_MATCHD_CNSMR.btq  > %script_path%\DEDUP_MATCHD_CNSMR.%CNTRY%
call %exec_dir%\run_sql_merge DEDUP_MATCHD_CNSMR.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DEDUP_MATCHD_CNSMR.%CNTRY%

REM *************************************************
REM  DEDUP BY EMAIL
REM *************************************************
:S1800
echo S1800 > %temp_dir%\MERGE.%CNTRY%
REM DEDUP_EMAIL_ADDR.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\DEDUP_EMAIL_ADDR.btq  > %script_path%\DEDUP_EMAIL_ADDR.%CNTRY%
call %exec_dir%\run_sql_merge DEDUP_EMAIL_ADDR.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DEDUP_EMAIL_ADDR.%CNTRY%

REM *************************************************
REM  UPDATE REPORT LOAD NBR
REM *************************************************
:S1900
echo S1900 > %temp_dir%\MERGE.%CNTRY%
REM RPT_LOAD_NBR.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\RPT_LOAD_NBR.btq  > %script_path%\RPT_LOAD_NBR.%CNTRY%
call %exec_dir%\run_sql_merge RPT_LOAD_NBR.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\RPT_LOAD_NBR.%CNTRY%


REM *************************************************
REM  UPDATE CONTROL RECORDS FOR COUNTRY LOAD ID'S
REM *************************************************
:S2000
echo S2000 > %temp_dir%\MERGE.%CNTRY%
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\UPDATE_LOAD_INFO_RECORD.btq  > %script_path%\UPDATE_LOAD_INFO_RECORD.%CNTRY%
call %exec_dir%\run_sql_merge UPDATE_LOAD_INFO_RECORD.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\UPDATE_LOAD_INFO_RECORD.%CNTRY%

GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : %0 {COUNTRY} 
echo.

:End
del %temp_dir%\MERGE.%CNTRY%

:Closeout
del %temp_dir%\MERGE.%CNTRY%
exit %returncd%