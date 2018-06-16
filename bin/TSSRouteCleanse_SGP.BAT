@echo off
REM TSS Route and Cleanse

echo Executing TSS Route and Cleanse

:start
call .\mdmcustomenv-parallel.bat 

call "%PROJECTFOURD%\scripts\TSSGlobalRouter.cmd" > %MDM%\log\TSSRouteCleanse_SGP.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_SGP.log
set errorlevel=1
exit 1
)

call "%PROJECTFIVESIX%\scripts\TSSSingaporeCleanse.cmd" >> %MDM%\log\TSSRouteCleanse_SGP.log

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Cleanse >> %MDM_CUSTOM_DIR%\log\TSSRouteCleanse_SGP.log
set errorlevel=1
exit 1
)

del %MDM_INPUT%\TSS_CLEANSE_INPUT_SGP.DAT

IF ERRORLEVEL 1 (
echo Exiting due to error during TSS Route > %TS_LOGS%\TSSGlobalRouter.LOG
set errorlevel=1
exit 1
)
:end