@echo off
REM TSS Route and Cleanse

echo Executing TSS Route and Cleanse

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

copy %TSS_OUTPUT%\TSS_CLEANSE_INPUT_NOR.DAT %NOR_WRK%\data\TSS_CLEANSE_INPUT_NOR.DAT

%T_SCRIPTS%\TSSNorwayCleanse.cmd %NOR_WRK% > %MDM%\log\TSSRouteCleanse_NOR_new.log

set ERR=%ERRORLEVEL%
IF NOT %ERR% == 0 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_NOR_new.log
ren %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_NOR_new.LOG TSSRouteCleanse_NOR_%currentdate%_%currenttime%.LOG
exit %ERR%
)

ren %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_NOR_new.LOG TSSRouteCleanse_NOR_%currentdate%_%currenttime%.LOG

:end