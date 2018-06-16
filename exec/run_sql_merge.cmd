@echo off

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  RUN a BTEQ SCRIPT
::  Author: Teradata
::  Purpose: Load the SCRIPT file to Teradata
::	
::
::
::
::
::
::
::  Parameters: RUN_SCRIPT.BAT <SCRIPT_NAME> 
::
::
::
::  Comments: AREA for modification in script is mentioned below
::
::
::
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Check for the parameters
IF (%1)==() GOTO err_param
::IF (%2)==() GOTO err_param
::--IF (%3)==() GOTO err_param

set script_location=%script_path%
set SCRIPT_NAME=%1
set PFILE=%2

::-------------------------------------------------------------------------------------
:: Timestamp Generator, do not delete
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
set starttimestamp=%cur_yyyy%-%cur_mm%-%cur_dd% %cur_hh%:%cur_nn%:%cur_ss%
::-------------------------------------------------------------------------------------






IF NOT EXIST %script_location%\%SCRIPT_NAME% (echo File Not Found : %script_location%\%SCRIPT_NAME% & GOTO End)
::IF NOT EXIST %include_dir%\%PFILE%  GOTO SETPARAM

set PARAM_FILE=%include_dir%\etlvar.txt
set TEMP_PARAM_FILE=%include_dir%\etlvar.%timestamp%


IF NOT EXIST %PARAM_FILE% echo Parameter File Not Found : %PARAM_FILE% & GOTO End




:: CREATE CONTROL RECORD
echo s/$SCRIPTNAME/%SCRIPT_NAME%/g > %TEMP_PARAM_FILE%
echo s/$STARTTIME/%starttimestamp%/g >> %TEMP_PARAM_FILE%
%util_dir%\ssed -f %PARAM_FILE% -f %TEMP_PARAM_FILE% -f %secure_dir%\logon_mdmmerge.txt  %util_dir%\create_control_record.btq > %work_dir%\create_control_record.%SCRIPT_NAME%.%timestamp%
bteq < %work_dir%\create_control_record.%SCRIPT_NAME%.%timestamp%  > %log_dir%\create_control_record.%SCRIPT_NAME%.%timestamp%.log

:Substitute Parameters in Script
%util_dir%\ssed -f %PARAM_FILE% -f %secure_dir%\logon_mdmmerge.txt  %script_location%\%SCRIPT_NAME% > %work_dir%\%SCRIPT_NAME%.%timestamp%

:: This is the procedure for BTQ
:BTQ_PROC
echo RUNNING THE SCRIPT : %script_location%\%SCRIPT_NAME%

bteq < %work_dir%\%SCRIPT_NAME%.%timestamp%  > %log_dir%\%SCRIPT_NAME%.%timestamp%.log
set returncd=%errorlevel%

IF  %returncd%==0 set LOAD_STATUS=PASS
IF NOT %returncd%==0 set LOAD_STATUS=FAIL
echo %LOAD_STATUS%


::Generate End time
::-------------------------------------------------------------------------------------
:: Timestamp Generator, do not delete
set cur_yyyy=%date:~10,4%
set cur_mm=%date:~4,2%
set cur_dd=%date:~7,2%
set cur_hh=%time:~0,2%
if %cur_hh% lss 10 (set cur_hh=0%time:~1,1%)
set cur_nn=%time:~3,2%
set cur_ss=%time:~6,2%
set cur_ms=%time:~9,2%
set LOAD_DTTM_START=%cur_yyyy%-%cur_mm%-%cur_dd% %cur_hh%:%cur_nn%:%cur_ss%
set endtimestamp=%cur_yyyy%-%cur_mm%-%cur_dd% %cur_hh%:%cur_nn%:%cur_ss%
::-------------------------------------------------------------------------------------

:: Update Control Record

echo s/$SCRIPTSTAT/%LOAD_STATUS%/g >> %TEMP_PARAM_FILE%
echo s/$ENDTIME/%endtimestamp%/g >> %TEMP_PARAM_FILE%
echo s/$RETURNCODE/%returncd%/g >> %TEMP_PARAM_FILE%
%util_dir%\ssed -f %PARAM_FILE% -f %TEMP_PARAM_FILE% -f %secure_dir%\logon_mdmmerge.txt  %util_dir%\update_control_record.btq > %work_dir%\update_control_record.%SCRIPT_NAME%.%timestamp%
bteq < %work_dir%\update_control_record.%SCRIPT_NAME%.%timestamp%  > %log_dir%\update_control_record.%SCRIPT_NAME%.%timestamp%.log


:End
del %work_dir%\%SCRIPT_NAME%.%timestamp%
del %TEMP_PARAM_FILE%
del %work_dir%\create_control_record.%SCRIPT_NAME%.%timestamp%
del %work_dir%\update_control_record.%SCRIPT_NAME%.%timestamp%
del %log_dir%\create_control_record.%SCRIPT_NAME%.%timestamp%.log
del %log_dir%\update_control_record.%SCRIPT_NAME%.%timestamp%.log

exit /b %returncd%