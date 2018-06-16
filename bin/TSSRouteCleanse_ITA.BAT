@echo off
REM TSS Route and Cleanse

echo Executing TSS Route and Cleanse

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

copy %TSS_OUTPUT%\TSS_CLEANSE_INPUT_ITA.DAT %ITA_WRK%\data\TSS_CLEANSE_INPUT_ITA.DAT

%T_SCRIPTS%\TSSItalyCleanse.cmd %ITA_WRK% > %MDM%\log\TSSRouteCleanse_ITA_new.log

set ERR=%ERRORLEVEL%
IF NOT %ERR% == 0 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_ITA_new.log
ren %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_ITA_new.LOG TSSRouteCleanse_ITA_%currentdate%_%currenttime%.LOG
exit %ERR%
)

ren %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_ITA_new.LOG TSSRouteCleanse_ITA_%currentdate%_%currenttime%.LOG

:end