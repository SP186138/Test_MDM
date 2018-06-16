@echo off

REM ******************************************************************************************
REM   RUN a BTEQ SCRIPT
REM   Author: Teradata
REM   Purpose: Load the SCRIPT file to Teradata
REM 	
REM   Parameters: cnsmrdatartntn 
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
IF EXIST %temp_dir%\cnsmrdatartntn.out for /f "usebackq tokens=1 delims=" %%a IN (`type %temp_dir%\cnsmrdatartntn.out`) do set step=%%a
GOTO %step%

REM *************************************************
REM  
REM *************************************************
:S000
echo S000 > %temp_dir%\cnsmrdatartntn.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE1.btq  > %script_path%\DATA_RTNTN_RULE1.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE1.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE1.out

REM *************************************************
REM  
REM *************************************************
:S100
echo S100 > %temp_dir%\cnsmrdatartntn.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE2.btq  > %script_path%\DATA_RTNTN_RULE2.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE2.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE2.out

REM *************************************************
REM  
REM *************************************************
:S200
echo S200 > %temp_dir%\cnsmrdatartntn.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE3.btq  > %script_path%\DATA_RTNTN_RULE3.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE3.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE3.out

REM *************************************************
REM  
REM *************************************************
:S300
echo S300 > %temp_dir%\cnsmrdatartntn.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE4.btq  > %script_path%\DATA_RTNTN_RULE4.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE4.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE4.out

REM *************************************************
REM  
REM *************************************************
:S400
echo S400 > %temp_dir%\cnsmrdatartntn.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE5.btq  > %script_path%\DATA_RTNTN_RULE5.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE5.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE5.out

REM *************************************************
REM  
REM *************************************************
:S500
echo S500 > %temp_dir%\cnsmrdatartntn.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE6.btq  > %script_path%\DATA_RTNTN_RULE6.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE6.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE6.out

REM *************************************************
REM  
REM *************************************************
:S600
echo S600 > %temp_dir%\cnsmrdatartntn.out
%util_dir%\ssed "s/$CNTRY/%CNTRY%/;s/$LOADID/%LOADID%/" %script_path%\DATA_RTNTN_RULE7.btq  > %script_path%\DATA_RTNTN_RULE7.out
call %exec_dir%\run_sql_tril DATA_RTNTN_RULE7.out
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\DATA_RTNTN_RULE7.out


GOTO End

:err_param
echo %0 : Parameter format not correct
echo.
echo		Usage : %0
echo.

:End
del %temp_dir%\cnsmrdatartntn.out

:Closeout
del %temp_dir%\cnsmrdatartntn.out
exit %returncd%