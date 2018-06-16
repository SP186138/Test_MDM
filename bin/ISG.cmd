@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: Onetime <ScriptName> <Label>  
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
REM ******************************************************************************************

REM  Check for the parameters
IF (%1)==() GOTO err_param
IF (%2)==() GOTO err_param

set ScriptName=%1
set Lbl=%2

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
IF EXIST %temp_dir%\Onetime.%ScriptName% for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\Onetime.%ScriptName%`) do set step=%%a
GOTO %step%

REM *************************************************
REM  Script Execution
REM *************************************************
:S000
echo S000 > %temp_dir%\Onetime.%ScriptName%
%util_dir%\ssed "s/$Step/%Lbl%/" %script_path%\%ScriptName%.sql  > %script_path%\%ScriptName%.run
call %exec_dir%\run_sql_ISG %ScriptName%.run
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\%ScriptName%.run

GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : <ScriptName> <Label> 
echo.

:End
del %temp_dir%\Onetime.%ScriptName%
exit %returncd%
:Closeout
exit %returncd%