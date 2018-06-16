@echo off
REM TSS Match

echo Executing TSS Match

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

copy %TSS_OUTPUT%\TSS_MATCH_INPUT_CRM_BEL.DAT %BEL_WRK%\data\TSS_MATCH_INPUT_CRM_BEL.DAT

%T_SCRIPTS%\TSSBelgiumMatch.cmd %BEL_WRK% > %MDM_CUSTOM_DIR%\log\TSSMatch_BELq_new.log
set ERR=%ERRORLEVEL%
IF NOT %ERR% == 0 (

echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSMatch_BELq_new.log
ren %MDM_CUSTOM_DIR%\log\TSSMatch_BELq_new.log TSSMatch_BEL_%currentdate%_%currenttime%.LOG
exit %ERR%
)

ren %MDM_CUSTOM_DIR%\log\TSSMatch_BELq_new.log TSSMatch_BEL_%currentdate%_%currenttime%.LOG

:end