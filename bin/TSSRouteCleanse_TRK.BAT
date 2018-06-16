@echo off
REM TSS Route and Cleanse

echo Executing TSS Route and Cleanse

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

copy %TSS_OUTPUT%\TSS_CLEANSE_INPUT_TRK.DAT %TRK_WRK%\data\TSS_CLEANSE_INPUT_TRK.DAT

%T_SCRIPTS%\TSSTurkeyCleanse.cmd %TRK_WRK% > %MDM%\log\TSSRouteCleanse_TRK.log

set ERR=%ERRORLEVEL%
IF NOT %ERR% == 0 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_TRK.log
ren %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_TRK.LOG TSSRouteCleanse_TRK_%currentdate%_%currenttime%.LOG
exit %ERR%
)

ren %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_TRK.LOG TSSRouteCleanse_TRK_%currentdate%_%currenttime%.LOG

:end