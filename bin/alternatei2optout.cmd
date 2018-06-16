@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: alternatei2optout <COUNTRY>  
REM 
REM 
REM 
REM   Comments: AREA for modification in script is mentioned below
REM 
REM 
REM 
REM 
REM ******************************************************************************************

REM  Check for the parameters
IF (%1)==() GOTO err_param

set CNTRY=%1

set LOADID=%2

call .\etlenv.cmd

REM -------------------------------------------------------------------------------------
set step=S000
IF EXIST %temp_dir%\alternatei2opt.%CNTRY% for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\alternatei2opt.%CNTRY%`) do set step=%%a
GOTO %step%

REM *************************************************
REM  
REM *************************************************
:S000
echo S000 > %temp_dir%\alternatei2opt.%CNTRY%
%util_dir%\ssed "s/$CNTRY/%CNTRY%/g;s/$LOADID/%LOADID%/g" %script_path%\ALTERNATEI2OPTOUT.btq  > %script_path%\alternatei2optout.%CNTRY%
call %exec_dir%\run_sql_merge alternatei2optout.%CNTRY%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\alternatei2optout.%CNTRY%


GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : %0 {COUNTRY} {load id}
echo.

:End
del %temp_dir%\alternatei2opt.%CNTRY%

:Closeout
del %temp_dir%\alternatei2opt.%CNTRY%
exit %returncd%