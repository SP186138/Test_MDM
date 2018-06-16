@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: I20B_POSTL_UPDATE LOAD_ID
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
REM 5.7                  04/01/2016           TERADATA                        RELEASE 5.7
REM                                                                           INITIAL VERSION
REM ******************************************************************************************

REM  Check for the parameters
IF (%1)==() GOTO err_param
set loadid=%1
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
set step=S100
IF EXIST %temp_dir%\POSTL_ADDR.run for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\POSTL_ADDR.run`) do set step=%%a
GOTO %step%

REM *************************************************
REM  POSTL UPDATE
REM *************************************************
:S100
echo S100 > %temp_dir%\POSTL_ADDR.run
REM POSTL_ADDR.btq
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%loadid%/" %script_path%\POSTL_ADDR.btq  > %script_path%\POSTL_ADDR.bteq
call %exec_dir%\run_sql_merge POSTL_ADDR.bteq
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\POSTL_ADDR.bteq

GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : %0 
echo.

:End
del %temp_dir%\POSTL_ADDR.run

:Closeout
del %temp_dir%\POSTL_ADDR.run
exit %returncd%