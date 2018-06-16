@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT 
REM   Author: Teradata
REM   Purpose: invoke stored procedure to execute DQRM rules
REM 	
REM   Parameters: DQRMCall Load_id Project_id Frequency
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
REM DQRM                 04/01/2016           TERADATA                        DQRM
REM                                                                           INITIAL VERSION
REM ******************************************************************************************

REM  Check for the parameters
IF (%1)==() GOTO err_param

call .\etlenv.cmd
set ProcessId=%1
set ProjectId=%2
set Frequency=%3

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
IF EXIST %temp_dir%\DQRM_%Frequency%.run for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\DQRM_%Frequency%.run`) do set step=%%a
GOTO %step%

REM *************************************************
REM  POSTL UPDATE
REM *************************************************
:S100
echo S100 > %temp_dir%\DQRM_%Frequency%.run
REM DQRM_%Frequency%.btq
%util_dir%\ssed "s/$PRCSID/%ProcessId%/;s/$PRJCTID/%ProjectId%/;s/$Freq/%Frequency%/" %script_path%\DQRM.btq  > %script_path%\DQRM_%Frequency%.run
%util_dir%\ssed -f %secure_dir%\logon_dqrm.txt %script_path%\DQRM_%Frequency%.run  > %script_path%\DQRM_%Frequency%.btq
bteq < %script_path%\DQRM_%Frequency%.btq  > %log_dir%\DQRM_%Frequency%.%timestamp%.log
set returncd=%errorlevel%
%util_dir%\ssed -n "3p" %ETL_HOME%\bin\DQRM_Output_File_%ProcessId%.out > %ETL_HOME%\bin\DQRM_Output_File_%ProcessId%.txt
set /p returncd1=<%ETL_HOME%\bin\DQRM_Output_File_%ProcessId%.txt

IF  %returncd%==0 set LOAD_STATUS=PASS
IF NOT %returncd%==0 set LOAD_STATUS=FAIL
IF %returncd1%==-1 set LOAD_STATUS=FAIL
IF %returncd1%==-1 set returncd=%returncd1%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DQRM_%Frequency%.btq

GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : %0 
echo.

:End
del %temp_dir%\DQRM_%Frequency%.run
del %ETL_HOME%\bin\DQRM_Output_File_%ProcessId%.out 
del %ETL_HOME%\bin\DQRM_Output_File_%ProcessId%.txt

:Closeout
del %temp_dir%\DQRM_%Frequency%.run
del %ETL_HOME%\bin\DQRM_Output_File_%ProcessId%.out 
del %ETL_HOME%\bin\DQRM_Output_File_%ProcessId%.txt
exit %returncd%