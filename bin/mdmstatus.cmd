@echo off
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

set cntry=%1

call .\etlenv.cmd

%util_dir%\ssed "s/$cntry/%cntry%/" %script_path%\mdmstatus.btq  > %script_path%\mdmstatus.%cntry%
call %exec_dir%\run_sql mdmstatus.%cntry%
IF NOT %LOAD_STATUS%==PASS GOTO Closeout
del %script_path%\mdmstatus.%cntry%

:Closeout
echo %time%
exit %returncd%