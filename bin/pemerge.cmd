@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: PEMERGE <COUNTRY>  
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
REM 5.6                  11/13/2015           TERADATA                        RELEASE 5.6 BR348
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