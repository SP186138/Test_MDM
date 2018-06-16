@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: EMAILDEDUP <COUNTRY> <MPN>
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
REM 5.6                  11/18/2015           TERADATA                        RELEASE 5.6
REM                                                                           INITIAL VERSION
REM ******************************************************************************************

REM  Check for the parameters
IF (%1)==() GOTO err_param

set CNTRY=%1
set MPN=%2

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
set step=S1800
IF EXIST %temp_dir%\DEDUP.%CNTRY% for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\DEDUP.%CNTRY%`) do set step=%%a
GOTO %step%

REM *************************************************
REM  DEDUP BY EMAIL
REM *************************************************
:S1800
echo S1800 > %temp_dir%\DEDUP.%CNTRY%
REM DEDUP_EMAIL_ADDR.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\DEDUP_EMAIL_ADDR.btq  > %script_path%\DEDUP_EMAIL_ADDR.%CNTRY%.TEMP
%util_dir%\ssed "s/$MPN/%MPN%/" %script_path%\DEDUP_EMAIL_ADDR.%CNTRY%.TEMP  > %script_path%\DEDUP_EMAIL_ADDR.%CNTRY%
call %exec_dir%\run_sql_merge DEDUP_EMAIL_ADDR.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DEDUP_EMAIL_ADDR.%CNTRY%.TEMP
del %script_path%\DEDUP_EMAIL_ADDR.%CNTRY%

GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : %0 {COUNTRY} 
echo.

:End
del %temp_dir%\DEDUP.%CNTRY%

:Closeout
del %temp_dir%\DEDUP.%CNTRY%
exit %returncd%