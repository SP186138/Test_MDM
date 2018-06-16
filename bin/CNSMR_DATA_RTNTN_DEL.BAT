@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: cnsmrdatartntndel 
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

call .\etlenv.cmd

REM -------------------------------------------------------------------------------------
set step=S000
IF EXIST %temp_dir%\cnsmrdatartntndel.out for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\cnsmrdatartntndel.out`) do set step=%%a
GOTO %step%

REM *************************************************
REM  
REM *************************************************
:S000
echo S000 > %temp_dir%\cnsmrdatartntndel.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE_DEL1.btq  > %script_path%\DATA_RTNTN_RULE_DEL1.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE_DEL1.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE_DEL1.out

REM *************************************************
REM  
REM *************************************************
:S100
echo S100 > %temp_dir%\cnsmrdatartntndel.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE_DEL2.btq  > %script_path%\DATA_RTNTN_RULE_DEL2.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE_DEL2.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE_DEL2.out

REM *************************************************
REM  
REM *************************************************
:S200
echo S200 > %temp_dir%\cnsmrdatartntndel.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE_DEL3.btq  > %script_path%\DATA_RTNTN_RULE_DEL3.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE_DEL3.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE_DEL3.out

REM *************************************************
REM  
REM *************************************************
:S300
echo S300 > %temp_dir%\cnsmrdatartntndel.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE_DEL4.btq  > %script_path%\DATA_RTNTN_RULE_DEL4.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE_DEL4.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE_DEL4.out

REM *************************************************
REM  
REM *************************************************
:S400
echo S400 > %temp_dir%\cnsmrdatartntndel.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE_DEL5.btq  > %script_path%\DATA_RTNTN_RULE_DEL5.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE_DEL5.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE_DEL5.out

REM *************************************************
REM  
REM *************************************************
:S500
echo S500 > %temp_dir%\cnsmrdatartntndel.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE_DEL6.btq  > %script_path%\DATA_RTNTN_RULE_DEL6.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE_DEL6.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE_DEL6.out

REM *************************************************
REM  
REM *************************************************
:S600
echo S600 > %temp_dir%\cnsmrdatartntndel.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE_DEL7.btq  > %script_path%\DATA_RTNTN_RULE_DEL7.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE_DEL7.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE_DEL7.out


GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : %0
echo.

:End
del %temp_dir%\cnsmrdatartntndel.out

:Closeout
del %temp_dir%\cnsmrdatartntndel.out
exit %returncd%