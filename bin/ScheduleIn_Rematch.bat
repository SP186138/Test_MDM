@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: ScheduleIn_Rematch <COUNTRY>  
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
REM 1.0                  06/05/2017           TERADATA                        RELEASE 6.0
REM ******************************************************************************************

echo Setting Env 
REM cd bin
@call bcmenv.bat
set ETL_HOME="E:\Teradata\MDM\3.05.02\custom\pngrelease3"
set bin_path=%ETL_HOME%\bin
set exec_dir=%ETL_HOME%\exec
set script_path=%ETL_HOME%\script
set data_path=%ETL_HOME%\data
set reject_dir=%DATA_PATH%\reject
set util_dir=%ETL_HOME%\util
set tool_dir=%ETL_HOME%\util\bin
set include_dir=%ETL_HOME%\include
set secure_dir=%ETL_HOME%\secure
set work_dir=%ETL_HOME%\work
set temp_dir=%ETL_HOME%\temp
set temp_data=%ETL_HOME%\data
set log_path=%ETL_HOME%\log

set CLASSPATH=bin;%CLASSPATH%
rem echo %CLASSPATH%

:start

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
IF EXIST %temp_dir%\Rematch.%CNTRY% for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\Rematch.%CNTRY%`) do set step=%%a
GOTO %step%

REM *************************************************
REM  CREATE CONTROL RECORDS FOR COUNTRY LOAD ID'S
REM *************************************************
:S000
echo S000 > %temp_dir%\Rematch.%CNTRY%
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\CREATE_LOAD_INFO_RECORD_REMATCH.btq  > %script_path%\CREATE_LOAD_INFO_RECORD_REMATCH.%CNTRY%
call %exec_dir%\run_sql_merge CREATE_LOAD_INFO_RECORD_REMATCH.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\CREATE_LOAD_INFO_RECORD_REMATCH.%CNTRY%


REM *************************************************
REM  DEDUP PROCESS
REM *************************************************
:S100
echo S100 > %temp_dir%\Rematch.%CNTRY%
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\Rematch.btq  > %script_path%\Rematch.%CNTRY%
call %exec_dir%\run_sql_merge Rematch.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\Rematch.%CNTRY%

REM *************************************************
REM  UPDATE CONTROL RECORDS FOR COUNTRY LOAD ID'S
REM *************************************************
:S200
echo S200 > %temp_dir%\Rematch.%CNTRY%
%util_dir%\ssed "s/$CNTRY/%CNTRY%/" %script_path%\UPDATE_LOAD_INFO_RECORD_REMATCH.btq  > %script_path%\UPDATE_LOAD_INFO_RECORD_REMATCH.%CNTRY%
call %exec_dir%\run_sql_merge UPDATE_LOAD_INFO_RECORD_REMATCH.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\UPDATE_LOAD_INFO_RECORD_REMATCH.%CNTRY%

GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : %0 {COUNTRY} 
echo.

:End
del %temp_dir%\Rematch.%CNTRY%

:Closeout
del %temp_dir%\Rematch.%CNTRY%
exit %returncd%

exit /b